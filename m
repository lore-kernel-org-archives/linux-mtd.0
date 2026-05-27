Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB49CD6E43
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEU7zFWLk0uCSCA72rCk52lkhw36xIMLjLeAKbMKUak=; b=mF3jswglrbjrHs
	EgqIudXfdJNyp6t/+vOC4Ts+e01gQMZKTPPztpfmjQo9fHVYeDt3rqZ3sV2xLMDEhtxmFsbxs0oMB
	eeR50wUuVyb4wFc6t4Uupul2mOXX5ywNrI00ysH6ah5pgS9mv8zsGjSM4B564yK4ohLo480EnElbq
	MkTeYLQN7YRcsx++wccbZu5RnDGHOYbug6gYfvlreQbn8CoVHCIZZ5u95UmBlVOPRdsi+PK534x4g
	0CNYAxE5jHo2y6z27DOZMl8ZS9zTu0QG/5a970Wve1BA9qa/sLMKiXL4YFaegsfstYLYuIL9f+5bP
	DLXHf0nVMclHo7dRck/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUv-00000004bwo-2jTy;
	Wed, 27 May 2026 17:56:53 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUs-00000004buZ-3hpq
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 17:56:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jd7Wq8aOUhazoeUJUT8BnUxgBwhu1M8QcQoC/yAku6Syh5LMq0cBJyRn6kFqwIPu9TTHB5Ejga46lJTa9IWSVayBvmeY0oaJ5r/g1TJjMNMf7BkYGjFoLYSsqqh5UAdTVmwDb3tcW8NFSOYgCcdO2y3AoOAogmd0FPi3fKUz0sbZdU5J8KjW7h/0dp5wL4zyQapVv8Vr61oJH10/teFI9QEYsDmm+BVQnLp41DADz0W67kNtk04HMVITHRORbw5WOMSABovTsU/JYRqgsf07cHzED0xv3W+WZps56IvF2KLfbuc09YL6fDF2cMGXbYxZknrdBIEAyaF38+CskrDewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppe0qTwspSHUu7S5lBvqAOYj2cYyzZrEkwbB0LCOMqw=;
 b=F8kHADHxKACezTePBZ3V/Lqd19Ci8N1vaxIOg8gqZtRKxAqeRlE/lNcbj5hrVICzYK9YtOKPTRpOZtIhQ4Z1vEEo7ED/kbu2f5ODBy5swxdMjzmk7uwKlKHdcLHLg4ylvCPxbKnej/4BEOQ851Rm/8V4yoe8NLt7PhciwelEN8dEchdQ7i0lSHNWzncFClI6XHIrQUQsPHfwgKkxU0+r2I+amgsrS6tPVD7qecPtfrSsl63KlB+xsXTyDAkEpZCkhy3Hi/GvmhQ1m5s4e8Y/ZW/gdEPFgFpzVKIWFF6jJmYhNEHiSKCHDwTGDkHhSpDP9hckqvCbWU8h9/Z5zhugfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppe0qTwspSHUu7S5lBvqAOYj2cYyzZrEkwbB0LCOMqw=;
 b=bMjDHtA+gjKXW70zfac1KlpeIf3GdX+pwcuKPJzcR+S+qcUwNpPAqaBWDO6ZSFj/Czw7UZgluGDA+FdEBhGdZoDPY/SIFaJezvNoTz7Y5JcJoYyI9HHOoE9s0/8X/rOvZWUBPkIBqHckYmByPZoaE/ic6iRazzHPC3JNNFAtPR8=
Received: from CYZPR14CA0044.namprd14.prod.outlook.com (2603:10b6:930:a0::28)
 by PH0PR10MB5731.namprd10.prod.outlook.com (2603:10b6:510:149::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 17:56:44 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:930:a0:cafe::20) by CYZPR14CA0044.outlook.office365.com
 (2603:10b6:930:a0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 17:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 17:56:43 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:41 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:40 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 27 May 2026 12:56:40 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64RHtYpo4052476;
	Wed, 27 May 2026 12:56:36 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v3 12/13] mtd: spi-nor: extract read op template construction into helper
Date: Wed, 27 May 2026 23:25:26 +0530
Message-ID: <20260527175527.2247679-13-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527175527.2247679-1-s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|PH0PR10MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: a8973108-1f87-4f53-500d-08debc195030
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|7416014|18002099003|22082099003|921020|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 5sXJy9vLXdzNrdpDu9bCLC5izva2pr3im0Vvm5JsS2FBrLY8wZYAo6UfloMzBaI36gva4wiUkkbKQlpQKjQOnNcpWmzqXOIZeyzyX4/46rA3DnDjBsxRbS/FAfva2JWwMP7C50cOvCRdfaNgst7auMwP9SKjeo23LMrHottMmU0QKRlIUI4SFLq1rz2wGqPvanNN6wFcYIBaHxFE/vFbkleKHIGFIOGyPdkvNt6z/uMR7MvATVGIa5nvYSyKh72LPoWO2ioUZu8Tj2vBmhp+7INe4Ta5+mh+/qsWgBVhw5tt7Yxq3mOkiJS8b8JRF1pfcKADy80PhyshLk9Biwd1mj0m2LIeKK8IjVlQD1hIqd9+PQWPEV/bju2RrchdQDx+7MhjTE4CuQtzYZRnvml8tB7UJMX2m/naKfwaXh6wGyUSrrr6y3WVGITwEVMsd66NX76LF0uVYc9hddrHiYK335smAPLJ6JgsTYwmohxegcMUFIRBMgBpjUm+6UqtCOKhrAM/XjSFA2DKGB5PGY6d4doam40s/Tm6oqhV0u9+btZh5iZQzd8TZuojyS38k+SXrDlZ3uRPi/m2TOE68sFI1VDqmo4GsqpTeAILeZwt2F2xfucgIy2ArAW5nh/mZ+CseEacDiIwBZZ7A+TGT6rd7mNHebcXPqAfED6t/ZjuZ8s/+CM6TjnFE8WptDal9lt8F8RBAMtx/dKUyA4KtGb1iUY8t/n897/R6ofYJii4/e1Y/wI2bV6GujBzdhWD75V2kXFnc7Ppv6HMBjUnS4DRyw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(7416014)(18002099003)(22082099003)(921020)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W0gwlrsKAckqg5XVtRzFnSaW7p5R5zPqZo9+En1TyB6Ru/1hE76oYvKtlLqh5txPVpcZPuHEvw3sbqdrWe6JWsGy16+NHicN4GJrhY+L7OSoPoOCGJNHBHx8oJdCiwCyWg284dexsOcGnH7C/59qka9JvNBIAo2WMMUUcSaUUwUTUkAUB1gMA7oZpVzOAQD54iWtU3LFpcQ2oyAgtTZhNNQE5ihsM8f5+gJhFDjqfXUcb3NCLwRJ6E0G5J+4fu1ZrJEX9HeCmvB5CW6oG6yR0NTEh5BCb8jN6Du+hMlKqKsBNSDWEU4pMx/0+APsextH8/8IFg7gzjQf6heTMqch8f/ePEYtmzLkg3gK/6m+lvGcSr8vNPUnMfucQEeTa+jorPm9zw1Danec1gJArHkuyuw2BflsXM0+OqOhVmk/nDxjrr7JLAhMkADW4HYTwMde
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:56:43.7686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8973108-1f87-4f53-500d-08debc195030
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105650_927305_C1B56726 
X-CRM114-Status: GOOD (  15.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogUHJhdHl1c2ggWWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+CgpzcGlfbm9yX3NwaW1l
bV9yZWFkX2RhdGEoKSBhbmQgc3BpX25vcl9jcmVhdGVfcmVhZF9kaXJtYXAoKSBib3RoCm9wZW4t
Y29kZWQgdGhlIHNhbWUgc2VxdWVuY2U6IGJ1aWxkIHRoZSByZWFkIHNwaV9tZW1fb3AsIGNhbGwK
c3BpX25vcl9zcGltZW1fc2V0dXBfb3AoKSwgY29udmVydCBkdW1teSBjeWNsZXMgdG8gYnl0ZXMs
IGFuZOKAlGluIHRoZQpkaXJtYXAgY2FzZeKAlGV4cGxpY2l0bHkgcGF0Y2ggZGF0YS5idXN3aWR0
aCBiZWNhdXNlIHNldHVwX29wIHNraXBzIGl0CndoZW4gZGF0YS5uYnl0ZXMgaXMgemVyby4KCklu
dHJvZHVjZSBzcGlfbm9yX3NwaW1lbV9nZXRfcmVhZF9vcCgpIHRvIGNlbnRyYWxpc2UgdGhpcyBs
b2dpYy4KSW5pdGlhbGlzaW5nIHRoZSBvcCB3aXRoIGRhdGEubmJ5dGVzIHNldCB0byBhIG5vbi16
ZXJvIHZhbHVlIGVuc3VyZXMKc3BpX25vcl9zcGltZW1fc2V0dXBfb3AoKSBwb3B1bGF0ZXMgZGF0
YS5idXN3aWR0aCwgcmVtb3ZpbmcgdGhlIG5lZWQKZm9yIHRoZSBtYW51YWwgb3ZlcnJpZGUgaW4g
dGhlIGRpcm1hcCBwYXRoLiBUaGUgZGlybWFwIHRlbXBsYXRlIGlzCmluaXRpYWxpc2VkIGRpcmVj
dGx5IGZyb20gdGhlIGhlbHBlcjsgZGlyZWN0LXJlYWQgY2FsbGVycyBvdmVyd3JpdGUKYWRkci52
YWwsIGRhdGEubmJ5dGVzLCBhbmQgZGF0YS5idWYuaW4gYmVmb3JlIHN1Ym1pdHRpbmcuCgpTaWdu
ZWQtb2ZmLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4KU2lnbmVkLW9m
Zi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+Ci0tLQogZHJpdmVycy9tdGQvc3Bp
LW5vci9jb3JlLmMgfCA2NiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMKaW5kZXggYTdiYzQ1OGVkYzVjLi4yYzk4NTlmYjA3OTQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCkBA
IC0xODgsNiArMTg4LDM3IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9jb250cm9sbGVyX29wc19lcmFz
ZShzdHJ1Y3Qgc3BpX25vciAqbm9yLCBsb2ZmX3Qgb2ZmcykKIAlyZXR1cm4gbm9yLT5jb250cm9s
bGVyX29wcy0+ZXJhc2Uobm9yLCBvZmZzKTsKIH0KIAorLyoqCisgKiBzcGlfbm9yX3NwaW1lbV9n
ZXRfcmVhZF9vcCgpIC0gYnVpbGQgYSBjb25maWd1cmVkIHJlYWQgb3AgdGVtcGxhdGUKKyAqIEBu
b3I6CXRoZSBzcGktbm9yIGRldmljZQorICoKKyAqIFJldHVybnMgYSBzcGlfbWVtX29wIHdpdGgg
dGhlIGNvbW1hbmQsIGFkZHJlc3MgZm9ybWF0LCBkdW1teSBjeWNsZXMsCisgKiBhbmQgZGF0YSBi
dXN3aWR0aCBjb25maWd1cmVkIGZvciBAbm9yLiBGb3IgZGlyZWN0IHJlYWRzLCB0aGUgY2FsbGVy
CisgKiBtdXN0IGZpbGwgaW4gYWRkci52YWwsIGRhdGEubmJ5dGVzLCBhbmQgZGF0YS5idWYuaW4g
YmVmb3JlIHVzZS4KKyAqLworc3RhdGljIHN0cnVjdCBzcGlfbWVtX29wIHNwaV9ub3Jfc3BpbWVt
X2dldF9yZWFkX29wKHN0cnVjdCBzcGlfbm9yICpub3IpCit7CisJLyoKKwkgKiBkYXRhLm5ieXRl
cyBtdXN0IGJlIG5vbi16ZXJvIHNvIHNwaV9ub3Jfc3BpbWVtX3NldHVwX29wKCkKKwkgKiBjb25m
aWd1cmVzIHRoZSBkYXRhIGJ1c3dpZHRoOyBjYWxsZXJzIHJlcGxhY2UgaXQgd2l0aCB0aGUKKwkg
KiBhY3R1YWwgdHJhbnNmZXIgbGVuZ3RoLgorCSAqLworCXN0cnVjdCBzcGlfbWVtX29wIG9wID0K
KwkJU1BJX01FTV9PUChTUElfTUVNX09QX0NNRChub3ItPnJlYWRfb3Bjb2RlLCAwKSwKKwkJCSAg
IFNQSV9NRU1fT1BfQUREUihub3ItPmFkZHJfbmJ5dGVzLCAwLCAwKSwKKwkJCSAgIFNQSV9NRU1f
T1BfRFVNTVkobm9yLT5yZWFkX2R1bW15LCAwKSwKKwkJCSAgIFNQSV9NRU1fT1BfREFUQV9JTigy
LCBOVUxMLCAwKSk7CisKKwlzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChub3IsICZvcCwgbm9yLT5y
ZWFkX3Byb3RvKTsKKworCS8qIGNvbnZlcnQgdGhlIGR1bW15IGN5Y2xlcyB0byB0aGUgbnVtYmVy
IG9mIGJ5dGVzICovCisJb3AuZHVtbXkubmJ5dGVzID0gKG5vci0+cmVhZF9kdW1teSAqIG9wLmR1
bW15LmJ1c3dpZHRoKSAvIDg7CisJaWYgKHNwaV9ub3JfcHJvdG9jb2xfaXNfZHRyKG5vci0+cmVh
ZF9wcm90bykpCisJCW9wLmR1bW15Lm5ieXRlcyAqPSAyOworCisJcmV0dXJuIG9wOworfQorCiAv
KioKICAqIHNwaV9ub3Jfc3BpbWVtX3JlYWRfZGF0YSgpIC0gcmVhZCBkYXRhIGZyb20gZmxhc2gn
cyBtZW1vcnkgcmVnaW9uIHZpYQogICogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzcGkt
bWVtCkBAIC0yMDEsMjEgKzIzMiwxNCBAQCBzdGF0aWMgaW50IHNwaV9ub3JfY29udHJvbGxlcl9v
cHNfZXJhc2Uoc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IG9mZnMpCiBzdGF0aWMgc3NpemVf
dCBzcGlfbm9yX3NwaW1lbV9yZWFkX2RhdGEoc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IGZy
b20sCiAJCQkJCXNpemVfdCBsZW4sIHU4ICpidWYpCiB7Ci0Jc3RydWN0IHNwaV9tZW1fb3Agb3Ag
PQotCQlTUElfTUVNX09QKFNQSV9NRU1fT1BfQ01EKG5vci0+cmVhZF9vcGNvZGUsIDApLAotCQkJ
ICAgU1BJX01FTV9PUF9BRERSKG5vci0+YWRkcl9uYnl0ZXMsIGZyb20sIDApLAotCQkJICAgU1BJ
X01FTV9PUF9EVU1NWShub3ItPnJlYWRfZHVtbXksIDApLAotCQkJICAgU1BJX01FTV9PUF9EQVRB
X0lOKGxlbiwgYnVmLCAwKSk7CisJc3RydWN0IHNwaV9tZW1fb3Agb3AgPSBzcGlfbm9yX3NwaW1l
bV9nZXRfcmVhZF9vcChub3IpOwogCWJvb2wgdXNlYm91bmNlYnVmOwogCXNzaXplX3QgbmJ5dGVz
OwogCWludCBlcnJvcjsKIAotCXNwaV9ub3Jfc3BpbWVtX3NldHVwX29wKG5vciwgJm9wLCBub3It
PnJlYWRfcHJvdG8pOwotCi0JLyogY29udmVydCB0aGUgZHVtbXkgY3ljbGVzIHRvIHRoZSBudW1i
ZXIgb2YgYnl0ZXMgKi8KLQlvcC5kdW1teS5uYnl0ZXMgPSAobm9yLT5yZWFkX2R1bW15ICogb3Au
ZHVtbXkuYnVzd2lkdGgpIC8gODsKLQlpZiAoc3BpX25vcl9wcm90b2NvbF9pc19kdHIobm9yLT5y
ZWFkX3Byb3RvKSkKLQkJb3AuZHVtbXkubmJ5dGVzICo9IDI7CisJb3AuYWRkci52YWwgPSBmcm9t
OworCW9wLmRhdGEubmJ5dGVzID0gbGVuOworCW9wLmRhdGEuYnVmLmluID0gYnVmOwogCiAJdXNl
Ym91bmNlYnVmID0gc3BpX25vcl9zcGltZW1fYm91bmNlKG5vciwgJm9wKTsKIApAQCAtMzY0Miwy
OCArMzY2NiwxMCBAQCBzdGF0aWMgaW50IHNwaV9ub3JfY3JlYXRlX3JlYWRfZGlybWFwKHN0cnVj
dCBzcGlfbm9yICpub3IpCiB7CiAJc3RydWN0IHNwaV9tZW1fZGlybWFwX2luZm8gaW5mbyA9IHsK
IAkJLm9wX3RtcGwgPSAmaW5mby5wcmltYXJ5X29wX3RtcGwsCi0JCS5wcmltYXJ5X29wX3RtcGwg
PSBTUElfTUVNX09QKFNQSV9NRU1fT1BfQ01EKG5vci0+cmVhZF9vcGNvZGUsIDApLAotCQkJCQkg
ICAgICBTUElfTUVNX09QX0FERFIobm9yLT5hZGRyX25ieXRlcywgMCwgMCksCi0JCQkJCSAgICAg
IFNQSV9NRU1fT1BfRFVNTVkobm9yLT5yZWFkX2R1bW15LCAwKSwKLQkJCQkJICAgICAgU1BJX01F
TV9PUF9EQVRBX0lOKDAsIE5VTEwsIDApKSwKKwkJLnByaW1hcnlfb3BfdG1wbCA9IHNwaV9ub3Jf
c3BpbWVtX2dldF9yZWFkX29wKG5vciksCiAJCS5vZmZzZXQgPSAwLAogCQkubGVuZ3RoID0gbm9y
LT5wYXJhbXMtPnNpemUsCiAJfTsKLQlzdHJ1Y3Qgc3BpX21lbV9vcCAqb3AgPSBpbmZvLm9wX3Rt
cGw7Ci0KLQlzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChub3IsIG9wLCBub3ItPnJlYWRfcHJvdG8p
OwotCi0JLyogY29udmVydCB0aGUgZHVtbXkgY3ljbGVzIHRvIHRoZSBudW1iZXIgb2YgYnl0ZXMg
Ki8KLQlvcC0+ZHVtbXkubmJ5dGVzID0gKG5vci0+cmVhZF9kdW1teSAqIG9wLT5kdW1teS5idXN3
aWR0aCkgLyA4OwotCWlmIChzcGlfbm9yX3Byb3RvY29sX2lzX2R0cihub3ItPnJlYWRfcHJvdG8p
KQotCQlvcC0+ZHVtbXkubmJ5dGVzICo9IDI7Ci0KLQkvKgotCSAqIFNpbmNlIHNwaV9ub3Jfc3Bp
bWVtX3NldHVwX29wKCkgb25seSBzZXRzIGJ1c3dpZHRoIHdoZW4gdGhlIG51bWJlcgotCSAqIG9m
IGRhdGEgYnl0ZXMgaXMgbm9uLXplcm8sIHRoZSBkYXRhIGJ1c3dpZHRoIHdvbid0IGJlIHNldCBo
ZXJlLiBTbywKLQkgKiBkbyBpdCBleHBsaWNpdGx5LgotCSAqLwotCW9wLT5kYXRhLmJ1c3dpZHRo
ID0gc3BpX25vcl9nZXRfcHJvdG9jb2xfZGF0YV9uYml0cyhub3ItPnJlYWRfcHJvdG8pOwogCiAJ
bm9yLT5kaXJtYXAucmRlc2MgPSBkZXZtX3NwaV9tZW1fZGlybWFwX2NyZWF0ZShub3ItPmRldiwg
bm9yLT5zcGltZW0sCiAJCQkJCQkgICAgICAgJmluZm8pOwotLSAKMi4zNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
