Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B363C88E59
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 18:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvYvgGG3z8didrGUliqYO07MgGqCRDWy1+M6eg3Jd0o=; b=qzfmJ3K1M58OU3
	ZZufLPFdLxly8Inq3v1OvKIZvZ9cva6fAFO7YTCrG+2ksc6ePYuGOHrCI0Ts1iQwror3ZAr+QS+MK
	XhlnzYqlAqqtRXLAes/4zXu3cRZAP+TjleeckjmPlj8J8B4Dfy/jEiWfGbA7R44BWIny5eViWJrfu
	xx9+3oWdT0PIU08lKo6KNEvbtio8PcVRisLZkpCWYpgJgNrprwJN6xEqPoNv8m952YPiT1sb7Jug/
	jvWalhyxGGVAhga/Y9eJYD5Gg2YxwWjsZIwk1rPpohDIeYzGCWKgVNz5Z05lVNqqm+TvBXGN8bs3E
	Ghayrg/xOIB8vXF8hX1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56F4-0000000HT0l-2FnF;
	Fri, 11 Sep 2026 18:44:54 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56F1-0000000HSzx-18Lq
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 18:44:52 +0000
DKIM-Signature: a=rsa-sha256; b=JpgbrNCeSQJBslh55Wk08xA5t9JT6G7+2iKRF09Hd+iX9MZVTpqU03GGjOf3OrwJV6rlRQIUYaO8r4y3ZboOj5FIK3CrPqA0ZQ4OWNOLmioH/tFi7jWQvw18vNJluwbW7kym1zyqImrRkf3SASnpVmdto/Elv//sjw8G6jtSSVz7TBvy7dg7OgvrFGdI83/kjg7+ROAlSgG6lRktRN19hPIyYLXzTjnTj/ZgkMj74P+IxSlZTpsvJaOToSLv6aRoRBSJ8Ki4Has1F3l2RV1t9897O+OXbFZESPF1w09sPrIa3yH/uqhHjqWlfF/8vOq9qlNzpgqrxCAJaGtcVzvrbw==; s=purelymail1; d=c127.dev; v=1; bh=evRXY1mk5e/9hRx/q9vBneumWgfTsFpYy53xJcSfcZs=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=QjbhosZZiZABYiEvmMoAGwKXFzDrVx0xFKjSg7XEXUepn8k4P6d8vaPL5YpcYE96uGjPKyUO1TNqj4Z4i3vaS5jztnM94GbbyrcLeviMy0w6lPoSiBSktM6zgJlRCEF13qgeWKkr3ooO75Mqq0aqRwnq+gyHKhDyr3iC0GJSTdOV/5yYya7WcW8Jep19PlOOqnowEKTnVGDN9vW5U9hRzLU0aQ5lzrHcp5c30BAMpyW76L2L5ijpQTeVnhqtVcG8euzCIn7bJx03GAAiaO559Bjv9daCe19Zfjuq173t/3t3NaDi5ChQWC6E0K7Y+XWanUEWc4si6KRcodvt85Io9g==; s=purelymail1; d=purelymail.com; v=1; bh=evRXY1mk5e/9hRx/q9vBneumWgfTsFpYy53xJcSfcZs=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 1017243:43747:null:purelymail
X-Pm-Original-To: linux-mtd@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -894114220;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 11 Sep 2026 18:44:24 +0000 (UTC)
From: Johan Alvarado <contact@c127.dev>
To: broonie@kernel.org,
	md.alam@oss.qualcomm.com
Cc: konradybcio@kernel.org,
	pengpeng@iscas.ac.cn,
	miquel.raynal@bootlin.com,
	j4g8y7@gmail.com,
	quic_varada@quicinc.com,
	quic_srichara@quicinc.com,
	linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Alvarado <contact@c127.dev>
Subject: [PATCH v2 2/2] spi: spi-qpic-snand: drop the redundant ECC context handling
Date: Fri, 11 Sep 2026 13:44:16 -0500
Message-ID: <20260911184416.109790-3-contact@c127.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911184416.109790-1-contact@c127.dev>
References: <20260911184416.109790-1-contact@c127.dev>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_114451_375024_90531EA1 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

qcom_spi_ecc_init_ctx_pipelined() now publishes the ECC context to
snandc->qspi->ecc, so the assignment in
qcom_spi_ecc_prepare_io_req_pipelined() repeats what the pointer already
holds, and the zeroed struct qpic_ecc that qcom_spi_probe() allocates is
never read.

The pointer is non-NULL only between context creation and destruction,
and every reader runs inside that window. The ooblayout callbacks are
installed by init_ctx. The page read, write and program helpers run only
when prepare_io_req has set page_rw or oob_rw. qcom_spi_block_erase()
runs only while the mtd is registered, which happens after init_ctx and
ends before cleanup_ctx. The controller drives a single chip select, so
the per-controller pointer and the per-chip context cannot disagree.

Remove both. No functional change.

Suggested-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Johan Alvarado <contact@c127.dev>
---
Tested on a Mercusys MR80X (IPQ5018, ESMT F50D1G41LB) with both patches
backported to 6.18.44. Five boots, rootfs mounted every time, mtd
reported 0 ECC failures and 0 corrected bits, and a 4 MiB file on the
UBIFS overlay kept its sha256 across the reboots. Overlay churn raised
the UBI maximum erase counter from 13 to 15, so qcom_spi_block_erase()
ran repeatedly. Build-tested on this base with W=1 and sparse, no
warnings, patch 1 alone and both patches applied.

 drivers/spi/spi-qpic-snand.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 20045d4a46fa..760ee1c29402 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -437,9 +437,7 @@ static int qcom_spi_ecc_prepare_io_req_pipelined(struct nand_device *nand,
 						 struct nand_page_io_req *req)
 {
 	struct qcom_nand_controller *snandc = nand_to_qcom_snand(nand);
-	struct qpic_ecc *ecc_cfg = nand_to_ecc_ctx(nand);
 
-	snandc->qspi->ecc = ecc_cfg;
 	snandc->qspi->raw_rw = false;
 	snandc->qspi->oob_rw = false;
 	snandc->qspi->page_rw = false;
@@ -1586,14 +1584,9 @@ static int qcom_spi_probe(struct platform_device *pdev)
 	struct spi_controller *ctlr;
 	struct qcom_nand_controller *snandc;
 	struct qpic_spi_nand *qspi;
-	struct qpic_ecc *ecc;
 	struct resource *res;
 	int ret;
 
-	ecc = devm_kzalloc(dev, sizeof(*ecc), GFP_KERNEL);
-	if (!ecc)
-		return -ENOMEM;
-
 	qspi = devm_kzalloc(dev, sizeof(*qspi), GFP_KERNEL);
 	if (!qspi)
 		return -ENOMEM;
@@ -1613,7 +1606,6 @@ static int qcom_spi_probe(struct platform_device *pdev)
 	snandc->dev = dev;
 	snandc->qspi = qspi;
 	snandc->qspi->ctlr = ctlr;
-	snandc->qspi->ecc = ecc;
 
 	snandc->props = of_device_get_match_data(dev);
 	if (!snandc->props) {
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
