Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38917CD5BD0
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9NdE06Ez53cZD7nzgZAFLS9x4cP/88bU74bQh8Ev6U=; b=wYxL/0mnzskrz2
	eKBtWsZ9ycEsC/ep9yKG/zAZjCvTvTRi3nDGNhlzebw7jOIUb3Hk3ErBOxMLaxTFb/ZfokishAF/Y
	/I1RtsB2rlruWcYYNyJIlqKkCVPfkjF8mmvDNsrCeIgg7WRp8/g2ABj47qyjEFZV2bsGIbEKh8jbr
	jBf2FishwStOM8qWY2v8h4C6wlrWSbXNvyM+srIO6j7a0knDxDEr97dyGoE/SX2w/idjNaXSP1FlO
	HugQfXOt5GzEUX2aokACLvHxrGkGWhSPfb2zA/ij6RnxwvFo8MovKr7H6EiHUTOQRZHQTh1j0f8Fb
	Kt2/WSX/q/oxIKumB/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIU3-00000004bT5-3h5i;
	Wed, 27 May 2026 17:55:59 +0000
Received: from mail-westus3azon11011070.outbound.protection.outlook.com ([40.107.208.70] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIU1-00000004bSZ-2T6Y
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 17:55:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAExmHRN+vB469Yra93xe2ryHXR0+V2na422NS7DVThi0Iwf0AmFnSwuF3BFbVo9JymLdHV0a7Y+jGmCyyp36/hZQVFzaFU42tCmH7fvdQePu33P9f6M5Guotpn6cIQ9Qz9CxkrZ/VyHtPpd8LeAIAZMQ0z0qGqMEma2MNFYpPwkApGKgzyataIkZMhRj9di6UTYiRdyIxQ43UdQehnPpj1om36Zk0WaLs5X+WCp71lNV0qx0Dl3IAP3MGlAM/dVP94XpbEQ6An5IffFHcDi5435vjX47Wp097DgZU3d83RL1LmX+vw6NwxM0OH9rm08WkregLF/gs0SrDtwN6xtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lufe1WLqLVvDMCaLJGFT6z969LKNNBZnGosNUej+SZg=;
 b=R2wtQIP2igbf6yKtkm8CHY0QFitOQzktsSO93chuRiux4Mi1oQ8+9n6ZQqHNesmZJ2fT80fMD3WJ41mugJCdDe4i6NaUytYN8DtwSYpFis7rBvuXsyEs9vUJSM0/vDHoF6nahMtWUbWIYElckBJr3Ab6EW6Ol6xZPJmSZfz7PAvNDsWdqluoqQKKjhw3YEuvsfkoa94Qf+kBOO2MSf7Zlr6cX1Quj68J48eiudczwQ8RdjM2sx3aTmCUlfkaBDeybxAdmSeQfuPV93m7a1r9RmRUBiC6nDtTN71r3G7ni33Svmrv1FMtLL5DOC6ZjIRFFJ71rGd2U1IWfkD6+YKZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lufe1WLqLVvDMCaLJGFT6z969LKNNBZnGosNUej+SZg=;
 b=KLb4yZbMJ3FUZ8jOSNDkC0YVvFy9O1cP+VdVFmSmFXtJEoUAJQH/DF5tIel6Li4clapM9kW9mtlaUaTHxta/aZUEKiToo89KNaFpuPKpk7eeG0Jg8ZdJpz0xWH6wlQQz8/0v3oQtOMYbi/ONzzuOEWNba//0ZBsznGAhXasZlV8=
Received: from MW4PR03CA0202.namprd03.prod.outlook.com (2603:10b6:303:b8::27)
 by CH3PR10MB7234.namprd10.prod.outlook.com (2603:10b6:610:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:55:50 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::44) by MW4PR03CA0202.outlook.office365.com
 (2603:10b6:303:b8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 17:55:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 17:55:48 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:55:44 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:55:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 27 May 2026 12:55:44 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64RHtYpd4052476;
	Wed, 27 May 2026 12:55:39 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to specify a frequency pair
Date: Wed, 27 May 2026 23:25:15 +0530
Message-ID: <20260527175527.2247679-2-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527175527.2247679-1-s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|CH3PR10MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 430e7a21-134b-4f83-2caf-08debc192f38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|18002099003|22082099003|921020|3023799007|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: GyqfRfr0YGb5D4QsCEVjsQVoRRrqvJqY9xw/utFRn5PQMtJW2iE+Gd8sEEpk9JX3H5AjayRdWEuVDqm6KO4Sqiisv0RRkSxLypfl4r6llGh/l8xlzYwgXMRGJ+/Gl2W3CaTSFkVpLmEEmrXJhhclwbK5PgXWtT1S3VerBwDh4+EP3+/JUKYpRy+ahzI5bPetElhtn2DD9IPSaJ6g83nZtclV1NYXB754X/bME9rRlTGaLcBtZAbU6GKVtCjoNxB/+auuutAVk0BAL22xhwh0FzOTcytMH6uICjivqAAeycfp5y3p0VF0hQyMo9/r9sDUtxfngbLNACWn7NteRt4QR1IldCYorqQXj/uPN6lVVflWzXnSnXZW+v9ahlcGzs8jSxppsA768bgojE0TrTLcLRh4i1HpHVK4h0wz1DuKYl1Zb1wJI96QCXaxu0i6FcNb3GINJksm65/FH0dHLXW9VDy1YSOHYD5D3QtEV/42fXBwhVeIEHdZA72tmPffSAvSfVKMi0kexfeneCBtoQQ31mJMtSoTmHe8VL1uueds3WKdfdsEEMsRftCwN+NtQTXR2hoQvu8OwgkWuJR602bWMuWWLxt1RQaVGoIxgyQvTfENpww/xiJ7DrvT4PgFsNC9osK2AY2RGUoHFMeeXBDjEPlmZFaYoBGielwahHMDi3pPYBstGQL4wA44EqY7Uqg/OiYW9PO8R8EvhZR7AKClDT/a7gyO6t7POIne5HzYgIQJjy+ZIijFeyZPxi2Rczt3+3KMAGRve/nfuJ5Ya9v61Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(18002099003)(22082099003)(921020)(3023799007)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: S/wKHs1CPWJdo2TIDizPqL36hdyVENCUwH6gfcESY4eOOxG7Q9EYo52VBpOPJS8Qn400Hdu27OCRh52RX5F+96vykvSaXYk6IGiZtmJl0zMc3ewXRalh7mpv/qPEM1KUsRax9Yfzl1pv8/iPA2C+IqNfGJhXOqzJCiw95Ktg+EHLbhh/rbSk8Aa5X/NcLaJx8IUuChCeNrcTNZMNMo65JL2ZcUHK/TLFc7iYT6G2QA87qTNTTZDzFBj4HaaSTmEJBQU62mYJHi5DBfBvxtv6pHm2Gz+BdeWa6Akierj1oC2W+kvpJr3P2g5rRpYe2uXe78tcqtS7jKY36RMmCADBFH4r4B/MyFEqlnplcwGZfSngI7mY9OL/Q9kKSL5D7WX/GLqnBMHZ9EYiZNH0tLQxwjtg+rwzCEoc/poqFiFXUOcpLPYkCn+rgnzR5jH4Io4Q
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:55:48.4338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 430e7a21-134b-4f83-2caf-08debc192f38
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105557_637757_F19771FA 
X-CRM114-Status: GOOD (  11.43  )
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

Some SPI controllers support high-speed operating modes that require
controller-side configuration before the device can be driven at its
rated maximum frequency. In these cases two frequencies are relevant:
a conservative speed usable without any such configuration, and the
maximum speed achievable once the controller is set up accordingly.

The existing spi-max-frequency property accepts only a single u32,
which cannot express this distinction. Extend it to accept either a
single value (retaining full backward compatibility) or a two-element
array [base-frequency, max-frequency], where base-frequency is the
conservative operating speed and max-frequency is the highest speed
the device supports after controller-side configuration.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 880a9f624566..c88f6f3a1801 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -41,9 +41,15 @@ properties:
       The device requires the LSB first mode.
 
   spi-max-frequency:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 2
     description:
-      Maximum SPI clocking speed of the device in Hz.
+      SPI clocking speed of the device in Hz. Either a single maximum
+      frequency, or two values [base-frequency, max-frequency] where
+      base-frequency is the conservative speed and max-frequency is the
+      highest speed the device supports after controller-side configurations
+      such as data training.
 
   spi-cs-setup-delay-ns:
     description:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
