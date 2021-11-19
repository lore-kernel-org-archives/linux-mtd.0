Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0982BC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:15:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6681603E7
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6681603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TjGZj1cSB6gICMSPKl+P4lGbHfc7Qv7Y+qszZViQpHY=; b=0t8do8tjUREtwV
	4mLRzpTIFUPpkH6QTYPEQPBq7Wm5fnVJZFez0aHlIpQlm6akyMSCx62a4Owbte72P8o+irN+Je+nb
	5qHTDDB317gTzLucLBpVI6fh1EUCtU3zpf4TwLdEut1y4Nw/QTY4h/4/WSxEQz5MgysY3BUHIekpL
	/OTgjT9vw0A6VrkB9T3ZtpfV1CpBBrffnOga9AhKz9ubChR2nzmyF9VAqdt3nId7atx+CIK1u1gaL
	6y6NnOc4oB/7HZ+qQlwZ8mRzFcbl2ApAt5DwwC6dwz3P6cxHQG4zqksuFmEbY7C5dWtGAHilb2aqU
	EAan0IA4Hzt//D0Kf7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnz2Q-009ioV-OA; Fri, 19 Nov 2021 08:14:26 +0000
Received: from mail-eopbgr70099.outbound.protection.outlook.com ([40.107.7.99]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnz2O-009ima-5G
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 08:14:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mzBHV6vhz4Fbwzw9wo6A5/GCPWS6wg5zjqwbjSD+jNhtUANFn5JE6XkzRjlDWouTCQ2rjy/+OkCR8Hhyf1MYoBGe8NQ5KsNKE6aMxQzIZWGn/vyfIJZa1SBofP2OJ46RqTCFtChY9LBrALXo1JFiggXZoPf16+vF0A2QpYx6lCcTHkq8YgbhsdtlH76BgCJPKwCE52zCJteP120DwYRodmxsTi5LXYjWTwGQK6EbayNjBNdmBxXRi6KwWLTTu3Px3lVAlRvS99dVAX5HaqdRah760sKsv+9L67C6/230582txjPiEbz6mTestZoeSIgwNw4NLXvKpWQf/bs1iDww+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/5KWa8zqFIOSJ9qIRCWVS/Boh51W2vNyr4PnFXxik4=;
 b=ki74PnPR/7YNhWpjzSrDtvo0SA+1TBpxF3cVYzVPfqHBT+gWZdqP7Mg89k2P0o+ypoL3LDrc2otBOgdFiNR28Xo6t4KsuMzVZSjT02JsrcI2yjLKo09Q8j34FpSzkZic3VitP6lsuBvt42ZFxjgDiBTU3+OwGmA8D173SKwNRVNjBpm0J5ZWA/5xiV8XcPV00PkqyU5tN9c8P7WBTSPaeBfJwpoOWrJGQjLa8KedVqF7D+juHUj9yhKm4qdKv9m70MtFXqURtwydQ6Xpk1L0gOjQws3EVfJmmaXQeVxpC3MYrdXuNAyNIPYVURT6VjXgJqTgYNuLCP04Ye7hXjhYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q/5KWa8zqFIOSJ9qIRCWVS/Boh51W2vNyr4PnFXxik4=;
 b=h1NAMDIy7mRiwBMuTNrlcbyQMJW1w579KWx3PlsWtNehr/kSItqoJlv8JV/Qqrm3to/zH7/8xTQktvFOCCpSJbUKg9Sn6Rjw3RSE38mf1T+P0RExbhE+qYPaniioxNsBQa5yejyRhFZPpoQ7gg+B1tCYpiqfRvflCG/owmZoIQg=
Received: from DB8PR06CA0047.eurprd06.prod.outlook.com (2603:10a6:10:120::21)
 by AS8PR07MB8186.eurprd07.prod.outlook.com (2603:10a6:20b:375::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.16; Fri, 19 Nov
 2021 08:14:18 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::5c) by DB8PR06CA0047.outlook.office365.com
 (2603:10a6:10:120::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 08:14:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 08:14:18 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net
 [10.151.74.146])
 by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 1AJ8EGdX022091;
 Fri, 19 Nov 2021 08:14:16 GMT
From: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH v2] mtd: spi-nor: Check for zero erase size in
 spi_nor_find_best_erase_type()
Date: Fri, 19 Nov 2021 09:14:12 +0100
Message-Id: <20211119081412.29732-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 01e97c8f-93d6-4dc4-d96e-08d9ab3495c1
X-MS-TrafficTypeDiagnostic: AS8PR07MB8186:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8186DD24BF3A1C8785A1CE0C889C9@AS8PR07MB8186.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EL5bXrqi/z/+9QMKWByQKe6EZrRoAEplLwBvcol6hbuJWlQG+i8Vz1XaS5rwoJ+M9G+FDFCEIa4V3Q/OVftgQzHbfiJyOVUdY+bwSpLChzD34wNsS9QPAzdUKEvGWcDMTx7meTs3rTVvrIhPTTVhl/XhHabMznvvg8exCBwun3CGLrIuRR00q+BnJhzMTuq/besMqMz2zgGpwIEHHQzM2kOBncfNaJFA4ZwxjtVQZE/C2MyyW/sZOOVXa573ns+sbZe6jFDO6Wm3Au9CcL4wWNg6tu+K+twUH/PcCQZInTiaNdG2knXmuEbMD03Sfs/jsY7Pcr9CrcVIkb3HlgBEmhg3nPC7Z8VtM4iRfeDbdiHTsg1/4koAuhHZmuOOTl2GGbTX6duTG7h04CBaSC94GXMqc3VLBskNM6vT1TSWJodHOGaOz3E2fJX4b4LbOtUX0INCN6+Tql+YatalcImYrlUEx68QJfd2q1Hi3dq9H4jyeQR37m4bEwqJhd/I5I+5M3Zt3Hc9/KztSSQ4KbTl9dax198f2LazI2c6bWyCcyYu+hmhe+eBcdRLyE6PCbhkSyCTZimi41tnBn6QMuBFWNX9aDRu+SFtUyzdmD3SomjP/h2x8OVhrkNA5PPatcw4DXMpjWTQcAd79o73xjxogzIyj1OoWDkA9MGigpKf6dcoAgKzwA3Q0/cxrVH5XYX1RYNNDEUFFdQJFpYYjpDgl5fblGglbaFy7x1HrWGWCw+N8BPLtJ2VRJ9nWd531bjwaAAFjokOUf9jcaGhYfTHHtQrC4tHPkvXDup/nceYWdk=
X-Forefront-Antispam-Report: CIP:131.228.2.8; CTRY:FI; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:fihe3nok0734.emea.nsn-net.net; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(8676002)(316002)(2616005)(356005)(336012)(6916009)(81166007)(26005)(186003)(86362001)(6666004)(82310400003)(82960400001)(8936002)(508600001)(47076005)(5660300002)(70586007)(70206006)(4326008)(36756003)(1076003)(36860700001)(54906003)(2906002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 08:14:18.7764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e97c8f-93d6-4dc4-d96e-08d9ab3495c1
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.8];
 Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_001424_241683_F0B4BE9B 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Erase can be zeroed in spi_nor_parse_4bait() or
spi_nor_init_non_uniform_erase_map(). In practice it happened with
mt25qu256a, which supports 4K, 32K, 64K erases with 3b address commands,
but only 4K and 64K erase with 4b address commands.

Fixes: dc92843159a7 ("mtd: spi-nor: fix erase_type array to indicate current map conf")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
Changes in v2:
erase->opcode -> erase->size

 drivers/mtd/spi-nor/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 88dd090..183ea9d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1400,6 +1400,8 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
 			continue;
 
 		erase = &map->erase_type[i];
+		if (!erase->size)
+			continue;
 
 		/* Alignment is not mandatory for overlaid regions */
 		if (region->offset & SNOR_OVERLAID_REGION &&
-- 
2.10.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
