Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AADC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94AC06117A
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94AC06117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NF9KUR/8UfjJO4GiCUF9NXblB+auvYMvHdor+dSRpCE=; b=s6sO4esfrxgxB9
	6/EflLZ0iem39coUguWpai3ONnNEwxPHc5idPiJR4oloxV41Z8KPODRKruwudDEMGcM4nWv4u5Iib
	b4sYZb5OqrcFlrVLiRIHusFfaF+Gf6pEvtSM4sZbwqIPuk0gM+HBocUEWyHoPFCaC+/TcFIgbwyu5
	HQGTVT69n9IebKgEd9p9xYEyj3DplTL3H48svtDq+keudLO2rZbwaejyxlA1n7ktSlDeyV3wPKzo3
	tUJ8BSCdEblBrd+N/5nJKg4wWSS0a6RsQox1BrwGrv/QLRR7pD3Uq9s6OigYs5NCQxvFqRVoE3aKy
	VQzEHj+bXZFdIRPy2sCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnz0A-009iIL-PH; Fri, 19 Nov 2021 08:12:06 +0000
Received: from mail-eopbgr80131.outbound.protection.outlook.com
 ([40.107.8.131] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnz08-009iHH-C8
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 08:12:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmOJNG7y+GMMrQZT0OQAEs4GJTTnds4K3j5AVXpKs9XOqIs4u+UdEdVz46Hjex/MIwwGalNz+MNw5PUTscMP9Ucscg6yMBkz6E68bQdXlqwjOfsCZX+O4NvZlqrDY4qbvTibh9rv7k4Qvn6513WX1fJwGUHbDcHQxubb1bnISJZ1aRQejI03n0uegNbITjrb/T0gjwqKA31nLjr57IRHrbBViUvizO0PQ7YxKi05oZ8+/nhxCUMWxhD52OkEjRxxLKZ8mUx/HH6g8B/qfr691kOQzODrHy5nuMa1LGR2dGSW8NboXphoxdcln3d0U2csmqrxkW2hS8WLqtu9owW2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPtjCkHmb+bzG7B0J3Tj5fCU+m9r9hYC7swunm9MwCg=;
 b=QH/XyTa/AnbKu9+hhirYXYIoyfkQ3439x4XQSMdHDymIdxwFo7dQCumf22XT6aIeR4R/wF6Xwnr1+rzggl5vJDtJApmmygCwM/zDe38PIAi5vpsRea/vDm8jiBMseMLuvrkpWym07pX4M2JE8lA2+D+egaQUY6965bby1rBT396Oa4PU9ReqnlYwET0aLKhozUbZZ2ayRumrx6BVEQiycMDvGMGRcjfa1LMJODt4Av80w4bZrufIrAcVYzNsQo7ut73K6ilznoItltFWZYdZ5o0ufde8WlIanA7DfXuYtW6CLuORCyzwfl80tH05kzjMT44lOTh2Kpdcjh7oaAzPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.8) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPtjCkHmb+bzG7B0J3Tj5fCU+m9r9hYC7swunm9MwCg=;
 b=xJTFZaSJ4XcW4fLJ116uy+eV5zd33Sb/uhozy1W6LOEKIeVyc5KFxjS6rY4iDotUFL5hGHl9e0wlmDZ0+R7LLOyC1PmU9DXPXOVhgrs8oiUs5srQPY3wyZOIVnYGr4RelTmZzGlvO0tcI6UlO4qXj771M5bMwEQ2karSo2iw+A0=
Received: from AM5PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:206:1::26)
 by AS8PR07MB8374.eurprd07.prod.outlook.com (2603:10a6:20b:445::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11; Fri, 19 Nov
 2021 08:11:56 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::58) by AM5PR04CA0013.outlook.office365.com
 (2603:10a6:206:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Fri, 19 Nov 2021 08:11:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.8)
 smtp.mailfrom=nokia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.8 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.8; helo=fihe3nok0734.emea.nsn-net.net;
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.8) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 08:11:56 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net
 [10.151.74.146])
 by fihe3nok0734.emea.nsn-net.net (GMO) with ESMTP id 1AJ8BpxF019881;
 Fri, 19 Nov 2021 08:11:52 GMT
From: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: [PATCH 1/2] mtd: spi-nor: Check for zero erase size in
 spi_nor_find_best_erase_type()
Date: Fri, 19 Nov 2021 09:11:47 +0100
Message-Id: <20211119081147.9895-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 7eacf0fd-b6b0-475b-ef97-08d9ab3440bf
X-MS-TrafficTypeDiagnostic: AS8PR07MB8374:
X-Microsoft-Antispam-PRVS: <AS8PR07MB8374951D72008FD248FF8721889C9@AS8PR07MB8374.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jrUDmQAok5ETyOOEbPMcfp9mS96eaOEEQpe2jyAIKEKL7o5bRjt8OhFURlK82HrUP3prOlsaDsx81WTUgEYYNyORlC1mZAysc5cL2//ui1IUtAz7Ky+upc5o4eNXHMvhR+YSk1pvDoGk9/N+8VCuwXUv5aSkC0GweBsFs3DLPKXA12R8saOciw6iT3Dq35jKB0BnCj8VdHy42FgUTDeISoR+Z8lHkQqEUvpQrNKnsjc/869Ux58yBnhSGybPY58GxUKGIyAKz1kNJ84yitLl3SKrdNYjax6qRhax8D7ormO8y6IZrO0gHi6pMDFALVA/6ir8XsuQwBx7M0YXneQIFi9Vbc+LCDUo4YZi/J2pYc/QcJjGa5pEk+QFr/hNQXvVNygnTtXAm2YUoG/ue1MMXlqE9gvnmGYaFqs1nBKD5HvZsRmKyD2/mAE8Srq7HY5HtZB3RQRm2NWjy98GtxTs3dY048C965nTczOVDrs9NJRtscam6qYgyo7FODEqC4qMZxZrmJKTtWGv6g9DkA2xz2DI1krZQO+C/dmjWEx6mI6Vokzvn/pmvrDwdhcNl6RNkQ/2KimHxy9OCcBsObdjUKHy2ESJ2Z2WFN9K+LTLjMO/+L2UrBCzbmNfwuQXamFK2rYrtNbAoI1WvzIKft2bTvRR3NGgKNqDl88fqgjGWgSVso8nL30U3yJOvQDst2KaYE1msjHHc2IS4H1FVsy+xE3i4LxjRcgRSXeF9bVcn6M=
X-Forefront-Antispam-Report: CIP:131.228.2.8; CTRY:FI; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:fihe3nok0734.emea.nsn-net.net; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(356005)(81166007)(70586007)(36756003)(186003)(8676002)(82960400001)(316002)(70206006)(336012)(508600001)(5660300002)(2616005)(26005)(36860700001)(8936002)(86362001)(4326008)(6916009)(6666004)(2906002)(54906003)(47076005)(1076003)(4744005)(82310400003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 08:11:56.1746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eacf0fd-b6b0-475b-ef97-08d9ab3440bf
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.8];
 Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_001204_465246_F92E15EF 
X-CRM114-Status: UNSURE (   9.29  )
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
 drivers/mtd/spi-nor/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 88dd090..183ea9d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1400,6 +1400,8 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
 			continue;
 
 		erase = &map->erase_type[i];
+		if (!erase->opcode)
+			continue;
 
 		/* Alignment is not mandatory for overlaid regions */
 		if (region->offset & SNOR_OVERLAID_REGION &&
-- 
2.10.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
