Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EE2C4CECD
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 16:06:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3B602171F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 16:06:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZpLFwPd/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="aUFj2HNj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3B602171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6rLsYkRdi+k+IbuwY1p6JY1390sYc1Q6aUzfuhNCVo=; b=ZpLFwPd/W1jlu/
	BNMd3s0+XNhEjj/OkF1OzzIKFUI8yx0RF7HUonKruA8KOryEd/+DROOC1+TVJup2caH1N6g2h3YtQ
	CRyn+aXMFeEwpo066aFyRPzBqW8O/mZIZsfIfoC6p/N9BckJNGfLvjzF5P7dU5D21ndCt0mkbjmRw
	xJSp+yZ0oWnine/+ZBNY2iqCdMSyEfOFPlisIh5KJJgFDO3HJvipALoLMhJzGKalHShLRzeC47C+2
	kSZ8XXl8BJrXX9HcmycaXVnrm5EzMWTMuP25oNjubTCm8N2VjUJAfOs6nDgXsMRYr3kZmiIJ8PKE4
	VQumQkGkcnQXi35fUo+Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAFzn-0002Qr-7C; Tue, 17 Sep 2019 16:06:27 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAFpO-00084B-5Z; Tue, 17 Sep 2019 15:55:47 +0000
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
IronPort-SDR: 0bP76eAWU6I9XGQZ3RyDnJxDzb7Utkd/VMRV04azvJvHZOVv4DPjBl87eu+nLUezZZqubWXsp6
 2W3s7FkpmvWTEZM8AjeV1wL1kAWGcVrxC6dId/jWJlh/7Gy6HeLZvU5DJLAKjIpzscRcDIM38E
 amd3iOUC2xhTjck1G/Wsjwpdq40OlfV8KW8iUels9cIOpm1jwBEQS5pibNdf0gVCmunY7QU5dV
 iDalbejg+EdNCs0Scdx+aXrFglaiY8L4049/OYLpc1KHTG9TZ1drFhemN4qCchoAqv9Nz2oyzp
 030=
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; d="scan'208";a="47827253"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Sep 2019 08:55:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Sep 2019 08:55:33 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 17 Sep 2019 08:55:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enqzrWdDFCPgUhQavqDa2oVtUoDKi2VSL6DcGQmM29ONy1Y5JomLSganouWaVpI8WuMbucdGgt/bl4NUHN7ljFyacdgxXzlAqVKFpYJK0Yib+DUtIHmuZFTYc35iVbFi/n110mO1S80HqIAE9R+NJckziJR6ME9F2byH2KL/MJRNHKrCpOemP4T+oyoxVFlcl5EggiDV80qdO9JIu5L6uXLtGbUfTIJW7keJV2tzwAzMrLrNDIpIzV0+PZRYCPg9q0f8ibugoPu2l8JplhayI77AO9zl7AWnLLTxDXd6vvPq3kLUlDHR4TWUoZVWIOn0SuV6cDw5MGoU8adovURalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp04pQe83zyL6eJLDIQ1+/g6vDUYUlreHoffNQJ/GRM=;
 b=EB7Yo8pMnaN37zmXAxpb3CYHQqgJsN3bvYEiug2Oyi2e8tV6XjlHisT88R8HGdVspzCOjMX3F3sen2xu1ojeIxTl9QXtC0amVia6fO09ZP7xZ0o+H2LDFuvuex76plqkDu/92wIElroaoEvhMVr+1WP1O2qdM+7x5bKE2Sd7J1Axf0rVh1xMrfqLVQKRcS4Z16awk6s5PBIyu30OtzeK+aP1Ooyx+F6iwYLs7KCurzek4NA5Ke+vzYuRW6lYBJb7pihYWc71FFn2cngIPeU5R79YATMPhD1szJGrPYMgfs/jNHAaIKkkGDDHMKUlsAv199K/ZOKEgeR8M6rwnvNB0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qp04pQe83zyL6eJLDIQ1+/g6vDUYUlreHoffNQJ/GRM=;
 b=aUFj2HNjX8mNTNTX55p3mXPfaiS1BZuqHI1zd74l2uzIw/YHpCMa1qei3BzDRXeq0WEYEwye0p19I1ZJwQFcTUNxeFsjbXhtJDi6bBICEoch8ERlx63QXT5Y5liPf0Z37VOIpvAq/Fo/tdnOKKkjLU690abJJwCGwcFwitgmZM8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3725.namprd11.prod.outlook.com (20.178.253.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Tue, 17 Sep 2019 15:55:29 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:55:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 15/23] mtd: spi-nor: Drop spansion_quad_enable()
Thread-Topic: [PATCH 15/23] mtd: spi-nor: Drop spansion_quad_enable()
Thread-Index: AQHVbXBUqv6ofYtbZUGORBOPLMfTVg==
Date: Tue, 17 Sep 2019 15:55:29 +0000
Message-ID: <20190917155426.7432-16-tudor.ambarus@microchip.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0007.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::17) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af1bcc92-0c8d-49a4-f422-08d73b877670
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3725; 
x-ms-traffictypediagnostic: MN2PR11MB3725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB372501B15DBBC1A3EF6FB020F08F0@MN2PR11MB3725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(76176011)(52116002)(5660300002)(71190400001)(2616005)(6486002)(6512007)(476003)(11346002)(81166006)(6436002)(66556008)(386003)(6506007)(26005)(66446008)(66946007)(64756008)(186003)(66476007)(102836004)(316002)(446003)(2201001)(110136005)(54906003)(8936002)(107886003)(478600001)(50226002)(25786009)(2906002)(86362001)(81156014)(2501003)(6116002)(3846002)(256004)(305945005)(7736002)(7416002)(99286004)(36756003)(66066001)(14454004)(8676002)(71200400001)(4326008)(1076003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3725;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KPfV3iLZXbdGzhgWTHElvrqfzWJbmCKW5HTxK14+301Aax4HrjjGxCZynFXQROWTNeseNCx53xPL+XRq9rMzynzyXd0aOw5z9i8aMDLjJknZlgPo4dwrhzXPwX7O8M3vWhOZZGKaJAnAMvrcO+/MrGMUKJ1/pNToCwSzP66NbH+6aaQPpaTaXEjJu5EocDQCO7KSMpJdlq+3DBBrHf0+hddyzTRmZl24ZOKaKgDwo2J70gPSn3whhVTlYMOiPeJFcKHZKUbArSEQZcQkLB9BEqN0gRDP+A60OZTK5YdPVx4pLr03BGE0n6R9lat6tfhnwtYX8s2T6nbkPM8Rw4Q7ctnK79DMtJ+AiW8nSNSwdL701C80Gy8PGU0dew/STP7zee+t/Xkpms+JiypIwd4ojYGL/TLJ15XhwbT/WQJ84Kc=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: af1bcc92-0c8d-49a4-f422-08d73b877670
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:55:29.3220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdkXPHE7kOJ2m700WPC/hFn3tKzScY3xuY/NEDp40YTOc5w+fn6r8SzGEK7+u261RE0CmVSB2WfsP45nDl/xx/zzchms9HnIVSxQF0k87EA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_085544_269940_D9786C4F 
X-CRM114-Status: GOOD (  15.50  )
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
Cc: linux-aspeed@lists.ozlabs.org, Tudor.Ambarus@microchip.com, andrew@aj.id.au,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux-mediatek@lists.infradead.org,
 joel@jms.id.au, matthias.bgg@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Drop the default spansion_quad_enable() method and replace it with
spansion_read_cr_quad_enable().

The function was buggy, it didn't care about the previous values
of the Status and Configuration Registers. spansion_read_cr_quad_enable()
is a Read-Modify-Write-Check function that keeps track of what were
the previous values of the Status and Configuration Registers.

In terms of instruction types sent to the flash, the only difference
between the spansion_quad_enable() and spansion_read_cr_quad_enable()
is that the later calls spi_nor_read_sr(). We can safely assume that all
flashes support spi_nor_read_sr(), because all flashes call it in
spi_nor_sr_ready(). The transition from spansion_quad_enable() to
spansion_read_cr_quad_enable() will not affect anybody, drop the buggy
code.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 58 ++++---------------------------------------
 1 file changed, 5 insertions(+), 53 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3e4691b6522d..20d32b7db268 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1869,54 +1869,6 @@ static int macronix_quad_enable(struct spi_nor *nor)
 }
 
 /**
- * spansion_quad_enable() - set QE bit in Configuraiton Register.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Configuration Register.
- * This function is kept for legacy purpose because it has been used for a
- * long time without anybody complaining but it should be considered as
- * deprecated and maybe buggy.
- * First, this function doesn't care about the previous values of the Status
- * and Configuration Registers when it sets the QE bit (bit 1) in the
- * Configuration Register: all other bits are cleared, which may have unwanted
- * side effects like removing some block protections.
- * Secondly, it uses the Read Configuration Register (35h) instruction though
- * some very old and few memories don't support this instruction. If a pull-up
- * resistor is present on the MISO/IO1 line, we might still be able to pass the
- * "read back" test because the QSPI memory doesn't recognize the command,
- * so leaves the MISO/IO1 line state unchanged, hence spi_nor_read_cr(nor, cr)
- * gets the 0xFF value.
- *
- * bit 1 of the Configuration Register is the QE bit for Spansion like QSPI
- * memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spansion_quad_enable(struct spi_nor *nor)
-{
-	u8 *sr_cr = nor->bouncebuf;
-	int ret;
-
-	sr_cr[0] = 0;
-	sr_cr[1] = CR_QUAD_EN_SPAN;
-	ret = spi_nor_write_sr(nor, sr_cr, 2);
-	if (ret)
-		return ret;
-
-	/* read back and check it */
-	ret = spi_nor_read_cr(nor, &nor->bouncebuf[0]);
-	if (ret)
-		return ret;
-
-	if (!(nor->bouncebuf[0] & CR_QUAD_EN_SPAN)) {
-		dev_err(nor->dev, "Spansion Quad bit not set\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-/**
  * spansion_no_read_cr_quad_enable() - set QE bit in Configuration Register.
  * @nor:	pointer to a 'struct spi_nor'
  *
@@ -2071,9 +2023,9 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
  *
  * Read-modify-write function that clears the Block Protection bits from the
  * Status Register without affecting other bits. The function is tightly
- * coupled with the spansion_quad_enable() function. Both assume that the Write
- * Register with 16 bits, together with the Read Configuration Register (35h)
- * instructions are supported.
+ * coupled with the spansion_read_cr_quad_enable() function. Both assume that
+ * the Write Register with 16 bits, together with the Read Configuration
+ * Register (35h) instructions are supported.
  *
  * Return: 0 on success, -errno otherwise.
  */
@@ -4560,7 +4512,7 @@ static void spi_nor_info_init_flash_params(struct spi_nor *nor)
 	u8 i, erase_mask;
 
 	/* Initialize legacy flash parameters and settings. */
-	flash->quad_enable = spansion_quad_enable;
+	flash->quad_enable = spansion_read_cr_quad_enable;
 	flash->set_4byte = spansion_set_4byte;
 	flash->setup = spi_nor_default_setup;
 
@@ -4776,7 +4728,7 @@ static int spi_nor_init(struct spi_nor *nor)
 	int err;
 
 	if (nor->clear_sr_bp) {
-		if (nor->flash.quad_enable == spansion_quad_enable)
+		if (nor->flash.quad_enable == spansion_read_cr_quad_enable)
 			nor->clear_sr_bp = spi_nor_spansion_clear_sr_bp;
 
 		err = nor->clear_sr_bp(nor);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
