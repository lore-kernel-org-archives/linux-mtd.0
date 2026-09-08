Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD7CC79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFfBYsF1hKvc9jf6XTN8N3OOHbXPQaXH95jYiyYmc+o=; b=HZEF6Om8M+mmI0
	luLpiapyDWUJIvqYyWwbvEm2VZmJDTf3zm4SfzmPIAnNMOiDwb97CLTANq79pepXvMSpqVP//t8sq
	OYRgN00DWapuHPrWs3z3mHwAdJfku+Y+4khxLp0AnDumxWKcOZRiLt2Mn4pyB2ZktXaK0JJkNE/IP
	tnqQVihO7rMQYfnU7pzxMZoytyUDaSXRQtZySkEPXfSggdBY98MWAwH+3iewgaySlUvtFHC3GhLrx
	B+c7Bd8GzBTSkkuv7CevFnUqXQeP1jCpWoZ6BAyGXaqkCFga+9kaefDNbx8cVENvHR9IqKp0jPlR9
	vNohT0tirUQd81umIJTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vfl-0000000980S-2BLF;
	Tue, 08 Sep 2026 13:15:37 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vfi-000000097yf-07Ph
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 13:15:35 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Con9E1605204;
	Tue, 8 Sep 2026 08:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=aA7Th7lzUdMDJFs7Uye49ulVRSIpHBW/yFevIPT52
	NY=; b=Rvq5f/lrTK05pNPPrBBzHdOeZ+1XJYzX63U5naOyg75EAKMDDRH4lEvm7
	MqtYMwEeJqsCg2nFWfrfNsbopS5IzBbOpo9Om/4Uwp6JmHJEinJW3OFLljPgX3X1
	KVsYXG7O6vnHLLdkn9+GihYPSq/rr9BzKSvyaIJyBpRQfgP2ZIxnKuBFheDDRGW6
	hF+vI+EYvHmd2S8LBql3xCG73VCucuh9GinWdJlEh7qesf+RKyWNcLLPIOLS9PDv
	1v8lhbzpCL3kVn6bpixjFSfHz+/pWWrx71qRho3xRAaBtM0yhEOpiy6Zh5CzTel0
	amu4EEP+lF2Cnu/dQsp+frFORQzWg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj940k5rn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 08:15:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFmYI88gkQoqGR8w3SYCUrYFTVpk22B3s7UqgCyUBE4dFe85akZFbb4EexJHWT6wkaPQm7FZcJ9EpoyFACM8f6iS9YUZVOmKlzMKLE1/GZJbhz4wgMRd88+749+c6Pf2bYZ/qjQHc8udZcO+ou93oqRyctpIucoHjeED4l3iJh58yG2OofgdIJNiDILcfGaWYvzHDbHnDAcQPG4pUDHvViAM4l1rmMcG0bmI4LLPbAoyc4B/NO3ZnOF6f0aXvoHaHSp8WJasxnIcuaO6AqBHzmXRHSGupzpTpJNh1tDsJMcYxXQGBQfbpO9t3wUP3H+JMrHsRoE8yMdThc4lMLxWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aA7Th7lzUdMDJFs7Uye49ulVRSIpHBW/yFevIPT52NY=;
 b=ucwqIYvE5Q6XHI5rVdpQ+sYEQrvUNv0zWCQgoAz4K8mDcC7Fg3WnIGA8UD6lLSDvutBFXRVNIge0Dw7tV24EEhrxqUYEa0gjNhZH+kPPYB44h7msd05dGXmOd6s/IhK0ILinxqWTflDiV6Q0WwvKjCgTy+k5WMLe+DFtNEyl+fCpJfTnMfXltdgfoEP8fUy4jLsbBuWnV+oI0l4m+n6go0JOqnzEUJYueCu8NtXzaSjZK+WI0JEASY2SLnfW2hehMyTF4EzOr+/q+wMAJhTp4ozoOSHiZFi8P4EATlpKsuM0vs3o9xpJs/m7+176gG4LXX1spPn2nTOC9dLXBmpaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aA7Th7lzUdMDJFs7Uye49ulVRSIpHBW/yFevIPT52NY=;
 b=a8qAbSEeGRP2+tIPuvYoqmRGH7/7THhjqN1U6F2/xJoMackoc1lEZ3ZvrLjOBLKfsRKfjUYUXaSq1Mn3eyGbC37oDX+AvS85DyKKlKtRRn4UKocHKqUgzAlSX6ZZ0xlkOn2K49IfcfPr5m8E8sUHG0kaItKCAk5TadOA9VW7sZM=
Received: from CH2PR14CA0055.namprd14.prod.outlook.com (2603:10b6:610:56::35)
 by SJ2PR10MB7037.namprd10.prod.outlook.com (2603:10b6:a03:4c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 13:15:15 +0000
Received: from BN2PEPF0000A98E.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::37) by CH2PR14CA0055.outlook.office365.com
 (2603:10b6:610:56::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 13:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF0000A98E.mail.protection.outlook.com (10.167.248.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 13:15:13 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 08:14:19 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 08:14:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 08:14:19 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688DEE8t2519261;
	Tue, 8 Sep 2026 08:14:14 -0500
Message-ID: <693550b9-a1fb-4732-b6ab-b06fd6b11423@ti.com>
Date: Tue, 8 Sep 2026 18:44:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 16/18] mtd: spinand: negotiate optimal controller
 operating point before dirmap creation
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
        <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <praneeth@ti.com>,
        <sebin.francis@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>,
        <s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
 <20260825171737.776052-17-s-k6@ti.com> <8733vp0yuv.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <8733vp0yuv.fsf@bootlin.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98E:EE_|SJ2PR10MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 49ae45ec-1d33-47d5-babc-08df0dab3784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|36860700016|82310400026|1800799024|376014|10067099003|6133799003|18002099003|22082099003|56012099006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: Ck0dsl1+zcu0TE9ZFj/nIM3ZfvKgiUy/SlsF2n1SDA7qppGF07oxJXunCgG/BMEHZThgcu3Q2P1hUZV6ZuMAWcFbEm+fi+o6qFpz0Z//7suOuC+hbRs+jn5upn4Clc4pJaw0uOUo+CzXVJyIJ3/byvVXwoaZagll6iL5MDBNSvNfLsakUZ7/YFG49Ik1xx1LpnRCz7Wt2o7xRlLZZZRcBaKPqFHGar4d88VyucLo6hFdde2OImHEiyGZ5trkw4ZjDl44HlGC9doU5baAtiIAphMKxmqqer028QTYxQgMO4lOkdgWikchvfL3L4l7JTd87YTjwGiQCI4YJ1TR2MWhhJjRMQAcZJnVI2iyh5QMfKK8EUAZCmwxldellfKlrfZtXj+bZaCXcULxIpWdy1MTc/3Gt3IuFv7iBl7zolNp+/NMCKPk58zHXNE6z2xs4RCziVbM9FsdntWQP9Fh8bGhFHc3SFgWPnca6UOLEl3ITVUeKLtTsYiCaVYhMFWfoGivKS70YPbWtJ983VKb+J1JgYfKENm6gw8HQ53W9u3M/KYbNVEzo//oty2ZfwIvbrER5+LepGpux6SvpE3do8i2vDhqFjjRH2fsCWSrklOzEobUHcB1GcRUiPMQfF1by0lZUPfk0Wm4q9+Ncf5khyhIbENRldLCzEID1PorhzTfPbj9Y+Mv92GxcbLG/Js612Yne7Eeki/oSYU8hhXEArW21g==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(6133799003)(18002099003)(22082099003)(56012099006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ek36LFRJcK6iJ2wjrPwX3Ojcgi3eJwy00KEheTEDzX57Udf2IE3Og+8VoSdiHQnnm4kM9ibKx/LRvzc9emPT4A1pxag6pfkzesj+vQQ36D92lft0EcS0E4K184UuZmftuo1P6wHJylFz/V2ljSQXNAfuQuy3w2MzSqnZIbcAalSJ3ZmngUa0XElb6BP/cnIU+OWg3Mm1Bg4DqEo7wzf3Y0sl0yZhtrH4h+WhhL5wcaRw6SYqJTYY7fjrXCj8xJU8I1EFdUvPgSBxTacU3jdhEN5XQFpDw0kmLxNTA4PF4jl/T2A6Ze5zGgqHc0HEbfVXZ70sUd35Uoxc61b/ilcy9oYoYQcVoBMa0Ti+mBVpVdJKGryAoRAvhU02l9giXEwHSLZNrO82e1Qo4jq4fR1t6EK1XXl3kHZdeqtPdgOd3VCfRCMTrvtUc/X0k0A9EhOk
X-Exchange-RoutingPolicyChecked: W+M2UCmgaESC/fgReT3bs5fi5OtiDoyfrsXzcEgLkMzoMMWbCnYG03JbgnuL5qQ9/Fz3CyhLM+TCF2Fx1cmjzAnCMDBfSK8XtgJNO2ZTOn4hk7VJowhoInUJj3wvVX+NfAUP7ooYgwNbNVgA49fbD06lCp8XOHyFqx0jzaRo2HSVepGoLSoHaNAZe7+lvnfBT9qtFmzzqkMM1Cr/9diedlD2ERSUEdvrE/6Hq/T9gJXqeaDerbHUY3xqv7hI/HxlIEIS4QPj4D/MCz+ReeTaK9bWptl5MKW0ysdBN/w6kGafafU7ykyEq57BsT9aJr3YBB0xuD7dpBHLzmwviiNh+g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 13:15:13.0748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49ae45ec-1d33-47d5-babc-08df0dab3784
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A98E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7037
X-Proofpoint-ORIG-GUID: fRFXX3AUFbTQhVhaplfsS9D-UdTQWnB7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MiBTYWx0ZWRfX0eAZ4wuFo+zf
 /x94jgps9Ue/SKFEU5YQn+dnUDZ8cpHNkFGKu3zOfKUmC1rn31BzdegIHTp5OQmYbdexIG8KzBP
 Bw27yqMpvoduGIb3PsWdZN5SlB4ea7LaTJJ5xAFxeOI+EAhR7NXSxbu6kz1XXcWabFk5iKUtEzj
 JdqQK5dN+L9xZ3LF4IYfNJQKz39dqmFFTbNCA5MZQcwxAIx+vLtcdBY7RPC2KrDr1tdqRpcj8GV
 G15a6piUbCNolPgnNFk9C0Ycr7+lsaJZPdIwqtgUx0tKsISODhiaLT2X282J8/mjLREqWLOf7YF
 zeNwjrNvibHcUnZOBMyVEhpQsUpaa8x7mdPh4FBeAfg9b79PZFRu0Fql5y39eajZyswXRYA2sNX
 POaubsFTgjxb38AFPWY731JQ6hTnMPb5xZ5wZKrOfCBVDnuLB3N9OAWZk7ESb+0bd4pah/TExnp
 zj4i2alEQmxwP0CDkaw==
X-Authority-Analysis: v=2.4 cv=UrNT8ewB c=1 sm=1 tr=0 ts=6aa00a6e cx=c_pps
 a=3isWwmYGSdluMw1j68YAZQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=P-IC7800AAAA:8 a=_5h-cKRuB_vkGlxcQI4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: fRFXX3AUFbTQhVhaplfsS9D-UdTQWnB7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MiBTYWx0ZWRfX7fi/ZCuV+Jh4
 lPaxt0J3uyC9iZu05q0swElcDiuTOf7PdCImi+fT8g0KtbF1yOudBjx46519SFkufjD6FCtOYJ/
 Geqk/480NbEt5TcWSc38DS+MBrkbumU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_061534_187635_CF1CC0C1 
X-CRM114-Status: GOOD (  15.15  )
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

SGVsbG8gTWlxdWVsLAoKT24gMDQvMDkvMjYgMjE6NTMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGVsbG8gU2FudGhvc2gsCj4gCj4+ICtzdGF0aWMgYm9vbCBzcGluYW5kX3RyeV9yYW5rZWRfdmFy
aWFudChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4+ICsJCQkJICAgICAgIHN0cnVj
dCBzcGlfbWVtICptZW0sCj4+ICsJCQkJICAgICAgIGVudW0gc3BpbmFuZF9idXNfaW50ZXJmYWNl
IGlmYWNlLAo+PiArCQkJCSAgICAgICB1MzIgKnRyaWVkX21hc2spCj4+ICt7Cj4+ICsJY29uc3Qg
c3RydWN0IHNwaW5hbmRfb3BfdmFyaWFudHMgKnZhcmlhbnRzID0gc3BpbmFuZC0+YWxsX3JlYWRf
dmFyaWFudHM7Cj4+ICsJc3RydWN0IHNwaW5hbmRfbWVtX29wcyAqdGVtcGxhdGVzID0gaWZhY2Ug
PT0gT0RUUiA/Cj4+ICsJCSZzcGluYW5kLT5vZHRyX29wX3RlbXBsYXRlcyA6ICZzcGluYW5kLT5z
c2RyX29wX3RlbXBsYXRlczsKPj4gKwljb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqYmVzdDsKPj4g
KwlpbnQgcmV0Owo+PiArCj4+ICsJaWYgKCF2YXJpYW50cykKPj4gKwkJcmV0dXJuIGZhbHNlOwo+
PiArCj4+ICsJd2hpbGUgKChiZXN0ID0gc3BpbmFuZF9vcF9maW5kX2Jlc3RfdmFyaWFudChzcGlu
YW5kLCB2YXJpYW50cywgaWZhY2UsCj4+ICsJCQkJCQkgICAgKnRyaWVkX21hc2ssIE5VTEwpKSkg
ewo+PiArCQkqdHJpZWRfbWFzayB8PSBCSVQoYmVzdCAtIHZhcmlhbnRzLT5vcHMpOwo+PiArCQlz
cGluYW5kLT5tYXhfcmVhZF9vcCA9ICpiZXN0Owo+PiArCQlzcGluYW5kLT5tYXhfcmVhZF9vcC5t
YXhfZnJlcSA9IDA7Cj4+ICsJCXNwaW5hbmQtPm1heF93cml0ZV9vcC5tYXhfZnJlcSA9IDA7Cj4+
ICsJCXJldCA9IHNwaV9tZW1fZXhlY3V0ZV90dW5pbmcobWVtLCAmc3BpbmFuZC0+bWF4X3JlYWRf
b3AsCj4+ICsJCQkJCSAgICAgJnNwaW5hbmQtPm1heF93cml0ZV9vcCk7Cj4+ICsJCWlmIChyZXQg
JiYgcmV0ICE9IC1FT1BOT1RTVVBQKQo+PiArCQkJZGV2X2RiZygmbWVtLT5zcGktPmRldiwgIiVz
IG9wdGltaXphdGlvbiBmYWlsZWQ6ICVkXG4iLAo+PiArCQkJCWlmYWNlID09IE9EVFIgPyAiT0RU
UiIgOiAiU1NEUiIsIHJldCk7Cj4+ICsJCWlmICghcmV0ICYmIHNwaW5hbmQtPm1heF9yZWFkX29w
Lm1heF9mcmVxKSB7Cj4+ICsJCQl0ZW1wbGF0ZXMtPnJlYWRfY2FjaGUgPSBiZXN0Owo+PiArCQkJ
aWYgKHNwaW5hbmQtPmFsbF9jb250X3JlYWRfdmFyaWFudHMpIHsKPj4gKwkJCQl0ZW1wbGF0ZXMt
PmNvbnRfcmVhZF9jYWNoZSA9Cj4+ICsJCQkJCXNwaW5hbmRfZmluZF9jb250X3JlYWRfdmFyaWFu
dChzcGluYW5kLCBiZXN0LCBpZmFjZSk7Cj4+ICsJCQkJc3BpbmFuZC0+Y29udF9yZWFkX3Bvc3Np
YmxlID0KPj4gKwkJCQkJISF0ZW1wbGF0ZXMtPmNvbnRfcmVhZF9jYWNoZTsKPiAKPiBJIGJlbGll
dmUgeW91IGFsbW9zdCBhZGRyZXNzZWQgdGhlIGNvbmNlcm5zIHJhaXNlZCBpbiB2NyBhYm91dAo+
IGNvbnRfcmVhZF9wb3NzaWJsZSwgZXhjZXB0IHdoYXQgeW91IGRvIGhlcmUgaXMgc3RpbGwgYSBi
aXQgZGFuZ2Vyb3VzCj4gc2luY2UgeW91IGNvdWxkIHJlLWVuYWJsZSBjb250aW51b3VzIHJlYWRz
IG9uIG5vX2NzX2Fzc2VydGlvbiBjYXBhYmxlCj4gY29udHJvbGxlcnMuIEkgYmVsaWV2ZSB5b3Ug
c2hvdWxkIGNsZWFyIHRoZSBmbGFnIG9ubHksIG5ldmVyIHJpc2sgdG8gc2V0Cj4gaXQsIHNvbWV0
aGluZyBsaWtlOgo+IAo+IGlmICghdGVtcGxhdGVzLT5jb250X3JlYWRfY2FjaGUpCj4gICAgICBz
cGluYW5kLT5jb250X3JlYWRfcG9zc2libGUgPSBmYWxzZTsKPiAKPiBXaXRoIHRoaXMgZml4ZWQs
Cj4gCj4gUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5j
b20+CgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpGaXhlZCBhcyB5b3Ugc3VnZ2VzdGVkIC0g
c3BpbmFuZF90cnlfcmFua2VkX3ZhcmlhbnQoKSBub3cgb25seSBjbGVhcnMKY29udF9yZWFkX3Bv
c3NpYmxlIHdoZW4gdGhlIG5ld2x5IHNlbGVjdGVkIHZhcmlhbnQgaGFzIG5vIG1hdGNoaW5nCmNv
bnRfcmVhZCBjb3VudGVycGFydDsgV2lsbCBjYXJyeSB0aGlzIGludG8gdjEwIGFsb25nIHdpdGgg
dGhlIG90aGVyCmZpeGVzLgoKVGhhbmtzLApTYW50aG9zaC4KCj4gCj4gSSBiZWxpZXZlIEkgd2ls
bCB0YWtlIHRoaXMgcGF0Y2ggb25seSBhZnRlciBNYXJrIHRha2VzIHRoZSBiYXRjaCBiZWZvcmUs
Cj4gd2hpY2ggbG9va3MgbW9zdGx5IGdvb2QgZm9yIG15IG5vbi1zcGktZXhwZXJ0IGV5ZXMuIEVp
dGhlciBNYXJrIHNoYXJlcwo+IGFuIGltbXV0YWJsZSB0YWcsIG9yIEkgd2FpdCBvbmUgY3ljbGUu
Cj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
