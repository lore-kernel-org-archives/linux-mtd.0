Return-Path: <SRS0=JkGG=TI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09386C04A6B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 11:46:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF86C20989
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2019 11:45:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EwF9J2F9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jwm9l5Sb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="TRWzaKL5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF86C20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=analog.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2Y1n1TY8BUYk71QUI1Rw6JaIBqN/YVqpXx7mIFe4rU=; b=EwF9J2F9K7Z8fL
	OK/F947WMe9b2rwp4ywCbZ9XD08Lsu4Izsk69oUP1Wei0+79gnUom6aUr0kMKsoJnnUcG1D+muQfr
	gNeqkmggs4x52iWRqtixs3rdKIrzv82VnpPQT36BhSWudrpJ9XCKhS+fguotOO3MzMWZ18J9xeYfg
	4bzOg+V0YjpzadL/ViZCsLchsIu+rA05kekjDBzp5LGpQ9Y5K2F/4Pq2Is3WjWc8Xq0QSRuOZ9MDZ
	yowU1zCg2NA6+AD4rkVAYE0x0BLZ50oNIfTkU+gpxNK3SqzsT3QZs4oQBL4uR2CDXQPF7PyW7hhFW
	GkCpT/LCJtIVGvNHPRCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOL1J-0004mF-3O; Wed, 08 May 2019 11:45:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOL0w-0003DP-UM; Wed, 08 May 2019 11:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=onHX/dH28+rcBydCYnxXPPy3B5aZvm8nUVopYvgTR/U=; b=jwm9l5SbHZiCeVween5119cA+
 oDO4V4N9rke/rusRO3GQJrPNG6byv07lhXcgnOirk6SS5Lvp8RhvreicQCM0MiisYSNxIJYJGRb2o
 5tDD+NVIgp6Z4DF5upMcCHO0UrNJsOpPjlHUGSkzKgDsf/Jh8UW3+a7LjcYp45Tn6S0C7SlpbmavC
 gq9Ao4o2KBJGkQoB9jsRdnbeBncqECAeKixS5FVOJ6S3n/jAGoKjIsNCe+0Fae6Xui0AtaSrw9dKJ
 I7qmn0GDUdVtAcUQgE8tWK6/twiCH/J8badeZ+HDj5vkqfyFSea2u+aF3NwC6Zl/XC/73/qZHbhHf
 6PdPeIJwg==;
Received: from mail-eopbgr790083.outbound.protection.outlook.com
 ([40.107.79.83] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOKmc-00014q-TU; Wed, 08 May 2019 11:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector1-analog-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onHX/dH28+rcBydCYnxXPPy3B5aZvm8nUVopYvgTR/U=;
 b=TRWzaKL5QJNYiXbG+2Oe8fjWtJL+uaSZN7I1Y1mLvIYHbJGfd+k3GEWsuHa6f8MH3o5FyiU8BEW81HV8R20GJd4CjUz2a3wrhgxNZAp7on9a1AKqAYFUNkner8pEKTAQX+E2T5W2P3Av5RpjeoV1wIG/TVCkFL8QTjk7xwoghyE=
Received: from BN6PR03CA0021.namprd03.prod.outlook.com (2603:10b6:404:23::31)
 by DM2PR03MB558.namprd03.prod.outlook.com (2a01:111:e400:241d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1856.12; Wed, 8 May
 2019 11:30:40 +0000
Received: from SN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::201) by BN6PR03CA0021.outlook.office365.com
 (2603:10b6:404:23::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1878.20 via Frontend
 Transport; Wed, 8 May 2019 11:30:39 +0000
Authentication-Results: spf=pass (sender IP is 137.71.25.55)
 smtp.mailfrom=analog.com; lists.freedesktop.org; dkim=none (message not
 signed) header.d=none;lists.freedesktop.org; dmarc=bestguesspass action=none
 header.from=analog.com;
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.55 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.55; helo=nwd2mta1.analog.com;
Received: from nwd2mta1.analog.com (137.71.25.55) by
 SN1NAM02FT023.mail.protection.outlook.com (10.152.72.156) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1856.11
 via Frontend Transport; Wed, 8 May 2019 11:30:38 +0000
Received: from NWD2HUBCAS7.ad.analog.com (nwd2hubcas7.ad.analog.com
 [10.64.69.107])
 by nwd2mta1.analog.com (8.13.8/8.13.8) with ESMTP id x48BUbuE023873
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Wed, 8 May 2019 04:30:37 -0700
Received: from saturn.analog.com (10.50.1.244) by NWD2HUBCAS7.ad.analog.com
 (10.64.69.107) with Microsoft SMTP Server id 14.3.408.0; Wed, 8 May 2019
 07:30:37 -0400
From: Alexandru Ardelean <alexandru.ardelean@analog.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <linux-ide@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>, 
 <linux-pm@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <linux-omap@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <devel@driverdev.osuosl.org>, <linux-usb@vger.kernel.org>,
 <kvm@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <cgroups@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-security-module@vger.kernel.org>,
 <linux-integrity@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 14/16] staging: gdm724x: use new match_string() helper/macro
Date: Wed, 8 May 2019 14:28:40 +0300
Message-ID: <20190508112842.11654-16-alexandru.ardelean@analog.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508112842.11654-1-alexandru.ardelean@analog.com>
References: <20190508112842.11654-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.55; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(1496009)(136003)(396003)(376002)(346002)(39860400002)(2980300002)(189003)(199004)(51416003)(7696005)(86362001)(16586007)(486006)(8936002)(476003)(126002)(2616005)(44832011)(53416004)(426003)(11346002)(446003)(2906002)(336012)(107886003)(110136005)(4326008)(316002)(106002)(7416002)(47776003)(36756003)(2201001)(76176011)(7636002)(305945005)(50226002)(54906003)(8676002)(246002)(2441003)(4744005)(478600001)(186003)(77096007)(26005)(6666004)(356004)(50466002)(48376002)(5660300002)(70206006)(70586007)(1076003)(921003)(2101003)(83996005)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB558; H:nwd2mta1.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail10.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ce9d3e2-55ad-41f5-b402-08d6d3a8990a
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:DM2PR03MB558; 
X-MS-TrafficTypeDiagnostic: DM2PR03MB558:
X-Microsoft-Antispam-PRVS: <DM2PR03MB558F9126D7D7828247866DFF9320@DM2PR03MB558.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-Forefront-PRVS: 0031A0FFAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: EVMADUNDHRaZyM70b9uaph59oQp+EuDL9gb4q2zI9AEdIWoTcnaNWUBe+9FxlQX2b0O7+4xknIyCoImhifcxNPmppoSR9Ju8BlK50RVal3XQVeh9l+A7s/7PGVZecREu2vX9qqBWISF2RTmLi8m3PEwYjEAyyjEX8vfRtxItEKrtpqEt8nOlt7fYyW49KHTABKF5js7qPbGcInT5wIoJWo41C0yk64vCRQXbGltzcSHsKdDUuQ9YfnMd+RoeSwokkISCJ2+H3HCcqX7T0oz1KORlekqmtcJeKwxjA3imNWlqT71dJwi19a46r8S7V/Nae2BSdjex5jOfLsOo066cOWXqmOwMyJTvIsJGUQfFBnqubKtsYZz5Vk6p09jm/MJubme4zc5q/ucRDNwmd5+XDCdCLSscieyA/YOMT+N4Apo=
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2019 11:30:38.4867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce9d3e2-55ad-41f5-b402-08d6d3a8990a
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.55];
 Helo=[nwd2mta1.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190508_123046_969635_0D9D82ED 
X-CRM114-Status: GOOD (  11.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 andriy.shevchenko@linux.intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The `DRIVER_STRING` array is a static array of strings.
Using match_string() (which computes the array size via ARRAY_SIZE())
is possible.

The change is mostly cosmetic.
No functionality change.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 6e147a324652..81dd6795599f 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -56,8 +56,7 @@ static int gdm_tty_install(struct tty_driver *driver, struct tty_struct *tty)
 	struct gdm *gdm = NULL;
 	int ret;
 
-	ret = __match_string(DRIVER_STRING, TTY_MAX_COUNT,
-			     tty->driver->driver_name);
+	ret = match_string(DRIVER_STRING, tty->driver->driver_name);
 	if (ret < 0)
 		return -ENODEV;
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
