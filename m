Received: from host2.innominate.fta-berlin.de ([141.16.82.35]
	helo=home.innominate.com)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fpp5O-0006HM-Px
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 12:16:39 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by home.innominate.com (Postfix) with ESMTP id 3A1D923304
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 17:49:23 +0200 (CEST)
Received: from home.innominate.com ([127.0.0.1])
	by localhost (home [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 13916-04 for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 17:49:23 +0200 (CEST)
Received: from localhost.localdomain (gw-dev-ext.bln.innominate.local
	[10.10.0.1])
	by home.innominate.com (Postfix) with ESMTP id 0E22823301
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Jun 2006 17:49:23 +0200 (CEST)
Received: from chris by localhost.localdomain with local (Exim 4.50)
	id 1FpoX5-0004XH-DH
	for linux-mtd@lists.infradead.org; Mon, 12 Jun 2006 17:40:51 +0200
Date: Mon, 12 Jun 2006 17:40:51 +0200
From: Christian Hohnstaedt <chohnstaedt@innominate.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: otp support for mtd-concat devices
Message-ID: <20060612154051.GK24758@tweety>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uses the otp region of the first sub-device as otp region
of the concat device.

Signed-off-by: Christian Hohnstaedt <chohnstaedt@innominate.com>

---

 drivers/mtd/mtdconcat.c |   59 +++++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)

e50d51beab818e66b62f602c2990d27770a04d13
diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index 1fea631..4468039 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -676,6 +676,50 @@ static int concat_block_markbad(struct m
 	return err;
 }
 
+#ifdef CONFIG_MTD_OTP
+static int concat_read_user_prot_reg (struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, u_char *buf)
+{
+	mtd = CONCAT(mtd)->subdev[0];
+	return mtd->read_user_prot_reg (mtd, from, len, retlen, buf);
+}
+
+static int concat_get_user_prot_info (struct mtd_info *mtd,
+				    struct otp_info *buf, size_t len)
+{
+	mtd = CONCAT(mtd)->subdev[0];
+	return mtd->get_user_prot_info (mtd, buf, len);
+}
+
+static int concat_read_fact_prot_reg (struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, u_char *buf)
+{
+	mtd = CONCAT(mtd)->subdev[0];
+	return mtd->read_fact_prot_reg (mtd, from, len, retlen, buf);
+}
+
+static int concat_get_fact_prot_info (struct mtd_info *mtd,
+				    struct otp_info *buf, size_t len)
+{
+	mtd = CONCAT(mtd)->subdev[0];
+	return mtd->get_fact_prot_info (mtd, buf, len);
+}
+
+static int concat_write_user_prot_reg (struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, u_char *buf)
+{
+	mtd = CONCAT(mtd)->subdev[0];
+	return mtd->write_user_prot_reg (mtd, from, len, retlen, buf);
+}
+
+static int concat_lock_user_prot_reg (struct mtd_info *mtd, loff_t from,
+		size_t len)
+{
+	mtd = CONCAT(mtd)->subdev[0];
+	return mtd->lock_user_prot_reg (mtd, from, len);
+}
+#endif
+
 /*
  * This function constructs a virtual MTD device by concatenating
  * num_devs MTD devices. A pointer to the new device object is
@@ -734,6 +778,21 @@ struct mtd_info *mtd_concat_create(struc
 
 	concat->mtd.ecc_stats.badblocks = subdev[0]->ecc_stats.badblocks;
 
+#ifdef CONFIG_MTD_OTP
+	if (subdev[0]->read_user_prot_reg)
+		concat->mtd.read_user_prot_reg = concat_read_user_prot_reg;
+	if (subdev[0]->read_fact_prot_reg)
+		concat->mtd.read_fact_prot_reg = concat_read_fact_prot_reg;
+	if (subdev[0]->write_user_prot_reg)
+		concat->mtd.write_user_prot_reg = concat_write_user_prot_reg;
+	if (subdev[0]->lock_user_prot_reg)
+		concat->mtd.lock_user_prot_reg = concat_lock_user_prot_reg;
+	if (subdev[0]->get_user_prot_info)
+		concat->mtd.get_user_prot_info = concat_get_user_prot_info;
+	if (subdev[0]->get_fact_prot_info)
+		concat->mtd.get_fact_prot_info = concat_get_fact_prot_info;
+#endif
+
 	concat->subdev[0] = subdev[0];
 
 	for (i = 1; i < num_devs; i++) {
-- 
Christian Hohnstaedt
Software Engineer

Innominate Security Technologies AG  /device attached security/
tel: +49.30.6392-3285
fax: +49.30.6392-3307
Albert-Einstein-Str. 14
D-12489 Berlin, Germany
http://www.innominate.com
