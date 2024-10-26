Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F161D10BE5
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Oct 2024 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrSTu4bkv+Dlgs8lO2zTHGIFhn6cNUkhMbzvnRjt+Yw=; b=j+08qUKeFVxpwY
	j4GkWCsMqyxrwv4sVD6/W98Yf79JMHizodrZao0z4D6VBcrc0S+PARn9GbB5LGHJ7Ebw2h7oLxP5Z
	b5gZ69uQwUTQNeUJnc/PDkmmIQANU/T/ghOaYzezQXOga8aSUhV9C6rpm9K4QYQ7BqKjZVfBAXSIA
	1T5U4gejNe5D2I0STWbXfLKjliCNBoAr1++shq+M3vi1BZq2V/Uc59gdzHKJPHZcur4dzTU06DzQg
	utyRS/oiuwBnBbkapMscWLySbVCgf6Vnm9TuQguoahIkGYW6iQvOXurev4GDmrKKshHP5OP1HjHdJ
	0XBMxxmhn8ejjkb++dhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bhW-00000006BKl-3TN6;
	Sat, 26 Oct 2024 07:59:10 +0000
Received: from mail-dm6nam11on20604.outbound.protection.outlook.com ([2a01:111:f403:2415::604] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bcq-00000006AlK-1DmX;
	Sat, 26 Oct 2024 07:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGa5b1Tb8Ec5UNVg69VQ45wWus7I5LoKduuRd69tEP4co/3bbduMxHBcb2YG2I1XQPa4jUi4vf9/0qE6AHYyaih0ULAhJBDrc5qOU0SXee8UTum4nT4iuQAGVaXmaaMrqI5yXSd0bVJn0lph1NQyJA6dNweyvCWngI0QrQzSsfVuqYq7GKvvwq3l1N2aA+4VORUzjorL2NSIBnZnh3tSYP5OGPKnsuA/qeUvvOyKWoKhBhYNXhcKL6PE8tqK/bhqAZHF6dbwuhHmMSKCR/P0Gea1tzI4Z2LcHa2p1OhmFgCwq6fvrJMLysbHn1o8GtI496jTvkDdyVwSP8zh9LZAIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owYK/6+V3VUTla7EukrIdWHtCfgdNgNjjMHBG3WW1+E=;
 b=pfrBohqvElexBbyvO1ocJxVuwo1n+ZZTPolgfZAcGKWsaElV4d4T+UTFFyRppq45DiUPF+yp09CnMGQvPDIacubwJu242Sq2/eTAA+64cu+gX+flPcodXvl1d/Z8Z7nSWPuuCgb2IGR8lL2+7uxdL6n4TrWvQOVbuaj+/WY2DVsOJmuDpS2HbVmFAzhOoYrVwlr9nYk+zC/JZPeuQcsc6JzxGyAmjHwBNHL2FgvZ16e9JoJZCLeKyS8qJ0LD0MTFIBADwalnnyOh8c+9BsxImSWu5xg4hiQqIF7eQ2sk8jFvlgn/Vgu4u2y076hlvPt5PmJ7uID2/vWTykMdm1fdBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owYK/6+V3VUTla7EukrIdWHtCfgdNgNjjMHBG3WW1+E=;
 b=tLYoDJejm9yXd5otWASOIRpGzV3hVu555/6sqnMvbYMADckGUMc7EUeOfQV6SyZK7NmiA9OdrPaRA9UF6IZqrOZKwFZfQNMvL9moeRo9fADP8bi4MYe7wxB2qMEYDqt5EEaB7UAb6OZOQyURz3i8H0R8GiHv4MDIrm8jow/4V9A=
Received: from BN9P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::7)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 07:54:14 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:408:10a:cafe::7b) by BN9P221CA0012.outlook.office365.com
 (2603:10b6:408:10a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23 via Frontend
 Transport; Sat, 26 Oct 2024 07:54:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Sat, 26 Oct 2024 07:54:14 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 26 Oct
 2024 02:54:12 -0500
Received: from xhdakumarma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 26 Oct 2024 02:54:07 -0500
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
To: <tudor.ambarus@linaro.org>, <michael@walle.cc>, <broonie@kernel.org>,
	<pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<miquel.raynal@bootlin.com>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<krzk+dt@kernel.org>
CC: <venkatesh.abbarapu@amd.com>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <michal.simek@amd.com>,
	<linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
	<patches@opensource.cirrus.com>, <git@amd.com>, <amitrkcian2002@gmail.com>,
	<beanhuo@micron.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [RFC PATCH 2/2] dt-bindings: spi: Update stacked and parallel bindings
Date: Sat, 26 Oct 2024 13:23:47 +0530
Message-ID: <20241026075347.580858-3-amit.kumar-mahapatra@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
References: <20241026075347.580858-1-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: amit.kumar-mahapatra@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|PH7PR12MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da072c1-1097-459b-0c34-08dcf5936289
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzBmMFBlUitLelU5WCt5UWxnbDhsUDQ4MlJPVVdFMk9ieENrTU8yUzdVY2tt?=
 =?utf-8?B?N1N5U2RnMnhRTGdsbmU5dndwVU1jTHFFbEY2SUxsRndzQ0IwNXNhaDdkOTFX?=
 =?utf-8?B?OVh6WWp2dnNGOFUvaXVSQVFwbUJTbkhkNDlhSnBLWXlQamRzalRDRGdkTVlP?=
 =?utf-8?B?S0dzY1VtUFRQdWlkNnN6aTByOVZLLzdvTVdRaUxBMnBmUVdSY2dIMnN5NkRR?=
 =?utf-8?B?ODREaUYvejJuSlQxVzRTOVJVbUhHMjk2cy8vV1J1dElTRW12dUtpSHVJSU9B?=
 =?utf-8?B?a3ptbTQzRVZhdWdCWUhOU1RFYkhXVHFkY3ZBemhhRjZCL1JPM1BKU29VbGdL?=
 =?utf-8?B?VlBZK01CZmhTV21EdGtNeVVvMllXalNHaHJEaXBHd2J4dCtLR2MvZDhoWm13?=
 =?utf-8?B?KzBJNUtnbC9pN0xtazRCajc2ZzQ0UG11MVMybGdJbnhhcGtsZFJzelEyTE1C?=
 =?utf-8?B?Nlo4Z3ArZzVBOEFqRHB1ay9jOThZdmJ6VDAveWxvNG9tWGRrd2tFRWpkMFlD?=
 =?utf-8?B?WkRvNWxldWtSVmtyTUZQUGpWNjRiQVhKdlRpOGxsRE54TzBEa2YxdW9VdENn?=
 =?utf-8?B?ZTBCUzQ1eHhjNVE1WHJtaVpFRWZoajRObUhwSTZqaUt4RXAxbEQyZXRDZm9J?=
 =?utf-8?B?ZytjcmViSkJsbW9uMDk2ZE5uNVpuOVJIend0UlVJakJhSlFoUmpZc042YnE1?=
 =?utf-8?B?NnJQaGZwOUxvY2Q0VWRWVFUxOFB2aVRQZEtGQTZDUVdKdmJ2S2xxdGJ6TG1X?=
 =?utf-8?B?ZkNRdDBQL1VaNmJiVWtnbW9hRzNXbmZkTDJodWdJOWJrTVRFWGovRU9YUkZw?=
 =?utf-8?B?cEI3NEN2b092dnNESjFvaXlQL3dmeTg1cUFuOHBPZktqaHZ2d0xDdHhCZlk5?=
 =?utf-8?B?N0NhZTUwQzZUazR4SlhabGdrTEUvYlQyRU9KVG9KK0FEWkg1eDhaR3BDeXNP?=
 =?utf-8?B?a3NmMlRBM2N2eGRNN2tFN09aSnlMYUlZUHNYN3dNdURnY1FyT3JLL3pKU3dF?=
 =?utf-8?B?UW96OHVxMllpMGdhK1U5d0FjUDdNdE5YKytJdHQvdytVd2w0ZVFlaXk3R1Vk?=
 =?utf-8?B?amNqRkN2S0Q1RGpuQ2RwQlFhSlFtRWhrVFJqRWxvenBRN1JMbTEreVNMV0px?=
 =?utf-8?B?SGtpOUhsQ2FFeDNBUTNyTTJ3MHF0NzFRcCtCYUpWVElqTG44UUdITmYvVktp?=
 =?utf-8?B?U0lPenhYYk5Xc0I0ZjczTkdqT0kya0N0bzlEN1NMZ0htWGRuVjJFNk9hWEJ4?=
 =?utf-8?B?WXVRc0JTNXdobW1wMmovamhqbHRqamdMSjNqR01lQ05ua0JhQXkxTlQ5Qk9o?=
 =?utf-8?B?eEdma3F0ejcxR09ROStzRzg3ZE52WStnZGwraFVJTXR1Y3lVK3J2L2tZTkpD?=
 =?utf-8?B?d01KaXpuNEVOSHZHTU9qeTk1MGRKLzFYRU54dDBQM0R1THVrV0VKQzRycjBs?=
 =?utf-8?B?akhOVHE5QmNobzZWYjFPcThkdEczbWx0TTE0SmxONk5lUTBHRk5UbkRRVUN1?=
 =?utf-8?B?VEd0cDBxR2FZZDkrRU8wS05yWFdXTXBvdmJ4aHRTYXdQNk1HNHI5ZlpwY0ZU?=
 =?utf-8?B?V080N2hSQlFuSFhLQkNlZDlRSU10QkNma1dZSG1XckNudHk4dzYwVlJQV0x3?=
 =?utf-8?B?MXpWS29EQWJ3OE9UUE1MSWM3M0pmd3dEdzZaRUkyektMZk85S1BCYjM3ZFNN?=
 =?utf-8?B?VDRXOG02VWpBRHZMRG45emdSNzFCZ2VRN2ZsQnQxdkluNDN4Vy9SU1hCNWpm?=
 =?utf-8?B?MVoxRGgzWS9PeUlIcmwwTUtHUGYrbmxIbWJaUEsxczVXMFJmKzZJcEpXMHRF?=
 =?utf-8?B?Q2dXa2tieW5SQmt3aWxJNkN0OWlpQW5Yb1psR0NtK1lHa2lUN1FPc3oxMU9Z?=
 =?utf-8?B?Y0pqWklzWEhxVG1mT2tVb0g1Q1FGZTlLVlB6UTVrNi9obWRmbjBMODlkak41?=
 =?utf-8?Q?PAV9WO4hsQ4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2024 07:54:14.1289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da072c1-1097-459b-0c34-08dcf5936289
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_005420_416501_A410DD9D 
X-CRM114-Status: GOOD (  17.07  )
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

Rm9yIGltcGxlbWVudGluZyB0aGUgcHJvcG9zZWQgc29sdXRpb24gdGhlIGN1cnJlbnQgJ3N0YWNr
ZWQtbWVtb3JpZXMnICYKJ3BhcmFsbGVsLW1lbW9yaWVzJyBiaW5kaW5ncyBuZWVkIHRvIGJlIHVw
ZGF0ZWQgYXMgZm9sbG93LgoKc3RhY2tlZC1tZW1vcmllcyBiaW5kaW5nIGNoYW5nZXM6Ci0gRWFj
aCBmbGFzaCB3aWxsIGhhdmUgaXRzIG93biBmbGFzaCBub2RlLiBUaGlzIGFwcHJvYWNoIGFsbG93
cyBmbGFzaGVzIG9mCiAgZGlmZmVyZW50IG1ha2VzIGFuZCBzaXplcyB0byBiZSBzdGFja2VkIHRv
Z2V0aGVyLCBhcyBlYWNoIGZsYXNoIHdpbGwgYmUKICBwcm9iZWQgaW5kaXZpZHVhbGx5LgotIEVh
Y2ggb2YgdGhlIGZsYXNoIG5vZGUgd2lsbCBoYXZlIGl0cyBvd24g4oCccmVn4oCdIHByb3BlcnR5
IHRoYXQgd2lsbCBjb250YWluCiAgaXRzIHBoeXNpY2FsIENTLgotIFJlbW92ZSB0aGUgc2l6ZSBp
bmZvcm1hdGlvbiBmcm9tIHRoZSBiaW5kaW5ncyBhcyBpdCBjYW4gYmUgcmV0cml2ZWQKICBkcmly
ZWN0bHkgZnJvbSB0aGUgZmxhc2guCi0gVGhlIHN0YWNrZWQtbWVtb3JpZXMgRFQgYmluZGluZ3Mg
d2lsbCBjb250YWluIHRoZSBwaGFuZGxlcyBvZiB0aGUgZmxhc2gKICBub2RlcyBjb25uZWN0ZWQg
aW4gc3RhY2tlZCBtb2RlLgoKVGhlIG5ldyBsYXllciB3aWxsIHVwZGF0ZSB0aGUgbXRkLT5zaXpl
IGFuZCBvdGhlciBtdGRfaW5mbyBwYXJhbWV0ZXJzIGFmdGVyCmJvdGggdGhlIGZsYXNoZXMgYXJl
IHByb2JlZCBhbmQgd2lsbCBjYWxsIG10ZF9kZXZpY2VfcmVnaXN0ZXIgd2l0aCB0aGUKY29tYmlu
ZWQgaW5mb3JtYXRpb24uCgpzcGlAMCB7CiAgICAgICAgLi4uCiAgICAgICAgZmxhc2hAMCB7CiAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiCiAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwMD47CiAgICAgICAgICAgICAgICBzdGFja2VkLW1lbW9yaWVzID0gPCZmbGFz
aEAwICZmbGFzaEAxPjsKICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAw
MDAwPjsKICAgICAgICAgICAgICAgIC4uLgogICAgICAgICAgICAgICAgICAgICAgICBwYXJ0aXRp
b25zIHsKICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRp
b25zIjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25jYXQtcGFydGl0aW9uID0g
PCZmbGFzaDBfcGFydGl0aW9uICZmbGFzaDFfcGFydGl0aW9uPjsKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBmbGFzaDBfcGFydGl0aW9uOiBwYXJ0aXRpb25AMCB7CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJwYXJ0MF8wIjsKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg4MDAwMDA+OwogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAgICAgICAgICAgfQog
ICAgICAgIH0KICAgICAgICBmbGFzaEAxIHsKICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
amVkZWMsc3BpLW5vciIKICAgICAgICAgICAgICAgIHJlZyA9IDwweDAxPjsKICAgICAgICAgICAg
ICAgIHN0YWNrZWQtbWVtb3JpZXMgPSA8JmZsYXNoQDAgJmZsYXNoQDE+OwogICAgICAgICAgICAg
ICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OwogICAgICAgICAgICAgICAgLi4uCiAg
ICAgICAgICAgICAgICAgICAgICAgIHBhcnRpdGlvbnMgewogICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbmNhdC1wYXJ0aXRpb24gPSA8JmZsYXNoMF9wYXJ0aXRpb24gJmZsYXNoMV9w
YXJ0aXRpb24+OwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZsYXNoMV9wYXJ0aXRp
b246IHBhcnRpdGlvbkAwIHsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxhYmVsID0gInBhcnQwXzEiOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4MCAweDgwMDAwMD47CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fQogICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgfQoKfQoKcGFyYWxsZWwtbWVtb3Jp
ZXMgYmluZGluZyBjaGFuZ2VzOgotIFJlbW92ZSB0aGUgc2l6ZSBpbmZvcm1hdGlvbiBmcm9tIHRo
ZSBiaW5kaW5ncyBhbmQgY2hhbmdlIHRoZSB0eXBlIHRvCiAgYm9vbGVuLgotIEVhY2ggZmxhc2gg
Y29ubmVjdGVkIGluIHBhcmFsbGVsIG1vZGUgc2hvdWxkIGJlIGlkZW50aWNhbCBhbmQgd2lsbCBo
YXZlCiAgb25lIGZsYXNoIG5vZGUgZm9yIGJvdGggdGhlIGZsYXNoIGRldmljZXMuCi0gVGhlIOKA
nHJlZ+KAnSBwcm9wIHdpbGwgY29udGFpbiB0aGUgcGh5c2ljYWwgQ1MgbnVtYmVyIGZvciBib3Ro
IHRoZSBjb25uZWN0ZWQKICBmbGFzaGVzLgoKVGhlIG5ldyBsYXllciB3aWxsIGRvdWJsZSB0aGUg
bXRkLT4gc2l6ZSBhbmQgcmVnaXN0ZXIgaXQgd2l0aCB0aGUgbXRkIGxheWVyLgoKc3BpQDEgewog
ICAgICAgIC4uLgogICAgICAgIGZsYXNoQDMgewogICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJqZWRlYyxzcGktbm9yIgogICAgICAgICAgICAgICAgcmVnID0gPDB4MDAgMHgwMT47CiAgICAg
ICAgICAgICAgICBwYXJhbGxlLW1lbW9yaWVzIDsKICAgICAgICAgICAgICAgIHNwaS1tYXgtZnJl
cXVlbmN5ID0gPDUwMDAwMDAwPjsKICAgICAgICAgICAgICAgIC4uLgogICAgICAgICAgICAgICAg
ICAgICAgICBwYXJ0aXRpb25zIHsKICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJmaXhlZC1wYXJ0aXRpb25zIjsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmbGFz
aDBfcGFydGl0aW9uOiBwYXJ0aXRpb25AMCB7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBsYWJlbCA9ICJwYXJ0MF8wIjsKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg4MDAwMDA+OwogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH0KICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgIH0KfQoKU2lnbmVk
LW9mZi1ieTogQW1pdCBLdW1hciBNYWhhcGF0cmEgPGFtaXQua3VtYXItbWFoYXBhdHJhQGFtZC5j
b20+Ci0tLQogLi4uL2JpbmRpbmdzL3NwaS9zcGktY29udHJvbGxlci55YW1sICAgICAgICAgIHwg
MjMgKysrKysrKysrKysrKysrKystLQogLi4uL2JpbmRpbmdzL3NwaS9zcGktcGVyaXBoZXJhbC1w
cm9wcy55YW1sICAgIHwgIDkgKysrLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwKaW5kZXggMDkzMTUwYzBjYjg3
Li4yZDMwMGY5OGRkNzIgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zcGkvc3BpLWNvbnRyb2xsZXIueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL3NwaS1jb250cm9sbGVyLnlhbWwKQEAgLTE4NSw3ICsxODUsMjYgQEAg
ZXhhbXBsZXM6CiAgICAgICAgIGZsYXNoQDIgewogICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJq
ZWRlYyxzcGktbm9yIjsKICAgICAgICAgICAgIHNwaS1tYXgtZnJlcXVlbmN5ID0gPDUwMDAwMDAw
PjsKLSAgICAgICAgICAgIHJlZyA9IDwyPiwgPDM+OwotICAgICAgICAgICAgc3RhY2tlZC1tZW1v
cmllcyA9IC9iaXRzLyA2NCA8MHgxMDAwMDAwMCAweDEwMDAwMDAwPjsKKyAgICAgICAgICAgIHJl
ZyA9IDwyPjsKKyAgICAgICAgICAgIHN0YWNrZWQtbWVtb3JpZXMgPSA8JmZsYXNoMCAmZmxhc2gx
PjsKICAgICAgICAgfTsKKwogICAgIH07CisKKyAgLSB8CisgICAgc3BpQDkwMDEwMDAwIHsKKyAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47CisgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owor
ICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXgyOC1zcGkiOworICAgICAgICByZWcgPSA8MHg5
MDAxMDAwMCAweDIwMDA+OworICAgICAgICBpbnRlcnJ1cHRzID0gPDk2PjsKKyAgICAgICAgZG1h
cyA9IDwmZG1hX2FwYmggMD47CisgICAgICAgIGRtYS1uYW1lcyA9ICJyeC10eCI7CisKKyAgICAg
ICAgZmxhc2hAMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwor
ICAgICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8NTAwMDAwMDA+OworICAgICAgICAgICAg
cmVnID0gPDA+LCA8MT47CisgICAgICAgICAgICBwYXJhbGxlbC1tZW1vcmllczsKKyAgICAgICAg
fTsKKyAgICAgIH07CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwKaW5kZXggMTU5MzhmODFm
ZGNlLi4yYTAxNDE2MGQ3MDEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwKQEAgLTk2
LDcgKzk2LDcgQEAgcHJvcGVydGllczoKICAgICAgIHNwYWNlIHdpdGggb25seSBhIHNpbmdsZSBh
ZGRpdGlvbmFsIHdpcmUsIHdoaWxlIHN0aWxsIG5lZWRpbmcKICAgICAgIHRvIHJlcGVhdCB0aGUg
Y29tbWFuZHMgd2hlbiBjcm9zc2luZyBhIGNoaXAgYm91bmRhcnkuIFRoZSBzaXplIG9mCiAgICAg
ICBlYWNoIGNoaXAgc2hvdWxkIGJlIHByb3ZpZGVkIGFzIG1lbWJlcnMgb2YgdGhlIGFycmF5Lgot
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQ2NC1hcnJheQor
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkK
ICAgICBtaW5JdGVtczogMgogICAgIG1heEl0ZW1zOiA0CiAKQEAgLTEwNywxMSArMTA3LDggQEAg
cHJvcGVydGllczoKICAgICAgIGRpZmZlcmVudCBtZW1vcmllcyAoZWcuIGV2ZW4gYml0cyBhcmUg
c3RvcmVkIGluIG9uZSBtZW1vcnksIG9kZAogICAgICAgYml0cyBpbiB0aGUgb3RoZXIpLiBUaGlz
IGJhc2ljYWxseSBkb3VibGVzIHRoZSBhZGRyZXNzIHNwYWNlIGFuZAogICAgICAgdGhlIHRocm91
Z2hwdXQgd2hpbGUgZ3JlYXRseSBjb21wbGV4aWZ5aW5nIHRoZSB3aXJpbmcgYmVjYXVzZSBhcwot
ICAgICAgbWFueSBidXNzZXMgYXMgZGV2aWNlcyBtdXN0IGJlIHdpcmVkLiBUaGUgc2l6ZSBvZiBl
YWNoIGNoaXAgc2hvdWxkCi0gICAgICBiZSBwcm92aWRlZCBhcyBtZW1iZXJzIG9mIHRoZSBhcnJh
eS4KLSAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50NjQtYXJy
YXkKLSAgICBtaW5JdGVtczogMgotICAgIG1heEl0ZW1zOiA0CisgICAgICBtYW55IGJ1c3NlcyBh
cyBkZXZpY2VzIG11c3QgYmUgd2lyZWQuCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvZmxhZwogCiAgIHN0LHNwaS1taWRpLW5zOgogICAgIGRlc2NyaXB0aW9uOiB8
Ci0tIAoyLjM0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
