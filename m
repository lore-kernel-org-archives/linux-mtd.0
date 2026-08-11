Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1826C5CFDB
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAQLGNWndNWfJ9V0Gx3+lwZjnkfSOU1Btccrv3LAtTM=; b=emFUrAixLFHPgr
	En4sj0bTq82Ff2PgE59pPfxUI5OQY3BnWrnzAxykfaC5p24e0CkJf9eXq6bHSDCHWFibZbWz9caeH
	YTcqdZhxHjypHR+Rizci8r07KQXdvffI0ujw9kVX7sisxY0zCvrLTEoaknnYCYQx2eTouJtj/lu40
	OW2hF7GQYQeAWATc/tLRhNGYCn4B19z081xswocS3YCWLZrzD+FFGJKbVD5YCtNgbLN+UqTCOgVhY
	VwzINLlS1yk3i5ED6gFToy/KKqC6qMKGH+HM+L/OM3amRLbQaH+04FNvZ7fpbg43U3trZ6hviwjIU
	3Tr7V7Ykd+TdAPKsEluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrIm-0000000ElsZ-0UHO;
	Tue, 11 Aug 2026 18:34:16 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtrIi-0000000Elpf-3hMA
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 18:34:14 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67BGM53t2459900;
	Tue, 11 Aug 2026 13:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=+pWYfJ1EP748IQC6CtiOQMdvqHr9KlmObkQrKfpTY
	Hk=; b=KAySNhFe6w7EQY7+QhQgWV6avom27/hB8Ij2U9WupA7IGEowFPAGyvU7P
	tgVUqHt+60yMKWT7OO2Xyb82rq/ynxIkMQNNk7YJLugs3Gf02GxAUlFfC2lM0lfC
	+orEJyhqGbs6w3N8T6WkX4/HJTC11KnUZJkf+OMs5dB4q27AA/VFJpfIEzTKiuN9
	N1h/DfnokIfJQoWtSPzYwOnSV370gTXiU7/tWqXrxn846WOcopU0epLEfhiT1oyf
	5znb5ifRrbeIctiREMQBpqb7wgi8Rr0iwNUOH0eqX9zHgqQ0QqHcYe3PNyjjDGLZ
	+anVwIZ1jClAPB2C9a6F6ZFGYYpwg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g00wu3h29-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 13:34:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rabcwx5qayUfYXzN2SPRziffe8EFQp7Uj93BwnshIddwhSbZJuDTlqtPMTf+yV6hqfof6RaYarY4G1K7UBBfO6ryl8SsOH0Q8yWKDkEAgaXfWC4cT2ghPDtbstvH+UugGcI+HBycqMSMBleSds+G24fzITJ8Www5ikI4W48R+5fTWDXjOnl6M9F51/fyAgWWG/V8Le3WEL5hVvuRbtCHOjpj8vF8UKspE+AjToays+p+Iz1G84/2p5yFgjxmrhv+Do/o0c3P1j5IqCiExVLwe0uoenZ6BldfLhnGbEV3chIm/HRomuxxbDTxxV0s3Fhl0VL5PMj7QeBpl5NB7ugPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pWYfJ1EP748IQC6CtiOQMdvqHr9KlmObkQrKfpTYHk=;
 b=K+lhGLvPUlWokvyQlyHGAYvJKcsXdDvHU1P7+1QHb8E2+FT6p64YObnv/FVfW4AB3/UB3lFZt0UY8SxFybtW6HvQwpFZK3IHOx/V5+NY2Ct87TecOTUXblF9W9fx07n5UDtskZsteAhuOlKZnd13nrCTRyz5WK2GyBoDhl3bv+26lfAHgrY0kcO0oVEzND6mvBAZ9JIzznLcyQHcift30ownTt6O8neYsqTGoWLc47Mk7uk2vCK8A1wXt1TKVS96WTJmf3TBUvpB8OGusrvc2sfbkasOXSLyep8yFiMeDzVwPw6hnKlVuyboqMMlh21/LGfuK8Um5Mdo2J247GnlOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pWYfJ1EP748IQC6CtiOQMdvqHr9KlmObkQrKfpTYHk=;
 b=kr5jKT1uAQ1gXvsVLpovthsljntf5KFhiQJNIGhKQqFS0TIYwhugrKbsQfvSQ35+KA7+6On6QIzAS8zEeAN9MYwx5Bpq4agqnRCXE/onb4P9we9UzzVkcLTInFBI3fJjZBlnE0JvWiD1IkbeXBt5tDwOKKyEw+b1bhTkvaGD5wc=
Received: from BN9PR03CA0903.namprd03.prod.outlook.com (2603:10b6:408:107::8)
 by BY5PR10MB4355.namprd10.prod.outlook.com (2603:10b6:a03:20a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 18:34:04 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::ad) by BN9PR03CA0903.outlook.office365.com
 (2603:10b6:408:107::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 18:34:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 18:34:02 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 11 Aug
 2026 13:33:29 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 11 Aug
 2026 13:33:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 11 Aug 2026 13:33:28 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67BIXIdr659766;
	Tue, 11 Aug 2026 13:33:24 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>,
        "Conor
 Dooley" <conor.dooley@microchip.com>
Subject: [PATCH v7 01/18] spi: dt-bindings: add spi-max-post-config-frequency-hz property
Date: Wed, 12 Aug 2026 00:02:56 +0530
Message-ID: <20260811183313.1550425-2-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811183313.1550425-1-s-k6@ti.com>
References: <20260811183313.1550425-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|BY5PR10MB4355:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bace659-4b3c-45ad-9658-08def7d71dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|1800799024|82310400026|376014|921020|6133799003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sCIiry09vR839yIVvEqszqPhrDYWsNJDlmlmQeD2Pgz4X18SNtXLMjeox19Y43AA27f06oS1bE0ov85zA4bwQFB+GvP9xVp5H2Q2G98H7CuokRSmiml2ZVD1UTvalFxV5oIK2Mtc+4OEhJYo5sI6FcvdTenc1Z9+ZM9r8AGLzQotJmF3xOwkv8UfTLC3CI5wlX0/NN05McxM1Nle86Llb3jkFYGuva8x3Hi1dA8lC5BwtEBOzsPVmmmqsORQxCkmI8jtZFfJpR+TUvg2onl17zd8LbpgHb7dsN7pws/J2dxH4jc0R10CE5fz8nhP6uGENtHVmFLDZgYDX8O01c7Iw0jP9OaMjwd/Sxn89MkCDN46I3mCCQ63AFohbJ/kMb4XqcDMzKQPNDKUKYZd3cSw/zGeZmn/HkNFt6ucHEMNNs4w8JW/LgRkWX19rZ0cgsedXr2kh40HXpxojICvc4fE0/klcW/ESU2JegsXdhpp0QiVxv6FqqguLjWle0E2cxZhhI6QUfTenYm35Nqn9Y8zMXc/1whgWN1hFZuAyjztsymx1w0idehR5sZXVPm8aZd9lG0fYQ5W/N+Do+vayNmC4Z4HRNkjt805W9tmfG7ojfWRSnPqEODKCFap8T8ojFSFVB5PUN3fD3ip3uj8EatlWkypH+ZovuH9TPxlr1Hs/WmG6qFtepHSWAEGx0IjGqmsVoDou1jPS3lYhBBkhVWHpp2jmM9RJSVsGEUtG0omjRqBwElO0TWipaQE+4jOA0J4
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(1800799024)(82310400026)(376014)(921020)(6133799003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5nN4oetX5jkG2XzruWxs5AjrP/wKyR4tWnbq7Ce4TezWvN3wOEyTbRG9cHOGJTrnrRl5iXEGj+BQY2LL/qY8maND9sJT6F7e2Po5xFpjx+6iDjLvQliF4J8NaYMvfIz1rOKy7Nd14huxiBDnzx3mlhOgrM7opGdo0ar2eMOrZyaQea/XmO82EIZIjTsxYzW5F0LAjgBHgtPLUQ8cP8UmJ7Ib2C9j67UYtXDnFXB/iQ/At69SKZNlQmu2qZz4pow8Vw5GwYkslnnP+4u+aYS4cPZsGiTMt9AlpzsncIOLPjsTcQK1zGnvUYPib3fvWGHpvnSb1H6KP7xKXoQRqytV/x1f4K/T+zNMDLu3SOMiSnXQQ5NFuTG//md1aXuM8IKw/jPUrJTPPyUMa358lO9nDe3GKsJ5J+VPIOXCUHveoY8xENMX+vOxuAobbA+QI+l6
X-Exchange-RoutingPolicyChecked: bcQw0bm7Wg7MAVgxmzFqx+t5yN/XFh+D6KLQw9QqqNo9uriJHIG+HbVgOJNHK+YIhr7QQGu/EY18yRk4/a6WFm9MaYHao7pLHuxJrvwmAnBqV7c6XnDoU3kj3W+OFvINpyVSt1BcPA3/fJAT/S+i2bIeIeRZArRky3m+15JTrM+WggC1jEwN5Nd/4SboZG9n7UXUdFuKZWtk2iGhGrLLbREqoLkSGuwMGP3eemqbGdP6mH3YlB0Bx4lsvqhsBWdGVfgDQwy8GdpajG0KYCJvkzGHN2a8kR5/2okEckn79UqUgC2Kj9CR+vsw89+eqVplAVtrXy/e9MZVbs9CXZvwqA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 18:34:02.5317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bace659-4b3c-45ad-9658-08def7d71dff
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4355
X-Authority-Analysis: v=2.4 cv=M+V97Sws c=1 sm=1 tr=0 ts=6a7b6b1f cx=c_pps
 a=AqWYtYKdvuqIQX7AE/aD9Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=XYAwZIGsAAAA:8 a=sozttTNsAAAA:8 a=skPbNTvFiSR7kuR3s9sA:9
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: -eaDOk-jHSzKY4JC3UrHITAcFyHRV4Zx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NiBTYWx0ZWRfX64kzLb2uxXy/
 9BbJfXG+1rclz1wOhU5+Fto0/nAbzZh4Uz/0MkDIN5ZZwTWOZyABnZgoYz85GmN8WEGQSP8GLvy
 3FEKLjp5yWLhoxX38xse+heJW2rDL3w=
X-Proofpoint-GUID: -eaDOk-jHSzKY4JC3UrHITAcFyHRV4Zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NiBTYWx0ZWRfX8r1vrmID5jhX
 bUNLsZMgIPIItm+8P0Z+ARpPsARPxP4JQKwGBUrtfkBPvcCYjwZAVJWtDxWCVgZvaXFG6LvJsfx
 pW1cowscquXdiedT4b1EcDjSzlDL0CkhxnPqSsF3zwfQKhDma2ewjR0evuXd8KmISkIUtfp3t8C
 7UqE7t3IpGwE0ZSUIKWo8SXE6MLqhFAlcSINH5LwVWsqCEDKow73bJ06g64EkfmCILkZ0OppSHv
 YCCXP6/v8YZgMcZnQWPlHjap6GkBlSu3Po6Uf4RnRBEN+TK5wb/w8QNZxbbqgcIujqHEPRJzFtB
 org0IFqciG/54cvB7GRv/wI+rgUY3vEletD+yRA1rHXmMmikhnlboQDyfjy2F3480VLDAtEXX7E
 dyDFQHMhqgDyXMD7CBQ/tvgwomKk5rs6aWYnAaGrwSNx/pzQ0zkTnfJEGilOiP1jJQ7QJswK1Sv
 43PVnEJ/7CFRp0WQDfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_113412_930750_19E3A195 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Add spi-max-post-config-frequency-hz, a generic property for SPI
peripherals that operate at two distinct clock rates: a conservative
rate always reachable without controller configuration, and a higher
rate achievable only after controller-side configuration.

When both properties are present, spi-max-frequency gives the
conservative pre-configuration rate and spi-max-post-config-frequency-hz
gives the higher post-configuration target.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 .../devicetree/bindings/spi/spi-peripheral-props.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
index 880a9f624566..84976fd3ee1b 100644
--- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
@@ -45,6 +45,12 @@ properties:
     description:
       Maximum SPI clocking speed of the device in Hz.
 
+  spi-max-post-config-frequency-hz:
+    maxItems: 1
+    description:
+      Maximum SPI clock frequency in Hz achievable after controller-side
+      configuration.
+
   spi-cs-setup-delay-ns:
     description:
       Delay in nanoseconds to be introduced by the controller after CS is
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
