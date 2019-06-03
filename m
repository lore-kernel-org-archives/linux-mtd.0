Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDFCC04AB5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:45:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D882810B
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 12:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTdZ6JbX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="vIeTvY32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D882810B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mHTHCI+4iV0hQZeqLLKIz0Ox9SRQqaNK2B6TpGTxzYA=; b=DTdZ6JbXZFRMjG
	wny1Cg7GLGHa/SpZaPtVBkdIO+ml+Ky7qPtYgmSjumDhoyLaSLdQPpkd8OAz9KfJDCMrfT3HrWxN/
	sEkWWrsyWNPjR8kL1S5atEwHmmARolclb79reDRnVkjM8tvm7IGFxYTCJU01FvdL6bzAGQUGRKx4T
	0mWrEjzWJInpYJD3Brb7Fjs5GKDWQcGEyZgIMY4RQwDx7HmutQjKdUGzc5ufdqzvTG6rXevikuDgx
	7GszNVgxpJ5yZX/1KjQSOQEnkkIK5UH/KubKg9+oFGAfOQXVYkN5nGGsWI+NtRfN+xRd9UKz125lR
	NUUrxCnJyQ03gE5UvWYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXmKu-00079a-Qi; Mon, 03 Jun 2019 12:45:12 +0000
Received: from mail-eopbgr750057.outbound.protection.outlook.com
 ([40.107.75.57] helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXmJz-00047x-PR
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 12:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbHAcf+LHBvnC1NtHAHv5kNYrvHSrh0Evik85s8nSIg=;
 b=vIeTvY32HQd0Cdoj4uiSIp5xmwQa6r2LB1Q7uErmFtCWyxDSrtaKme3Y4SppUWoIsO+VtdKfnE0Ge+cxHv15cToscv+wQasPRlpyMyoEqz5IgYlghY74XUloMnfUD1M0slBA3LDy5XR1ShANBSxDR3r+2iLgtBVEZsnUaL4sYYU=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5872.namprd08.prod.outlook.com (20.179.86.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Mon, 3 Jun 2019 12:43:35 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23%7]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 12:43:35 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>, Yixun
 Lan <yixun.lan@amlogic.com>, Lucas Stach <dev@lynxeye.de>, Anders Roxell
 <anders.roxell@linaro.org>, Stefan Agner <stefan@agner.ch>, Marcel Ziswiler
 <marcel.ziswiler@toradex.com>, "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Paul Cercueil <paul@crapouillou.net>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Chuanhong Guo <gch981213@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 07/12] mtd: spinand: turn SPI NAND to support parameter
 page detection
Thread-Topic: [PATCH v3 07/12] mtd: spinand: turn SPI NAND to support
 parameter page detection
Thread-Index: AdUaBZEnl1jU+7xBQUOxHRT5yHw9jA==
Date: Mon, 3 Jun 2019 12:43:35 +0000
Message-ID: <MN2PR08MB5951A490A0252C9DD038EA00B8140@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2782c52c-a4df-4d26-833e-08d6e82117e8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR08MB5872; 
x-ms-traffictypediagnostic: MN2PR08MB5872:|MN2PR08MB5872:
x-microsoft-antispam-prvs: <MN2PR08MB5872A154232BD58BC451D1AAB8140@MN2PR08MB5872.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(1496009)(396003)(376002)(136003)(346002)(39860400002)(366004)(189003)(199004)(76116006)(14454004)(99286004)(7696005)(71200400001)(71190400001)(66446008)(5660300002)(9686003)(52536014)(73956011)(66946007)(66476007)(66066001)(66556008)(64756008)(2201001)(55236004)(6116002)(478600001)(316002)(102836004)(110136005)(2906002)(3846002)(6506007)(86362001)(7416002)(53936002)(486006)(26005)(2501003)(8936002)(476003)(33656002)(14444005)(256004)(8676002)(74316002)(81166006)(81156014)(6436002)(68736007)(7736002)(305945005)(186003)(25786009)(55016002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5872;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IYA2IUj11LscvEmTBtAB6haVhhrx/N+zI3UOSmiRFAr94YQK+85APY1J6blKEVErXQcAC8awetpdKNczsYH8Bao4fW9QgTw2PylhbJ+D4BoYAc+cL4RXD891Ni+PnCCtO2h4tRuM730sGy2+HG1pUYHEcyrETqKoVPkBj/YeahTE2yW8U1ESCYTmk+rINuEUtpmTrh63Sl/o9nHZ0am85MPcLL2Ka6HCRHn1D5wfShJHqzhlKH2BefDqT6r/aQy2fgjJONAKaSM4NhOi0nAKTQu+JIOF3i9WPMoDEeTf6b7/rv9STi9OmrKOEynpttH37iAqVa6O5Pxqp1JfFuStj9q1ujcH5BvIivk74F2ytZmwF7tvSeHG+0WZ3jPH1q3Kb9IcsYeAV9msdvuLtgWTfWUa+0qMHWl4F3xjRTyEP44=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2782c52c-a4df-4d26-833e-08d6e82117e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 12:43:35.0483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshivamurthy@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5872
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_054416_404246_57208CF3 
X-CRM114-Status: GOOD (  13.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

Instantiate onfi_helper object for SPI NAND.
Enable SPI NAND core to detect SPI NANDs with parameter page.

Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
---
 drivers/mtd/nand/spi/core.c | 103 ++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 4c15bb58c623..b031c4a2cdf9 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -400,6 +400,100 @@ static int spinand_lock_block(struct spinand_device *spinand, u8 lock)
 	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
 }
 
+/**
+ * spinand_read_param_page_op - Read parameter page operation
+ * @base: the nand device
+ * @page: page number where parameter page tables can be found
+ * @buf: buffer used to store the parameter page
+ * @len: length of the buffer
+ *
+ * Read parameter page
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ */
+static int spinand_parameter_page_read(struct nand_device *base,
+				       u8 page, void *buf, unsigned int len)
+{
+	struct spinand_device *spinand = nand_to_spinand(base);
+	struct spi_mem_op pread_op = SPINAND_PAGE_READ_OP(page);
+	struct spi_mem_op pread_cache_op =
+				SPINAND_PAGE_READ_FROM_CACHE_OP(false,
+								0,
+								1,
+								buf,
+								len);
+	u8 feature;
+	u8 status;
+	int ret;
+
+	if (len && !buf)
+		return -EINVAL;
+
+	ret = spinand_read_reg_op(spinand, REG_CFG,
+				  &feature);
+	if (ret)
+		return ret;
+
+	/* CFG_OTP_ENABLE is used to enable parameter page access */
+	feature |= CFG_OTP_ENABLE;
+
+	spinand_write_reg_op(spinand, REG_CFG, feature);
+
+	ret = spi_mem_exec_op(spinand->spimem, &pread_op);
+	if (ret)
+		return ret;
+
+	ret = spinand_wait(spinand, &status);
+	if (ret < 0)
+		return ret;
+
+	ret = spi_mem_exec_op(spinand->spimem, &pread_cache_op);
+	if (ret)
+		return ret;
+
+	ret = spinand_read_reg_op(spinand, REG_CFG,
+				  &feature);
+	if (ret)
+		return ret;
+
+	feature &= ~CFG_OTP_ENABLE;
+
+	spinand_write_reg_op(spinand, REG_CFG, feature);
+
+	return 0;
+}
+
+static int check_version(struct nand_device *base,
+			 struct nand_onfi_params *p, int *onfi_version)
+{
+	/*
+	 * SPI NANDs do not necessarily support ONFI standard,
+	 * but, parameter page looks the same as an ONFI table.
+	 */
+	if (!le16_to_cpu(p->revision))
+		*onfi_version = 0;
+
+	return 0;
+}
+
+static int spinand_intf_data(struct nand_device *base,
+			     struct nand_onfi_params *p)
+{
+	return 0;
+}
+
+static int spinand_param_page_detect(struct spinand_device *spinand)
+{
+	struct nand_device *base = spinand_to_nand(spinand);
+
+	base->helper.page = 0x01;
+	base->helper.check_revision = check_version;
+	base->helper.parameter_page_read = spinand_parameter_page_read;
+	base->helper.init_intf_data = spinand_intf_data;
+
+	return nand_onfi_detect(base);
+}
+
 static int spinand_check_ecc_status(struct spinand_device *spinand, u8 status)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
@@ -910,6 +1004,15 @@ static int spinand_detect(struct spinand_device *spinand)
 		return ret;
 	}
 
+	if (!spinand->base.memorg.pagesize) {
+		ret = spinand_param_page_detect(spinand);
+		if (ret <= 0) {
+			dev_err(dev, "no parameter page for %*phN\n",
+				SPINAND_MAX_ID_LEN, spinand->id.data);
+			return -ENODEV;
+		}
+	}
+
 	if (nand->memorg.ntargets > 1 && !spinand->select_target) {
 		dev_err(dev,
 			"SPI NANDs with more than one die must implement ->select_target()\n");
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
