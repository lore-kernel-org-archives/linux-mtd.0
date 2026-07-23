Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B98CC531CB
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HW4yu9EA4a+eV0H3VsHUjjZ6FQ+VQP8hRILLwv+jJ0=; b=mKCDioLg+CFr6U
	d6acKDfK1JOGxpOM6A1s0qBAGn6t49/0YFioEiHL+j2peuuf16ovzxkhh1Es83/Hy3EBlLFa8LuZs
	Qavnvht8I670qAIOv+wB3ypYrfjZoD3Yf9kvJfZYzYoBeZPK5zNNmxibRM+PoeEv8/CNYVwIku8+t
	UcaYIhWSQtLrI1tLk+gnNCHPiQqfyRcbzdSuvr+7y7PBh4jCR+U8WyqQNbd4+r+sz9aMIZzv0saf/
	fUS/92Ag8MuFO9eNox/UF2EKz69JwNsbdxTGlVRiEpRcW4REeyJUzHqFFGtSUkqoFatunz69kI1Bg
	rIWm5N1tzPyMb5VbJsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrDN-0000000E6Dj-2XtQ;
	Thu, 23 Jul 2026 11:03:45 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrDJ-0000000E6B9-0dDM
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 11:03:42 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66N9IB1w2039762;
	Thu, 23 Jul 2026 06:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=teGB7+PbNvdPrr/+A55A/D2LxX4bde9Z29W1r+wtn
	fA=; b=V66wGVZEXsnIzMnHz2e/YacWW7d/PfYC7xYCzPfjQbc9Axeq1zgdjwGIA
	HVHa8ECtfPJxxnL8aSkMIicVyZtGI+b0e7+86AttACbzJuh9C4vo5ELU3yUGGsmA
	mgVWYgvRB1i6Lc/EH4SZa7SQErXK8M0mPeKazBIZ79CmNTHiSyK3FdIqIcvNLhL9
	8GQuuJdrqAQsHKls8fce6gE9APthjJejpCVDTOVBcY4fSHlqh/rzV1EFIBFmwAVK
	BNPAhdKCX/zQvALpldKfN9cMTO7zvQlaSZBDRXNsGa4weQMxXgV23ueP2k4ChlVB
	tIC64nMCE0xVXPjlz453OE0SPT3SQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fkg730c67-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 06:03:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GT3v2yGULrhZC4Asue2L/H8h/34Ipi0HAKIBrwX3ISX3Bwk1OJEX4QoS91vjJ3Vr0zXpRArRIs89Ta0aHI1gqHcJH3B5Abi4C2FNPK6+4d4Klic6rePMuPj6Wwfva1Wk6JGgUg3GtZIHbEGBStupHCy3uNhC68AguVzOunUP3GLUc8vHTvs5maDjUiNlJgMqw0IfH7PCrKvDW1HRUSTaBcd1IJ5M95KPmiqn4+o0HaEmHj004PUjPrVLygj/4ep1m3tY4eBZFnPk+LOtm1/k92/gVtnIoOpgV4Wfmx7lS84TxBiKgEqcgEoRGHmmTuyDOaSGW88/T0tV+L+IWXDubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teGB7+PbNvdPrr/+A55A/D2LxX4bde9Z29W1r+wtnfA=;
 b=MjixRk3KEx57Rkjy3z34UyVZO1Jdllki1jz7Ztz4PXwVOEto9ki7zxJEMJ0su7BzVCTmkUGNSIC9avvecNTOwjTTlLkkLSGbjTQQHW2RiSgqLVqGEOAd9oMoYsHMlZwaeQalICaAubiFBXE/JLevpAj3Jyj1Y4isgEaHujNJTlBun8N15RLCUGLgcejvlQqk8EhWzgk5FkY5N3cAsyl08ufQklRTwnVFSkbBzM7YZMK+lLxZLMZK7dlsR1q/CO9TZeWlkQ8bTeuHIpSJ68O181x7f2FQDE5XqB3ywkMEIRGC7OT53cTHmV4322ERnDbGVZyytfwIihIMKbh6SS5EDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teGB7+PbNvdPrr/+A55A/D2LxX4bde9Z29W1r+wtnfA=;
 b=O//rqZ+5PnfL6maTqtuGYFbpr6GLlA514FlJ+n3VY3bbRDppMLlqafB4HAD/VWUh9o6umrv9YK7QkXr6uYR6zrVBM8lBS8eDRaV40J+dGbl7CIohaYIfXSPlDjFIlYF+Fa5pGYtQmMzLLbyyBd3TwvIqqBqjeHyOefkKuIL8qrw=
Received: from SJ0PR03CA0274.namprd03.prod.outlook.com (2603:10b6:a03:39e::9)
 by MW4PR10MB6678.namprd10.prod.outlook.com (2603:10b6:303:22c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 11:03:30 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:39e:cafe::52) by SJ0PR03CA0274.outlook.office365.com
 (2603:10b6:a03:39e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Thu,
 23 Jul 2026 11:03:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Thu, 23 Jul 2026 11:03:28 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 06:03:20 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 06:03:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 06:03:20 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NB2OW51577597;
	Thu, 23 Jul 2026 06:03:15 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v6 09/17] spi: cadence-quadspi: skip DDR PHY tuning for 2-byte-address ops (i2383)
Date: Thu, 23 Jul 2026 16:32:11 +0530
Message-ID: <20260723110219.3180747-10-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723110219.3180747-1-s-k6@ti.com>
References: <20260723110219.3180747-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|MW4PR10MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 09785edc-e485-4207-bee0-08dee8aa06a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|6133799003|13003099007|56012099006|18002099003|22082099003|921020|10067099003;
X-Microsoft-Antispam-Message-Info: bf8C1DT7VQ1B8e0PMVbJ+XYevEdE3Bcl5wuMv1b0Ld5eiQ3jLagfyPw9kW7UJ84N2zMZrtcR2jKdgz+CXore4LeTFeLB0BXjxQbvCnGMMUf3Gs6o3wMPjM4lFQ4+lsqxBDZNSR12MfPpLq9Rrtgzv4zBvVUr4vspzDDH5cW0YG+6b4YpUU1whrez4WrvQN9AnuzHSK8GgNTAkHp/2rkil09CptA7ERCQd+DN00ODtMkQ0a2tRPEVUzODSs1xgzNQFD4jQr6nhRljYPLd9UkdzU12xEFc05jSv8bmCsxYiAI5F5Eku1liFEFH/KpQWJasv1Kv9b4snT0yxHlH6jHzAx3zve97WyOaPf96EFgg2JA6W2MK8lRfcAotphhcG9TGHfNLEjCVQuHzo83NA0WFr2vyVlpDSFbqzoo57InFXI9PW94IGGpfWVWL37mxGYRH7p9gvtDqIPjYRCklsNVhi9XDKCXMFgFkwP2Urh/Rb1oV78UqvXO9+GWCFzMYTFn1XpsfHvrj7ZdtC8bA6vpEqdMh7yOWVrtXBA3Q4URVI9jH0kBkbf4+05g1W8xfOURxajgO4/Rs/OMU/IefO+bcA0BPDDT+BpXDjQFErmAUut/A+JuXl1Dg3I8yIZtATmeBJyPNs77zenijXda2TX9/RgK7EPhBUFQKFtRqR4TFKhKygC8DZlCu2WNidZsR/LPuurK7945aiCTFv8tNKT0K6w==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(6133799003)(13003099007)(56012099006)(18002099003)(22082099003)(921020)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L27yr59aLdFTNzIZ4G5fwscvE1oGGXuhW+Bc27U5XCCJsT38DyY+dUXYdpGPd80R91krn+W9WKiqYITEWx4hSggOxVm0/hBWfp5h87wWNln+CL+TzklGPjZg9fockJHUz9jn/4GBFQwoc0wi099cuIW++sRdIVtQjt/hF4BOj0Q+ozKCISuFso+Uu6+8Oq5/LsbIrV6BjEPxWUKcn1nsdejScQd5C1Cycsu0hgNn9rez7UtOdizbo/R7/Iyy89hRENmyqMaCIDgLOElUk1+BqwMEkgMXdDEm+Qr0EPgkjPyCAk5g6oWrEiLTdc3FRa9V67HTkKm21SVRbap0yba3dD+k30JNTfQI4OB5owJ5a/SNhZlC+A0ce0VSZZGLl91qNGefbhNeBbzFjUYlaDvzBzLu966pMmPmQn2BLwr6TL/sdAPot03Rwslf8cZrw3kU
X-Exchange-RoutingPolicyChecked: o6b8zM96Rx+R6lMKynBukXAt6ZJ4EUmupBySzuTWiWZImCzawW7jMC9erIZgfeOPC32HV6fJScsK7/BaZZZV7xKmkwnAB/mgZTSq8NyKE2aC+ESOYAG71uejOz5B013LDidPy+ir/uFlvlOfsu4gSMhiUCBQvDR91dHrMURPhZAx6r+pJ5GRSzzIxaf/C3SIAtuvWvDNpc8vH/3KXv82n62GnsMTp6O6TxMxZ/cO7yqU+7Zh1JXtoLLyQIAQHUojl4Xtik8beSgRw/AVOYFDPDLL7ZXhoUIUDgSNVZ2qY26socRjgpeScF4ZbTqiIy0PJzAcXZxMu77+PmqZWxOACg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 11:03:28.5704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09785edc-e485-4207-bee0-08dee8aa06a8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6678
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX6NvJoxKgXZEL
 AEpAQ1ENe6DxUEXl4ASD16yy6i9gJWrWlHUzB12qG4H2AldwfjBxj6RPqh8VCfddlAMNzc3jDR1
 3D2KHQFRP9Fe17WK0RAHgDn9mR8JJ00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOCBTYWx0ZWRfX8KG7g3XCoLiY
 NtRamrE2JMu0foTEzldS8IXM4o5osSaSpPYPgFkYCJYzhPBeWY9UllijfYc5bNkao11qOu7u29o
 XJIQjKDxbIE/dM9uYgftviGWER0fMa0YkeISRb0JjqvGBPyf8V+Tx7KQjirDUo36kFlR4m0yKrp
 i9l8MMEOkd6iIIOTjWVOP6oZCQn2KZeY16P/sQu2GkVyE6yVudoPiasRPiQKdfahOxwDRGEWF9C
 YQ/sGQSFALfSe7sAjF6HdAtFpAAUjAPIrLuFe6EY2bQSzsUC7QIgDmEvuwYARLQlggB5Zb3mfBc
 pGof85LT26xJjPa+ZH77K8Wkzio55vcaynTRfKfOTsCCgDoMzW1zPysWEks8xZ0pM9Zt0eFxHFU
 VGtCAEx7kOnTmgLd5tHKUAt8KhT1MT4NtoifHXij9uSoqqQ2MWVFCbA+Qa/lOU/3qRdOCMgnPb2
 huyS3tr0siMpWUm9kqg==
X-Proofpoint-GUID: 6qG5UXoWv6BUzgG5X5p6lbGlgKTLjKO7
X-Proofpoint-ORIG-GUID: 6qG5UXoWv6BUzgG5X5p6lbGlgKTLjKO7
X-Authority-Analysis: v=2.4 cv=Z/Dc2nRA c=1 sm=1 tr=0 ts=6a61f507 cx=c_pps
 a=BNrqkoHBqsJX0pt4tOnUqg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=T-kh0MV4vbdY-aS4Zb4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_040341_194710_B26BB47B 
X-CRM114-Status: GOOD (  14.52  )
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

RXJyYXR1bSBpMjM4MyBvbiBBTTY1NCBsb2NrcyB0aGUgYWRkcmVzcyBwaGFzZSBpbiBQSFkgRERS
IG1vZGUgd2hlbiBhCjItYnl0ZSBjb2x1bW4gYWRkcmVzcyBpcyB1c2VkLiBERFIgUEhZIHR1bmlu
ZyBtdXN0IG5vdCBiZSBhdHRlbXB0ZWQgZm9yCnN1Y2ggb3BlcmF0aW9uczsgbm9uLVBIWSBERFIg
dXNhZ2UgaXMgdW5hZmZlY3RlZC4gWzBdCgpBZGQgQ1FTUElfTk9fUEhZX1RVTklOR19XSVRIX09E
RFJfMkJfQUREUiBxdWlyayBhbmQgY2hlY2sgaXQgaW4KY3FzcGlfYW02NTRfb3NwaV9leGVjdXRl
X3R1bmluZygpLiBXaGVuIHRoZSBlcnJhdHVtIGFwcGxpZXMsIHJldHVybiAwCndpdGggcmVhZF9v
cC0+bWF4X2ZyZXEgY2xlYXJlZCDigJQgdGhlIG9wLXNraXAgc2lnbmFsIHRoYXQgdGVsbHMgdGhl
CmNhbGxlciB0byB0cnkgYW5vdGhlciBvcCB2YXJpYW50LgoKWzBdIGh0dHBzOi8vd3d3LnRpLmNv
bS9saXQvZXIvc3ByejU0NGMvc3ByejU0NGMucGRmCgpTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBL
dW1hciBLIDxzLWs2QHRpLmNvbT4KLS0tCiBkcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3Bp
LmMgfCA0MyArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MjkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
cGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNw
aS5jCmluZGV4IDIyYTVjODhiYmQ4ZC4uNTA3MGZmYzUzZDVlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2Ut
cXVhZHNwaS5jCkBAIC0zNywxOSArMzcsMjAgQEAKIHN0YXRpY19hc3NlcnQoQ1FTUElfTUFYX0NI
SVBTRUxFQ1QgPD0gU1BJX0RFVklDRV9DU19DTlRfTUFYKTsKIAogLyogUXVpcmtzICovCi0jZGVm
aW5lIENRU1BJX05FRURTX1dSX0RFTEFZCQlCSVQoMCkKLSNkZWZpbmUgQ1FTUElfRElTQUJMRV9E
QUNfTU9ERQkJQklUKDEpCi0jZGVmaW5lIENRU1BJX1NVUFBPUlRfRVhURVJOQUxfRE1BCUJJVCgy
KQotI2RlZmluZSBDUVNQSV9OT19TVVBQT1JUX1dSX0NPTVBMRVRJT04JQklUKDMpCi0jZGVmaW5l
IENRU1BJX1NMT1dfU1JBTQkJCUJJVCg0KQotI2RlZmluZSBDUVNQSV9ORUVEU19BUEJfQUhCX0hB
WkFSRF9XQVIJQklUKDUpCi0jZGVmaW5lIENRU1BJX1JEX05PX0lSUQkJCUJJVCg2KQotI2RlZmlu
ZSBDUVNQSV9ETUFfU0VUX01BU0sJCUJJVCg3KQotI2RlZmluZSBDUVNQSV9TVVBQT1JUX0RFVklD
RV9SRVNFVAlCSVQoOCkKLSNkZWZpbmUgQ1FTUElfRElTQUJMRV9TVElHX01PREUJCUJJVCg5KQot
I2RlZmluZSBDUVNQSV9ESVNBQkxFX1JVTlRJTUVfUE0JQklUKDEwKQotI2RlZmluZSBDUVNQSV9O
T19JTkRJUkVDVF9NT0RFCQlCSVQoMTEpCi0jZGVmaW5lIENRU1BJX0hBU19XUl9QUk9URUNUCQlC
SVQoMTIpCisjZGVmaW5lIENRU1BJX05FRURTX1dSX0RFTEFZCQkJQklUKDApCisjZGVmaW5lIENR
U1BJX0RJU0FCTEVfREFDX01PREUJCQlCSVQoMSkKKyNkZWZpbmUgQ1FTUElfU1VQUE9SVF9FWFRF
Uk5BTF9ETUEJCUJJVCgyKQorI2RlZmluZSBDUVNQSV9OT19TVVBQT1JUX1dSX0NPTVBMRVRJT04J
CUJJVCgzKQorI2RlZmluZSBDUVNQSV9TTE9XX1NSQU0JCQkJQklUKDQpCisjZGVmaW5lIENRU1BJ
X05FRURTX0FQQl9BSEJfSEFaQVJEX1dBUgkJQklUKDUpCisjZGVmaW5lIENRU1BJX1JEX05PX0lS
UQkJCQlCSVQoNikKKyNkZWZpbmUgQ1FTUElfRE1BX1NFVF9NQVNLCQkJQklUKDcpCisjZGVmaW5l
IENRU1BJX1NVUFBPUlRfREVWSUNFX1JFU0VUCQlCSVQoOCkKKyNkZWZpbmUgQ1FTUElfRElTQUJM
RV9TVElHX01PREUJCQlCSVQoOSkKKyNkZWZpbmUgQ1FTUElfRElTQUJMRV9SVU5USU1FX1BNCQlC
SVQoMTApCisjZGVmaW5lIENRU1BJX05PX0lORElSRUNUX01PREUJCQlCSVQoMTEpCisjZGVmaW5l
IENRU1BJX0hBU19XUl9QUk9URUNUCQkJQklUKDEyKQorI2RlZmluZSBDUVNQSV9OT19QSFlfVFVO
SU5HX1dJVEhfT0REUl8yQl9BRERSCUJJVCgxMykKIAogLyogQ2FwYWJpbGl0aWVzICovCiAjZGVm
aW5lIENRU1BJX1NVUFBPUlRTX09DVEFMCQlCSVQoMCkKQEAgLTMxODMsNiArMzE4NCwyMCBAQCBz
dGF0aWMgaW50IGNxc3BpX2FtNjU0X29zcGlfZXhlY3V0ZV90dW5pbmcoc3RydWN0IHNwaV9tZW0g
Km1lbSwKIAkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCX0KIAorCS8qCisJICogRXJyYXR1bSBpMjM4
MzogaW4gUEhZIEREUiBtb2RlLCBhIDItYnl0ZSBjb2x1bW4gYWRkcmVzcyBsb2NrcyB1cAorCSAq
IHRoZSBhZGRyZXNzIHBoYXNlLiBTa2lwIEREUiBQSFkgdHVuaW5nIGZvciBzdWNoIG9wZXJhdGlv
bnMuCisJICovCisJaWYgKChjcXNwaS0+ZGRhdGEtPnF1aXJrcyAmIENRU1BJX05PX1BIWV9UVU5J
TkdfV0lUSF9PRERSXzJCX0FERFIpICYmCisJICAgIHJlYWRfb3AtPmFkZHIubmJ5dGVzID09IDIg
JiYKKwkgICAgKHJlYWRfb3AtPmNtZC5kdHIgfHwgcmVhZF9vcC0+YWRkci5kdHIgfHwgcmVhZF9v
cC0+ZHVtbXkuZHRyIHx8CisJICAgICByZWFkX29wLT5kYXRhLmR0cikpIHsKKwkJZGV2X2RiZyhk
ZXYsCisJCQkiaTIzODM6IHNraXBwaW5nIEREUiBQSFkgdHVuaW5nICgyLWJ5dGUgYWRkcmVzcylc
biIpOworCQlyZWFkX29wLT5tYXhfZnJlcSA9IDA7CisJCXJldHVybiAwOworCX0KKwogCWlmICh3
cml0ZV9vcCkgewogCQkvKgogCQkgKiBGb3IgTkFORDogd3JpdGUgdGhlIGNhbGlicmF0aW9uIHBh
dHRlcm4gdG8gdGhlIHBhZ2UgY2FjaGUuCkBAIC0zODI5LDcgKzM4NDQsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGNxc3BpX2RyaXZlcl9wbGF0ZGF0YSBrMmdfcXNwaSA9IHsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBjcXNwaV9kcml2ZXJfcGxhdGRhdGEgYW02NTRfb3NwaSA9IHsKIAkuaHdjYXBz
X21hc2sgPSBDUVNQSV9TVVBQT1JUU19PQ1RBTCB8IENRU1BJX1NVUFBPUlRTX1FVQUQsCi0JLnF1
aXJrcyA9IENRU1BJX05FRURTX1dSX0RFTEFZLAorCS5xdWlya3MgPSBDUVNQSV9ORUVEU19XUl9E
RUxBWSB8IENRU1BJX05PX1BIWV9UVU5JTkdfV0lUSF9PRERSXzJCX0FERFIsCiAJLmV4ZWN1dGVf
dHVuaW5nID0gY3FzcGlfYW02NTRfb3NwaV9leGVjdXRlX3R1bmluZywKIH07CiAKLS0gCjIuMzQu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
