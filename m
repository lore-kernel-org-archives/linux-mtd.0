Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1768C43458
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 06:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9qczrhd7ku6fQN9uhEr8N46HhgaIf23tNgmmIGCyHI=; b=yuMJ2tGNkoy6KS
	uhjovO/UoYmqIKxA2P5xVrfuBWBLJqjII1jt8PWqfB2ZQ1Ya6YtuymY0grHT4wMTEO8srngHOk8IK
	D329B+NwCAZ+6l7SURZ5EBmvMTYsT6jhmX4DmtrVWPVwg5L1QK+LYJalr6jFdhcTYs8d07j8Lbl1Y
	pog30v5yiMiExaqILo3TVrLe/dS2eUnMcWj7J+Fvq/s89YDnjjX1hI8Wb5UyjiIbNiDgwsqAJ+rbB
	wrs+47dQuZd5xsrKWIaqpN4FWixjADiH7IQINeZOVswNzxLf/MdBQKBO99ceNMm4NJvXCsiPsA3j8
	ANjDEN5Fm/ndHhe4klVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF9P-0000000GVlY-1TLP;
	Thu, 16 Jul 2026 06:00:51 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF9N-0000000GVkx-1NVO
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 06:00:50 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66G3tnd91239354;
	Thu, 16 Jul 2026 01:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8nd4wp64P4iG1wMd8FC3shan6KyqGL0SmjvsTYZz3
	QQ=; b=A/aWbl9ZxXvJOZvp+Cq032iBezr5C6OeIZ/UEmR1SoNZ0/Dy69kVpOzBw
	AzaORICyhOobRRoMIqYOjdWGySYcRoF62VTXdP3ng2ixiNMf1wxTx9GH3cdwtH6E
	NsqugxMAlMivd3jcmJYaJvsQ9c3obB6nE3vk9s+7t8kXmNTqmBvaShU+j5vpkDfk
	LtuTKhaqPwKDBzt8EIo+nilXZJioGe4MASWqcWlfHNQ77x1FbHsV0U2kPTv461d1
	51hY6O3t7pLwxD6Xkbq202lkXtsoZURM68sZDIBB5NdsWCOHn7MeuHz+sZzbMlJ0
	tfIElWMSVOY++0Lz30aqSmh6Z1KAg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010026.outbound.protection.outlook.com [52.101.56.26])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fep5s90gn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 01:00:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=daICn2HzYDeilrTraQRhRukutoT/uHUdISiQbZLXwukpIWjpalppqV5wd3IExHNQKkgafYruIqTh9fkJ7zyVphEIlYV2e64CIfoBoZQn8doogKXEWEBQeyan9GQQLAt0DbEd+2gvswjU4zTy+8IU+yBXIna4tZFQCzNePSo8BqH6Nh3mBjD2IBzPPu1PMSX1YBUddV3Re8iw3Zb6+9aIwPg/8vgEgcljXdW4v/Gn/vt3C9my1h/SNoeb1cfVBRFyNYZ7bmK+VE4lTcymRrOfUNFTuJgGwD+APKehRxKk6lWsCNRK7tVd+56Deerg5db4VWgjXgiFU4howV+QtypwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nd4wp64P4iG1wMd8FC3shan6KyqGL0SmjvsTYZz3QQ=;
 b=YJjxa+84gA5XtNCbvQigKSZfNzeVMtAHAoNLVRmcCGl2seovc0tE2FNp898CPpD4/nQvKlU4ZLD5DRp0EDNKGGLlnDcEQ3gBCkQPcu6kRZR2CNdt8fJLxQPLptxKXjBeUrJhnU4DHN1UldGGesRLlHijMVI+naonFA9R/L9V7eNHNlPa7Gv2nUPNaqVYmaqvqs74LrNv0RWQpkFZknBmm6tqzvxK+K8K6oEI7xgDDiaPQ6znQ0RXJMZKLOa5Tpcfll0Ys3Kmv5Q6olYTQmAIV+s+s4FQZLVcfA6ysNTUh/dE/RRRjklq6ahztl7JAa3Sxa1u8CGcoTGzdE6zaOW6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nd4wp64P4iG1wMd8FC3shan6KyqGL0SmjvsTYZz3QQ=;
 b=REX2EbBRxSg2zqqiPMwYoGOfORnr8rrMcLDzVf9yXSmuUrOpwgJp6l73gnP8CAPO0uX910F7aHDe6IpHB9J3VCNv9iP97jGqLoro2ZgFOoMTIQFapAH7+SmU78ZHnyWeAyKTW1kv9XLQzpMOFT+gUKe2HSBXnn667loUjzqPPog=
Received: from BN9PR03CA0039.namprd03.prod.outlook.com (2603:10b6:408:fb::14)
 by CO1PR10MB4481.namprd10.prod.outlook.com (2603:10b6:303:9e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 06:00:39 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::43) by BN9PR03CA0039.outlook.office365.com
 (2603:10b6:408:fb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 06:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Thu, 16 Jul 2026 06:00:37 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 01:00:17 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 01:00:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 01:00:17 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66G60Bt6052981;
	Thu, 16 Jul 2026 01:00:12 -0500
Message-ID: <774ffe25-b994-4dbf-8433-138aaf825492@ti.com>
Date: Thu, 16 Jul 2026 11:30:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/16] mtd: spinand: extract variant ranking logic into
 spinand_op_find_best()
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-14-s-k6@ti.com> <87v7axpkzc.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87v7axpkzc.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CO1PR10MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b3cc74-cc9b-44a5-ba10-08dee2ff8f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|56012099006|4143699003|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: E1wgvu+egtAokpVy8wbIc8o5izzV0G4an0J638L12vxm9qUuE0WCzLqrKi48NE+B3TqRM9PgNIZgVy39XIf+27DGK3Hcq9hytRWIUkRJ4YpAbozcbtfB+Ps0OVYNNQq+HRDipsQ0fApwtLZ+Yu93egc5vUZhbFTfR1zTTeKfaM1XkB6r/+QxWmDmn4gbgTxxEl376TOt+cCAOpg0CKWUTJZ5PJ+PGL+9EslMns5/W6qRY6hTOEhHHp9DuvMKD1+p6kHFj41gmQA4f7DUYedTjnSNQZ7crl+3NNuQ44EenkU7W62LZFilafXs88k+ZVKBER+oq5/goJSovVUlUkqrOPjf6U3B0M52LNecKrit0tVGxwwiyrytMVQ6zhOxaaSiNBuv2k8ngXLrvY1e1M4YK7MyqhdHB5PQ5rEJSY/D+iDfeVMAi2p17A7ceXPnVvMXjE5n/QeUIa24Z6GYHhd+hJLFxv0VpIX4TgWvTdmjpqS8/dQP1SDYxHjPEPYsEujxmpNf4ZwnELWLHW1rRHKozpLNR28U3Us+C8Hcms1YfQHNKrGiHO716E/aPnEFq1Y+YI2vETna1yQVbo5YXMnzKUMDBonfRyRaMDqAZGLD4Z6g+RbFAnUPz6JYcSPTatBJwZ5iBarnlO6TDfl99Gi73cknN1No7BTXBwiqa+X13CquJ1/m20x6ziSFRU75zajMkpFxzxiOoCvoLIhDcqtYrQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(56012099006)(4143699003)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VAI4eNQ/NarEO3uW0EJUmbpqSM45N6CoJgonOr6pRo50Lds8l/vaG6DFAEA1sQmwrzkabzGSjqnaS51gxPhokdm8Wn/tdP52m24HvjfnR6qtX1lXf/j6wkh3Xjuja8EsKvoyIkRBOQ3QdRMCBepqMffirWTx00DvYEhGuSbTJwtqyknm5ULJJnQZLgfvodCOvHrfTRnFOTIJlXgoSMFwZECAXF5HLTHAOIUsV9JTPbeiInBOFiNtl+MbaCNkPXnwiMPqKQ9zlatPLTu3ID4hqg0zwUd1PDYPwJ21EoDdzEzjP7Xo9Vs+ARU2iFolqYi3Yj8YrJZ8ZsH11J21xyQ4ZP6M0g0avzvvz9zHuiVeqlzTiXo/gVG4HnIzuIx4UsIvUSkEYSo4AFsmdRsYC8Yz46YJ+tGqk/rHZyJ2zzcKqq4u59woJAUrERGsEWtUv71R
X-Exchange-RoutingPolicyChecked: Mw/t+pi4yA8TpB916EmQrjqpeNJTZq+0H3mF9u91GZ/UPz/Y2RCxASwj3OALBixZ7d4LkI3Uzj0EiTbtdoA5GtK+gAzFUGNGS7XrPPRt4J4meNh+8qdyKlDgi3oX6NiH/F+Jy5pSDCJIkGHR4sHe5XSMhpau0ADCw+CocK7GiG15LOjMsDslsf+jg4scF3ToeHr31YMW+DlbAsqTC54Nft0+6VutXGoOw8viCEFFssRfckzSJtcMTsCBdrMngERrpmbOpfrvPEwI3JWkhofoSreR2g8QLCTx9VIA20AKTwk0vKvO/fHfXcCec+BS6QB2xIftHzh91+VwwvIe9ZUtsA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:00:37.8242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b3cc74-cc9b-44a5-ba10-08dee2ff8f26
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4481
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA2MCBTYWx0ZWRfX3qO6kK72Lpjo
 YZK2f1z704k5a9qoHhs6r3KYVHIRUP+FBh/JleaC84To9HpBQdyIsY//KlCJiTioWErk9fBJdGu
 cCX7XMgHeBfA414CdvrVU4Fw+mcRx/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA2MCBTYWx0ZWRfX3YezdGAZJe53
 gF3muTtpE4FvsoayOGj+4V56danU6hGAuM3yxzgsCDSORcfvoQ46kiTXHL1yQWa0RnI5hJCVcJE
 FohVsdIp53PrFCAkUWCvT+B7hQAbLWnAYoyY/IlbUU4jaEWE8HoIFeeY2u0IogHnudg2uBnw/l2
 GSfCgghOeK4R5liRHF46AjgmAIg2K8J8AlGp7KnucXHtx1gymwMtFEg/OmVdrtlz3cnxYTqwcND
 2RBAKfhCG1Ekxu66OFzMvEtmh1zIRUDtY1lo6nCMf7tEGqJLvRD1PB0sgrgfGXPysg3HyIJwv2n
 q5RwlAnmqKqne9viRlXqR8Tp4PXBTknOWlhbplzrJXfXCL7iQ9x35BYe2/kkLOmPND1fzEkils7
 zmAZBp3Ji546e5i/XR731eGgfcOT95WYo32oH2B6VgqV8S5UL2oitT2X35kNh99ZYKQZZSeRzwG
 EsavIvPE3aOK0j4i0Cw==
X-Authority-Analysis: v=2.4 cv=Zrjd7d7G c=1 sm=1 tr=0 ts=6a58738b cx=c_pps
 a=zHP1L1ZDY46t+2XtVYLmoA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=xDnO2n97B8OIqXAk9ugA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ofQIKxAk_oUuXrwOM8qem1SaAwEx4xQ2
X-Proofpoint-ORIG-GUID: ofQIKxAk_oUuXrwOM8qem1SaAwEx4xQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_230049_375479_57FE43AC 
X-CRM114-Status: GOOD (  21.00  )
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

SGVsbG8gTWlxdWVsLAoKQXBvbG9naWVzIGZvciB0aGUgZGVsYXllZCByZXNwb25zZS4KCk9uIDAy
LzA3LzI2IDE5OjExLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIDE4LzA2LzIwMjYgYXQgMTM6
MDc6MjIgKzA1MzAsIFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPiB3cm90ZToKPiAKPj4g
c3BpbmFuZF9zZWxlY3Rfb3BfdmFyaWFudCgpIG9wZW4tY29kZXMgYSBsb29wIHRoYXQgZmluZHMg
dGhlIGZhc3Rlc3QKPj4gZWxpZ2libGUgb3AgdmFyaWFudCBieSB0cmFuc2ZlciBkdXJhdGlvbi4g
RXh0cmFjdCB0aGlzIGludG8gYSBzaGFyZWQKPj4gaGVscGVyIHNwaW5hbmRfb3BfZmluZF9iZXN0
KCkgdGhhdCBhY2NlcHRzIGEgc2tpcF9tYXNrIGJpdG1hc2sgb2YKPj4gYWxyZWFkeS10cmllZCB2
YXJpYW50IGluZGljZXMsIGVuYWJsaW5nIGNhbGxlcnMgdG8gaXRlcmF0ZSB2YXJpYW50cyBpbgo+
PiByYW5rZWQgb3JkZXIgd2hpbGUgc2tpcHBpbmcgcHJldmlvdXNseSBhdHRlbXB0ZWQgb25lcy4K
Pj4KPj4gc3BpbmFuZF9zZWxlY3Rfb3BfdmFyaWFudCgpIGJlY29tZXMgYSBvbmUtbGluZXIuIE5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBLdW1hciBL
IDxzLWs2QHRpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+PiBp
bmRleCBmODY3ODYzNDRkNTIuLmI2NzhkMDUzNDI5NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYwo+
PiBAQCAtMTU0MSw5ICsxNTQxLDIyIEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9pbml0X29kdHJfaW5z
dHJ1Y3Rpb25fc2V0KHN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkKPj4gICAJcmV0dXJu
IDA7Cj4+ICAgfQo+PiAgIAo+PiArLyoKPj4gKyAqIHNwaW5hbmRfb3BfZmluZF9iZXN0KCkgLSBG
aW5kIHRoZSBmYXN0ZXN0IGVsaWdpYmxlIG9wIHZhcmlhbnQuCj4gCj4gU2hvdWxkIGRlZmluaXRl
bHkgYmUgbmFtZWQgc3BpbmFuZF9vcF9maW5kX2Jlc3RfdmFyaWFudCgpLiBmaW5kX2Jlc3QgaXMK
PiB3YXkgdG9vIHdpZGUuCgpBZ3JlZWQhCgo+IAo+PiArICogQHNwaW5hbmQ6ICAgIFNQSSBOQU5E
IGRldmljZQo+PiArICogQHZhcmlhbnRzOiAgIGZ1bGwgdmFyaWFudCBsaXN0IHRvIHNlYXJjaAo+
PiArICogQG9kdHI6ICAgICAgIHRydWUgdG8gY29uc2lkZXIgT0RUUiBvcHMsIGZhbHNlIGZvciBT
U0RSIG9wcwo+PiArICogQHNraXBfbWFzazogIGJpdG1hc2sgb2YgdmFyaWFudCBpbmRpY2VzIHRv
IHNraXAgKGFscmVhZHkgdHJpZWQpCj4gCj4gVGhlIGZsYWcgc2VlbXMgdG8gYmUgcXVpdGUgb3Zl
cmxhcHBpbmcgd2l0aCB0aGUgb2R0ciBmbGFnLiBTaG91bGRuJ3Qgd2UKPiBoYXZlIGEgc2luZ2xl
IHdheSB0byBmaWx0ZXIgb3BlcmF0aW9ucz8KPiAKPiBBbHNvLCB3aHkgYXJlIHlvdSBzd2l0Y2hp
bmcgZnJvbSBhbiBpbnRlcmZhY2UgZW51bWVyYXRpb24gdG8gYSBib29sZWFuPwo+IFNvbWUgZGF5
IHdlIG1pZ2h0IG5lZWQgdG8gc3VwcG9ydCB0aGluZ3MgbGlrZSA0RC00RC00RC4gVGhhdCBpcyB3
aGVyZSBhbgo+IGVudW1lcmF0aW9uIGlzIGJldHRlciB0aGFuIGEgYm9vbGVhbi4gSWYgeW91IHdh
bnQgdG8gZHJvcCB0aGUKPiBlbnVtZXJhdGlvbiwgaXQgc2hhbGwgYmUgZG9uZSBldmVyeXdoZXJl
IGVsc2UsIGJ1dCBJIGRvbid0IHRoaW5rIGl0IGlzIGEKPiBnb29kIGFwcHJvYWNoLgoKWWVhaCwg
dGhhbmtzIGZvciBwb2ludGluZyBvdXQuIEknbGwgdXNlICdlbnVtJyBpbiB2NS4KClRoYW5rcywK
U2FudGhvc2guCgo+IAo+PiArICogSXRlcmF0ZXMgQHZhcmlhbnRzLCBldmFsdWF0ZXMgdHJhbnNm
ZXIgZHVyYXRpb24gZm9yIGVhY2ggZWxpZ2libGUgb3AsIGFuZAo+PiArICogcmV0dXJucyBhIHBv
aW50ZXIgdG8gdGhlIGZhc3Rlc3Qgb25lIG5vdCBpbiBAc2tpcF9tYXNrLiAgUmV0dXJucyBOVUxM
IHdoZW4KPj4gKyAqIG5vIGVsaWdpYmxlIHZhcmlhbnQgcmVtYWlucy4gIFVzZWQgYnkgYm90aCB2
YXJpYW50IHNlbGVjdGlvbiBhdCBpbml0IHRpbWUKPj4gKyAqIChza2lwX21hc2sgPT0gMCkgYW5k
IHJhbmtlZCBQSFkgdHVuaW5nIGl0ZXJhdGlvbi4KPj4gKyAqLwo+IAo+IEkgaGF2ZW4ndCBzZWVu
IHdoYXQgaXMgdGhlIHVzZSBjYXNlIG9mIHRoaXMgbWFzayB5ZXQsIGxldCdzIHNlZSBpbiB0aGUK
PiBmb2xsb3dpbmcgcGF0Y2hlcy4KPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
