Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDBY3-0007mD-4S
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 08:17:07 +0000
Received: by eyh6 with SMTP id 6so140324eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Apr 2011 01:17:05 -0700 (PDT)
Subject: Re: bbt and bitflip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4DB06693.5000100@parrot.com>
References: <4DB033E4.6030105@parrot.com>  <4DB06693.5000100@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Apr 2011 11:14:09 +0300
Message-ID: <1303460049.2757.47.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-04-21 at 19:17 +0200, Matthieu CASTET wrote:
> 			}
> +			if (res != -EUCLEAN) {
> +				printk(KERN_INFO "nand_bbt: Error reading bad block table2\n");
> +				return res;
> +			}

Just a side note:

I tend to think that we need to veto all mtd patches which touch/add
prints and force people to first turn all the ugly MTD printing mess
into dev_dbg/dev_err/etc messages... But I cannot actually propose it
before I clean up UBI/UBIFS in this respect :-)))

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
