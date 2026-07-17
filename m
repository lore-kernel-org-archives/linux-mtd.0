Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62364C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 19:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BpVAKtH0xki+qxTYadpxxab0JmbvJhr5VIYtt4LCD5k=; b=hcWOUcjm5W51cC
	madVIbGk/1l8mq7yqaGXtcN4+XK9MMoLwZs25xaTSsXrTX/LbYYc8XfD8fxe43vuMkt6A4vw0eInl
	cb7HIf/AsG5ea1oF+PxyPXHUuPSIeckQpMQm1/hqqxB9lJz9BsuS5YZUteU52ndn+PEKAIXFKjfpQ
	ujFm5I3Q2Y5I93If2EEWtmRbLlzk+dw1bxQxI3TTygb0w0fG3rSmdiIeZ2wwERjoDmpQGwoJf9ggT
	wN1YcSygNzF73Qw0mozVgwzpZaXbUkLrvR4C4/jteJm9JIMWO8YOQJ7zBEptCz3N8waxVFgOxL0Up
	fMx/OeYNcUb2IGnP//Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknnw-000000035KQ-0cQR;
	Fri, 17 Jul 2026 19:01:00 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknnt-000000035Jh-1S0U
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 19:00:59 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HIlFP73222589;
	Fri, 17 Jul 2026 14:00:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=v7Xt5AsTkwICBWDQvi5NKWrUzGBZ9VbKKRRONnQ0S
	FU=; b=dWnKJNCP5yk9ANFe4hMfJ8JIBL0TId4A7TqeCy0FqJ+IqNaTDogvRuRnl
	rMwVBemv0FRl9exewjUl1q1QewEuhrfHHeFt9kfuKn+8RDcNaliwvfJssjzrBv4S
	9bUttjIcFfz8Pps6EL0BfmWsNwDOv7a1K0UQzNbz5mZ9PNCMC5mmrtyK0cdroLOw
	z3VHG/MCHb41LlK4eMotP1br3sTr0lJWzSpui8n1RfMItTNcZVLPqJjaxvtJzSte
	6MRAM32x5UOYOsizkI7UjoITC4tTPtVZANjGAS46XxtRG8vPYqr14agWyMKrAQMD
	vnasadbBRx9JSwzxSWiypNyPniHPA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012026.outbound.protection.outlook.com [40.107.200.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ffkc3jvfd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 14:00:49 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fDFIkBi+EuRQipaZaurOy9Mx74YtaFyBv98w4HVBd9tetB2BK1s8RYhC8SKAYPtwl+zRovdTnuWYeexJKhs5vgRAe5CHGN21Hi0c5pMc0azbnutbb9yIgWwymDiKkIuIv03c2JiYvznT04xWR5030Kof8mdHh+RBaRAWtFZb4tNchpj0epzVVHD+v2ZwHi7bHyIMJ3UVa0Bnv2KaQACCWIZORg7xYgVWB112hmnh1q8Dd1JFKiiQfZmjDV6Z6DSsfyQwfk55xAtAsDN/r0vZTbWcRBt0G0HcMmSlK8x3KEE+PXC+iDP+e+E0JuKuzYHFlYVm6X05QyT7tiI0psJe3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7Xt5AsTkwICBWDQvi5NKWrUzGBZ9VbKKRRONnQ0SFU=;
 b=RazCot5YknlGIVFGWewlpSK6A81bnCyIalNMY6hpLmrKQ1ouxL8J1fT0ttQHieRWYloAZt3DXiTOYOgdq+62FpoTFb9LTg1KAhxeiyrvkf/bqnghjaF7BwQ7N7umEAu6B//nJhebrepIi79GmpZfKkc9g8VMeQiuJH/D8nq/5DImKBEsmBlgWdfUFBDRgvxsA/rFftfv2CANQkP5KI4Y0sXtLeM11NdLoOjA+Y/hTCtHp6w4Yf8fbjA1uq6QP4mQ0MiMhc0mjhkk+PW0VxEITdFmJHppZtg+/6ztosUG9C/nouqLmwac9yKSavoFYQEInPZJw8glWU107uQ2n8Al8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7Xt5AsTkwICBWDQvi5NKWrUzGBZ9VbKKRRONnQ0SFU=;
 b=OH6iNuoVb/Aw3djs6DYGCdxCPu/Dl4vmRLfIKVlWtySMLnP7DG6HGFe3U2+e1bAJD469m+0MR7dlg79kvu4TWril7U2s/f70cimf8qIIhTOO+yA7f2LdhtW9SDTOSJ1+8R5WZ5jV8C35awPDRytqPtOq1/e7HqxHG1uDVV78zo0=
Received: from SN7PR04CA0076.namprd04.prod.outlook.com (2603:10b6:806:121::21)
 by PH7PR10MB6676.namprd10.prod.outlook.com (2603:10b6:510:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 19:00:38 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:121:cafe::6) by SN7PR04CA0076.outlook.office365.com
 (2603:10b6:806:121::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 19:00:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 19:00:36 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 14:00:36 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 14:00:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 14:00:36 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HJ0Tcq3854692;
	Fri, 17 Jul 2026 14:00:30 -0500
Message-ID: <9318b1a8-eed7-4d27-94ca-5137269f8ecf@ti.com>
Date: Sat, 18 Jul 2026 00:30:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/16] spi: cadence-quadspi: add PHY tuning support
To: Michal Simek <michal.simek@amd.com>,
        "Mahapatra, Amit Kumar"
	<amit.kumar-mahapatra@amd.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "richard@nod.at"
	<richard@nod.at>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "pratyush@kernel.org"
	<pratyush@kernel.org>,
        "mwalle@kernel.org" <mwalle@kernel.org>,
        "takahiro.kuwano@infineon.com" <takahiro.kuwano@infineon.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
        "praneeth@ti.com" <praneeth@ti.com>,
        "u-kumar1@ti.com" <u-kumar1@ti.com>, "a-dutta@ti.com" <a-dutta@ti.com>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "Amit
 Mohapatra" <amitrkcian2002@gmail.com>, <s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <DS7PR12MB9503EA13A8FB71938556F1CDDCEF2@DS7PR12MB9503.namprd12.prod.outlook.com>
 <13926125-5e55-43c5-b502-4e487d561ee2@ti.com>
 <979c6ed6-4e75-416a-ae5f-a2a8d3ec1a4c@amd.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <979c6ed6-4e75-416a-ae5f-a2a8d3ec1a4c@amd.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|PH7PR10MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 2945374f-b4ac-439b-4733-08dee435afdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|6133799003|3023799007|18002099003|22082099003|10067099003|4143699003|56012099006|921020;
X-Microsoft-Antispam-Message-Info: /2uMv5tOiN46+hlgGr307rv1bWL9PLIjIk7y+r9n1myJit/kNbacSZN41iA5jk32kNfY06/UgNYRvl2+EmfzcCOUXxYekFmbk0v18rv5l7l0sKkuIe8PE7L0zXqpo2eSjeLyRu/UiljuhO4DG18ElJPutFFd5UBQooopoVJ/XuqD2gJPryf+y4yc0ObVJCvdI4fl5KZCSt44xUteCpRje++S9OtpbfcOZrma5LssjQDLrwCKBJfPHbXoG89IzFUQQb5OXK/hj0iEbQQq1ddPbvNl+wopcZ3lFt+BqPlVKues3stsRMMJEycqKRkKsNGSnIbKz56jm74iL67MjdOPkcwcIJcpNktx9vNOTXhv2eKYSBoALTkF19UOBalSgVAhJ1+zk5GRaQUd5vnw5fPccmi+uPbgCn0mW0xxOVoe/XNl/crkx9kioqKahkXLET/K8ktNEsvtvQmbtDE0zSOfcGnmj9Z5BThjcPiHVgR8RHWTcFkOfZ6Gux/dIS6KAdtZCgSbDbaOxvDjMr1AZMkptvLGWGRHQLV0RnskC8u99x8lO5hKzAcl9WZ+7ZqI9blOIpy86lXOA+gRo52l5qubiYO58b/tFw5EWUqMY7M1pPfryNUUf7MmEIT26BmLMswEReyHBMNQ60jlnmO9IvQNVzl47v7fqpnL34+puCWq5atOi9AB9LJB2R+2PH08nNvQhdiv5t3oMSQKhDra2s3hcir6w8DvUN9qOMOLkohrq/rF6AtN9eqM0qtDscM7Qav9
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Iw/GyMM2b8FpeoR8kzsmBxNc7T5emZ5LaAticXQgTECSw/vFt1zZTZJDkQ5Gc2cZPgrACG5VrfUKIUNnr+AlsBlL79gKPqtkULQ09/1ttpBmA8dYfXOUGpnErXtG/42XpUtV/yUS2U/+5DQohwNO8UjGHMcybrO6BFQqY6UimBkiY/ZQWnpFZ0n9wFCH/riu/6LRFR5X+plcyztLU0GHCVo7erJ9KXB7zZhSn5Ry1augpmkPAyn4hN7lSe0bcgVgfAnMVv51DgsmUFfuZ1r8P50x7kofq/V1mmqsbQrOc/qo8/ENOomKsS0REcixZGuSl3HJQ4Ku0NL1fwRkNEuhVRihN2w2WsR2ST9k1d863gLEYSgkQZOvZ+1jCfw/eoDXDljs9qED6OK+L7RRD91OGGNk5k0UWOxoXxvPrkNFv/Vh0gD/YaPrORYRkA7qTCnl
X-Exchange-RoutingPolicyChecked: pFWNZAVGgHK+ycMNlw0AYqvqiXffCPPwY5sKFjo089Z0okB7hDOgsNITvhmgmLM6F82LNbB2I20hnzmDMC6ykz029Ckwc7nEXuJIa17TmPIz4KutDtwxDJqI17cMaYadtaU7M2yl6+aDbDXojxIw+Nkk0sWGI4uBynd7f4YeAMYZmEaqAiofK5iZFaRZ3KCFHb9TBj6tbkM8aAQvOuJF73gpk2x3Z9ceQpp7Y4Z2uBsu2xgvnIMcDcofF0IPCgdH4Bu5pmztSfOfP9KjwlV0clyaJc1VU4q64uVbR66pVtuCoVuCCT7jE2fsZuAKV3lrdsykeXVRNzS8IC1bDFvMpA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 19:00:36.7331
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2945374f-b4ac-439b-4733-08dee435afdd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6676
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE5NCBTYWx0ZWRfX42kYcasruqDN
 nluP207CQEyAEnYN8en4f+ShucwkvrIgTd9YH0w56nDXU0ghLiI3O640heZKCqfwhD+c2c2JQxi
 t5jPC56kS3gHQ07JnHu5Nw4k4ynk9oI=
X-Proofpoint-GUID: V2kbKj504EO98LP8k7iAiWINxeEvRv2C
X-Authority-Analysis: v=2.4 cv=M7F97Sws c=1 sm=1 tr=0 ts=6a5a7be1 cx=c_pps
 a=A3soYu1h9hn2xD7k0nk5XA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=P-IC7800AAAA:8
 a=bUQKSiCPAAAA:8 a=JfrnYn6hAAAA:8 a=HTSW3ffPhbCBlancTZ0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22 a=-fHZXUhsFbuwFN3fwQAr:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: V2kbKj504EO98LP8k7iAiWINxeEvRv2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE5NCBTYWx0ZWRfX0a9Rsmcbha42
 hJUfNpUOjTP6gJiMrGemkCSOl2R9VvysMutJKeuinKUC5ng+8KLmFR7/INq1qsaHgSSXmlkVCun
 frgkIJWtgYUUrdBFOisidzRSRiQ3BLQV5o33EIIehdLUEIrZdqmfgWNMOSYFlTsx+Y6JhCK3l5h
 d5GJsC5OWkmH0uaBcoGTqnsI0CvR+wNpfokTrm9PZjwrJHwQ7Ll282fIwkLGHLQRiIn7PLyyT3x
 lK+Zse27mGrwy1a3w4DaMWGa2LNiwChjWcn4hAs7XMPuZcONFULcXFsQ7q8Ijar/vIRDY8F4WTg
 kDCT4yP2BRFGW61tWfn6DY6J/usB3xlAnAW+BZ+8DsQpVDrG5iLD/dH/zSA8p22byEFEl6ARhXU
 5TnOVPClcnbH2MA1eYVeLydofG3ayprOmB9eKJc6d3RE5UniRxHTgu+BVMDFRwNk2FTeGzRpHon
 oL0LaK1FFav11gydWEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_120057_859974_20FB1B49 
X-CRM114-Status: GOOD (  13.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWljaGFsLAoKT24gMTYvMDcvMjYgMTk6MjcsIE1pY2hhbCBTaW1layB3cm90ZToKPiAK
PiAKPiBPbiA3LzE2LzI2IDA4OjA0LCBTYW50aG9zaCBLdW1hciBLIHdyb3RlOgo+PiBIZWxsbyBB
bWl0LAo+Pgo+PiBBcG9sb2dpZXMgZm9yIHRoZSBkZWxheWVkIHJlc3BvbnNlLgo+Pgo+PiBPbiAy
Mi8wNi8yNiAxMDowMCwgTWFoYXBhdHJhLCBBbWl0IEt1bWFyIHdyb3RlOgo+Pj4gQU1EIEdlbmVy
YWwKPj4+Cj4+PiBIZWxsbyBTYW50b3NoLAo+Pj4KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+Pj4+IEZyb206IFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPgo+Pj4+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDE4LCAyMDI2IDE6MDcgUE0KPj4+PiBUbzogYnJvb25pZUBrZXJuZWwu
b3JnOyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsKPj4+PiBjb25vcitkdEBr
ZXJuZWwub3JnOyBtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tOyByaWNoYXJkQG5vZC5hdDsKPj4+
PiB2aWduZXNockB0aS5jb207IHByYXR5dXNoQGtlcm5lbC5vcmc7IG13YWxsZUBrZXJuZWwub3Jn
Owo+Pj4+IHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20KPj4+PiBDYzogbGludXgtc3BpQHZn
ZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQo+Pj4+IGtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOyAKPj4+
PiBwcmFuZWV0aEB0aS5jb207IHUtCj4+Pj4ga3VtYXIxQHRpLmNvbTsgYS1kdXR0YUB0aS5jb207
IHMtazZAdGkuY29tCj4+Pj4gU3ViamVjdDogW1BBVENIIHY0IDAwLzE2XSBzcGk6IGNhZGVuY2Ut
cXVhZHNwaTogYWRkIFBIWSB0dW5pbmcgc3VwcG9ydAo+Pj4+Cj4+Pj4gVGhpcyBzZXJpZXMgaW1w
bGVtZW50cyBQSFkgdHVuaW5nIHN1cHBvcnQgZm9yIHRoZSBDYWRlbmNlIFFTUEkgCj4+Pj4gY29u
dHJvbGxlciB0bwo+Pj4+IGVuYWJsZSByZWxpYWJsZSBoaWdoLXNwZWVkIG9wZXJhdGlvbnMuIFdp
dGhvdXQgUEhZIHR1bmluZywgCj4+Pj4gY29udHJvbGxlcnMgdXNlCj4+Pj4gY29uc2VydmF0aXZl
IHRpbWluZyB0aGF0IGxpbWl0cyBwZXJmb3JtYW5jZS4gUEhZIHR1bmluZyBjYWxpYnJhdGVzIAo+
Pj4+IFJYL1RYIGRlbGF5IGxpbmVzCj4+Pj4gdG8gZmluZCBvcHRpbWFsIGRhdGEgY2FwdHVyZSB0
aW1pbmcgd2luZG93cywgZW5hYmxpbmcgb3BlcmF0aW9uIHVwIAo+Pj4+IHRvIHRoZSBjb250cm9s
bGVyJ3MKPj4+PiBtYXhpbXVtIGZyZXF1ZW5jeS4KPj4+Pgo+Pj4+IEJhY2tncm91bmQ6Cj4+Pj4g
SGlnaC1zcGVlZCBTUEkgbWVtb3J5IGNvbnRyb2xsZXJzIHJlcXVpcmUgcHJlY2lzZSB0aW1pbmcg
Y2FsaWJyYXRpb24gCj4+Pj4gZm9yIHJlbGlhYmxlCj4+Pj4gb3BlcmF0aW9uLiBBdCBoaWdoZXIg
ZnJlcXVlbmNpZXMsIGJvYXJkLXRvLWJvYXJkIHZhcmlhdGlvbnMgbWFrZSAKPj4+PiBmaXhlZCB0
aW1pbmcKPj4+PiBwYXJhbWV0ZXJzIGluYWRlcXVhdGUuIFRoZSBDYWRlbmNlIFFTUEkgY29udHJv
bGxlciBpbmNsdWRlcyBhIFBIWSAKPj4+PiBpbnRlcmZhY2Ugd2l0aAo+Pj4+IHByb2dyYW1tYWJs
ZSBkZWxheSBsaW5lcyAoMC0xMjcgdGFwcykgZm9yIFJYIGFuZCBUWCBwYXRocywgYnV0IHRoZXNl
IAo+Pj4+IHJlcXVpcmUKPj4+PiBydW50aW1lIGNhbGlicmF0aW9uIHRvIGZpbmQgdGhlIHZhbGlk
IHRpbWluZyB3aW5kb3cuCj4+Pj4KPj4+PiBBcHByb2FjaDoKPj4+PiBBZGQgU0RSL0REUiBQSFkg
dHVuaW5nIGFsZ29yaXRobXMgZm9yIHRoZSBDYWRlbmNlIGNvbnRyb2xsZXI6Cj4+Pj4KPj4+PiBT
RFIgTW9kZSBUdW5pbmcgKDFEIHNlYXJjaCk6Cj4+Pj4gwqAgLSBTZWFyY2hlcyBmb3IgdHdvIGNv
bnNlY3V0aXZlIHZhbGlkIFJYIGRlbGF5IHdpbmRvd3MKPj4+PiDCoCAtIFNlbGVjdHMgdGhlIGxh
cmdlciB3aW5kb3cgYW5kIHVzZXMgaXRzIG1pZHBvaW50IGZvciBtYXhpbXVtIG1hcmdpbgo+Pj4+
IMKgIC0gVFggZGVsYXkgZml4ZWQgYXQgbWF4aW11bSAoMTI3KSBhcyBpdCdzIGxlc3MgY3JpdGlj
YWwgaW4gU0RSCj4+Pj4KPj4+PiBERFIgTW9kZSBUdW5pbmcgKDJEIHNlYXJjaCk6Cj4+Pj4gwqAg
LSBGaW5kcyBSWCBib3VuZGFyaWVzIChyeGxvdy9yeGhpZ2gpIHVzaW5nIFRYIHdpbmRvdyBzd2Vl
cHMKPj4+PiDCoCAtIEZpbmRzIFRYIGJvdW5kYXJpZXMgKHR4bG93L3R4aGlnaCkgYXQgZml4ZWQg
UlggcG9zaXRpb25zCj4+Pj4gwqAgLSBEZWZpbmVzIHZhbGlkIHJlZ2lvbiBjb3JuZXJzIGFuZCBk
ZXRlY3RzIGdhcHMgdmlhIGJpbmFyeSBzZWFyY2gKPj4+PiDCoCAtIEFwcGxpZXMgdGVtcGVyYXR1
cmUgY29tcGVuc2F0aW9uIGZvciBvcHRpbWFsIHBvaW50IHNlbGVjdGlvbgo+Pj4+IMKgIC0gSGFu
ZGxlcyBzaW5nbGUgb3IgZHVhbCBwYXNzaW5nIHJlZ2lvbnMgd2l0aCBkaWZmZXJlbnQgc3RyYXRl
Z2llcwo+Pj4KPj4+IFRoYW5rIHlvdSBmb3IgdGhpcyBzZXJpZXMuIEkgaGFkIGEgcXVlc3Rpb24g
cmVnYXJkaW5nIHRoZSBWaXJ0dWFsIENvbmNhdAo+Pj4gZHJpdmVyIHBhdGNoIHNlcmllcyBbMV0u
IE5vdyB0aGF0IGl0IGhhcyBiZWVuIG1lcmdlZCBpbnRvIHRoZSBrZXJuZWwgYW5kCj4+PiBlbmFi
bGVzIHN1cHBvcnQgZm9yIG11bHRpcGxlIGZsYXNoIGRldmljZXMgY29ubmVjdGVkIGluIHN0YWNr
ZWQgbW9kZS0gCj4+PiB3aGVyZQo+Pj4gZWFjaCBmbGFzaCBkZXZpY2UgaXMgcHJvYmVkIGFuZCBj
b25maWd1cmVkIGluZGVwZW5kZW50bHktaWYgYm90aCBmbGFzaAo+Pj4gcGFydHMgYXJlIHJlcXVp
cmVkIHRvIG9wZXJhdGUgaW4gRERSIG1vZGUsIGVhY2ggZGV2aWNlIHdvdWxkIG5lZWQgdG8KPj4+
IHBlcmZvcm0gdHVuaW5nIGFuZCBzdG9yZSBpdHMgdHVuaW5nIGRhdGEgc2VwYXJhdGVseS4KPj4+
Cj4+PiBHaXZlbiB0aGlzLCBzaG91bGQgd2UgY29uc2lkZXIgdGhpcyB1c2UgY2FzZSBhbmQgYWRh
cHQgdGhlIHR1bmluZwo+Pj4gYXJjaGl0ZWN0dXJlIHRvIHN1cHBvcnQgaXQ/Cj4+Pgo+Pj4gSSdk
IGFwcHJlY2lhdGUgeW91ciB0aG91Z2h0cyBvbiB0aGlzLgo+Pgo+PiBHb29kIHBvaW50Lgo+Pgo+
PiBUaGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBhbHJlYWR5IHN0b3JlcyB0aGUgY2FsaWJyYXRp
b24gc3RhdGUgcGVyCj4+IGNoaXAgc2VsZWN0IChkZWxheSBsaW5lIHNldHRpbmdzLCB0dW5lZCBm
bGFncywgYW5kIG9wZXJhdGlvbiB0ZW1wbGF0ZXMpLAo+PiBzbyB0aGUgZGF0YSBtb2RlbCBzdXBw
b3J0cyBpbmRlcGVuZGVudCB0dW5pbmcgZm9yIGVhY2ggZGV2aWNlLgo+Pgo+PiBIb3dldmVyLCB0
aGUgcnVudGltZSBwYXRoIHRoYXQgZW5hYmxlcyBQSFkgbW9kZSBkb2VzIG5vdCByZXN0b3JlIHRo
ZQo+PiBwZXItQ1MgZGVsYXkgbGluZSBzZXR0aW5ncyB3aGVuIHN3aXRjaGluZyBiZXR3ZWVuIGNo
aXAgc2VsZWN0cy4gQXMgYQo+PiByZXN1bHQsIGNvbnNlY3V0aXZlIFBIWSBhY2Nlc3NlcyB0byBk
aWZmZXJlbnQgZGV2aWNlcyBjb3VsZCBlbmQgdXAgdXNpbmcKPj4gdGhlIHdyb25nIGRlbGF5IGxp
bmUgc2V0dGluZ3MuCj4+Cj4+IFRoaXMgY2FuIGJlIGFkZHJlc3NlZCB3aXRoIGEgc21hbGwgY2hh
bmdlIGJ5IHJlYWRpbmcgdGhlIGN1cnJlbnRseQo+PiBwcm9ncmFtbWVkIERMTCBhbmQgcmVwcm9n
cmFtbWluZyB0aGUgUEhZIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXJzCj4+IHdoZW5ldmVyIHRoZXkg
ZGlmZmVyIGZyb20gdGhlIGNhbGlicmF0ZWQgdmFsdWVzIGZvciB0aGUgc2VsZWN0ZWQgY2hpcC4K
PiAKPiBBcmUgeW91IGdvaW5nIHRvIGluY2x1ZGUgaXQgdG8geW91ciBzZXJpZXM/CgpZZXMsIEkn
dmUgYWRkZWQgc3VwcG9ydCBmb3IgdGhpcyBpbiB0aGUgdjUgc2VyaWVzLCB3aGljaCBJIGp1c3QK
cG9zdGVkLiBbMF0KClswXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zcGkvMjAyNjA3
MTcxODUxMTYuMjA2NTUwNS0xLXMtazZAdGkuY29tLwoKVGhhbmtzLApTYW50aG9zaC4KCj4gCj4g
VGhhbmtzLAo+IE1pY2hhbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
