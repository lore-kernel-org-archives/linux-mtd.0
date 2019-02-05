Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285CFC282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 17:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED4EC20821
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 17:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="glW01PXo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="X6DIpDiP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED4EC20821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDK937xWCKZY90tmGny5HUK0PqH7T92mT9jdO27dhDM=; b=glW01PXoU8xYUr
	yd12ASyNrq3DfwbsniYD3bPbWobdYwDFGJi0sooZDYCHgdp7tQeau7mVf/+sV0LuKy7UTK7fFqhqQ
	WEw4KaYyBLuSr3evux6os20G924jMwbtMCec2CeDGp4j6WyUD5BQWlipth1WUcW4t+42Q1t6MEZkH
	oh3d3uUE296vcbFTswO5oV7ZNOvbF9j4s/O2nnofXXHVo3WP1ltyu5qfTfymgKqfyUwcNSozYb9tK
	8zl/LIgUZFv1nlFpgL73b0w6QQ6APM5PRA33jdHjSj3vGtawqRrOcHAPEXOEsNNv51snkFWpe9HAG
	YpW4beM98QoQdeqp3h1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr4fP-0008Hx-Ui; Tue, 05 Feb 2019 17:37:51 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr4b6-0002bj-7p; Tue, 05 Feb 2019 17:33:37 +0000
X-IronPort-AV: E=Sophos;i="5.56,564,1539673200"; d="scan'208";a="23466290"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 05 Feb 2019 10:33:23 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 5 Feb 2019 10:33:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huspZwo1gTAYKC+kwF92rW3WwfZEJpcJio58pZ1P4Ho=;
 b=X6DIpDiPb5MG+w7C/DVY+RxxnvmY3GGCFVAQ8Ci+ynsHroOnQDHoifkaWXsR4xNZa6pvlqvLxIs52crHeqOdgGVEd+uKJTNuzGcIoxHOpY6ziTZ2ylexcTv2JMgertIK4nxtpoS9CtSziI3tHsdlq564UIZvCf2CvA/nFYDlo3c=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1539.namprd11.prod.outlook.com (10.172.23.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.17; Tue, 5 Feb 2019 17:33:20 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1580.019; Tue, 5 Feb 2019
 17:33:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <Ludovic.Desroches@microchip.com>, <bbrezillon@kernel.org>,
 <Cyrille.Pitchen@microchip.com>, <bugalski.piotr@gmail.com>
Subject: [PATCH v6 06/13] spi: atmel-quadspi: return appropriate error code
Thread-Topic: [PATCH v6 06/13] spi: atmel-quadspi: return appropriate error
 code
Thread-Index: AQHUvXjiUqKhx/gt+UG0OZy3lJy5pA==
Date: Tue, 5 Feb 2019 17:33:19 +0000
Message-ID: <20190205173254.16388-7-tudor.ambarus@microchip.com>
References: <20190205173254.16388-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190205173254.16388-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0128.eurprd07.prod.outlook.com
 (2603:10a6:802:16::15) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1539;
 6:VB8+QKeZe31FTAP8f3CoYruQ/ZQ709G2gVRDA1hGjg0Nqq7gwir2hD0EfrzxqUFCdi2qog8MQreYWTt8rYf7Xs/A2MWzK9ko9nSV+A6yOyF6LlLM2ShoWqyo7J/jVgwDphvAeNrVKU5DPIvYzNTOVx18G1I4JtBzrzjyLtKlgZ9gY+9x6rIUG7BNc80UpWYX+JhuV66fcKXWXqBEP0/3/hMF5/k5ntGosg+l7ImJ9yOsIfxbY/dOg5qeKtM+isxb6uy++o2hDOra3oQvl5vOyx6nG4JCtN1mcBVJyZ/AKUEofsko/7TnuSBo+TyCWwnykKFn1K5hp8Soece68KIsvvto6bFm0m0AaefZUN/Myx9kXjdhluGjeKiTIBj3sl/sp7nB+NXBCNykdo5kuDuWINSFoZL1Ya8Ukw+1gPWNPnlq98oH4x+KTM21EpKBnEqlyp4rKMvZcDPxTykB6Ic2iQ==;
 5:CzZmZn1VAvEgTC04DvJle2N6flEthVFZOvCig2RwyfaI+q3u6BBjuWVo1GvgPyG4kmuPR4Xsf/H1G282Ycc8EU1TYB1OgVGOzyADvxwu5FelI0Jie/X8ea/Wge1z/uO3EMjJisA8jZOQ3mcR/DPo7f/2srGj5CQ/vGn8a88hPncxB+BwYFpqY/MGpKqDw/Gyj9jt8dmmVMuwhaAFF+6W9A==;
 7:c2FQ2mxKN3cpkCdIcB3V6ZS9X9ieLOqfqTg+3JNFAwbWeEwdSMxn2Ep+RqzyvhJKIqYRt46AhQVXU6PkE5E09olr+GBqakDuapeeZdxQUR6dwfD5hkZNMUOsQkM1ENhCSi0OHBrlt7JgyOzqdeCsJA==
x-ms-office365-filtering-correlation-id: 29bdc89a-f2db-4c98-a28a-08d68b900508
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1539; 
x-ms-traffictypediagnostic: BN6PR11MB1539:
x-microsoft-antispam-prvs: <BN6PR11MB15399E2B7E69B3E0934AAA7EF06E0@BN6PR11MB1539.namprd11.prod.outlook.com>
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(366004)(136003)(39860400002)(199004)(189003)(386003)(6506007)(7736002)(4326008)(71200400001)(71190400001)(99286004)(72206003)(2906002)(110136005)(14454004)(316002)(305945005)(76176011)(8936002)(8676002)(52116002)(7416002)(3846002)(478600001)(6116002)(54906003)(2501003)(50226002)(1076003)(36756003)(106356001)(53936002)(105586002)(4744005)(25786009)(81156014)(6486002)(68736007)(81166006)(256004)(86362001)(102836004)(26005)(486006)(6512007)(11346002)(66066001)(476003)(97736004)(107886003)(6436002)(186003)(2616005)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1539;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qv+eaeO+5hFtzi5zF8DVbCKZz5FgZ7I1qU1hEIORq4Wk4TIUCojjE0kZ8DeA2zIfSIy+Aow5NhsCGRzymRmCAS/s+47FyjbtqMXLrqwSpPmplF6o+GWvIlvrF2rPTjedROKAwyKb+4QxEt2RUw1+0gN26ETxMRHLGhfHL2kozD/BertC2KcVa88/o2OLGa6lskZanMCI/dj8Yr+ls9GdMG8rPbO3Sb+tLpjte5pF3Y3/rMFMbBOMWZuUHsX1ag03BLf3JVGK6DQlQUOoxvmhej0qulAFMPPcwutxJKfEeOb8p08O7p9GNeVBtJexMeKsItyVM+rG80lyhe4f+RuhXVW+T7cbmSlRetb9qXdXhYPRm6rsF9H3ZxAdKbGdyfUIrOTcSME4rIgRhNY8vVnyZM2vuTigPFJhtWFlkPC1Eew=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bdc89a-f2db-4c98-a28a-08d68b900508
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2019 17:33:17.2927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1539
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_093324_858312_A006B8C9 
X-CRM114-Status: UNSURE (   8.26  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Tudor.Ambarus@microchip.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Return -ENOTSUPP when atmel_qspi_find_mode() fails. Propagate
the error in atmel_qspi_exec_op().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>
---
v6: no change
v5: no change
v4: no change
v3: no change
v2: collect R-b

 drivers/spi/atmel-quadspi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index be7f87fd5ac7..06c31830d07b 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -198,7 +198,7 @@ static int atmel_qspi_find_mode(const struct spi_mem_op *op)
 		if (atmel_qspi_is_compatible(op, &sama5d2_qspi_modes[i]))
 			return i;
 
-	return -1;
+	return -ENOTSUPP;
 }
 
 static bool atmel_qspi_supports_op(struct spi_mem *mem,
@@ -238,7 +238,7 @@ static int atmel_qspi_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 
 	mode = atmel_qspi_find_mode(op);
 	if (mode < 0)
-		return -ENOTSUPP;
+		return mode;
 
 	ifr |= sama5d2_qspi_modes[mode].config;
 
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
