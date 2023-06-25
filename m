Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC09EB64DC
	for <linux-mtd@archiver.kernel.org>; Sun, 25 Jun 2023 10:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FKF5cFTLrayNtAaoIL3aNP6rRV9J+KrUaASwEoqWDVw=; b=Wsawxw+Wq5tUlJ
	OKEhmZyGfItqQiTEv6nr5HH4+0CmeHq8dxitLuCy3jCc4CSOMdALXNl05bfLJT6/irIEb0/ILo90k
	WOCOcCU6kluGr2bqz1zeCIsZTs1b88UAwT51N/TAk6oJHYYIJn3zdi5H7xyS62FVOKKqL5/G+i9d+
	QAed2M+T5z8MNEpL+Zkq9pfQafw3FBXul+orhDlz0nJVaa0BsUIVqmN2BBVJdDkRrCYUHcnbeFDQL
	aXUwvfFejCWpI5w9ifFQbMrqVLWADBNVKHx5EW3v6Jg8KyYvm9Sk41DXp/usYjzdZysdWNcdlhbf1
	nyb+Tts/X/gUxCoazWIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDMaX-007dki-0R;
	Sun, 25 Jun 2023 10:03:21 +0000
Received: from mail-bn7nam10on20616.outbound.protection.outlook.com ([2a01:111:f400:7e8a::616] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDMaU-007djk-16
	for linux-mtd@lists.infradead.org;
	Sun, 25 Jun 2023 10:03:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEVCtawAV296YhDQ2y9ib7kvMvQxXcmMBVRoRlBH1wg5uUGIo4US6GYlrFSxpr92nhcapBZArL7NGo2Y7cbFVcKaOpYrPdLeOqyM4sl9wc3f5uZo6hqmidyE88QG3EM121fgIdm1h8txS69IeIPzHxTPDRTNYshxUanVwBoRbv2WDR/BwWyF3IvpSTclPVhnD0R89QKPJyp4I3uptQvAz/dm1Z0VFR2MBFWgSWGdIDA4R5L9fxQISTsxQmvQT2e+5aUm03w+JcIz+V/ovrNPcVm23WQQb6VenMS5U3PxQ8VXzWAl1EQCT4ALzMvJ+ih0YkqEaS/zqciZf4Pk/kP2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0j+ernANmQYrOUN1uo0CWMe37tp+gmGsvgeKDfYU6s=;
 b=jzx/fr6bq9eLmGd+1SKW1D7sI33IFzuNbSJQg1Im8TPcQejhp2rA2WTqEvNU06Xq8BE1gE4kfbADRDIDpli5DiE0jdCUPiGQKYeylkLNWCv4yFTvbhHRNzU0Jz2+xzhBTGZFCswIg2G0ez9uRdMNbs52GnhJvewA8yMkUW8TSu4ek8FOUEII7m2UIuiFdzMTK3eVdMq0wQm89srJgBig1A2jGmLmevWwHCA4CeUMWVDHdHoreb6ufbBloaNkYIZyErNM5BDdXikq+70gYCOOeUVVF1F35P3/QH/DSR5AVZ5qBEYpxHyqA6te0K4Nm8gGCO0qnWPBEUE8oclU1jw6Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0j+ernANmQYrOUN1uo0CWMe37tp+gmGsvgeKDfYU6s=;
 b=36nMyuQq0RTT9OCYssjW8tDGZ2Mbq92lEi9YJ9bmWhVO/UyW2fuymo/ggUNfAzB0XG/hZ3LOfTkOi4mhphfqkKOm9BJw2a2kYqoBkOgd5rFp/bkE6sBkP4ws00gAq1SYfC40C3SAh1GifbH5PG+FMFUGAj7OtKlR6eQegvngY/I=
Received: from DS7PR03CA0349.namprd03.prod.outlook.com (2603:10b6:8:55::24) by
 CH3PR12MB8209.namprd12.prod.outlook.com (2603:10b6:610:123::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Sun, 25 Jun
 2023 10:02:58 +0000
Received: from DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::29) by DS7PR03CA0349.outlook.office365.com
 (2603:10b6:8:55::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Sun, 25 Jun 2023 10:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT088.mail.protection.outlook.com (10.13.172.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Sun, 25 Jun 2023 10:02:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 25 Jun
 2023 05:02:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 25 Jun
 2023 05:02:57 -0500
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Sun, 25 Jun 2023 05:02:53 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>
CC: <git@amd.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v3 0/2] mtd: spi-nor: Avoid setting SRWD bit in SR
Date: Sun, 25 Jun 2023 15:32:49 +0530
Message-ID: <20230625100251.31589-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT088:EE_|CH3PR12MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e55133c-c0a2-463e-1ba5-08db75635abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cK/5wfxhz6sZyxb0BDY+f5yA9aNhIVlWu5fnXE9KtmXSQynirNbrGE7cH4dyQ4gKX/ccx9QTrCuO+ojNt2HXjPhZPKYtLtd5IVkWu4JjEhCttWEo1B+tuvZqFCtwFlyO+A9BkSvsFj+2C8HsuT0F8b5mTU0HKgwosziXnBNpPn/m/98rwR9f9Z2zM8CdVG89rDEbKoGu3kEiz0uOjlb1FWZNtg3bhI2TQDLCNMzQiNLEXHmv90K0b0khz1YLgV+szOlr6xk7EkSZznKlBCkFc4suLkFRWjkkhzQrRreK0e+7kmWUcYOPPnjLWa4GjLIUjREYXWTfr6DkRAdUDNUQr934vspjSdEzFNzoU9K6b4P06p3gE8+rhm6Mm3AC/zoVkfTVYiy+sqnNXNLlfCKHA3XW+stCqJVPY+vkHn3VIDstoNJqhb3zcNmkyd2xvH603UZTaAFW3Tc10VGCLxPj3Wb2bcM+PRuvyYlVaZ6P849Q2OQFvgEOUaCMgXt3uO5/O5ldGv4eGbkK9XcBc3WwBq3y8iVxaiV2LhOLRmSDw1zOs3d3EdTgq6XwqaGdVnWJFgtt9BO8mOuBhESuxGF7XxUK4pztgHahmCz2sniZcihhAwXrHM38+bLx+02nMBGgVv50d9PCim/3IXR3yPsrNryeujJCeCQD+4cWzzcbK2+25BYJPdt6sqxCtFwbRdLwy0jtY0rbg3VmgJ9thMuZ8Rdy8DZ5me+fLnxBC2t7TacJI+ZcYrFaDvc1O6dEtSaGWd8IVwrs/8+pKPezW1aX2g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(82310400005)(186003)(26005)(2906002)(82740400003)(6666004)(7416002)(8676002)(36756003)(316002)(54906003)(478600001)(86362001)(110136005)(4326008)(47076005)(2616005)(81166007)(336012)(426003)(1076003)(41300700001)(40460700003)(5660300002)(8936002)(83380400001)(70586007)(70206006)(356005)(36860700001)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2023 10:02:58.6699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e55133c-c0a2-463e-1ba5-08db75635abb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT088.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_030318_383952_D2E08E26 
X-CRM114-Status: GOOD (  10.69  )
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

Setting the status register write disable (SRWD) bit in the status
register (SR) with WP# signal of the flash not connected or wrongly tied to
GND (that includes internal pull-downs), will configure the SR permanently 
as read-only. To avoid this a boolean type DT property "no-wp" is 
introduced. If this property is defined, the spi-nor doesn't set the SRWD 
bit in SR while performing flash protection operation.
---
BRANCH: for-next

Changes in v3:
- Updated DT property name to "no-wp".
- Removed Reviewed-by tag from 1/2 as the DT property name has changed.
- Updated spi-nor flag name to SNOR_F_NO_WP.
- Updated DT property description.
- Updated patch description.
- Updated comments in swp.c file.
- Replaced WP with WP# in patch descriptions, comments & DT property 
  description.

Changes in v2:
- Modified DT property description to add information about a
  valid use case.
- Added Reviewed-by tag in 1/2.
- Updated comment description in 2/2.
---
Amit Kumar Mahapatra (2):
  dt-bindings: mtd: jedec, spi-nor: Add DT property to avoid setting
    SRWD bit in status register
  mtd: spi-nor: Avoid setting SRWD bit in SR if WP# signal not connected

 .../devicetree/bindings/mtd/jedec,spi-nor.yaml    | 15 +++++++++++++++
 drivers/mtd/spi-nor/core.c                        |  3 +++
 drivers/mtd/spi-nor/core.h                        |  1 +
 drivers/mtd/spi-nor/swp.c                         |  9 +++++++--
 4 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
