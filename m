Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17N9Vu-0001nD-00
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 10:55:02 +0100
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id LAA05570
	for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2002 11:54:40 +0200
Date: Wed, 26 Jun 2002 11:55:01 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: 64 bit problem in fs/jffs2/wbuf.c
Message-ID: <20020626115501.A25628@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

I've tripped into a strange problem while modifying the jffs2 nand
support for nor flashes with ecc checking.

The problem appears to be that jffs2_flash_writev defines the
parameter "to" to be loff_t, which is 64 bit (at least on ppc). Only
the lower 32 bit appear to be used and the upper should be all zeros.
But I have one occasion, where the high bits contain 0xc02fdd18, which
causes a sanity check in wbuf.c, line 347 to fail.

A straightforward fix appears to be a cast, the patch is appended.
The high bits should not contain any junk in the first place, but at
least, this ignores them in this position.

Thomas or David, is this a really stupid idea or can I search for
further bugs elsewhere?

Joern

--- wbuf.c	Wed Jun 19 18:56:26 2002
+++ wbuf.c.new	Wed Jun 26 11:27:27 2002
@@ -234,7 +234,7 @@
 		c->wbuf_len = PAGE_MOD(to);			
 	} 
 
-	if (to != PAD(c->wbuf_ofs + c->wbuf_len)) {
+	if ((unsigned long)to != PAD(c->wbuf_ofs + c->wbuf_len)) {
 		/* We're not writing immediately after the writebuffer. Bad. */
 		printk(KERN_CRIT "jffs2_flash_writev(): Non-contiguous write to %08lx\n", (unsigned long)to);
 		if (c->wbuf_len)
