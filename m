Return-Path: <SRS0=JTfG=V4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372D1C32751
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:08:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 067402067D
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2019 09:08:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BbaDev/c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="U15u22el"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 067402067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wMzIxdQ0752OSfaRiNT7cBLnChAw4IoDTWQichSUM0=; b=BbaDev/cy78Er4
	LMkn+jXReBx/TWLRtuvfT6ZnIBz3omwKl+YjWkY9ZuSrNC6dXJ9YfCopI0NVf66sKEhI9FsIQpsKD
	kJ4hNkxbPCOXC1jmP8lACpaSDVfL7Lg+MOsqEqDkEuzvPty3enlyts4DHc2lNsmfls0BWD8ElxtHq
	jOXBa0Ny4lEVeuEHGNNxX1LV5ggMB56iZ4itvD985TDaVktye12NyIVFpnbPDBMcdClnnv9/2V3gf
	WRsNqFeEke7XCDDo7HAjymvDD8YYRIDLKtwzm/U2xPGePglyw9bWMst2Hm+abangaysvEY9vi6BSf
	rpKfeVxUgzWVGkDfE6Bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hskaX-000247-KP; Wed, 31 Jul 2019 09:08:01 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hskaT-00023i-TS
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2019 09:07:59 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: GYFWcQqPV296trbWKEbtI0mzI4iLscDjuhZK5cz/sMtBPU/XOgkbXSrNYvBExeMozuxd2S5hR5
 aNj37VtLqae9NTgsqUc4qrsSnetxWwOUMkJn6Ev/S9Jlxpf6MJ037KUU+jH6wrlfDwKNlbmAGc
 1Q95t7TS/HKVXUXgjT9XYqTGHPgs/zeEUoV13ZtohG5xE9MBLKKCYIsCo+8CAT+HIkhft/eo+j
 GoCc6snS7VNn+bS95+Ts8+EeY3Emo4afAudPKwNKLu34wFfZOuW9zId19PaDuOlQPH4CifiGuR
 PYU=
X-IronPort-AV: E=Sophos;i="5.64,329,1559545200"; d="scan'208";a="44785510"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jul 2019 02:07:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 31 Jul 2019 02:03:34 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 31 Jul 2019 02:03:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtFWyVZhj/by2/L+xUKcNKyIjz3Q1moIOE3ohKd7GhNzx9jv6rsiGNr0LsxMkL0lzcgg1zY+UKJTLNvL8G7kKbzQIFTo9L/u+VE1f9oRIWAOLsJyyKAaH8fPpJgWzWnAGmR600HTXAInd+XIdVLjqOHdz/F2//EDRKIGO7gDslG5wnbzQ8KH9EvITgkJiHMT2mCX1Lo38d99YA8nVoxe21l6691Iq7aqK9onfDVPgUTqNG17Eb35lEGyzAkQXYtgPu2ihF4zjpKn9RWSyFTT2Dafka4gkp6/B/6NmdB5baQZFAhC9ilioqWhGTdQtIpXiTe46qRjVnj0QId13KJgLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy2ZTknVNYJbLgSGHKDtaO6R4+YiMqjbIZfz3GN7ClA=;
 b=eTWD4tBTibBUs5Y1EXDofaJ2+xnLgfld1ldzRZ6W9lcWIdqaM7XqpnNZQbVgrx7yRSoCme7dr82QHetbL0sUSMtZ3u7ZFLUuA8r+51kX2B8/Mlhgu9rDl92PY31I0XFd44+invUtZTizZKZaD4KjwmLDfz7TEdOIKW15+rAQlPQmQlFwNm6n/QCzJMmss5v6Q3pJpndIy38SVi1cin2FE8ONxfy+k4PS/IjxYu4koNM2GSiDURKiYYSrhYz1GBpvyh52Ep8faisAFebElrjO/0FI9pjxU6vLIV7qxsifRIB7wbIFsIjMlFApYa8YZb+FbVNJ5ZzsKW1Gx2oYYXzsUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy2ZTknVNYJbLgSGHKDtaO6R4+YiMqjbIZfz3GN7ClA=;
 b=U15u22elC9gEdn7oVWT0v7VUzwY6CI+tNznUNwl5tFVIRKgRmzRaAjM3LiOtcswRiiUYwZ/aZN2vNQuC/wLG7A+uMxyJ07Hk+wtk3nrd3QMbGfT6HptamEfto4Xf3LXZ7bQWDjKArOmOIWn5hwTkLH8kQ3QrshcV5CZqfWjCg6g=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2SPR01MB0050.namprd11.prod.outlook.com (10.255.239.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Wed, 31 Jul 2019 09:03:33 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5%2]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 09:03:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>, <vigneshr@ti.com>
Subject: [PATCH 4/7] mtd: spi-nor: Split spi_nor_init_params()
Thread-Topic: [PATCH 4/7] mtd: spi-nor: Split spi_nor_init_params()
Thread-Index: AQHVR37U6wC5THkYtEukGeSVfPDR2Q==
Date: Wed, 31 Jul 2019 09:03:33 +0000
Message-ID: <20190731090315.26798-5-tudor.ambarus@microchip.com>
References: <20190731090315.26798-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190731090315.26798-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR03CA0070.eurprd03.prod.outlook.com
 (2603:10a6:803:50::41) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ba732ff-22b7-44eb-6411-08d71595f6e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2SPR01MB0050; 
x-ms-traffictypediagnostic: MN2SPR01MB0050:
x-microsoft-antispam-prvs: <MN2SPR01MB0050F564B0B907AFB1C53FCDF0DF0@MN2SPR01MB0050.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(366004)(346002)(396003)(136003)(189003)(199004)(6116002)(3846002)(50226002)(53936002)(36756003)(54906003)(305945005)(8676002)(81166006)(107886003)(2906002)(81156014)(6436002)(316002)(26005)(66476007)(66946007)(64756008)(66446008)(66556008)(6486002)(68736007)(8936002)(6512007)(86362001)(5660300002)(25786009)(1076003)(110136005)(7736002)(186003)(4326008)(11346002)(446003)(102836004)(386003)(6506007)(256004)(2616005)(476003)(52116002)(99286004)(76176011)(478600001)(2501003)(66066001)(14454004)(14444005)(486006)(71190400001)(71200400001)(2201001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0050;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XjTOv/F0hoThUg6DqgqIFUlF2R5Epu5NP1LnnLyISP3dTEPijLNzjY89EaMR0hgKxErWAu4pbsLwhEuPX2+Suw1MD0TplBphiGnpaYOhSuaWfAtwr2H6Zvzg14eHx8Ot3I1m+WbWDKv3UYgdqQ68IHyF1brcEBo6PFlnKpnYbbTdF580YuBzUZ79eXqShqo9GfIidKSISsgfBH4bwZJ0LVuNQMob1fxpuy4mM+lM4Xw822x6kR0hGAxGZBZFOb1fGJRDlGUu7VMyI9KSEaoMBWj3/BJFRFxpnRokBqX/JymiNKkWcWS1/iwf1tqZavyWba6/DMbVXH6tnjjDuTUFxpNWceI0CsnskGe3wm1Pcw5sFfJ0MGdYbUUj8WZrfmIXlc03N5G67L8MA6qzjR4gqJIyx/PL47VZxh4HiMOw+6U=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba732ff-22b7-44eb-6411-08d71595f6e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 09:03:33.4217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_020758_082036_9FB6FDAA 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Add functions to delimit what the chunks of code do:

static void spi_nor_init_params()
{
	spi_nor_default_init_params()
	spi_nor_manufacturer_init_params()
	spi_nor_sfdp_init_params()
}

spi_nor_init_params() becomes of type void, as all its children
return void.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 58 ++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 26 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index a906c36260c8..b2e72668e7ab 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -4312,6 +4312,25 @@ static void spi_nor_mfr_init_params(struct spi_nor *nor,
 	}
 }
 
+static void spi_nor_sfdp_init_params(struct spi_nor *nor,
+				     struct spi_nor_flash_parameter *params)
+{
+	struct spi_nor_flash_parameter sfdp_params;
+	struct spi_nor_erase_map prev_map;
+
+	memcpy(&sfdp_params, params, sizeof(sfdp_params));
+	memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));
+
+	if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
+		nor->addr_width = 0;
+		nor->flags &= ~SNOR_F_4B_OPCODES;
+		/* restore previous erase map */
+		memcpy(&nor->erase_map, &prev_map, sizeof(nor->erase_map));
+	} else {
+		memcpy(params, &sfdp_params, sizeof(*params));
+	}
+}
+
 static void
 spi_nor_manufacturer_init_params(struct spi_nor *nor,
 				 struct spi_nor_flash_parameter *params)
@@ -4323,8 +4342,8 @@ spi_nor_manufacturer_init_params(struct spi_nor *nor,
 		return nor->info->fixups->default_init(nor, params);
 }
 
-static int spi_nor_init_params(struct spi_nor *nor,
-			       struct spi_nor_flash_parameter *params)
+static void spi_nor_default_init_params(struct spi_nor *nor,
+					struct spi_nor_flash_parameter *params)
 {
 	struct spi_nor_erase_map *map = &nor->erase_map;
 	const struct flash_info *info = nor->info;
@@ -4397,29 +4416,18 @@ static int spi_nor_init_params(struct spi_nor *nor,
 	spi_nor_set_erase_type(&map->erase_type[i], info->sector_size,
 			       SPINOR_OP_SE);
 	spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
+}
 
-	spi_nor_manufacturer_init_params(nor, params);
-
-	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
-	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
-		struct spi_nor_flash_parameter sfdp_params;
-		struct spi_nor_erase_map prev_map;
-
-		memcpy(&sfdp_params, params, sizeof(sfdp_params));
-		memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));
+static void spi_nor_init_params(struct spi_nor *nor,
+				struct spi_nor_flash_parameter *params)
+{
+	spi_nor_default_init_params(nor, params);
 
-		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
-			nor->addr_width = 0;
-			nor->flags &= ~SNOR_F_4B_OPCODES;
-			/* restore previous erase map */
-			memcpy(&nor->erase_map, &prev_map,
-			       sizeof(nor->erase_map));
-		} else {
-			memcpy(params, &sfdp_params, sizeof(*params));
-		}
-	}
+	spi_nor_manufacturer_init_params(nor, params);
 
-	return 0;
+	if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
+	    !(nor->info->flags & SPI_NOR_SKIP_SFDP))
+		spi_nor_sfdp_init_params(nor, params);
 }
 
 static int spi_nor_select_read(struct spi_nor *nor,
@@ -4794,10 +4802,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	/* Kept only for backward compatibility purpose. */
 	nor->quad_enable = spansion_quad_enable;
 
-	/* Parse the Serial Flash Discoverable Parameters table. */
-	ret = spi_nor_init_params(nor, &params);
-	if (ret)
-		return ret;
+	/* Init flash parameters based on flash_info struct and SFDP */
+	spi_nor_init_params(nor, &params);
 
 	if (!mtd->name)
 		mtd->name = dev_name(dev);
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
