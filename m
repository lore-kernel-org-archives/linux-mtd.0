Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaLSy-0004XV-QF
	for linux-mtd@lists.infradead.org; Sun, 18 Jul 2010 04:27:06 +0000
Received: by fxm3 with SMTP id 3so1904677fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Jul 2010 21:27:03 -0700 (PDT)
Subject: Re: [PATCHv2 4/5] libmtd: add support for 64-bit offsets, OOB
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kevin Cernekee <cernekee@gmail.com>
In-Reply-To: <1279386513.7515.33.camel@localhost.localdomain>
References: <eb53f5a0215250d7e523de47d15b0d12@localhost>
	<c65631c48fb5d2de8d25f65bffa5e22d@localhost>
	<1279386513.7515.33.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 18 Jul 2010 07:26:59 +0300
Message-Id: <1279427219.16247.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, jwboyer@gmail.com, saeed.bishara@gmail.com,
	vapier.adi@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-07-17 at 20:08 +0300, Artem Bityutskiy wrote:
> On Wed, 2010-07-07 at 17:30 -0700, Kevin Cernekee wrote:
> > Change mtd_erase() so that it attempts to use MEMERASE64 first, then falls
> > back to the old <2.6.31 MEMERASE if MEMERASE64 is unsupported.
> > 
> > Add mtd_read_oob(), mtd_write_oob() functions to wrap the OOB ioctls.
> > Similar ioctl fallback logic is used in these functions as well.
> > 
> > Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
> > ---
> >  include/libmtd.h |   36 ++++++++++++++++++++++-
> >  lib/libmtd.c     |   82 ++++++++++++++++++++++++++++++++++++++++++++++++++---
> >  2 files changed, 111 insertions(+), 7 deletions(-)
> 
> Kevin, here is a patch which adds MEMERASE64 support. I did not want to
> add the flag to 'struct mtd_dev_info', because I do not think it should
> be visible to users. So I put it to libmtd descriptor, but this means
> that now we have to pass it to 'mtd_erase()'.

And then on top of this I've created another patch which adds
mtd_read_oob() and mtd_write_oob(). And your patch 5/5 then can be
applied on top.

Please, take a look at my patches and try them - they are only compile
tested. Would be great to try on both pre-offs64_ioctls kernel and new
kernels. If the patches are OK for you and work, I can push them.

>From 4b3a46c1464b4b7bcc1c7983b66eb3e13f3dee5e Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 18 Jul 2010 07:14:29 +0300
Subject: [PATCH] libmtd: add OOB read and write interfaces

This patch is based on Kevin Cernekee's patch posted to the MTD mailing
list. It adds 'mtd_read_oob()' and 'mtd_write_oob()' interfaces support.

The interfaces use MEMREADOOB64/MEMWRITEOOB64 MTD ioctls if possible, and
fall-back to MEMREADOOB/MEMWRITEOOB if the 64-bit versions are not supported.
The information about ioctls support is then cashed in 'offs64_ioctls'
libmtd flag.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/libmtd.h |   36 ++++++++++++++++++++-
 lib/libmtd.c     |   94 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index 2bf9859..afaba42 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -216,6 +216,40 @@ int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 	      void *buf, int len);
 
 /**
+ * mtd_read_oob - read out-of-band area.
+ * @desc: MTD library descriptor
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @start: page-aligned start address
+ * @length: number of OOB bytes to read
+ * @data: read buffer
+ *
+ * This function reads @length OOB bytes starting from address @start on
+ * MTD device described by @fd. The address is specified as page byte offset
+ * from the beginning of the MTD device. This function returns %0 in case of
+ * success and %-1 in case of failure.
+ */
+int mtd_read_oob(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
+		 uint64_t start, uint64_t length, void *data);
+
+/**
+ * mtd_write_oob - write out-of-band area.
+ * @desc: MTD library descriptor
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @start: page-aligned start address
+ * @length: number of OOB bytes to write
+ * @data: write buffer
+ *
+ * This function writes @length OOB bytes starting from address @start on
+ * MTD device described by @fd. The address is specified as page byte offset
+ * from the beginning of the MTD device. Returns %0 in case of success and %-1
+ * in case of failure.
+ */
+int mtd_write_oob(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
+		  uint64_t start, uint64_t length, void *data);
+
+/**
  * mtd_write_img - write a file to MTD device.
  * @mtd: MTD device description object
  * @fd: MTD device node file descriptor
@@ -236,7 +270,7 @@ int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
  * @node: the node to test
  *
  * This function tests whether @node is an MTD device node and returns %1 if it
- * is, and %-1 if it is not (errno is ENODEV in this case) or if an error
+ * is, and %-1 if it is not (errno is %ENODEV in this case) or if an error
  * occurred.
  */
 int mtd_probe_node(libmtd_t desc, const char *node);
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 3b4544e..1f2a6ea 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1054,6 +1054,100 @@ int mtd_write(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 	return 0;
 }
 
+int do_oob_op(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
+	      uint64_t start, uint64_t length, void *data, int cmd64, int cmd)
+{
+	int ret;
+	struct mtd_oob_buf64 oob64;
+	struct mtd_oob_buf oob;
+	unsigned long long max_offs;
+	const char *cmd64_str, *cmd_str;
+	struct libmtd *lib = (struct libmtd *)desc;
+
+	if (cmd64 ==  MEMREADOOB64) {
+		cmd64_str = "MEMREADOOB64";
+		cmd_str   = "MEMREADOOB";
+	} else {
+		cmd64_str = "MEMWRITEOOB64";
+		cmd_str   = "MEMWRITEOOB";
+	}
+
+	max_offs = (unsigned long long)mtd->eb_cnt * mtd->eb_size;
+	if (start >= max_offs) {
+		errmsg("bad page address %llu, mtd%d has %d eraseblocks "
+		       "(%llu bytes)", (unsigned long long) start, mtd->mtd_num,
+		       mtd->eb_cnt, max_offs);
+		errno = EINVAL;
+		return -1;
+	}
+	if (start % mtd->min_io_size) {
+		errmsg("unaligned address %llu, mtd%d page size is %d",
+		       (unsigned long long)start, mtd->mtd_num,
+		       mtd->min_io_size);
+		errno = EINVAL;
+		return -1;
+	}
+
+	oob64.start = start;
+	oob64.length = length;
+	oob64.usr_ptr = (uint64_t)(unsigned long)data;
+
+	if (lib->offs64_ioctls == OFFS64_IOCTLS_SUPPORTED ||
+	    lib->offs64_ioctls == OFFS64_IOCTLS_UNKNOWN) {
+		ret = ioctl(fd, cmd64, &oob64);
+		if (ret == 0)
+			return ret;
+
+		if (errno != ENOTTY ||
+		    lib->offs64_ioctls != OFFS64_IOCTLS_UNKNOWN) {
+			sys_errmsg("%s ioctl failed for mtd%d, offset %llu "
+				   "(eraseblock %llu)", cmd64_str, mtd->mtd_num,
+				   (unsigned long long)start,
+				   (unsigned long long)start / mtd->eb_size);
+		}
+
+		/*
+		 * MEMREADOOB64/MEMWRITEOOB64 support was added in kernel
+		 * version 2.6.30, so probably we are working with older kernel
+		 * and these ioctls are not supported.
+		 */
+		lib->offs64_ioctls = OFFS64_IOCTLS_NOT_SUPPORTED;
+	}
+
+	if (oob64.start > 0xFFFFFFFFULL) {
+		errmsg("this system can address only up to address %lu",
+		       0xFFFFFFFFUL);
+		errno = EINVAL;
+		return -1;
+	}
+
+	oob.start = oob64.start;
+	oob.length = oob64.length;
+	oob.ptr = data;
+
+	ret = ioctl(fd, cmd, &oob);
+	if (ret < 0)
+		sys_errmsg("%s ioctl failed for mtd%d, offset %llu "
+			   "(eraseblock %llu)", cmd_str, mtd->mtd_num,
+			   (unsigned long long)start,
+			   (unsigned long long)start / mtd->eb_size);
+	return ret;
+}
+
+int mtd_read_oob(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
+		 uint64_t start, uint64_t length, void *data)
+{
+	return do_oob_op(desc, mtd, fd, start, length, data,
+			 MEMREADOOB64, MEMREADOOB);
+}
+
+int mtd_write_oob(libmtd_t desc, const struct mtd_dev_info *mtd, int fd,
+		  uint64_t start, uint64_t length, void *data)
+{
+	return do_oob_op(desc, mtd, fd, start, length, data,
+			 MEMWRITEOOB64, MEMWRITEOOB);
+}
+
 int mtd_write_img(const struct mtd_dev_info *mtd, int fd, int eb, int offs,
 		  const char *img_name)
 {
-- 
1.6.2.5

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
