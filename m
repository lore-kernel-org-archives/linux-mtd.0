Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F2BC43458
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 05:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jlNfy8vd3nLJUxDCC6qwZv1L8+oTKosxW8agcz48GY=; b=ynW2W03cID09jN
	tTxkix115hixlP7xkOSnb/xnX6K1TeeYShcHsRQ80sCqYCU4H7Uw/ypZVvyyGT5cmVlOm+++BKnpm
	fTOMem2O8r8/fMAyuY47zcvcyggo8i+hVe6hxUmsleGESOo8tPqPb6xtJJR824pzy2YhqYDQfOpAy
	gI6cPDNwsUh3d2rAQctsLS5OvFKyugU3z2Fb+d4aXKbrT0+94bFHZTXy+wqQMs4eHUu7ryy+ZZyXp
	cEpScOlDGxT7ONiwGho0cRla4mbLDU8DhV3PrI6yFeUg+o7WW6GhWET9k8bnsFGsr0tobWa0KIVzJ
	EDU9CHG1SJ7j0Rsby3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF3d-0000000GUjf-40AP;
	Thu, 16 Jul 2026 05:54:53 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF3a-0000000GUjG-2Z98
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 05:54:51 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3uYAv2768921;
	Thu, 16 Jul 2026 00:54:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6nT7hCJoIGoQtnND7vT8KGE/0laDOZ5u5M91sP1O0
	7Q=; b=TxUK+Z3ZYCz+AeberiunelIpSXifimeKZdITxLE0wmibnbYNITRc22v6U
	WcE59BJ+3Fn9kDtVesjN3ipaXoxzwMzROf1IcNTSo/jrsMBpaKvWr0wLNt7f0W/D
	wmDhKbOUzXPQKoRQIyDSGE7d/UupQ+UeUU/Tmb+Fdu6zg6QbWSazPBQuPM5TzmOb
	gtoP+C8zirY/8KInmzK5TYHWY1pVUI41zi9WUVQ3PO/ioNe375TjD/4OUccrDsbn
	sQ/vvFBS5Iryd0X8V+nJX0YSsydxtWQQkQVbeWaiB4BVpPXgKfTjnTgH2/b/7wzE
	a/WYqbNshlBeoIYWk/LJpvYNtWNnQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fe9jb5rka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 00:54:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7rXVtQmsXcdhquYXFXlUSr4BCpoPz2ZRqwPOb6+loMt77MRRxJD/O/SfF0AJK7niw73su1Gow5vULcQXxxcyiNJl/ItOlDpD87iSgLLPWnxhSpCaawej1rO60Z2BjSpXcnsdnTQB/r1fLpxUrf2JcGOZQURyJcMuA/Z09I2Vd/ZMLO5+YADB+L7VHUFFBb+ozOTs97rxGp8YlC7lnu/rgyOMxA+CcTJNPaJ2AtHgIUbuWFfA+o2ppxwvFOz4TBn5kucdEJWgTR0bcJsMKqM+31KCMHHbnX11tQrQbvwHVmBwqiTjZj0iJlPy8PhIcSG5VlU31tRm2ZG3mxEuDb2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nT7hCJoIGoQtnND7vT8KGE/0laDOZ5u5M91sP1O07Q=;
 b=TChJpmyu5UZQZdJi9q3HUjY27SgzvWiNcpBpA8YJLlI0ZVMThEO0uOUB1uNHdhKe2mJtrNhtZrE/Jx0ukueT0gVQ/nR1XEdJlxRYfKShk3cr4jchw7iwmE0areTpdkunUSypmSNEQ81RPzPHG6dVqKI04XVJrq2nb4VeHNHtTFXqpXRJLQ7ZS9FUPs/j+aeWOeen8nqyqxQrab9pDwtoBTRpEEQodqlgXF5Di85xrIY3YjRkIJEsr5KNPx0dvtXtGwOE0GXS7NZz7ITm1cHEsJWCfl6xMyXb/Ex6bYAwcnxqX3qJ2IrqKomVlQxWQkkFVxM+Kdgb5OaQ1WNl7l3asA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nT7hCJoIGoQtnND7vT8KGE/0laDOZ5u5M91sP1O07Q=;
 b=h3dSgyam3t0nJOREs/48ZBOVBBKDZBT0TKSB7towAE28dmOjS0hHZfhgQWAgjVk3jSm9jSIqEj2snfeuxQK+b8TjrFA7K6wF1KEMJDmXVmJapUxXCDCkBCJA/so6mWqMaMwN/9j39M1YBkdBaSMkTRIxG+hoEkZDnI/oIxcajp4=
Received: from PH7PR13CA0016.namprd13.prod.outlook.com (2603:10b6:510:174::9)
 by CY5PR10MB6120.namprd10.prod.outlook.com (2603:10b6:930:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 05:54:40 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::78) by PH7PR13CA0016.outlook.office365.com
 (2603:10b6:510:174::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.4 via Frontend Transport; Thu, 16
 Jul 2026 05:54:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 05:54:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 00:54:21 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 00:54:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 00:54:21 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66G5sG4F041780;
	Thu, 16 Jul 2026 00:54:16 -0500
Message-ID: <45821dff-720b-43ac-899e-03f200d48b9d@ti.com>
Date: Thu, 16 Jul 2026 11:24:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/16] spi: dt-bindings: add spi-phy-pattern-partition
 property
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
 <20260618073725.84733-3-s-k6@ti.com>
 <20260622-jasmine-mandrill-of-emphasis-eebb4c@quoll>
 <87zf0m5wlx.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87zf0m5wlx.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|CY5PR10MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f0c414-94b3-4c7c-c962-08dee2feb8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|1800799024|82310400026|23010399003|56012099006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LZ4OP2d7KvsJ1I8GbOEZjVh/GupKH1cR2VGMy7hn95trSsksuhLE6390sCAEiwMuhLz3Rc48wbXPyx19/wgPIk5ZbqDOgkLP9jbb+aSewMR9A9WgQ4B2JigEuAJd/mTzv9OQYAOyX3rWzNVZ/i9BVdwTXaFthoHk/OiP2BgWyi16Sa0peLsccjiGI8h1QGauTkfIswvWPv8iFzGu9z1MD+JGceOoxEVAs28lvKtE224ILjvWS2ZtpB4JjnHB85uA3ENRD7eMw2BBxrRAacpchkX3MzVpVxB3lsd7er1s/wa56zdOeLKPfaNHBh9NXnIvgEP9QBpf+AgtekaTlz0W+i4aMUVZ2pBFAxJDJHGNCGyrO2t7hTgyGhxpb0d0MpdGue1w5dWgeV+gselGemyl+2JUFEtehFBigxoeGV4p37u4c6GpSh5X5sek/8eSQ7Ma4leGs0oXKTaUmT+JVsBxYJz5vgO2qICjdU+sTReDkv37UdW1ZWdVqmY/DQ5aGj80R7771kpT8eSvSM3SXylhoCUs8mgPwpta8ZTf6hpk7HmzaYjUAriPgvKgqo0sqh/RFWY7MegHjiJUzclJ9cx6CGIQ/cAeNLAIFmZlSazOyAKtxjbBS4vO9GVtyl5dEXc1XVsyVt+NuGLrj9Y0HEiA0HWXyEsozifEXq34wOgaSEzugM8URnYlQ3I5OC74elMdO/h+0I8vxiiA0NgVex/gdg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(1800799024)(82310400026)(23010399003)(56012099006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ONjiMecbOoyj9XOCf6qsWFzeeBTbmIoohpn3yOhbrnB7inMX5VPJuRv0X7t9tVc24MDlCOIqY2zpba4Xh4aF25M6r1RhNUKSwFUb4lBUUjhfSk8X0Q4WRwyJV/kT/aPjBxV3uUazJT8M7cdoB1LUr9wj7vK5HcnZsmcE84nOqUON9HR/jyunFQbSy4zq1G+EgZkXyPm4Qu46y9ZFUeZ2IGra3TDqzpgWwNZ8eurzzFSAJdmLxzLNio3iC9xjH+xr0KbMaNEO24tBs8yNnU0/O8I8DN/av3Cyb40ce7Ntrie1wih8mft//1ziaSdF1M4S1/pa4R2uWGF8otzQxmyWh1dyr2QfPbBAj0OmFSPV8B5FeZ2xM34+RENJcptSqKeSR/NYjgWDR6GdojpbTnMni8mG5p59wWIoQbbp+xELcVm15VobKs/SRPtko5lcUNF5
X-Exchange-RoutingPolicyChecked: LUgAkkpSr1lE0zGsI4M06TnDlvj/+yJmn46FMME+X+XP9WorvO+raXJndOXTlHtzO+k5H+PqdR39Qp859BNL7QYx51x9LdlGdVQqYMYwmzT2p2ag2gfq6Ny/y4axEBsNu0ttWUfdoeSSTXMOqhW/ihIp28GjiRc+Qu9gTC2ynZ2Gh1tpeizZrRacP/nAOf9nIIddgLyxfsMwvtcuV9ZdUcXx+/yyO1PMw4b3ezOk1QRL8s4YOuDyju8dJs0yuUyb+88x7iFqQsUR9tKH0L7ja5kT3iMWg1yKwC+ElLd/wDltn/F2yn7UcfSzJrtWBE5VQuV/FS0gJ6OTD2X+zoT/ug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 05:54:38.1739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f0c414-94b3-4c7c-c962-08dee2feb8c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX6fwHQGp2nC/u
 fDAxE7a9OK/pMRsFrppIqL4VES7pJ4ZcZ66o4gswQN02nkBnsjCjfmwbySY8CxVgjxewDAmPpUx
 jO2KgIsN15EGWuGOuOHcfwgOZFwa/yQHVzlvFnjPqXns5UGwR1XjUXnhXyZaktxsdhvw9qV1Rn8
 nprlNwj21GQcH5/uqscoeOyVvz1ZqFItj2x1W1kT+Q/y9E6ZLEu3Cd8cGa5vKSx0a1TqCHQUPRj
 cDouS57SPxq/gq5C8X7X3YkiTahxyZVd4r0YLHRZpVS90qwXoHwomhGw2lvIeRvuiNEz8N8NPhs
 jGK4D0uDGcmLUOeNWTiXT+ubp3Nsh3Ap+M6VG2ZYCfQZw+W6axJdXatKiN47SVl+M2dWLH7OyyE
 Rfx86+esB6W/hlFLau9PqgQNYOXKiAOkFMFBX/W+cjaOgiFvYDPhOmfXWA6NNBYCCl9cHPNHvM/
 oKNnFgUW/5Km7B850CQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OCBTYWx0ZWRfX42e5xOewgIWK
 emgyyxp/sJh42FPjNcDRhJCnz56ggLhRlOfmrd/I9hJQQo1gaB9TbbwyUdrPmQiUDBeqrnIEMsv
 xV2pzfWSmVlcU7Aendt1VgXu/YjBmvw=
X-Proofpoint-GUID: oLPgGwnOQbHsTbvG-06sU03MyGJfs_rV
X-Authority-Analysis: v=2.4 cv=ROqD2Yi+ c=1 sm=1 tr=0 ts=6a587224 cx=c_pps
 a=KNS8ES/6Vao0xGfhhZwSfQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NXoGjvYn7Tc9sylpGXMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: oLPgGwnOQbHsTbvG-06sU03MyGJfs_rV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_225450_798777_EC2A4405 
X-CRM114-Status: GOOD (  18.09  )
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

SGVsbG8gS3J6eXN6dG9mIGFuZCBNaXF1ZWwsCgpBcG9sb2dpZXMgZm9yIHRoZSBkZWxheWVkIHJl
c3BvbnNlLgoKT24gMjIvMDYvMjYgMjI6NDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8s
Cj4gCj4+PiArICBzcGktcGh5LXBhdHRlcm4tcGFydGl0aW9uOgo+Pgo+PiBJcyB0aGlzIHNwZWNp
ZmljIHRvIFNQSS1iYXNlZCBNVEQvTkFORCBvciByYXRoZXIgYnJvYWRlciAtIHNwZWNpZmljIHRv
Cj4+IE1URC9OQU5EIG1lbW9yaWVzLCByZWdhcmRsZXNzIG9mIGludGVyZmFjZT8gRmVlbHMgbGlr
ZSB0aGUgc2Vjb25kLCB0aHVzCj4+IG1heWJlIHNob3VsZCBiZSBwbGFjZWQgaW50byB0aGUgTkFO
RCBiaW5kaW5ncy4KPj4KPj4gSWYgdGhlIGZpcnN0LCB0aGVuIGluIGJlbG93IGRlc2NyaXB0aW9u
Ogo+Pgo+PiBzL1BIWS9TUEkgUEhZLyB0byBiZSBjbGVhciB0aGF0IHRoaXMgaXMgYWJvdXQgU1BJ
LCBub3QgdGhlIG1lbW9yeQo+PiBpdHNlbGYuCj4gCj4gQXMgZmFyIGFzIEkga25vdywgdGhlcmUg
aXMgbm8gcmF3IE5BTkQgY29udHJvbGxlciB3aXRoIHN1Y2gKPiBjYXBhYmlsaXR5LiBJbiB0aGUg
cmF3L3BhcmFsbGVsIE5BTkQgd29ybGQsIHRpbWluZ3MgYXJlIHdlbGwgZGVmaW5lZCBieQo+IHRo
ZSBPTkZJIHNwZWNpZmljYXRpb24sIGl0IGNvdmVycyBib3RoIHRoZSBidXMgdGltaW5ncyBhbmQg
dGhlIG1pbmltYWwKPiByZXF1aXJlbWVudHMgZm9yIHRoZSBjaGlwcy4gVGhlcmUgaXMgYSBtZXRo
b2QgdG8gcXVlcnkgd2hhdCAidGltaW5nIG1vZGUiCj4gdGhlIE5BTkQgY2hpcCBzdXBwb3J0cywg
YW5kIHRoZW4gd2UgdHVuZSB0aGUgY29udHJvbGxlciByZWdpc3RlcnMgdG8gZml0Cj4gdGhlIGhp
Z2hlc3Qgc3VwcG9ydGVkIHRpbWluZ3MgKGNhcHBlZCBieSBwb3NzaWJsZSBjb250cm9sbGVyIGxp
bWl0cykuCj4gCj4gSW4gdGhlIFNQSSB3b3JsZCBpdCBpcyBkaWZmZXJlbnQuIE5vIHNwZWNpZmlj
IHRpbWluZyBoYXMgZXZlciBiZWVuCj4gZ2xvYmFsbHkgZGVmaW5lZCwgc28gZXZlcnkgbWFudWZh
Y3R1cmVyIGhhcyBpdHMgb3duIGNhcGFiaWxpdGllcyB3aGljaAo+IGFyZSBub3QgZGlzY292ZXJh
YmxlIGR5bmFtaWNhbGx5LiBUaGUgcm91dGluZyBhbHNvIHdlaWdodHMgYSBsb3QuIEkKPiB3b3Vs
ZCBzYXkgdGhhdCB3ZSBjYW4gc2FmZWx5IGtlZXAgdGhpcyBwcm9wZXJ0eSBTUEkgcmVsYXRlZCwg
YmVjYXVzZSBpdAo+IGlzIGFib3V0IHRoZSBTUEkgYnVzIGJlaW5nIHVzZWQgd2l0aCBvcHRpbWl6
ZWQgdGltaW5ncywgcmF0aGVyIHRoYW4gc29tZQo+IGtpbmQgb2YgbWVtb3J5IHNwZWNpZmljIGZl
YXR1cmUuCj4gCj4gVGhlIHJlYXNvbiB3aHkgd2UgbmVlZCBhIHByb3BlcnR5IGluIHRob3NlIG1l
bW9yaWVzIGZvciB0aGUgZmVhdHVyZSB0bwo+IHdvcmssIGlzIGJlY2F1c2Ugd2UgbmVlZCB0byBt
YWtlIGRhdGEgdHJhbnNmZXJzIHdpdGggYSBrbm93biBwYXR0ZXJuLAo+IHRodXMgcmVxdWlyaW5n
IHRvIHJlYWQgdGhlIHBhdHRlcm4gZnJvbSB0aGUgaW50ZXJuYWwgYXJyYXkgc29tZWhvdy4KPiAK
PiBUaGVyZWZvcmUsIHdlIHNoYWxsIGluZGVlZCBnbyBmb3IgdGhlIHMvUEhZL1NQSSBQSFkvIG5h
bWluZyBpbmRlZWQuCgpBZ3JlZWQsIHdpbGwgcmVwbGFjZSAnUEhZJyB3aXRoICdTUEkgUEhZJyBp
biB0aGUgZGVzY3JpcHRpb24uCgpUaGFua3MsClNhbnRob3NoLgoKPiAKPiBUaGFua3MsCj4gTWlx
dcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
