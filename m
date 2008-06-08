Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5JjC-0002AW-RV
	for linux-mtd@lists.infradead.org; Sun, 08 Jun 2008 12:10:31 +0000
Date: Sun, 8 Jun 2008 14:10:20 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bruce_Leonard@selinc.com
Subject: Re: mtd_info->size again (lengthy)
Message-ID: <20080608121020.GA13200@logfs.org>
References: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 7 June 2008 22:38:21 -0700, Bruce_Leonard@selinc.com wrote:
> 
> But folks, I'm stuck.

Sometimes the best answer comes in diff -u form, see below.

This has been on my TODO list for a while.  Long-term we want to get rid
of read, write and erase in drivers, replacing them with submit_fio (or
some equivalent function, if people dislike the name).  Submit_fio has
the advantage of allowing asynchronous operations, queueing,
out-of-order completion and all those goodies.  If you have several
chips in a device, I'm sure you want those as well.

And while at it, replace the 32bit size with a 64bit blockno and 32bit
offset.  Unless someone is stupid enough to create devices with 4G
erasesize, that should last for a human lifetime or something close.

It still leaves the problem of converting all driver.  I've only started
on mtdram - because it is simple and everyone can test it.  Other
drivers can follow over time.  Users like jffs2 could be converted as
well, but I'd rather leave them for now.  We want synchronous wrappers
around submit_fio anyway, as those are useful for development and for
trivial performance-agnostic code.  So for the time being, users can
simply use the wrappers.

Which leaves four quadrants:
          old driver  new driver
old user      1           2
new user      3           4

1 is fine, 4 is fine.  2 needs to deal with the synchronous wrappers and
3 will also need some plumbing.

Comments?

Jörn

-- 
Don't patch bad code, rewrite it.
-- Kernigham and Pike, according to Rusty

diff --git a/drivers/mtd/devices/mtdram.c b/drivers/mtd/devices/mtdram.c
index 0399be1..6ddefa7 100644
--- a/drivers/mtd/devices/mtdram.c
+++ b/drivers/mtd/devices/mtdram.c
@@ -90,6 +90,50 @@ static int ram_write(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static int ram_submit_fio(struct mtd_info *mtd, struct fio *fio)
+{
+	int i, err = 0;
+	u32 ofs;
+	size_t *retlen;
+	const u_char *buf;
+	struct fio_vec *vec;
+
+	/* This driver cannot deal with device >32bit yet */
+	if (fio->fi_blockno * mtd->erasesize + fio->block_ofs + fio->fi_len
+			> 0xffffffff)
+		return -EIO;
+
+	ofs = fio->fi_blockno * mtd->erasesize + fio->block_ofs;
+
+	if (fio->fi_command == FI_ERASE) {
+		memset(mtd->priv + ofs, 0xff, fio->fi_len);
+		goto out;
+	}
+
+	for (i = 0; i < fio->fi_vcnt; i++) {
+		vec = fio->fi_io_vec + i;
+		buf = kmap_atomic(vec->fv_page, KM_USER0);
+		switch (fio->fi_command) {
+		case FI_READ:
+			err = ram_read(mtd, ofs, vec->fv_len, &retlen,
+					buf + vec->fv_offset);
+			break;
+		case FI_WRITE:
+			err = ram_write(mtd, ofs, vec->fv_len, &retlen,
+					buf + vec->fv_offset);
+		default:
+			BUG();
+		}
+		kunmap_atomic(buf, KM_USER0);
+		ofs += vec->fv_len;
+		if (err)
+			goto out;
+	}
+out:
+	fio->fi_end_io(fio, err);
+	return 0;
+}
+
 static void __exit cleanup_mtdram(void)
 {
 	if (mtd_info) {
@@ -109,8 +153,10 @@ int mtdram_init_device(struct mtd_info *mtd, void *mapped_address,
 	mtd->type = MTD_RAM;
 	mtd->flags = MTD_CAP_RAM;
 	mtd->size = size;
-	mtd->writesize = 1;
+	mtd->no_eraseblocks = size;
+	do_div(mtd->no_eraseblocks, MTDRAM_ERASE_SIZE);
 	mtd->erasesize = MTDRAM_ERASE_SIZE;
+	mtd->writesize = 1;
 	mtd->priv = mapped_address;
 
 	mtd->owner = THIS_MODULE;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 245f909..9729a17 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -98,10 +98,51 @@ struct mtd_oob_ops {
 	uint8_t		*oobbuf;
 };
 
+enum fi_command {
+	FI_READ,
+	FI_WRITE,
+	FI_ERASE,
+};
+
+struct fio_vec {
+	struct page	*fv_page;
+	unsigned int	fv_len;
+	unsigned int	fv_offset;
+};
+
+typedef void (fio_end_io_t) (struct fio *, int);
+/*
+ * struct fio (flash io) is modeled after struct bio and where possible the
+ * fields have been kept identical.  Some fields have gone missing and others
+ * been added.
+ */
+struct fio {
+	/* Fields shared with struct bio */
+	struct fio	*fi_next;
+	unsigned long	fi_flags;
+	unsigned long	fi_command;
+	unsigned short	fi_vcnt;
+	struct fio_vec	fi_io_vec;
+	fio_end_io_t	fi_end_io;
+	void		*fi_private;
+	/* Fields specific to flash */
+	u64		fi_blockno;
+	u32		fi_blockofs;
+	u32		fi_len;
+};
+
 struct mtd_info {
 	u_char type;
 	u_int32_t flags;
-	u_int32_t size;	 // Total size of the MTD
+	/*
+	 * size is becoming redundant, as it can be calculated from
+	 * no_eraseblocks * erasesize.  There is a fair chance it will die
+	 * in the near future.  For flashes with variable erase sizes,
+	 * no_eraseblocks signifies the "normal" size, so above calculation
+	 * remains valid.
+	 */
+	u_int64_t size;	 // Total size of the MTD
+	u_int64_t no_eraseblocks;
 
 	/* "Major" erase size for the device. Naïve users may take this
 	 * to be the only erase size available, or may use the more detailed
@@ -151,6 +192,7 @@ struct mtd_info {
 	void (*unpoint) (struct mtd_info *mtd, loff_t from, size_t len);
 
 
+	int (*submit_bio) (struct mtd_info *mtd, struct fio *fio);
 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
