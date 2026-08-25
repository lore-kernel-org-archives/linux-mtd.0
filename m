Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725EDC61DBD
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=irC2gJGZJeiwM3nqFm0CZMEnkqwkTPMzH8lZczel3Sg=; b=MLdQtftw47oAVY
	NaVzqWAvhQMzvypMfR9Jv0lqMloQmSyHfJTRiwCYAfgvqTNSLgCl8eKh2pU1vsPcUH4Vh5GDtqCuO
	XQ3MW3JV3OBy5UoWSh/uiY8ULjNKr9pcUrR0x4mfSEV/PIaImw5UzVqVtwCHPxGyJBFEuQ62Bei1D
	z98nByej1hjGyfuD3sYN0hTAHf3+M7j5MM11F7d6MqiNQD/N3C6rIJQXLQAoIUJ/PKLJQ6ZDM/Trm
	6Jc568dcNFPj/wPROinTh9XQDc6e0acz7zYEHesJ7/HUZldRGhixQjQ3qcSBKOUmnGZbT6CqSbtQ5
	3DbzaafiwAa/5moSoDwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyunU-00000001BZ3-31u3;
	Tue, 25 Aug 2026 17:18:52 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyunR-00000001BWl-3JYG
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 17:18:51 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67PEVZDS1165228;
	Tue, 25 Aug 2026 12:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WqKbKD/soeFcbh1lJqjJKm2uSOxeSrqp7jeBsCY4k
	UY=; b=ol9fwn9wHrAyH6gTNXbNw5A4at4dFniXLqB45fbVvb98jiLl1o1SQNfNE
	rKv+f7NIGCeqviRVyxD+ph4sMkYt3oJdDoY8RJUJbwUCnFWPY6GsHnnzxuMOFPje
	4MuFVVpol8DieuceE8CfZZfkAMPADox2Z8l8oRHQPjD/oYRNb0NMGSkvH3kFzOmc
	iaJakVjpuWuq/sDO554LbTbgyUmkHrx1r9pgZ2nSF6b80ltew3PeSW6yY7a+e98A
	orH18UC9kWuObNl5saXp93/2plpKgcaoDdY2jOh8zrmRFEilqmloA4k98Uc+3C7k
	JEN9wEWFh1XdDyKLXoXIiAMysU6CA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011015.outbound.protection.outlook.com [52.101.57.15])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g91sxmjhr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 12:18:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay9pOWtonVpKD4OYMjCfIp/LgE8E0eYoFAl7NMU4bRlZ/K33Slq1gttfc/hUNls25qh25s0K1UoMitD65uZcLpArb0LfC8n4iLChj4X7IH8XPvHu2BwwUBfZbPcOdCUte1G18WdAaoi1dDA0BQGCrX8N88tr9sTvXajO7VCGkypCBsgQz1sHyXt6xQzX+QhkowOIWKQDC4tq0/wwVhOPy8/hXhkN7DzPrYyBiUmlsZSF9h9mTVmGBSsQEvgTVPFoj6KU+rJms3NVvJ65zgIVh5iCW0oFCaT4bM9kDC33jsR3n+u0P3iTep2ovIniDkxL5wZXCIaq6Wfvk77sJ4bT7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqKbKD/soeFcbh1lJqjJKm2uSOxeSrqp7jeBsCY4kUY=;
 b=n7JvM7M3a9Fx3WdBQRY99NhjiJFY9TJIuPCUnNHtzomtyhDqDND5MqwoP/r9sUTd4I28XRqcyg8MVFJMHmbun+PsVg7mVkPJdlvhs2MZkhJs9JreXutFkpcIW+C26cc8qPv4fbOLW+45ELYmbqSYHTZRSxVa4NhxW8+W1RWKIvXY9/2uWL9hENy5eGjPHXPWz5qFrPg2FUmMIMe4lz5CGGkwxphfZyQ+df6NPI8nplGA5p8OeXJhiVeS+geo4jCx7HMojExqWhOFnEwbmr4gbJLjFbkt3QYw+VlGI8n6olpm98P3d7RwMK9qGBnupfWUdX8rcTg/CFDVeBUqZJJfbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqKbKD/soeFcbh1lJqjJKm2uSOxeSrqp7jeBsCY4kUY=;
 b=el3ptP6kLCaaXTW+ZpiTfz4IUS1Lt03YGapA77PAKD96Ry8in7u3HuhUApQsOuRAQwDE7MYFq3oIfOUp9QRnjcOaA78LS5O88+S275Nfmsaq9o1WbS2C/4QGIZ21plFH47PzoduVJbDMOb3aLtRACwSHSjNdbeHPXQ7YpGM5gjg=
Received: from SN7PR04CA0177.namprd04.prod.outlook.com (2603:10b6:806:125::32)
 by CH0PR10MB4905.namprd10.prod.outlook.com (2603:10b6:610:ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Tue, 25 Aug
 2026 17:18:40 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:125:cafe::92) by SN7PR04CA0177.outlook.office365.com
 (2603:10b6:806:125::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 17:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 17:18:39 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 12:18:38 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 12:18:38 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 12:18:38 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PHHf3Y1436664;
	Tue, 25 Aug 2026 12:18:33 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v9 09/18] spi: cadence-quadspi: skip DDR PHY tuning for 2-byte-address ops (i2383)
Date: Tue, 25 Aug 2026 22:47:28 +0530
Message-ID: <20260825171737.776052-10-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825171737.776052-1-s-k6@ti.com>
References: <20260825171737.776052-1-s-k6@ti.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|CH0PR10MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 631de544-6b20-4871-6e93-08df02cce7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|7416014|23010399003|82310400026|10067099003|56012099006|6133799003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: XcXDC+0JnUOlSbThobWJb5Pe58da33sCGwVGY7hR/tFcmv10JDYpOcQ23vs7xC4uFEZNOWise21IEez+nWdQnVPqWC8lRFPNnhgFDT7E1hoB2IUeR27LuIJm6bJjie1e72Wht+yY2EHqGjfMP4X6j98WaJXfJp9obGz+VlSWtoybgIiaTx+2MPNmb2Xi+g5TX+5BczwNZrZOSZcOuc2V98DT4gUyhoWVXS79KbnjW/0O+nb4bExyTtG7Gl8UTIUu4DxwhxO6QcbkjktvyblRfJNEpurOFTQNqxEfreODRyCnxYNXp6PW6fyYHjXsQoRKrnLGfOIt0OOQ3p2xOHPqcHWR3E0oCdszT6Y9/YqjTywHe2hferTzLOMEGEKRwXiO6Fz5/NgrRqjdrYfqSRJpSMIZFbQs3qXm5+DPP4E0aXFd7cO8Y2pSYmz1s02fKA4I/z5tg0sINWYQ6TISbk/pmg59o9KufTEgV177atT+7EwQFj9U7/uOVr0gLwnOnz/dwWMBd+ypnP2Acho+4nx3VYS1T7iDP0vUPprj23d9EBpPnJhjdrh7IK9GfZFCwjdcQbyIHpXLuahum+uxQf5VVJFdAOqdPkLoQ5I5L4Ggued8PsLLoLTzqEIZj+2VGwbP7qhKqOdvd4QP/aCjrNW3KfWiWbPnkLOqXh40zUzWaO6m4IoVmAnq+nYZ/6ywFgkz/HwK34kwT4L8v9DXbmp+Aw==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(7416014)(23010399003)(82310400026)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zrjdoOhMvEDSl2pUegKCCH8r7AatOgQiFKugZZ4QefHeb/+RR6kJKNx26iklHyW7zNdBAhD2Lk7SxAvhC/tpyoo2eFVRk1TVtuzAwXkkFByHrO/RUNYezj4XFElTB6uRXnjrpcVjOfA7U+jNuwCL+Ay4jIkK6RAKL5QtdVhyGyGQY98VzLKfOXDi+szNgqNI6vchynJsX0dDUAYHQpIilJU6k5jOiwl697jeafZ9LEOgE6fe0X+4+YG6TPcJ+HsSVD7zZlNbrmVib7E0oLKtNrFdutGyAYjZqQuc3+G02KTtOhOT8W3soJ0SCfv1cp/JNQknOXAmQV1pCABS37otViYECcSOCsLN0FI/MWhSBvNqKZ3Bpl6h6/yNV/F9oQn7JcizZxp5R3I+SFnElMfaStka5fu4aAwm6O/90bARue1n2PF4SUexzy11a6vgKD/U
X-Exchange-RoutingPolicyChecked: TWjrkSZ2OTv2FzC8EjW37kLGcc8iyCsAhswlffQS+H4QTRTRud5nJJQaU2AywasAQOXJkJGBNcbxX7OwQZxJV6zBsxZA6nW/N06eopz6Rrg8NxfjOGIWalGpdwT6LbPU8ssO/bOrVww/jaz2HD2Nv5dnu/H2UlSnUwM+D7PVJM0LxUi6Fwz7aK74cYotzd24byWEPnMLzJHWziZz4ob+5ZOo2xyu0ZuW/o9n0laGSyXA8vMEt2WcVYFwux1xKptmnMaEHHDZTpn9hJ4P66sLfBR5nd4r+o3YDR1pPIP1DnuOcf+HfIcF0onVjcheGwKReZX8BzUlmHEj6+2qhnSHCQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 17:18:39.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 631de544-6b20-4871-6e93-08df02cce7fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4905
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDE0NyBTYWx0ZWRfX4YukMQdXIJRw
 u8FRgqz/NCZM2nDo/GFN79c39xfHPG788tHDTSLneKi1E8c1Qk1iIbnyVTTp/Y16cVcoIm/DXOG
 /ctu922jb7VkNo0VuNebOLJSNboQTTc=
X-Authority-Analysis: v=2.4 cv=HackiCE8 c=1 sm=1 tr=0 ts=6a8dce74 cx=c_pps
 a=WZnQmSLi22PDpTVDJlFiDQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=T-kh0MV4vbdY-aS4Zb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: bbNrsK0vP1_QW0WV13k5VRph33cGMEcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDE0NyBTYWx0ZWRfX2Zl19k40AcWS
 AWdQVX8EhkyWE6RaBoaQYCoLdQOpUi5DxEiGMhpPiHsC5Z1WMr8CphWiBdFV+0ukjRZgSUYiRFE
 YUpQGKpX6KiUBmtxIPeVZdN+LDtVROFJ5Jyq3LddGmLdn3+YHVPtSPn0Md7lkK0ilnSgn1K+Z89
 woEQZl/PwTjq2KPhQFdYC+9pm1AwOoQWxOP1R3TZX2xoqPwok6G+fTmDHRN18Jq8OWvMY67Sbt2
 +FxXS1D34oQ2/7Jslha3ookdqOG9CzoRd+iZKXbZAl1s/owVjqbYITztQYn6bQ8lG4j4DMU9cem
 Aaw12+37kTUjCGjRbJyCj43jfHrUvIak74WyZcFfXYWRJUZEMBZ1blezLpjtFZmxaZHezyqF2wG
 xDMRJy+AurnmHXQdj4LPhoQSsYr0fRt2ZZtyNY0NRWaJStTfBwpUn3xNqZGbuUwXBnrbEDSHrHR
 rlp2+YEUD/tTyThfW6Q==
X-Proofpoint-ORIG-GUID: bbNrsK0vP1_QW0WV13k5VRph33cGMEcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_101849_846711_F0D81C6C 
X-CRM114-Status: GOOD (  14.93  )
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
aS5jCmluZGV4IGY3Y2RhMWJjNzEzOS4uZmMzM2JiZjU2ZGQ2IDEwMDY0NAotLS0gYS9kcml2ZXJz
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
aW5lIENRU1BJX1NVUFBPUlRTX09DVEFMCQlCSVQoMCkKQEAgLTMyMTYsNiArMzIxNywyMCBAQCBz
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
dHRlcm4gdG8gdGhlIHBhZ2UgY2FjaGUuCkBAIC0zODU0LDcgKzM4NjksNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGNxc3BpX2RyaXZlcl9wbGF0ZGF0YSBrMmdfcXNwaSA9IHsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBjcXNwaV9kcml2ZXJfcGxhdGRhdGEgYW02NTRfb3NwaSA9IHsKIAkuaHdjYXBz
X21hc2sgPSBDUVNQSV9TVVBQT1JUU19PQ1RBTCB8IENRU1BJX1NVUFBPUlRTX1FVQUQsCi0JLnF1
aXJrcyA9IENRU1BJX05FRURTX1dSX0RFTEFZLAorCS5xdWlya3MgPSBDUVNQSV9ORUVEU19XUl9E
RUxBWSB8IENRU1BJX05PX1BIWV9UVU5JTkdfV0lUSF9PRERSXzJCX0FERFIsCiAJLmV4ZWN1dGVf
dHVuaW5nID0gY3FzcGlfYW02NTRfb3NwaV9leGVjdXRlX3R1bmluZywKIH07CiAKLS0gCjIuMzQu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
