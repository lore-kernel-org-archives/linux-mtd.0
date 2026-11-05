Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB22606D80D
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 11:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E56XkId3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=MvjPAsDd;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-ticloud-onmicrosoft-com header.b=ABMo2VWd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pF+myYQR2SuMhou+CParerWRBEfEcTL+rCbZUhQqyE0=; b=E56XkId3eqDyhQNte4/QFFKxuj
	CyFB3mU6gprbZIg1620bHboZUMDP0cr20xeWRgXOjuwb5VZLRs44qV2gQGVez7ktAB19w9UUljWYJ
	N27lVYVDG9eZK7xHGCOc3IihI/FcEIoi1DNpmJQNcBDlUOG+EckpWD6YuwzohyHe4BfqMzXIAGWyb
	oG50Gir3qFLE4OlrtiUj6CEAxn27/tj2DArPkCkPkEhkXSp6eoZ0x2ffSX06l14dmmIFX8YXOkLPf
	zB2PiYHtwZC3EYQulBmm6eLmCO/5PqYAXSlLCeKLCYMaxzQU5A70Glxb68WOj0EtkU+LPZHLh6QK9
	SvqTM2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDO-00000008Xjs-0BCX;
	Thu, 05 Nov 2026 11:01:06 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDK-00000008Xh6-2lwX
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 11:01:04 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6A59wHFm2215005;
	Thu, 5 Nov 2026 05:00:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5OZStetgEhushnCES+Z+W+Wx5X66+zUHSL68iGjnN
	h0=; b=MvjPAsDdw2n83jMFiagtnI7S4DU2j5AsjZuYHM0OWPIMCaD9Os6swBBYO
	L04XSQcW1LYAEig7NMhRTSD+0jElbuVH6PMS0/WfyxvA2AIMfsZs1y5bijLxH3mc
	Qz8uoPa10WiGLBR9koLf1AaOTx/lOHgBNJHO3cdEpTVmfbsv00GAlPeiX0mmKjic
	kX116p7cQuNfOEUfecv3AlzRYfeKhzA7h4YwakJgoitOKdmthS7NIrRXrC70s8RZ
	HJBuSdiQxIFuPDEzxTYVbEdKbmxTBS+I3MZh16kmt++iIAR3R9/0oCzlBSR8YO4k
	ALnmb4VReDVZK/kciQ6dQVALAs4KA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010007.outbound.protection.outlook.com [52.101.193.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hrgp9k23x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 05:00:54 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAA8cUMuNp7cBYwiToB9/U0NXwBfAAhbFaZC8LRzu+o982gknWGOYF1/cjA8f2rPklcDvUo8bLH3O0pjQUsYLtBxiUk6SPuJ27JVnycxbXp0fBKcBomtu1suS1h+RM48ThmZf7BosU+2rIWSWFSg7TurvpWJCwa2nLcB1k5KSL3t0NnNDb3bLp1qoYdCkt/mM0P66BLVghkWfsKGuqciUgNklSngKMlQbTQUX8T0Z/FlwX0XHtqeQ/gScQchH9+HpBh3ulsnX9kVBrCEfoRwljf9sW/BdwlPr0/CH2Qvsut4mhDnxr1NiJbpSbXyDw2RL8J9kKgJlgqBEyRCiq6dlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OZStetgEhushnCES+Z+W+Wx5X66+zUHSL68iGjnNh0=;
 b=kkRLZ5gJO1VjVOdokcN6eZswVxR5LSnrMKDJGcuIbcFZbmNh73onJgp+2AZElLUNL5Uq0kf3Y505lTH+fQ2gAaNQNZZxrF+hwnmkbPAgLDPIeX5D1TjzFOO5jg/NALxcc1hTJhqwHFYBcYtdP4OvHslXDLQy4qY3zzMdtuINC1y081Kw9T5QglLQbSrWucuup8uyeEJS0XzGgeN9/5tDggw4XM+J6TWYQW6t0XJh1NqjHcjCZ+OdHzae6Y3AGLT9w9RmtKlKmucAlDbw6e2SKN51l1zre5t/qUFftj1lsJOmVwS9lrA+Pc9opUK0BDNASAhz29joenqxndlivcxNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=amd.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OZStetgEhushnCES+Z+W+Wx5X66+zUHSL68iGjnNh0=;
 b=ABMo2VWdgatlB3qfAMF6C74EQhCyABO4mgFhB1pUaVWO9CLypYaOusfHfcagNsJ5X0crNsy1W3l9yRNKWNlIZSMuVXpzvmfdVi3BCQxkFxPT6scfJER7qbORDF1MH9y+8S3i0leBgkjvFMiQYgLbeM5NM8SkwZv6xa0utymCQC0=
Received: from BN9PR03CA0398.namprd03.prod.outlook.com (2603:10b6:408:111::13)
 by MN2PR10MB4221.namprd10.prod.outlook.com (2603:10b6:208:1d7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 11:00:52 +0000
Received: from BN1PEPF00018071.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::65) by BN9PR03CA0398.outlook.office365.com
 (2603:10b6:408:111::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 11:00:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00018071.mail.protection.outlook.com (10.167.245.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 11:00:52 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 05:00:29 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 05:00:29 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 5 Nov 2026 05:00:29 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A5Awg2Q4171076;
	Thu, 5 Nov 2026 05:00:24 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <srikanth.boyapally@amd.com>, <m-shah@ti.com>, <s-k6@ti.com>
Subject: [PATCH v11 18/19] mtd: spi-nor: run controller optimization before dirmap creation
Date: Thu, 5 Nov 2026 16:28:31 +0530
Message-ID: <20261105105832.2134313-19-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105105832.2134313-1-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018071:EE_|MN2PR10MB4221:EE_
X-MS-Office365-Filtering-Correlation-Id: 81005821-aab1-49a2-3968-08df3b2c0ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|7416014|3023799007|10067099003|6133799003|22082099003|18002099003|921020|261022105027099003|56012099006|261021121427099003|261102123227099003|261026140227099003|261028144727099003|261009223027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: CqgmgxtccKzTPs/0isjLXkz2+SJkN3K71hQouSCK7foy5O5IYFVeF03r/cS5SWE8LmoNEIo5Q4kPX+g2yj61Lx/gnIv9wgz1vubJsgUuMxU1JMiRxaoNuWfaf79M1R0iCJrCSJIOhQjf0DwkXe99lyzTTYWxDXO1VriCLZ0BEJYPpG+o7MTnpkQIRrO4FfQgDeiPSrKjIeaw7flURtJ3gpNNKf43B4iW22HHReDUH/Y8mUhI0f5MYz4b+7r6zGw1xfhf2K5EUP+ckqSSBS4LD84e9L8EPvfBnHhC8lAM4HDfqjQgsRPzirgtp142OUZN4nDnJtMwX09GIeGO6Bhg7Vmfdxchsup1A04NBd+kXDo86ealKWLmRDSZ+j4cCaG+NwkFHmoGvdB5LDl6pP7ilFIIb72oqmzLAuqXh/F6bdfDjpNVsUzs+pYx5GHh+1j9DIty3LGXGZtzGgA8if9cZ1RtJuxy65S/12OH9fzYlTR21rl0lhFsJxPXkWCl9j3rkcDkbt07jHPZX7C9w+hL23xqTUwEzK4rPc7y6B+SRZDYugDAYVxXCu/Z4fndJkLb+QSweLh1S7Wo+rsDVqNSK7X6tpznPmL8n//sDG71JMD0neAVmInsqAL9z6TZm3+EwCwJEoWzIWjkqtz5Oi4btxiVOGXX3v4pyRCmT+qBLRs65BOBvCrmA6hvZCEkXxUtJkjHWODrrcARi9myK1SOWS8m+D03aO8qCto8bLdLwv4=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(7416014)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003)(921020)(261022105027099003)(56012099006)(261021121427099003)(261102123227099003)(261026140227099003)(261028144727099003)(261009223027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N/wxX7lrtVrRavePlden7NkG7lTTyng4TXGbUeEs06c/LmKgXBl7iWZIqvHd8+fGZZLz3d2oT+VOCDTlmhyb7Sf1msZf5VfpJSzU3M7GxCtRp/n7J6SlIoL0o55hAJ7g8AjBJBZfRyZfdrxL4HAfH+AF4mFuffHPtjPROUd9rG+PytWlTApDvwGYIYgfiX48nJWaAAAHau5JEkcL3MTDgo3HXCZdZyBA9iT1Godk/2/3fL+G0/StSo+L9h21cPYYBcI89zVybBxmzMZC02FNa+UxBDXXAfEX650xZCqdJQHwSn/bOT3xpNfsFdDTVURNdJLeHs6It9qgcM944zHO+bjc0KWw52t9sp23+KQ2ruSA0A0yFeJGBmcfOkcUB/XXC+AZzsLKz1xvINkftKiQhQ+RJJHeIvCykNGVj3E6OXwJRt9/HAcSyEczwGz+qGxa
X-Exchange-RoutingPolicyChecked: xG83GptRAU7Nr3XT/7L6d3nwRZ+9+nwUoSd+rj2+2QWX75Dz5qE9HwBp2Ei6MZR6JYINmuc8/0KC0s3+PLZ8GdWk+934dZF9b8CeZFUtWcqItTbHARxVlbkAMI2aH1jTIbg6MbyvXqgBG5gnhbZyBW+ZDRRXBwbodid51J/aw4Pf449sSLuBTuZcWIUAlzLjuADUtFzMJDD2GsJeOP49Rct0JUBrhFrxhX22FAtECb3hXfpWlKk1hvrPhCxPRzGgxuFCp50a9hXLU+UD6fZxoaDuNUZGCQq3ry1ijfBtPZ/vZ3pOBHrVIBpeUh9b656TZvyLHreG8Srz+3bgLEFxeg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:00:52.0923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81005821-aab1-49a2-3968-08df3b2c0ec3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4221
X-Proofpoint-ORIG-GUID: mPoThWjk5bGVMv48993ZA1f-VjJDBEC2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfX4J7aoKh2W/1g
 MZQE6tPL/KNr4E97WxXJdVQGi2q9Axc/h7A9uyhHZm2mcSDdyyRuxe8xPDzDiQzeSLrhwLY5Y8A
 rSSO9cJGkkl+1kwYG6cC4FLq2B418KY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MyBTYWx0ZWRfXyZmnLmhlocg6
 PJS/XopsBWTolS/nefIRf6i5UHgk1NXzq3Y8C41Rp2rw4sq+bk+mNiTivavUUvTdOyXR0RE5Ucy
 8Uz3/FZO+KW0QWdUOZFZXq+dZIzdnx5pVUKkpaOqe/Kxgs4lcjCf2QB4GR+CDhAPDVqDi9kDhYE
 dhRED6Jw96WJC6PVYg0xWIdhgsSMXmqSLQwAoMohhk20Mg6ZSqALZ7nTWu/ZmrRzivjXOExDShK
 88MeJC8WT8cqpzi4jviIu2r+hgjTPbr30w+S9rc3wyF1gSqgwtYsh1BxK/LWMPCwjYJfeOS+eqY
 UXNdEsGKensivOjYxQX5jGo7jxGbwrnorOMTrzC0TRhA+zyaqQjK0jewmiN1z/FFwwnoR66ws2S
 u/kFVXUVpxdcuN/kidn/9HUPtWNnA50v+vuZLQTCgVzKBnje48YjgnbMac89kE0R4hNnnPHeHvz
 /4o3ccVWW9pFhlSVBOg==
X-Authority-Analysis: v=2.4 cv=D+jSufRj c=1 sm=1 tr=0 ts=6aec61e6 cx=c_pps
 a=4LksaTFCu4UF49iUfNHgJg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=zd2uoN0lAAAA:8 a=sozttTNsAAAA:8
 a=3Zgdyr-LJFxGGd3ZCiwA:9
X-Proofpoint-GUID: mPoThWjk5bGVMv48993ZA1f-VjJDBEC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030102_741039_0027143B 
X-CRM114-Status: GOOD (  14.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Run controller optimization in spi_nor_probe() before creating dirmaps
so the validated frequency is available at dirmap construction time.

Store the configured read op template in nor->max_read_op and pass it
to spi_mem_execute_tuning(). On success the controller sets
max_read_op.max_freq to the calibrated rate.

spi_nor_spimem_get_read_op() propagates nor->max_read_op.max_freq into
an op only when that op's protocol shape (cmd/addr/data buswidth,
addr.nbytes, DTR-ness) still matches what was actually tuned. Callers
such as spi_nor_otp_read_secr() temporarily swap in a different
read_opcode/read_proto/read_dummy to read a security register; without
this check, the calibrated frequency would be applied to that unrelated,
uncalibrated protocol and could corrupt the read. Ops matching the tuned
shape -- the dirmap template and regular reads -- still get the
validated frequency automatically.

Optimization failure is non-fatal; the device operates at the
conservative base rate.

Tested-by: Srikanth Boyapally <srikanth.boyapally@amd.com>
Tested-by: Moteen Shah <m-shah@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/mtd/spi-nor/core.c  | 28 ++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d114d828a788..4597f07a207f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -217,6 +217,23 @@ static struct spi_mem_op spi_nor_spimem_get_read_op(struct spi_nor *nor)
 	if (spi_nor_protocol_is_dtr(nor->read_proto))
 		op.dummy.nbytes *= 2;
 
+	/*
+	 * Propagate the validated frequency only if this op still has the
+	 * same protocol shape as the one that was actually tuned. Callers
+	 * such as spi_nor_otp_read_secr() temporarily swap in a different
+	 * read_opcode/read_proto/read_dummy; applying the high-speed
+	 * calibrated frequency to that unrelated protocol would run it too
+	 * fast for its own (uncalibrated) timing.
+	 */
+	if (op.cmd.buswidth == nor->max_read_op.cmd.buswidth &&
+	    op.cmd.dtr == nor->max_read_op.cmd.dtr &&
+	    op.addr.nbytes == nor->max_read_op.addr.nbytes &&
+	    op.addr.buswidth == nor->max_read_op.addr.buswidth &&
+	    op.addr.dtr == nor->max_read_op.addr.dtr &&
+	    op.data.buswidth == nor->max_read_op.data.buswidth &&
+	    op.data.dtr == nor->max_read_op.data.dtr)
+		op.max_freq = nor->max_read_op.max_freq;
+
 	return op;
 }
 
@@ -3622,6 +3639,17 @@ static int spi_nor_probe(struct spi_mem *spimem)
 			return -ENOMEM;
 	}
 
+	/*
+	 * Populate the persistent template and run PHY tuning before dirmap
+	 * creation so the validated frequency feeds into the dirmap op.
+	 * Tuning failure is non-fatal; the device operates at base speed.
+	 */
+	nor->max_read_op = spi_nor_spimem_get_read_op(nor);
+
+	ret = spi_mem_execute_tuning(spimem, &nor->max_read_op, NULL);
+	if (ret && ret != -EOPNOTSUPP)
+		dev_dbg(dev, "Controller optimization failed: %d\n", ret);
+
 	ret = spi_nor_create_read_dirmap(nor);
 	if (ret)
 		return ret;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3e3c6b10186..1f8aff53a2a8 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -374,6 +374,8 @@ struct spi_nor_flash_parameter;
  *                      settings that can be overwritten by the spi_nor_fixups
  *                      hooks, or dynamically when parsing the SFDP tables.
  * @dirmap:		pointers to struct spi_mem_dirmap_desc for reads/writes.
+ * @max_read_op:	persistent read op template updated by execute_tuning
+ *			with the validated operating speed.
  * @priv:		pointer to the private data
  */
 struct spi_nor {
@@ -416,6 +418,8 @@ struct spi_nor {
 		struct spi_mem_dirmap_desc *wdesc;
 	} dirmap;
 
+	struct spi_mem_op max_read_op;
+
 	void *priv;
 };
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
