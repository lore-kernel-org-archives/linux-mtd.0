Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9138C43458
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jul 2026 05:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifQFDgOp19MtNl3OmRi4J8YH1ibdr/LcAO1C6mhGvKA=; b=fGzeuXiWDct1iA
	wokwdUsMoiQ33Nez70SLH7Dn/gvo1aXcp0OcwqNh24YSTj+oetaTupTaS7KytlnE0hH9RxzX/cXRO
	HqxHvRL9yR6maLqp1EzApQE+25M3THhgi33PreNo631hXVz8EuJcSRWTAkpmomU1hkhYt1iGwmhAU
	eACYS0U2boLAaEX++Bgx3TrFMGiu4hvtefv/gCCxDeAU6q/veL8T2CVhSnRGYVjpxAA/ygVsUvN5w
	3at4pq4heYm7IpuyVJjHGbLLcvYMO9SCBRCUFObdGqkYtN/F2hbgkeA0We02jy21PGqjqmJip12O0
	cMBOreF45cqai+52ZeRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF7J-0000000GVN1-4AlG;
	Thu, 16 Jul 2026 05:58:41 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkF7G-0000000GVKK-0wZJ
	for linux-mtd@lists.infradead.org;
	Thu, 16 Jul 2026 05:58:40 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66G3tqp91239457;
	Thu, 16 Jul 2026 00:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=KYWJfzr/yaA+qJslagbaBne0B2ECpfVHzdhut9VNi
	zo=; b=k8UwSZPW9Jxs+By5DG0Nn14i7kRf46JSwhL2b8unSHQ/InRueaiqzEd53
	8bvWZ6H75QLI2C+kqWa65mcsmD9f24k0huV8M2prF5l9lC2ovKhCU8a18rBB6QEJ
	2p/s+aTgSHMz/fEQo3op01gLbDuZjznfLn9U4BP6ygz66oCfsm2tI14Voqhk81Q8
	rAmpd6snF+zndAdQ4GHtA4065b/kBnOuLZYDUsoLOPnkALzQmFf6cj0qGTvzA+N+
	ZTTt2TeePuOp3vN99LMkP0IW75GEHPwiQxe04S9wpVmtoFW5B3KHTrRKc7XdWE44
	KASHyTMenmXkRiUCK08WmV0PFKclA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011051.outbound.protection.outlook.com [40.93.194.51])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fep5s903b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 00:58:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVcntuO6hZigfxCn9snIfhAN4glAn3KCvGu3ARTzhq+8c8xw3a174YHSLJ0DvMC6PkOfYEL9Uy7TkPFApj2aOZMW+tsSNwZjvZItmlZKwnjtVmQD9PrZrjrLFSUc4A3BQuM74hv6QxVaJh//jfFj2vGyHxw7kqtl9VOQGaqohMrkE3qk0jIfqSKVjyCdTI7PBBNYszFkKS6687apvmTekw5vtaT+QueIH0TpSvdMqoLoyck+YzgOHodVSrVz3XfZNVKBFLyGeFO9Rsqn9M3/ioOYdg820kZmo5eVyF1q5zr/BvvR/AwnXnJRoD/pinUpnn2QM6gEeIEFO7y5XMnFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYWJfzr/yaA+qJslagbaBne0B2ECpfVHzdhut9VNizo=;
 b=iR4+AukUEnFP6JSZUcnqmb/XtSi3DOeWNNZsSiirYBNTAaml4XuRyF/m9jUsX5ddru0PmqPBBDzEWr5qAkJfnVFGVQP9zIa0YWvskotRESe9zgNbveMYVnrMV0H+8PdUPvNcTd8xBYugFHH20tT4IrHbgn0hwtQeBhiHJw2CRPxf452vV+eQ3TYk2Z5yp2VTSsRIIU0ouG6sVO7iJztF4TUljlxYIvhnQMVxPLfGdkoYM1x6aDx6HG7SbpxSEIyN44R9GqUnUqCQbMX0pLNyjlNARMya+EJ8ZhSJwJY47imnrJCrhRhxBVHdySQh9h8EF0byhc9P64ynzUFk8CoY0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYWJfzr/yaA+qJslagbaBne0B2ECpfVHzdhut9VNizo=;
 b=tuCundhKYf71hg3S1s+LnwWCa24tIkqXx/VpcoH2NFVv5aRNAZNrJGDBjSca1xL1zjjbY6jOBk9QsZnpsUSzdjTm31O2nisH1UJNt7fWS6w/6QgI+0j9L6SPhjEWa5s1Ty+5SHH2YYTPWqvq3bGpF3/lqSIhRRJnZUaVo2Nexuw=
Received: from SJ0PR03CA0360.namprd03.prod.outlook.com (2603:10b6:a03:39c::35)
 by IA3PR10MB8299.namprd10.prod.outlook.com (2603:10b6:208:576::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 05:58:28 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::99) by SJ0PR03CA0360.outlook.office365.com
 (2603:10b6:a03:39c::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 05:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 05:58:25 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 00:58:18 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 00:58:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 00:58:18 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66G5wCpJ047928;
	Thu, 16 Jul 2026 00:58:13 -0500
Message-ID: <11c30eee-623c-448c-a9fc-9a10b7dafea7@ti.com>
Date: Thu, 16 Jul 2026 11:28:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/16] spi: cadence-quadspi: skip DDR PHY tuning for
 2-byte-address ops (i2383)
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-10-s-k6@ti.com> <871pdlqztf.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <871pdlqztf.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|IA3PR10MB8299:EE_
X-MS-Office365-Filtering-Correlation-Id: f515d409-1cfb-4521-0d2a-08dee2ff407b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|376014|7416014|36860700016|1800799024|13003099007|6133799003|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 1i6OTVXcyay0bF4jV8ixW3zuRic8iWkKlBsNhsN3GWOu1dsMnTtO64PXuSvzgeN01mfZP5VjjnfI80R+NT3VaC69cES86YmSXWeS9hefGnUngYPvA06smmdglbJBsVW0djztUHIsatHNXX1YHqt2q2R30VFHBdvmImHJ8ewI9GHwqns8yGlOMoCrK50z+PkHe8piUwJjBB7O5T0QIvosZI06r1pwxGA8dWpCCJd6dpP5/K6NBLhEYBL/vubIm2NxImVW9wF22iQHniVBEq1RXntAXpWtsKsrOIKYfsijEERh/Xm1MtSbpZdSBRczgXcJY2t1lpKs5UyV247TIdoUL6DX/ELlYKQzghSA5GxvaQTNYP3QpampGSp1CIiYoDsI8v6XIGmb8hcXqG347X3+m+7lz4yOZX3W7/Cssr5ZKgUC5u+ftztlF4NWXouKZMSUlZc9cixlkqLiD4WyR8fvvN2JIw8X3N4c2BD5GRuysHqBCaVdpBeQhgXhUlH98zVhgI9OoJMf6GH90Oo0QpyGTOTSFulF9SUby64TeqXhlrzJKBEwiaFitpnAut1AfiryrUxDZiplT3kYprK1FoWFnB93WRhPZXDyCYoUha8+JcSE1pFERSJTCac5+nqHvjOKOC7HSvZxagyHuIaGYHN/Tw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(7416014)(36860700016)(1800799024)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ynialzmfacikYN6bFYuZb8quR3ixZIaOTFSSCHDGNKlf5h6QU46ZHv/T4kGvPbZs4pOP765nLA0DZqUCoRNTtCHd30C4B8z7+m49iCGBVlhU5xKIQ5PkLwelT4Wxl0HGViuaqxl0/puyp0FDtmxUGhSzGvoZOblbWbY1KIfm03ME15c1vxxr5KiueyQ9KY6C//UOY+9C9XMk60vhbqJmuJysWo6qZfq0BqnEen5YYGNd/o6Vpvv4tPHwz0wQLN5b6SuWlQNYRLyukoevX73uKq08fhTstj0xip+LS3Pdvvs5GWHSs5FqEok5mQ1piSe4MTc6FkWjP+78WD3looimuwJt5weQH+FqRn5td/AcfFUakodQVGNF55FlM1EbuZO1G/zDehHU1t4S6wlJKw09L8Rx54sbbEXCM3dqyEhoH4HOM7uQ2wkvNNBCx3rfdya9
X-Exchange-RoutingPolicyChecked: rsr8fMxkzNrJ3gMEsQX/s1quOjcXeq0Zag2/gA/ZRIW2bQtvye2szYpBVF+H3ZZhH1dLXcFNeY1b4+nZcR2x1Mh4blidI9LzXRb43OBg8aWPu+CCXNTksfcFhISRIlngjqnu4veoOYkX/ol8kbtmvCdH4J4z4k6+gmpSQt1cpKaLRAaMPZPIk9NvnKkPt1fgn9+RJPUKJrNT3UnzC43+npjQOttVOiUAEfheofjPzoSpHDt4jTUpjmBnwvOmJRwhb/R+6fIJJLiV95iy+pkNXzaoGN8nvUE724kKbKaJLUXw/e5ImqGc2LqU5Xbtal0sl1uBqNNmgPdztBkOoFpyTg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 05:58:25.8240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f515d409-1cfb-4521-0d2a-08dee2ff407b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8299
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA1OSBTYWx0ZWRfXzuxNX8IKX14G
 DzKmqNCY6nOG/UDRMAYRvIz0ek1xDdWXnH0SjDnNWi4Ra/wke11XOLjxZA3tdl/7gu0t9GBTvf8
 BmQ86wmUuIvMoJzygejy4kUV+BfmlSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA1OSBTYWx0ZWRfX67JjFnzxsMPB
 DTb3eMhTFaxsiykOAbWma1SR+EZoCQqmNK7s6U6BTq0QFAxx3DQESyw3VNWqgMzqaxWcfibRtF+
 GgofJlaCZVBhjD64m1vN9TqIt9yhKVBPPVKSAq7NmqnaTDlbMMGq4SY5BwLpDwnPl4kYZcKGdAj
 k2mr6NWVTyj7vTgL04GI33eBu0Ill0WNfh6IBe9/A7LUdv9dTlKY+hDMeJAn0BnGrlVlLj3T6xf
 LRX8iuQy2dRRUdMt2PsJH9bbgefmHKJIfn1DB8M85c1D4kGYs2mLR3UJ7D7NjizshEhLoRd+t2B
 NNutfp5OJL/nrklnHLhmXZsp7FWUAgQu0sPqpZiejUh5q5TGq8DkdNIgc8BA9FTGGqrpdw6oCso
 UYQuzTwEUmbR77oBP/zrmcFHQ0/i2rzLxU/BXQXnI+E0j3ElcJs3hgiXIA1NRh4AeWHLqirdMuf
 f14QHpNQfyJyu5hGFmg==
X-Authority-Analysis: v=2.4 cv=Zrjd7d7G c=1 sm=1 tr=0 ts=6a587307 cx=c_pps
 a=TqpEWdQu6X+pWU0GeT7YGQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=9DmQmDZJl0solZ4cBQMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: tl5E6lkODLSTLQDMqIn946jX7rHsGsxg
X-Proofpoint-ORIG-GUID: tl5E6lkODLSTLQDMqIn946jX7rHsGsxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_225838_273678_939717BA 
X-CRM114-Status: GOOD (  14.21  )
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
LzA3LzI2IDE5OjA1LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIDE4LzA2LzIwMjYgYXQgMTM6
MDc6MTggKzA1MzAsIFNhbnRob3NoIEt1bWFyIEsgPHMtazZAdGkuY29tPiB3cm90ZToKPiAKPj4g
RXJyYXR1bSBpMjM4MyBvbiBBTTY1NCBsb2NrcyB0aGUgYWRkcmVzcyBwaGFzZSBpbiBQSFkgRERS
IG1vZGUgd2hlbiBhCj4+IDItYnl0ZSBjb2x1bW4gYWRkcmVzcyBpcyB1c2VkLiBERFIgUEhZIHR1
bmluZyBtdXN0IG5vdCBiZSBhdHRlbXB0ZWQgZm9yCj4+IHN1Y2ggb3BlcmF0aW9uczsgbm9uLVBI
WSBERFIgdXNhZ2UgaXMgdW5hZmZlY3RlZC4gWzBdCj4+Cj4+IEFkZCBDUVNQSV9OT18yQllURV9B
RERSX1BIWV9ERFIgcXVpcmsgYW5kIGNoZWNrIGl0IGluCj4+IGNxc3BpX2FtNjU0X29zcGlfZXhl
Y3V0ZV90dW5pbmcoKS4gV2hlbiB0aGUgZXJyYXR1bSBhcHBsaWVzLCByZXR1cm4gMAo+PiB3aXRo
IHJlYWRfb3AtPm1heF9mcmVxIGNsZWFyZWQuCj4+Cj4+IFswXSBodHRwczovL3d3dy50aS5jb20v
bGl0L2VyL3Nwcno1NDRjL3Nwcno1NDRjLnBkZgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9z
aCBLdW1hciBLIDxzLWs2QHRpLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9zcGkvc3BpLWNhZGVu
Y2UtcXVhZHNwaS5jIHwgMTcgKysrKysrKysrKysrKysrKy0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVh
ZHNwaS5jCj4+IGluZGV4IDcyNzY4MjkyYTMyYi4uMjJkZjVmM2JkYjk2IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS1xdWFkc3BpLmMKPj4gKysrIGIvZHJpdmVycy9zcGkv
c3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4+IEBAIC00OSw2ICs0OSw3IEBAIHN0YXRpY19hc3NlcnQo
Q1FTUElfTUFYX0NISVBTRUxFQ1QgPD0gU1BJX0RFVklDRV9DU19DTlRfTUFYKTsKPj4gICAjZGVm
aW5lIENRU1BJX0RJU0FCTEVfUlVOVElNRV9QTQlCSVQoMTApCj4+ICAgI2RlZmluZSBDUVNQSV9O
T19JTkRJUkVDVF9NT0RFCQlCSVQoMTEpCj4+ICAgI2RlZmluZSBDUVNQSV9IQVNfV1JfUFJPVEVD
VAkJQklUKDEyKQo+PiArI2RlZmluZSBDUVNQSV9OT18yQllURV9BRERSX1BIWV9ERFIJQklUKDEz
KQo+IAo+IENhbiB3ZSByZW5hbWUgdGhlIGZsYWcgdG8gbWFrZSBpdCBtb3JlIHJlYWRhYmxlPyBJ
IHdvdWxkIHByb3Bvc2U6Cj4gCj4gI2RlZmluZSBDUVNQSV9OT19QSFlfVFVOSU5HX1dJVEhfT0RE
Ul8yQl9BRERSCUJJVCgxMykKPiAKPiBMb25nLCBidXQgbW9yZSBzZWxmIGV4cGxhbmF0b3J5LgoK
WWVhaCwgaXQgaXMgbGVuZ3RoeSBidXQgSSBhZ3JlZSBvbiB5b3VyIHNlbGYtZXhwbGFuYXRvcnkg
cG9pbnQuIEknbGwKaGF2ZSBpdCByZW5hbWVkIGluIHY1LgoKVGhhbmtzLApTYW50aG9zaC4KCj4g
Cj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
