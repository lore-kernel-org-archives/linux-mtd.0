Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87E2C3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:13:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F05D217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FDM2fOJE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="BGQbRv/q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F05D217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aENPAukrLTGHvFQD/1J35nRZyZNaoN+MrdCB3EHrHB8=; b=FDM2fOJE8PeDJx
	hTnHVUuwdSqrIPYBZjpmsBI+HSytpMbbvbYOxTQCvIGFIenS5SAFqY72O6d5DeqjqC2JKxLgfNaO0
	4csv5oIxfUrup+IzSEOAE0SK1j+nSdHIb5gPvHoxk96u9TZ2zGeLcE2tyFKch4uZSZwKs2kFUwkkV
	8pjZ0uQZJtDkVAi4Q66rvPaTFgZcrVY5RLve6bub3sFW/HrywziFOMH5lCKgapqctMZRZmDmvGq3Z
	43QW+hJ0XsjcjaVpQG77CKzZC40xFuTqoaAJOZPY4uLVJUNMpaH++QsosxFiXQ193VHgipLfI4nX+
	7Ba5GZtiSBQbN2OoPDkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Drf-00088C-Vr; Mon, 26 Aug 2019 12:12:52 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2DoB-0002er-Pv
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:09:20 +0000
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
IronPort-SDR: b2VO+xxIKFb1CuCNtQ0a28mRRQ4CENRjBCiwKiXRVoYQvflenQQ3BOX65rRkjfcHjr+pdBuJmR
 MIcKl62wGvEQ92lzbduQp+Iudov6o8APhcpVH+fF4Zo/Yg1kmjoLg7GzDAgMvi9+uJbVgIl/MX
 tuOJn9eEQJLyJ4dm+4ijcuuD35nxwdU3JAFyZyevrMMIcnl2JSJzBCbk+wjO9PszEVEHgnP7r8
 wsVRw++65M67vlTC4t+GLLuzqiGxGcVijv1UKj5roDOkCVZDsv/ycXz/NT7yCZT5MAunVp38er
 iUI=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46520796"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:09:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:09:08 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 26 Aug 2019 05:09:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNS2oYdUoEWrjEQ3tEhhQ/rDqqmiIk7okcacacAJspCOi3yYyIvkCum5KknIblW5aiis1M9GwQWuSNVUm7Cav15D4h+JuAjs5l+hUaKlzp4e+STZc3kDogtQ3pOpMd1TlDZPgcd4d+Xh2yqM6fJVz5Woz930PJLhVE6w2lil1jI6NmGFkFetkGwXgRMSG3uxWquxDR7zQ2QR7PzclMudBTrAtTQyGBwT+fzGBd+1VvV6NbXyDgYaC8C1+ozqDMFAaLTQH7lH+l6UnPPF36jTtn1JVLRS1/A5OeZ/DpGoBgKwzdI4C15+hAV01O6JC7T2EU1Emfq89mbbXJEO+FmFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teywPRmKxNCHDCqoMd8uKvncvMQgIAjI6tlFv8GhTDU=;
 b=C7X89nduv/dDjWW7KjmTUNK1ivf8x9gXMhAmAyMNgpPgn6EO07Ic9NkIrtFzlCjz7Pm2DxrEeTsVLtk1lVSULQH2MGdhUG25iQQ5HCfeM0i1A8wQIwaCb149voabUCLhBaSrhWUpKT3JfO58OS8DJu9v9ZNC7aBnQ3QxYjj9Q5CwvAlGQG+DzYfMhd0nDjczRrmlx3oAI1oTkMagIEBxHBUoN1M9SF0ZCpu8Q/35l5d1ZN5qT1WzjUWECUZaCpOYNQEJnAIyqnCmBezelP6OYjJo/1hU5BuBITYFoWpZ2gG642udyz5V4nBgbx7kA6pJHYazjNRr7kLOFptm5QrJZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teywPRmKxNCHDCqoMd8uKvncvMQgIAjI6tlFv8GhTDU=;
 b=BGQbRv/qpRnNGpv2yOwlSbo+YpL1svACu+DuPCCUOrvLQiXO41z1ENMYH1J5zgdkyB+VUXyoIJQs86aZKLyizKj0LiLfAUy1uqvaAiiEg6R+yZ7YrZD84oEWZGbLS1w1QHkCIVFOckkhBQVeYzdSmm21yLnC37i9t0V8bkcP+k8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3678.namprd11.prod.outlook.com (20.178.252.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:09:08 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:09:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v3 18/20] mtd: spi_nor: Introduce
 spi_nor_set_addr_width()
Thread-Topic: [RESEND PATCH v3 18/20] mtd: spi_nor: Introduce
 spi_nor_set_addr_width()
Thread-Index: AQHVXAcO02WZRVSyz024bw8uo4qH9g==
Date: Mon, 26 Aug 2019 12:09:05 +0000
Message-ID: <20190826120821.16351-19-tudor.ambarus@microchip.com>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190826120821.16351-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0046.eurprd09.prod.outlook.com
 (2603:10a6:802:28::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23377e7b-e457-447f-d426-08d72a1e30f3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3678; 
x-ms-traffictypediagnostic: MN2PR11MB3678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB36784C773C38B66FEF689701F0A10@MN2PR11MB3678.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(186003)(86362001)(305945005)(2906002)(7736002)(2201001)(6486002)(6436002)(6116002)(3846002)(66556008)(66946007)(66476007)(2501003)(66446008)(64756008)(5660300002)(71190400001)(256004)(71200400001)(1076003)(6506007)(386003)(14454004)(107886003)(316002)(99286004)(76176011)(110136005)(52116002)(6666004)(2616005)(476003)(486006)(53936002)(66066001)(8676002)(8936002)(81166006)(6512007)(4326008)(25786009)(36756003)(478600001)(81156014)(102836004)(50226002)(446003)(11346002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3678;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cYq+6vIutXNSRxe4vZYEOezs1abEsUpqnZZoegUyPJESMpf9fn/I6lqIBhlpjjUo+TtIq0y3LGS/Eg080yXGnV7nEyk1UGzWfUiDAv81vxz2A2bshs6m8yh8VxaqaRBu5P5N3DTua7C4smqDCH7J6gMaDaW4IR1P9fQQmvaEh8vL7/q5EgTojbMx1q+Pqkp1nAt0iHvUo9vZ43lOQYopPqEUhtKPekd239ES8tHU5GhKLf28MjrWpz1UjcMa9lcTLMiBcCHtrBUUmjl5gFuwtm5kfvsAC+/T5uhmpmySwz3agrfft3X2DsJjt8oTfHufP6Xwz2SQVQV4czZRfSsLtI5gRgiQLNR3HWVq909OW1yvPkPnLfzqtt5tPa+1Lz9pCZoNoGlX+bGzv9jW8HxI3YmOoUu6zHavU6Sr3xbnw48=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 23377e7b-e457-447f-d426-08d72a1e30f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:09:05.7734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D2Pz4AXKn8vilZDd8euInAzbBH1a6VqpgIm/8fH37H7HQ6sKZzymhlo6zLFroIWccvHRXjEcIOfKpeHOCVLbfk/TX3LQKj1u1uZ9HqKPVQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050915_929359_CC16D141 
X-CRM114-Status: GOOD (  11.03  )
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

Parsing of flash parameters were interleaved with setting of the
nor addr width. Dedicate a function for setting nor addr width.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
v3: no changes

 drivers/mtd/spi-nor/spi-nor.c | 50 ++++++++++++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index dcda96a20f6c..d13317d1f372 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4739,6 +4739,33 @@ static const struct flash_info *spi_nor_match_id(const char *name)
 	return NULL;
 }
 
+static int spi_nor_set_addr_width(struct spi_nor *nor)
+{
+	if (nor->addr_width) {
+		/* already configured from SFDP */
+	} else if (nor->info->addr_width) {
+		nor->addr_width = nor->info->addr_width;
+	} else if (nor->mtd.size > 0x1000000) {
+		/* enable 4-byte addressing if the device exceeds 16MiB */
+		nor->addr_width = 4;
+	} else {
+		nor->addr_width = 3;
+	}
+
+	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
+		dev_err(nor->dev, "address width is too large: %u\n",
+			nor->addr_width);
+		return -EINVAL;
+	}
+
+	/* Set 4byte opcodes when possible. */
+	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
+	    !(nor->flags & SNOR_F_HAS_4BAIT))
+		spi_nor_set_4byte_opcodes(nor);
+
+	return 0;
+}
+
 int spi_nor_scan(struct spi_nor *nor, const char *name,
 		 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -4885,29 +4912,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (ret)
 		return ret;
 
-	if (nor->addr_width) {
-		/* already configured from SFDP */
-	} else if (info->addr_width) {
-		nor->addr_width = info->addr_width;
-	} else if (mtd->size > 0x1000000) {
-		/* enable 4-byte addressing if the device exceeds 16MiB */
-		nor->addr_width = 4;
-	} else {
-		nor->addr_width = 3;
-	}
-
 	if (info->flags & SPI_NOR_4B_OPCODES)
 		nor->flags |= SNOR_F_4B_OPCODES;
 
-	if (nor->addr_width == 4 && nor->flags & SNOR_F_4B_OPCODES &&
-	    !(nor->flags & SNOR_F_HAS_4BAIT))
-		spi_nor_set_4byte_opcodes(nor);
-
-	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
-		dev_err(dev, "address width is too large: %u\n",
-			nor->addr_width);
-		return -EINVAL;
-	}
+	ret = spi_nor_set_addr_width(nor);
+	if (ret)
+		return ret;
 
 	/* Send all the required SPI flash commands to initialize device */
 	ret = spi_nor_init(nor);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
