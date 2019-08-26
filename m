Return-Path: <SRS0=O+vu=WW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5B7C3A59F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:11:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD0E217F5
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2019 12:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bM6B48ai";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="uYxSMqXK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD0E217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wz09Vg3knL+bOrdG7Ldt82HmsHLCdg75VuWhqDAwK2s=; b=bM6B48aiQQYQhd
	wBdHE6070PZhREsymwQ9k9XB7hzj9F9i66NUmgwUZNT8pLGxY/oKbspTLTEHKzm9JLPTSDAj1ny8C
	inMvu6RkXkhTPz/CBAFW/2mV1UMA1zKIfLgs29jSOrnN2h2SYkxn/tFr//HZe26Fy6XAAmWIlrwhr
	xJp3XoBOXJuQbkyKXYTsOTODKxzFMXPcUgBKVYlwqqntz5NNi5TwDr8LIiSxKzhhzoNU8mL1fXhRB
	fK8ZBZI/LGZE98zBwy5i5nty4XEJieEH8aXLVDfIPBFT034S4cn6TmPIfuLuAum4/gZsvyiqC6jyD
	T1YvJLGR9RTMDXGvMacQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2DqI-0006Os-RW; Mon, 26 Aug 2019 12:11:26 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2Do4-0002cI-Ve
 for linux-mtd@lists.infradead.org; Mon, 26 Aug 2019 12:09:14 +0000
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
IronPort-SDR: W0a+qKpf3vHAKvcpC/5g5tlxMN46h+CqdlFzJ85mLm4PD0cjw58ezpx9S7JQHkP5Z2mf23U0nY
 Ty1DCj/q5dA6vaqJGz7hCg+h8u4j1EmFgZVrV4SkPq6Y/NYAYZP/MeJRjDXNu86Ccw/bh8fRYD
 4sKG3SuUTTLT23cA4MIZj4tfQ1xuklLcurjBq7tBoP7rygliSvWevT/sNx9fZ52rKY3iUag/N4
 YgqhlqsT5vtmfyVYwhReqvAin4eIBAvq+BQtT58hViqHpHcAMOROsUQb/VPedo/wBbOHGpGiFW
 jiM=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="46588888"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 05:09:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 05:09:08 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 26 Aug 2019 05:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pa7+HYQpqMr3CHw2g9FV7fFo0xfmBC3XBfeCAq7tW/A281oMOAkqebbUiOkqEbOB8hq6l8IBE8ZPxaBactpLI+zGWwanlQ5bq0g6wXqzJpnAIQGtvTwcqYsjA6j3/MZaxwHo6Nb3mI17bAHMbBQuLPMqQ3YpvIHzdjs1TJ5GGUMwzZFTwaEcsv6GjrgEisDXEApxbPT64hDAJlT9kyTAfzoswDti0dMVCg61+TSQ0aKGK4wETcKrEfFBdUABszCrrIQwlhv/OKwCLx8NfEJYBh+ACw4bJeOUD/fEOV7LDxMD3IEJNLDD2UJKa+Kj259s2u7lcINYtyr09LpU29Cl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhggPw0udEUtOkV0O7Isc3yHH71wedI3XwOmfNLo+5A=;
 b=Qvn4eGikSt72CYJNdTQssslsplAbGJ+Z9+cq3S8IGXC6oTGxckJ+0ndKtMKHpsu8dZBdxP5ioDBh/F7CAUAUIMnneWjtNt0Lp+cSWnYi1XVgj4JOWp3HWkvEJVeIoW+z67HKleVtuFIBsz0ipKEZvjKByF1po/KV9gat0gGWnqbwJ6e7Z9cZnBHikVxaIGvaNCb06UIxoH4fX1jPYzS0Ty10DHeLwZIHlK6yENWM8TLxVtSDv8glM7o7spfURTJbB42offhXBsbJqurwGvFgm1sXktcq0xZUUTnIo/XglZvUij25DMrLJQEdl0v8YwsYaxJtGH2s7rSWA0Jw/QgaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhggPw0udEUtOkV0O7Isc3yHH71wedI3XwOmfNLo+5A=;
 b=uYxSMqXK9Gdvc0POrU9VOrNnHXQXVouTlJLSSaE9O6/4l4zdbcSXUisonwf4seLW2C8HyzWtpNe0/gYU3/FvQmIfNdq0N/diDPeH1fHjfjhd4SVnQc01/FRavZx9Gs6rErzDJyXCbDTbiRhlGhRYBIerqhyBo0jf4cepXkIhoDc=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3678.namprd11.prod.outlook.com (20.178.252.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 12:09:07 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 12:09:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v3 16/20] mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag
Thread-Topic: [RESEND PATCH v3 16/20] mtd: spi-nor: Add the SPI_NOR_XSR_RDY
 flag
Thread-Index: AQHVXAcM/ZWa5nusDk2eFvW+kEyFdA==
Date: Mon, 26 Aug 2019 12:09:02 +0000
Message-ID: <20190826120821.16351-17-tudor.ambarus@microchip.com>
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
x-ms-office365-filtering-correlation-id: 4e67c631-0694-43c1-3416-08d72a1e2ec7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3678; 
x-ms-traffictypediagnostic: MN2PR11MB3678:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3678FDDBC387826B5A6D51B2F0A10@MN2PR11MB3678.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(199004)(186003)(86362001)(305945005)(2906002)(7736002)(2201001)(6486002)(6436002)(6116002)(3846002)(66556008)(66946007)(66476007)(2501003)(66446008)(64756008)(5660300002)(71190400001)(14444005)(256004)(71200400001)(1076003)(6506007)(386003)(14454004)(107886003)(316002)(99286004)(76176011)(110136005)(54906003)(52116002)(6666004)(2616005)(476003)(486006)(53936002)(66066001)(8676002)(8936002)(81166006)(6512007)(4326008)(25786009)(36756003)(478600001)(81156014)(102836004)(50226002)(446003)(11346002)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3678;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qsklD+P7nLCKN3mLMk5xcNeyHrte5QVQa+UJxe40HgzLNMZ/kHTVF1LxlEeoP1ff2cI/0ts3YqhlFoGzaT/CsIz9jw1htijwx2DG/IVoQgOyFaaZXWPJy6qFeKSPtjZS1a2nAK/eqZNPu5Xrvy/iaG57sQhgzEYfRE0wLkkG3fcLQU/nn5rkcQoGnASzPOfaYvfj36JTsNpG110G1v3pd4LJjLC+v8vk0hCu6280+5ZVnP8fU0JNtDA0MN4gYgNf6ccNuB8hdMTmlQZ/XiZum8gGl5ILNSVDAXPg8LoeKzIRiTZwglXM6VwstrM1NxJq0aogLRHy9IsQYSD+yC+XmD3CMVZZlbpSNK2TdTBFWETvEJHYU4qsBGHsvlcGNaUiCWW8wppn1HKyzfDJdSGt5xYqNKKuNrJScO4/4VoY92I=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e67c631-0694-43c1-3416-08d72a1e2ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 12:09:02.0575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fs+tNooJm9CXAhV/Svd7tpXac5A7b2n63IZjl6SrifiiHyR0XB8UuLjV4kdGDFMxMg4XBNlCjWYhEiojhlIO13WQXJHQGPiJj/k1hx6Jze4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_050909_226322_F2DFE431 
X-CRM114-Status: UNSURE (   9.73  )
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
v3: no changes

 drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index edf1c8badac9..2699e999d21a 100644
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
@@ -4798,7 +4806,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
 	 * with Atmel spi-nor
 	 */
-	if (info->flags & SPI_S3AN)
+	if (info->flags & SPI_NOR_XSR_RDY)
 		nor->flags |=  SNOR_F_READY_XSR_RDY;
 
 	if (info->flags & SPI_NOR_HAS_LOCK)
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
