Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49562C04FFE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=911TLis2beQCfuDqgtqJwyvm/82i/UaHpLCyNGbOj3c=; b=MB3CzV5jiAd7n6
	4FxjY+I62kwbPACHJRQFJQ0lEbROO2sbSRajqdb/e1EXNBJWqy+zfQT/exwlUPgALbd5TtWJ5llmU
	wY5S+Bix0zERMdbx4mZAMX5K0uH4nxn9DLeSdllybOl5YF3s7wAvPZt+vaLTRBjXrthpGGbg8ullx
	KbNn7iixq3Sn4G23Bv12Nbj36ITeMDtZnrXoIUR2aA9l058Osk59cCM6ioIeJUv6jsTfSZelKgBaN
	4H+qP3Rw1yY2V3TDQcEGVS9BjJVIpitG/GGfd9SnANSXAGYifjOLEqOwxGUL5ZBALdrS4RJM6wvav
	QO/i4GizTOYPJDkczxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6t5q-0000000GAn0-1IbM;
	Tue, 14 May 2024 14:25:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6t5n-0000000GAmE-2VIL
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 14:25:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6t5m-00044O-7m; Tue, 14 May 2024 16:25:22 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6t5l-001N6X-6h; Tue, 14 May 2024 16:25:21 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s6t5l-004mXh-0Q;
	Tue, 14 May 2024 16:25:21 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 14 May 2024 16:25:19 +0200
Subject: [PATCH v3 3/3] mtd: nand: mxc_nand: support software ECC
MIME-Version: 1.0
Message-Id: <20240514-mtd-nand-mxc-nand-exec-op-v3-3-3e6f45fd3d82@pengutronix.de>
References: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
In-Reply-To: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715696721; l=5082;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=fFUDAF5lVPhHSvNzxUUCBmqbwiK0hi2y6kNbxl0InYA=;
 b=tj+4TIwISXBORWmh2MPTpURPBXKBF+9LJxh4lMhXFqbOwW+GbhgFW330wF+Nw7AwulilNg3xE
 GJVIJBKANLCBa9lJ/4sDYhcTtPGghY2dTCeqAy1aoVLkgpKM+QG8l28
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_072523_677414_4F8E6F87 
X-CRM114-Status: GOOD (  25.69  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

With these changes the driver can be used with software BCH ECC which
is useful for NAND chips that require a stronger ECC than the i.MX
hardware supports.

The controller normally interleaves user data with OOB data when
accessing the NAND chip. With Software BCH ECC we write the data
to the NAND in a way that the raw data on the NAND chip matches the
way the NAND layer sees it. This way commands like NAND_CMD_RNDOUT
work as expected.

This was tested on i.MX27 but should work on the other SoCs supported
by this driver as well.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/raw/mxc_nand.c | 73 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 6f8b8f4b118ec..ae4cff2584a2d 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1404,10 +1404,10 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 	chip->ecc.bytes = host->devtype_data->eccbytes;
 	host->eccsize = host->devtype_data->eccsize;
 	chip->ecc.size = 512;
-	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
 
 	switch (chip->ecc.engine_type) {
 	case NAND_ECC_ENGINE_TYPE_ON_HOST:
+		mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
 		chip->ecc.read_page = mxc_nand_read_page;
 		chip->ecc.read_page_raw = mxc_nand_read_page_raw;
 		chip->ecc.read_oob = mxc_nand_read_oob;
@@ -1417,6 +1417,8 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
 		break;
 
 	case NAND_ECC_ENGINE_TYPE_SOFT:
+		chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
+		chip->ecc.read_page_raw = nand_monolithic_read_page_raw;
 		break;
 
 	default:
@@ -1472,6 +1474,59 @@ static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
 	return host->devtype_data->setup_interface(chip, chipnr, conf);
 }
 
+static void copy_page_to_sram(struct mtd_info *mtd, const void *buf, int buf_len)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(this);
+	unsigned int no_subpages = mtd->writesize / 512;
+	int oob_per_subpage, i;
+
+	oob_per_subpage = (mtd->oobsize / no_subpages) & ~1;
+
+	/*
+	 * During a page write the i.MX NAND controller will read 512b from
+	 * main_area0 SRAM, then oob_per_subpage bytes from spare0 SRAM, then
+	 * 512b from main_area1 SRAM and so on until the full page is written.
+	 * For software ECC we want to have a 1:1 mapping between the raw page
+	 * data on the NAND chip and the view of the NAND core. This is
+	 * necessary to make the NAND_CMD_RNDOUT read the data it expects.
+	 * To accomplish this we have to write the data in the order the controller
+	 * reads it. This is reversed in copy_page_from_sram() below.
+	 */
+	for (i = 0; i < no_subpages; i++) {
+		memcpy16_toio(host->main_area0 + i * 512, buf, 512);
+		buf += 512;
+
+		memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len, buf,
+			      oob_per_subpage);
+		buf += oob_per_subpage;
+	}
+}
+
+static void copy_page_from_sram(struct mtd_info *mtd)
+{
+	struct nand_chip *this = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(this);
+	void *buf = host->data_buf;
+	unsigned int no_subpages = mtd->writesize / 512;
+	int oob_per_subpage, i;
+
+	/* mtd->writesize is not set during ident scanning */
+	if (!no_subpages)
+		no_subpages = 1;
+
+	oob_per_subpage = (mtd->oobsize / no_subpages) & ~1;
+
+	for (i = 0; i < no_subpages; i++) {
+		memcpy16_fromio(buf, host->main_area0 + i * 512, 512);
+		buf += 512;
+
+		memcpy16_fromio(buf, host->spare0 + i * host->devtype_data->spare_len,
+				oob_per_subpage);
+		buf += oob_per_subpage;
+	}
+}
+
 static int mxcnd_do_exec_op(struct nand_chip *chip,
 			    const struct nand_subop *op)
 {
@@ -1510,7 +1565,10 @@ static int mxcnd_do_exec_op(struct nand_chip *chip,
 			buf_write = instr->ctx.data.buf.out;
 			buf_len = instr->ctx.data.len;
 
-			memcpy32_toio(host->main_area0, buf_write, buf_len);
+			if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
+				memcpy32_toio(host->main_area0, buf_write, buf_len);
+			else
+				copy_page_to_sram(mtd, buf_write, buf_len);
 
 			host->devtype_data->send_page(mtd, NFC_INPUT);
 
@@ -1545,10 +1603,15 @@ static int mxcnd_do_exec_op(struct nand_chip *chip,
 
 			host->devtype_data->read_page(chip);
 
-			if (IS_ALIGNED(buf_len, 4)) {
-				memcpy32_fromio(buf_read, host->main_area0, buf_len);
+			if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST) {
+				if (IS_ALIGNED(buf_len, 4)) {
+					memcpy32_fromio(buf_read, host->main_area0, buf_len);
+				} else {
+					memcpy32_fromio(host->data_buf, host->main_area0, mtd->writesize);
+					memcpy(buf_read, host->data_buf, buf_len);
+				}
 			} else {
-				memcpy32_fromio(host->data_buf, host->main_area0, mtd->writesize);
+				copy_page_from_sram(mtd);
 				memcpy(buf_read, host->data_buf, buf_len);
 			}
 

-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
