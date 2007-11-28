Received: from s200aog12.obsmtp.com ([207.126.144.126])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IxIRJ-0005mk-K3
	for linux-mtd@lists.infradead.org; Wed, 28 Nov 2007 08:38:46 +0000
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62BDEDB82
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Nov 2007 08:38:34 +0000 (GMT)
Received: from mail1.nap.st.com (mail1.nap.st.com [10.150.200.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D001F4BDAB
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Nov 2007 08:38:33 +0000 (GMT)
From: Massimo CIRILLO <massimo.cirillo@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: RE: Re: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21 kernel)
	(Jared Hulbert)
Date: Wed, 28 Nov 2007 09:38:33 +0100
Message-ID: <000c01c8319a$0fdd11d0$7205960a@nap.st.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <mailman.247.1196162712.1424.linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>What was the test setup that uncovered this?  I surprised this wasn't
>found earlier.

The tests are ftest01/05 of LTP20060515 test suite. The test were made on:
-) OMAP5912 processor (192MHz ARM, 192MHz DSP)
-) uboot 1.1.4
-) linux kernel 2.6.21
-) storage flash device: STM M58PR512J (512Mbit, Multi-Level, Burst@48MHz) 
-) Flash memory space mapped to processor Dcache (by means of
ioremap_cached() function)

>If cmd_adr <= adr then shouldn't initial_len >=len?  Something like:
>initial_len = (len + wbufsize) & ~(wbufsize-1);

We think it is better to invalidate only the address range interested by
buffer program as 
in the patch posted to reply to Jorn Engel.

Signed-off-by: Massimo Cirillo (<massimo.cirillo@st.com>) and Giuseppe
D'Eliseo (<giuseppe.deliseo@st.com>)

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org
[mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of
linux-mtd-request@lists.infradead.org
Sent: Tuesday, November 27, 2007 12:25 PM
To: linux-mtd@lists.infradead.org
Subject: linux-mtd Digest, Vol 56, Issue 40

Send linux-mtd mailing list submissions to
	linux-mtd@lists.infradead.org

To subscribe or unsubscribe via the World Wide Web, visit
	http://lists.infradead.org/mailman/listinfo/linux-mtd
or, via email, send a message with subject or body 'help' to
	linux-mtd-request@lists.infradead.org

You can reach the person managing the list at
	linux-mtd-owner@lists.infradead.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of linux-mtd digest..."


Today's Topics:

   1. Wrong cache invalidation in cfi_cmdset0001.c (2.6.21 kernel)
      (Massimo CIRILLO)
   2. [PATCH][MTD] Fix incorrect interface code for x16/x32 chips
      (Bartlomiej Sieka)
   3. Re: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21
      kernel) (J?rn Engel)
   4. Re: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21
      kernel) (Jared Hulbert)
   5. [PATCH] Tons of bogus warning messages on attmpt to mount on
      M18 (Alexey Korolev)
   6. [RFC][PATCH][JFFS2] JFFS2 support for NOP 1 (Kyungmin Park)
   7. Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1 (J?rn Engel)
   8. Re: [PATCH] Tons of bogus warning messages on attmpt to mount
      on M18 (Alexey Korolev)


----------------------------------------------------------------------

Message: 1
Date: Mon, 26 Nov 2007 18:23:09 +0100
From: Massimo CIRILLO <massimo.cirillo@st.com>
Subject: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21 kernel)
To: <linux-mtd@lists.infradead.org>
Message-ID: <000a01c83051$03c9a510$7205960a@nap.st.com>
Content-Type: text/plain;	charset="utf-8"


We found an issue in cfi_cmdset0001.c file of 2.6.21 kernel.
It is related to cache region invalidation in the buffered
write procedure.

The original code performs cache invalidation from "adr" to "adr + len" in
do_write_buffer() while we modify region from "cmd_adr" to "len2" 
where len2 is equal to initial value of len.

The following is the patch to apply for 2.6.21 kernel.

--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26
18:06:37.000000000 +0100
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26
18:06:44.000000000 +0100
@@ -1472,6 +1472,7 @@ static int __xipram do_write_buffer(stru
 	int ret, wbufsize, word_gap, words;
 	const struct kvec *vec;
 	unsigned long vec_seek;
+	int len2=len;
 
 	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
 	adr += chip->start;
@@ -1578,7 +1579,7 @@ static int __xipram do_write_buffer(stru
 	chip->state = FL_WRITING;
 
 	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
-				   adr, len,
+				   cmd_adr, len2,
 				   chip->buffer_write_time);
 	if (ret) {
 		map_write(map, CMD(0x70), cmd_adr);

In any case we believe this patch should be valid also for the 2.6.22 and
2.6.23 kernel.

Looking forward feedbacks.





------------------------------

Message: 2
Date: Mon, 26 Nov 2007 18:55:18 +0100
From: Bartlomiej Sieka <tur@semihalf.com>
Subject: [PATCH][MTD] Fix incorrect interface code for x16/x32 chips
To: linux-mtd@lists.infradead.org
Message-ID: <20071126175517.GA1221@frozen.semihalf.com>
Content-Type: text/plain; charset=us-ascii

According to "Common Flash Memory Interface Publication 100" dated December
1,
2001, the interface code for x16/x32 chips is 0x0005, and not 0x0004 used so
far.

Signed-off-by: Bartlomiej Sieka <tur@semihalf.com>
---
diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
b/drivers/mtd/chips/cfi_cmdset_0002.c
index 389acc6..93ec811 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -338,10 +338,12 @@ struct mtd_info *cfi_cmdset_0002(struct map_info *map,
int primary)
 		/* Modify the unlock address if we are in compatibility mode
*/
 		if (	/* x16 in x8 mode */
 			((cfi->device_type == CFI_DEVICETYPE_X8) &&
-				(cfi->cfiq->InterfaceDesc == 2)) ||
+				(cfi->cfiq->InterfaceDesc ==
+					CFI_INTERFACE_X8_BY_X16_ASYNC)) ||
 			/* x32 in x16 mode */
 			((cfi->device_type == CFI_DEVICETYPE_X16) &&
-				(cfi->cfiq->InterfaceDesc == 4)))
+				(cfi->cfiq->InterfaceDesc ==
+					CFI_INTERFACE_X16_BY_X32_ASYNC)))
 		{
 			cfi->addr_unlock1 = 0xaaa;
 			cfi->addr_unlock2 = 0x555;
diff --git a/drivers/mtd/chips/cfi_probe.c b/drivers/mtd/chips/cfi_probe.c
index 60e11a0..f651b6e 100644
--- a/drivers/mtd/chips/cfi_probe.c
+++ b/drivers/mtd/chips/cfi_probe.c
@@ -370,27 +370,27 @@ static void print_cfi_ident(struct cfi_ident *cfip)
 	printk("Device size: 0x%X bytes (%d MiB)\n", 1 << cfip->DevSize, 1<<
(cfip->DevSize - 20));
 	printk("Flash Device Interface description: 0x%4.4X\n",
cfip->InterfaceDesc);
 	switch(cfip->InterfaceDesc) {
-	case 0:
+	case CFI_INTERFACE_X8_ASYNC:
 		printk("  - x8-only asynchronous interface\n");
 		break;
 
-	case 1:
+	case CFI_INTERFACE_X16_ASYNC:
 		printk("  - x16-only asynchronous interface\n");
 		break;
 
-	case 2:
+	case CFI_INTERFACE_X8_BY_X16_ASYNC:
 		printk("  - supports x8 and x16 via BYTE# with asynchronous
interface\n");
 		break;
 
-	case 3:
+	case CFI_INTERFACE_X32_ASYNC:
 		printk("  - x32-only asynchronous interface\n");
 		break;
 
-	case 4:
+	case CFI_INTERFACE_X16_BY_X32_ASYNC:
 		printk("  - supports x16 and x32 via Word# with asynchronous
interface\n");
 		break;
 
-	case 65535:
+	case CFI_INTERFACE_NOT_ALLOWED:
 		printk("  - Not Allowed / Reserved\n");
 		break;
 
diff --git a/drivers/mtd/maps/scb2_flash.c b/drivers/mtd/maps/scb2_flash.c
index dcfb858..0fc5584 100644
--- a/drivers/mtd/maps/scb2_flash.c
+++ b/drivers/mtd/maps/scb2_flash.c
@@ -79,7 +79,7 @@ scb2_fixup_mtd(struct mtd_info *mtd)
 	struct cfi_private *cfi = map->fldrv_priv;
 
 	/* barf if this doesn't look right */
-	if (cfi->cfiq->InterfaceDesc != 1) {
+	if (cfi->cfiq->InterfaceDesc != CFI_INTERFACE_X16_ASYNC) {
 		printk(KERN_ERR MODNAME ": unsupported InterfaceDesc:
%#x\n",
 		    cfi->cfiq->InterfaceDesc);
 		return -1;
diff --git a/include/linux/mtd/cfi.h b/include/linux/mtd/cfi.h
index e17c534..b0ddf4b 100644
--- a/include/linux/mtd/cfi.h
+++ b/include/linux/mtd/cfi.h
@@ -98,6 +98,18 @@ static inline int cfi_interleave_supported(int i)
 #define CFI_DEVICETYPE_X32 (32 / 8)
 #define CFI_DEVICETYPE_X64 (64 / 8)
 
+
+/* Device Interface Code Assignments from the "Common Flash Memory
Interface
+ * Publication 100" dated December 1, 2001.
+ */
+#define CFI_INTERFACE_X8_ASYNC		0x0000
+#define CFI_INTERFACE_X16_ASYNC		0x0001
+#define CFI_INTERFACE_X8_BY_X16_ASYNC	0x0002
+#define CFI_INTERFACE_X32_ASYNC		0x0003
+#define CFI_INTERFACE_X16_BY_X32_ASYNC	0x0005
+#define CFI_INTERFACE_NOT_ALLOWED	0xffff
+
+
 /* NB: We keep these structures in memory in HOST byteorder, except
  * where individually noted.
  */



------------------------------

Message: 3
Date: Mon, 26 Nov 2007 18:45:33 +0100
From: J?rn Engel <joern@logfs.org>
Subject: Re: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21
	kernel)
To: Massimo CIRILLO <massimo.cirillo@st.com>
Cc: linux-mtd@lists.infradead.org
Message-ID: <20071126174533.GA22844@lazybastard.org>
Content-Type: text/plain; charset=utf-8

On Mon, 26 November 2007 18:23:09 +0100, Massimo CIRILLO wrote:
> 
> We found an issue in cfi_cmdset0001.c file of 2.6.21 kernel.
> It is related to cache region invalidation in the buffered
> write procedure.
> 
> The original code performs cache invalidation from "adr" to "adr + len" in
> do_write_buffer() while we modify region from "cmd_adr" to "len2" 
> where len2 is equal to initial value of len.

Could use a better name, initial_len or something like that.  And David
would surely appreciate a Signed-off-by: line.  Otherwise appears to
make sense.

> The following is the patch to apply for 2.6.21 kernel.
> 
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26
18:06:37.000000000 +0100
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-26
18:06:44.000000000 +0100
> @@ -1472,6 +1472,7 @@ static int __xipram do_write_buffer(stru
>  	int ret, wbufsize, word_gap, words;
>  	const struct kvec *vec;
>  	unsigned long vec_seek;
> +	int len2=len;
>  
>  	wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
>  	adr += chip->start;
> @@ -1578,7 +1579,7 @@ static int __xipram do_write_buffer(stru
>  	chip->state = FL_WRITING;
>  
>  	ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
> -				   adr, len,
> +				   cmd_adr, len2,
>  				   chip->buffer_write_time);
>  	if (ret) {
>  		map_write(map, CMD(0x70), cmd_adr);
> 

J?rn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens



------------------------------

Message: 4
Date: Mon, 26 Nov 2007 10:36:08 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
Subject: Re: Wrong cache invalidation in cfi_cmdset0001.c (2.6.21
	kernel)
To: " J?rn Engel " <joern@logfs.org>
Cc: Massimo CIRILLO <massimo.cirillo@st.com>,
	linux-mtd@lists.infradead.org,	akorolev@infradead.org
Message-ID:
	<6934efce0711261036t3c04cf92xe933878742316624@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1

> > We found an issue in cfi_cmdset0001.c file of 2.6.21 kernel.
> > It is related to cache region invalidation in the buffered
> > write procedure.

What was the test setup that uncovered this?  I surprised this wasn't
found earlier.

> > The original code performs cache invalidation from "adr" to "adr + len"
in
> > do_write_buffer() while we modify region from "cmd_adr" to "len2"
> > where len2 is equal to initial value of len.
>
> Could use a better name, initial_len or something like that.  And David
> would surely appreciate a Signed-off-by: line.  Otherwise appears to
> make sense.
>
> > The following is the patch to apply for 2.6.21 kernel.
> >
> > --- a/drivers/mtd/chips/cfi_cmdset_0001.c     2007-11-26
18:06:37.000000000 +0100
> > +++ b/drivers/mtd/chips/cfi_cmdset_0001.c     2007-11-26
18:06:44.000000000 +0100
> > @@ -1472,6 +1472,7 @@ static int __xipram do_write_buffer(stru
> >       int ret, wbufsize, word_gap, words;
> >       const struct kvec *vec;
> >       unsigned long vec_seek;
> > +     int len2=len;
> >
> >       wbufsize = cfi_interleave(cfi) << cfi->cfiq->MaxBufWriteSize;
> >       adr += chip->start;
> > @@ -1578,7 +1579,7 @@ static int __xipram do_write_buffer(stru
> >       chip->state = FL_WRITING;
> >
> >       ret = INVAL_CACHE_AND_WAIT(map, chip, cmd_adr,
> > -                                adr, len,
> > +                                cmd_adr, len2,
> >                                  chip->buffer_write_time);
> >       if (ret) {
> >               map_write(map, CMD(0x70), cmd_adr);
> >

If cmd_adr <= adr then shouldn't initial_len >=len?  Something like:

initial_len = (len + wbufsize) & ~(wbufsize-1);



------------------------------

Message: 5
Date: Mon, 26 Nov 2007 19:04:19 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
Subject: [PATCH] Tons of bogus warning messages on attmpt to mount on
	M18
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org
Message-ID:
	<Pine.LNX.4.64.0711261847330.24808@pentafluge.infradead.org>
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi

We faced a lot of warning messages if to mount jffs2 on image generated by
mkfs utility.

Warning messages are these:
JFFS2 warning: (696) check_node_data: MTD point returned len too short: 1112
inst
ead of 1816.
JFFS2 warning: (696) check_node_data: MTD point returned len too short: 1276
inst
ead of 2156.
JFFS2 warning: (696) check_node_data: MTD point returned len too short: 1098
inst
ead of 1746.
And many many more.

This patch fixes the issue of warning messages on M18 (Sibley).

Signed-off-by: Alexey Korolev <akorolev@infradead.org>
---------------
diff -aur a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
--- a/fs/jffs2/readinode.c      2007-11-26 21:42:22.000000000 +0300
+++ b/fs/jffs2/readinode.c      2007-11-26 21:39:33.000000000 +0300
@@ -64,7 +64,7 @@
         * adding and jffs2_flash_read_end() interface. */
        if (c->mtd->point) {
                err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
-               if (!err && retlen < tn->csize) {
+               if (!err && retlen < len) {
                        JFFS2_WARNING("MTD point returned len too short: %zu
instead of %u.\n", retlen, tn->csize);
                        c->mtd->unpoint(c->mtd, buffer, ofs, len);
                } else if (err)
-----------------

Thanks,
Alexey

p/s The patch has been verified several times. It is applicable and it
shouldn't break anything.




------------------------------

Message: 6
Date: Tue, 27 Nov 2007 16:36:16 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org
Message-ID: <20071127073616.GA22556@party>
Content-Type: text/plain; charset=us-ascii

Hi,

It's the preparation patch for the MLC NAND/OneNAND flash.
The current jffs2 implementation at NAND case uses the NOP 2, cleanmarker
and data each page 0. It breaks the NOP 1 limitation in MLC flash.

With this patch, we don't write the cleanmarker at oob area.
I'm not sure it should use the cleanmarker at data area as NOR does.
Apart from the cleanmarker, there's serious POR issue, paired page at MLC.

The paired page problem is that if the some page is broken, the paired page
is also broken even though it is written correctly at previous time.
That's the reason the cleanmarker is not big issue at this time.

Now we support the NOP 1 and later we have to address this paired page
issue. I'm not sure when this problem is addressed.

Any comments are welcome.

Thank you,
Kyungmin Park

P.S., you can check the NOP 1 easily, just
s/MTD_CAP_NANDFLASH/MTD_CAP_MLC_NANDFLASH/ .
---
diff --git a/fs/jffs2/erase.c b/fs/jffs2/erase.c
index a1db918..65d7dd7 100644
--- a/fs/jffs2/erase.c
+++ b/fs/jffs2/erase.c
@@ -415,6 +415,7 @@ static void jffs2_mark_erased_block(struct jffs2_sb_info
*c, struct jffs2_eraseb
 	/* Cleanmarker in oob area or no cleanmarker at all ? */
 	if (jffs2_cleanmarker_oob(c) || c->cleanmarker_size == 0) {
 
+		/* We only write cleanmarker in case of SLC NAND */
 		if (jffs2_cleanmarker_oob(c)) {
 			if (jffs2_write_nand_cleanmarker(c, jeb))
 				goto filebad;
diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index ee192af..aa18eea 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -656,7 +656,9 @@ void jffs2_gc_release_page(struct jffs2_sb_info *c,
 static int jffs2_flash_setup(struct jffs2_sb_info *c) {
 	int ret = 0;
 
-	if (jffs2_cleanmarker_oob(c)) {
+	if (c->mtd->type == MTD_NANDFLASH) {
+		if (c->mtd->flags & MTD_MULTI_LEVEL_CHIP)
+			printk(KERN_INFO "JFFS2: Multi Level Chip
support\n");
 		/* NAND flash... do setup accordingly */
 		ret = jffs2_nand_flash_setup(c);
 		if (ret)
@@ -689,7 +691,7 @@ static int jffs2_flash_setup(struct jffs2_sb_info *c) {
 
 void jffs2_flash_cleanup(struct jffs2_sb_info *c) {
 
-	if (jffs2_cleanmarker_oob(c)) {
+	if (c->mtd->type == MTD_NANDFLASH) {
 		jffs2_nand_flash_cleanup(c);
 	}
 
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index bf64686..70881bc 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -110,7 +110,7 @@ static inline void jffs2_init_inode_info(struct
jffs2_inode_info *f)
 #define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE))
 #endif
 
-#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
+#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH &&
!(c->mtd->flags & MTD_MULTI_LEVEL_CHIP))
 
 #define jffs2_flash_write_oob(c, ofs, len, retlen, buf)
((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
 #define jffs2_flash_read_oob(c, ofs, len, retlen, buf)
((c)->mtd->read_oob((c)->mtd, ofs, len, retlen, buf))
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index f71dac4..80334d7 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -30,12 +30,14 @@ struct mtd_oob_buf {
 #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
 #define MTD_NO_ERASE		0x1000	/* No erase necessary */
 #define MTD_STUPID_LOCK		0x2000	/* Always locked after reset
*/
+#define MTD_MULTI_LEVEL_CHIP	0x4000	/* Multi Level Chip */
 
 // Some common devices / combinations of capabilities
 #define MTD_CAP_ROM		0
 #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE |
MTD_NO_ERASE)
 #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
 #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
+#define MTD_CAP_MLC_NANDFLASH	(MTD_WRITEABLE | MTD_MULTI_LEVEL_CHIP)
 
 /* ECC byte placement */
 #define MTD_NANDECC_OFF		0	// Switch off ECC (Not
recommended)



------------------------------

Message: 7
Date: Tue, 27 Nov 2007 10:55:18 +0100
From: J?rn Engel <joern@logfs.org>
Subject: Re: [RFC][PATCH][JFFS2] JFFS2 support for NOP 1
To: Kyungmin Park <kyungmin.park@samsung.com>
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Message-ID: <20071127095518.GA29456@lazybastard.org>
Content-Type: text/plain; charset=utf-8

On Tue, 27 November 2007 16:36:16 +0900, Kyungmin Park wrote:
> diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
> index bf64686..70881bc 100644
> --- a/fs/jffs2/os-linux.h
> +++ b/fs/jffs2/os-linux.h
> @@ -110,7 +110,7 @@ static inline void jffs2_init_inode_info(struct
jffs2_inode_info *f)
>  #define jffs2_can_mark_obsolete(c) (c->mtd->flags & (MTD_BIT_WRITEABLE))
>  #endif
>  
> -#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH)
> +#define jffs2_cleanmarker_oob(c) (c->mtd->type == MTD_NANDFLASH &&
!(c->mtd->flags & MTD_MULTI_LEVEL_CHIP))
>  
>  #define jffs2_flash_write_oob(c, ofs, len, retlen, buf)
((c)->mtd->write_oob((c)->mtd, ofs, len, retlen, buf))
>  #define jffs2_flash_read_oob(c, ofs, len, retlen, buf)
((c)->mtd->read_oob((c)->mtd, ofs, len, retlen, buf))
> diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
> diff --git a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
> diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
> index f71dac4..80334d7 100644
> --- a/include/mtd/mtd-abi.h
> +++ b/include/mtd/mtd-abi.h
> @@ -30,12 +30,14 @@ struct mtd_oob_buf {
>  #define MTD_BIT_WRITEABLE	0x800	/* Single bits can be flipped */
>  #define MTD_NO_ERASE		0x1000	/* No erase necessary */
>  #define MTD_STUPID_LOCK		0x2000	/* Always locked after reset
*/
> +#define MTD_MULTI_LEVEL_CHIP	0x4000	/* Multi Level Chip */
>  
>  // Some common devices / combinations of capabilities
>  #define MTD_CAP_ROM		0
>  #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE |
MTD_NO_ERASE)
>  #define MTD_CAP_NORFLASH	(MTD_WRITEABLE | MTD_BIT_WRITEABLE)
>  #define MTD_CAP_NANDFLASH	(MTD_WRITEABLE)
> +#define MTD_CAP_MLC_NANDFLASH	(MTD_WRITEABLE |
MTD_MULTI_LEVEL_CHIP)

NAK.  This does not describe the limitations of your chip, but a random
name.  In fact, the limitations appear to be identical to
(MTD_NORFLASH & !MTD_BIT_WRITEABLE).

Maybe something like ALLOW_SEPERATE_OOB_WRITE with reversed logic?

J?rn

-- 
It does not require a majority to prevail, but rather an irate,
tireless minority keen to set brush fires in people's minds.
-- Samuel Adams



------------------------------

Message: 8
Date: Tue, 27 Nov 2007 11:25:10 +0000 (GMT)
From: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [PATCH] Tons of bogus warning messages on attmpt to mount
	on M18
To: linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org
Message-ID:
	<Pine.LNX.4.64.0711271119190.3827@pentafluge.infradead.org>
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,


> We faced a lot of warning messages if to mount jffs2 on image generated by
mkfs utility.
> 
> Warning messages are these:
> JFFS2 warning: (696) check_node_data: MTD point returned len too short:
1112 inst
> ead of 1816.
> JFFS2 warning: (696) check_node_data: MTD point returned len too short:
1276 inst
> ead of 2156.
> JFFS2 warning: (696) check_node_data: MTD point returned len too short:
1098 inst
> ead of 1746.
> And many many more.
> 
> This patch fixes the issue of warning messages on M18 (Sibley).
> 
> Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> ---------------
> diff -aur a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
> --- a/fs/jffs2/readinode.c      2007-11-26 21:42:22.000000000 +0300
> +++ b/fs/jffs2/readinode.c      2007-11-26 21:39:33.000000000 +0300
> @@ -64,7 +64,7 @@
>          * adding and jffs2_flash_read_end() interface. */
>         if (c->mtd->point) {
>                 err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
> -               if (!err && retlen < tn->csize) {
> +               if (!err && retlen < len) {
>                         JFFS2_WARNING("MTD point returned len too short:
%zu instead of %u.\n", retlen, tn->csize);
>                         c->mtd->unpoint(c->mtd, buffer, ofs, len);
>                 } else if (err)
> -----------------
> 

Please you new patch insted of old one?
Signed-off-by: Alexey Korolev <akorolev@infradead.org>

diff -aur a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
--- a/fs/jffs2/readinode.c	2007-11-26 21:42:22.000000000 +0300
+++ b/fs/jffs2/readinode.c	2007-11-26 21:39:33.000000000 +0300
@@ -64,7 +64,7 @@
 	 * adding and jffs2_flash_read_end() interface. */
 	if (c->mtd->point) {
 		err = c->mtd->point(c->mtd, ofs, len, &retlen, &buffer);
-		if (!err && retlen < tn->csize) {
+		if (!err && retlen < len) {
 			JFFS2_WARNING("MTD point returned len too short: %zu
instead of %u.\n", retlen, tn->csize);
 			c->mtd->unpoint(c->mtd, buffer, ofs, len);
 		} else if (err)

Thanks,
Alexey



------------------------------

______________________________________________________
Linux MTD discussion mailing list digest
http://lists.infradead.org/mailman/listinfo/linux-mtd/


End of linux-mtd Digest, Vol 56, Issue 40
*****************************************
