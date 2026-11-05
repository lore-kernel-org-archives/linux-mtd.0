Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C42606A336
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mtO3oEk8;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=N90wFQDC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=Ghv4cWsb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i37fOG3lrqjOu6jL0J9k/T4IWEMB+YuTtI5qotvnBE8=; b=mtO3oEk8XtXvu7+jc/KeyfOQou
	g58D9aZOYmfxOM18/DUCTRt5DvPxF+G6UfMZQuLm74CG31LLfCsT/EGqhp74QCgYI4PFmcKgo55Y9
	nnx7MCq+4mwc0L//M9NeMLJ//0fTdwdhDSCdLZu7yaYb+5B+W7Y8TYQM2dXyfaYyumyTxXtr3BD+6
	MPhdxxi0zytCWi/7g8nE8MkSTDP51FkYixgEaJJGkMvYajXRQr1gkHXGH9h66+ZPhhYtEU9ftJmLV
	uNZ2s5d5V80hNiUdyZZPbzyZi5YHg5lqsLE0T4m1wsG+FrxSO9EPDNqxDYCRQMQJ84C842YL7EQJI
	8JTWs8pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvCl-00000008XMr-0GLK;
	Thu, 05 Nov 2026 11:00:27 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvCi-00000008XKQ-0JKJ
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 11:00:26 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A59wGtv2214858;
	Thu, 5 Nov 2026 05:00:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0pVV0N5JXrZw10l20STfcqwu3EokcAsW+Q9wK+di+
	uE=; b=N90wFQDCnym3tJiUihw0h6W5ZmQXhGOLAOPyw1pBwLbBLaXpyXnVG1XUo
	EZ2Cd6WFoM3zfO2XAJ51LL4Kg678AFe7tfqLvsz7zJ6MLCRm+nJooAEo4gmCk/fZ
	o576uHD747ZfK1PFQFphKF7X5C3PbFbZUKbgD2Q4cVU8AUmswYinpZaVamT9DGnx
	Bwo3J7ZgaqkQD7HlWv4S2KLMnFqwsSs0G2aJ42sOz32DOT7FXbGOMm85jtLfZBpZ
	NcaUXgWFNwr5cBuuVEVtAaChdx2WJtOOcfvIFCtBfJvgShPXZPl5WL7LrJ1kjwlt
	l+lLgTY4WMBQI+LzTu95OCg1yPKuA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013000.outbound.protection.outlook.com [40.93.196.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9k1yn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 05:00:15 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/MWmWlL1T2FVHwJqUYjcszEpHGyN6rbnOZGrnX6vRSmkntwo8D8S+JT6ocum8wDNgvpSqPSRuOJYbC9YWyglMoyJnWm3cMMiQu4QvVxZWNZldXipZRrB1phyrd0m9rhfd4HzciJeYVtHEfopha2Tp8Z3seoh+JPMwbHLzrJXqNQXjM1VzdKx3DMpDacFRNaxogbCJ8prFON8rIcqV9x6qfUjdKWto0MYYk5cVzvQnYof2dj49o7poDM70qQM/3EIjl8SrGw4HpZRlODEdgWrF75+8ArkIyvwCpucXDduNNXPfTfaN3fZGDoHSyE3D/02JZubdz6eWce/pY9ZA+aNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pVV0N5JXrZw10l20STfcqwu3EokcAsW+Q9wK+di+uE=;
 b=jQbEy5Ex7Uh2ClcYJR7FTO9ot0wAlaUJ4sdznBGePPu6aTKvT55kVIW/QCawGBu1eLGOX7pxOpGaUxJSU/Xpnue8j+Mcf4rewQcET73EsJ/1FF1MLr3Hop+SGHcbeMBGw8lWrYcqWSNcif7RUxHDLauJfZNmqNo1saDf3Ps1vk9GqUg6re6QL3V8gZL1Cidiba/nIjGCl0jn6HtwjhDQxJuVSv0lLvRyyakFYX1maBNyrSUwmBPWDAoEX2nlqeqVygeTLKP51mEu7q4MmIH/HCqFQDEu4C/4FrX0z/bwWbDksmGkjf4pnHRlg+QZmq/X5KJemPNRzxvEFsnKBQtupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=amd.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pVV0N5JXrZw10l20STfcqwu3EokcAsW+Q9wK+di+uE=;
 b=Ghv4cWsbOwpIyN7uiY0F/1TArZcMZjof7C6WE4Zw+90cY9wvFDp04jNpB78t6LvG23kMH2+1NlMmT6aMgmW1agjvIeScOajmfaG+qRvs4FqohSLsBBQItZUm8J4fbmW1pe8nWowg7XAGy/WIsgAZb4Sp7Wi1IM4qrFgcbCKu2YY=
Received: from BN9PR03CA0606.namprd03.prod.outlook.com (2603:10b6:408:106::11)
 by IA0PR10MB6867.namprd10.prod.outlook.com (2603:10b6:208:433::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:00:09 +0000
Received: from BL2PEPF000352D1.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::a7) by BN9PR03CA0606.outlook.office365.com
 (2603:10b6:408:106::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 11:00:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL2PEPF000352D1.mail.protection.outlook.com (10.167.249.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 11:00:08 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 04:59:50 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 04:59:50 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 04:59:50 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5Awg2J4171076;
	Thu, 5 Nov 2026 04:59:45 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <srikanth.boyapally@amd.com>, <m-shah@ti.com>, <s-k6@ti.com>
Subject: [PATCH v11 11/19] spi: cadence-quadspi: enable PHY for direct reads
Date: Thu, 5 Nov 2026 16:28:24 +0530
Message-ID: <20261105105832.2134313-12-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105105832.2134313-1-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D1:EE_|IA0PR10MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f89f54-6ca8-4bda-1b05-08df3b2bf4e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|921020|56012099006|261021133027099003|261021123027099003|261022075727099003|261021130227099003|261021121427099003|261022105027099003|261009221227099003|261021135927099003|261009223027099003|261026140227099003|261102123227099003|261022113327099003|261022115727099003|261026135527099003|261026121527099003|261026130827099003|261028144727099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: ULqHKdfN3nKsttGvkZtdY2T4jKAAup1lMAqx04pdke6AfMSDGkuRcLLGqGpigaHBwW0HoGDKcYYBXbGIBUc25wx2MHbZOhQ4BAQNIkN+JKB2zEiO2v4eg/EwBR1VUjlS8up8Gx98idsmdefNV1RzfKrz6Ml9i2H0ApWA2ZUOmvfXHpk3sKb1yYsRT6pOGSDdDHhACy/xLmxTbVZVrcZmjiZIrrxwGhpjN7lU1qK8H4Sfvu7flJI00OL59AltlDIpCM26Yzz1XsuAsO3OrRj0ZZvDG79uGIlFb0M3WWUIL9+ge1lbdnoDMw+cu5E0snn+PgcpyecxFRViAqT/OarEk6/mB2eWvyvYu0XgPiOo+L3M0dU5Q/TuxbwCVHwFi/U5p71Knu5OS54ku03bvZumLC4LX0BDWx8EiZFYULSyd2KP4us6o32xX162VetTS5mtxN1QBvq1k4UHpLtjvPnoKz+Bipryr+74xBJzi1XhoV9lT3WB1HmYJiQ2rGwbYpTIU/cikfsBw6uezi0Y5Biw7vov3GlGC3vjs8HAGXHEtQGDKrY3K94llYf40KrcP56jt3hzGyazM1HEqmR5la7ihddD8iqDfnVGAM5W2w+scgjtFN/2iIE8I1M8ckOtpFQCUfo7CN5H2fNlkfq3TtmpalRUl5cWvftPpVomCtBJSUvuuKIsB/Fi0JIVMULvotZg
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(921020)(56012099006)(261021133027099003)(261021123027099003)(261022075727099003)(261021130227099003)(261021121427099003)(261022105027099003)(261009221227099003)(261021135927099003)(261009223027099003)(261026140227099003)(261102123227099003)(261022113327099003)(261022115727099003)(261026135527099003)(261026121527099003)(261026130827099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DILt2p4dGwcHnyxEhLsQ0A0VwErOYVk5IVrM1PiMZ9dZBZEBoj6++vR3bnU0kD5UtEbpfAWxmpNu9tbizKnX9psujR9gKJtx89o2cROsSG51PZVra8qgUAUWshc7s58lkjq6AtPCGbbYbmIKRu4pstPgH/JpX06LjKKys/k4XYgtN4xP22hw4XaGLY41IxbkwnF6SdJvOVzl99rE3paPPAo8HLT9mMs++s/56GzrNZMTQ66fC+7SleTG30855SaHp7JWhuWNLQkIggYK1iyeJTgZVkxfnAoH0uNCg6MI+9tm+tXu9MF88HUJtcF3AVgxRIZmqR8g1As6Od9qCZWNAcD+HODO9dZyuF+MHs4q9ceScy0fSPq3q6oerT16yDaqmyyMVZuonSOqivZj5WACvkcSLxX12VAzF1ON6fhU97xunZzEYdig+BGDpA3x/IJL
X-Exchange-RoutingPolicyChecked: CwmozNlNxLFy193U8Y0VCGZVhJ+b3iZ7xwku3AKCCQfAmg/D02UqSovLXPv/B2E3S9SCG6w+P1y/pAmj9VxBukl7Nl1k9MKlKnT98E9wbW78FddGajxljNKlRjPk7a79AjOymPfp++thWwUlUACJ0yY63C27NaGFRA5ApZB6SwjAsbbJ6t+REvwB0+zWvjZB4XI+XHxPWj0+0dujGAR68Nlq4uW82sZy9AlW38Kah6IqCryDRu+JZ9DK6Emr6TGaP3tkFQW4u9CBttE64g5wxleLssxtcg0mFUs/9RKll/aSDk0zcNmvjYiZy1pM5n0cRVeonIbgs2rJOo8LVxCnXg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:00:08.6762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f89f54-6ca8-4bda-1b05-08df3b2bf4e1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2PEPF000352D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6867
X-Proofpoint-ORIG-GUID: ijJxI3hyRKPuYzZEkypDCgk5O-H-NQcJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX8/FwzBTkUDfZ
 xKfEAXTfnOkWriKNUvvwb/0WHgQTWuLbEnhSPzZzOfRYAgt7a2+nORKnVR1ZZhnvGG+b4jAOnxB
 tdrmDTe0jI3wcvFJR9BapnB1ngklzPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX3I9PUgi8vNtM
 0XT5fiH16CKGewX6NmcT7K+OhRDpE2g7OUKaXEp65rAXx5dv598gwQDRVoOW6wliIoyKdSU+Anc
 IFuMYaxWIac3jERP1YYHQwH1JHHlwvzB5ytkOmIoPJqXmzC2hJlZ1vB+iFZ20JqkVnF3YonZS2z
 x+b5WXgykiMBQ1h7vnntUFptzRssMQOX9mTAE0NmF18qD0gTOXAI9hdkgFMyXF6I6Z7lfbTn9HB
 OD4Gbp2xd+Q4sOFCdbLpVkSnDSJ9DzJxeLn9buPFQBS3d43FzcdoGLWao6UMS2f9ax8SZ3xYszI
 8sp/egvk4xXunFObEj15XtNlvAFiMktgIwahy4Ieye3KHyb4lfFxLQ+f72U/Af1R0970CPu9sXZ
 C9Ch+OtThVIu2C+yY+nURzV9AFm2Mm7rl6CL/mGfA30BXECkaVDiJRfn0tmsqgc2CBoDBooN95d
 RDOPo2V2k5jT49tg5Pw==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aec61bf cx=c_pps
 a=9AjoWhdl+q7f6/Aw5qa/DQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=zd2uoN0lAAAA:8 a=xvvdLyzBXiBTOVs6KicA:9
X-Proofpoint-GUID: ijJxI3hyRKPuYzZEkypDCgk5O-H-NQcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030024_136649_59BCA275 
X-CRM114-Status: GOOD (  17.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add cqspi_tune_phy_read() to toggle PHY mode around a direct-mode DMA
read. On enable: reprogram the DLL from the per-CS calibration result
when the hardware values differ (handles alternating PHY reads across
chip selects with different calibration), configure read-capture for
the tuned delay, assert PHY_EN and PHY_PIPELINE in CONFIG, and reduce
the dummy cycle count by one since the PHY data-capture pipeline
absorbs that latency. The controller is confirmed idle before CONFIG
or RD_INSTR is touched in either direction -- including on disable,
since the preceding read may still be draining.

Add cqspi_use_tuned_phy() to gate PHY use on a successful prior
calibration and on the op requesting the post-config rate.

A read that cannot use the tuned PHY -- untuned, unaligned to 16
bytes, too short for DMA, or lacking a DMA channel -- must not run at
the post-config clock rate: the controller has no way to sample data
correctly at that speed without PHY compensation. Add
cqspi_direct_read_fallback() to drop the clock to the base rate for
the duration of such a transfer, and apply the same rule to the
indirect-mode path in cqspi_read().

Tested-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
Tested-by: Moteen Shah <m-shah@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-cadence-quadspi.c | 195 +++++++++++++++++++++++++++---
 1 file changed, 179 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index c324451a9a28..55c446f4245a 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -6,6 +6,7 @@
 // Copyright Intel Corporation (C) 2019-2020. All rights reserved.
 // Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
 
+#include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -1075,6 +1076,105 @@ static int cqspi_resync_dll(struct cqspi_st *cqspi)
 	return ret;
 }
 
+static int cqspi_phy_reprogram_dll(struct cqspi_flash_pdata *f_pdata)
+{
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int reg;
+	int ret;
+
+	/* CQSPI_REG_PHY_CONFIG is global; resync if it doesn't match this CS. */
+	reg = readl(reg_base + CQSPI_REG_PHY_CONFIG);
+	if (!f_pdata->dll_locked ||
+	    ((reg >> CQSPI_REG_PHY_CONFIG_RX_DEL_LSB) &
+	     CQSPI_REG_PHY_CONFIG_RX_DEL_MASK) != f_pdata->phy_setting.rx ||
+	    ((reg >> CQSPI_REG_PHY_CONFIG_TX_DEL_LSB) &
+	     CQSPI_REG_PHY_CONFIG_TX_DEL_MASK) != f_pdata->phy_setting.tx) {
+		cqspi_set_dll(reg_base, f_pdata->phy_setting.rx,
+			      f_pdata->phy_setting.tx);
+		ret = cqspi_resync_dll(cqspi);
+		if (ret) {
+			f_pdata->dll_locked = false;
+			return ret;
+		}
+		f_pdata->dll_locked = true;
+	}
+	return 0;
+}
+
+static void cqspi_phy_restore_read_config(struct cqspi_flash_pdata *f_pdata)
+{
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+	void __iomem *reg_base = cqspi->iobase;
+	unsigned int reg;
+
+	/* Shared by the disable path and the failed-enable rollback. */
+	cqspi_readdata_capture(cqspi, !cqspi->rclk_en, false,
+			       f_pdata->read_delay);
+
+	reg = readl(reg_base + CQSPI_REG_CONFIG);
+	reg &= ~(CQSPI_REG_CONFIG_PHY_EN | CQSPI_REG_CONFIG_PHY_PIPELINE);
+	writel(reg, reg_base + CQSPI_REG_CONFIG);
+
+	reg = readl(reg_base + CQSPI_REG_RD_INSTR);
+	reg &= ~(CQSPI_REG_RD_INSTR_DUMMY_MASK << CQSPI_REG_RD_INSTR_DUMMY_LSB);
+	reg |= FIELD_PREP(CQSPI_REG_RD_INSTR_DUMMY_MASK
+				  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
+			  cqspi->phy_saved_dummy);
+	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
+}
+
+static int cqspi_tune_phy_read(struct cqspi_flash_pdata *f_pdata, bool enable)
+{
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+	void __iomem *reg_base = cqspi->iobase;
+	u32 reg;
+	u8 dummy;
+	int ret;
+
+	/* Wait for idle before touching CONFIG/RD_INSTR either direction. */
+	ret = cqspi_wait_idle(cqspi);
+	if (ret)
+		return ret;
+
+	if (!enable) {
+		cqspi_phy_restore_read_config(f_pdata);
+		return 0;
+	}
+
+	ret = cqspi_phy_reprogram_dll(f_pdata);
+	if (ret)
+		return ret;
+
+	cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,
+			       f_pdata->phy_setting.read_delay);
+
+	reg = readl(reg_base + CQSPI_REG_CONFIG);
+	reg |= CQSPI_REG_CONFIG_PHY_EN | CQSPI_REG_CONFIG_PHY_PIPELINE;
+	writel(reg, reg_base + CQSPI_REG_CONFIG);
+
+	/* PHY pipeline adds one cycle of latency; save count, then reduce it. */
+	reg = readl(reg_base + CQSPI_REG_RD_INSTR);
+	dummy = FIELD_GET(CQSPI_REG_RD_INSTR_DUMMY_MASK
+				  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
+			  reg);
+	cqspi->phy_saved_dummy = dummy;
+	if (dummy)
+		dummy--;
+	reg &= ~(CQSPI_REG_RD_INSTR_DUMMY_MASK
+		 << CQSPI_REG_RD_INSTR_DUMMY_LSB);
+	reg |= FIELD_PREP(CQSPI_REG_RD_INSTR_DUMMY_MASK
+				  << CQSPI_REG_RD_INSTR_DUMMY_LSB,
+			  dummy);
+	writel(reg, reg_base + CQSPI_REG_RD_INSTR);
+
+	ret = cqspi_wait_idle(cqspi);
+	if (ret)
+		cqspi_phy_restore_read_config(f_pdata);
+
+	return ret;
+}
+
 static int cqspi_versal_indirect_read_dma(struct cqspi_flash_pdata *f_pdata,
 					  u_char *rxbuf, loff_t from_addr,
 					  size_t n_rx)
@@ -1493,6 +1593,14 @@ static void cqspi_configure(struct cqspi_flash_pdata *f_pdata,
 		cqspi_controller_enable(cqspi, 1);
 }
 
+static bool cqspi_use_tuned_phy(struct cqspi_flash_pdata *f_pdata,
+				const struct spi_mem_op *op,
+				u32 post_config_max_speed_hz)
+{
+	return f_pdata->use_tuned_phy &&
+	       op->max_freq == post_config_max_speed_hz;
+}
+
 static ssize_t cqspi_write(struct cqspi_flash_pdata *f_pdata,
 			   const struct spi_mem_op *op)
 {
@@ -1622,26 +1730,66 @@ static void cqspi_memcpy_fromio(const struct spi_mem_op *op, void *to,
 	memcpy_fromio(to, from, count);
 }
 
+static int cqspi_direct_read_fallback(struct cqspi_flash_pdata *f_pdata,
+				      const struct spi_mem_op *op,
+				      unsigned long max_speed_hz,
+				      u32 post_config_max_speed_hz)
+{
+	struct cqspi_st *cqspi = f_pdata->cqspi;
+	loff_t from = op->addr.val;
+	size_t len = op->data.nbytes;
+	u_char *buf = op->data.buf.in;
+	unsigned long configured_sclk = cqspi->sclk;
+	bool reclock = op->max_freq == post_config_max_speed_hz &&
+		       configured_sclk != max_speed_hz;
+	int ret = 0;
+
+	/* Drop to the safe rate for this untuned transfer; PHY isn't used. */
+	if (reclock)
+		cqspi_configure(f_pdata, max_speed_hz);
+
+	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
+	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN)
+		cqspi_memcpy_fromio(op, buf, cqspi->ahb_base + from, len);
+	else
+		ret = cqspi_direct_read_dma(f_pdata, buf, from, len);
+
+	if (reclock)
+		cqspi_configure(f_pdata, configured_sclk);
+
+	return ret;
+}
+
 static int cqspi_direct_read_execute(struct cqspi_flash_pdata *f_pdata,
 				     const struct spi_mem_op *op,
+				     unsigned long max_speed_hz,
 				     u32 post_config_max_speed_hz)
 {
 	struct cqspi_st *cqspi = f_pdata->cqspi;
 	loff_t from = op->addr.val;
 	size_t len = op->data.nbytes;
 	u_char *buf = op->data.buf.in;
+	int ret;
 
-	if (!cqspi->rx_chan || !virt_addr_valid(buf) ||
-	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN) {
-		cqspi_memcpy_fromio(op, buf, cqspi->ahb_base + from, len);
-		return 0;
-	}
+	if (!cqspi_use_tuned_phy(f_pdata, op, post_config_max_speed_hz) ||
+	    !cqspi->rx_chan || !virt_addr_valid(buf) ||
+	    len < CQSPI_PHY_MIN_DIRECT_READ_LEN ||
+	    !IS_ALIGNED(from, 16) || !IS_ALIGNED(from + len, 16))
+		return cqspi_direct_read_fallback(f_pdata, op, max_speed_hz,
+						  post_config_max_speed_hz);
 
-	return cqspi_direct_read_dma(f_pdata, buf, from, len);
+	ret = cqspi_tune_phy_read(f_pdata, true);
+	if (ret)
+		return ret;
+	ret = cqspi_direct_read_dma(f_pdata, buf, from, len);
+	ret = cqspi_tune_phy_read(f_pdata, false) ?: ret;
+
+	return ret;
 }
 
 static ssize_t cqspi_read(struct cqspi_flash_pdata *f_pdata,
 			  const struct spi_mem_op *op,
+			  unsigned long max_speed_hz,
 			  u32 post_config_max_speed_hz)
 {
 	struct cqspi_st *cqspi = f_pdata->cqspi;
@@ -1658,9 +1806,14 @@ static ssize_t cqspi_read(struct cqspi_flash_pdata *f_pdata,
 
 	if ((cqspi->use_direct_mode && ((from + len) <= cqspi->ahb_size)) ||
 	    (cqspi->ddata && cqspi->ddata->quirks & CQSPI_NO_INDIRECT_MODE))
-		return cqspi_direct_read_execute(f_pdata, op,
+		return cqspi_direct_read_execute(f_pdata, op, max_speed_hz,
 						 post_config_max_speed_hz);
 
+	/* Indirect mode has no PHY support; never run it at the tuned rate. */
+	if (op->max_freq == post_config_max_speed_hz &&
+	    cqspi->sclk != max_speed_hz)
+		cqspi_configure(f_pdata, max_speed_hz);
+
 	if (cqspi->use_dma_read && ddata && ddata->indirect_read_dma &&
 	    virt_addr_valid(buf) && ((dma_align & CQSPI_DMA_UNALIGN) == 0))
 		return ddata->indirect_read_dma(f_pdata, buf, from, len);
@@ -1672,22 +1825,32 @@ static int cqspi_mem_process(struct spi_mem *mem, const struct spi_mem_op *op)
 {
 	struct cqspi_st *cqspi = spi_controller_get_devdata(mem->spi->controller);
 	struct cqspi_flash_pdata *f_pdata;
-
-	f_pdata = &cqspi->f_pdata[spi_get_chipselect(mem->spi, 0)];
-	cqspi_configure(f_pdata, op->max_freq);
-
-	if (op->data.dir == SPI_MEM_DATA_IN && op->data.buf.in) {
+	unsigned long sclk = op->max_freq;
+	bool is_read = op->data.dir == SPI_MEM_DATA_IN && op->data.buf.in;
 	/*
 	 * Performing reads in DAC mode forces to read minimum 4 bytes
 	 * which is unsupported on some flash devices during register
 	 * reads, prefer STIG mode for such small reads.
 	 */
-		if (!op->addr.nbytes ||
-		    (op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX &&
-		     !cqspi->disable_stig_mode))
+	bool use_stig = is_read &&
+			(!op->addr.nbytes ||
+			 (op->data.nbytes <= CQSPI_STIG_DATA_LEN_MAX &&
+			  !cqspi->disable_stig_mode));
+
+	f_pdata = &cqspi->f_pdata[spi_get_chipselect(mem->spi, 0)];
+
+	/* Tuning inactive, or STIG (no PHY handling of its own): use safe rate. */
+	if (sclk == mem->spi->post_config_max_speed_hz &&
+	    (!f_pdata->use_tuned_phy || use_stig))
+		sclk = mem->spi->max_speed_hz;
+
+	cqspi_configure(f_pdata, sclk);
+
+	if (is_read) {
+		if (use_stig)
 			return cqspi_command_read(f_pdata, op);
 
-		return cqspi_read(f_pdata, op,
+		return cqspi_read(f_pdata, op, mem->spi->max_speed_hz,
 				  mem->spi->post_config_max_speed_hz);
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
