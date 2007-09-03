Received: from nwd2mail10.analog.com ([137.71.25.55])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISFoN-0003Mj-MP
	for linux-mtd@lists.infradead.org; Mon, 03 Sep 2007 13:34:12 -0400
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
From: Bryan Wu <bryan.wu@analog.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1188837990.6075.32.camel@shinybook.infradead.org>
References: <1188804323.29566.6.camel@roc-laptop>
	<1188837990.6075.32.camel@shinybook.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 04 Sep 2007 01:33:49 +0800
Message-Id: <1188840829.9063.10.camel@roc-laptop>
Mime-Version: 1.0
Cc: bryan.wu@analog.com, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Reply-To: bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-09-03 at 17:46 +0100, David Woodhouse wrote:
> On Mon, 2007-09-03 at 15:25 +0800, Bryan Wu wrote:
> > +       if (hardware_ecc) {
> > +               if (plat->page_size == NFC_PG_SIZE_256) {
> > +                       chip->ecc.bytes = 3;
> > +                       chip->ecc.size = 256;
> > +               } else if (mtd->writesize == NFC_PG_SIZE_512) { 
> 
> Comparing against plat->page_size in one case, but mtd->writesize in the
> other? 

This is a typo in development. I will fix it ASAP. -:)

> And elsewhere it seems plat->page_size is treated as a boolean,
> indicating only 256-byte vs. 512-byte pages (you don't support 2KiB or
> other page sizes at all?)
> 

When enabled hardware ECC, NFC of BF54x supports 256 and 512 bytes page
size ECC.
it's maybe little confusing with the NAND chip's pagesize. When NAND
chip is 2KiB or other page size, this driver can use multiple 256/512
pages to do hardware ECC. And it's handled by the driver software here.

-Bryan Wu
