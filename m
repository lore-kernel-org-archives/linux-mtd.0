Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EDAC10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B9E020719
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 06:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kH6qIYQA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZTfTDWqk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B9E020719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVVLp/CF/y2xQTcsx/jlPU7lUBS7fGG/DjK9Pdcuc5o=; b=kH6qIYQAvN66Q0
	DH3V6wcBUo0WQVrnqGqrxYg7A9+uip14epA8w5+b39RG8P2iKANI49fTY2P4/EL+takHVavdYjymi
	miuSQXUMbRmsdV4T3JR/0wRWgpZJd0GbodRA9pTpfUhTB8Re2TZseXU4+lM4asKRM36RVidsveMHt
	uvPSb++pzT4vZwyjSQOr8zUEhgNbvMrFG5eJ1uWFuBtLBRIwHRX5fKHD3TsZUd4y9ectcfn70pHa0
	+0419lsI3N/DtL/bYPX/2D+nMgDZ1CalS8afmjIguBsUEIQxDvJYPlDGyFwUs0vO6Yt2n3eG0Yr8I
	ERvchn59Ft1YThSiv7xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGcd5-0005Jq-Qp; Tue, 24 Mar 2020 06:01:35 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGcd3-0005J7-1N
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 06:01:34 +0000
IronPort-SDR: ApBAlFGFCm0yPBI+/ikwse2IwLWiy1umbjdzp8xHcP2ADxkh1zE3CqxivCfvpxi/NhyOuB92Nw
 PbLVTOQPG4sus9Uv+P5tiD6xO8k0mf7s7gU9aNf9+/PPDhogH7GW3pvfty6wlwOfD+ZKRWQQ97
 9jFwvtLWj8D+ZFG2qifR4Wjp9e4cMrLHZN5XBw0081lR/b2mRfOadFXV7zy770GXn8ciyQD7Z9
 +/uk4Ap3wg6WDbHUTZI6TEx+RLEjvKf/XdCCTgQdEDvcTdMVS9TokVI0r/BLY4tYUGeFLBbn+h
 uAE=
X-IronPort-AV: E=Sophos;i="5.72,299,1580799600"; 
   d="scan'208";a="6755189"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 23:01:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 23:01:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 23 Mar 2020 23:01:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4GyQSr105r1mm5WFtMFCyWrtrmV1a978QnVcp8DWCSK1P64KwSHk43S2EqmosCabMiBkYitcB9qS9GprTSBQeI+D19jFUEMHuJC3vF6UhyeIDH1eTROzHD1HePYOHBSBO34XXfXNGPxdZVcpDacZutxQZKJk24wvr4AMig09A5OcWgYM4IU1Pq8GCFeEWHxZwwqWlUd3ACABCOmlIaF6KyqfVkzyKFQ3cMB6oSBkKYQM2PY5ayd/Q5hrW/WI40kEkTaa6mPV/ya3bwCKVV0qDCfFoIyXXKzzftFMVS7YYnLRXD+cuxMXYSURnLOjR7NQmpLpHm4pWwBJnTl7ZNxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0yuQeRRy3PQQGWjeJjMK/VJGqKtxHXYgo07cilrldU=;
 b=Vlguyr9w1ePaLCDkUdpHyllasA/05RZ5BO1zld2wy7gIBGqTBdXn8WgBhXrKdd3zQTR/ZjCX9+RDyiNYq/4nM0uVJvKstsz9PJDWs5zpVaO53jIKrKHchri/d1QgqD07L8wCz1F/iA3xALCyq3cUOW4SxBUen4oN1kTcj5H95r0jOAPPreGG9jKRCB7Mo7r75UOkiR9m4fLS3ZbiZAj0SkZ5oPL4Y/3j9QTythfhRHycKaWBOtvgaVKb3acyQDExCkNEl1rBDqxLunmBe7az0Mlwm8LgSTes6DWbbU0Tf0YteI/XGaIwzagyAgJMV7XkMxF1etDSikrcOcMm0uo78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0yuQeRRy3PQQGWjeJjMK/VJGqKtxHXYgo07cilrldU=;
 b=ZTfTDWqkxzPCpdImpL+eFJFfNmmTlsWQMzkPCBDLWjhBQC0yZsxDtfSnGdKpbzSXMQecCFqJWCw2bAPtbeLJDOCo2YAVKji1A0bvupXPfnu7J2EDC+b0ZLJyyZQlP/p0nw4yGQ6zE8J49+RwW4TpSBzLdZKDx4iUvRihVZm+DuQ=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4184.namprd11.prod.outlook.com (2603:10b6:a03:192::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Tue, 24 Mar
 2020 06:01:29 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 06:01:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <js07.lee@samsung.com>, <michael@walle.cc>, <vigneshr@ti.com>
Subject: [PATCH v4 1/4] mtd: spi-nor: Set all BP bits to one when lock_len ==
 mtd->size
Thread-Topic: [PATCH v4 1/4] mtd: spi-nor: Set all BP bits to one when
 lock_len == mtd->size
Thread-Index: AQHWAaGoiel0WgU8gkq6RhkBtK0jqQ==
Date: Tue, 24 Mar 2020 06:01:28 +0000
Message-ID: <20200324060123.1533917-2-tudor.ambarus@microchip.com>
References: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
In-Reply-To: <20200324060123.1533917-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1de56e2-b8e1-45fc-5e3e-08d7cfb8cb72
x-ms-traffictypediagnostic: BY5PR11MB4184:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4184E9AE4E0C49A3C4032FE1F0F10@BY5PR11MB4184.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(136003)(346002)(366004)(396003)(6512007)(8936002)(86362001)(2906002)(71200400001)(316002)(478600001)(54906003)(110136005)(81166006)(186003)(26005)(2616005)(76116006)(91956017)(6506007)(66476007)(64756008)(66446008)(66556008)(36756003)(6486002)(5660300002)(1076003)(8676002)(81156014)(4326008)(107886003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4184;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4derfIaJo1CFGmy17UlXpaeSfO+Tp5lojBU/WJkBtamkU8Eip9ZVOs/FuIg2Z7UaPdgfK5ZasvszjGhsRF/zr6bBSsM4PNJNsBKr+7XJTUiuPRqTmbIMBXy3jhR3bSilS+ISHBfo/nChuw4sP9l2Mv2FN0+UdmbtCFSTuIXSa0KQyXg2hzlNjF3KquZptVM1s4BgJjfKd0MXXgPFx1MS34zPxJQTbR57dBWrrYvxzNTt21MqKc03JAgGljxiwLrHc9vNWIOtdEAnV1G+gOmT63fVj7H5ppVKn3Qrere+rMY0DhJY9k1N8Ob1omDXpizuq3g89hCavMMTSlA2z+AKO6lkH1RpFsaftwISnnuwiJepo4g6XBETLfCcA+erIeyVpLtMgqjkp+fTLsQQzYX2XLdDsfECPvIqBz9SwoMN36SF0dqdA7VLvBEh1t35HIfR
x-ms-exchange-antispam-messagedata: 5Xn/bZh0CXNHtk2JNt/r42YgJjvMndPpcUrqMD6sx7n7PpwHATIskV9naY03CF2EmeXYe/dwNsLI8iUzIpqrBueNy9XvCOYfEaweI6Y+pGCqZ2XSDwofR5Wqbv7LY1YfFwRS+vxcHMmkjS2lCtIhPA==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a1de56e2-b8e1-45fc-5e3e-08d7cfb8cb72
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 06:01:28.9167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kgOW+AV1wGjN0d5nGlbTgARQ2JKy7xd/kmJkK1vsqEaZsvHhFoS0IZKisX3G1lR9oxp02Rl+NLRWpfHQ0bjsWM6Kkad9oZADXkXtpifZX9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4184
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_230133_134869_8512A82D 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

When there are more BP settings than needed for defining the protected
areas of the flash memory, most flashes will define the remaining
settings as "protect all", i.e. the equivalent of having all the BP bits
set to one. But there are flashes where the in-between BP values
are undefined (not mentioned), and only the "all bits set" is protecting
the entire memory. One such example is w25q80, where BP[2:0]=0b101 and
0b110 are not defined.

Set all the BP bits to one when lock_len == mtd->size, to treat this
special case.

Suggested-by: Michael Walle <michael@walle.cc>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Jungseung Lee <js07.lee@samsung.com>
Reviewed-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/spi-nor/core.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e0021dd34bfe..bc57b1b5ec62 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1682,13 +1682,19 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
-	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << SR_BP_SHIFT);
-	if (val & ~mask)
-		return -EINVAL;
-	/* Don't "lock" with no region! */
-	if (!(val & mask))
-		return -EINVAL;
+	if (lock_len == mtd->size) {
+		val = mask;
+	} else {
+		pow = ilog2(mtd->size) - ilog2(lock_len);
+		val = mask - (pow << SR_BP_SHIFT);
+
+		if (val & ~mask)
+			return -EINVAL;
+
+		/* Don't "lock" with no region! */
+		if (!(val & mask))
+			return -EINVAL;
+	}
 
 	status_new = (status_old & ~mask & ~tb_mask) | val;
 
-- 
2.23.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
