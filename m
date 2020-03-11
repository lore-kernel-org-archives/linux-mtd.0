Return-Path: <SRS0=SuWK=44=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA90C10F27
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 08:40:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76B7B20637
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2020 08:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbLIh9VG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76B7B20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kioxia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=y+tzzYofiVTzz2Dov5IKgBYv4kKgdUjzPS9FZIb27+I=; b=jbL
	Ih9VGeOMUaRarwoKqCXVlUM1nv0c/HCLUc1e9c+Vz3RH4AvZQ05BRL2fcw7QxOwsitIuNfC6HAWlN
	44haeiCP+ydVcOfHeqST6J+/tN0Lx1Hu9OUPHsqqtKUpqWs7Boprp2uu+zeuILRSoGAqvqxQA6acS
	ZNe9uWkHDmHKH3GSpQOhJTZZeVksCUdOydSMUB1SSKjo/4gdVJcSbW7mRy7P6Zx9wJeOQpGlZQvnJ
	MVu9oC6xskkLSl7MOKYD87LyT6hYUaaf30OK/Ti0MyNq+0IBkka3O5g4NDOXRn+Dxqu9ATsXs0Sfq
	6JG3ih6lEa1Zr+2YtWuaAbY9wZnhFdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBwuM-0008JT-Eq; Wed, 11 Mar 2020 08:40:06 +0000
Received: from mo-csw1114.securemx.jp ([210.130.202.156]
 helo=mo-csw.securemx.jp)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBwtJ-0007Fi-Ko
 for linux-mtd@lists.infradead.org; Wed, 11 Mar 2020 08:39:04 +0000
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 02B8crad025431;
 Wed, 11 Mar 2020 17:38:53 +0900
X-Iguazu-Qid: 2wHHmtTgkJK7xepRsv
X-Iguazu-QSIG: v=2; s=0; t=1583915933; q=2wHHmtTgkJK7xepRsv;
 m=CTR+wak4u3Jesv1LiBVCOyGbLEeAwdX18vkpcTjoyac=
Received: from imx2.toshiba.co.jp (imx2.toshiba.co.jp [106.186.93.51])
 by relay.securemx.jp (mx-mr1112) id 02B8cpa7009875;
 Wed, 11 Mar 2020 17:38:52 +0900
Received: from enc01.localdomain ([106.186.93.100])
 by imx2.toshiba.co.jp  with ESMTP id 02B8cpx0011428;
 Wed, 11 Mar 2020 17:38:51 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
 by enc01.localdomain  with ESMTP id 02B8cpsm009597;
 Wed, 11 Mar 2020 17:38:51 +0900
From: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
To: miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: [PATCH v3] mtd: rawnand: toshiba: Support actual bitflips for BENAND
 (Built-in ECC NAND)
Date: Wed, 11 Mar 2020 15:19:43 +0900
X-TSB-HOP: ON
Message-Id: <1583907583-5967-1-git-send-email-ytc-mb-yfuruyama7@kioxia.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_013901_998393_77B3A2D2 
X-CRM114-Status: GOOD (  12.14  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add support vendor specific commands for KIOXIA CORPORATION BENAND.
The actual bitflips number can be get by this command.

Signed-off-by: Yoshio Furuyama <ytc-mb-yfuruyama7@kioxia.com>
---
changelog[v3]:Tested version.
original patch:"[RFC,v2] mtd: nand: toshiba: Add support for ->exec_op()".

 drivers/mtd/nand/raw/nand_toshiba.c | 55 +++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
index 9c03fbb..10fcfbd 100644
--- a/drivers/mtd/nand/raw/nand_toshiba.c
+++ b/drivers/mtd/nand/raw/nand_toshiba.c
@@ -14,14 +14,65 @@
 /* Recommended to rewrite for BENAND */
 #define TOSHIBA_NAND_STATUS_REWRITE_RECOMMENDED	BIT(3)
 
+/* ECC Status Read Command for BENAND */
+#define TOSHIBA_NAND_CMD_ECC_STATUS_READ	0x7A
+
+/* ECC Status Mask for BENAND */
+#define TOSHIBA_NAND_ECC_STATUS_MASK		0x0F
+
+/* Uncorrectable Error for BENAND */
+#define TOSHIBA_NAND_ECC_STATUS_UNCORR		0x0F
+
+static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
+						 u8 *buf)
+{
+	u8 *ecc_status = buf;
+
+	if (nand_has_exec_op(chip)) {
+		const struct nand_sdr_timings *sdr =
+			nand_get_sdr_timings(&chip->data_interface);
+		struct nand_op_instr instrs[] = {
+			NAND_OP_CMD(TOSHIBA_NAND_CMD_ECC_STATUS_READ,
+				    PSEC_TO_NSEC(sdr->tADL_min)),
+			NAND_OP_8BIT_DATA_IN(chip->ecc.steps, ecc_status, 0),
+		};
+		struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
+
+		return nand_exec_op(chip, &op);
+	}
+
+	return -ENOTSUPP;
+}
+
 static int toshiba_nand_benand_eccstatus(struct nand_chip *chip)
 {
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int ret;
 	unsigned int max_bitflips = 0;
-	u8 status;
+	u8 status, ecc_status[8];
 
 	/* Check Status */
+	ret = toshiba_nand_benand_read_eccstatus_op(chip, ecc_status);
+	if (!ret) {
+		unsigned int i, bitflips = 0;
+
+		for (i = 0; i < chip->ecc.steps; i++) {
+			bitflips = ecc_status[i] & TOSHIBA_NAND_ECC_STATUS_MASK;
+			if (bitflips == TOSHIBA_NAND_ECC_STATUS_UNCORR) {
+				mtd->ecc_stats.failed++;
+			} else {
+				mtd->ecc_stats.corrected += bitflips;
+				max_bitflips = max(max_bitflips, bitflips);
+			}
+		}
+
+		return max_bitflips;
+	}
+
+	/*
+	 * Fallback to regular status check if
+	 * toshiba_nand_benand_read_eccstatus_op() failed.
+	 */
 	ret = nand_status_op(chip, &status);
 	if (ret)
 		return ret;
@@ -108,7 +159,7 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
 	 */
 	if (chip->id.len >= 6 && nand_is_slc(chip) &&
 	    (chip->id.data[5] & 0x7) == 0x6 /* 24nm */ &&
-	    !(chip->id.data[4] & 0x80) /* !BENAND */) {
+	    !(chip->id.data[4] & TOSHIBA_NAND_ID4_IS_BENAND) /* !BENAND */) {
 		memorg->oobsize = 32 * memorg->pagesize >> 9;
 		mtd->oobsize = memorg->oobsize;
 	}
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
