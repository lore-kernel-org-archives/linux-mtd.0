Return-Path: <SRS0=xWtm=W7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F87C3A5A2
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2019 01:15:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED99C21883
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Sep 2019 01:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hnOp+iwu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=fortanix.onmicrosoft.com header.i=@fortanix.onmicrosoft.com header.b="HVGCUZYM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED99C21883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fortanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nk3yG7C1fR0dYhLXIEFqU53wKAKWewXhELYVreUlJUU=; b=hnOp+iwu7v6gzP
	2XUkLHwlZootRocmv65wZspTW1es61TpeKZbd/IGxkh6DMN05SdKWV+9uRh9Gab/pQhliDQOPHcJs
	H5kel1tB3zpvWDg3C1EfuB3gZzxiTWfZxbIq5BqBsFJFbhKAStff32s0PqQ8Bd//9InHCvu/6vwHF
	CO1bvBddx4sUwTmh0vxFEsC+tf6PxSnFbx05prdPjDVNNP3omIYBrkW3PRL7JiaupPXZjV4iwnfwi
	2AQse6iFnsJTBbMv2OUixYc6aaCfl3CSdJOsMATPFWScKunfhF1AVZspRH+wLSHMZ1TRjR0QsTz9D
	QLJGcRC4fYBkU/KEMAoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5JtX-0006Oo-Fg; Wed, 04 Sep 2019 01:15:35 +0000
Received: from mail-eopbgr730115.outbound.protection.outlook.com
 ([40.107.73.115] helo=NAM05-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5JtP-0006Dx-G1
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2019 01:15:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4m3+zKbmIxiGw1eIJoRkhJ2WixwVYqkM8sMOkk/LJ/AN5JMriBBN+bG/oico7RvRUBS8gh7EXK9Z59uxTJ+8ErOQG1X9lRpZaE2HuXfmc409N7vVEt6hsgPglPjqGGCqLl/MojyN2zO/M4tqy6Lqg2qFAwm/CNxdHchkNATz/Vu4dC1VEp7phg3034TVDr4K6orH5F8qO9V1TTPybeF6e9uoVVZ+I1Y6Y4ZUngFB75Anyfz6VFNEqzURuB17oZsoDo4Wq8Et9AK0IWrs6Ict8Og+DmNdauubrBMJpvKw26DummJl/QPIRbMWeYeLA1ruOnmnR0W/vuZSHUbZiVkoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3babSxIq1AkDW/tby+yaJXBIM7rOnActahUZ7Do/CEU=;
 b=l90r9olf9NX32HPJxiU0Tz5EwWcxiAZJARmlTHd3UpdIgmtnYYjy4JoM7i01b766jqhkzggbbdOpWdxFjA9o0pq2RpCGvEb0YcHNNJ4Vzs21eSSgjVXJqKAl9Dks0PR6D4YSCHDvUkidzQB/Y+SFZqSr4xjwbZBNYwfEF9EJb9oTinne/2auQQqlIEq9Ob1N/yRAG8ltYw1k2pqkLfS2Xmw6uaWpkWQeEDqE9Ph04AlTCDL8lDc6hzyvldm6TJGJN3zjGaaGWofEpMRsJr4fkt0WDpxMzs5fJ6VCKRje6zXTbq0TrEjRmer4wlG+z6TdUiCNR71NZELFsNzh8M1E2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fortanix.com; dmarc=pass action=none header.from=fortanix.com;
 dkim=pass header.d=fortanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fortanix.onmicrosoft.com; s=selector2-fortanix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3babSxIq1AkDW/tby+yaJXBIM7rOnActahUZ7Do/CEU=;
 b=HVGCUZYMzwbcr/8uMu09tXM3e+2YdUYKEr+8aCqwRISVVDJY8qqNOoeP1ZlZqmCN3vKTfDFb7dPdmFH+vSzej7pPX/9juo8Ba5ZZ6hRVTwlu0elZAN70blEBm4UR5bdlEd9tPBStD1LlOUaWGCoHhJQBD7VRvXt6S7yFMM7imsc=
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com (10.173.174.144) by
 DM5PR1101MB2089.namprd11.prod.outlook.com (10.174.106.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.18; Wed, 4 Sep 2019 01:15:25 +0000
Received: from DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42]) by DM5PR1101MB2348.namprd11.prod.outlook.com
 ([fe80::798a:dabe:a59f:bb42%6]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 01:15:25 +0000
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
Subject: [PATCH v2 2/2] mtd: spi-nor: intel-spi: add support for Intel Cannon
 Lake SPI flash
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: intel-spi: add support for Intel
 Cannon Lake SPI flash
Thread-Index: AQHVYr46w+9V00BKOEGkHvwLMfTVVQ==
Date: Wed, 4 Sep 2019 01:15:24 +0000
Message-ID: <d62dec18-fed4-7ac5-35c8-25f1be2201a9@fortanix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BY5PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:180::17) To DM5PR1101MB2348.namprd11.prod.outlook.com
 (2603:10b6:3:a8::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jethro@fortanix.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [67.207.107.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 703ba343-f697-440b-4259-08d730d55d55
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM5PR1101MB2089; 
x-ms-traffictypediagnostic: DM5PR1101MB2089:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2089542C07D553CD6D31BC3EAAB80@DM5PR1101MB2089.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(396003)(346002)(39840400004)(136003)(189003)(199004)(7736002)(25786009)(3846002)(14454004)(2906002)(6486002)(52116002)(5660300002)(6116002)(81166006)(81156014)(31696002)(8676002)(2201001)(508600001)(99286004)(966005)(86362001)(6436002)(8936002)(305945005)(316002)(66066001)(36756003)(31686004)(110136005)(6306002)(386003)(71190400001)(1250700005)(6506007)(71200400001)(6512007)(66476007)(66556008)(64756008)(66446008)(102836004)(7416002)(66946007)(53936002)(476003)(2616005)(486006)(256004)(2501003)(186003)(26005)(921003)(1121003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR1101MB2089;
 H:DM5PR1101MB2348.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: fortanix.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VajoxocxbQvxkhu3iHF1V8J+SZaGkolrd4G9Fpw1NM0ety56xYzhMPD3aIB1Bb247BoJ+dsFRXKnpCjg0BHZitK0KNUl2PNNpthbU6dTnme38BxJoTbG6CwRMpzkHRociSwPZGI8XJHbxtB8xPIqstaTzl7E7dIPsPAIIP/L0bMQHQmAyIackbGoEx+fst0bSX5C94imcdmAxfD+qPn+cQRtfVDJ0he0SqUB1tjkC6OaosRH/3MVLGwzvs9tTk8wwOohoaW9VZvC18LDxqgMFjS5653RWoMNJCNGHWAAAXB/xwjpuWYFA4pWRzhw8ss6V4sR3XxvHWIgca70oa8iZ+Q0JtJjL4PYMFKZOrwUO2nh3thc8gXY9F1LsMASULiyY6+j4Ab7TCWsTA8rUSVtDOXbnUSU7TZFDrt8B+zMMEQ=
Content-ID: <33C4A7B5C732A749BCA6F17301106DDF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fortanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 703ba343-f697-440b-4259-08d730d55d55
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 01:15:24.9439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: de7becae-4883-43e8-82c7-7dbdbb988ae6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Ozv2EapNECiQhAjL4mawEoc3jG5TERRTVNm5GeJyPWEODDOuM98dMJTnZ2O1l1rcmlsbEKah6UlEc5/rERTvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_181527_695116_41D3F3EF 
X-CRM114-Status: GOOD (  12.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Now that SPI flash controllers without a software sequencer are
supported, it's trivial to add support for CNL and its PCI ID.

Values from https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/300-series-chipset-pch-datasheet-vol-2.pdf

Signed-off-by: Jethro Beekman <jethro@fortanix.com>
---
 drivers/mtd/spi-nor/intel-spi-pci.c     |  5 +++++
 drivers/mtd/spi-nor/intel-spi.c         | 11 +++++++++++
 include/linux/platform_data/intel-spi.h |  1 +
 3 files changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/intel-spi-pci.c b/drivers/mtd/spi-nor/intel-spi-pci.c
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
diff --git a/drivers/mtd/spi-nor/intel-spi.c b/drivers/mtd/spi-nor/intel-spi.c
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
diff --git a/include/linux/platform_data/intel-spi.h b/include/linux/platform_data/intel-spi.h
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
