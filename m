Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA4ECD5BD0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 17:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oqTvFxvMnstwp5WKnU12d2OgcNcbW5+sZwoheKTL1xk=; b=reET9pHcKda31g
	5ZiqRJTJThXwaI+vs7+IchObDvSdBpFIbF8uOjD0+3yApNOoKzt6o4O7Vc6lGUunsZQCZr82YZB+Z
	3pXuUroHy+0hs/chykOmBxy2I/UXMM4RAQ58o+PmTO6zyEhTvwjyIOXCPvhNE6v/jtGjcFxZiDGm3
	E7Kb06M5G7IEk3GXKsZrJ9Ndkk2yEo39Bb9nKlogjY5gVsMO/9lOkD0etxbRvRN43ZXbTKOdtSi1r
	I/4XRN5/kp3rTmS/1wakZe0YEPwSdeLG4xP5ai/XolgVFNL+M/poTO8CzpNRgzOwywQDZ6GwJRpv0
	Zp/gbmCtZtMb/ccHFV/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUD-00000004bXC-0cv3;
	Wed, 27 May 2026 17:56:09 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUA-00000004bW5-2gJo
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 17:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE1dS9QWxWnr6MgP7Il/AR6PETcUPuSmZ7nSGkq4fsYy8cK85WTckKyb0Kzf/wffBuGF/baRXry3p1KLrFPVTRscCjoplxahgc8JjdKpvLfhEamDxluIASmHQdegPFqIHQIbW/GIoBudpltr37veDXzXN68XR6ILhsz4Cp3oJ/qOtsPhrDCvAbOiA3dJu1DzmZZTlhLyIvlf10qS9qHjS2ygf9nQBCLWXh5h3xR89xvDykTCXJ9eJdvCySy0X1/Z2fCnety1cg8WES8F/CKTd8lBQGjXqSHmLwAvPSanKQwW44+gfSC/QsekvSfxWbIwVQkjPF1Otxhfrtc2N81mEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1fz0pGxnj1ULB6Oi47+VwRRlBZ4WvQIPMf+/fWGCGs=;
 b=uIDZMqEp68yzLKOyISe/PzlJeJo0ZOwJFX7R2HMhXYt0uW2MKYxbSEfq6vhgGW3vymRNg0AOJ6VfAraNF/fot/2BdTr9i0q1MCVkd/NyGLBtHj5gajBAyIyJW4jAnCa8TMqR2Nb8v67Hhz/9G+WuxgIYZ1HGFKrzCulz6vPZarZ/v8LghfAggH1HCPlVP43KbtCFCGEPI3avrFAPOVL8yaTIwdtsEjakIOVQv270UqEbTcL0bE4cUEtSHxS8viAkaurr7dcBWU5e0otwtlVFZIkvHAmuIHZwS+EcGnDzjuj+6dzMlKHkWIBPq0wnfNrxGlp10VY0vI1u22ABEH+V6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1fz0pGxnj1ULB6Oi47+VwRRlBZ4WvQIPMf+/fWGCGs=;
 b=wbYgDmHP31oBe1oMDsb67lOe40X1qdu91vXCESOfNrFgJmPNl9ECgz7/p7qk7ykpD4UzaqqiUfQ/j0zq38LaAcVuU0Fbk/QEaQgY94x2hukf244uNzTUABwa089Bf1Xy5IpArZraNFV0PtrnSJEQ+ueW2jdBPO7XqJMV8WYqV8E=
Received: from MW4PR03CA0206.namprd03.prod.outlook.com (2603:10b6:303:b8::31)
 by EAYPR10MB997925.namprd10.prod.outlook.com (2603:10b6:303:2d2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 17:55:55 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::ab) by MW4PR03CA0206.outlook.office365.com
 (2603:10b6:303:b8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 17:55:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 17:55:54 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:55:50 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:55:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 27 May 2026 12:55:49 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64RHtYpe4052476;
	Wed, 27 May 2026 12:55:45 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning pattern partition property
Date: Wed, 27 May 2026 23:25:16 +0530
Message-ID: <20260527175527.2247679-3-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527175527.2247679-1-s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|EAYPR10MB997925:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2edc95-9842-4bfa-e300-08debc193320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|82310400026|921020|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: KEsEFi3GGy7/pdMbgbaGuDFORB7t1h64V9EAzo5WXcszPdd4/Clr2PBeGQCH20LxBnCOQCvOMJisb4yuTG+mypErOKYsDq5iyj1eY5HgsScWBlKpyrrxGvu8KKdlgYgW8F0uM5LxEVV7Cv4WM+2Dqo1FmcpQqRiKOzkyhAEwnPHeCeHf8WtUkeSmVuIYYUzUvYsYeqafrbl5UiIMuj5LNyHiYVHKtpSFvRUwivfNJm9BhHq8nnEMX+j3F3gNINraPEAlpM2NPzxsvCfCmw9LCnbVB5+vUbkCLecFbSY3lnQIrvE7eGO7dAxgGiHpJkB6EnKndkZpAzQpvYWLI27E5hRqvTXhjmcxmLc683gOlDEAfHiYGMUonIpaWliY9RdDmpr5JdpBK2IGvFAafokrPnWgKl+Q4UuRKahhavuOki1rF+3FQq7evDg2G9MVKALRf4M8qnkYXiRmAVk7j6iQYgaKeJOhQJzT0pKFNoRfaEY4Ft8fwRkGap0b15mPwoswx+mTZjYDrL8rGsETzE72qyAaPKFHOhdFdMQnR8YHJl3CfmZCT8o+xRCyCJALtFyNLLqWj4nyoHSHI4aiafCTsDCGyEzqHBghHIRWYwoOoLFL+AbnQzG8KD0xm0Rx4+oiqmhM4x4zhO1+/5+2wTPcbI77Bv2BSMnLPbAl2WWHW+cTaigbhIjvJVcLcjsW+8orNco902LsxHiSRkTJSsl1xivDxFASoujZcS5+C2E+BHic13oVuIRJN7WDtR7qukXHSLiseQRyrWy4b2bPIG9JyQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(82310400026)(921020)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U4grYMmWhgih8p4HROpO9X9NS5QDgyXuT6mYuf4CiZ2VlZMUAo/M42SoqnLNcSD6OOYE1ck5PyRfYkQGc17RCTUdRPdMQ8GGPUO5zLGKirrmxIdMiMrhjs2odlIE4V7V3reoWT4uUEeOKRLn29BtO9KNnrsewcCkcibGfs06pOBeYXDFUt/be8Gfcd2O9N5NTft2QRLtAlNKoU+QM1MxcNL89N/6I49jUOHbYWHp2iTk7dXKMRwUgwWVZPe3QgXRPyoLx5bz7xj/st5mSyjz9LGGQKRWLa/SNjzZXUCqIbhak00GxIB7p1D+XN1eCNtd+shrA4UTh7loVj7y3yV22D7DiM9NGzeKTMlu+fjC1ML8lYoiiv4WAUrAMe+8CwCTExH23ENsEIEWg4R5CQR6QY53coB6xpl1ofI0py/aQKbaJ2E4f9GESsz412TePSFh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:55:54.9812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2edc95-9842-4bfa-e300-08debc193320
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105606_684626_CC4FD536 
X-CRM114-Status: UNSURE (   9.43  )
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

PHY tuning requires a known data pattern to be readable from flash.
When no partition is explicitly identified, the controller must search
all available partitions to locate the pattern by label, which adds
overhead and relies on label naming conventions outside the
controller's control.

Add cdns,phy-pattern-partition, a phandle property that allows the DT
author to directly reference the flash partition holding the PHY tuning
pattern. The controller uses this partition during calibration, avoiding
the partition search entirely.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 .../bindings/spi/cdns,qspi-nor-peripheral-props.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
index 510b82c177c0..0ffcdf5b00d0 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
@@ -39,4 +39,12 @@ properties:
       Delay in nanoseconds between setting qspi_n_ss_out low and
       first bit transfer.
 
+  cdns,phy-pattern-partition:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the flash partition containing the PHY tuning pattern.
+      When present, the controller uses this partition to locate the
+      pattern data during PHY tuning instead of searching all partitions
+      by label.
+
 additionalProperties: true
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
