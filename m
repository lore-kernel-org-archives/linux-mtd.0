Return-Path: <SRS0=MD77=YS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192C1CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 12:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF96521D71
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Oct 2019 12:32:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJyLdyXo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="gzlPviXZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF96521D71
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnPHepPi9XsCxhgVxQLc/ZDtU2GVem9WCzbDkw1kAZQ=; b=gJyLdyXo3k4UxD
	HJdQPtPTW7W0kwIa+QIlYnk2xp1LvXne+whrQrTkdebp4Sgn2PLbTtQRRnWXmM00LW3tGlMo0r8YR
	H8EmOn+Mev7GnlVVU50XyyzXgscrLG3uHRxrgr3VpuC6bQABt9fKvDxR8TsDU0PT3870QEBzWkFGi
	OriiK213lku272Gq7Nqjbg9uwLAvYDFbGKqK8VBiS6LlzDDgGyGgalxqhmehFbWweP+qlWtSVCLkZ
	DF6lqVfGiJ22mGGCNmB2LI5Zx0P1oOMTrekJvNo7g8T9fohtabpOJYLFA4kVeBfmTn6v/rfbWf6mX
	rCg4Rgc6g5dPKfuVgNKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNylf-0002BC-FL; Fri, 25 Oct 2019 12:32:35 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNyld-0002Ai-4l
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2019 12:32:34 +0000
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
IronPort-SDR: YyBbLIOJzdB/cCUW8CMppD1q1/6p4e7wZFFd0Z+P3pG6KxPPfPGFwGnxBm26j+iFprAwxoLen4
 Vcgf/7brQ2zAGmJbgwSl8Qh0j2dB/JuV2y1as+AD7TUQ0IhjuwZLCvbw4YAp1asz+modmB1Kzb
 4urP1V5c0OT+LbE2FaOReo6eEJI2Ur/NUF7klTchDEDSVV9WtNM9POgM4qeirfDYPgj2FyZtcW
 e6SeSNRyz8I7TAgUm7shM2LAdnzOp/mggUETsHcHyvRi20UEbHIodK7Y8wY+2YubBkhA0te+PK
 dhI=
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="54411338"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Oct 2019 05:32:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 25 Oct 2019 05:32:31 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 25 Oct 2019 05:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBsLmH9Jiy9YaAzulYFo1IkriaNULTCQFNfJSnKfoeIs0bivEMDKTS1e+DL9+5BrLmOqN5xNZSfBhVbxZB0KmRFbrw5Do1nP0/yawvzyew/iOIXpdgbrLN2mt0iPnlGWsoiHzIuAr26wW4g6b2w3np8IESLsMtvVcEEN9/4MUTGYowb6ydCucEUELONuOVMdPswwq3zR1rGCm41W9L8pxoH+v6hhdg93MsjYlt+IQGxlEuDwGjvpDiannfTb4HR6Wh6U0T1sCOOoQet96ZdTbT0ImZXox5PwwOdqymolQ0ahT22xDKdsk1zQTTgEtsdvHd53IhstS7GjqfSNSy4iyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAC7hy4SQ4v9pgdj91IpzdrK5su3o41qBwHaX9kXbXU=;
 b=SF8UbhHtvs5FtbDK2jphFsFRVnUP2h+mqMK59IdKyTHNF6LDHVIyHzIwUKQX55eRZDmE9yYMPVLYrKa19WKIO5Zfpry4tO/b18ZK9i2t5/gw01BO2aywglIhHgXF0dX8DhNFMJgYe2wlXuYChootjCfLRoJgfDsAX0uQB8u79NRjsMOt3wQFhynnjtDAdRZgNBf8mnzjlohNTNtstOguc52bwWobPduU7pdZrRk7nfB4JyaFlPhVYcQpFB3DZ+zuCzAPrWm+zaQNCauPFMrBF13QqSoZElGAce82NrPfL8iAxAWKU8NIRkFOTXMaScFJj+BfRthdo1ZI/9J25oADmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAC7hy4SQ4v9pgdj91IpzdrK5su3o41qBwHaX9kXbXU=;
 b=gzlPviXZXX3vZKNZ9C76qmWZaIBbUXnLbZLWkZm/qslWIh2PpcxIKvkH2ZLIoS8NSPjJq7nVB+movmPgA9xZADDArz/GhLm9NcCtmS6jfzPz295kYFev5IhcEttZDsDKrmbQKtr36pioEeonFdzpVmITDsiobT8zQTp9+Uumjxw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3870.namprd11.prod.outlook.com (10.255.180.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Fri, 25 Oct 2019 12:32:25 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2347.030; Fri, 25 Oct 2019
 12:32:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dan.carpenter@oracle.com>, <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: Move condition to avoid a NULL check
Thread-Topic: [PATCH] mtd: spi-nor: Move condition to avoid a NULL check
Thread-Index: AQHVizBBrfYzFU9KckSZNr+FJYWyKw==
Date: Fri, 25 Oct 2019 12:32:25 +0000
Message-ID: <20191025123217.12790-1-tudor.ambarus@microchip.com>
References: <f86ee955-d08a-cd24-e214-95cb3746e756@microchip.com>
In-Reply-To: <f86ee955-d08a-cd24-e214-95cb3746e756@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0125.eurprd08.prod.outlook.com
 (2603:10a6:800:d4::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.9.5
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 207a79bb-0467-4e7c-5fab-08d75947642a
x-ms-traffictypediagnostic: MN2PR11MB3870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB38700BBF0DACD2E049AB2438F0650@MN2PR11MB3870.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(376002)(366004)(396003)(189003)(199004)(25786009)(76176011)(6116002)(6486002)(66066001)(36756003)(11346002)(486006)(446003)(476003)(2616005)(86362001)(256004)(14444005)(52116002)(66446008)(110136005)(66476007)(64756008)(99286004)(66946007)(316002)(66556008)(81156014)(81166006)(8676002)(107886003)(1076003)(3846002)(186003)(50226002)(102836004)(5660300002)(6436002)(305945005)(478600001)(7736002)(6512007)(26005)(4326008)(14454004)(6506007)(386003)(2906002)(2501003)(71190400001)(71200400001)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3870;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KdszkHdTJmOJ254iqY5cPZ+rfhJGDP1Is+0nlKN9qRiM9IXU7tZDEjglFJRg1jcw1uoANs0ablxcYwJW/yHGXrO3H+MvKXsmNtDka8alTB/cqpOsCJ5NPvh1S8emNxqzfLhEbN2O29DNcjLJ1OJTQ6WJkRKhxqgKR39afo+EDi413Nn2fuKFSaUDbj5X70SzBbmjIFaqzlkdItaBubaQo+PSCQUXiCtFLxMWdDyLh7n3CeuWti+gJTJeLhvul+MpB97A2aMdIjeOiYxLMuoHFEL4jG9TE0o2wq1KBt4V8WVY99HXSEweB3HMqBA3E9eeNpq8M72C/CG+Sd4xtbinp7nIkGT6oKD/wVTnmkf4UCqYqyrMBtWHcxQtBDOOaA/ur0Ak54nFswVRWpx5Ef/WBwbxVlOXGODqXArzQBuxh6Jae0SLz1yh+hZLlheHGbzY
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 207a79bb-0467-4e7c-5fab-08d75947642a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 12:32:25.8210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKME9Ix93agutHaWqD9lQHNE3uMJXF1I3Yt3eAYAIIrDxyM7lJjqHV0wZQhdIHLcMKdKuvZFWNWORs/txaHOQWlkQpNFLs1OVc8K19sk+4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_053233_246394_2D7CA1D6 
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

When the controller is not under the SPI-MEM interface it may implement
the optional controller_ops->erase() method.

nor->spimem and nor->controller_ops are disjunctive. Move the
nor->controller_ops->erase != NULL check as an 'else if' case to
nor->spimem, in order to avoid the nor->controller_ops != NULL
check.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
Intended for better readability.

 drivers/mtd/spi-nor/spi-nor.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 07ec7841ec32..d0e1502d21ce 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1118,9 +1118,6 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 
 	addr = spi_nor_convert_addr(nor, addr);
 
-	if (nor->controller_ops && nor->controller_ops->erase)
-		return nor->controller_ops->erase(nor, addr);
-
 	if (nor->spimem) {
 		struct spi_mem_op op =
 			SPI_MEM_OP(SPI_MEM_OP_CMD(nor->erase_opcode, 1),
@@ -1129,6 +1126,8 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
 				   SPI_MEM_OP_NO_DATA);
 
 		return spi_mem_exec_op(nor->spimem, &op);
+	} else if (nor->controller_ops->erase) {
+		return nor->controller_ops->erase(nor, addr);
 	}
 
 	/*
-- 
2.9.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
