Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dlU8j-0003yN-1W
 for linux-mtd@lists.infradead.org; Sat, 26 Aug 2017 06:00:17 +0000
Date: Sat, 26 Aug 2017 07:59:38 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, Richard Weinberger
 <richard@nod.at>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v6] mtd: sharpslpart: Add sharpslpart partition parser
Message-ID: <20170826075938.5a9b861d@bbrezillon>
In-Reply-To: <20170825001129.091badb4@bbrezillon>
References: <1503394972-12541-1-git-send-email-andrea.adami@gmail.com>
 <20170825001129.091badb4@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 Aug 2017 00:11:29 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:


> > +/*
> > + * The logical block number assigned to a physical block is stored in the OOB
> > + * of the first page, in 3 16-bit copies with the following layout:
> > + *
> > + * 01234567 89abcdef
> > + * -------- --------
> > + * ECC BB   xyxyxy
> > + *
> > + * When reading we check that the first two copies agree.
> > + * In case of error, matching is tried using the following pairs.
> > + * Reserved values 0xffff mean the block is kept for wear leveling.
> > + *
> > + * 01234567 89abcdef
> > + * -------- --------
> > + * ECC BB   xyxy    oob[8]==oob[10] && oob[9]==oob[11]   -> byte0=8   byte1=9
> > + * ECC BB     xyxy  oob[10]==oob[12] && oob[11]==oob[13] -> byte0=10  byte1=11
> > + * ECC BB   xy  xy  oob[12]==oob[8] && oob[13]==oob[9]   -> byte0=12  byte1=13  
> 
> I know there's a depends on "MTD_NAND_SHARPSL || MTD_NAND_TMIO" in the
> Kconfig entry, but one could enable those options just to use the sharpsl
> part parser even if the OOB layout is incompatible with the sharpsl FTL.
> 
> I'd recommend that you check that OOB bytes 8 to 15 are actually free
> to be used by the MTD user in sharpsl_parse_mtd_partitions().
> 
> Can be done with something like that:
> 
> static int sharpsl_nand_check_ooblayout(struct mtd_info *mtd)
> {
> 	u8 freebytes = 0;
> 	int section = 0;
> 
> 	while (true) {
> 		struct mtd_oob_region oobfree = { };
> 		int ret, i;
> 
> 		ret = mtd_ooblayout_free(mtd, section++, &oobfree);
> 		if (ret)
> 			break;
> 
> 		if (!oobfree.length || oobfree.offset > 15 ||
> 		    (oobfree.offset + oobfree.length) < 8)
> 			continue;
> 
> 		i = oobfree.offset >= 8 ? : 8;

As you reported on IRC there's an mistake here, it should be:

		i = oobfree.offset >= 8 ? oobfree.offset : 8

> 		for (; i < oobfree.offset + oobfree.length && i < 16; i++)
> 			freebytes |= BIT(i - 8);
> 
> 		if (freebytes == 0xff)
> 			return 0;
> 	}
> 
> 	return -ENOTSUPP;
> }
