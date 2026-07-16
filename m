Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5ACC43458
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 05:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXTxL5KsaQnrCFfcoyHVKVdRMfYP5F9FvALRVCF6j2Y=; b=XLYEKymzAkOXK0
	oe4TDVwP28edCIDwkSXypMUGaFVSm2SZ1LBzy+e2OYhZCo2ZN/lm5U6iDAJG+tnZcztoPbEL+txHc
	r50Z7fbmyMPlzKfug5buVT+1OU/ygLcd2ifTjzIB2n0gq4lUNspriNFB0gtjPfrpYXsXaHg5pL1l6
	vGHt/5CL4L8R+yl3vUYoELQf5IsHu07Om598gh84kag0ccCZeyWMJxi4XsWiOaUlOMUiWbQrkQb2M
	7bhISpTsOqDnJLmmJ1kz0UJ8b+lhHirXo/G3sXDdItEqgoFEylLKYoI/D4G/X/TDVF4B/ZTdP9JQR
	HAMV1s7SWBlOi5J4GDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF2C-0000000GUes-3FX0;
	Thu, 16 Jul 2026 05:53:24 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF28-0000000GUeR-1kqG
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 05:53:22 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66G3tx8U2797675;
	Thu, 16 Jul 2026 00:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8lLRXDFrKPBkXOyRfXJr57/WO+aPI/xF9VEmJAuu9
	0w=; b=EjYzPhk+CJz47U20/+eaxfpWltfhXqaP8CpDCsws5JAdZHYkLs5x0NN9W
	Pncv/nQBFMkC/BauvRn8cneqonqct8+EzTxevSOkixMigpOwGC+yHDNRHUX8d+0B
	YvwFmMISXWvQztF/kP8148GHL0Ex/0cHH66Xf7MfVRCuX43qpERHZIVtcMiKljEP
	qp61EdPcU0c5tq1xn9HmfQINdpGwRTHonkhOkbHThVNg0vchCbpIjecn4RqCuqf9
	bYwuzjDHhWxJoPv6n79SPVZmAOqqYEEUjJutERIRTgzMf64PIDMrgweDC4RqRPtn
	qlkeiozCasXAukqE7nOzrbOqv+FZQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012039.outbound.protection.outlook.com [40.93.195.39])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fe96hntwh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 00:53:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cHhFBuob4uXP8pbfdTebKP3QkK3qCW03w1gBS5hXXdTum3tULLPhnisggRbK88sZ9bnjUli7sQbg+Y0Z0eiC2Md/kcS9hZCixs5wayBxBgAqxWmbs34KL0FK8pWuUju+n9YhNE9dIg6EAKxjAgLBA1+QiDy4nYD7d+1cGStFp5COLURfMqPukwNsNuWpAF9YT2h5k+PzB7rZK/Z94Z/FS48VywNIJ435UUMmb2RA9X6k8LqVraiCvjcYDF/ncCXytL0PTjP1gLmNkW8be8lQAnUGCMKpHN8x1WmDVntBvnKjzLqBHXnOSqcD/f18Ekid0KQJLThLFui3W8xMAwSTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8lLRXDFrKPBkXOyRfXJr57/WO+aPI/xF9VEmJAuu90w=;
 b=RAwtSFLBNl7Alf7BGHk9wCltJHrqSX0SAzy0zXbYskY3Bw+EoX26PZUGO9nj24J3Crt5pFnShnAfAL/Ctmh8uf+jK5tFEl1HPzUF1wb3GAMrIlP4+VpFzpGruHWRjknivJtWnSGagj+X+xN827S9q5vP4fYvILjSyTV5318HSQyzz+MPbt3XViUUPTb04SIbINdc0qesV/JnDHryDTKp+uBmDcL7FsbPIo1H24A9ITdzek3fazXV0xWQpWkzGs9qOXMtSH+ciUYuJ/MPGXRY1aLFrRdzibJBHlxfAEZ7rgNhLZY1uWL4/uOXAoA14SkG0kHJyPQLXU7fBxPR4H6R7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8lLRXDFrKPBkXOyRfXJr57/WO+aPI/xF9VEmJAuu90w=;
 b=VJQVH5r5PNQTDK0CfqWqqdSjcBoTjInJAQV4Hf02Cs6rtN04HjvcJW8bpUIHlJxbhPV/PIBZ9H1rwixeZIQl91yvb44Bhn9RI69uNvv5T9LjL527SIMjtWM1DCE+CKYQVMGF/rasEEVpZjdz4Wsvu13pPVbrhPBhoKxbn6wm9h8=
Received: from BY1P220CA0048.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::6)
 by DS7PR10MB5022.namprd10.prod.outlook.com (2603:10b6:5:3a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 05:53:08 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:59e:cafe::7d) by BY1P220CA0048.outlook.office365.com
 (2603:10b6:a03:59e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 05:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.3 via Frontend Transport; Thu, 16 Jul 2026 05:53:06 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 00:53:06 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 00:53:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 00:53:06 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66G5r0Y8628966;
	Thu, 16 Jul 2026 00:53:01 -0500
Message-ID: <350eb7e6-8845-4dba-a377-2c88792a3937@ti.com>
Date: Thu, 16 Jul 2026 11:22:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/16] spi: dt-bindings: add
 spi-max-post-config-frequency property
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-2-s-k6@ti.com>
 <20260622-private-curly-fennec-7e1ad0@quoll> <87bjcts69t.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87bjcts69t.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|DS7PR10MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f7b2d09-5fc6-4bb9-1e20-08dee2fe8261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|82310400026|36860700016|13003099007|6133799003|4143699003|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: hy/yyCLfQz9gxUByt09n7clfDhjsJF8FJDaT1+U+fZUzCTkUxX46/W8iXUC+NtwknokcIOedOIx/u7KuBnWLoHdtskXPXySfkHH+sPR/RpweJHS/KiTvxQQ/8F/npANtsfH/4K2cu+nGiNy82vkOWFeVe1oEZZK/PbThlTWN5IjYfuDKsw+4+hLe3c97jq1qlSRnLgrJhI8CSPF/uTyT7N3rDUs/fYpigIUY2rF55ZFB7F5RMBkOgiRyLrkvB1v72AZFJzrntogf2014xEwyyF+YhLjX+HtSZqucA3Mp/zIqTdJ26cpSyCKXiRsyEgQ4iODrEtMy6c6TYExm7KOhpahWFt2aLgzvXhxApqiGM+NGbJVUwabqWp4xRb8bic8wuy1PfN04epFyTfIQAGd55YF7wZjF3wDQ4p3hBB1kmPnjIQLZHPa5em6IAUUTo5wxOQCljOwSVE9SLXujvEoDf9eeGHFUZlZ8QzyacHO7VnOlBc9W0+aYYQhaqbSL2F/FndCeYGaFHv1bO1JNqWyAzXiot5vUrtvny6+qRedE8XElaMBqD4Li81AY0s/iEuUpyOvaDavA0L635omxtHErxqlIh30Ymb9Uy3eXFNfrLmkLD0YcfxOgDZbp3uVyFcCsHI8Q2VS6ILOv0KfXL6UXq2SOuaOvF75AgSxA04UppKXeFFDYANiRg6ezv3HOqEa/Zfb4XPc2faZC9dJEIst0rA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(82310400026)(36860700016)(13003099007)(6133799003)(4143699003)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: utcyKP1wUqlbske+XDXLnsoQ0u3JFz+KNocCk6NaObarpchV4YPTyefl+81+l41AVeJyopaT6dCglHazhjXSBZy+HhRsrIGZBP3+glVhlP0LbnMNEJBSvkLch8xG9m3TvhepCGea5DsbN/EngZcoItLgiFXIPI3Hyx+Pp0v1asp9MVOiqzIKvs7glf9824hDSbk6e+RSqlHDY4gA/vMMzZ7PdMz1Sq04mtFcfwIlxy1OiPaK2ycVIurbS5cnuTn5MANz7K+5MZGSJia2jM7aM2vIKtXI4OgDuAz4blqzjoKBDtVIT9WAObAGsb4bqLrAE+NqTaqgciw8nnlWaVP4TI3T7iqySqMYUZFk6piLJI1l3OXAg4vTPsle79mUK31ee3HqBpPUmLhMJVumfGaUXdPnC7VhXX7FhWMypqTv+kUO0hkWTv0dTl2CLSmaP7H/
X-Exchange-RoutingPolicyChecked: BLWmwNCWh2vLsteQUkwDBDTOjyyHC/7KoEkOr1lWD8oMHpcWub+YFcGENLIj24wH7burx+n03TAiee3ZVdu6RKcVxVkmo4kxxaecf7rRfuw9W4eQpOJhzb1wSqbe0q9b8Lh3hGzAm/8p7WFOo72S7jvUkGVInqjEEMjxcMdM4rqRI9WRdIs65E/ixiDEW5CwAfgQ/0HryoP2QOkumkIisQUr0r2zHuAxfz1JEgh15DXFjBmKw54zzo46TxFODKZ2xSV6NqdkfEuQPJRLkqw/Gmsg87sE6VLQgt80i6XfcbQICggp+83iU11Xo0r1XEvCNZ8DcA4bRgGGn6FK8Ib1jg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 05:53:06.8803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f7b2d09-5fc6-4bb9-1e20-08dee2fe8261
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5022
X-Proofpoint-ORIG-GUID: 1TW1t8Erk7NOblg0gOdcExX-Q-7LEs7V
X-Authority-Analysis: v=2.4 cv=Zfwt8MVA c=1 sm=1 tr=0 ts=6a5871c7 cx=c_pps
 a=zwUidnFXtIpczQ2t7519XA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=YG64nluAAAAA:20
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=tMuN0zyhxCScRQQC4vMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bn7x_FpfJtc3yKQXRW3z:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: 1TW1t8Erk7NOblg0gOdcExX-Q-7LEs7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfXyk0gGIOHLuLs
 I7SmJne98Y2AlEKP+0Kh5TVSETVIdLTPVOJ9adSl+UqxfQekthsmrYHhAF9woykT1ydYnJW9nxk
 7JeTUnfJBedisKZD1uRfx0TQ6Zb2FUq8K0pABjdeKkHq1FfgGrhW5cdVinENmzkNGYvyF8nDCZI
 zG3dhLJMhvfSyfvgMlRg0d3HOxkb4FEUxDhRMX1D8FMqP/pMNsnFLl17IdkhrddFuardO4efE2e
 u4AxKBpel79m8/1xQ2Cc9VRlH3/TyjZKBHJrTznUQbTnTiClxXAe+kYQnhV9hr1aKW0qUFlTUqS
 6uTnQ0KW97NKHBu1yHSGXh0ZB86BI7Glv9ca1pVw/y5okwO8rF9mGik85LJ1VH+RUteCMDk9RtA
 ye8B0+1bZMWL+NpXLpgkd5AVljfNu0a+WPcX5nKZJlOh2k+jLZP3plx+vx6lzxTwPOj1QHkPyZ7
 5GaTx2Z8X5xgBqHFnVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX6LXSY5pG2oju
 fu6LvidRkwjYRtxkC0y7MrLbT8yBiwknCquxAo9jYXtOxDu1DuXojaRt8QBmhTlg9LDF17rcmSh
 npNtVejA97edhPB1O471ZEIyNfEs4/I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_225320_571183_B238459E 
X-CRM114-Status: GOOD (  27.49  )
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

SGVsbG8gS3J6eXN6dG9mLCBNaXF1ZWwgYW5kIENvbm9yLAoKQXBvbG9naWVzIGZvciB0aGUgZGVs
YXllZCByZXNwb25zZS4KCk9uIDI5LzA2LzI2IDIxOjExLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
IE9uIDIyLzA2LzIwMjYgYXQgMTE6MTQ6MzIgKzAyLCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnpr
QGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+PiBPbiBUaHUsIEp1biAxOCwgMjAyNiBhdCAwMTowNzox
MFBNICswNTMwLCBTYW50aG9zaCBLdW1hciBLIHdyb3RlOgo+Pj4gQWRkIHNwaS1tYXgtcG9zdC1j
b25maWctZnJlcXVlbmN5LCBhIGdlbmVyaWMgdWludDMyIHByb3BlcnR5IGZvciBTUEkKPj4+IHBl
cmlwaGVyYWxzIHRoYXQgc3VwcG9ydCB0d28gZGlzdGluY3QgY2xvY2sgcmF0ZXM6IGEgY29uc2Vy
dmF0aXZlIHJhdGUKPj4+IGFsd2F5cyByZWFjaGFibGUgd2l0aG91dCBjb250cm9sbGVyIGNvbmZp
Z3VyYXRpb24sIGFuZCBhIGhpZ2hlciByYXRlCj4+PiByZWFjaGFibGUgb25seSBhZnRlciBjb250
cm9sbGVyLXNpZGUgY29uZmlndXJhdGlvbiBzdWNoIGFzIFBIWSB0dW5pbmcuCj4+Pgo+Pj4gV2hl
biBib3RoIHByb3BlcnRpZXMgYXJlIHByZXNlbnQsIHNwaS1tYXgtZnJlcXVlbmN5IGdpdmVzIHRo
ZQo+Pj4gY29uc2VydmF0aXZlIHByZS1jb25maWd1cmF0aW9uIHJhdGUgYW5kIHNwaS1tYXgtcG9z
dC1jb25maWctZnJlcXVlbmN5Cj4+PiBnaXZlcyB0aGUgaGlnaGVyIHBvc3QtY29uZmlndXJhdGlv
biB0YXJnZXQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+Cj4+PiAtLS0KPj4+ICAgLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1wZXJp
cGhlcmFsLXByb3BzLnlhbWwgICAgICAgfCA2ICsrKysrKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbAo+Pj4g
aW5kZXggODgwYTlmNjI0NTY2Li5lY2U4NmY2NTkzMGYgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwK
Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvc3BpLXBlcmlw
aGVyYWwtcHJvcHMueWFtbAo+Pj4gQEAgLTQ1LDYgKzQ1LDEyIEBAIHByb3BlcnRpZXM6Cj4+PiAg
ICAgICBkZXNjcmlwdGlvbjoKPj4+ICAgICAgICAgTWF4aW11bSBTUEkgY2xvY2tpbmcgc3BlZWQg
b2YgdGhlIGRldmljZSBpbiBIei4KPj4+ICAgCj4+PiArICBzcGktbWF4LXBvc3QtY29uZmlnLWZy
ZXF1ZW5jeToKPj4KPj4gLWh6Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9k
dC1zY2hlbWEvYmxvYi9tYWluL2R0c2NoZW1hL3NjaGVtYXMvcHJvcGVydHktdW5pdHMueWFtbAo+
Pgo+PiBhbmQgeW91IG5lZWQgbWF4SXRlbXM6IDEuCj4+Cj4+IE5vdywgcGxlYXNlIHRha2UgdGlt
ZSBhbmQgdGhpbmsgaWYgdGhpcyBzaG91bGQgbm90IGJlIGFuIGFycmF5IGluc3RlYWQKPj4gKG1h
eEl0ZW1zOiAuLi4pIHRvIGNvdmVyIG90aGVyIHBvc3NpYmxlIGNhc2VzLCBlLmcuIGRpZmZlcmVu
dCB0dW5pbmcKPj4gbGV2ZWxzPyBJT1csIGhhdmluZyBzaW5nbGUgc3BpLW1heC1mcmVxdWVuY3kg
dHVybmVkIG91dCB0byBiZQo+PiBpbnN1ZmZpY2llbnQuIFlvdSBhZGRyZXNzIHRoYXQgaW5zdWZm
aWNpZW5jeSB3aXRoIG9uZSBtb3JlIGZyZXF1ZW5jeSwKPj4gYnV0IHdoYXQgaWYgdGhpcyBpcyBn
b2luZyB0byBiZSBpbnN1ZmZpY2llbnQgbmV4dCBtb250aCBhcyB3ZWxsPwo+IAo+IEl0IGlzIGFj
dHVhbGx5IGEgdmVyeSBnb29kIHJlbWFyay4gSSBkbyBub3QgaGF2ZSBleGlzdGluZyBuZWVkcyBp
biBtaW5kCj4gYXQgdGhlIG1vbWV0LCBidXQgdGhhdCBkb2VzIG5vdCBtZWFuIHRoZXJlIGlzIG5v
bmUuCj4gCj4gSW4gU1BJIE5BTkQgd2UgaGF2ZSBwZXItb3BlcmF0aW9uIG1heGltdW0gZnJlcXVl
bmNpZXMgYmVpbmcgZGVmaW5lZCBpbgo+IG1hbnVmYWN0dXJlciBkcml2ZXJzICh5b3UgY2FuIGNo
ZWNrIGRyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYykKPiBiZWNhdXNlIHdoZW4gdGhlIHNw
ZWVkIGluY3JlYXNlcywgdGhlIG51bWJlciBvZiBkdW1teSBjeWNsZXMgc2hhbGwgYmUKPiBhZGFw
dGVkIGFjY29yZGluZ2x5LiBTbyB3ZSBraW5kIG9mIGhhbmRsZSB0aGUgdmFyaW91cyBmcmVxdWVu
Y3kgcG9zc2liaWxpdGllcyBhbHJlYWR5Cj4gKHRoZSBwcm9wZXJ0eSBhZGRlZCBieSBTYW50aG9z
aCBzZXR0aW5nIGFuIGFic29sdXRlIG1heGltdW0gdGhhdCBjYW5ub3QKPiBiZSBjcm9zc2VkKS4K
PiAKPiBIb3dldmVyLCBJIGRvIG5vdCB0aGluayBTUEkgTk9ScyBoYXZlIHNvbWV0aGluZyBzaW1p
bGFyLCBhbmQgYWxzbyBvbmUKPiBkYXkgd2UgbWlnaHQgaGF2ZSBkaWZmZXJlbnQgdHVuaW5nIGxl
dmVscyByZXF1aXJpbmcgZGlmZmVyZW50ICJtYXhpbXVtCj4gZnJlcXVlbmNpZXMiOiB3ZSBjb3Vs
ZCBpbWFnaW5lIGEgZmlyc3QgbW9kZSB3aGVyZSB0dW5pbmcgaXMgdmVyeSBmYXN0IHRvCj4gY29u
ZmlndXJlIGFuZCBzcGVlZCBnYWlucyBnb29kLCBpbiBjb21wZXRpdGlvbiB3aXRoIGFub3RoZXIg
bW9kZSB3aGVyZQo+IHR1bmluZyBtYWtlcyB0cmFuc2ZlcnMgZXh0cmVtZWx5IGZhc3QgYnV0IHdp
dGggYW4gZXh0cmEgY29uZmlndXJhdGlvbgo+IHBlbmFsdHkgKHRoaXMgaXMgcHVyZSBzY2ktZmkg
aW4gbXkgaGVhZCBhdCB0aGUgbW9tZW50KS4KPiAKPiBJdCBpcyBoYXJkIHRvIHRlbGwgd2hldGhl
ciB0aGlzIHdldCBmaW5nZXIgZ3Vlc3Npbmcgd2lsbCByZWFsaXplIGFueQo+IHRpbWUgc29vbi4g
TWF5YmUgdGhlIHNhZmVzdCBhcHByb2FjaCBpcyB0byBnbyBmb3IgYW4gYXJyYXksIHRob3VnaC4g
SW4KPiB0aGF0IGNhc2UsIGNvdWxkIHdlIGFkZCBhIG1hbmRhdG9yeSBuYW1lIHRvIGVhc2UgKGZ1
dHVyZSkgcGFyc2luZz8KPiBUeXBpY2FsbHkgaGVyZSwgd2UgbWlnaHQgd2FudCB0byBjYWxsIGl0
IHBoeS1kZWxheS10dW5pbmcgb3Igc29tZXRoaW5nCj4gbGlrZSB0aGF0IChuYW1lIHRvIGJlIGRp
c2N1c3NlZCwgYmVjYXVzZSB0aGVyZSBpcyB0aGUgcmlzayB0byBtYWtlIHRvCj4gdG9vIGNvbnRy
b2xsZXIgc3BlY2lmaWMpLgoKSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCBpdCBhcyBhIHNjYWxhciBm
b3Igbm93LCB0aG91Z2ggd2UgY2FuIHJldmlzaXQKdGhpcyBpZiBhIHJlYWwgdXNlIGNhc2UgY29t
ZXMgdXAuCgpUaGUgcHJvcGVydHkgcmVwcmVzZW50cyBhIHNpbmdsZSBzdGF0ZS4gVGhlIGRldmlj
ZSBpcyBlaXRoZXIgb3B0aW1pemVkCmFuZCBydW5zIGF0IG9uZSBwb3N0LWNvbmZpZyBmcmVxdWVu
Y3ksIG9yIGl0IGlzIG5vdC4gRXZlbiBpZiB0aGUgdHVuaW5nCnByb2NlZHVyZSB0cmllcyBtdWx0
aXBsZSBvcGVyYXRpb24gdmFyaWFudHMsIGl0IGFsd2F5cyBlbmRzIHVwIHNlbGVjdGluZwphIHNp
bmdsZSBvcGVyYXRpbmcgZnJlcXVlbmN5LiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGFueSBoYXJk
d2FyZSB0b2RheQp0aGF0IG5lZWRzIG1vcmUgdGhhbiBvbmUgdmFsdWUgaGVyZS4KCklmIHN1Y2gg
aGFyZHdhcmUgYXBwZWFycyBpbiBmdXR1cmUsIHdlIGNhbiBleHRlbmQgdGhpcy4gVGhhdCB3b3Vs
ZApsaWtlbHkgYWxzbyByZXF1aXJlIGRyaXZlciBjaGFuZ2VzIHRvIHBhcnNlIG11bHRpcGxlIHZh
bHVlcywgc28gSSB0aGluawp3ZSBjYW4gZGVmZXIgdGhhdCB1bnRpbCB0aGVyZSBpcyBhIGNvbmNy
ZXRlIHJlcXVpcmVtZW50LgoKRm9yIHY1LCBJJ2xsIGFkZCB0aGUgLWh6IHN1ZmZpeCBhbmQgbWF4
SXRlbXM6IDEgYXMgc3VnZ2VzdGVkLgoKVGhhbmtzLApTYW50aG9zaC4KCj4gCj4gVGhhbmtzLAo+
IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
