Received: from fg-out-1718.google.com ([72.14.220.159])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OOCEM-0007YS-6d
	for linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 16:09:47 +0000
Received: by fg-out-1718.google.com with SMTP id e21so991066fga.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 14 Jun 2010 09:09:44 -0700 (PDT)
Date: Mon, 14 Jun 2010 18:10:33 +0200
From: Richard Cochran <richardcochran@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: Added an ioctl to query the lock status of a
	flash sector.
Message-ID: <20100614161033.GA24877@riccoc20.at.omicron.at>
References: <20100531131214.GA15887@riccoc20.at.omicron.at>
	<1276419903.19028.180.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1276419903.19028.180.camel@localhost>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 13, 2010 at 12:05:03PM +0300, Artem Bityutskiy wrote:
> I think it is tiny bit nicer to name 'is_locked', which is a bit more
> consistent with the already existing 'block_isbad'?

Okay, here it is again.

Thanks,
Richard


This patchs adds a way for user space programs to find out whether a
flash sector is locked. An optional driver method in the mtd_info struct
provides the information.

Signed-off-by: Richard Cochran <richard.cochran@omicron.at>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |   10 ++++++++++
 drivers/mtd/mtdchar.c               |   14 ++++++++++++++
 drivers/mtd/mtdpart.c               |   10 ++++++++++
 include/linux/mtd/mtd.h             |    1 +
 include/mtd/mtd-abi.h               |    1 +
 5 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 62f3ea9..2fadb02 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -63,6 +63,8 @@ static int cfi_intelext_erase_varsize(struct mtd_info *, struct erase_info *);
 static void cfi_intelext_sync (struct mtd_info *);
 static int cfi_intelext_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
 static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len);
+static int cfi_intelext_is_locked(struct mtd_info *mtd, loff_t ofs,
+				  uint64_t len);
 #ifdef CONFIG_MTD_OTP
 static int cfi_intelext_read_fact_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
 static int cfi_intelext_read_user_prot_reg (struct mtd_info *, loff_t, size_t, size_t *, u_char *);
@@ -448,6 +450,7 @@ struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 	mtd->sync    = cfi_intelext_sync;
 	mtd->lock    = cfi_intelext_lock;
 	mtd->unlock  = cfi_intelext_unlock;
+	mtd->is_locked = cfi_intelext_is_locked;
 	mtd->suspend = cfi_intelext_suspend;
 	mtd->resume  = cfi_intelext_resume;
 	mtd->flags   = MTD_CAP_NORFLASH;
@@ -2139,6 +2142,13 @@ static int cfi_intelext_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return ret;
 }
 
+static int cfi_intelext_is_locked(struct mtd_info *mtd, loff_t ofs,
+				  uint64_t len)
+{
+	return cfi_varsize_frob(mtd, do_getlockstatus_oneblock,
+				ofs, len, NULL) ? 1 : 0;
+}
+
 #ifdef CONFIG_MTD_OTP
 
 typedef int (*otp_op_t)(struct map_info *map, struct flchip *chip,
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 8b223c0..a8e69dd 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -676,6 +676,20 @@ static int mtd_ioctl(struct inode *inode, struct file *file,
 		break;
 	}
 
+	case MEMISLOCKED:
+	{
+		struct erase_info_user einfo;
+
+		if (copy_from_user(&einfo, argp, sizeof(einfo)))
+			return -EFAULT;
+
+		if (!mtd->is_locked)
+			ret = -EOPNOTSUPP;
+		else
+			ret = mtd->is_locked(mtd, einfo.start, einfo.length);
+		break;
+	}
+
 	/* Legacy interface */
 	case MEMGETOOBSEL:
 	{
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b8043a9..4c539de 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -264,6 +264,14 @@ static int part_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	return part->master->unlock(part->master, ofs + part->offset, len);
 }
 
+static int part_is_locked(struct mtd_info *mtd, loff_t ofs, uint64_t len)
+{
+	struct mtd_part *part = PART(mtd);
+	if ((len + ofs) > mtd->size)
+		return -EINVAL;
+	return part->master->is_locked(part->master, ofs + part->offset, len);
+}
+
 static void part_sync(struct mtd_info *mtd)
 {
 	struct mtd_part *part = PART(mtd);
@@ -402,6 +410,8 @@ static struct mtd_part *add_one_partition(struct mtd_info *master,
 		slave->mtd.lock = part_lock;
 	if (master->unlock)
 		slave->mtd.unlock = part_unlock;
+	if (master->is_locked)
+		slave->mtd.is_locked = part_is_locked;
 	if (master->block_isbad)
 		slave->mtd.block_isbad = part_block_isbad;
 	if (master->block_markbad)
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 5326435..43b7d72 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -216,6 +216,7 @@ struct mtd_info {
 	/* Chip-supported device locking */
 	int (*lock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 	int (*unlock) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
+	int (*is_locked) (struct mtd_info *mtd, loff_t ofs, uint64_t len);
 
 	/* Power Management functions */
 	int (*suspend) (struct mtd_info *mtd);
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index be51ae2..e12872e 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -110,6 +110,7 @@ struct otp_info {
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
-- 
1.6.3.3
