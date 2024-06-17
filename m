Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419FEC2BA15
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlkNGhhiJ1iXkXG83grdBWcFEm3Ev5eeAgbogszQRpI=; b=bTlctiIGO1koVt
	b2SQvqDKQwKy77sXRj1nhZR+Lsk7ThkPPOUBZzJnfTGqO2/BCkZOgCAFJGzgxM5Hz5yihPTaSIBdn
	AIUOHOOnIoN5T2UWdmjIuaJtlzr5CqlEXBi4b3yNaWGYlz0c1I12z8py7LHt0Il6+JaAR2z411L9z
	+Ez1TTKx22H2TJIKYmJAVMIw1Wb+Gt3DmU+0OndxbY6Wk26NAVgv2PW8PVJcEBLNVPsIwSxDr/Ot0
	Kk4VQ0RUmgdRKbsuazI8aEf6r4AYXcPHdiffXAfwJuB7Hf2pUMEThdAWl96DnWAtIvaMauPk4V4Nz
	J8KvG8tbyyzkawitFmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCWF-0000000Asg0-1hG1;
	Mon, 17 Jun 2024 13:35:35 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCW8-0000000Asag-3K3U
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jun 2024 13:35:30 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id A5BDA10000B;
	Mon, 17 Jun 2024 16:35:23 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru A5BDA10000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1718631323;
	bh=YcHG6WWlH0ElSTuFNLEX2yBk3OYum4OtJYp6S6fudRY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=oox7kvXCIibITAlHTmBPP+PQgiGmN+ytwo7GRD1FAakArfLHnuuCIONgRs7OnI5cb
	 VKlgm6mTm0dfolhKJSvHLPdacW5HP9LsnV2gn3a+BXoIse8ooynrr4Bn6rVhuIlfhT
	 3eVYhBQpky9ptqMS9r8txCdeeoZq/2O2MXxBnpSUoLg8RSiguji0/gK2cYV3/cNtNE
	 mtAK+9xaZH6kdtEFR4JvdOdYc16ikFCAPpw+E6djeq/3cWLaZs3dIdOoIkydH8rhUU
	 rVOX/PYk5QExj5eXwC6vPOYQ+V3om3sq5LgsDaWRoT7Nk5o8ImYhxEfjQ0puNXtUy1
	 DlJNAdGsXuheg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Mon, 17 Jun 2024 16:35:23 +0300 (MSK)
Received: from CAB-WSD-0004828.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 17 Jun 2024 16:35:23 +0300
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Michael Walle <michael@walle.cc>, Mark
 Brown <broonie@kernel.org>, Chia-Lin Kao <acelan.kao@canonical.com>, Md Sadre
 Alam <quic_mdalam@quicinc.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Martin Kurbanov <mmkurbanov@salutedevices.com>
Subject: [PATCH v1 5/5] mtd: spinand: esmt: OTP access for F50{L,D}1G41LB
Date: Mon, 17 Jun 2024 16:34:57 +0300
Message-ID: <20240617133504.179705-6-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240617133504.179705-1-mmkurbanov@salutedevices.com>
References: <20240617133504.179705-1-mmkurbanov@salutedevices.com>
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185966 [Jun 17 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;100.64.160.123:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/17 11:22:00 #25639124
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_063529_230131_F14E5D91 
X-CRM114-Status: GOOD (  15.00  )
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

Support for OTP area access on ESMT F50L1G41LB and F50D1G41LB chips.

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 drivers/mtd/nand/spi/esmt.c | 69 +++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 4597a82de23a4..1806e9d48c176 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -12,6 +12,13 @@
 /* ESMT uses GigaDevice 0xc8 JECDEC ID on some SPI NANDs */
 #define SPINAND_MFR_ESMT_C8			0xc8
 
+#define ESMT_F50L1G41LB_CFG_OTP_PROTECT		BIT(7)
+#define ESMT_F50L1G41LB_CFG_OTP_LOCK		\
+	(CFG_OTP_ENABLE | ESMT_F50L1G41LB_CFG_OTP_PROTECT)
+
+#define ESMT_F50L1G41LB_PAGE_SIZE		2112
+#define ESMT_F50L1G41LB_OTP_PAGES		28
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 			   SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1, NULL, 0),
 			   SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1, NULL, 0),
@@ -102,6 +109,60 @@ static const struct mtd_ooblayout_ops f50l1g41lb_ooblayout = {
 	.free = f50l1g41lb_ooblayout_free,
 };
 
+static int f50l1g41lb_otp_info(struct spinand_device *spinand, size_t len,
+			       struct otp_info *buf, size_t *retlen)
+{
+	if (len < sizeof(*buf))
+		return -EINVAL;
+
+	buf->locked = 0;
+	buf->start = 0;
+	buf->length = ESMT_F50L1G41LB_PAGE_SIZE * ESMT_F50L1G41LB_OTP_PAGES;
+
+	*retlen = sizeof(*buf);
+	return 0;
+}
+
+static int f50l1g41lb_otp_lock(struct spinand_device *spinand, loff_t from,
+			       size_t len)
+{
+	struct spi_mem_op write_op = SPINAND_WR_EN_DIS_OP(true);
+	struct spi_mem_op exec_op = SPINAND_PROG_EXEC_OP(0);
+	int ret;
+
+	ret = spinand_upd_cfg(spinand, ESMT_F50L1G41LB_CFG_OTP_LOCK,
+			      ESMT_F50L1G41LB_CFG_OTP_LOCK);
+	if (!ret)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &write_op);
+	if (!ret)
+		goto out;
+
+	ret = spi_mem_exec_op(spinand->spimem, &exec_op);
+	if (!ret)
+		goto out;
+
+	ret = spinand_wait(spinand, 10, 5, NULL);
+	if (!ret)
+		goto out;
+
+out:
+	if (spinand_upd_cfg(spinand, ESMT_F50L1G41LB_CFG_OTP_LOCK, 0)) {
+		WARN(1, "Can not disable OTP mode\n");
+		ret = -EIO;
+	}
+
+	return ret;
+}
+
+static const struct spinand_otp_ops f50l1g41lb_otp_ops = {
+	.info = f50l1g41lb_otp_info,
+	.lock = f50l1g41lb_otp_lock,
+	.read = spinand_otp_read,
+	.write = spinand_otp_write,
+};
+
 static const struct spinand_info esmt_c8_spinand_table[] = {
 	SPINAND_INFO("F50L1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x01, 0x7f,
@@ -112,7 +173,9 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL),
+		     SPINAND_OTP_INFO(ESMT_F50L1G41LB_OTP_PAGES,
+				      &f50l1g41lb_otp_ops)),
 	SPINAND_INFO("F50D1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x11, 0x7f,
 				0x7f, 0x7f),
@@ -122,7 +185,9 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL),
+		     SPINAND_OTP_INFO(ESMT_F50L1G41LB_OTP_PAGES,
+				      &f50l1g41lb_otp_ops)),
 	SPINAND_INFO("F50D2G41KA",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x51, 0x7f,
 				0x7f, 0x7f),
-- 
2.43.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
