Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyJzQ-00037o-A3
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2010 07:43:42 +0000
Received: by qwe4 with SMTP id 4so16987qwe.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Sep 2010 00:43:28 -0700 (PDT)
From: Mike Frysinger <vapier.adi@gmail.com>
To: dedekind1@gmail.com
Subject: Re: linux equivalent of u-boot's "nand scrub" (erasing blocks even
	when OOB says "bad")
Date: Wed, 22 Sep 2010 03:43:32 -0400
References: <AANLkTikrEq1hJEttX=DkMWYaLsJnW+QWGRaL2eygZ8uZ@mail.gmail.com>
	<AANLkTinHKU1BfmtZyEKFwUVFJz9YoPr93D7tP6jqXeJE@mail.gmail.com>
	<1284278043.1783.10.camel@brekeke>
In-Reply-To: <1284278043.1783.10.camel@brekeke>
MIME-Version: 1.0
Message-Id: <201009220343.33025.vapier.adi@gmail.com>
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday, September 12, 2010 03:54:03 Artem Bityutskiy wrote:
> On Sun, 2010-09-12 at 00:03 -0400, Mike Frysinger wrote:
> > On Sat, Sep 11, 2010 at 02:32, Artem Bityutskiy wrote:
> > > It will be confusing if the same word is used in MTD for "unmarking"
> > > eraseblocks. How about: 'force erase' or 'bad erase' ?
> > 
> > that makes it sound like an option to the existing MEMERASE operation.
> > 
> >  so i guess what if we just do that -- extend the erase_info_user
> > 
> > structure to contain a flags field and add a MEMERASE2 that works with
> > the larger structure ?  for now we'd only have one option (FORCE), but
> > it makes it easy to extend in the future.
> 
> Ohh, this was so stupid of me to not ask people to add extra fields to
> 'struct erase_info_user64' which was introduced relatively recently... I
> always add extra fields to ioctl data structures...
> 
> But yeah, what you say sounds ok to me.

here's a POC that works for me.  with a simple tweak to `flash_eraseall`, i
can now recover my mtd devices with funky OOB layouts.

ive only extended MEMERASE64 as i believe the non-64 variants are EOL ?  or
should i also extend the 32bit interface as well ?
-mike

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 5b081cb..68c2864 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -513,6 +513,7 @@ static int mtd_ioctl(struct inode *inode, struct file 
*file,
 
 	case MEMERASE:
 	case MEMERASE64:
+	case MEMERASE64_FLAGS:
 	{
 		struct erase_info *erase;
 
@@ -538,6 +539,17 @@ static int mtd_ioctl(struct inode *inode, struct file 
*file,
 				}
 				erase->addr = einfo64.start;
 				erase->len = einfo64.length;
+			} else if (cmd == MEMERASE64_FLAGS) {
+				struct erase_info_user64_flags einfo64;
+
+				if (copy_from_user(&einfo64, argp,
+					    sizeof(struct erase_info_user64_flags))) {
+					kfree(erase);
+					return -EFAULT;
+				}
+				erase->addr = einfo64.start;
+				erase->len = einfo64.length;
+				erase->flags = einfo64.flags;
 			} else {
 				struct erase_info_user einfo32;
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8f2958f..e440d84 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2354,7 +2354,8 @@ int nand_erase_nand(struct mtd_info *mtd, struct 
erase_info *instr,
 		/*
 		 * heck if we have a bad block, we do not erase bad blocks !
 		 */
-		if (nand_block_checkbad(mtd, ((loff_t) page) <<
+		if (!(instr->flags & MTD_ERASE_BADBLOCKS) &&
+			nand_block_checkbad(mtd, ((loff_t) page) <<
 					chip->page_shift, 0, allowbbt)) {
 			printk(KERN_WARNING "%s: attempt to erase a bad block "
 					"at page 0x%08x\n", __func__, page);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 0f32a9b..f1cda73 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -37,6 +37,7 @@ struct erase_info {
 	struct mtd_info *mtd;
 	uint64_t addr;
 	uint64_t len;
+	uint32_t flags;
 	uint64_t fail_addr;
 	u_long time;
 	u_long retries;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index be51ae2..fef14ba 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -17,6 +17,12 @@ struct erase_info_user64 {
 	__u64 length;
 };
 
+struct erase_info_user64_flags {
+	__u64 start;
+	__u64 length;
+	__u32 flags;
+};
+
 struct mtd_oob_buf {
 	__u32 start;
 	__u32 length;
@@ -61,6 +67,9 @@ struct mtd_oob_buf64 {
 #define MTD_OTP_FACTORY		1
 #define MTD_OTP_USER		2
 
+/* Erase flags */
+#define MTD_ERASE_BADBLOCKS	0x1
+
 struct mtd_info_user {
 	__u8 type;
 	__u32 flags;
@@ -110,6 +119,7 @@ struct otp_info {
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MEMERASE64_FLAGS	_IOW('M', 23, struct erase_info_user64_flags)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
