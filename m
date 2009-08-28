Received: from n14.bullet.mail.mud.yahoo.com ([68.142.206.41])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MguUc-0003Ch-6N
	for linux-mtd@lists.infradead.org; Fri, 28 Aug 2009 05:59:26 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [patch 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
Date: Thu, 27 Aug 2009 19:08:14 -0700
References: <200908071824.n77IONlo008375@imap1.linux-foundation.org>
	<4A7C865C.9050905@boundarydevices.com>
In-Reply-To: <4A7C865C.9050905@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200908271908.15309.david-b@pacbell.net>
Cc: s-paulraj@ti.com, linux-mtd@lists.infradead.org, nsnehaprabha@ti.com,
	akpm@linux-foundation.org, dwmw2@infradead.org, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 07 August 2009, Troy Kisky wrote:
> > +static struct nand_ecclayout hwecc4_2048 __initconst = {
> > +     ...
> > +     .oobfree = {
> > +             /* 1 byte at offset 0 holds manufacturer badblock marker */
> > +             {.offset = 1, .length = 23, },
> 
> I thought Sneha Narnakaje was going to change offset = 2, length = 22 ?

Not clear why; this is only for 8-bit NAND, which (right?)
only uses single byte manufacturer badblock markers ...

Will a TI person be updating U-Boot?   Please?  :)
During the U-Boot v2009.10 window, which opens up 
in a couple days...

- Dave
