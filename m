Received: from web13908.mail.yahoo.com ([216.136.175.71])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Colv-0004ox-Al
	for <linux-mtd@lists.infradead.org>; Mon, 05 May 2003 23:49:23 +0100
Message-ID: <20030505224936.32155.qmail@web13908.mail.yahoo.com>
Date: Mon, 5 May 2003 15:49:36 -0700 (PDT)
From: Michael Moedt <xemc@yahoo.com>
To: Thayne Harbaugh <tharbaugh@lnxi.com>
In-Reply-To: <1052168461.1171.11504.camel@tubarao>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: Error: Wacky! Unable to decode failure status
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Thayne Harbaugh <tharbaugh@lnxi.com> wrote:
> I have no explanation as to how that happened - the
> patch worked just
> fine when I didn't try to compile it 8-)
> 
> Once I get around to doing some local testing and
> _really_compiling_it_,
> I'll commit it to CVS.
> 
> -- 
> Thayne Harbaugh
> Linux Networx
> 

I hope you don't mind my fooling, but I've modified
the patch yet again, to use if-then blocks instead of
a switch. (I've heard it's better for removing code at
compile-time.)

Also, it complained to me about CFIDEV_BUSWIDTH_8
being undeclared, which matches the behavior in
include/linux/mtd/cfi.h, when the geometry option
isn't enabled.  I put in something in for this as
well.  Could you look over my changes?

Thanks again,

Mike


Here's that patch:
(You'll have to correct for the altering that yahoo
mail does to the text.  I can't use my normal outgoing
email server because it fights with infradead's.)


--- cfi_cmdset_0002.c	2003-04-22 17:00:06.000000000
-0500
+++ cfi_cmdset_0002.c_patched	2003-05-05
17:34:23.000000000 -0500
@@ -811,7 +811,11 @@ static inline int
do_erase_chip(struct m
         DECLARE_WAITQUEUE(wait, current);
         int ret = 0;
         int ta = 0;
+#ifdef CFIDEV_BUSWIDTH_8
+        __u64 ones = 0;
+#else
         __u32 ones = 0;
+#endif
 
  retry:
         cfi_spin_lock(chip->mutex);
@@ -925,7 +929,23 @@ static inline int
do_erase_chip(struct m
         DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check
0x%.8x 0x%.8x\n",
                __func__, oldstatus, status );
 
-        ones = CMD( (__u8)~0 );
+        /* Determine the data that we read back on a
successful erase */
+        /* This depends on the bus-width of the chip
in question.     */
+        if ( CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_1 ) {
+                ones =  (__u8)~0;
+        } else if ( CFIDEV_BUSWIDTH ==
CFIDEV_BUSWIDTH_2 ) {
+                ones = (__u16)~0;
+        } else if ( CFIDEV_BUSWIDTH ==
CFIDEV_BUSWIDTH_4 ) {
+                ones = (__u32)~0;
+#ifdef CFIDEV_BUSWIDTH_8   /* this is not always
defined.. see cfi.h */
+        } else if ( CFIDEV_BUSWIDTH ==
CFIDEV_BUSWIDTH_8 ) {
+                ones = (__u64)~0;
+#endif
+        } else {
+                printk(KERN_WARNING "Unsupported
buswidth\n");
+                goto erase_failed;
+        }
+        ones = CMD( ones );
         
         if ( oldstatus == ones && status == ones ) {
                 /* success - do nothing */
@@ -981,7 +1001,11 @@ static inline int
do_erase_oneblock(stru
         DECLARE_WAITQUEUE(wait, current);
         int ret = 0;
         int ta = 0;
+#ifdef CFIDEV_BUSWIDTH_8
+        __u64 ones = 0;
+#else
         __u32 ones = 0;
+#endif
 
  retry:
         cfi_spin_lock(chip->mutex);
@@ -1095,7 +1119,23 @@ static inline int
do_erase_oneblock(stru
         DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): Check
0x%.8x 0x%.8x\n",
                __func__, oldstatus, status );
 
-        ones = CMD( (__u8)~0 );
+        /* Determine the data that we read back on a
successful erase */
+        /* This depends on the bus-width of the chip
in question.     */
+        if ( CFIDEV_BUSWIDTH == CFIDEV_BUSWIDTH_1 ) {
+                ones =  (__u8)~0;
+        } else if ( CFIDEV_BUSWIDTH ==
CFIDEV_BUSWIDTH_2 ) {
+                ones = (__u16)~0;
+        } else if ( CFIDEV_BUSWIDTH ==
CFIDEV_BUSWIDTH_4 ) {
+                ones = (__u32)~0;
+#ifdef CFIDEV_BUSWIDTH_8   /* this is not always
defined.. see cfi.h */
+        } else if ( CFIDEV_BUSWIDTH ==
CFIDEV_BUSWIDTH_8 ) {
+                ones = (__u64)~0;
+#endif
+        } else {
+                printk(KERN_WARNING "Unsupported
buswidth\n");
+                goto erase_failed;
+        }
+        ones = CMD( ones );
 
         if ( oldstatus == ones && status == ones ) {
                 /* success - do nothing */




__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com
