Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K3aGt-0004R2-9A
	for linux-mtd@lists.infradead.org; Tue, 03 Jun 2008 17:26:07 +0000
Date: Tue, 3 Jun 2008 19:25:56 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 1/3] NAND multiple plane feature
Message-ID: <20080603172556.GB1224@logfs.org>
References: <alpine.LFD.1.10.0805281332280.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.1.10.0805281332280.23606@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 May 2008 13:41:46 +0100, Alexey Korolev wrote:
> diff -Nurp linux-2.6.24.3/drivers/mtd/nand/nand_base.c linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c
> --- linux-2.6.24.3/drivers/mtd/nand/nand_base.c	2008-02-26 03:20:20.000000000 +0300
> +++ linux-2.6.24.3-dp/drivers/mtd/nand/nand_base.c	2008-05-28 02:06:01.000000000 +0400
> @@ -2259,10 +2367,15 @@ static struct nand_flash_dev *nand_get_f
>  	/* Newer devices have all the information in additional id bytes */
>  	if (!type->pagesize) {
>  		int extid;
> +		int planeid;
>  		/* The 3rd id byte holds MLC / multichip data */
>  		chip->cellinfo = chip->read_byte(mtd);
>  		/* The 4th id byte is the important one */
>  		extid = chip->read_byte(mtd);
> +		/* The 5th id byte contains number of planes */
> +		planeid = chip->read_byte(mtd);
> +		/* Number of planes*/

This comment seems redundant.  And it fooled me for a few seconds.
Remove it?

> +		chip->numplanes = 1 << ((planeid >> 2) & 0x03);
>  		/* Calc pagesize */
>  		mtd->writesize = 1024 << (extid & 0x3);
>  		extid >>= 2;

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
