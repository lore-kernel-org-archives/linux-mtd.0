Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C588EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0vZuNmBbuYIRDKmhz0S4tyd0I/VH0Cg+7RsbU84JkA=; b=JYI2REmVjjqxWg
	MKLbDrgNc1TxmucNNS9kEhnqKlK/Srf5yXCJuIU3WsQ/CPkdkza/wHaTu/+6qNuUKLzcHikaq31vV
	HQGIVros1Aj7t/E1ghI+nBVxWsQAc1OdtihW5fWIni3kuk17ljHjSFpUB9gHXxGYsCh9fBNVLgf3v
	aB8C+NQPl1zTBTyXizNC4ZHtw0uP6nQKYN68BXn7ailRnn5Dd4tuK+CgVWppvwbeapFAqOknWw+aU
	pohC8ULqUwJfnopoGGqhi6jhu8TT4JF3LjglxL5+F25YQOPplAEuJZguzH7zp/n96iDRGKOqFXF0O
	IDAV9RWnecZR2F/wCG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFF1S-003q81-2m;
	Fri, 30 Jun 2023 14:22:54 +0000
Received: from mail-bn1nam02on2060f.outbound.protection.outlook.com ([2a01:111:f400:7eb2::60f] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFF1P-003q7d-0J
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 14:22:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bl4Rtm4Wd+QpN3NRxLI0UH7hIX8/VYeJVZIFCgrBQXEmiZxW8mrNKl3d7fNjzqJw8ZTot7Zhw1Xe/10OFUOs8S3uxh/0gKokKkURKkW3Hjhmy5eAxgeoXhbUC/lEG/Bsx0agAyjVwQ8f3kOatYZiic9cwCsSgLq90ajyCbD2OOCqE0DunSZwVBUXm5MxE76p8aZQ4di+u+Z+uEDZdDQNitwiUcD2Y0U0QZF44T9mm4ynIhraE8fvU8aIJhlJYc3I942iuo/jxGhNWTxuyy5ZN+YxO6Lc0yUK+m/ir4xf3mtz/Bx3zZwi0dfZKOWWuwTvteCKNpMEF/c0PY/BiPS/bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6b6/3GpG30PlTZVAlrUxPDc8takTyZhXdUVzlbrrR7A=;
 b=B6UfsELHm5TwRUfjyeVrqcEhSuE9KGTi9mWmGz4stfX+PEhEC8en2ugruiHEqx+F3nMGX7cnLzEdeUYMZfblNCRBzmWxMi2igIEchdMcN+V1yxwHqkcaWmUEWsJL9kBHboo3RSaLxaMEgl/Ai9OA42sGjzo0i5JhEJwrYMPh/xHZtDYgL+RrO2UCay8HehkzA8Z8seW/rGTmMLBlCNaEz1A1bAVMsw7ACUqrI6488fHaT7WXTNIGPXEbBEimDnKR4c719qg7izWOmUn4Rjje4mQl8BR5r3J4YfeO4HQfEKymTBv8gxy2Vpurfbby80hmkyX1UfQ9iCrrFrH0MyRBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6b6/3GpG30PlTZVAlrUxPDc8takTyZhXdUVzlbrrR7A=;
 b=FIFaWct98lQAy5RBBMAHNzg9PVkapiclgw9e8PhwBoJhOB0KAy35SZjyM0lwiv+5WWD0ApigfnoXWs1c33Qkhlc5eRqWRkPZePP8OWLx1UCBiezpgRQMpgJI0sLu8lducmzBJg6OnXGyFs9tCRp5PmZ4M9XxgWiqTh4uV/7i2fA=
Received: from DM6PR07CA0083.namprd07.prod.outlook.com (2603:10b6:5:337::16)
 by SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 14:22:41 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::64) by DM6PR07CA0083.outlook.office365.com
 (2603:10b6:5:337::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 14:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.43 via Frontend Transport; Fri, 30 Jun 2023 14:22:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 09:22:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 09:22:40 -0500
Received: from xhdakumarma40u.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23
 via Frontend Transport; Fri, 30 Jun 2023 09:22:36 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>
CC: <git@amd.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<amitrkcian2002@gmail.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@amd.com>
Subject: [PATCH v4 0/2] mtd: spi-nor: Avoid setting SRWD bit in SR
Date: Fri, 30 Jun 2023 19:52:31 +0530
Message-ID: <20230630142233.63585-1-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 56dba14e-eb7d-4ec6-240b-08db797576f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U6R3pDvtpJBRpQ8gAzaQsXLU+1Qv6/mwdQMi9WlXUeck1+KSV7UnbYxnDrEg4ZgH5F1Yl8mywdwyhyhFrVIoViJ6/qkwUBU5oJrrynDDYNbgnRIwP9cswtL/IFDqWU+U2puTGE7md9Hia1Es20Zrj7keQsBePTvPmWJE6tboKGHxpDyO7EBd/tswglXgLRzixua3dXzn3acxcMdaJNDcA2uD8t8+x84S1GFXt0QMu4gmfsEaZvoacbSa09OIVxh5TRUb5srygMe7z6RSWbArz0VGFkjiU/sCSkZ94SympKzcX/i4k2O890ulCth10BbGSMOcUBRlClrbWMmn5uB3sQDcfxqwHZdbIE52eEy+2NgGvQMfQbqLoJOlB6euMhB+AFKdXDA1Z8dOG5SOzNd0QUvgTkjQGSGzcjURF4Cikyh0sq/nfWFq6z/6Go5U/6QQBBvtyeEO5GSjPRUf/x8E2upQMpEVradLyqfChEaYCMOAOmeEO82aWOYyoPnVnaFdH7mlw8gFA2SWuJQ/vmDx9jY1kKKKAJVBT+67oQc0PRlLKnPC9LbnegHZ8qJQq2i1oHOEKxUolbyiSqIpJwPQ15TQE6eUL+UKxh6QFgMPGSdbhG8sebxqE4I3OSl25+f0NIt0b6Hp39wa3pgXa5yuCg/H67RQmd3/Gq70cznLM3CrpvDSHJza3dBEh2u/PFWOPyGhd8E3mo6mcLiVi/ZSxmRIXSwqf6uLH1nnZA+JpQvTk3fJ4LFVYxDDFXJraPgGBAUV9mWw0+6Dok0wknIVOQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(36840700001)(40470700004)(336012)(426003)(47076005)(40460700003)(83380400001)(2616005)(2906002)(81166007)(356005)(82740400003)(36860700001)(40480700001)(36756003)(8936002)(8676002)(82310400005)(110136005)(5660300002)(86362001)(54906003)(41300700001)(4326008)(70206006)(70586007)(6666004)(316002)(478600001)(186003)(1076003)(7416002)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 14:22:41.6056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56dba14e-eb7d-4ec6-240b-08db797576f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_072251_257727_C095A132 
X-CRM114-Status: GOOD (  10.41  )
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

Changes in v4:
- Added SNOR_F_NO_WP flag info in debugfs.c file.
- Updated comments in swp.c file. 
- Added Reviewed-by tags in 1/2.

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
 drivers/mtd/spi-nor/debugfs.c                     |  1 +
 drivers/mtd/spi-nor/swp.c                         |  9 +++++++--
 5 files changed, 27 insertions(+), 2 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
