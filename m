Received: from smtp123.sbc.mail.sp1.yahoo.com ([69.147.64.96])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOS6m-0005Y4-1O
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 06:57:56 +0000
From: David Brownell <david-b@pacbell.net>
To: dedekind@infradead.org
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
Date: Wed, 30 Jul 2008 23:57:52 -0700
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<200807302210.00307.david-b@pacbell.net>
	<1217482661.9048.74.camel@sauron>
In-Reply-To: <1217482661.9048.74.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200807302357.53204.david-b@pacbell.net>
Cc: linux-mtd@lists.infradead.org, trimarchimichael@yahoo.it,
	Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org,
	jwboyer@gmail.com, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 July 2008, Artem Bityutskiy wrote:
> Can SPI driver detect if the memory was kmalloc()'ed or vmalloc()'ed?

The general driver policy is to use one or the other and never mix
them.  Pretty much like always calling with a lock held, or never;
or always calling in contexts that can sleep, etc.  (kmalloc and
siblings being an exception, with gfp_t.)

For clarity:  the stack in question is like

	jffs2, ubifs, etc
	mtd_dataflash or m25p80
	spi_master (generally SOC-specific) sometimes using DMA
	... talking to flash chip using 4 wire signaling ...

Inputs to the SPI stack are required to be DMA-safe -- vmalloc bad.
Not all the SPI controllers support DMA either.

Inputs to the MTD layer have previously been unspecified, but now seem
to be assumed to be DMA-unsafe -- vmalloc ok.


> Or if not, we could add one more argument to read()/write() which tells
> whether the memory is contiguous or not. Then the driver would chose how
> to deal with the buffer.

Is updating all the MTD users in such a way a real possibility?

- Dave
 
