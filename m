Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D088C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 18:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdXIAYrDfzD4Zof5LWbXQTd5Cl0DI6LAI586cH94CrE=; b=SmXfZ5b3MLMk2Z
	29zVStUtS1QU9H9CHRQ78QI6nUPap2oiYbJWwWnNd7F5PhJ82lE9DvPIBueVcx1a4KoyFOi1/fZv2
	sVPFhmTiwqzuSI3lJFNBkD4ljLqdt8nTEwE/01AAg604J8rxuogvjX60fpLE0ETXUdHxNFSdf8qtu
	usHOkjaqdf+KxP1kVxav5wffetUlELSclpYHQcSYkR1vEpE1zq7qTSFIOUgLRmcNAsEk94gpmNc0d
	qsfG3C4t76uHnx6Vvi36+nnGZG7/hk4uyra/clFtjhnhaQvOXVQ6fWo2QDDSU1y3U9w+hOwcDlaPl
	9ObRiA6wwqnR9skvTONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknfR-000000033Tu-34B7;
	Fri, 17 Jul 2026 18:52:13 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknfO-000000033Ro-26M6
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 18:52:11 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66HIlGZn1569979;
	Fri, 17 Jul 2026 13:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=dF/dA9rfFrlBBCask2DwOPti+dzd1RR7KKfCA52tD
	cI=; b=QeoXw4FHvyNqYXwdVlbWJq2QDP2fxRRpf+by/Re54v0qjDCMBQjuBgoz6
	PhkYx9ruIScShboHkVRcsGvUSN+htfba5eJ5Z+aOwMuBJE6ae5ujJ0XxWu97vBzS
	LHCLZaGUW1iPyI5jSmRd7MamhqskYbiWvTvTFcpacsuMoYwMh8qr2wqXVlm6Wocu
	zVV2ZQjPPvIbNmUzXyawNqnWthf0p8PYCqgahnTSTBPWmC+0WVGdxWCnxg+3Y67x
	kZjbC2POqHMtVD4Ohqc2zySWpL5Wl2FMoMJgKI6WgwTcnu9H529j7U6/6HVEOUMR
	wz3S0uBuyRF34QJnTtbFkFK/staSQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012034.outbound.protection.outlook.com [40.107.200.34])
	by m0384305.ppops.net (PPS) with ESMTPS id 4ffgsmbgqc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 13:52:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyz0tV1AfHv/p1ARs9+XiAHRVaWFBhMxv6ff+fXZPgs73dpIbcA6OpsVvIPyI0ny4+3ESa5PXGLOjh/1ke5jbpjXyn4YTo0dnFtIeDSo7ahZvZ863Xm8Wykq3XfQcIoF7d2NCR3coZnlcqzry1udOEfO/UJO5gcYT0sbZE3ChbfEh9zQmDzSktobHvP0ue9UZgSPffmYhzKQjh87Acvbjt85+bX5h5LqSRnJE0BPOMsE77Xc+UZWXnp6fW5j8dy0hzjEAXJO2kD5iK6Xw1RV3weQ6nZFiUkg1crKi1y28AJ3Qtnzv12f4sqVattNT/g3bn0okRZ8dw8ozzGkziM9wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dF/dA9rfFrlBBCask2DwOPti+dzd1RR7KKfCA52tDcI=;
 b=ULAdpTvSg1xJdBtifwgQwpt3k3TwZgBcdAqFcla50zNLnUSc8aYdtgFryIEzbEmCeO9nyCxfd/IXYyVP/paJ+QMX2nbcPUjyJVabdlDTzcUlCO1eWoVonP7bNqqAhDSyC5etNC43p9gOQzjHszuxlWxhyejrqvdlmkMq9C8q7A6GUYs3WWnpDbT5Z/dRKqH0a4MSc0f3JSfj5EqdIguPI+M319ZpCxrMdq0EgZzpp8CTWdtz/16gnVzLpb+ItE5/pb8p5TWxV9qUuFl/s+lzuDS9BRysi/77kHpcxzT4x390b3Y4OZpRsNIqCxj+/APRMhVerHAq820g2rP65JNNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dF/dA9rfFrlBBCask2DwOPti+dzd1RR7KKfCA52tDcI=;
 b=GSYBF14rS/IRvzD561rZlwZPM+sCXa3AYm+I23AEYBvjK0yqLuQoA3atFlrf7J1sAYdPwqveiSqtOYIcVkB26nLD/JoG9ORrVYTlwDLJcMkjpnjE1ZsR/EiNbW+a328SGZ+uECA/LZLFH3OAtYdcoK8roCtQSYHuMq2N5ZShCCI=
Received: from MN2PR20CA0045.namprd20.prod.outlook.com (2603:10b6:208:235::14)
 by CH0PR10MB4892.namprd10.prod.outlook.com (2603:10b6:610:dd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 18:51:57 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:235:cafe::6b) by MN2PR20CA0045.outlook.office365.com
 (2603:10b6:208:235::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 18:51:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 18:51:56 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 13:51:55 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 13:51:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 13:51:55 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HIpU4o240969;
	Fri, 17 Jul 2026 13:51:51 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v5 04/17] spi: spi-mem: teach spi_mem_adjust_op_freq() about post-config ops
Date: Sat, 18 Jul 2026 00:21:03 +0530
Message-ID: <20260717185116.2065505-5-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717185116.2065505-1-s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|CH0PR10MB4892:EE_
X-MS-Office365-Filtering-Correlation-Id: 43110039-c692-47fe-39bd-08dee43479f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|376014|23010399003|1800799024|36860700016|921020|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: upnMmJgiHp8FjICL2qBtP40r6W9P1QerYmPZz2WdyjgeWdFciYrBM/1eiTJrn/0Ye3nGGQbdrPvMtTlGU67RyEij4XckA/NZrmlXAX1EswIuEZvtFID76snV1hlAT26oIECX4vhtRw+pu1OrgRjCTtwM68rZTQPOs/Im4f2BsT1dTMbRnHErfXisFNuhVeWds270gxdI3Gr3P/16G0w00GXldgORllnvc9OsvdEAfKxJnE964iw0ZILhqWDI1JXavvRGqgZisXFxaORQgNh6H45tr0y5ZqAX7+dK98sbsxS8J0JKS9Lj89lDqN4Os9OW5GbEYrsSWy4a51rI6fxyYjhlK8ISbx8+qWi+Fu5mN6IHQvkG/dKgu3cYWa1tEcHr6M8u+SYpcSfpXcv5BDCq00VtYtRaUF6d83/H0fzQUoLPrwnV5GI/Vz6rMZERC1YrTsH/At5MfnyfzdCOZ37Uq3jmP5wm4PFiajY+OIO5uqiKohDL3uJheT1Bs2Qrpp8gBVT/bxZQV5WISEjkwCASglC6jHJ3Eq1IJQQ/+6x0BkJRsvrA20QjJ0PlrcxvY9BmYpYsNkFjRtKZuhxt4DD+NuS2QNpkv7jYDR9tj9LgxIZhis9U2o8rrx6S4i6h+oBPZuLcTEARf5WEZQIs0T2PYI0l5XYUgnXqR3W2AAqzrZ+1PUPGiuvJP8b8YfuCU3aiXgd28IEOYxQuOYj3sRTz4/cxZpZKCDHS7OzwVgYSW8ag9itJIaETZW3gMIjdm9Bf
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VxT9k9uP3uV5dmxF8lswUd6ZNlLVJSQoyCbhSjKxsiq2XCsr6pRiliwUBNqsLmbr+jUsUb2K4t6AlVoRH25gw/UwowjMyMvIN+nvmDZR+qALHiTYO7bmaAO3f6GHqJtRzJv0OJj4ARgw47ZoxmvTOADCivkKPXi9rzjedUiBGB8PMBdiO4ObTrgfH7ij21NoYyWUcePDfpJB3acHhohtQSKHLogAlefbXIc1mWdd7EcPInj4YWXT/TkHmRutbwe6orDShZAYnvizkjBfq2ij2iQqAQdCXyZihqGAMjIUPtKkKsof54hSdITduOpHlO9jI9pbFBifn50Dew/6XoPz6UWVhUZmenvjyIrIDqJD5ZVpAAbCNyrDe4hO8EAd31WNjDUavaqnJWWkpUqQrzTWCcoKsrJ5AyB7IDo/3q0xeflz5qQkH2eTfjn9LdAoBuuS
X-Exchange-RoutingPolicyChecked: s0mBQD7fg0ZOwt2T2ZW0srK7naawD2c25aSrvtedWmP6+KvzeiRxB+93/XnU/YsKLsqkVJjqi8YkXWeHoucb4oAq9o47Hc0V1kqQawjlQGI7T9FWVackqYF/jOGf7ymnDWOxNDPND9JLTdvC52R8FE85SdU/UIxzLZ4VUVTwZ9uEYP82QSUGwhGQmIl9OZ+Wmz+oaVAmjgPS2ta6vafexD6rNt+GPT2FJQ2Zux2Ktuq7P86jJSW6r1aLkvRxOlIPsVxvDXzHGwo/xEBBMYrmB95oYuFRq2xRqzDgDn3fryWwSkyeZI/ZEfsIR3MHSajHhx8UITSdoTIjoZm1Wj5adA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 18:51:56.7243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43110039-c692-47fe-39bd-08dee43479f1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4892
X-Proofpoint-GUID: 5NfMnoRoSNC_QgPLmj7nsbPyI38J56ok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE5MiBTYWx0ZWRfX3sgFKfW3k6uz
 s/gH/2FRkodYn2tSmUQjr2oXuNRtbO20DzSLDwfoTDGXTB18Nis/R0xtnLEm+rzXy+8CHJ6d6VV
 fkwDhgVd6xNvKV0ZX75bg9pgolV/yqJANvDWmhoVaRA45lLFarzWCUm0iXBUXi1bKPT391So6J2
 JtgsjyYuwqR7VTkYaYqVrsxUv7fbRkQWpTQ6Auutoy1gF22ZOOT79ziidLZzBRKe+fKVjrZrCbL
 7JrvKztPQfXq5Pdi6gHnPzgBVO8nSpnIjGoGYMysiLR4XNnYlAnB+N8l7APfZ4t67h9vdoRC0Kf
 OfzlxPOiyBTmSgotiKX/YrSbV0FVcFuM6dNTFajJ05QZquNInpcNYloN23YpZ6GvkKKddsv4nMS
 4JoewaOKGbrCU4ix8xG7RoLzR3z/+ZNjqqi8Pv4hAeNGH3bj5kcTk26NZIfVZirkF7ISB0NNkes
 hxReeY39edZQn578rNA==
X-Authority-Analysis: v=2.4 cv=GJ841ONK c=1 sm=1 tr=0 ts=6a5a79d4 cx=c_pps
 a=9AcDkMntNQwiSFi2uhiI7g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=P-IC7800AAAA:8 a=sozttTNsAAAA:8 a=1EK_O1AJX7ox_F5CMUYA:9
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: 5NfMnoRoSNC_QgPLmj7nsbPyI38J56ok
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE5MiBTYWx0ZWRfX+uDxFOsCev2P
 1DeiUyuOXyb15pPCq/oXD61wQ2XI4cs4KOMYxtnkptN1IDzLPOxIQTZjZBbMcR3ACYYAOh2NZJy
 TjIbjDhcIO6Fnu8/kdwLXUuBnJ1bI5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_115210_550241_EF316A49 
X-CRM114-Status: GOOD (  10.10  )
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

Extend spi_mem_adjust_op_freq() with a bypass: if op->max_freq equals
post_config_max_speed_hz (the value written by execute_tuning on
success), return immediately leaving op->max_freq unchanged. All other
ops are capped to max_speed_hz, the always-reachable base rate. This
integrates the policy into the single existing frequency-adjustment
point so exec_op(), supports_op(), and calc_op_duration() all behave
consistently.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/spi/spi-mem.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index a88b9f038356..e20eca1b8245 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -591,9 +591,18 @@ EXPORT_SYMBOL_GPL(spi_mem_adjust_op_size);
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
