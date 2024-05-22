Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2FAC25B77
	for <linux-mtd@archiver.kernel.org>; Wed, 22 May 2024 05:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lg1yO1ZxubRAGCnAxfu5TNH6N5cIIF2YjNxMEd1DD3Y=; b=XCLAhKGKYj4Ekh
	I5rFGOATf4q8dlMtZDeC9JkVukTWe+JncfJqF0s/HFJzjTeONYCaQXGtBicrqc8tQm5FnRESZfWNp
	TChn1icab7gZNDatCCUm2LpxWE8VcAH6/GjcDCw1jHhXJ7Xmim/lcxyszKTKBj5B6ybDkRvNhwliM
	TWfm/xHJQd6eDahnMQrL1xPMF09VjtJ8FMlNq/V4nOujbu3OhSZbeNYSPLyP8X0WnYqbFbpXx30J1
	yOelYhJZkobJO4sRDli52ez2KQ/kAWcuEdYL9fR5BQ0+XLyQTYUIVQ3Y+5WNSbpklOLa1vAh3efvF
	u+m45L+KlJ56gSaNY9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ehu-0000000227Y-38IB;
	Wed, 22 May 2024 05:40:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ehs-0000000227A-3Z5b
	for linux-mtd@lists.infradead.org;
	Wed, 22 May 2024 05:40:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s9ehj-0003dc-JI; Wed, 22 May 2024 07:39:59 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s9ehg-002U0t-Oa; Wed, 22 May 2024 07:39:56 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1s9ehg-00Dqu2-29;
	Wed, 22 May 2024 07:39:56 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 22 May 2024 07:39:53 +0200
Subject: [PATCH v4 3/3] mtd: nand: mxc_nand: support software ECC
MIME-Version: 1.0
Message-Id: <20240522-mtd-nand-mxc-nand-exec-op-v4-3-75b611e0ac44@pengutronix.de>
References: <20240522-mtd-nand-mxc-nand-exec-op-v4-0-75b611e0ac44@pengutronix.de>
In-Reply-To: <20240522-mtd-nand-mxc-nand-exec-op-v4-0-75b611e0ac44@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716356396; l=5790;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=8hsIHvnWZEEkivcvCStIVXwcX0bR4VLqPBmUMAb7D6Y=;
 b=xMs7fL+OSmRpD7JYHqoBUo/7yMtL2llPYioVsFPbmV8QMGCf+FfzBfJoMD0ZXq8Ko2W8l5MDc
 ClOvZW4mzmNAuKXqVhoNT0kfEoqsdSKLynAwnfinNAeC650B2wK1Df6
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_224008_931160_E3EBD446 
X-CRM114-Status: GOOD (  25.81  )
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
 drivers/mtd/nand/raw/mxc_nand.c | 102 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index 6f8b8f4b118ec..9d50f41b3d5a1 100644
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
@@ -1472,6 +1474,88 @@ static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
 	return host->devtype_data->setup_interface(chip, chipnr, conf);
 }
 
+static void memff16_toio(void *buf, int n)
+{
+	__iomem u16 *t = buf;
+	int i;
+
+	for (i = 0; i < (n >> 1); i++)
+		__raw_writew(0xffff, t++);
+}
+
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
+	 *
+	 * buf_len can either be the full page including the OOB or user data only.
+	 * When it's user data only make sure that we fill up the rest of the
+	 * SRAM with 0xff.
+	 */
+	for (i = 0; i < no_subpages; i++) {
+		int now = min(buf_len, 512);
+
+		if (now)
+			memcpy16_toio(host->main_area0 + i * 512, buf, now);
+
+		if (now < 512)
+			memff16_toio(host->main_area0 + i * 512 + now, 512 - now);
+
+		buf += 512;
+		buf_len -= now;
+
+		now = min(buf_len, oob_per_subpage);
+		if (now)
+			memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len,
+				      buf, now);
+
+		if (now < oob_per_subpage)
+			memff16_toio(host->spare0 + i * host->devtype_data->spare_len + now,
+				     oob_per_subpage - now);
+
+		buf += oob_per_subpage;
+		buf_len -= now;
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
@@ -1510,7 +1594,10 @@ static int mxcnd_do_exec_op(struct nand_chip *chip,
 			buf_write = instr->ctx.data.buf.out;
 			buf_len = instr->ctx.data.len;
 
-			memcpy32_toio(host->main_area0, buf_write, buf_len);
+			if (chip->ecc.engine_type == NAND_ECC_ENGINE_TYPE_ON_HOST)
+				memcpy32_toio(host->main_area0, buf_write, buf_len);
+			else
+				copy_page_to_sram(mtd, buf_write, buf_len);
 
 			host->devtype_data->send_page(mtd, NFC_INPUT);
 
@@ -1545,10 +1632,15 @@ static int mxcnd_do_exec_op(struct nand_chip *chip,
 
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
