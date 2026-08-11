Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762DBC5B56A
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WeGriE1/St6YJqki9CZ1A45iXiVyq+BZikFxyEzLKQ=; b=pJ2MYV+0QJzmhf
	akrR/s3DUq0RYX6Fwj0iIwdrdB7HsQSrcFycakITro0kaDVs+Ly9E7J+qRo2iTRWU+1o7ps7SBh3e
	JE3YFQKZifFi9mu5qy8NPjetoVE48FP1AWGX53B4RO9B2Xy17VPFDM3NIkd4+2sSbbUwHvxiapS5G
	4wz5OxQZrdRolTD3p5WlrSjlj0uLxvdQpRTN0k6WiNx3mLimfmwwXsX7BmCvsoSSKMofj4Co2R8/X
	H23eW9XFHy/F91vMYoAak+Ji07L8rOj/3hjV76fdJemSMqTxench8Ww0hVFwOjYtvQ//pdee8RX40
	V/v6N5RpNEYwkFfZVtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrJ9-0000000EmAl-3xWw;
	Tue, 11 Aug 2026 18:34:39 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrJ4-0000000Em8T-3dU3
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 18:34:38 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGMcJa2174910;
	Tue, 11 Aug 2026 13:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=L3r4+4BDkKDSVXfOUwFU3FkZBjUujBJu7lCtNDJ0T
	so=; b=ZHYCwqkxmPg0ox+1UNP3WMaWkSFQWfJcm5v61NdaRaTjoUvv+GXVWS9O/
	6iVyNhUP4YmUS01anX278s/Mia10N44r1Tq8AYPbKzkewW4VpvB5ocJRsLDq7to3
	R5AG744S88E/OQL/Tccwc7gQ3Gle6RCn5QLRxVZmGhqjpIxYKIVEayGsG/2r9UqK
	1HbZF7l0FvNMgPQsjkZB9feiDGilyd6F9g6kaZNLZT1WKrnbDTe+k14h1OqazLLG
	05F2Zo8LyBM2qgCKpAzUgf+B42ffC5cKAetmkWwi7H/Mbxt1sUt166EnviZ/6pnL
	eF6fInNhyMaxhDEHmCfM7ia8YT0fQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012047.outbound.protection.outlook.com [52.101.48.47])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g00w4uj2e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 13:34:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPnxhxBEXdBMVCG1z8ZeiiJNbnPmmuhFbgZ2lqAYdt2AyOn7I0Xi6mzgO+h4bCkcgcusViZsSW+7jeFt5fOlFqYMwk9VY4e1ptaAqnv4ovnXAwlSjugZwaVjKVA+EOCKMZ8zaWqOHSaNlOuV9J3VQbxdw+1rbP1VTKJ+1HBfBVYTAVD/ixrWFG/gZE9sOHZ0bFR3RuRNEIuVOdCeGsj+jhvPlfBu+ZMbcfLwPorAooXFygl7boZGcJMRaxuWAf/CDFrRJ5c+XBB1gKTaCa5FvfTGK/LU4+ttAo+eDvtTIETCt/KcOTe3rsOqkD5x8Twsm+ATZn3DBFLTbjpN/dKc0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3r4+4BDkKDSVXfOUwFU3FkZBjUujBJu7lCtNDJ0Tso=;
 b=Gug/MOXmc6MPid/ye3KAxpFqdH43FNFYbrs1hk3YAiKvEIX6EKxlxO7cfrS7yFvK0OhCmFkOEquPQn1MYc+lrh4LMwtGgpNrTvvQQzQA2d+Oaur7v4FLVQoUoET4FJ/xp3m3pQD0R0kzPI6I4CkSAcVoYJUAg8Fv1JwDvklIODdWWoYgYoh7aL/oAHD31+9B3VQxXDi74fzFqXwnzZIWIbecD4swAg7m51LdXsLu08MhWcNWKlbUYsnV/1Xim02OY49SQPBlE9CpiXMDDpD7v2Mel8l3XKshRY86NfwGsivem5INvBio2WIxWU0b3aLWgLwNBxSMmrfOTcWEyI9rlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3r4+4BDkKDSVXfOUwFU3FkZBjUujBJu7lCtNDJ0Tso=;
 b=lqL8+3N3SB2LRvICWGg88QIVSFX2ovJ8aquUiTZeqbAm8cISA5JOFPlmUmmCfYhx3QOam2ukXvfTEwn8/bNCLKaVA775IQV7yX0jKHyTjGm9Y8cg1oXFUC2qq/mQt47KJCk2LPaRfz9BQrRnDSlvuy/uYhKm5tOLvi0mrew7Pm4=
Received: from BY3PR10CA0018.namprd10.prod.outlook.com (2603:10b6:a03:255::23)
 by CY5PR10MB6012.namprd10.prod.outlook.com (2603:10b6:930:27::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 18:34:25 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::28) by BY3PR10CA0018.outlook.office365.com
 (2603:10b6:a03:255::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 18:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 18:34:24 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 13:34:08 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 13:34:08 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 13:34:08 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BIXIe1659766;
	Tue, 11 Aug 2026 13:34:03 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v7 09/18] spi: cadence-quadspi: skip DDR PHY tuning for 2-byte-address ops (i2383)
Date: Wed, 12 Aug 2026 00:03:04 +0530
Message-ID: <20260811183313.1550425-10-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811183313.1550425-1-s-k6@ti.com>
References: <20260811183313.1550425-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|CY5PR10MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ec79d20-38c5-459c-9298-08def7d72b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|7416014|23010399003|1800799024|82310400026|13003099007|921020|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qhzlf51Y7Q8ukeGO9UoyZr19lV8koIFMFM//BMnofXzoE5dGR42v+j5j2BzyLVtggMYZeX9QsHy0h7JVZUutk8vGs+9pKOfYnEQGNrDyj9K0jgqgrJhlaGMRd9XdmtdyPYx2uMWKc+9BwfLgD/fAqTKImYgmhS/6IWm26+wJ+j4LPtYmogHETYQTxVxsaUhQ4n/vu7OrzWD9xi4NF9WCGQU7ytrEKMFShx20AsRgPKp44WY9LwynKbBxwEEPtabQAE4FK1HRHyQvcwq7ocvNufyKbyguBbQq9xWV/FhxeSxEYtsDsU8/aFoKLiA3vGwZpLyIVmwq2vofHvn2C+xTr/KfiAIblcG55uju36Hexq8W88dki+8AJZgXwMMyok8BW0DLixAibe7UxKcEH99wX8AauuZuuyT5t+k0cDdLeT20ikdt3nkgcynViH3Mkw7IPmCYRZUKN56yd00A47IU+ODHNr58TK+0q/qHmLIc2muqUcm9ukenwl42qXBWl5qfcCFvHjHLSqWprRt9M4ywH6ll/SKhdISItRDOEfp9RqmL/LL5WOhutRXEy94VJpLdheAd4RtRc8xbBz8d8eGOkemmCv//Jd9DtcgYvQtsUrq0NhpFNygXximJrWA3AG2iiWyrWx+Ro38oxRWUBg0ZVKkiyma4bs3s4Q5i4BWJb6Z0LStRk2IOUPEvWTx4tiKKHvwmUDdWlRlvo3RVHQYBuJMGQUX5iLJ8xoX40CNudyTopNbtLZLcbZwLf9seOxXL
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(23010399003)(1800799024)(82310400026)(13003099007)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f1u5PF+c8eFAetgK/HMvmeAJ20rOOgobX1GNH/PEZuyNbMmY98MSu8UDmgbQnI+iaaCYVMsbtJV7El6VAygzhhLwWbqSAVvkauYCMna/Y5skE7pJqs5TT/cqyLbDjKp2XUOjUEK+oMPllroa3wckkBtZ92dk9RYkxl5t20PgqjZ1b/Q1aKEyw2GxbLSBLlSGoE5YAzAgmkD1Hb3Tqq1yWRHQqI1DmumgHiiaGgRy0Bek8GGs/uzNM8/aouIwaHwqTcmeQz2D1OpOrrRJm1HKMcIRgXgawvxfJ8qgbuZcCFzhETZfCGi/u7kwUE6/OXXgzCgZuQqVLWm6mEnDvtFhsI5r9K4nlg/aqcubLGbrmUDmNe3jcRiQ2d/oXk7p+1MR+ed87s6k7Th33G5CunMvAM21VNBO5Ji2qP1KGGHbhaYPZq8arIeZek8kDbKuLIrt
X-Exchange-RoutingPolicyChecked: kKWJiQUx/l5Ld+4QpuQiaILBt4dL677Ll2a7icrNgaKM39kDfByINi0dbWVdKCQmkSq/++gNB8kO8tOpjlyK2xiEjrHqGeZqUVeYpjh9JsIduqXVcXlvwLvXLUbK5qKmzngq6khHlMrzhbiBJqHcPLsovwykJtJ5TxB5uT8mgWL3S3sn2Z879bPKLoWBN5A5plvFVwHrCWSJEzHlzYDo60oTHC82fMwjKOuILQ9oxxbkO4hura8L48yGRA0SkxeNsxcElvUHUjx35YWZMDUQutf4SGBXboUkHzoZSHbq6ZE7/0qo9nwYkYtEz1piy7Qmkt3UvdVnQLuqQlfLykA4nw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 18:34:24.5821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec79d20-38c5-459c-9298-08def7d72b26
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6012
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NiBTYWx0ZWRfXyR48vf/J1E2s
 PEetTeI3Y+K9hHC2GSd8XhAZCAOE6ajpIXwsxRkRryRfiPaUq/9E+n4fn4mv7u5dPXuzZMt2Y4b
 YXt07VEhvPMMU/hQ30u3V9TZVM4bMi14zsATm4aN+rGOAUCkBv7m9Sa6/lIDiJ2Gf5/0tfv+lX7
 qGQRniNmFYxBXmwBIFvhqacxAXJzmcHkxrUbgKfk7QLVOzyOFWLgsi8z9wdZ1437ueTQ8LZT7wr
 Th71ka5ERY/CekjJQnc0zlbLClxI/4MtvNYjp1Oh5bvLEcHRTVxWnm/MsMn3JdwcgiaOgUgWhOn
 SgwiIg2ZR7kX2GXeQs5eAWdR3pBwvxhf9Dao6zrD8DXQLHp/4Zf8jreeXVmkC6zFinauOMra9+X
 lOhARPlMfsk58Yza/OYuAXUr9MoJachd+Pc8XEEGGxf/6DvbUr5QxDTnbEnJLCSkWOJtnc1pCvR
 rL/Jf7QPY39ww43hVcQ==
X-Proofpoint-ORIG-GUID: q_px9SPIjT6WV43-rzl_K23qy8wat3wW
X-Authority-Analysis: v=2.4 cv=KZ/idwYD c=1 sm=1 tr=0 ts=6a7b6b35 cx=c_pps
 a=nAh4yJc8K/mwxcjpRfPwJQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=T-kh0MV4vbdY-aS4Zb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: q_px9SPIjT6WV43-rzl_K23qy8wat3wW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NiBTYWx0ZWRfX+g6/uts+Oyze
 wGFfqyZS0m8mCuuKFce1vIfLGtwxUj6655ntQSA2PQBTChEnSiBn9gfhdKL18UGTlP4CVllkCOW
 G7LfmmQJSaACS17szPVGJrRWgot087I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_113435_021975_0AE8AD1B 
X-CRM114-Status: GOOD (  14.63  )
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
aS5jCmluZGV4IDU2NTEzMjA0MjZiMS4uYTFhYWJhN2MxYTdlIDEwMDY0NAotLS0gYS9kcml2ZXJz
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
aW5lIENRU1BJX1NVUFBPUlRTX09DVEFMCQlCSVQoMCkKQEAgLTMyMTEsNiArMzIxMiwyMCBAQCBz
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
dHRlcm4gdG8gdGhlIHBhZ2UgY2FjaGUuCkBAIC0zODQ5LDcgKzM4NjQsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGNxc3BpX2RyaXZlcl9wbGF0ZGF0YSBrMmdfcXNwaSA9IHsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBjcXNwaV9kcml2ZXJfcGxhdGRhdGEgYW02NTRfb3NwaSA9IHsKIAkuaHdjYXBz
X21hc2sgPSBDUVNQSV9TVVBQT1JUU19PQ1RBTCB8IENRU1BJX1NVUFBPUlRTX1FVQUQsCi0JLnF1
aXJrcyA9IENRU1BJX05FRURTX1dSX0RFTEFZLAorCS5xdWlya3MgPSBDUVNQSV9ORUVEU19XUl9E
RUxBWSB8IENRU1BJX05PX1BIWV9UVU5JTkdfV0lUSF9PRERSXzJCX0FERFIsCiAJLmV4ZWN1dGVf
dHVuaW5nID0gY3FzcGlfYW02NTRfb3NwaV9leGVjdXRlX3R1bmluZywKIH07CiAKLS0gCjIuMzQu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
