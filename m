Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF164C3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:08:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD81B2146E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:08:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5YYBv5z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ikF2eSKj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD81B2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zb0TeUE/eLXq1TT/YYH3zLVIvhVd8T04Y5xXQnZbDfc=; b=c5YYBv5zhBTuw0
	z5h1osyvOEn1FuG9noR1nf+hCujhflTTUOiL1Hhjr4gB7nmPwlsrMhwgxfv1r/NWGnDB0/P7JY//X
	T2pcdQtzyUaS3svVANEEQOIe/ZmSAfvdjlUV4Wt9TuqWhUYBh/O1mXQS1fqXz0X1dEfZ5KZ3+u5zg
	jg8nF3FwCb2y5fQVwWz1rI1gZWk2mq0xITQ58AC6NO8J5EW9U4xxnEoXdGZBFq/JxPcX1XBbu+HAb
	KE4ZA1T97Cx6vr9Q5O2Eoy89f4+qK59RcQvpPsbRbKgVHRqvTcCsp9TUdoaKDtnOaDp4IIH1ICXUQ
	d+GC8sKsdS055SGrDtqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1Uq7-0005UH-Vw; Sat, 24 Aug 2019 12:08:16 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1UpV-0004gU-Kn
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 12:07:39 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 2BWvKmsIxGxLW0bCaP0EZhjXmG5YrCrcJxPS9bTdiwrtwXrGoWVC0swFJicdW4jzF39VzgEtan
 7wIiXK1YIurvTXO0TuaW3WSsoS7rSIpNUnU19oROkKFLAJ6WzX8tNviZizZV185FeN6RYq7mYp
 c4atPZivLdgqx5GtAQYq15bBwsqgLbIFYy0JmrFy1wg0zkueDrGgdO/BYXzoe9J8TxDd8fLcmF
 PxZDeu2FEnzQfb9A7GzwZlLqFsWfarSYcGoepN6qvNMsPLuTgS62+R/80jsknpUNzmmxUcVmB+
 y4Q=
X-IronPort-AV: E=Sophos;i="5.64,425,1559545200"; d="scan'208";a="46465198"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Aug 2019 05:07:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 24 Aug 2019 05:07:19 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 24 Aug 2019 05:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GayKpOrize0oNrqoZ4WezwYjDeznjym8ZXLBNbwwxPotLP9RP8DajpuaxyXcqRlyUVad5QTGsUlORARQTL8BV4UjAl1A6T6q3zh+h14gCmI8a/iO3foWijU3j7bayQ9A6MvjdqrHWiMRLbkfpLaJziY11Vf9Dvkoem18zsr2O3VUxkrT3d4GjePwNaVhunJr7j1mtmo+Pz1ELBaJYK3oa+eYg/IdKIJHVaWzE/gWQeeoytZq9JnunAtz9vNn98Fe5P+M8QPozbxmEbU6v5wyMw577zJXRwOucWSTpcgJItmo+fm+cwPUgpMCKG7W2+tVubgsgB5Z1MxUKCLkDdufPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R72FliOoqWnY9hgStVwNYkqo9/Oi4W09P1KoLP2eH94=;
 b=Lw4Ato6SMQnvmJvn1Dj2nMLIY60xPJU/EP4di1cY3dnUukrQY6PenmqhibAd4rw711ipVfKV3xTNp8pfL3bmha2XUQV1pEtNXTL1mT+Ve+Ma2uBsvYvMomn0z15G3+Psc22a3Vy1YJbQwpjSTA+U59cd6sFlKYDnN0/9KKlNycA5YTGvkxnjM7tONcEUcrSAZsOGCzA4PpWf9wueoud7HbvDEdLPWkaLcNSeIz79cHqZpeBjbrng8Gm3TDclPB/Ma7tQQbALjyTdoitoe/Jxt/8zcr/8bsFYfS23gsqBABKMv+jRvPr/B6kzRtTVMilcuE+OOHTQZ3x6uXIocc/2WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R72FliOoqWnY9hgStVwNYkqo9/Oi4W09P1KoLP2eH94=;
 b=ikF2eSKjfhgFBTa/M9wKeSNWc0R1rvSOhWKChf7dQMOhKCpNAyF7splUFCU1fL+V9Qdvnsyxpzk/FmIgjlSD/KUKgD0fzWFf0VkC+YU/qwzcCj1oitzZ9mDM2hXkM0cf/pcngUOv88Nr7wrh5Kz3mpcYKsjFmaZTU4qPKDRaNo8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4301.namprd11.prod.outlook.com (52.135.36.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 12:07:17 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 12:07:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/6] mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag
Thread-Topic: [PATCH v2 6/6] mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag
Thread-Index: AQHVWnR525fTUtp96EeU3jpXKgU9Ug==
Date: Sat, 24 Aug 2019 12:07:17 +0000
Message-ID: <20190824120650.14752-7-tudor.ambarus@microchip.com>
References: <20190824120650.14752-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190824120650.14752-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::37) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d918e984-208a-4362-9785-08d7288b9bea
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4301; 
x-ms-traffictypediagnostic: MN2PR11MB4301:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB4301B7E2E8E5BEF5780E8B1CF0A70@MN2PR11MB4301.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(305945005)(99286004)(71190400001)(1076003)(71200400001)(7736002)(3846002)(6116002)(2501003)(52116002)(76176011)(4326008)(478600001)(2906002)(316002)(14454004)(53936002)(25786009)(110136005)(54906003)(107886003)(5660300002)(386003)(102836004)(6506007)(6436002)(8676002)(186003)(66946007)(26005)(50226002)(6486002)(36756003)(8936002)(66556008)(64756008)(66446008)(66476007)(486006)(476003)(2616005)(6512007)(446003)(81166006)(81156014)(11346002)(2201001)(86362001)(14444005)(256004)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4301;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zFYaW7St5ysJ/DBGZRo1+9dpgcCcxWesst+fc/54DmUeOetFoUwCbCvWggiJDx01pWpxHY9eqVTY6zQH5//PFyRA5+H3OsGw0SlUKRpqKA5kzv9ER5F5TVQa35fkdr/kHSS92E4/CEEcO2dDCf9ii12DVwHnBCeXU4067ceKzN5HPcUmgSK/VpaK4tsKmo1R4wTpuE1zMyEGoC1B7SuCkU4xneLxK4Ur2nQXxdJsSN4epVd5xowiawmqHT9JN4UKUwkWXcpe95GpRbsBNkR559GjGmliBO8NgoMiCxWr4x+PWtIiVusyRNv8IjChu1HQAtz8HZYFWgzyNYwTnD65elqiFcs0LI7csodXRB0TbgSEUTcHkSrkK92PPazCqIuXzabqHHrIr5rS+nBRh2+1sLr3cb5JSe5iZerZ7ZSOojs=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d918e984-208a-4362-9785-08d7288b9bea
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 12:07:17.8971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEe7nwo97LorajRvqDswtw7PuXniLORxPglFiXMYloOZ+0V6hHq6yy3YeeAiirnHtlKboFOA3cHh1QtGEN2I7l9vQmMKp85G2EkkNA8P8lE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4301
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_050737_884823_E01AFB5F 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: boris.brezillon@bootlin.com, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

S3AN flashes use a specific opcode to read the status register.
We currently use the SPI_S3AN flag to decide whether this specific
SR read opcode should be used, but SPI_S3AN is about to disappear, so
let's add a new flag.

Note that we use the same bit as SPI_S3AN implies SPI_NOR_XSR_RDY and
vice versa.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 5e16f293a83b..e76c23d1c54a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -211,6 +211,14 @@ struct flash_info {
 					 * bit. Must be used with
 					 * SPI_NOR_HAS_LOCK.
 					 */
+#define SPI_NOR_XSR_RDY		BIT(10)	/*
+					 * S3AN flashes have specific opcode to
+					 * read the status register.
+					 * Flags SPI_NOR_XSR_RDY and SPI_S3AN
+					 * use the same bit as one implies the
+					 * other, but we will get rid of
+					 * SPI_S3AN soon.
+					 */
 #define	SPI_S3AN		BIT(10)	/*
 					 * Xilinx Spartan 3AN In-System Flash
 					 * (MFR cannot be used for probing
@@ -4839,7 +4847,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
 	 * with Atmel spi-nor
 	 */
-	if (info->flags & SPI_S3AN)
+	if (info->flags & SPI_NOR_XSR_RDY)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
 	if (info->flags & SPI_NOR_HAS_LOCK) {
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
