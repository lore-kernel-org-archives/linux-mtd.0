Return-Path: <SRS0=VSS2=W3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6F2C3A59F
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 05:50:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF22B2343A
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Aug 2019 05:50:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBNgzxB6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fortanix.onmicrosoft.com header.i=@fortanix.onmicrosoft.com header.b="g6Ebjgib"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF22B2343A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fortanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zpOXMQ45cGkFWvLJNjbNfQTktU5p9IXdkya8ynF2sQk=; b=LBNgzxB6zI2peW
	KiCAOB6LzgSm2QgqWksXKeqqDFnYtQ0RDd++XT8nDh4t+LtDQt8XyIBNq79vq9y6kPMaIJg84bhcz
	nzsjb+nhDJTrc+CZgb5SwfPXEVGLYWe5oO4WbuKjcWzstwPNHE8fRayqh1vU9iZQxQGNSRTcgtdER
	ISf1HSWERz9dMInlB0afKcVl+2M8Lpoz/AHIMzjz3HehsLbRH9QJoLSLriItczdrr3jsOqwITuNrY
	urF5bu4zLGfg02hxGrbXIjRBNsiNR89QcqP77gNmu712ffKORQ0M4oxhH3WPTsokBNF1TuzXZiwS3
	I1WXWv4XWZ4nqFu6VklQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3wHk-0003a4-1i; Sat, 31 Aug 2019 05:50:52 +0000
Received: from mail-eopbgr680122.outbound.protection.outlook.com
 ([40.107.68.122] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3wHV-0003NG-7f
 for linux-mtd@lists.infradead.org; Sat, 31 Aug 2019 05:50:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fF+MiKQtyH4rITM6qeRyiUfaUL95P1DznapwSZ5mySq1R8cIw5gpFW0qBiaIcCpyux+e7Ma3Z81daRBomwCaZcILkzEroQK8tYEXzGZ5i0JEvxl6tYf/oeAf2I+TgS7fpuIMrTdvbL/demSozR3R/hUHnbuQOwGhBGPMdCGpYGiSBbevGf0ZfbLKMx8b3UKW4XxOemD2vTvER5p+sEmlzaNOEEqzKXEzxZgrY9rEsTbWXmGMH9kP+G0NJCAS3xj5otMn/rkMGEFhJzUIY4Ro2O9vB6lRs3D8yWl+qWadO7cV24hd1LglNkUXRBiL35sKNM6wLB5C65vFypCS5CltlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovZhOu55lB2/kMUqmAO1jArpp9kM7kP/hz0S3EI7XcM=;
 b=LZ9TX3fUsizUjk6Qg57uriO1Ts//KfpZLRt0k3sO5WdVTfO/owPmN9YldTXal2W6GR7mTgnwmIR6FNP0trpw/Vtmf8NBq3ZB52G7VHTILgyDkx3/jO1XUS05wXgGnqYKISqzJgYOBv+ZvHHctyxoOgZ/ZWWkO+Jdz7IjJ2IS5MXolxoOhkszYet4/NQa532LVFaSGMu8COZsJm3D9EdfdklKwEViwXw3DJRp6KAR/quWf0Nu91pfQ3ZWeg7gjKbTW05UFxkUH6WdLjXoU2xjHor6rfmwlar/+fZad2iK6h0rLZ5e9nv9ptKS9k+3W7h8XpM+DPvI5ymGT3GpBbnWPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fortanix.com; dmarc=pass action=none header.from=fortanix.com;
 dkim=pass header.d=fortanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fortanix.onmicrosoft.com; s=selector2-fortanix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovZhOu55lB2/kMUqmAO1jArpp9kM7kP/hz0S3EI7XcM=;
 b=g6Ebjgibp1KoPUwiIl96kpIQJPuSRmhURNAPke+vE5K8wXR6lZQKgBBflCggctPtmJ/TKHqnNC5NuPLu2ntkc+Bfk1W2yD4JEkVEbBNwZHSohQAz6r2lz3PGk82GuLFgCPGGwGUkr5Wb5HBsHzi7DYbXuAnVXgnvdvckPkb2VqA=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (10.173.174.144) by
 DM5PR1101MB2155.namprd11.prod.outlook.com (10.174.109.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Sat, 31 Aug 2019 05:50:35 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::101c:56a0:673b:6410]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::101c:56a0:673b:6410%6]) with mapi id 15.20.2199.021; Sat, 31 Aug 2019
 05:50:34 +0000
From: Jethro Beekman <jethro@fortanix.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Allison Randal <allison@lohutok.net>, Thomas
 Gleixner <tglx@linutronix.de>, Jethro Beekman <jethro@fortanix.com>, Enrico
 Weigelt <info@metux.net>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] mtd: spi-nor: intel-spi: add support for Intel Cannon
 Lake SPI flash
Thread-Topic: [PATCH 2/2] mtd: spi-nor: intel-spi: add support for Intel
 Cannon Lake SPI flash
Thread-Index: AQHVX8ABRdU28yqEZUSYr3dEEhcW0Q==
Date: Sat, 31 Aug 2019 05:50:34 +0000
Message-ID: <6cc18e41-82a6-942b-6d91-6297f73a33da@fortanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0046.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::23) To DM5PR1101MB2348.namprd11.prod.outlook.com
 (2603:10b6:3:a8::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jethro@fortanix.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [76.236.28.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1dca365f-662b-4005-82fb-08d72dd72458
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR1101MB2155; 
x-ms-traffictypediagnostic: DM5PR1101MB2155:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2155A7676AE8E21302D410F7AABC0@DM5PR1101MB2155.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 014617085B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(346002)(376002)(366004)(39840400004)(136003)(199004)(189003)(186003)(1250700005)(476003)(5660300002)(6486002)(53936002)(8936002)(316002)(7736002)(25786009)(4326008)(7416002)(26005)(66556008)(14454004)(99286004)(6116002)(8676002)(52116002)(71190400001)(66946007)(3846002)(81166006)(81156014)(71200400001)(36756003)(66476007)(64756008)(66446008)(102836004)(31686004)(2906002)(2501003)(110136005)(2616005)(6506007)(386003)(2201001)(478600001)(6512007)(305945005)(86362001)(107886003)(256004)(6436002)(486006)(31696002)(66066001)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1101MB2155;
 H:DM5PR1101MB2348.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fortanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xM1rE8cEKaedHFR3E0Nv7YGn0xDyDZ14e8pqhoWmMwyFXfSdOA/cM0ye35AFKRd75Vbwi++DWxOp6/2VOLc/7G9FQHlqqVVLDGtvRX1OoAWNcEvEBH2N14mF4bZb2AMy/zeGM2dXjh4QL3QysC8zhCYh8f2/ZtiLHNNHrp6u5VtZPDe6ehH5GHsqS7+7sk/3/lkyPBmRM1DPaYFwlFHVR69phjLhiLXNGkYOKHD+YyODCtMTMvTrIqGk9fEY6D6nj2U3GfxDBHcH63MsL9cEO1ZC+oiLEalKq7Ad4PVZtui4lpLodNqUMpZqkBGqjOLKy3F/b4yCsJvKgLo0W/nuNt2UZsLUCVnwVU5KsmlNlIQ9WWgclnYwRMsCotvIm/Q/4whuG24tlbHs+8+O2xDnGNwwSZG65NLHxpBRjuH0Xes=
Content-ID: <91B75CAE7173B94599DAEA4F3218C962@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fortanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dca365f-662b-4005-82fb-08d72dd72458
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2019 05:50:34.8802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de7becae-4883-43e8-82c7-7dbdbb988ae6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4YdT5YdkkNSboNxfgXP1FnHcvRJKiRMkJ6kdOMCCwbT2k3LYEP+qX2wj9/c2Iuclsy8Foh0aE7Ly84LagEPQiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_225037_287838_36E38BDA 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Jethro Beekman <jethro@fortanix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

(apologies, resending without S/MIME signature)

Now that SPI flash controllers without a software sequencer are
supported, it's trivial to add support for CNL and its PCI ID.

Signed-off-by: Jethro Beekman <jethro@fortanix.com>
---
   drivers/mtd/spi-nor/intel-spi-pci.c     |  5 +++++
   drivers/mtd/spi-nor/intel-spi.c         | 11 +++++++++++
   include/linux/platform_data/intel-spi.h |  1 +
   3 files changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c 
b/drivers/mtd/spi-nor/intel-spi-pci.c
index b83c4ab6..195a09d 100644
--- a/drivers/mtd/spi-nor/intel-spi-pci.c
+++ b/drivers/mtd/spi-nor/intel-spi-pci.c
@@ -20,6 +20,10 @@ static const struct intel_spi_boardinfo bxt_info = {
   	.type = INTEL_SPI_BXT,
   };
   +static const struct intel_spi_boardinfo cnl_info = {
+	.type = INTEL_SPI_CNL,
+};
+
   static int intel_spi_pci_probe(struct pci_dev *pdev,
   			       const struct pci_device_id *id)
   {
@@ -67,6 +71,7 @@ static const struct pci_device_id intel_spi_pci_ids[] = {
   	{ PCI_VDEVICE(INTEL, 0x4b24), (unsigned long)&bxt_info },
   	{ PCI_VDEVICE(INTEL, 0xa1a4), (unsigned long)&bxt_info },
   	{ PCI_VDEVICE(INTEL, 0xa224), (unsigned long)&bxt_info },
+	{ PCI_VDEVICE(INTEL, 0xa324), (unsigned long)&cnl_info },
   	{ },
   };
   MODULE_DEVICE_TABLE(pci, intel_spi_pci_ids);
diff --git a/drivers/mtd/spi-nor/intel-spi.c 
b/drivers/mtd/spi-nor/intel-spi.c
index 195cdca..91b7851 100644
--- a/drivers/mtd/spi-nor/intel-spi.c
+++ b/drivers/mtd/spi-nor/intel-spi.c
@@ -108,6 +108,10 @@
   #define BXT_FREG_NUM			12
   #define BXT_PR_NUM			6
   +#define CNL_PR				0x84
+#define CNL_FREG_NUM			6
+#define CNL_PR_NUM			5
+
   #define LVSCC				0xc4
   #define UVSCC				0xc8
   #define ERASE_OPCODE_SHIFT		8
@@ -344,6 +348,13 @@ static int intel_spi_init(struct intel_spi *ispi)
   		ispi->erase_64k = true;
   		break;
   +	case INTEL_SPI_CNL:
+		ispi->sregs = NULL;
+		ispi->pregs = ispi->base + CNL_PR;
+		ispi->nregions = CNL_FREG_NUM;
+		ispi->pr_num = CNL_PR_NUM;
+		break;
+
   	default:
   		return -EINVAL;
   	}
diff --git a/include/linux/platform_data/intel-spi.h 
b/include/linux/platform_data/intel-spi.h
index ebb4f33..7f53a5c 100644
--- a/include/linux/platform_data/intel-spi.h
+++ b/include/linux/platform_data/intel-spi.h
@@ -13,6 +13,7 @@ enum intel_spi_type {
   	INTEL_SPI_BYT = 1,
   	INTEL_SPI_LPT,
   	INTEL_SPI_BXT,
+	INTEL_SPI_CNL,
   };
    /**
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
