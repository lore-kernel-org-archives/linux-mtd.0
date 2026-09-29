Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6AFCA5FA1
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2026 06:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LOKY7FtM5vcJ2qxWtVcvU8kFgOPr1y4OFkDQp/APyAo=; b=Q+qG7F24I343fH
	4VpwvrcJvFHvaPuEb1M25xjtIVdlJDYmWjAYKT2FYjDTa3fptU0wxWU+W6DpiSR9AIq0L9IOmVV7V
	y9V0VoVTeeMz7hD07YtvaVFYKmK7aTDiR91mfIu++kqm3UpJyj/OM06frftfY2ZbwUAWaKioF+zg/
	G1RQCGRaAebUKicJvMND2H8aIHGHFC6F95uAMgL273wfcKJc7rAK0fe3AKZBlXznCftN3KAr+1mWD
	p2roK/JCBH8jJ6gY8bAjmrNEq+rJroaczz9pTZDsZ49n8mXKf7e/HKJa75UtVgJUuuUNu4glsDNv1
	mgJ886BD5SDQkRVQehPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSi-00000002Uht-30XE;
	Tue, 29 Sep 2026 06:37:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSh-00000002UfW-2Tf1
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=pd8e8Pv8NJTd8xflX5W4UAxNAaGf8IFwV1+koAPX3dI=; b=XLcAagW/5kEeeAh4TwzSLqMOLJ
	PYZZcrlsCtnA6G/UWkLlaxdFfKispuaIsavBvV2QpK8ob7B+rF+1GwhYWDWVrR1I/g8jzT2u1Y8dH
	MLPZy65/5SATb9VXLw61tmMCJZQwfe+HwpG/HZBHVQjV8ZAGM/xpzTFEz6uKSNNoYNae+U0ixcQ77
	aZfE/MEGZ+/bKWYSppvdSprOVA6JXQrg4KXc6nQkTxqf6TGN2L1c8ZjXGznlSRbUu4cCsyOrqcz1N
	gnqwoM/Czal9QJ/VduEplqbKq6kc9y4UyMgNF0XA8zIcJakRvURQ5o0ErCCvl7L3MS03sqhQoF70V
	OI4QsgxA==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRSc-0000000BGGa-34eK
	for linux-mtd@lists.infradead.org;
	Tue, 29 Sep 2026 06:37:10 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68T46SFA037366;
	Tue, 29 Sep 2026 01:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=pd8e8Pv8NJTd8xflX5W4UAxNAaGf8IFwV1+koAPX3
	dI=; b=YSjwNRb2LLAgYxqcgU+cTgwvS58v97pJC5OZxHOkez2/CwAaaR9FO6fAK
	jh0hVLfhfg6sI4NRaKWJDFwK9UblEHUNIpY+W9pzbJQnsTgT2Z6osELGrtOSnwFz
	eUAliC3mKmRw01l5cWeszEo4bNOUGs4E59+uiArnx4zgNfcebpj29vTCWCryyJyG
	o6D6c59/CqZIqSr2UVfGthwjE7WFx2ztiohwug22GcUP50llO3iZCiG4zCSeIML1
	ZvOtajjTY1Q11JBcac+wPzZHRYthSmoq9YD2oaOSnZWSrzBHYk9wMkI2zIMK8Gkx
	Uef9SLtxRy5kcnW0aO532/xsDy/Mg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010059.outbound.protection.outlook.com [52.101.193.59])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h02j69wxb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 01:36:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYe9CXpFHb77l/31IkB2zV03b+YGeMOR777cCz2oRWf4ZLhAFZozkhPoS9yNXeSW/YoX+fb2+sU1Ps/yZkOEvsLD2WG+CHtWWw4gjupQ0rOjH04g7aLTgzSlgY140NukosXkkUIAKOglLrP9AMqj8wiSntCZzZ/MwPafihz5rzU8KtdePozROca+4ZcOdn/6hiGCtdNmx+gm2X7MUm2lziJlZR6GdQBzT/dm0eJB4bfUWTHnw/j08ekg3zOm+75C8KDnw22OLkLK6BfMhVcOyQegTtEo6eP793v4krg3t9Ts58SkRp/rNCnofmddDSI5FYCklnUyRTd0GUBlxU3oBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd8e8Pv8NJTd8xflX5W4UAxNAaGf8IFwV1+koAPX3dI=;
 b=fgOmSNwj/XmdnCZad1JUYpGjC6hJ4FHTc35R/39zOnpvl+/wLZGhQ4KIGfyLzjAFrz6DtEI+lBGvAA7KDMj/aU6YvhUbJkEVC2Q2yvtRxifFVtH1SRVXzRVEGGzx/DEmEln+YWxKunMxiuCB4S2t2eLesC1U6Y8upA/H7LRQ7d69oOANss1CXYVtNGWssQUasOW5l3KvTvfda5+5XKlhH0dEQpdVjWmc/5DX09UqTpyexprb8ZUfiBjGe65nv2H6qUFLuCnaKCNgoqoYujdWcRoyFZpAt/LwufMp/UfEG5sRi5SyFB4pRVx129cNiK4ksqrpPfRSBONwtQcmItH2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd8e8Pv8NJTd8xflX5W4UAxNAaGf8IFwV1+koAPX3dI=;
 b=TO+ZIYVT5/BjtFlQmePqbgsP1vRSrNSQ7k8qmTiTxD3nHU9mR9/FNbpuJGVrHzgOXYg8A6JSFjCx69Z9Cc0/mHtvnujBarQYnxR3y1l0v6WnP8LeUl5YXwMSv/683/b/kCtYf1DsIKqNFdOKHGSDkaExaZtAYnaSACFbOxHv3OQ=
Received: from PH7P220CA0074.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::6)
 by MW5PR10MB5828.namprd10.prod.outlook.com (2603:10b6:303:190::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 06:36:51 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:510:32c:cafe::31) by PH7P220CA0074.outlook.office365.com
 (2603:10b6:510:32c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.25 via Frontend Transport; Tue,
 29 Sep 2026 06:36:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 06:36:50 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 01:36:37 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 01:36:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 01:36:37 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68T6ZZnA1395904;
	Tue, 29 Sep 2026 01:36:32 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v10 10/19] spi: cadence-quadspi: refactor direct read path for PHY support
Date: Tue, 29 Sep 2026 12:05:20 +0530
Message-ID: <20260929063529.1235417-11-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929063529.1235417-1-s-k6@ti.com>
References: <20260929063529.1235417-1-s-k6@ti.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|MW5PR10MB5828:EE_
X-MS-Office365-Filtering-Correlation-Id: 4606cdb2-9f67-488c-cef9-08df1df40b3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|1800799024|82310400026|18002099003|22082099003|921020|3023799007|6133799003|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: 1tnUIbK3D3p6k534TU23QkbnQ/xxiX9E6V63OOp1f9Xq+0QV2nmpD9/meUEN67kfFQSqDPj8s4Oy/VLI3aEtyh/gctp+8i/HPm1HybAkGS1L8skymh9NDPJeUwJSrxM8kwKeH+3BWo20bMK8TNu0OojvCSXhPCBTyJEKkFTi9VD5m39YhM8V5PXh05RXXpbjEY+oA7FZ81sDA1tn7+YotIY7WDRv+xb/5Ei7JjYR7Kj86BP5CmNkrFXLDieOw9dbcVtKbHPtp7BojrQy+8ZBU/UX3b6U28iX4fVYCGwWAOi6ptc+wc3VCW4lMcXLtECWehMTLrkwaRT7QRxH8Fw+y/aQMm6NrqVkMjXz2ahZqrJqdXz+6pyGAlXl8LnldDw7nILD3l1euCVnsTYke/7n/fBN2zVeKlRch0yDSsfIt+yImT215b6SrwH4ViA8Jk9YwhHt2MBVdmg/FI5oIk6/hj7jyfzIyWeF6jl+oGi1HIgQ0DZvLGRC5qEDE1lxS4Tx2lBrvIFmRalMWVHzLKa7DG2XZEp5aweFrY+s1WmFG+VE9cGdRaa04T8l6RRB6OdxsLuPjTblb/V+wIwUlERLjvyr78A/LxJn/OVBKZJWsnuX9knNOQnNnp03I3lTnloA3D4CG4XgMQ2/yTUKMZ1/Mj8QhzNcgijiPbO8a+dVp/N5/x3urx50DZjp3WFhJX+ukWcoKE+04Zg0UMR6M5dRtgAAgdRbyTVqXPmjo0II1blp446kDREmaX2kjHeBVgBI
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(921020)(3023799007)(6133799003)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u65cVey0MdXYoA6PUlUr6G4cYvv0MJXSiWmJtAWHcyivinuLqeYxy8kC9b5hjDE/6qdyQQPvj/+BokG0w/lUAfkBLd7kZORAU4F3yD7IH8ly5N8pdk6fZ1OEwigkizishsh6n/Cy0dI9ICSW434OBLOti4erofLCaiWr32wCZzTJ+y8U59IzJ2833gx6FqlZj6dyW2wNGZ/8QXfeQTJnbkFS0jjgV81XovkZb8AktUieKFbKUY/xr5tZjUP+j52n4VRqyAELoncbrkHo8RIVbOaEr/ZNmEZMbCs7qAf6g5lAYOCit5PeprPa1ffqdHGhVLupFkup+ftm8oKeSrzWnaRT9EbmfEll3RNmg3a9J75Bpa0fAlhoL+o7ZcW4yd1py48Q/PVly0GZwsJ5l7vEIbR+COqHiDYdA93SBVIxYPkGlDiHn0UEVF7+vy9GAeFn
X-Exchange-RoutingPolicyChecked: ieJ/YxpDU9ZlxdQFo89msepkZ7Z0dIzwY+aozh8IgPc7BWnf+RjYBBwIWtZblemdYyR643e4lOZVULxzmpeaz4uoTQwTdryYsANSWDgXQbc+r4b/uBPZ/ZAZ8i3hJiqcoOp8EmiIQJW+ZVWnJIjGKXmckcJ1f2lpaG4SAkSwOrTof4/wWprBlaDr2C7MUuyKtxQjbQzJHWzk+P4qKdGTGqBg7JFMQGjM5Bos4hdZ7QcpiaCJIvwyEpTtGztlR4KYSTbj7//z+gF5BzaptqAZM56Zo7uSjSYpa+i19S44EgCuEkRDB4gPkG9/REv884zs7prmzqCQJC4ps2Z9syB1ww==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 06:36:50.6230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4606cdb2-9f67-488c-cef9-08df1df40b3b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5828
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX8VbWDVSin3C9
 rrB2SVj4S6J7ApO9l1pZHGHZcV5w/wZqEdOj5ywbSUVRpLVwbKjwfJwIP8ud3cf2idvvRMlsYu8
 pSLlmUqywJXJ1nCLVPUA9Fz277vhc5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNiBTYWx0ZWRfX3Vp8fZzOGaAr
 fGtmour0a7OOytYhyJY4x3TzQEBPj8UtdSZ2dsQxJyaYqPLObjCY7oxemHe8hKSip2lfrjLJVTD
 r5xPQQlKUaitA58LSYgpB5Eu9DohxofAjvJDpVbIGK+qa8z2xF9vezAxWdROvLg/1K1RyNSsDLr
 gPBh71FJ0os/IhSBNtGzFc4IGiGw6LHL5ZsjDU6EiCNA5SCbVc9Uim/aMUcRlcRyreXR5TRT7Y4
 2yjRb1ws9QEZJh1CesQkhf5AczDp6YtfoDgZpG1ckWxC2uWRfGWweeDxUXJ7Vm62G1lLZz29ZJ/
 E4xFsGrE99z6W5TW1ckOtfJjqmyxNfvVgPNyQTnK+u/kUa1sfKHkD8eMFphbRL2TsZzZM4tHj4s
 CKDokviLfkF55Gc+gFrEdj+IQ1w1jdVEUCLrUXeOUYj0XpYdcqB+WupzATFxR214kb2TFHexHcD
 GK1bxP+5/t/ipiee1rQ==
X-Authority-Analysis: v=2.4 cv=Z4p5j3RA c=1 sm=1 tr=0 ts=6abb5c87 cx=c_pps
 a=n1uwvu+HdmtEBt1mSuDWUg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=aauMkRGVHSVL3AvwFNMA:9
X-Proofpoint-GUID: sUXI4yai8cne3hKHeNPvcFVNgzahuVZJ
X-Proofpoint-ORIG-GUID: sUXI4yai8cne3hKHeNPvcFVNgzahuVZJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_073707_352768_342B277F 
X-CRM114-Status: GOOD (  19.01  )
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

Extract the DMA transfer code from cqspi_direct_read_execute() into a
new cqspi_direct_read_dma() helper. Add cqspi_memcpy_fromio() to handle
non-DMA transfers, using 2-byte-aligned I/O reads for 8D-8D-8D mode to
satisfy the minimum 16-bit AHB transaction width required by the Cadence
OSPI controller in that mode.

Change cqspi_direct_read_execute() to take the full spi_mem_op and
post_config_max_speed_hz instead of separate buf/from/len parameters,
matching the interface needed by the PHY-aware version in the following
patch. Thread post_config_max_speed_hz from cqspi_mem_process() through
cqspi_read().

Transfers shorter than CQSPI_PHY_MIN_DIRECT_READ_LEN bytes always use
the memcpy path; longer transfers use DMA when available.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 76 +++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 6ac3607df0bb..494008b953cd 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -30,6 +30,7 @@
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/timer.h>
+#include <linux/unaligned.h>
 
 #define CQSPI_NAME			"cadence-qspi"
 #define CQSPI_MAX_CHIPSELECT		4
@@ -155,6 +156,8 @@ struct cqspi_driver_platdata {
 #define CQSPI_READ_TIMEOUT_MS			10
 #define CQSPI_BUSYWAIT_TIMEOUT_US		500
 #define CQSPI_DLL_TIMEOUT_US			300
+/* Minimum transfer length to use DMA for direct reads */
+#define CQSPI_PHY_MIN_DIRECT_READ_LEN		17
 
 /* Runtime_pm autosuspend delay */
 #define CQSPI_AUTOSUSPEND_TIMEOUT		2000
@@ -1529,8 +1532,8 @@ static void cqspi_rx_dma_callback(void *param)
 	complete(&cqspi->rx_dma_complete);
 }
 
-static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
-				     u_char *buf, loff_t from, size_t len)
+static int cqspi_direct_read_dma(struct cqspi_flash_pdata *f_pdata, u_char *buf,
+				 loff_t from, size_t len)
 {
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	struct device *dev = &cqspi->pdev->dev;
@@ -1542,11 +1545,6 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
 	dma_addr_t dma_dst;
 	struct device *ddev;
 
-	if (!cqspi->rx_chan || !virt_addr_valid(buf)) {
-		memcpy_fromio(buf, cqspi->ahb_base + from, len);
-		return 0;
-	}
-
 	ddev = cqspi->rx_chan->device->dev;
 	dma_dst = dma_map_single(ddev, buf, len, DMA_FROM_DEVICE);
 	if (dma_mapping_error(ddev, dma_dst)) {
@@ -1588,8 +1586,64 @@ static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
 	return ret;
 }
 
+static void cqspi_memcpy_fromio(const struct spi_mem_op *op, void *to,
+				const void __iomem *from, size_t count)
+{
+	if (op->data.buswidth == 8 && op->data.dtr) {
+		/* Handle unaligned start with 2-byte read */
+		if (count && !IS_ALIGNED((unsigned long)from, 4)) {
+			put_unaligned(__raw_readw(from), (u16 *)to);
+			from += 2;
+			to += 2;
+			count -= 2;
+		}
+
+		/*
+		 * Use an explicit 32-bit read loop for the bulk; this
+		 * guarantees the minimum 16-bit AHB transaction width required
+		 * in 8D-8D-8D mode on all architectures. Pairing the
+		 * endian-agnostic __raw_read*() with native put_unaligned()
+		 * (rather than put_unaligned_le*()) preserves the byte stream
+		 * exactly as memcpy_fromio() would, on both LE and BE hosts.
+		 */
+		while (count >= 4) {
+			put_unaligned(__raw_readl(from), (u32 *)to);
+			from += 4;
+			to += 4;
+			count -= 4;
+		}
+
+		/* Handle remaining 2 bytes */
+		if (count)
+			put_unaligned(__raw_readw(from), (u16 *)to);
+
+		return;
+	}
+
+	memcpy_fromio(to, from, count);
+}
+
+static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
+				     const struct spi_mem_op *op,
+				     u32 post_config_max_speed_hz)
+{
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+	loff_t from = op->addr.val;
+	size_t len = op->data.nbytes;
+	u_char *buf = op->data.buf.in;
+
+	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
+	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN) {
+		cqspi_memcpy_fromio(op, buf, cqspi->ahb_base + from, len);
+		return 0;
+	}
+
+	return cqspi_direct_read_dma(f_pdata, buf, from, len);
+}
+
 static ssize_t cqspi_read(struct cqspi_flash_pdata *f_pdata,
-			  const struct spi_mem_op *op)
+			  const struct spi_mem_op *op,
+			  u32 post_config_max_speed_hz)
 {
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	const struct cqspi_driver_platdata *ddata = cqspi->ddata;
@@ -1605,7 +1659,8 @@ static ssize_t cqspi_read(struct cqspi_flash_pdata *f_pdata,
 
 	if ((cqspi->use_direct_mode && ((from + len) <= cqspi->ahb_size)) ||
 	    (cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE))
-		return cqspi_direct_read_execute(f_pdata, buf, from, len);
+		return cqspi_direct_read_execute(f_pdata, op,
+						 post_config_max_speed_hz);
 
 	if (cqspi->use_dma_read && ddata && ddata->indirect_read_dma &&
 	    virt_addr_valid(buf) && ((dma_align & CQSPI_DMA_UNALIGN) == 0))
@@ -1633,7 +1688,8 @@ static int cqspi_mem_process(struct spi_mem *mem, const struct spi_mem_op *op)
 		     !cqspi->disable_stig_mode))
 			return cqspi_command_read(f_pdata, op);
 
-		return cqspi_read(f_pdata, op);
+		return cqspi_read(f_pdata, op,
+				  mem->spi->post_config_max_speed_hz);
 	}
 
 	if (!op->addr.nbytes || !op->data.buf.out)
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
