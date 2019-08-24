Return-Path: <SRS0=t4Dz=WU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65007C3A59E
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2050F21670
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Aug 2019 12:01:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HAG9eMrS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="cMqTFEJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2050F21670
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGF2qb4AuOyY8aampYIItg+YWRS9Dg4kutIzob8SUyg=; b=HAG9eMrSi9Q54K
	Ig6Uw4OMnjoTzIkFQ5fz21rzfmL/I+h+mhajjZ8NywjXO2ZMuGWKCJ/qK5LOALjj6jogYKLshsXXN
	8PGzTQ1+35V+H6OulxumYQeumonFWNPY4Eau65JYBuA/JE2GjL/5uJgAY9iB02jyjmzceitrExJ8S
	baFz+Fv5QMHrH/gl6eMadNe6XWY3s7jahxJDjn0DpCYCWiRvxNOBR/zwmg0MQCMOGsRPUbhML6uH7
	rSwCQ4w8mJPZsHL9K0esQfEk9MeHqvsYiK/P50gpSAeireXbS9XGikCH0DPL6cneqHTmP2zvpO0Dy
	3ZlzGzS9r+Zv66HYGnWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1UjB-0001Ki-62; Sat, 24 Aug 2019 12:01:05 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1Uiq-0000tB-R2
 for linux-mtd@lists.infradead.org; Sat, 24 Aug 2019 12:00:47 +0000
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
IronPort-SDR: d5cUkYSP5KVT6Prr1jNuq9hLaDZFoUBRpXRcVsHdIrO1hteGRwDHKrUHf2ZDsm0YonZPcSdz4m
 7w96KugoIK4b88LntbaCi94WlrOEllocWcRKKn8CHDDeGlXHC1EYo+vL+hFuAhVhXOlFwEKeif
 pJpGFp+E7T8qjppv7vfqdM9D8QcA/JsG+A3b7lZqGpVb0rSvwt6pbJ2f+huvzxMRya/P2R2aRA
 +ttMqGKAM7fg61aZMUk0wsORSjj7MqiRWaYBWIo/HlKifCMz21Fb+AItwZD0uof4nYWcsA5uHL
 OHY=
X-IronPort-AV: E=Sophos;i="5.64,425,1559545200"; d="scan'208";a="44863693"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Aug 2019 05:00:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 24 Aug 2019 05:00:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 24 Aug 2019 05:00:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNOJuEEpfnu54o/LUTGE32atOfjKNQEkC6ZmUiv+wHLQ12dCXBG5MM15QZcJ7Jxqw1U9i5jY0BhmZtWEs0OrwJHpI73AmDQiS7bU6NAfmHn3mK0oX73zIgFYq1kB57/JYG09uon9dvapxSqSlR8aup06rqYazqjMYpTL/ieGyb/1U72gR0bau7COiUVjLn861NhGIWDjQYF8Pj22OTeFIMq0JhNasjmF6FFwGv5wslXxG4GAifco6HSobN9azE+Wp2R8j6h0EU3tXN/t1SWoQX2iFKrZKE7ilNPJfp+o3kimaxB/HajDwI5wItnHu2npVGAtIC+02/KKxjwdh8EKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar9iYkE+iGb5QnhpRABBcTifcxiSRW7qsbjvJPBHT5s=;
 b=ejjSLSdthlKmRZhLeaXDSpy0anNNO+BEQB7pMXHZnAt1JSWmBjV+1Gg+nr2kmyAuepc87CbSi9LKJIcRLs00N8KsNB/FszVAxaEMtgBKIPU1ltANinkbWW12sqAFKScVrMZPotneattTt3UaB5/6Owu2t877y5CfaUQ+6pA/bRpgTipO+1qEIqtH46qlU/3VcMx+XMgp7uRswTIvBgRZaSCzw5iAM7f86Yxv5T8SU1gqQoYcwXsDcmipurX9S9lxzSnfDwt6FUg9dQBWE+62S1Q/nGFCT6Y3bkH11XaQ1HgkFUbr3sRYXC3+ingRcusCbzn+FEG52m36m81xIt2OEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ar9iYkE+iGb5QnhpRABBcTifcxiSRW7qsbjvJPBHT5s=;
 b=cMqTFEJwxXed2CzN3L+BK3+wma8HJkKRopOZE2HX/z2nronQIwUyD41rh1QD3fdHOm2pAHO9NF9U+7AUNd19M1YFrxxGWetrPEMHhPPamItHs6cLax+aXYKYL/Mv3SYM9Ds76J3OwQjM6GqD9hhXkU4P21hCYAQ3r6HXIBKKN8o=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3984.namprd11.prod.outlook.com (10.255.181.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Sat, 24 Aug 2019 12:00:38 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 12:00:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/7] mtd: spi-nor: Add default_init() hook to tweak flash
 parameters
Thread-Topic: [PATCH v2 1/7] mtd: spi-nor: Add default_init() hook to tweak
 flash parameters
Thread-Index: AQHVWnOLI9kQAqnfkU25HHOSqmLETA==
Date: Sat, 24 Aug 2019 12:00:37 +0000
Message-ID: <20190824120027.14452-2-tudor.ambarus@microchip.com>
References: <20190824120027.14452-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190824120027.14452-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0194.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::18) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.127.53.184]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6e46aad-e6fe-42c3-f639-08d7288aad77
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3984; 
x-ms-traffictypediagnostic: MN2PR11MB3984:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3984E47E96E6CF24D7302260F0A70@MN2PR11MB3984.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(396003)(366004)(39860400002)(199004)(189003)(110136005)(25786009)(26005)(446003)(4326008)(1076003)(256004)(316002)(386003)(2501003)(81156014)(6506007)(8936002)(64756008)(66556008)(66476007)(66946007)(6436002)(81166006)(66446008)(8676002)(2201001)(53936002)(76176011)(5660300002)(86362001)(6512007)(52116002)(71200400001)(14454004)(11346002)(66066001)(476003)(305945005)(6486002)(36756003)(7736002)(186003)(71190400001)(478600001)(2906002)(102836004)(99286004)(50226002)(6116002)(3846002)(107886003)(486006)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3984;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FJjShFLa4sl3OvQylkykfBL4e0F433cU4PlIEV9/wvuXmwzc/J1VBFV/EGZ5n6CQoK9L4s1ar2z99GmFDRAZqcTZQ2SDdTTcV7j37ENtAJCyDeySs8HpRsdoD42XkrhZ8NkoBFLtwqfyMfHRixdsgdRrgi59zfKeb+aSxLTjBCcmUGY9Q/29ur/pIK4F7a0jJ1pknIHv7taRBv3Y3nejWLCJKVPzWKAcjuGDFev55JKWVUuCOpMbYLJH8IQbqxiWsHSBDnfOI7JBGbBuJld4VbpwTf/SSoh4jAGVkSeD1chaw2aGXjrwCgONHYyy/SR0IYnJTLD+1g3WGbYDTDD3j9glJbrzPMbN5MhzpZKjmLpa/PcaCuPP5NvOqQTFRe91x8BLhzTncxacfOIlyeKgKyMF8/ykbe+oXLCJIbpTvXA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e46aad-e6fe-42c3-f639-08d7288aad77
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 12:00:37.8881 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3eeTXGRTAaEU5ALYDuJJFiXC7hXxknVU5UOMeTZCADYBtF27RInbaJmzXjMOq+znromG3PEzuPry3h7TNXRU5H0Nl9wuWpzJpZ4DIWy/6JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_050044_990070_6B70BBEB 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

As of now, the flash parameters initialization logic is as following:

a/ default flash parameters init in spi_nor_init_params()
b/ manufacturer specific flash parameters updates, split across entire
   spi-nor core code
c/ flash parameters updates based on SFDP tables
d/ post BFPT flash parameter updates

In the quest of removing the manufacturer specific code from the spi-nor
core, we want to impose a timeline/priority on how the flash parameters
are updated. The following sequence of calls is pursued:

1/ spi-nor core legacy flash parameters init:
	spi_nor_default_init_params()

2/ MFR-based manufacturer flash parameters init:
	nor->manufacturer->fixups->default_init()

3/ specific flash_info tweeks done when decisions can not be done just on
   MFR:
	nor->info->fixups->default_init()

4/ SFDP tables flash parameters init - SFDP knows better:
	spi_nor_sfdp_init_params()

5/ post SFDP tables flash parameters updates - in case manufacturers get
   the serial flash tables wrong or incomplete.
	nor->info->fixups->post_sfdp()
   The later can be extended to nor->manufacturer->fixups->post_sfdp() if
   needed.

This patch opens doors for steps 2/ and 3/.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 7c02eddad9fd..016bfe2fb592 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -154,12 +154,16 @@ struct sfdp_bfpt {
 
 /**
  * struct spi_nor_fixups - SPI NOR fixup hooks
+ * @default_init: called after default flash parameters init. Used to tweak
+ *                flash parameters when information provided by the flash_info
+ *                table is incomplete or wrong.
  * @post_bfpt: called after the BFPT table has been parsed
  *
  * Those hooks can be used to tweak the SPI NOR configuration when the SFDP
  * table is broken or not available.
  */
 struct spi_nor_fixups {
+	void (*default_init)(struct spi_nor *nor);
 	int (*post_bfpt)(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
 			 const struct sfdp_bfpt *bfpt,
@@ -4133,6 +4137,17 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	return err;
 }
 
+/**
+ * spi_nor_manufacturer_init_params() - Initialize the flash's parameters and
+ * settings based on ->default_init() hook.
+ * @nor:	pointer to a 'struct spi-nor'.
+ */
+static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
+{
+	if (nor->info->fixups && nor->info->fixups->default_init)
+		nor->info->fixups->default_init(nor);
+}
+
 static int spi_nor_init_params(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = &nor->params;
@@ -4233,6 +4248,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
 			params->quad_enable = info->quad_enable;
 	}
 
+	spi_nor_manufacturer_init_params(nor);
+
 	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
 	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
 		struct spi_nor_flash_parameter sfdp_params;
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
