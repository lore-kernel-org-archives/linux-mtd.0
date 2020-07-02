Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31312C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 14:06:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F205D20780
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 14:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0vRWuqV6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="dMwz+HNg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F205D20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4yaOT2HLU3drBOKy2+O4MpXw4qhF/XMcXYfqIX6ElSs=; b=0vRWuqV6wuRnx7TR7awL9gEzkP
	BoRF0YyV7+HboDjzIELzZ5NmBrxKGFL5SVHbtR7/8rVgXbMoDZwrB0mxle/IJ4yj2KsHtv+Eof+c/
	1NMEScxUaDF5BrBrzMVduMCIOIu9rqHuccjxYY0WabonK2JtCibF/HzZ72Tpk+6o45gUX4LWsXqWd
	DHg55noWpwcdG8XNZnDt9Uuwg+rnt0CUIUVaTshVvpGKCzWugm6+XnQOQYqS7Bgxf2RbI1UAJSNxb
	aq4MCdUnuF02csu1PIc4yPFk1k1YDw7xhuXUUB+oV6olgr7axr2Xk14CrKa66QKma5WWLLnKYhV71
	pCqabj8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqzqe-0004gB-5m; Thu, 02 Jul 2020 14:05:56 +0000
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqzqb-0004fC-KA
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 14:05:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MunJuAj5ksgVJRQcnJaVFtxmwmfsWhdJ1goCFPv7Jsz61j2ZiSNY9Dt55rCXhLzDiQpGYoMSfFGnnUvQotJ451F6p9IhvRJRmlydGDqvL0NOwAaWw8rLH83cUYFiC7HgIFWYWhoYXQ7nk2S1XYrk2wPJF8WssDoBJnc6oyPf4aYT8Z4W6Wrv2zSdPA09fuYKz2BpSXNGCO/5mTMc+VHk6oHbW6NpUOEmalfTqVnZTmTD5iw9eiDxjN6+SjCSCuUmgz7j3EGyRGGTBP61riiwbQlO+lAxJUo23OU/xeTIpIOywlOLhDOuPTjUER6dX/zIIKGVLv8tG8bW592vlvrw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wLCWd5bmqmtpUSt2p9Fg+Zu1/TY1FGbB9fTYcGSaBY=;
 b=SAdU8Ef55+XpF6WAZjDHaP2wMtfSvhEnSDQYMvRrws6lLQGk9pCMShk4FDfp4Hram3qJo3DSCNWyiS6NZaMwlC5ZBtu5MVgYu+LwhzpQjng7w5m62anUZAOfE4EMrj1hte0oLvmUK70ltdJqYpfgc5q/crleNdLPIsSdEi1DDTXOSVnknnXcQNNRLp2EOUGQSJ2bzGROF88orHuYEuo1C/EAiP0Fg5gWGOTKft3BBuJmzIjOB+86dMbXBiTu9BoceXoMP12ue5KjRGxcxjTtn1Lpi7IALFBiIAK6yPIz9dvBaOyjF/aozDsQsp5E/2+2rg+5O3DLAMTxvJ/nWbmfWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wLCWd5bmqmtpUSt2p9Fg+Zu1/TY1FGbB9fTYcGSaBY=;
 b=dMwz+HNgN4wcVa7JJVt66mlLcmRvWZk0i9gKrcyE/DlXWzgbYojoo94q7x8ZxO2uIfX+pVpdzCIsWrPPAcw0Kgo8Fcbx5xMYF1wK4cCSZV/zVjNcYem79ii2RjJOjNJhEQocJ7awIUM4eFBr3dItKc+jrxT34Cxg73bnPlS29dI=
Received: from DB7PR10MB2490.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:50::12)
 by DB8PR10MB3211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:117::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Thu, 2 Jul
 2020 14:05:50 +0000
Received: from DB7PR10MB2490.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac04:ef33:baf3:36f3]) by DB7PR10MB2490.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ac04:ef33:baf3:36f3%4]) with mapi id 15.20.3131.036; Thu, 2 Jul 2020
 14:05:50 +0000
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: Add support for Macronix MX25R1635F
Thread-Topic: [PATCH] mtd: spi-nor: Add support for Macronix MX25R1635F
Thread-Index: AQHWUHnkhm0KGucB80SMpr/0kNl38w==
Date: Thu, 2 Jul 2020 14:05:50 +0000
Message-ID: <20200702140523.6811-1-frieder.schrempf@kontron.de>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.17.1
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=kontron.de;
x-originating-ip: [46.142.79.231]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a2e70ef-7e11-4073-ccac-08d81e9106bc
x-ms-traffictypediagnostic: DB8PR10MB3211:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR10MB321170F7A62848A0D8FCA2F7E96D0@DB8PR10MB3211.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0452022BE1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PguM3HAS7oo8aZUXS2L6aTDjMcE/V0DY6QMzMvKxYlf8qI/XX4ITCiicQA47GDYVTQlYXg6Ta42RpJURwrZSGQUrKiPaPCT3gYb6PPNAlpQPXY9DCP+c8xpbQiobHYsaTIOrEltB8i0Ot4a4pyVEA5n6w9qTZ8HjAAf7PsXM2jYWwReQaM8kw/hm3D832b5hSTws5n18VTiDc3xfy6T5ttMhvwM+LJMISwSYQgfmkuywFFVMhO69hgndUuQ5BFO4rAgt1VsMSnsBNfyRmzYS5e36sLJ9slwkT6u7ML6CQqBTm8ZrVDo252vwd0/naZT6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR10MB2490.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(366004)(39850400004)(136003)(396003)(8936002)(1076003)(8676002)(26005)(5660300002)(186003)(66946007)(64756008)(66556008)(66476007)(66446008)(86362001)(2616005)(36756003)(71200400001)(76116006)(91956017)(4326008)(2906002)(54906003)(6486002)(316002)(6506007)(6916009)(6512007)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: BRz4XYNqB2LhetPntB7GlpeyiA4cwIWF0yENH0pzZrtx2Z3rxOeYA5/JdLVw78Y2jrgW+B6+YbWkLBZfuy06w0oqJH6aAmve6CIT1sNR1Lo9MhR5Ld2pP807I0KlxdEIkEcO9OMf+WQfNVX+gJUe3PxThjP5ER61RVs5VM/llKkVn8uLzj9Pt1Xgg3gPFH/8P2tDAKukXcR65nnneYWIPtALZ1VG+F++Wvbd8WBR/lGo3qWHUFPxEoUGtbzI3eT/MXcRPaER07c3MG6DQ8CrzigwEWHlHhncYpKM2FqVLKoQP/UYJkZw02UzRw5iwKVCLCJJRsML1pUn1P7VdkBg2+2rY1aJIf4V8hkmuhuO15Uqezt2m1nONeynOhsQYzgrMk32CYeqpQ50fUVdgXLRU0U3QxCP+SlLmHvgMWGRCb5eh3y/o7s9dyEOboZG1a6JU3Uv7aNAn576gk85dQVJ/iz4dET2crZMtar7KhQXK8k=
MIME-Version: 1.0
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2490.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a2e70ef-7e11-4073-ccac-08d81e9106bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2020 14:05:50.3733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0U7//6McMAzo0/R/16KiaRNNvmYpSjN6KKxgaPXlf0/duRG7XDJiTqLspfQBSElljRtqrXuOpbrFpwDmkyNDDS0lygb8fi3CVWkdbsghToA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_100553_782315_E548A3B7 
X-CRM114-Status: GOOD (  10.67  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Schrempf Frieder <frieder.schrempf@kontron.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The MX25R1635F is the smaller sibling of the MX25R3235F that is
already supported. It's only half the size (16Mb).

It was tested on the Kontron Electronics i.MX8MM SoM (N8010)
using raw read and write from and to the mtd device and
the 'flash_erase' command.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 96735d83c77c..0ae0815a3633 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -52,6 +52,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
 	{ "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, 0) },
 	{ "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
+	{ "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
+			      SECT_4K | SPI_NOR_DUAL_READ |
+			      SPI_NOR_QUAD_READ) },
 	{ "mx25r3235f",  INFO(0xc22816, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
