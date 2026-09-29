Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A806BCA5FA1
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 06:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CY18GnIgiyipXscNHiqmrftgSjfk2auLsufvXx98Yp0=; b=TnFDAzqksG+DIR
	sVo28/xs1OclJUhnVHWnQeBJapLv8Aa/nsi4aeIejGyg29flmVMf/5L3JNmC4hUKXeGnxrICrCrev
	Lxz1ZleDDm8VkjODqQkZy3ZV7XF3ot5ERzCiQDlGYh/G9UdS6+azZ/JAV1xuKuj2xT+FUEkP9ZfUo
	IDsjBT0y0d+2RNTveF03dUeAeXve3SvM3yykfmniBndHgOMmLPyyApE+8to2o4sdMSF0FSRlbix2F
	+HzUUb+etXTLlW6NxaatBL41re6K86ZEAuvDGEAyXT8LqSI8akpK2OnPpw8OL8v0MgvGJe98GHFGs
	zadbNqtKa4CIQfpREiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRST-00000002UNO-2kZF;
	Tue, 29 Sep 2026 06:36:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSS-00000002ULK-1edc
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5kQbYjhi93P+mW58dhzDZwQqjUSpMCxaLGiibxfIJH8=; b=jaXWwfLvfaTPZGDmO5W9KADpvz
	zaZo9byaRiSUlqI/QWZlOyokEu5s/puaWT9XCWWnTHRzW8BP9sOL+0wHpigGgRZCEdAe1BOIK+IyK
	hJpoU5kDtNHFAz66YOCJMCAvZPghf+xzkzwt57BakYdsjjhwwxAmXEMqBJY0yLSsxCDJc2dWc6zuH
	1UTx4CKE+eMJLcESwdMO/CVtL9J57yUuiilI+yyGDH70AduL9XWlh20YMFptbqjVhUWuUmzrN/k/1
	gjgTh6rMFkPR8VYZRADiWGwIAC0YAw+xh/v0OsA6GSZNH0V9pQr/Zba26a0EaYrNWipVWPrtp8nhv
	vihUH9yQ==;
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBRSH-00000002FgK-3Z3k
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 06:36:50 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T46XmH3284408;
	Tue, 29 Sep 2026 01:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5kQbYjhi93P+mW58dhzDZwQqjUSpMCxaLGiibxfIJ
	H8=; b=mKRvYxSOgBMD6UL8cliF1OEZBdiUAyKW515PpepzkrI3v+3b6hLgVxD/B
	wQ8411aAqEtZX5R1g0VMG19RmZvZloCiGfFFHryI95bwngdMvEMuwYF3mcAoGc6n
	pmfFuZACPbXONCHxBNCPyDASn587FQVfX/3CL6KabYvQJQqf37jQXciEfotFKgF9
	gaaINh3fKT9cbFBKI3Osnb48jCgzocP2ZqOEqEw64PGh9dNXi/dQ7x2BXfgAwD2/
	d6Keci3xYl8lQ4wOHql+N2Fc7OYbzkchFs399++X7mNI6qEnqOm94Ig+JIzqUSHo
	8a0LqWnAWzSGqvM36yju2CwkII/TQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h03ad9q15-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 01:36:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTR8UM795qYveN89M6TfMm0tiUL4NLDuRVPHqDTok/kbe+5LN6XO6fGvUQABeuu/iVAsAusLcY0TvqeinUvtWDnXphtfm10E75DCxXeLuEIhQd44w3EGjIzxLXNyHbX60vZSY7xLQw8euqJ8NWn0cFnOeMlG7blROASoBzvAK68z7FwdD0+gcFJ/clV2bvGaAVGtOM1HfYFIFYZ82G6Px/jAovvpcE719D8PmMNOj2+imR6q28g4VSr696nnJjb7qhS4idQ9is7ePGaTYShcWZsTpH7JtU8fTxFZrT0EhR0V3KZwQsQxvj5XWlrTE7z7P/ctjXGZ6RWxRS6K9i5vwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kQbYjhi93P+mW58dhzDZwQqjUSpMCxaLGiibxfIJH8=;
 b=PRwfIr7kSSPvGwcm8QUt0me/1AjpThiyPyTZlRt6Lf6wuHMJiZFSM0scrTVZT3z444svSSchvNKNwkfEsVQrP/+Z1YyIt3mqtLNJecE7/RaVEVyVrFxbQIw04OMCGZVT9Nl9DKk62gbzYNtPCU4libuc0pggf4wYkBCb83ofqul8IA3cAUOwx1NwBAgPSLgoFS8Vkcd1pXPvkRf4s3wjjVy+OuHW2HNZYDGO3MbW02lEuBeNxW+NJYolYkrqTp9nX8FjT8276U4sQF/o0srtiqGZ2etaYWc8Jc1RK59FzWaD5qLLXT8AMKA3dt/jm36TaWHXa1tmGQEDpC/hksIxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kQbYjhi93P+mW58dhzDZwQqjUSpMCxaLGiibxfIJH8=;
 b=mFZdNhev5WS0RPa2AL6IGRluBkHBkFbEhnqQdTjf/VBBo4NY3uNFpqjbDonhRQgOHZfeIoCKBfk3lg4/WkWmT9bkYi8LdUUBKLp1mfjKJzU42VAMbqwcVVfRMOxHBbVPMFzfFMs8q7gSArKy6XfPsCiVdbPhSzgsF5WKYRSBb6E=
Received: from PH8P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::14)
 by SN7PR10MB7002.namprd10.prod.outlook.com (2603:10b6:806:344::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 06:36:37 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:510:346:cafe::53) by PH8P221CA0039.outlook.office365.com
 (2603:10b6:510:346::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 06:36:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 06:36:35 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 01:36:04 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 01:36:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 01:36:04 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68T6ZZn41395904;
	Tue, 29 Sep 2026 01:35:58 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v10 04/19] spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops
Date: Tue, 29 Sep 2026 12:05:14 +0530
Message-ID: <20260929063529.1235417-5-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929063529.1235417-1-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SN7PR10MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c5acad2-103e-43ff-ee6f-08df1df4023e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|7416014|6133799003|22082099003|18002099003|10067099003|921020|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: ZCaP7Adx4MrUe+Se9NcpyzQuLdvwyhu6vvDjNB6uwU/MZw3crI5F7ntB/35eVkJ4j5zHxlTNd9h+49MCDr63EuPb09W2ag9zNUugevKg0AwAGuZl1o5MEsABuW3sId0YTyHZx+hOUgpV6Kk25c/H2EHRcJdSjfWVvPb87zrzoaBTLrga66uLGgiGbT5G+hry3NBY2gwn4AllMjpV/Ed3HdC1LfTHZvX31xaRNzAH19Ir8V7wxKpbMxq4560gEZACD2j65VUxOFGvsvV42F8FlDaQMl09YMf/QWpPSGRRoZAIZHjUUp3nQNXIQ7rpxvwA4saQMn9I70j2YyIzk206wkGl1OxporwYBpI9vIvKZg6ThZRsxQxbYuVp8U2dX89uFCbniAKjuNQ5FDN4G+2xjq/1ZVOo4b5KLeOTXYKGKKWeTfAEvk/4Nt3LK2bsRcMD2hufwa3yE9Q9ZJrhPh+bTlrjY70V83Iv9LIbcQO/FvISvLAwtN6iUtJ8QobP27XNmvvX/AQLq7gjgMIMY/U67Hm1Y5LWck2ekLV1KP7pCU8CkuWDAIe388nqt97oEjEquoTLW13/QhDyCJH2P4v0+3uaM1rnSlGtE3PgzYgP4dHlAOp0HxLJpR/zalu6XnWcG+trTHMb2Fa+obv8scKTrL9UavTqxMLxBS/a5VshzRekSaGGsl2OOZFOybbKdM3Awr9A/0sSp22nAsIf+YswYcWZc11DEWuFR+MjxOZsgnNVhGtGVkLZIOEoodTAEgie
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(7416014)(6133799003)(22082099003)(18002099003)(10067099003)(921020)(56012099006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u0N4FjuyzdiHh++c8JaC/L0U/8choH3xz3hCeWRHuzLoIWwbqatjv3OlSJuu3gpqSCsEMpXIBS4zgOJfJazWNyZhcvnkB6rXeTgOQgsMtKq9VJEDsMQgvezkHNO0pZwuKEmN47y4rZPcdErDm1X0W7Qb2Dz6O55fAWkkyPTDEuIkVzz+eZsKyyKXcYMhdifkaxThriXPxbuD60pUJh7+M31ejpzKijx4rn5BTmDIKJphCnsupmZ1CNrdxWeHsqpGxpVM+6F95z/mdeQDgHsMTow6r5E2TyWXsXa0QQu7n/NDEQ1ctSYYJy50S7Sl39S+10MzfUA9J3+cIk9XA0v68Op4UbFuKZorU6XPgVfjrg+8pSEziW9AaM3sRstLuo+GfKsWYgiJQKPfaHm9VTFWH5CZlJKxuqDX8zSTb5jMl/RGEu/s2y0rH6+Og3+BpBJP
X-Exchange-RoutingPolicyChecked: Nt+ENQx0ldVlXWl/+PAaffIaTtCSK2pg+Jp8BqsolUNX9suMIKBx9KSgWwis2v38V05eZmNafDLB5LkRPIhnRkoUBxdfLTy6RjuhZZGirb0TO8RDpUt3VpD5ItMhHC3fz+OIAtetmxgAe1bDJ17qE2LU2aJrP2xxS8mZnNTsorQH3/+lCMgcs5+VPZeNdlwMAQ0g/J70hzAAUacUy8xggqi83LEmVQlqxqXODEDXUeeIZ/yGAvGcQte9QOunjbraTI4kN6NxJhid9YFCzlSO5ixLuVq1YnePsRC5L6DDUtC0k9lxdXOPLikgwWeAxNAPCZRVUgxvZRvD8GrEcnRwTQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:36:35.5577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5acad2-103e-43ff-ee6f-08df1df4023e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7002
X-Authority-Analysis: v=2.4 cv=c94+0h9l c=1 sm=1 tr=0 ts=6abb5c77 cx=c_pps
 a=f/vGOH3Q9iIJglbWlzIglQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=gHTh7DRQwxBKnKwRL7cA:9
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: -OeXOCuuzHu-wxvSMY-teohNfhd0YuOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX1Xdi0n3B/RHx
 viS3oUpPOiCGn7uqr8TyHq7iE670BPVdiHqXYc3+U9sNIru96+2EGNakjarrKw9AAePNyPQSsOH
 ePlnYsMlz7bxWoBgnwd9ANzpISPOvQOGChOovM0scad67EpHcPfzqt1yhm8w31eIIjurVQPru8+
 AbKmNU+BKHzZ6GDNN+I/UXwuszZ1yebb6snr28EMPloL3mzt0G6vE4Z8KuBDKef+Z8SqkzgGZDf
 gJLnKY1IQzHAbTRyKZpUQ4bofgP50QxNk/wGVamEjeDVPjII3KspRY0pOxz4fu4+RKJ2GxEyCM7
 zQUcE7Od0jfLEg39VP2ivkc3tD0KS6gCUCGrqADNMmHOJ1QNNcixW0GmftvE2wepSErTAmPLwbP
 TS72l9pAQW94IzaN0mrzc1oeK8KKVvTxqnrQ9XC68QbQjEqiT1sV3bzjNfAVRuhYNsbK9Ha1kaE
 vuTokYuXgbNFHWxHc9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX8NjS2kDNH7uu
 KxDbnYd4yaVq0zR9ty2iBjT0uGj6ppuKbP4r9xq/Rv3G/617QKny4cKuQ8/MUiLuZtIfAXd8vlr
 Lp8f2mk2nWRxPx1MZfLmx5qNipJfk1o=
X-Proofpoint-GUID: -OeXOCuuzHu-wxvSMY-teohNfhd0YuOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_073648_948043_B3F23909 
X-CRM114-Status: GOOD (  15.41  )
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

Extend spi_mem_adjust_op_freq() with a bypass for post-config ops:
when op->max_freq equals post_config_max_speed_hz (the value written by
execute_tuning on success), return immediately leaving op->max_freq
unchanged. All other ops are capped to max_speed_hz, the
always-reachable base rate. This places the policy at the single
existing frequency-adjustment point so exec_op(), supports_op(), and
calc_op_duration() all see consistent frequencies.

Also extend spi_mem_default_supports_op() to require per_op_freq
controller capability for post-config ops. A post-config op runs at a
different clock rate than the pre-config base; a controller that cannot
switch frequencies per-op cannot execute it correctly.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-mem.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index b94680b60af9..7916387a4f1d 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -206,7 +206,8 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 		return false;
 
 	if (op->max_freq &&
-	    op->max_freq < mem->spi->max_speed_hz) {
+	    (op->max_freq < mem->spi->max_speed_hz ||
+	     op->max_freq == mem->spi->post_config_max_speed_hz)) {
 		if (!spi_mem_controller_is_capable(ctlr, per_op_freq))
 			return false;
 	}
@@ -627,9 +628,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
  * Some chips have per-op frequency limitations and must adapt the maximum
  * speed. This function allows SPI mem drivers to set @op->max_freq to the
  * maximum supported value.
+ *
+ * When @mem->spi->post_config_max_speed_hz is set, ops with @op->max_freq
+ * equal to that value are treated as post-configuration ops (e.g. PHY-tuned)
+ * and are allowed to run at the full post-config rate. All other ops are
+ * capped to @mem->spi->max_speed_hz, the always-reachable base rate.
  */
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op)
 {
+	if (mem->spi->post_config_max_speed_hz &&
+	    op->max_freq == mem->spi->post_config_max_speed_hz)
+		return;
+
 	if (!op->max_freq || op->max_freq > mem->spi->max_speed_hz)
 		op->max_freq = mem->spi->max_speed_hz;
 }
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
