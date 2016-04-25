Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auhF8-0001az-Da
 for linux-mtd@lists.infradead.org; Mon, 25 Apr 2016 14:12:07 +0000
Date: Mon, 25 Apr 2016 16:11:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Daniel Walter <dwalter@sigma-star.at>
Subject: Re: Pass -EUCLEN to userspace?
Message-ID: <20160425161144.0f366c9e@bbrezillon>
In-Reply-To: <20160425112616.01f9e4e4@bbrezillon>
References: <20160420132516.GC31101@pengutronix.de>
 <20160422172456.7aaf301c@bbrezillon>
 <20160422172802.4fa830d1@bbrezillon> <571A47D3.6040602@nod.at>
 <20160425052857.GA7860@pengutronix.de>
 <20160425095034.697411aa@bbrezillon>
 <20160425082211.GC7860@pengutronix.de>
 <20160425104041.555b8ed5@bbrezillon>
 <20160425091416.GD7860@pengutronix.de>
 <20160425112616.01f9e4e4@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 25 Apr 2016 11:26:16 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> > >=20
> > > Regarding the maximum number of bitflips per chunk, maybe we can make=
 it
> > > part of the ioctl request instead of saving the statistics at the MTD
> > > level.
> > >=20
> > > How about creating a new ioctl taking a pointer to this struct as a
> > > parameter:
> > >=20
> > > struct mtd_extended_read_ops {
> > > 	/* Existing params */
> > > 	unsigned int mode;
> > > 	size_t len;
> > > 	size_t retlen;
> > > 	size_t ooblen;
> > > 	size_t oobretlen;
> > > 	uint32_t ooboffs;
> > > 	void *datbuf;
> > > 	void *oobbuf;
> > >=20
> > > 	/*
> > > 	 * Param containing the maximum number of bitflips for this
> > > 	 * read request.
> > > 	 */
> > > 	unsigned int max_bitflips;
> > > };   =20
> >=20
> > Not sure how this ioctl exactly should look like, but this would solve
> > the problem. =20
>=20
> Let me design a quick prototype, I'll let you follow up with the patch
> submission process...

Below is an untested patch adding a new ioctl returning the ECC/read stats.
Feel free to debug/enhance this implementation and submit it to the MTD
ML.


--->8---
=46rom 2c07a2a015e6c0bdc2f9d91c9a1b971903da0493 Mon Sep 17 00:00:00 2001
From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Mon, 25 Apr 2016 16:05:06 +0200
Subject: [PATCH] mtd: add a the MEMREAD ioctl to attach ECC stats to the re=
ad
 request

TODO: add proper commit message + split changes into several patches.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/devices/docg3.c        | 10 +++++
 drivers/mtd/mtdchar.c              | 76 ++++++++++++++++++++++++++++++++++=
++++
 drivers/mtd/mtdcore.c              |  9 +++++
 drivers/mtd/nand/nand_base.c       | 10 +++++
 drivers/mtd/onenand/onenand_base.c | 11 ++++++
 include/linux/mtd/mtd.h            |  7 ++++
 include/uapi/mtd/mtd-abi.h         | 50 +++++++++++++++++++++++++
 7 files changed, 173 insertions(+)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index b833e6c..965c97a 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -885,6 +885,8 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t fr=
om,
 	u8 *buf =3D ops->datbuf;
 	size_t len, ooblen, nbdata, nboob;
 	u8 hwecc[DOC_ECC_BCH_SIZE], eccconf1;
+	struct mtd_req_stats *reqstats =3D ops->stats;
+	struct mtd_ecc_stats stats;
 	int max_bitflips =3D 0;
=20
 	if (buf)
@@ -912,6 +914,7 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t fr=
om,
 	ret =3D 0;
 	skip =3D from % DOC_LAYOUT_PAGE_SIZE;
 	mutex_lock(&docg3->cascade->lock);
+	stats =3D mtd->ecc_stats;
 	while (ret >=3D 0 && (len > 0 || ooblen > 0)) {
 		calc_block_sector(from - skip, &block0, &block1, &page, &ofs,
 			docg3->reliable);
@@ -983,6 +986,13 @@ static int doc_read_oob(struct mtd_info *mtd, loff_t f=
rom,
 	}
=20
 out:
+	if (reqstats) {
+		restats->corrected_bitflips +=3D mtd->ecc_stats.corrected -
+					       stats.corrected;
+		restats->uncorrectable_errors +=3D mtd->ecc_stats.failed -
+						 stats.failed;
+	}
+
 	mutex_unlock(&docg3->cascade->lock);
 	return ret;
 err_in_read:
diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 2a47a3f..708ecee 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -656,6 +656,75 @@ static int mtdchar_write_ioctl(struct mtd_info *mtd,
 	return ret;
 }
=20
+static int mtdchar_read_ioctl(struct mtd_info *mtd,
+			      struct mtd_read_req __user *argp)
+{
+	struct mtd_read_req req;
+	struct mtd_req_stats stats;
+	struct mtd_oob_ops ops =3D { .stats =3D &stats };
+	void __user *usr_data, *usr_oob;
+	int ret;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	usr_data =3D (void __user *)(uintptr_t)req.usr_data;
+	usr_oob =3D (void __user *)(uintptr_t)req.usr_oob;
+	if ((usr_data && !access_ok(VERIFY_WRITE, usr_data, req.len)) ||
+	    (usr_oob && !access_ok(VERIFY_WRITE, usr_oob, req.ooblen)))
+		return -EFAULT;
+
+	if (!mtd->_read_oob)
+		return -EOPNOTSUPP;
+
+	ops.mode =3D req.mode;
+	ops.len =3D (size_t)req.len;
+	ops.ooblen =3D (size_t)req.ooblen;
+	ops.ooboffs =3D 0;
+
+	if (usr_data) {
+		ops.datbuf =3D kzalloc(ops.len, GFP_KERNEL);
+		if (!ops.datbuf)
+			return -ENOMEM;
+	}
+
+	if (usr_oob) {
+		ops.oobbuf =3D kzalloc(ops.ooblen, GFP_KERNEL);
+		if (!ops.oobbuf) {
+			ret =3D -ENOMEM;
+			goto out;
+		}
+	}
+
+	ret =3D mtd_read_oob(mtd, (loff_t)req.start, &ops);
+	if (ret)
+		goto out;
+
+	if (usr_data && copy_to_user(ops.datbuf, usr_data, ops.retlen)) {
+		ret =3D -EFAULT;
+		goto out;
+	}
+
+	if (usr_oob && copy_to_user(ops.oobbuf, usr_oob, ops.oobretlen)) {
+		ret =3D -EFAULT;
+		goto out;
+	}
+
+	req.len =3D ops.retlen;
+	req.ooblen =3D ops.oobretlen;
+	req.stats.max_bitflips =3D stats.max_bitflips;
+	req.stats.corrected_bitflips =3D stats.corrected_bitflips;
+	req.stats.uncorrectable_errors =3D stats.uncorrectable_errors;
+	if (copy_to_user(&req, argp, sizeof(req)))
+		ret =3D -EFAULT;
+
+out:
+	kfree(ops.datbuf);
+	kfree(ops.oobbuf);
+
+	return ret;
+}
+
 static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 {
 	struct mtd_file_info *mfi =3D file->private_data;
@@ -850,6 +919,13 @@ static int mtdchar_ioctl(struct file *file, u_int cmd,=
 u_long arg)
 		break;
 	}
=20
+	case MEMREAD:
+	{
+		ret =3D mtdchar_read_ioctl(mtd,
+		      (struct mtd_read_req __user *)arg);
+		break;
+	}
+
 	case MEMLOCK:
 	{
 		struct erase_info_user einfo;
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index e3936b8..ba6488f 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -988,6 +988,11 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, st=
ruct mtd_oob_ops *ops)
 		return -EOPNOTSUPP;
=20
 	ledtrig_mtd_activity();
+
+	/* Make sure all counters are initialized to zero. */
+	if (ops->stats)
+		memset(ops->stats, 0, sizeof(*ops->stats));
+
 	/*
 	 * In cases where ops->datbuf !=3D NULL, mtd->_read_oob() has semantics
 	 * similar to mtd->_read(), returning a non-negative integer
@@ -999,6 +1004,10 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, s=
truct mtd_oob_ops *ops)
 		return ret_code;
 	if (mtd->ecc_strength =3D=3D 0)
 		return 0;	/* device lacks ecc */
+
+	if (ops->stats)
+		ops->stats->max_bitflips =3D ret_code;
+
 	return ret_code >=3D mtd->bitflip_threshold ? -EUCLEAN : 0;
 }
 EXPORT_SYMBOL_GPL(mtd_read_oob);
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 7bc37b4..25cab31 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2162,6 +2162,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, lof=
f_t from,
 static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops)
 {
+	struct mtd_req_stats *reqstats =3D ops->stats;
+	struct mtd_ecc_stats stats;
 	int ret =3D -ENOTSUPP;
=20
 	ops->retlen =3D 0;
@@ -2185,11 +2187,19 @@ static int nand_read_oob(struct mtd_info *mtd, loff=
_t from,
 		goto out;
 	}
=20
+	stats =3D mtd->ecc_stats;
 	if (!ops->datbuf)
 		ret =3D nand_do_read_oob(mtd, from, ops);
 	else
 		ret =3D nand_do_read_ops(mtd, from, ops);
=20
+	if (reqstats) {
+		reqstats->uncorrectable_errors +=3D mtd->ecc_stats.failed -
+						  stats.failed;
+		reqstats->corrected_bitflips +=3D mtd->ecc_stats.corrected -
+						stats.corrected;
+	}
+
 out:
 	nand_release_device(mtd);
 	return ret;
diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onena=
nd_base.c
index a4b029a..2f700eb 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -1491,6 +1491,8 @@ static int onenand_read_oob(struct mtd_info *mtd, lof=
f_t from,
 			    struct mtd_oob_ops *ops)
 {
 	struct onenand_chip *this =3D mtd->priv;
+	struct mtd_req_stats *reqstats =3D ops->stats;
+	struct mtd_ecc_stats stats;
 	int ret;
=20
 	switch (ops->mode) {
@@ -1504,12 +1506,21 @@ static int onenand_read_oob(struct mtd_info *mtd, l=
off_t from,
 	}
=20
 	onenand_get_device(mtd, FL_READING);
+	stats =3D mtd->ecc_stats;
+
 	if (ops->datbuf)
 		ret =3D ONENAND_IS_4KB_PAGE(this) ?
 			onenand_mlc_read_ops_nolock(mtd, from, ops) :
 			onenand_read_ops_nolock(mtd, from, ops);
 	else
 		ret =3D onenand_read_oob_nolock(mtd, from, ops);
+
+	if (reqstats) {
+		reqstats->corrected_bitflips +=3D mtd->ecc_stats.corrected -
+						stats.corrected;
+		reqstats->uncorrectable_errors +=3D mtd->ecc_stats.failed -
+						  stats.failed;
+	}
 	onenand_release_device(mtd);
=20
 	return ret;
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 29a1706..bd5e8a1 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -64,6 +64,12 @@ struct mtd_erase_region_info {
 	unsigned long *lockmap;		/* If keeping bitmap of locks */
 };
=20
+struct mtd_req_stats {
+	unsigned int max_bitflips;
+	unsigned int corrected_bitflips;
+	unsigned int uncorrectable_errors;
+};
+
 /**
  * struct mtd_oob_ops - oob operation operands
  * @mode:	operation mode
@@ -92,6 +98,7 @@ struct mtd_oob_ops {
 	uint32_t	ooboffs;
 	uint8_t		*datbuf;
 	uint8_t		*oobbuf;
+	struct mtd_req_stats *stats;
 };
=20
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
diff --git a/include/uapi/mtd/mtd-abi.h b/include/uapi/mtd/mtd-abi.h
index 0ec1da2..a61a042 100644
--- a/include/uapi/mtd/mtd-abi.h
+++ b/include/uapi/mtd/mtd-abi.h
@@ -90,6 +90,52 @@ struct mtd_write_req {
 	__u8 padding[7];
 };
=20
+/**
+ * struct mtd_read_req_stats - statistics attached to a read request
+ *
+ * @max_bitflips: the maximum number of bitflips found in the read portion.
+ *		  This information can be used to decide when the data stored
+ *		  on a specific portion should be moved somewhere else to
+ *		  avoid data loss.
+ * @corrected_bitflips: the number of bitflips corrected during the read
+ *			operation
+ * @uncorrectable_errors: the number of uncorrectable errors that happened
+ *			  during the read operation
+ */
+struct mtd_read_req_stats {
+	__u32 max_bitflips;
+	__u32 corrected_bitflips;
+	__u32 uncorrectable_errors;
+};
+
+/**
+ * struct mtd_read_req - data structure for requesting a write operation
+ *
+ * @start:	start address
+ * @len:	length of data buffer
+ * @ooblen:	length of OOB buffer
+ * @usr_data:	user-provided data buffer
+ * @usr_oob:	user-provided OOB buffer
+ * @mode:	MTD mode (see "MTD operation modes")
+ * @padding:	reserved, must be set to 0
+ * @stats:	statistics attached to the read request
+ *
+ * This structure supports ioctl(MEMWRITE) operations, allowing data and/o=
r OOB
+ * writes in various modes. To write to OOB-only, set @usr_data =3D=3D NUL=
L, and to
+ * write data-only, set @usr_oob =3D=3D NULL. However, setting both @usr_d=
ata and
+ * @usr_oob to NULL is not allowed.
+ */
+struct mtd_read_req {
+	__u64 start;
+	__u64 len;
+	__u64 ooblen;
+	__u64 usr_data;
+	__u64 usr_oob;
+	__u8 mode;
+	__u8 padding[7];
+	struct mtd_read_req_stats stats;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -203,6 +249,10 @@ struct otp_info {
  * without OOB, e.g., NOR flash.
  */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
+/*
+ * Same as for MEMWRITE but for read operations.
+ */
+#define MEMREAD			_IOWR('M', 25, struct mtd_read_req)
=20
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
