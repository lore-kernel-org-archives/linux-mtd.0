Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0D8C4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 16:10:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0EB206C2
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 16:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="THUUCWlq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Y5UrmXWZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0EB206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EbeG/9sW3EKzbUhAY6bCYX1eSH5ghlg1IUUkMPs0qo=; b=THUUCWlq35uH3N
	MTUJBnkpCsEHLVsLrfPwLOk57fRpQ5xmCKRnQePeQEjFjERu8qBqpuQ855eKUm3pGas31H+kp8d8G
	0tKHnKql89Rb0hkvrby5KxT/+nrUn2qVgKCjHgg+bxJdOjQWGMQ7I9RCgM1ceyXC70Oga+JM+BXUh
	33nxBqgTyyrvEWEi1q3MPRiLBDsm4em0yA1RWh7ohyAM2eCHY0BaBYPV8yQ8lc4DxljcTviki+vqs
	VkA+sdD4Nq3+24T2puFoDbWEa8qVAEE3PYtSdR7yf70bH6jtCCglukG3wFB5EZ6YyeHmtwLHyn/BB
	ux9RO4HJ8Dp9R9EC5LPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAG3f-0007Vr-CM; Tue, 17 Sep 2019 16:10:27 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAFpe-0008CE-3O; Tue, 17 Sep 2019 15:56:00 +0000
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
IronPort-SDR: S+r08OM4ZvxR9Ida96wL871rGsj86sF2zHZ1lmEVZqUTzgt+5v26pNwwDsxavXX1afwsCWqIXO
 5rANfLiXGmweArveB3RFBg47w7IoXFBXxeoUZn6y6C1D8yxy40wRuHv+C1tnuiKoo3qvkC79N/
 ghwekKF0gbZZRrRBTvfHz0MrhXpj1oCFTk3UI1PwdjWfVnhZRrtL7KiM3ErH5sQgrpFOR2/2tN
 be0dQbsNuA0ASd2EAYA5fqHWENGjdyMBdUNUaCbIe7tkC4MIfTrqzHkHuf+ZDYjO1gN4ZH9LX8
 bXs=
X-IronPort-AV: E=Sophos;i="5.64,517,1559545200"; d="scan'208";a="47827334"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Sep 2019 08:55:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 17 Sep 2019 08:55:56 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 17 Sep 2019 08:55:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/WCHoqBie1UYv9saLtUsQRsrPOYO8eqRjcnQpMSEBivSNi4aBZqmxj790bpO2zkBX51X/qmqgVlLn0rkoOZrMcqVdfivmMFVQ8PxNrWn6Qm+Fl6Zbl7w9lAb2w1fmwTmrGTuRzV5m13Er0UC6dsXTnetAtsh5bw3keQmFvb2evKOoA05IJoRbK7WSiyuBM5+iKA1WpCYKqWolqZ54Dw6EeZJBnVUQBsfJ3AmY5n0lH6otIEvV3zXqnxJKwUhleNLlmlwzgkFxwrwvU4Y/+V7ppDWCm745HDaGil8fqUjjjJrVFBgHVAJux0IS1bf+pxJASmCRLgzsL8D2u+fPrfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHIiKp42dykWZTwAbwI6qGxF6kr81Xa2SNVhe+Aanj0=;
 b=EOFBjqi6a8g6pZdzBBReE/Dpu+Ugsb44xiZJYS+rDxlR5dt8P/XtiQd1/y+UiRYTjK8/oEm3ks60m7JdzZsuj2rhURdRcWn2d/Krua+h6O5raK8G09cv/EMSsygVHHn7BTH9iCMZVIvgFXj/ZrOyD1wdA1lPggaDByc/7QxERKykN7+18odlKcZOKrsObR01AExpPni+dglqvJcdsILNRi83V938oRHYa+YpiIJaMKDlXbiIdedcnDQbt/P3njlKLaSVH+hkf73erX8M4sIsd0dVTD2vfcG0E8B7zl5+jDYyuY/pENW8BhL7MzrBHLChUp/pmok14G9oNNZr5b62Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mHIiKp42dykWZTwAbwI6qGxF6kr81Xa2SNVhe+Aanj0=;
 b=Y5UrmXWZXkDiunJMmg+BPE64D0grBehPrb29Njysu8i37y/pX/9BkyPEizCMrEvPsFqqCIYQN+LSypvUPZRzeEKU5xyID1O4Q6tu5vOXvdbYyNeLg0Cg7BTKLqcTeqs1esiDTSVkjFncsl3d2gj7z74U5nc5Hk2BbE5ZTCu5wyM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3725.namprd11.prod.outlook.com (20.178.253.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.21; Tue, 17 Sep 2019 15:55:54 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c951:b15a:e4b3:30f7%7]) with mapi id 15.20.2263.023; Tue, 17 Sep 2019
 15:55:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 23/23] mtd: spi-nor: Unlock global block protection on
 sst26vf064b
Thread-Topic: [PATCH 23/23] mtd: spi-nor: Unlock global block protection on
 sst26vf064b
Thread-Index: AQHVbXBjDO1Czo3MO0OTInLfcDjFoA==
Date: Tue, 17 Sep 2019 15:55:54 +0000
Message-ID: <20190917155426.7432-24-tudor.ambarus@microchip.com>
References: <20190917155426.7432-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190917155426.7432-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0302CA0007.eurprd03.prod.outlook.com
 (2603:10a6:800:e9::17) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 215e3ad1-1624-42d6-87e3-08d73b878586
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB3725; 
x-ms-traffictypediagnostic: MN2PR11MB3725:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3725E52695018661E3D9DE61F08F0@MN2PR11MB3725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01630974C0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(346002)(39860400002)(136003)(366004)(199004)(189003)(76176011)(52116002)(5660300002)(71190400001)(2616005)(6486002)(6512007)(476003)(11346002)(81166006)(6436002)(66556008)(386003)(6506007)(26005)(66446008)(66946007)(64756008)(186003)(66476007)(102836004)(316002)(446003)(2201001)(110136005)(54906003)(8936002)(107886003)(478600001)(50226002)(25786009)(2906002)(86362001)(81156014)(2501003)(6116002)(3846002)(256004)(305945005)(7736002)(7416002)(99286004)(36756003)(66066001)(14454004)(8676002)(71200400001)(4326008)(14444005)(1076003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3725;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: W2ooYE+qEuTKoM+NhK6tYlPVW3S+jXeGJlrTYC+mORU2z8MVe6jOZsaF6CXMpStd3ihHvaa03Hwg7b8fp8IOkVZY2PqrGP05EF9LOoi5xkaDRSt8paimxBnMUJmVdWaqUHcTGtIDmZNdlSEyDGnMPyWDzJEp2TN3qn0MS6+xxzKoAKzWQDDyZc5hMBzV1LB3wObDrcyeaqRhBAe9AIANGNqe4oPIdYsXLI80kn7Q4xoQt5o0VrH7ie+RUOvTkM7stb/5OjENAW/6IJxOoy7/nHtHS8Fw9PUWadJ9irIvK3Fh6fN6Xe/Kyh0o5etLkGzekGNEYoMuPX5rPPuIgI42MQeK3pMazUeFBD0eyWqMTUuRZhQG8FyEm5Jr89z/6BR60m7yOTzVIGJBc5IUf5STCeibTN+L9+u52FX7T+AFtX4=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 215e3ad1-1624-42d6-87e3-08d73b878586
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2019 15:55:54.7232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m0ND4Adf+ceHxZXxC0fPLvY/UZCL50SrBsWT2HFVRL2zL6UZpgkH80oQJ5fBnfjtpIZdeayr22PMIMW9ZtrCRo3zqZaTiB+reX6DEW6tq30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_085559_432656_C0C45EEB 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: linux-aspeed@lists.ozlabs.org, Tudor.Ambarus@microchip.com, andrew@aj.id.au,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux-mediatek@lists.infradead.org,
 joel@jms.id.au, matthias.bgg@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

To avoid inadvertent writes during power-up, sst26vf064b is
write-protected by default after a power-on reset cycle.
Unlock the serial flash memory by using the Global Block Protection
Unlock command - it offers a single command cycle that unlocks
the entire memory array.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 19556a9dd3fa..19919c9c1bd8 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2442,7 +2442,9 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
 	{ "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K |
 			      SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
-	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128,
+			      SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			      UNLOCK_GLOBAL_BLOCK) },
 
 	/* ST Microelectronics -- newer production may have feature updates */
 	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
