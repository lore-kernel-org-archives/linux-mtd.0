Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C93CA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8105420663
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 11:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JZyPQtY7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ERMofXNG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8105420663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuX4Ql8tRS/CB348W9yhUM2yvn6ct1PWRXzcIeb9t4o=; b=JZyPQtY7WRNCsG
	vmhr9mtzJ3T2uGaQn4PFnI8cXOost+b5ZfdwngW+KNJP/U/IribLkmGPJFteMsHh5wEiEwqz5VSV1
	42umkujWU+wAmLk89KXsSiBr+91kn58jL7ZnBkqX+uvHEiJ8N6kQwsA3HfzFebWRbIpVHfGTOfNyW
	r+zwoPzpYA7nhBbgePE6CXxykaqjifz93ZxVpaHKx/ldRg/fSjJR+qA0+QQFcTsB0vsi/vxa58yVQ
	6AuXoJ+hIRspnXrKle/CLY1hzo/ZKyqkp5GxmUdoH1HLJoUB4FTSqV9O98/l+6C0UZBdfoNflKNcv
	u/cyiaLt1LX7q1/X9H3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPPd6-0004NA-Jw; Tue, 29 Oct 2019 11:25:40 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPPVW-0003NF-IE
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 11:17:52 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: jCi4GD5ApmqkOaiy5BjPaU4rBYcYOXo1m9AaCwXesP5NhWPC8wbS65AYlHjZcEcqtC3UqW14Dh
 avdM8s4McnwowERw5FFSjX1oFEw9lao67lKKyF3UZKeqqv7ZmeOJapFhcVM7p7TNfR/6MWOn3W
 iV9pb4xqrnBoynd31z9LYby8tYrO+TS9HX8FJNwbRo1RsD4wkiQSfyzAUNOjTLNfOV3snpGY6V
 5plcY372+dqUmSlZbenRYaO2ibU/5NEB6dRSyx6TAoURJswjjaX7Eo9nmQawyB2MCfUczZtHjP
 J9k=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="53292196"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 04:17:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 04:17:39 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 29 Oct 2019 04:17:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mb9xppAM/pMQkepAQFbur4TmBkBUCuOQtFxq3lIkvunqTFrNImgava7p9bbe5gsrvxTmzqEhCf4PR8cCFbtquTR9ymrGzwGgTyNXSjMV9r/CcOq3wWyxZ/mTyNAxGDCtd47RFxo1T8QqX/iw4xbNPdDvecdN82roCrV8o04aT16Suxf3UBrYMl8ZvCd5Zv4hAQmWp816Jc2Szqk6c4kqOBUwpeBNpt30O2wUJjaMGQa4RqdKUX1dYiymxAaOkG59Lt+iFwHB5pCP0Ob2t6xNzz7o2Re7fXQqOVwbMkI5wD/CnO5r3O4rqdS20E1xWm4IInvHLlgw7I7uA0zfEKCMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFYvhrHwun5qgMDYSC43Z39wQcYQMNFdeaxn1XIulYU=;
 b=DoadZQo6Z4+eaR/z2NFgdAJzOzKeDkrqCx/ozHEz9fkWKNTjaCXRxBJkWbhN8gJFWpQUOGlISVXk+h87kiN/CEHdo4GnkCsMTI7rocsmkSoDUVSPt9eXFaWB8tdE1HrcG74rZdlJwnNpRmaoRm8f0Ke0d8PrOqzelJ6jppNxMtf1d473mjBecEa9dKAsw0zLkdp6BTjLxdaidmU+7ZXv9PIO9SSobO/RLDEQsw/kFgFJbKZcrm0/w0v4stuUgnbxc+ZTPMfB+2NGixk7Eznka7Xj5wUvN5GediaQ6ecH3qpwc6uYUO3+mD1DUlt3j+IApqRqXuwYJZY6xtKUC8BG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFYvhrHwun5qgMDYSC43Z39wQcYQMNFdeaxn1XIulYU=;
 b=ERMofXNGx4cZ8fyFolMFL5Fk6raALmnT+NFX3mlfUu0XM1Ld1GxogCCBHZ7Vdm224LYb+NsFnzrk0iYxxKLr6pQfd1qB4UYmT2x5eBwEEhxqQwX+G2QhgYnYaFsTD+NF1j3GbtGel2AdIZxnEWpHGEhOJSzdtfbNDj2HRJhY1Ic=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3712.namprd11.prod.outlook.com (20.178.253.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Tue, 29 Oct 2019 11:17:39 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 11:17:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: [PATCH v3 31/32] mtd: spi-nor: Prepend "spi_nor_" to
 "sr2_bit7_quad_enable"
Thread-Topic: [PATCH v3 31/32] mtd: spi-nor: Prepend "spi_nor_" to
 "sr2_bit7_quad_enable"
Thread-Index: AQHVjkp5PriR8i3sY02u9tDn4KqjLg==
Date: Tue, 29 Oct 2019 11:17:38 +0000
Message-ID: <20191029111615.3706-32-tudor.ambarus@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0376.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a3::28) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [83.166.207.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4f4f451-8b72-42d1-de92-08d75c619b7e
x-ms-traffictypediagnostic: MN2PR11MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3712A22B520B4CE18D44B291F0610@MN2PR11MB3712.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(136003)(376002)(39860400002)(189003)(199004)(107886003)(6512007)(316002)(110136005)(4326008)(2201001)(305945005)(6436002)(54906003)(7736002)(2906002)(66946007)(66476007)(66556008)(64756008)(66446008)(6116002)(3846002)(6486002)(5660300002)(36756003)(86362001)(11346002)(446003)(8936002)(81156014)(81166006)(50226002)(2616005)(186003)(476003)(256004)(478600001)(8676002)(25786009)(14454004)(486006)(66066001)(2501003)(26005)(99286004)(386003)(76176011)(52116002)(1076003)(102836004)(71200400001)(71190400001)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3712;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UueYN0/tFNcG28/HZ66JtOBOsDxt5T67RVMTYz+roEozf1ve3QHHIXnGiKe2eRYABe3XFdNvwu78qPgyjLHMaWrYq823Ame84psA62HfE8BbzdPqOJkaKJrti6NIDjalLONiM5EBuNBaLUZWNutbBtcFEmwc88tfPI/azWYvp9WIqxAbBICVBWJIJBOXRUTUSXqbnz4QJiPNEBywldfl7xZDzT2abO8PCvJVIXOq0lvSP5uNAYBlfnrqhm18nAxh/xEDZOGjqHPOEE75dk9NB9OZI2FvAyGQNtG5wTJh6voapr/gNViMoSRvR9MY0e5kiVhMWZ62hcPEI5OqYBAeYmjXNT5i3SXTNminCgLO7w6CHC5dZ0nxLepSlb2SUuazXY428pGUZF8KA/zqA63SPIsqyBaNcnw7MYs/9UF8BchbyxjnLER/p14o/SIAvG08
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f4f451-8b72-42d1-de92-08d75c619b7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 11:17:38.8749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i1RwxIP6aN9fBSFh4PjVUVh/EOom3+lEoM6Y5ZDDjSLrmTSj8HnBDv9kcxec3fsJmO+7BbAH1dXZCcn8+IkEin0CmNyU2mVoFSmgEGBOikk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_041750_689649_CD253DD8 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

All SPI NOR generic methods should be prepended by "spi_nor_".

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 47d159959461..87660b101c98 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2129,7 +2129,7 @@ static int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * sr2_bit7_quad_enable() - set QE bit in Status Register 2.
+ * spi_nor_sr2_bit7_quad_enable() - set QE bit in Status Register 2.
  * @nor:	pointer to a 'struct spi_nor'
  *
  * Set the Quad Enable (QE) bit in the Status Register 2.
@@ -2140,7 +2140,7 @@ static int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int sr2_bit7_quad_enable(struct spi_nor *nor)
+static int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
 {
 	u8 *sr2 = nor->bouncebuf;
 	int ret;
@@ -3733,7 +3733,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 
 	case BFPT_DWORD15_QER_SR2_BIT7:
 		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
-		params->quad_enable = sr2_bit7_quad_enable;
+		params->quad_enable = spi_nor_sr2_bit7_quad_enable;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1:
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
