Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3836C3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:10:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7108D217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q68NjXQ4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="b2cUU8Qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7108D217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MP+0KzvYJE4pgGZjq5Ou804B/6vhm+m8jh/G39CvnqA=; b=q68NjXQ4zUN2fP
	yjYHdHKBXDtlyu3yMXn6aGmoIHKeTP5qjWHplZj+5f+SNpisOyyyzKIYrbWY7/3DyKdVgxrZl05H6
	1dY487+bIBHnVftDU9IoDnlvsTKzSXxv/W6pASrh5yBoyUZML7BGEH6hAK/eNCFG8qX2Wrz065J5t
	D1ykHTeKAJg/tR+neHhqDaVI7BzR7Vdp2P3ihOggEA0iZ8wL1IsXzWsc0ezZp8axuqF3N5pIwp0+V
	OJYIfz3fz7KpukI+eFnw9mo7AA17EbtLtDm77ZM2oXgjCR1K2stdskNZNXJE0Xhtm2gQum3ZT8ofD
	O5tr3MZCeIGH7E99UM7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2Dpd-0005fJ-7j; Mon, 26 Aug 2019 12:10:45 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Do2-0002er-29
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:09:09 +0000
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
IronPort-SDR: L7idsH8QsSwFb9NTCp9Mmh64x+NddcJ406FlZzlxruSH9yoAlLrN9EXyK2JNXwGH/UBRoHEvzT
 wG6fmmNlRx7vqL3FGdBdsT/GS/ZuYesVQFlHLLkva2KMSUVYiDLn9J3bgpLwnpUpOcQwH3y7y2
 u00Jtfjj0eyYi3tQN2a50Slj0AqdCsDMMkvbdT5Xqjf2CCW1cS2VxagcqRQgff5ji6hJQ8bcMM
 M0W1JRZEOg/ax8HIonsg/JwsgdYkWjVT72qQtuTWTwGHm9zN3FrDMlB1yPPRf961ZnyA8WIMw1
 Ds4=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46520777"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:09:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:09:03 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 05:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fL1VgZZRZ9njp4rFey4KTjbLbtcwsFqSsChKLYvKyMdAGFD1sUr2Q+eoZm55SAZIYUq/Qq0OM6xZgCWmHbedhxEQPP9drhP/VtAgITvkamUMMg2SK+H0y8iGg8c6/aM7/kqiAgD5pHfM+jTf2GABwCfXipQR7wPnI8X7Q0tVu49gsmrLM4+3x4mIZ4r1HOTY8tq1WkmGwE7NoyWKUgr9NZYWHkx33OK8gBZrtkBTbO7YdHrrc53Q5PXlMTrV4A/JuDANCRpEvVuyIpntXMKkaXY+3plZgDU9sYM1HLQEz86hKH1bWuhB56emDhEGPttcz3NTKHQKexN4NB2XQ0QRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYkmIUFTQvRMJYvhZhq10CllljCgJS5yCXTvQ9exY1k=;
 b=W4huwBjcQNgDbjq4T2uUY2S6YcAzZ0TtLJ0PYVRXnhgLYyKr8KUxZOIcWS7tnqrrGCYcX0N8Ia7MS7qBJOqyzwDkakX/tpDrMtUDDts3CtigWaZ1WKIPW9VZAxgrF25+6z/PQI2sL3U6fKOsFTXpoHaNT7b22D9cyNmI68FboFgPR7WOr3tV/7k7kBwOr0qjFgpVNJ9RrXjtoEc8lT67VunAdaPphtt7INYiE+dW1axHun8Nyk865Wio4GDzQhujhKJRQCxjz/gwf5MASi7drn6cJeBkV+gyPzCwADH9pzNjNQoIM0CAmSbEPWKUFQSIcvenEpFJeZf34snELZBl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYkmIUFTQvRMJYvhZhq10CllljCgJS5yCXTvQ9exY1k=;
 b=b2cUU8QmZM6Qcb0hfK4gyCbbE6tL+wjIdNy7JrezdliLgdEPMEzI7+2Rvb6bEoazHn4cKErc3x5zd7rlzKU3tguosvHM41tetCPO0/pBGaBZBZ4inV9pqV1we0dm4G1S0+TyMTfVFJrdksmtlHe3JCsWdzqjk7uoP3UHIs8hQ+g=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3678.namprd11.prod.outlook.com (20.178.252.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:08:56 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:08:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v3 09/20] mtd: spi-nor: Create a ->set_4byte() method
Thread-Topic: [RESEND PATCH v3 09/20] mtd: spi-nor: Create a ->set_4byte()
 method
Thread-Index: AQHVXAcE+2ySzEKDQkeCEarhbPF6Sw==
Date: Mon, 26 Aug 2019 12:08:48 +0000
Message-ID: <20190826120821.16351-10-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 65b6d62b-dae5-43c4-2022-08d72a1e2693
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3678; 
x-ms-traffictypediagnostic: MN2PR11MB3678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3678A185AD68C0D0D70DDF1DF0A10@MN2PR11MB3678.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(346002)(366004)(396003)(376002)(199004)(189003)(486006)(2616005)(476003)(6666004)(107886003)(316002)(14454004)(386003)(6506007)(76176011)(99286004)(52116002)(54906003)(110136005)(478600001)(102836004)(4326008)(25786009)(36756003)(446003)(26005)(11346002)(50226002)(81156014)(66066001)(8676002)(53936002)(81166006)(8936002)(6512007)(6486002)(6436002)(3846002)(6116002)(186003)(86362001)(305945005)(2201001)(7736002)(2906002)(64756008)(66446008)(1076003)(71190400001)(5660300002)(71200400001)(256004)(14444005)(66946007)(66556008)(66476007)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3678;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3jVb+vm/JSAkTJLqr5dycmuamWwNEeJkFM5jM2CooSQsaIOHII/6Om1yL8oEtBQHtX9dInzd3av1TyQUwt4czCOJMzLTr8NdVyBKWN72f3HWdLrvlbYMe4LKAhMX+UmFV8+abXnJ8ZIbt0yDv9fWxdaqqVwKpO5xM9k8V+OylAoWTVMa2UK1NBzMDFcTM/b+O0bHhCYTveMosumJ5+tjKzc+/X7oJQ+8ShzX0T4Ooa4rDqF3MD9YJ3LZrvTs/SAbzssKCuzcJMf1piDIHZJQxmNlOa5nz4HPDd2oGS/BjhsHKpGN0OrxlAussPcGCgpghfEsbm05jViVlh8IYHHHgYl3SWL5x1CLkwQe/YyLqito6f6OGSAO19RNHGVbi0et6BarFRym4OMQlHZiAS6qaZWJQNg2A5bguPwYDdh/E18=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b6d62b-dae5-43c4-2022-08d72a1e2693
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:08:48.2675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S5MrAPvFTiaDTSzKy1sHdXqvJ631q3lnv2WBf1YWxdH2E6/i9E3YGl54oBwjHlbI5bPgYuWDo6yPFfzfxgc4/IL3j+BjSU+UsAsdbuASPJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050906_165611_4F22200F 
X-CRM114-Status: GOOD (  12.65  )
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

The procedure used to enable 4 byte addressing mode depends on the NOR
device, so let's provide a hook so that manufacturer specific handling
can be implemented in a sane way.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
[tudor.ambarus@microchip.com: use nor->params.set_4byte() instead of
nor->set_4byte()]
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v3: no changes

 drivers/mtd/spi-nor/spi-nor.c | 76 ++++++++++++++++++++++---------------------
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1e7f8dc3457d..235e82a121a1 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -633,6 +633,17 @@ static int macronix_set_4byte(struct spi_nor *nor, bool enable)
 			      NULL, 0);
 }
 
+static int st_micron_set_4byte(struct spi_nor *nor, bool enable)
+{
+	int ret;
+
+	write_enable(nor);
+	ret = macronix_set_4byte(nor, enable);
+	write_disable(nor);
+
+	return ret;
+}
+
 static int spansion_set_4byte(struct spi_nor *nor, bool enable)
 {
 	nor->bouncebuf[0] = enable << 7;
@@ -667,45 +678,24 @@ static int spi_nor_write_ear(struct spi_nor *nor, u8 ear)
 	return nor->write_reg(nor, SPINOR_OP_WREAR, nor->bouncebuf, 1);
 }
 
-/* Enable/disable 4-byte addressing mode. */
-static int set_4byte(struct spi_nor *nor, bool enable)
+static int winbond_set_4byte(struct spi_nor *nor, bool enable)
 {
-	int status;
-	bool need_wren = false;
-
-	switch (JEDEC_MFR(nor->info)) {
-	case SNOR_MFR_ST:
-	case SNOR_MFR_MICRON:
-		/* Some Micron need WREN command; all will accept it */
-		need_wren = true;
-		/* fall through */
-	case SNOR_MFR_MACRONIX:
-	case SNOR_MFR_WINBOND:
-		if (need_wren)
-			write_enable(nor);
+	int ret;
 
-		status = macronix_set_4byte(nor, enable);
-		if (need_wren)
-			write_disable(nor);
+	ret = macronix_set_4byte(nor, enable);
+	if (ret || enable)
+		return ret;
 
-		if (!status && !enable &&
-		    JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND) {
-			/*
-			 * On Winbond W25Q256FV, leaving 4byte mode causes
-			 * the Extended Address Register to be set to 1, so all
-			 * 3-byte-address reads come from the second 16M.
-			 * We must clear the register to enable normal behavior.
-			 */
-			write_enable(nor);
-			spi_nor_write_ear(nor, 0);
-			write_disable(nor);
-		}
+	/*
+	 * On Winbond W25Q256FV, leaving 4byte mode causes the Extended Address
+	 * Register to be set to 1, so all 3-byte-address reads come from the
+	 * second 16M. We must clear the register to enable normal behavior.
+	 */
+	write_enable(nor);
+	ret = spi_nor_write_ear(nor, 0);
+	write_disable(nor);
 
-		return status;
-	default:
-		/* Spansion style */
-		return spansion_set_4byte(nor, enable);
-	}
+	return ret;
 }
 
 static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
@@ -4153,11 +4143,18 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 static void macronix_set_default_init(struct spi_nor *nor)
 {
 	nor->params.quad_enable = macronix_quad_enable;
+	nor->params.set_4byte = macronix_set_4byte;
 }
 
 static void st_micron_set_default_init(struct spi_nor *nor)
 {
 	nor->params.quad_enable = NULL;
+	nor->params.set_4byte = st_micron_set_4byte;
+}
+
+static void winbond_set_default_init(struct spi_nor *nor)
+{
+	nor->params.set_4byte = winbond_set_4byte;
 }
 
 /**
@@ -4178,6 +4175,10 @@ static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
 		st_micron_set_default_init(nor);
 		break;
 
+	case SNOR_MFR_WINBOND:
+		winbond_set_default_init(nor);
+		break;
+
 	default:
 		break;
 	}
@@ -4222,6 +4223,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 
 	/* Initialize legacy flash parameters and settings. */
 	params->quad_enable = spansion_quad_enable;
+	params->set_4byte = spansion_set_4byte;
 
 	/* Set SPI NOR sizes. */
 	params->size = (u64)info->sector_size * info->n_sectors;
@@ -4587,7 +4589,7 @@ static int spi_nor_init(struct spi_nor *nor)
 		 */
 		WARN_ONCE(nor->flags & SNOR_F_BROKEN_RESET,
 			  "enabling reset hack; may not recover from unexpected reboots\n");
-		set_4byte(nor, true);
+		nor->params.set_4byte(nor, true);
 	}
 
 	return 0;
@@ -4611,7 +4613,7 @@ void spi_nor_restore(struct spi_nor *nor)
 	/* restore the addressing mode */
 	if (nor->addr_width == 4 && !(nor->flags & SNOR_F_4B_OPCODES) &&
 	    nor->flags & SNOR_F_BROKEN_RESET)
-		set_4byte(nor, false);
+		nor->params.set_4byte(nor, false);
 }
 EXPORT_SYMBOL_GPL(spi_nor_restore);
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index a86c0d9fb01d..7da89dd483cb 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -482,6 +482,7 @@ struct spi_nor;
  * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
  *                      Table.
  * @quad_enable:	enables SPI NOR quad mode.
+ * @set_4byte:		puts the SPI NOR in 4 byte addressing mode.
  */
 struct spi_nor_flash_parameter {
 	u64				size;
@@ -494,6 +495,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_erase_map        erase_map;
 
 	int (*quad_enable)(struct spi_nor *nor);
+	int (*set_4byte)(struct spi_nor *nor, bool enable);
 };
 
 /**
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
