Return-Path: <SRS0=DY/e=VO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CA5C76186
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 08:50:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC19D21743
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Jul 2019 08:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="owgubPw/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="2DpkkxDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC19D21743
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qKaD//SzOmxQzMA1nv9FJgTRJI+JYI4q4nG7aJyAU8I=; b=owgubPw/xQyECv
	4rmZKI+jNiJyPeANf/zq5D0Cggvq+ubjflso6N83YIuU0A38p3lCs1ZZr/2m215+7RDl7t8KGXg0Q
	sfch1G8SZfFO2JBEnH57UQOXRYszvHn+gopz51VOHhrk+YbEtLTYq6MMm6+JTi+FcXKqHzk2ud7e8
	PlidCqMctq60LNya0nRH8gEwmxqxR8Om0ww4hv09lqjW8AGty0pMKmEx+EV+GPX1y/qW3WyFxf441
	bVbySfUv4V522x+oQeI2BkOYc6mDFpR7cMe5PAoZV7E57111bWuREUxsrgLfVFzOB4hG1Q2zd65y4
	2sSYvwVAlX2hDGvDtzNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnfdc-0000vg-PB; Wed, 17 Jul 2019 08:50:12 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnfbm-00052N-J4
 for linux-mtd@lists.infradead.org; Wed, 17 Jul 2019 08:48:20 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: Fu9Ntn1YhpYi0EQhNeLj1beTR0zYwYcWbmMs1OYF7uwpwb8h3stf/aHc7ytj48O3PUdpPwLLwE
 BF0Vn/d6VPy8lrRw2wFPZv2uLXs1GGBGs4n6RvIHCLDIyErSfxEbzl455lOaq2uq4VsXzAcENU
 oOEA0rbcZKSevI0AGimwO3cZjUTTJ84oRG+UYWU6kM4FQrVKlhdyPAxHy3C02fU13lErQn0K/W
 DfWytaCnDd+guGQ/wRAKQg+/YxrNKtcvIjm5nfzPqpl/aQ5YZTfIzBASWUSEbplw+S2eR/AoYu
 2Mg=
X-IronPort-AV: E=Sophos;i="5.64,273,1559545200"; d="scan'208";a="41583175"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jul 2019 01:48:18 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 17 Jul 2019 01:48:17 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 17 Jul 2019 01:48:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ij2D0rTX0kpr7PVsUwiqio5qsWb5iFoOCz0JuwAEaFYu3lZRdpifo02iuEQWKCFOKP2sTdUDydgjHoPV+9zPydHuuNeZ22ws+XHrv1DemwNIEJPvHpA0RjWaLhX75ft4N6tjrpWjm8jbq4AvahN3Md72LId8X4l8mC23OGyfgA40x2QKhVB5Lc8V8C/12ZHS2vgNYFJik3ABjx4Q3K/DjHlb4fol4LZ/bimjHIJKEzU6+Xz3k7DkUrBKOB6FQKQuYN3NQLzGhRO4nOj2x60eng/LI1906eDGoChhZX9ZbickQD63U0oQSJj7MPE1uALLS4Kq3esksGXAKf5xyA33pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je+Z7OwfT4lQyM+J2l0PYNQo6bXb37iAl0bve2qGOG0=;
 b=aKl2nDsMFVrS2XwNWc8XNvuMCLd0OgMRDORFPIyR+3Toh/OlcmGHyVcTU72VdGJRoXR1SpR8BEACIQbhMy6H2P5GfuwVfN1txTL+P49MoE39uIOmfavErCmUqdul1v/fN+L+KJylJLhxz4h20QMmtAWu049JSJu+JHZo7AUonoHfJg2TCRQ/+QkhV+poNtkIqCCmRp7dC1GWV/qOzzBL3wDz0JoJolf/vokJ7BskeSycCuTz2fXp8a2RhQcnhc4YQfJwShXhbFnyHO6dWZcUuy49fED7/D4Q2YpGYbyQbjatMxaalOTQ7g2jB6GfxsJaeOJ89tjbcorGBU13NbRxPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je+Z7OwfT4lQyM+J2l0PYNQo6bXb37iAl0bve2qGOG0=;
 b=2DpkkxDRTSlFNN5pcdnV80c476uD2zipTOF4hDbIrqfffqe5OodQI1xPTsPEYqueyhZRTyAcNZq30xjOOZyZbsqHt+HROI9uBwLd8u8sbjLShPZaehLthNze6XlLY/bHyBWWa+Dq3XZaa/KjMeyVdK7yYwchfhRrEL3Wvn2SBf0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6SPR00MB254.namprd11.prod.outlook.com (10.173.236.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 08:48:16 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::6515:912a:d113:5102%12]) with mapi id 15.20.2073.012; Wed, 17 Jul
 2019 08:48:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <marek.vasut@gmail.com>
Subject: [PATCH 5/5] mtd: spi-nor: add Kconfig option to disable write
 protection at power-up
Thread-Topic: [PATCH 5/5] mtd: spi-nor: add Kconfig option to disable write
 protection at power-up
Thread-Index: AQHVPHxf57xp/vrlsEWVvsFB8NifHg==
Date: Wed, 17 Jul 2019 08:48:16 +0000
Message-ID: <20190717084745.19322-6-tudor.ambarus@microchip.com>
References: <20190717084745.19322-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190717084745.19322-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0085.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::38) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ba4e511-15fb-4a3a-7210-08d70a938254
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6SPR00MB254; 
x-ms-traffictypediagnostic: BN6SPR00MB254:
x-microsoft-antispam-prvs: <BN6SPR00MB254DBA6DB3BFA28067A9873F0C90@BN6SPR00MB254.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(376002)(366004)(346002)(189003)(199004)(66066001)(102836004)(186003)(4326008)(99286004)(52116002)(76176011)(2616005)(486006)(386003)(6436002)(446003)(256004)(26005)(476003)(86362001)(53936002)(107886003)(6506007)(6486002)(66446008)(11346002)(14454004)(14444005)(6512007)(71190400001)(64756008)(71200400001)(25786009)(81156014)(110136005)(2501003)(478600001)(305945005)(7736002)(54906003)(1076003)(2906002)(5660300002)(36756003)(66476007)(81166006)(66556008)(6116002)(8676002)(50226002)(8936002)(316002)(3846002)(66946007)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6SPR00MB254;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LBlos/N6q/di9yX7PAa0WiZYAPZltEZITK54PEsAgDOBLhIJd8udt/lsn3e8z+53QKnI+qNAe61DTOnIMNpzd02wOKV5X2E3Ac7ZW/GB/7eTeIhpZC9sb4bPCLdeXr01lZ4iczPjRGOAHTW157lzY2fhvM4GefiIxyaNzFZ+FVrWDcipwHoJjqE70P8qI3xdCIka0HJGF6OAP8KyFh/6qf7fGFv/5qAjiYZHscmus5pzBK1i2g7rZM0nEeAx07+aLY8pTXdQqYvO9lvJEdwSz2t91c/N5+ZV3wyeY4B26/Xau64uUTMnjFCQJRn8yy99m/Kl5rlW37dEnkCPYJWjzahA4wpC1V+8Bc3AClDsrU7fZKDYh3I8nbQnbDlejgfet0rlPqOnPISbXOm2DypbDbdN8vNTOMOM3kF6cIdGKr8=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba4e511-15fb-4a3a-7210-08d70a938254
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 08:48:16.1006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6SPR00MB254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190717_014818_829388_EDBB570B 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 Nicolas.Ferre@microchip.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Some spi-nor flashes come write protected by default after a
power-on sequence to avoid destructing commands (erase, write)
during power-up.

Backward compatibility imposes to disable the write protection
at power-up by default. Add a Kconfig option to let the user
benefit of the power-up write protection.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/Kconfig   | 8 ++++++++
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 6de83277ce8b..b550e10657f1 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -22,6 +22,14 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 	  Please note that some tools/drivers/filesystems may not work with
 	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
 
+config MTD_SPI_NOR_DISABLE_POWER_UP_WRITE_PROTECTION
+	bool "Disable write protection during power-up"
+	default y
+	help
+	   Some spi-nor flashes are write protected by default after a power-on
+	   reset cycle, in order to avoid inadvertend writes during power-up.
+	   Disable the write protection during power-up.
+
 config SPI_ASPEED_SMC
 	tristate "Aspeed flash controllers in SPI mode"
 	depends on ARCH_ASPEED || COMPILE_TEST
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index ffb53740031c..e5627fa6b1cd 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4049,6 +4049,7 @@ static int spi_nor_init(struct spi_nor *nor)
 {
 	int err;
 
+#ifdef CONFIG_MTD_SPI_NOR_DISABLE_POWER_UP_WRITE_PROTECTION
 	/*
 	 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
 	 * with the software protection bits set.
@@ -4082,6 +4083,7 @@ static int spi_nor_init(struct spi_nor *nor)
 			return err;
 		}
 	}
+#endif
 
 	if (nor->quad_enable) {
 		err = nor->quad_enable(nor);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
