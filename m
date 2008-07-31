Received: from smtp116.sbc.mail.sp1.yahoo.com ([69.147.64.89])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KOQQT-0006aU-0D
	for linux-mtd@lists.infradead.org; Thu, 31 Jul 2008 05:10:09 +0000
From: David Brownell <david-b@pacbell.net>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [patch 02/13] jffs2 summary allocation: don't use vmalloc()
Date: Wed, 30 Jul 2008 22:10:00 -0700
References: <200807301934.m6UJYvtA012276@imap1.linux-foundation.org>
	<20080730223924.3C51136129C@adsl-69-226-248-13.dsl.pltn13.pacbell.net>
	<20080730154618.65a25c67.akpm@linux-foundation.org>
In-Reply-To: <20080730154618.65a25c67.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200807302210.00307.david-b@pacbell.net>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: trimarchimichael@yahoo.it, dwmw2@infradead.org, jwboyer@gmail.com,
	linux-mtd@lists.infradead.org, rmk@arm.linux.org.uk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 July 2008, Andrew Morton wrote:
> On Wed, 30 Jul 2008 15:39:24 -0700
> David Brownell <david-b@pacbell.net> wrote:
> 
> > I'm still asking whether MTD folk have any plans to make that stack DMA-safe...
> > more than just the SPI flash drivers (mtd_dataflash, m25p80) could benefit
> > from DMA support, so I'd hope it's at least being considered.
> > 
> > If the answer is "no" then (a) the MTD interface specs need to finally say
> > they pass DMA-unsafe addresses, and (b) those SPI flash drivers are going
> > to need updates.
> 
> Well yes.  It's been four months since this bug (it goes oops!) was
> reported and afaik there's been no discussion or consideration or
> anything else.

Well, the appended is at least starting to address (a) ... under the
assumption the MTD folk aren't making the stack more DMA-friendly.
Presumably the same thing should be true of panic_write(), the OOB
operations (for NAND), and the OTP operations.

I actually think it makes the most technical sense to make the MTD
stack talk to its low level drivers the way most code seems to:
only pass DMA-safe buffers.


> I don't know how much of a problem this bug is in the real world, but
> it's taking an awful long time to get fixed?

I'm not keen on spending time on a "fix" that both worsens performance
and is also wrong ... which is why I've asked the broader question about
the MTD stack and DMA.  It's taking a long time to get an answer to what
should be a simple question...

That, and the fact that the board I have two types of SPI flash hooked up
to currently has a misbehaving SPI driver, which I think someone (else)
is going to be fixing soon.  So testing such changes is impractical, even
if I assume the MTD stack is unlkely to change...

Not all the SPI controllers use DMA, so only some boards suffer from
this problem in any case.

- Dave


---
 include/linux/mtd/mtd.h |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

--- a/include/linux/mtd/mtd.h	2008-07-30 20:46:02.000000000 -0700
+++ b/include/linux/mtd/mtd.h	2008-07-30 21:20:37.000000000 -0700
@@ -149,8 +149,14 @@ struct mtd_info {
 	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
 
 
-	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
-	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
+	/*
+	 * Read/write operations are given *VIRTUAL* addresses, which
+	 * must not be passed as-is to dma mapping operations.
+	 */
+	int (*read) (struct mtd_info *mtd, loff_t from,
+			size_t len, size_t *retlen, u_char *virt);
+	int (*write) (struct mtd_info *mtd, loff_t to,
+			size_t len, size_t *retlen, const u_char *virt);
 
 	/* In blackbox flight recorder like scenarios we want to make successful
 	   writes in interrupt context. panic_write() is only intended to be
