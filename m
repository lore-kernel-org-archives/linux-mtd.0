Return-Path: <SRS0=MTZd=YW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A7BCA9EAE
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 08:59:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3493320830
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2019 08:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mjoLA3Of";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="HhSlsa2e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3493320830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tb+ouD40e7LhsjfJftf3B5uEWMLIBzcf7LrO1EKNubg=; b=mjoLA3OfRKjdpa
	dX80eGvJ/wwLW2kw4Z719pu7OcfYrN7lW5Ix6k1KMuz3Hc/R3VOI6xo16CJYwQ2ldyVxCNUTEbvm3
	AoZgBhP3R3UGmuD5Xf1B+MTXB7yzryrxnJXuvgfprp5nhAq/Rxl27aaFA6WWvJkLHJjY2035VJAGM
	VsjUeC1MQIQ2K/+g2he7sN8ITXjYwAHkU+2iqGia/mQx6WYGqFrXNr6fmukzFSLtsmwJr9xS/8RTY
	ybAukGtFsLfrn3ISjvkzDVdB+fWbPr85Zu6Xo5Fh5eY83oZpPQHgmSjzzEn1UHA0rT0+EApJ6LX+o
	sGB7Xk4yR7gQ2L9zubUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPNLC-0001Ce-QP; Tue, 29 Oct 2019 08:59:02 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPNL0-00010h-0i
 for linux-mtd@lists.infradead.org; Tue, 29 Oct 2019 08:58:52 +0000
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
IronPort-SDR: xojXEPLihrvYgkeOxUU/Y9qwz16R9TaK+cjrrRYZwwLyWbDauS5jt0mJn0GRy1DWaanq2hwdVB
 kSU5RjCibGUyBs892yHq9o5Fb6B6dkIOk6qAd2/aFkZI48AHOUoYWAKiSnePPJxc+ds2sWZUqc
 dl0qN4K9CE/FEFbOt4AyBsM14McWs5LaMznNbdjZLENVibEwGkOcHiYUKWIk/ALZ72vG3iBAA/
 lgblMf+hWxlPHXG4DeMkfT/e5PR52XQkf+BqE4jHLZzHQC9FMh2M1x5W7nSEfSg6S7gXWfDgI+
 zIY=
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="54775399"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Oct 2019 01:58:42 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Oct 2019 01:58:42 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 29 Oct 2019 01:58:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HLxJP0B/lUxep1WmR5aucreJwuT5G8WODzAHsaKEGBwtG9hgaeKvMB1O1JdeFDId9699HU2j19jVE4O374zODd3cXAMHUpwYUJfKbOThzOTek+E/+p32dlkBqTwooRNLx509XNechpAdz80VPRLEgyfTAFHvKogHvJF33zAtIl1Y6SiuI9M28CqlqJK7yq1g8rn7/Pmslkww7lXESX7DUYu3hB3a/ztE+G+YmOyqqpYHEb4az3prrbxiQrcWhyCmMT3GKs19WNUtOy2udnadsbtb50l9C8gGrTctczQ1TCeADEBAXswyDPU+0dqW3UXIjlEouQub2UQQVdOgSFaPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WahbwmOXoOrT7BZyJIQE09udV0Y21ZRBGTa+IO0hLi4=;
 b=hJUrwgnqU9Wd7uTMJogfBvyS31oHLmpUmmkLY8hCZj1BZZIx9elgAsBXTKKp8pJ0YcHqH6x3ZfQL2U0oEttDEHPoGDIkHnvdVEmZqFhbbYDJY/7lw60/0dAPpztVYOyP16CzczuRBStkxEbu6fTWEX3hgySLrkdfivmSZdx8wh8LaGLo1JpgL2NSO2CZS+obxDa9hba0ekbxhw/vwF2p/wQgnJhb7IQvV/G6ZlI+8SlSBDiG34f7zAUHXKi3FcScMjQLt21d9laSXtu72v+o8N7xMUeACdA7F4l1r49GyN1zcNXIXjG+/Ue9wv3YtcVjxv9LhyuJSvRStvD+589ILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WahbwmOXoOrT7BZyJIQE09udV0Y21ZRBGTa+IO0hLi4=;
 b=HhSlsa2euLJeVaWA5G4cr+Wv3oTNEzzK1qGoq/U6lPpJsXtM/YLCAnYTwkcodVeZ69sPjQ8hWeLuGzxGt7dWYVPA2gMIXKcDa8rQBHLeKRminwRWUaKcL7y0vKwT1uSuChlHcRxtx+lxKVkvPT4B+1sa7X2WKWWhA0HEm/VmyCI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3647.namprd11.prod.outlook.com (20.178.251.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 08:58:41 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 08:58:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtd: spi-nor: Update name for w25q128jv parts
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Update name for w25q128jv parts
Thread-Index: AQHVjjcPshPvEgtZaEa7FqjFl7fIzA==
Date: Tue, 29 Oct 2019 08:58:41 +0000
Message-ID: <20191029085816.22892-2-tudor.ambarus@microchip.com>
References: <20191029085816.22892-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191029085816.22892-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::30) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [83.166.207.93]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e30ff18f-7bd6-4c52-0612-08d75c4e31e6
x-ms-traffictypediagnostic: MN2PR11MB3647:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB364704B86C2C94ACADC49DBCF0610@MN2PR11MB3647.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(1076003)(110136005)(76176011)(186003)(6506007)(99286004)(386003)(66066001)(102836004)(52116002)(5660300002)(26005)(86362001)(107886003)(8936002)(4326008)(14454004)(81156014)(81166006)(478600001)(50226002)(25786009)(66476007)(66556008)(66446008)(64756008)(66946007)(36756003)(8676002)(305945005)(7736002)(2906002)(486006)(6486002)(446003)(71190400001)(71200400001)(11346002)(476003)(2616005)(6512007)(3846002)(2501003)(6116002)(6436002)(14444005)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3647;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XG6xI9UafmUPQUs5yagFf5CaiVar5AhBAValMZlj/KDeiOSKrir3Lb9uIMJPTkKEBJjw/4nTtxL55EjZOslJlJxgYmQAz8ODQKVEwxsrFyfVCzlfkXzfusxN3ATkVbVyQiCZoqd1unFxACdTcf+u8Bj8EaDivaFLF3r24NAbnC4qHHs1iWAYIpxluwVuvOB1sOEN2yfS/Jao/U5ypKuIeGP+mPh/heNwkHktXeJAi2XBvDZSJGzuC4+JsVOB+BTJUam77wx+2qWD07rmE5swy1fPPb969mhW3o/3JQirDYS0cyuMeFKHf0QlM2q85oRVNJtf8lChVoKiefcPVEVC2tdXBDzBlQcg9unqHVZ6gh6WT9h4mGFlnUHbEa0+raOvBwajlGOch61snml73+l4EO/I4Jnxqhq7cLWhHz370OgzWcucox7gIaox3FSi2Yhc
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e30ff18f-7bd6-4c52-0612-08d75c4e31e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 08:58:41.3565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDRfqh/KPe7XK5pQTeHXz8qqoyQ3+vBwUOe3ue39tINmJisFplB13u+sxqBUoIzYQx0AMlik0S3+4uzgZS71NLTAduT7olT0anwWQk8a0qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3647
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191029_015850_118391_E8A13417 
X-CRM114-Status: UNSURE (   8.76  )
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
Cc: Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

- Q version has QE = 1 (fixed) in Status register-2. Backward compatible to
  FV family.
- I version has QE = 0 (programmable) in Status register-2.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c52ff1b8a1cf..87ffc906eae5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2628,15 +2628,15 @@ static const struct flash_info spi_nor_ids[] = {
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{
-		"w25q128jv", INFO(0xef7018, 0, 64 * 1024, 256,
+		"w25q128jv-i", INFO(0xef7018, 0, 64 * 1024, 256,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 	{ "w25q80", INFO(0xef5014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
-	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256,
-			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
+	{ "w25q128jv-q", INFO(0xef4018, 0, 64 * 1024, 256,
+			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
 			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
