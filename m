Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D1C5DF89
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Aug 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WeGriE1/St6YJqki9CZ1A45iXiVyq+BZikFxyEzLKQ=; b=uXgYy/9ueddVhr
	68o2qutx6JFeu0GlffLxzhX+TMoC4ihvT1XXMxcg8yLi2CjezwnDcz3v4jM0Lu8RptD1E59YFf+Y4
	xIzmbp7eqq45bBIrJt+PvHMgUUJK4y8DYnRek6u1b3wbP6Yu26FCNOcQyjQfH+AOzepRJoDKW4aSA
	17dmzdztDBF2k6j4JvuuLlHP5RI3ja8LpJuPg1Jvvog0TA5SzEl3OEXrkSPD69K6aIaKJDw33vwaS
	TVWH/uyWlA4p1s1CHjqH1skk6tiozfzb7sdbgRguwHhFW82dZFhB1EeuWV0xEX2T1nalBOqAZsRq0
	kBK6VSkj8/UyCDnTmaTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNkr-0000000DE1v-2Sgo;
	Fri, 21 Aug 2026 11:49:49 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNkp-0000000DDzZ-0C4X
	for linux-mtd@lists.infradead.org;
	Fri, 21 Aug 2026 11:49:49 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9KKGE3421342;
	Fri, 21 Aug 2026 06:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=L3r4+4BDkKDSVXfOUwFU3FkZBjUujBJu7lCtNDJ0T
	so=; b=aNfiMKGePmjXTdP99Dt0K8ng+PrrHni8LUcO4dMeFXbGktCmcyIUO7CR5
	hGzVDULLe7LweEnSX0aFzWADKxv7OLqWfDsU66sQHccqwM5tySBrRsg+FxcZ+EN3
	KkkQPuLpIRHGQ+9MkE2WCqIHpWc/aySFRiJlkMH7/4abloEeZq3fCapg8SpiPbMs
	DasgMfwJZQRT4mIS4TGpVDjyLEqL/twjtjiXepK7v/NWyCVncD9kWd8VrrwU9mm2
	FModkqzd7gwM9P51pxwipuuiD7ORZP3wz/Xoea9cJib25L983xc9xECRcMOfoZpR
	el7nx739KCcN3mmY7bvEEtU9OX6Ow==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g6knmrn0g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 06:49:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hH0MAlj9PmAPTDtY+wZTelvruVrAX3b+3/ICSiLpmu8ZqoCwN40zLpjj728xJFAgRtIzd4wlmp1D9rk2YZujRMeM8ODR4pndpX1Y2l6zsY07AoA0LbHIiBwGcGJjl7cxV3AVbkMLcoNtBVSQfWbfNwjf1hebxe0A/1wFvqf9QeHUyjTUmTBq8h/ioFNow9wuFWe9ZpzKB6hALZFttYcQWZoCWmep43FFIMvvQJ3fksPosatIyLVOURsW0Rdsn0JWWN1pUu1EaSnJ5ztqLrY6S2BK5pCZhmLYynLY9pxpokQ3qrLMhSg0WAIYI4wCVIwLKAlPRx7NHmwUIKpT68qX/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3r4+4BDkKDSVXfOUwFU3FkZBjUujBJu7lCtNDJ0Tso=;
 b=SeZ5CYwaxH8CC6/lWlBahFawAzoY4dP6MT2tX8nzN8zLdQ9Q6LcqjhdO2eZ/sZ3qvWIFhuNi86Zp+n3XbBkZyKKmOOwwNOGfX0RBrZZmn+jZGFfwCOcdhHAvsdhQZzHQrjSJpKJAeASGlw1fS/yNE7mj7PQSObASEoYQW7qQx9cO5seQXgk82Lupl517IgGY184K1n6RenzcKQBkoD81baQgjYoigOi/YZAbj31YZD/NzJ5HGypboLoXrwGbnyXgHdJlOXyZrEpb35gb6E5HqSZvxc7FHGs1qtbMOqstGOYIYpekALqFzVEGHrO03WEbyuzSM5D0EZZOFRgrQYNZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3r4+4BDkKDSVXfOUwFU3FkZBjUujBJu7lCtNDJ0Tso=;
 b=a7SOM8ae/z5kf0JciM9LTGNd/xRMsuQl/WXodvJhBRRGYIUEbEAK+t6wefy4GBK9lnCCOYNH7BKt+FVDtI3aR2Pb4LeqJgOTPn31OZsBR3e1dsEQe7aCEtBz+7ShMaXx0Kb31jZ72QmUdbDLOPGIqW0ch3SeE4SQPZkFUH1auZA=
Received: from BN1PR12CA0018.namprd12.prod.outlook.com (2603:10b6:408:e1::23)
 by IA6PR10MB997683.namprd10.prod.outlook.com (2603:10b6:208:5df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 11:49:37 +0000
Received: from LV8PEPF0000005A.namprd02.prod.outlook.com
 (2603:10b6:408:e1:cafe::3b) by BN1PR12CA0018.outlook.office365.com
 (2603:10b6:408:e1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 11:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 LV8PEPF0000005A.mail.protection.outlook.com (10.167.245.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 11:49:36 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 06:49:26 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 06:49:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 06:49:26 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [10.24.52.55])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67LBmVlk2022942;
	Fri, 21 Aug 2026 06:49:21 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
        <praneeth@ti.com>, <sebin.francis@ti.com>, <u-kumar1@ti.com>,
        <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v8 09/18] spi: cadence-quadspi: skip DDR PHY tuning for 2-byte-address ops (i2383)
Date: Fri, 21 Aug 2026 17:18:13 +0530
Message-ID: <20260821114822.4040338-10-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260821114822.4040338-1-s-k6@ti.com>
References: <20260821114822.4040338-1-s-k6@ti.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005A:EE_|IA6PR10MB997683:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b79d25-e17a-41cf-1bd7-08deff7a4670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|82310400026|36860700016|22082099003|18002099003|13003099007|6133799003|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info: 2b8e9QDnpwXLy7Vjc4HH8yK+sXXvmLhPlErMhsbQMYtBzEaH9s+7QRvWXh9IjEJBcKVgnMBmftWtv6Y5JZL7pPzv1x7BN+tPLHfcE7J5XNwxtecnxVl0P2NtqtQxqqQAJBQieAb2B6+lzAEhL6lHEJrhmVGMZZLAS0wbtac0O3H5LEMc6JqjKuXyAuLZKwgRNkUqa79ppyhTXWiYif+VhhXFJAkUqqKAS9EaBVdQ78s4XAF61i2Gs9rKdboE9bmAbIVYjsvy6SB/a1uJOl6bHBogqT8biu8Jkk4CJmFwEXTU4neam8q/HsJyZ+t1QGqpJBcidVyEOUy4JOa/kH+HOyWP4zu/kTMkkCRPR2rcPyyeUI7sIPg+i5t06WK+X5EVtVdnwVIigm15SqbpnyEtV/nMhwDi/b1YPp38tGjwMQEwRWWm2Z57QeKJtY1F6udRuVbDxozgzQp6JPyBIkF1jjO7kKG5FEVVvUo99AX58/GlGwLo3jUSPA8DbFFn+4sCBUOrXXcjaB8isBZy4bgZ4wCbYqj0HfEgs8IIYjOWDI+lhES4fCpuLOZBoSX+1kvyYBRoiXEEX6Ub0kniUlV7L0PJ4zVX+u7njYMDZck+jZRKumdRRbuvCv9YEsKEyqsOKS4xrjyFS721PqL676ip1fHyCcL4ZEr+4gc4dnZu9RZgi0SL+FUANmoSbJYwtt37IAwcC3uwrHNgusdlRE2oyQ==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(13003099007)(6133799003)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8rttgtMZ6qrsjr1L97j6+NlEg/rPjWL///q8Fn47uOoALBxZejciKCa1rjj6fC78LcAYr+gkGOLcWzM3syWlrNI6cexkgGQo6m8rLDwtGNXcyrRuw5NZwZZMA1S9HGbTf+zQx3R0xBzXsJPdMRdiddRryPhTuWFZ6970/fgCauq+kQ/TzTZTXhWSm0kfjv+7XzmbXJnCWocwCLQGltRriJXdjQZbpDklsTEdNi0X7fKH1Ylab0e6loTLhcLKlmhCtCUKaBq3E/OmA6+UnVWrhqPHLYTSEMMjZNsMubl6an4bRnv33dsOGHKBivMfW1LIIW+wGBT6JE0cgBdaIGUxBk61Rvc6FLj6yYi0h7B5a1HcMkTDLth/OTyDcR/fINaMcaY7s4v+8cCGFS/2JFvUbH3qyokCHlSLOHyYlVwqZzDulwKXZSGp0QqvbAhCpttG
X-Exchange-RoutingPolicyChecked: iXTiBczCmicTuzmUr0ZhftO8tdUjHnVcEsu8o90mWC8BTQZhnPQYbU/Gya88sqhX6Q9204qViQBjjJYd6BTDQ+Eddzv9MG9TIzYaXa83cQU5v3sl8w0XuVeexRZpJ8mUaq0GJYBp2bFodK8T2uZeCrsYvWzDyrwie8B/DJqEWY/X7M5uGvnv39VXcjmc48SiTCQUuZom64f1q1vNWs8JS/YjDpXgympo6eBVCVOA6iD/KcT/5bWtaCKMQysc7iVyhQWaxhY2kvmjE4g9tOkFVN9J9Xua3mhcJ1I8UPROz14AjQUSB1UpdK3RztEjP+AGdt55xcKNuWelt7ptwLEUmg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 11:49:36.4805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b79d25-e17a-41cf-1bd7-08deff7a4670
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF0000005A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997683
X-Proofpoint-GUID: nLW6SBa2rdUK7n_svcM3E8a8jxJb5dis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5MCBTYWx0ZWRfX4kFT3EW5PM23
 /kiIdpiC/wfw/oAE3Mr4NHB3Hy7J/Ekg7SdmWpsv8eKOti8MJ3FkLmu89TpOUxwW5EHl8YAorIO
 OdhyEEbR2XTJa/FrU9n88sivRhCC15PtSEf7Tu/pzgWEfF98MdTpd8pUZh5KlALj4Tao/PNFOI6
 qkUMwAg4R30j0RZugmOegzGBjD4ibxK3IcwCkuVkf94ntVKcbgLq9TyjuMe7nX4rhis0LIKcHkM
 bXCEdRtty0Aj3L6SS/cu6eg17voBgPmhmoKYXd6ACw5Tvkm/4znwQEKBiQ6shsQTu24TYxIsBa8
 B+iNEXkQZMbe9b5IDFGyBVOBji9A6SnAvqVmj9OevIKkvNb4l8yAoepiub/ii5o/O6kHDupHrfu
 j1takKyys/HVyEw262ryhZXsGD42fj34YBFuhVjzZMRi/27OCHQj7UpF8WLv50EnT7JEPxjGkmY
 MwXDWjGNMiiDT1qm3Hg==
X-Proofpoint-ORIG-GUID: nLW6SBa2rdUK7n_svcM3E8a8jxJb5dis
X-Authority-Analysis: v=2.4 cv=fuzsol4f c=1 sm=1 tr=0 ts=6a883b55 cx=c_pps
 a=2d9FbaPwie0YXhWIRYJR4A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=T-kh0MV4vbdY-aS4Zb4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5MCBTYWx0ZWRfXzwgH+VDzPcrZ
 gwjkqTUQtPzUpY6d9Trocy7Id22aZAIhBjvrA1uKmOwMC5a1ut8OuTLD4jIsuutJzyqaP2qm70C
 5WJn4ud+gROxd/U1Izuc9qok+cicsj8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_044947_202570_C4A74C0F 
X-CRM114-Status: GOOD (  15.80  )
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
