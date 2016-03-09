Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adkxp-0001PJ-Gf
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 20:44:15 +0000
Date: Wed, 9 Mar 2016 21:43:48 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 matthias.bgg@gmail.com, robh@kernel.org, daniel.thompson@linaro.org,
 xiaolei.li@mediatek.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Message-ID: <20160309214348.5aa78af5@bbrezillon>
In-Reply-To: <56E08112.7040201@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon> <56E08112.7040201@linaro.org>
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

On Wed, 9 Mar 2016 15:01:22 -0500
Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:

> On 03/08/2016 11:24 AM, Boris Brezillon wrote:
> >> +	switch (mtd->writesize) {
> >> > +	case KB(2):
> >> > +		fmt = PAGEFMT_512_2K;
> >> > +		chip->ecc.layout = &nand_2k_64;
> >> > +		break;
> >> > +	case KB(4):
> >> > +		fmt = PAGEFMT_2K_4K;
> >> > +		chip->ecc.layout = &nand_4k_128;
> >> > +		break;
> >> > +	case KB(8):
> >> > +		fmt = PAGEFMT_4K_8K;
> >> > +		break;
> >> > +	default:
> >> > +		dev_err(dev, "invalid page size: %d\n", mtd->writesize);
> >> > +		return -EINVAL;
> >> > +	}
> > ecclayout info should be exposed through mtd_ooblayout_ops now.
> >
> 
> do you have an approximate date for when this interface will be merged in
> git://git.infradead.org/l2-mtd.git?
> 

Should be ready for 4.7, in the meantime you can base your work on my
branch [1] (which is based on l2-mtd/master).

[1]https://github.com/bbrezillon/linux-0day/tree/nand/ecclayout


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
