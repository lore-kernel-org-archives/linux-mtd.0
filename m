Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BF8C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HW4yu9EA4a+eV0H3VsHUjjZ6FQ+VQP8hRILLwv+jJ0=; b=L1k9ZN6/M/wM/P
	Mmo65xnwXrW3OKCedp5BUHSiR5Chpddntxx0MeJGPe8bRmNLTjaCYmor2PHsKP3EEkzQBz+WsRXow
	FxCo0I4ibZyUW55KszIJoMGlsVMKvkaTVMkaBJieMOMWom/N20xLaeEoHKboKixr2AVswz6PyltkC
	64zRJ5cgBm6g9CDjtGx12mB9rIw3VDYVHGHXjueqCG6TnnpGyEQBNR0/Ro8R+GFEMqKeDgqV3h0Ir
	TkWDJDXGbyilhhNwR01wwjZwmPOTrnSng6U+4crKiFXOBddqnyMZLN/Al69p9EHzyNP6BEpkBzOgt
	9gtUQeth/qLQIzPos21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknfn-000000033lp-2KL2;
	Fri, 17 Jul 2026 18:52:35 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknfk-000000033jB-2kve
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 18:52:34 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HIlFL43222579;
	Fri, 17 Jul 2026 13:52:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=teGB7+PbNvdPrr/+A55A/D2LxX4bde9Z29W1r+wtn
	fA=; b=lG9lLTDJ+gh8Q/q6BsTOS4Lpbmka+2UDqYSetx1Fa8HQarQa1yF3LsYv5
	J0mpKNXHCjE5PtKQc42ftYbKbq97G83C2pruCMqxlGMWoPpYf50nh/8NGD5Mde38
	VE8G7ANWac235PkzbEetCYJc25/bOMgbOEZ2W+8fgq4BApYFmA8u27eDdUB2PEof
	1slHw1FHnr8UXfzEly/FpWGrZ/LtDLQLDz/0fgjSgG1B2cpUXDUCMNNlJau699cg
	jwgucm1mrkxji/f7SDj31Ue9A792aWuBfspdklfRDsk9/BRQ/LObgmukhiJs39S1
	AOjneumSLVXQsbY2ycvhLyKK7srng==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012052.outbound.protection.outlook.com [40.107.200.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ffkc3jtyf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 13:52:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAByhg96umDb0vL66mZ91RZhe3SgiUeAXS53GxmtyRCx5mq9KpMS7eyi1AUdMttGghKngDmFDxsixym3euHZ16zkiWKxqqeCVntcpUVy+4t2T5JJxDHhfadhOe47GDTV8i2O+m1t8SvZH+EAfl52l4qE9MVL5mVsKcvsv0BFYBr6PCxGLqXFr7nMugWak+mPDsifhmXOYb2S4WVrcMCXxU3tJnuzn2miSZSM5MWiynOxyeqkDF9xquF6MeedidpZBGAHyFbmsRotD1hs8CUXENdg2um8cWjS2lz6mXpgZFJBQIF6qdR1VqXWooowjsah8xIoc8PyoLu55kEhyWh/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teGB7+PbNvdPrr/+A55A/D2LxX4bde9Z29W1r+wtnfA=;
 b=nH3EFeUD4z5zv18KqlSdn8Uqs2m3BZ4NFVguMO81M9sJa7+o+OI4xZ4oafd+p1Rooukw1GwoXiNwpAtdV08xfxPaXcJblDWzlFJ1I2Un131C/e2R9Tj38/Q260olGg4AptnY1sgjnsMR//Q/r17jPHLjU6Sn+rQS4+UVEEeDCybu2RRanu0sgrzqqVjkCzF+kiuoIM2dD15NdgcQ94+jTKn4PQpwiW8LEuJ/lurBEjkHZj/GgLw4lf/GfFK0HmGGuWZ5gxV4yCWsopQR70YSzTZsDJKgt9HIzpBu1OyIel2ba16WHIbjHeo/ArUdreoWFxs8YPSON1uWK06b6vlV8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teGB7+PbNvdPrr/+A55A/D2LxX4bde9Z29W1r+wtnfA=;
 b=Kj54N2CLsEIRjLoOeP4i8m1lA5/7y17hgZ6Buo8hnWoqPKxp3UXLEnAhRlrkHUp6AgaJep6EoYSDGLO6AqCjpT5SsXrK+8DJb5I0Lj2nH6rG/JTLNoZvb8BzzpvEVKVaFFLJWJNfL1XGrNIx9nXN6f1w0shVN8I+omTs53oE/No=
Received: from BN9PR03CA0330.namprd03.prod.outlook.com (2603:10b6:408:112::35)
 by PH8PR10MB6455.namprd10.prod.outlook.com (2603:10b6:510:22d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 18:52:21 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:112:cafe::27) by BN9PR03CA0330.outlook.office365.com
 (2603:10b6:408:112::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 18:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 18:52:21 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 13:52:21 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 13:52:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 13:52:20 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HIpU4t240969;
	Fri, 17 Jul 2026 13:52:16 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v5 09/17] spi: cadence-quadspi: skip DDR PHY tuning for 2-byte-address ops (i2383)
Date: Sat, 18 Jul 2026 00:21:08 +0530
Message-ID: <20260717185116.2065505-10-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717185116.2065505-1-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|PH8PR10MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: dfac4114-4652-4b6b-66d5-08dee43488c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|36860700016|82310400026|1800799024|13003099007|921020|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ZLk1L1ET3m4auYIj+yub5j8YEtaKY7F18cmwM0Vz3T/DMmQfwYn875qgonNFeruQYqX2GL7ZR9UVpIRS/SotPE1RmsJy/dWHNrUsXoDwK/dKhL8K2HRfXtDCjMCSQP3/F4a0KFrjn7TX1WSXSTtT2FN5k83kUj7PbHWpH7Xoeqk5ChQWNWJKh554oKSDB2HNTdib6iqe9QjZLGExD2X/1rvMMD0ENfxYOnm8C1vFk+wYmYv1GOZl6te/PUEUPLHHb4ygIUoN2YaQBJW9EjqYWb4uo52ImIAQGHm+v7taXYQhFOB/ymXFTOnHON3ij5vZFEEdjZW9RY+MHScqnURfSXWROeFdH4KdoVixBLYFQT19Kx5X8leP6kivllRfHBK9raacFVoqB6JiRnTdzMKhpK8ZwacoM35JmO8nt0A5ipzfQEcl6eRuRpblh3NdTkbOvtO2EtfdnENapK20NdsiyzjSNGXWwefM/xuJ0KfWBZX+aOXDgOeptdjf71g9iJ6B37vaiS8taupUfItGSsDQLQQcnUboFlH+xFJz8qClcirlE4NeAzHBMPDa7lRRYRn8TvlX6XOi7LVNvjkQ3eALXpDbzROj2QaiQ2nfqUvCrmpkwx/Nl9FwvGt8XYfTUPrG6kuudqQJz5CVvrQ2GnZDY9FE4f2XXUVQwErjzjr6PIOChUJcCz37NVO2PGyyCkaosZe9ranvgCoJqFl8MwQx5w==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(36860700016)(82310400026)(1800799024)(13003099007)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Am9FPjKxF7qIR1ZlLbLyctNIb48xiXO7wjwe8YXIZW6p6OyhMYvuCxNwD4bpp81BaxjkOgPOeOYJCtHwxjXiKqgizj8fWHVF9xrVze1Kb2OSCt4DWjv+Yao3kkj25jImYwjIakmiJ0MDTHOCt6BgmCnG2axzC9CQmUnUE/EspPEtkIhK/A07vJvZqWvAqbnWcJk6JPhGQ3kvFIKRF9rA5UDcezZjUr5LlcB/BtWcpvlg4npT/o30FG4TEXw9vReV62wmix0ukne6tOoHz2hSmH0zwCUw/ZJpw4G+O45LjPZdgKNKyBc16Ru37YbIV6iYjHsY6V8KIMlwUR64HN2jlUwLxswr5Y1qbdjzXOxV0K+javteUEPLnrffuwfQRVuV9cBjTCGozM1x00699jMRRkZTfvVUQAMYeG6ifHzmMszVdaaubKF7l2ja+jM2Nmmx
X-Exchange-RoutingPolicyChecked: ZBGToazEJWggSHW3SW1/4+ff/LNAn4UWbh+gWkiPJ0hCsLR7pGcviC97yhRQJmpCZZdTLzc+V4aHKc0ddOt6OMDLyStjO3MZpeLjmFN7MJEH/3t1EqbKiyvHG+b74gnIzMHdmXbrywqjYEO3MtpaVodsQF9s9tEafhQTGaAHVS9fihbZ6Jn1X9iFQkaOiO0intOJtzRgfiuqMBM+djEFMcaDrqjjMxSnG7i9o8nq1/Jl7dkSuBx4BL1AUaqx+PLHzwW+VY6OiBQcioBW9ZSctUVLUudyrio0H4eewSFJ1J8Aze+2hB/OjmQWvGCHTK7xQXpqTplrQVNXkhwmFQ4pyw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:52:21.6074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfac4114-4652-4b6b-66d5-08dee43488c4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6455
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE5MiBTYWx0ZWRfX36/ziEd56cwx
 T3dwVb+9sEMAnydiozs3slda5wXU+4LyNsu8PZMx/J85TF2A6xXmdnY175arfw+ByfKYzX9mPT5
 lIFOHJprZJKxwD0qdm6L+/Aemro3ENc=
X-Proofpoint-GUID: 0W9haMUlyy55D9itIjnTYde4u3xODX_p
X-Authority-Analysis: v=2.4 cv=M7F97Sws c=1 sm=1 tr=0 ts=6a5a79eb cx=c_pps
 a=57vGMAxBKyli4KBmgVngpg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=T-kh0MV4vbdY-aS4Zb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 0W9haMUlyy55D9itIjnTYde4u3xODX_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE5MiBTYWx0ZWRfXzQOlxUbFRioF
 vRPMwlyfZ8M05finqhm4D9kTYcJWwlw9l/PlHY1s6DH8x27zFk/kv205cnzsYgnKTku9LpvHREI
 B03Ni7u6J2WV34516kRJFWGQA6cEhm29WCv92icLjO7MINpnUX6FaCqFpuBDXY5F8/ZxW1jC4pr
 aJ41WHLpS6lfKtOMTSHSzxgfWz8KQbbnY0N0hYZWUnsyWQh1pSmpwF3UT1/0T73rmG5jT7edbyS
 3WAk5Nk5PgLhCGOyqxxax64KbJwBRYjh4AxjAwZk1Nk/E1p5AJFxHnBlGFKW6vQ2wcLEogqLNs/
 Tm+HzCp8ollSatpyQ6p8W4Tr8IctVlLGe8s+35S9wr+MuLnVh/ISgI6z7ES4Xvpu75bzQWu7S+s
 nuN6ZYCRiPmlnxN74P3Hr6cAV3qYqXLCsPgfpWriQflU8iVeKeb0LwD7UepuZa3yG/iyWLuMWlZ
 REp55iaQDCCw1Biog1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_115232_819370_534202FB 
X-CRM114-Status: GOOD (  13.93  )
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
