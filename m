Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C40C44521
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 07:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAPlcB0OeG6jYvfK4Prq102V4T+tKwtYTQqfJHlLy0Y=; b=Rvface3wUpZtIl
	tLmQgmTZv0q0064fbL/1Mw+sJfkN7ti3B90T3SitGV/K3qKKTrjD52+tVZZ2dFXGzaklkVurnrB1J
	oQuQ1WwCQrmnkoUv/XRQD0fZOVt5PBGpxoNXGaJbp9Y+alVJr4Z2HqvDMz73f2Bh2vyFQbz0lw+cA
	5WzrpC5gLE5Zz8CL8v/0ZGyEs6Ka+Z0ASVqvVwseYw3SsoLmFqUvbiJ8r4Sh78HD2aRGg34t5rbFH
	TfnymBR2RShx9GKa+KgLWsBjDzUoZCQPloW16Y0pGXiEW9FxHQhW55we4e//Xc07qZpw4Dj526XvV
	xl4QzuJ4nrIsN4asMxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlib0-000000067Aq-3cMj;
	Mon, 20 Jul 2026 07:39:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliay-000000067Ai-2Sqp
	for linux-mtd@bombadil.infradead.org;
	Mon, 20 Jul 2026 07:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=45aykUu7KL1FQw5Nfl3MgaK65a3V6Qc0A6i9s9MP0/g=; b=M/OPfT3XSKZyhNKBcPINBZ5fsk
	eJ4JhAONV90chnYPGoaLNWl9UgQTvkBXngmfvfG/Lh+kQrnMYBpVDTYBVwtwqwAgBd9MdvseeorAx
	a8J1C//WfIPwQel4y1zoo53c9Aoti2b1geu81IkD2rBv/U5Sf511iOSEfvBYgODkEPIl4GCjiPvRZ
	Ri2/Y5SEvLke8dyEQg3zGFazjzQ7jiBLHFs39UAkoOQWoxtXG24D10OfAvZQ/1Mt9r1IwjxFg6Tvr
	b/c/HoWUfaw51MDD/c2uv5D6VX0QAc7lhxg4oCB9UYgvt048Z3TVaN448Qbpg/vVfI7s9f+fPUNAS
	rVgwkhbg==;
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wliat-0000000GLoO-3uwe
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 07:39:23 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6U9ab1428060;
	Mon, 20 Jul 2026 02:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=45aykUu7KL1FQw5Nfl3MgaK65a3V6Qc0A6i9s9MP0
	/g=; b=lEkQ/YMnbrL90xOazgqLqTxm3Vq4FiENlnErM9G6C5c3Zy+6KyMMixr/E
	JF1mhHfUu5oqivqUb+w9W1TXACHKFfVyHDZ/ONJKH1sqW7rF7JqUMxcXVCGRN9WD
	NRngQhHnqnPJuS2EZTro0Fv53GkZKBybPzpj5R3szNYrrIGQT6eC8ybV+Ghp0516
	zBDyHkOVXztf2ys4y+f/FKGJywS5PiEmO+Qy/qZSn0REQNfLxRJHuaadY/vAyBTG
	QYgyeaqVy1Uufo3TFZBdhi83FN3n3826KkLGT1e8ToEZBnv2bte99SO14Cnyy6T2
	4CJkbuW2LER2BN2NRhoaYf/hxrm1w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012056.outbound.protection.outlook.com [52.101.43.56])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fgrmkvs06-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 02:39:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDbyVMh7aqLTu408IkrRfnlXZOv2dtCTLjVQ30orQ9YpeXEjdUG1o1+cV8dUP1hNdx9j52aAbEculnxLWs31nejeOsiir8m+N1FxJa/g0KLj/t2WhWhcv+/QBuBM0b6YJ4oURyZW0w1INkImnEEFWgqyJvwwLKZpgc3Uc7Lr5xn1Q93ey5TcpdGvvJ/NCyKBxmwdgXM94IXv+mqnPHJAFSGDkUvf2BuxmTE4zJFKCRTaAWMgujd601Ml6YuJ2WCdUKMoBnbmMwO3YjEl7O0qnWsps/sOzYrWvfUOxCKlaMCDsQj0y2SghftLzTZ5YMIQDum91Z/QA0zHIZHhR0Rp3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45aykUu7KL1FQw5Nfl3MgaK65a3V6Qc0A6i9s9MP0/g=;
 b=G7YsRl02TGq7T00Co5T+CiVwuKkfrBya4J1YJVDK1pnzGybE1vmu9yKqFQbqS9Lwxloez/d+u42PsC7zfCmQRqufg604vbe85D7y0gYGsHQOJ8UYfuH79WRihnFlAlw+tVAlClo0ECkdYqxp0Xkn/e3S1byh1x7uLYAHxXFUK7Frx0yeqfS4B6UxG8N+XPSEqncmZsEB7/rH3EblX9qNfiHn0DaMFSRo2Q9OtIuFOT+LY8IZsbFFkSJwcSOW1u2imNoF4Vf5aG7hcAp9hu6G0QEQ7YhnTh9LRn6/WH4GbeFqMSdQjdANTw2deJy4yDsD3cC6Jfz6W8zZyoa918PGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=45aykUu7KL1FQw5Nfl3MgaK65a3V6Qc0A6i9s9MP0/g=;
 b=QNRFeHixlr2AQY3h2AAr93GYQW9IpD9GcJF0vJwGDLOQlH07j3uEv98/rNWbFfyiT42S7Yfd5EwqesyIX6uNi4/AR91ixuIpDX5sVIXeB5PSQiUknEvAc2u42b3DsCEb4ohEIUMDyYSV/GSsF7uncWgdgD3lMwpmkSxqpsxtMw0=
Received: from PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::17)
 by DS0PR10MB7247.namprd10.prod.outlook.com (2603:10b6:8:fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 07:38:58 +0000
Received: from MW1PEPF0001615B.namprd21.prod.outlook.com
 (2603:10b6:510:349:cafe::49) by PH8P221CA0061.outlook.office365.com
 (2603:10b6:510:349::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 07:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615B.mail.protection.outlook.com (10.167.249.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.0 via Frontend Transport; Mon, 20 Jul 2026 07:38:57 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 02:38:52 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 02:38:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 02:38:51 -0500
Received: from [10.24.52.55] (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66K7ckVR1824696;
	Mon, 20 Jul 2026 02:38:47 -0500
Message-ID: <3d470ec8-870a-4e14-90e8-6c7444950192@ti.com>
Date: Mon, 20 Jul 2026 13:08:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/17] spi: dt-bindings: add
 spi-max-post-config-frequency-hz property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <praneeth@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, Conor Dooley <conor.dooley@microchip.com>,
        <s-k6@ti.com>
References: <20260717185116.2065505-1-s-k6@ti.com>
 <20260717185116.2065505-2-s-k6@ti.com>
 <20260719-camouflaged-unyielding-sawfish-b6fd09@quoll>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <20260719-camouflaged-unyielding-sawfish-b6fd09@quoll>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615B:EE_|DS0PR10MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a4880a-a431-475c-c404-08dee631f52b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|36860700016|82310400026|1800799024|6133799003|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ko/5s9XGwLALT4u3lC1ZxJaQcO8l6oToVCx4szvlE+nCm8eTjplxTOjdqlvMPSqygUX/ASo5cRefk4YSyp+ChWkG3r05iB8mZqu/xKHPUVJNH37hFGqEhXdwEEA9TGyEc4/WASxCMUPrxXlaFzQB8DcWhy/+6CKaZrXRe6s+KLuRRyABcDK7W3MZLiKzQPawmsMNH+93MWewkZz4gYywdxo8THAO5qUaKMmlEHwOZBvp1oZAGKzKxvl5BzDXVQZWK+PClbNUYvRwtihb8gunhH6LqFW5l6MxQlUlGXLh4XBjFJW+IeJHRi/SHTXWZSrYQyp53ScxL3PZqk8PRZ/gkUAfbU+G7X7/qpvWBNjkHmb97IZckMjf9J8A9eAZZV6kF1+/Foeq+zV71EZdl+8wHmx5X3GYeFALkuGR1wXFGreeCNbWl3cyqFuIMMRZsWR24OHh7pdqreDNTfswaUMphBTdl673UDviSxbQAnfe4B+pqqQ2kX8KkKlcORTG/WEsGEodqB8095tRaPn+j/1Ezgk1dHNIX3GYRhH/QWe00brFiNnQYxUZ6+46mfmFs8HrLGcf8pdVoMwG9ZB5C8lfXm6ywNLDkr5yuenBMPBud4uFWUv3pzvMSiWf2jsh0o9RT197v9aYeP8KumMYMIfZlXl9NQFGQBGn7WOtYzpB2IBa0VaYFAg5ARUpTdU1nQbl
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(36860700016)(82310400026)(1800799024)(6133799003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nJJS1qU/lx5F1lJH5bVmp2N7GFr+oE5zbQnl7WYWiQIdbHEijkdRWG8CjXPUFiBHi0orHYyAACgND2eSK3EAplY0n2PjxSdDDFFFtHM2lKoLeNAPl9TNLPRgOMmMoNYUCxcH093fBi6qAM36KvJjQxsPY3Nkq9LWl+yTXItn3D9v/lcG8m0nh2sUFrbZpCXoTM8Y7a7f/SY+N8K/EiZB2RcsE6Wi/uWot7dUuynyzMsxrM7+wL05Y746I2XCvZwMXTx5TNCEA6Hf+uhA3UOsMCGVF4zaLAaTpn1jE+ofxptKIOgFOWlZlCT1thN+EK5cPlLJfZBq4JTCo1rRPB+FbO7eLMwi5KFi5QdYSjoRyHKadqcIICiedWgNJmb4z5IdyixEEBAShKB97FC6EReucDfRyvhIY789KHE0ENOpQkijllOUtL97OqJiYREJH+8j
X-Exchange-RoutingPolicyChecked: TQhNWsG7UP7LCwWEQVHOpHgZ7T5NIYOGnarUfpun6TaRv4+9sn26PlRos7Fob96g5ceAdsiD6kofZg1Z63XL6irxSob8+CKAp1bz8meFbj0PkHenunRmllDrsKQzo22TR+9lE2SZXLq6O+3QmFeqp6MhAfjbJWJbZNL3y3WPVVuAZrFe/3ON8xWk+vpkh7vkw7Tnr87Mr0S4lV2wL1ybIiNzYt1aspXADemQiJQ3kmXiihLwic7aMbzIJLP6F8cnWF/Ai+vlxiEkBXOwV+nRiaomQe5SCypQuKLwpVLMFfmWKokJEWkxFjIQnoSUwyTO8/Kd+o74ujNL9W53F92s9Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 07:38:57.2969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a4880a-a431-475c-c404-08dee631f52b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7247
X-Proofpoint-GUID: tMYseVxruOTvvlaqceUwjl8XMgjc6VZL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4MyBTYWx0ZWRfX/2RKQFzt3DHT
 Ke8yR2v7+Seia4fSmHMbpzkty91Izhr4OXcB6HRbvMU0ksCdOqRAI33AVkZv+joGkiIl+i2J/5X
 JXTQsop8v6avrLVBfOKcOp7+BcNFAjk=
X-Proofpoint-ORIG-GUID: tMYseVxruOTvvlaqceUwjl8XMgjc6VZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4MyBTYWx0ZWRfXzaJXRzPyrLA1
 npEzO1pgDcYJd/ioaYKgdoIi8c5YCHxBkXRLmY/bwIR4gBziaORHfquBYhUAaJDVMZIu0oKUXQY
 g6/vNPU9CW/GeRgNo8JAYqgmwNprnUZNkxhRHU6GBDHKx/ljyfIfmjwSBU/rFfFaqepVCSKeGXn
 j7J0Mo8bopThUvxJiP0r4wCl6IbuUdrpecQ0+J9UzDlRzBORDCBUztM39i5mYMC8t2rPADT5boh
 /so3+Ngpm2KaoD4F6AbdDC+P7eEsI0MbmVqfq5hdCecKv313hZjze4s9J3ukYUGGbMYp+ByyjZX
 SMHv/JHdQryluYUPrn1IDfbWhIOwX1gCTrKL4g9oh3BDIdbggna8xU1h0jvp3sLHyHWJo42dntj
 v27b0lgejjLID4pphrQ9aYQkKgB67XSrZqmVt77agPA4HNE1G9jTsqFlR+jZQ/sot6m0cn4gv08
 gH7kvGBdxijrzEePrKQ==
X-Authority-Analysis: v=2.4 cv=KIJqylFo c=1 sm=1 tr=0 ts=6a5dd096 cx=c_pps
 a=6XSCBLYFY2RPGp+89yprvQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=XYAwZIGsAAAA:8
 a=sozttTNsAAAA:8 a=40wtejM9hqs-gEVfS3IA:9 a=QEXdDO2ut3YA:10
 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_083920_840175_648254FF 
X-CRM114-Status: GOOD (  14.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On 19/07/26 12:23, Krzysztof Kozlowski wrote:
> On Sat, Jul 18, 2026 at 12:21:00AM +0530, Santhosh Kumar K wrote:
>> Add spi-max-post-config-frequency-hz, a generic property for SPI
>> peripherals that operate at two distinct clock rates: a conservative
>> rate always reachable without controller configuration, and a higher
>> rate achievable only after controller-side configuration.
>>
>> When both properties are present, spi-max-frequency gives the
>> conservative pre-configuration rate and spi-max-post-config-frequency-hz
>> gives the higher post-configuration target.
>>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
>> ---
>>   .../devicetree/bindings/spi/spi-peripheral-props.yaml        | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> index 880a9f624566..12211f8c9f7d 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
>> @@ -45,6 +45,11 @@ properties:
>>       description:
>>         Maximum SPI clocking speed of the device in Hz.
>>   
>> +  spi-max-post-config-frequency-hz:
>> +    description:
>> +      Maximum SPI clock frequency in Hz achievable after controller-side
>> +      configuration.
> 
> How did you implement my feedback?

Three points from your feedback:

1. -hz suffix: added

2. Array property: I still lean towards keeping this as a scalar for
now, as we don't have a concrete use case for multiple values today, and
supporting two frequencies should be sufficient for the foreseeable
future. I had responded to this in the v4 discussion as well, you may
have missed that response.

3. maxItems: Since the property remains a scalar, I have not added maxItems.

Thanks,
Santhosh.

> 
> Best regards,
> Krzysztof
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
