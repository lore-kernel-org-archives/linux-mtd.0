Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F109BEB64CA
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Sep 2024 19:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nakwO7BHCdK/VFmUObe6+gHD75DFEaCKxi5VJN5+wgw=; b=vlgdyQyG4lGDRi
	VsSyszw7YJAPCZf5z9gBz4qJNmRmCkLEw1Uwv8Qt3IKU9OLOCO7jYw52SnJj3imt/uCgANkYr2bDJ
	osYDswlbjSnAgbGdq9ZRFJYFRP0LC4ekQ2+ib6e+g7Zn/xDgbpszRi9qjHI4+7mbLvERcVeEJDMN/
	49HCsgSeKjXNAl498Rp2syi/XIIx8EENaGUdxv8+u+R90IWnZmj4Be8lBRSSYDplAVAXJMi0oxNbJ
	QdMT/cE6L5GY8fjJyT0E86r6Zfpyn1DndI+H+1JER1eQvFa9mCzh/uSh3wKn/qre4eFUufUmckG3f
	qq/56/EwhBDwitZX9QOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn17E-0000000FXzB-0Sv1;
	Sat, 07 Sep 2024 19:29:00 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sn179-0000000FXyM-0c33
	for linux-mtd@lists.infradead.org;
	Sat, 07 Sep 2024 19:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAbbJz4nbBnoEu53Dt400prUgJPxDxJDCuFoV1WFlHzcsQjMylu8XPi0jO0rl1x5/gI90+3UjwoAYyWExnwofSx4ge3+7VJd0t+fcyQz0Prt52FF8cpFz4wwQqQvKSaNp6sZ9U8UerIXO3p4jLaIA2VZ+hn/NKSVXV4CvOs8scxBrvKSMsdkGfrAbWVu68LvQbuO/H9i3L2IhOdNt9ybW1OGDCV0ZPaX0/89Q85T24EAFYawLhADNfvw6ru+sTBDMplj8UH6/NR83lA7HBElznZvxPDBWBJh8lDOFEKWg/gWSmaFLJs6wBHwEwOc4D6WKTI7yxp3Qxg+g9UQeFoJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjE3uT3yTixY1vg83W/16AeCADhYhnmlLOR0uz8enmQ=;
 b=qxSIxuL5A9JNm321l/q0pvgKitxNujbp6ZP0+M4XRdvmtXj9ZPRpVnKzhTFB9fMi+0ZGY+z2rLZ/79fZpsKkIdRPaeq5aS0yG8HZJ0z8bHH5wBiyvLZaslIC1hat/pa0BrsKRgQSsg9Ok5XRTUoWcvy4d7ZYlmRy9t/Mj69dG7d1nn5yH33w8rktGwToDFrhW8K408NGEPpW5QKKotpniBpRvkRiYZDG5JZ72phqVif9QlAELWoBUC0T89QtCQrb03oCLtz/0IMML3pxhHDbRU8ZesHoB4gA/pzwrgZUOmY/wupUd9WR+0IZfyL4Zp8NpODlpV5AbgXVnapgSYq4xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=bootlin.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjE3uT3yTixY1vg83W/16AeCADhYhnmlLOR0uz8enmQ=;
 b=jdy6c1ktVwLdPoVj4813gV/zRTN4f8fbFwPyNsbUNfN7F6rEwCfOA4jvSahbLsAIX4E8/HICvg1tvurBYalEe91s31rP6Pl+qZnx3erd5NUYTqX5JmmGdLtIjnq4k0jMH9lyrfd6oe2qn2rMfaLokcs0YIs/4/GvQ/uxcHTBU0k=
Received: from AS8PR04CA0200.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::25)
 by AS8PR02MB6680.eurprd02.prod.outlook.com (2603:10a6:20b:259::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Sat, 7 Sep
 2024 19:28:45 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::74) by AS8PR04CA0200.outlook.office365.com
 (2603:10a6:20b:2f3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.22 via Frontend
 Transport; Sat, 7 Sep 2024 19:28:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Sat, 7 Sep 2024 19:28:45 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 7 Sep
 2024 21:28:43 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 7 Sep 2024 21:28:43 +0200
Received: from pc42775-2107.se.axis.com (pc42775-2107.se.axis.com [10.94.129.29])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id A14C2137;
	Sat,  7 Sep 2024 21:28:43 +0200 (CEST)
Received: by pc42775-2107.se.axis.com (Postfix, from userid 21033)
	id 9E1BE20C9556; Sat,  7 Sep 2024 21:28:43 +0200 (CEST)
From: =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
Date: Sat, 7 Sep 2024 21:28:26 +0200
Subject: [PATCH] ubi: wl: Close down wear-leveling before nand is suspended
MIME-Version: 1.0
Message-ID: <20240907-ubi-wl-race-v1-1-6f7f5e0aea7b@axis.com>
X-B4-Tracking: v=1; b=H4sIAFmp3GYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNj3dKkTN3yHN2ixORU3VQDY8uUJAtLQyOjNCWgjoKi1LTMCrBp0bG
 1tQD9kKcgXQAAAA==
To: Richard Weinberger <richard@nod.at>, Zhihao Cheng
	<chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@axis.com>, =?utf-8?q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725737323; l=5829;
 i=marten.lindahl@axis.com; s=20230329; h=from:subject:message-id;
 bh=uwMnOkdHQPy6aqz4lVLbACX/PkFfeI6SxzFDEdfnO5s=;
 b=TBnXo201oKQKFwgrSCmEI2eXZj83wMCURwirVepxXrSOpVyWaK9oT5MYWSyKRGpdIo+uANfxF
 DG/NPTfjFk3CNHaYX40HwtNh1G2iN0F273nqU8O5U9eZsf7O9XZwS1S
X-Developer-Key: i=marten.lindahl@axis.com; a=ed25519;
 pk=JfbjqFPJnIDIQOkJBeatC8+S3Ax3N0RIdmN+fL3wXgw=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C717:EE_|AS8PR02MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cd151e-7243-46fc-8b66-08dccf734a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TllGMzNFM2ZBbGZCUHpKNzdUa21QWmlFM2VEeUx5d1JLVG53VTYreDJCQVBY?=
 =?utf-8?B?OXJnUlUyWldjWTM4T1hoZ0ZXaFdUSFl4WmdjL1hWQ1dTa2JLOXYwQVBTVEhi?=
 =?utf-8?B?eGMvYURuajV6a1JHTFhsQUxzYnh5b05GUk13eUthdEJyRjZzbmhEVllQbmcx?=
 =?utf-8?B?ZUhkTVY5R3dRVHREYW8rQWlTZExSeFNvT2tKdUlIeEJHcTk5Vk43KzBjSnJp?=
 =?utf-8?B?b0g5S1c5RGR2NThzQWRnQTRpeiszNWRQNTI1Rkt4MExDWVJHaFBYWlNHU2hC?=
 =?utf-8?B?VVhuRTN4eUtpR1k2YWNTcVN3KzFsQjlDU0pEcjNvNVpuWVorZ1NDSFdybTcy?=
 =?utf-8?B?anE4NHRUZDk3N1p5RWJuNnhuZGIybDBwcUZwcVN5RThvaDlDdE5yOFJCZkMz?=
 =?utf-8?B?Um9FaFVPdmVPblRHdDRpNHkwZi9kczdMNGVaQ3BqM3BDSDYxWGlyOFVOeUFo?=
 =?utf-8?B?WEFnK3pIcUpiSVBEUENqd2E5M3lvS2loUlNWUnhJcGFkZUJWOFRBemduM2pJ?=
 =?utf-8?B?Vmpod09heGlTcXNHTjFMVVUyMk5GSEgvSTFDZGg2N0dGbnhXTEI2VEFiY2Vh?=
 =?utf-8?B?VUdmMUFGVHFqa2JyeVVTMW5DRnl4bU45V1ZzTHhnazVsWEhLN0ZSalplVnZq?=
 =?utf-8?B?QzRFeWxIRE44MDlOYjA0MEFwV0J6NldWbnIyb1c2YTg4Yk9ld3oyd1dkdDVP?=
 =?utf-8?B?cXNzbmtsYkdqelpsaWROd0hvRzNOVnFRVVBHOC9BRDIyODM2Q0pRUk5EM1Nl?=
 =?utf-8?B?ZzRMRGZybjVJNlkrbTFlaHNYZ1dyM083dkFvdEdqc0JVS0s3VytndnRXUnJH?=
 =?utf-8?B?SW1WQXFWSGlmVDZ2N0ljMlA3K3NvOGVpZmM3MTBYMXdqSVdjcnFIb1ovOVdm?=
 =?utf-8?B?bnllOHFSa3F0WmtJTlRCczlqeFlSLzFSajdadHQ1WXpURFJJdjYwbG9aUTgr?=
 =?utf-8?B?SmRJQWNESXdFYUEvVTJPcVlXSDFRQTB4WXZ5bGwrWWcrZEVrNnRhaWZJbFJo?=
 =?utf-8?B?TWtESE9GOGJpbFZIQjZqTENSalU1Z3FBN3FVd3ErZG9PUWFIUkxvdm9wRS9W?=
 =?utf-8?B?NXcrM0hYRXFXRTV1Y1dibEE0bDV0bjR6QVBtNmlma3lxeVhsbUhhZjhCZnhI?=
 =?utf-8?B?S0VaY29wUXFjWTJKaHFEbDgwWU8xYlJkWlh6SnY4STBCWlBGL1ZINldIVEdQ?=
 =?utf-8?B?RVZ0ekpOWXlvYTFVOFp3Nmh6Y1J3RmtzOThEWEVjcWhWUDNaQ0Q4QllOOGFV?=
 =?utf-8?B?Wm0wbTFOUUxsWTRPOHNsV3VSSDVhdDBlZGVpbGNIMmpzSU9SaFJvWlVVNWJt?=
 =?utf-8?B?SjlEbmpSYlgwTHBjUnJPNGdJaEl4dEJEazRWZG9zaFFlNUdqWWRWWnV6M2RM?=
 =?utf-8?B?VGVMTXZaamY0ZERNdkZ2enlTQTFVTEExaU1MUElFZ1pUdnN3TTF2aldwelZ0?=
 =?utf-8?B?M2lMUy9QQnQxVDVkRzY1Y0dzOGo2SHVnd0dlVTQ0NEdHQkNpU1hOS1p0cWN3?=
 =?utf-8?B?V2FUMFBaL1g0RDl4c2l3UXNQSUQvUXFnaXVjc3J4dzc2MVl5a29IaXdzeFFh?=
 =?utf-8?B?SWxVYVdHVEhJaTk0MTVkU2w4eU0rRDlCbFBGN1dZUHZHM2ZOWTFYK3ZSS1VD?=
 =?utf-8?B?MVBnaEEwcnBiYlJQTWdYN0s0aUo0YVhrMWNmK2tCVjN1aXRFSFc2M3ZLQ095?=
 =?utf-8?B?Y2QyYWdjSmNrSk5MOVhYbkJkWkRNbXM3cjY3QVc0a21MWnhUZFltQ0FMNG1I?=
 =?utf-8?B?d2dHL2JyVGo0SDlWSkZSRGZLOVBETnhZcTNxdWcxc1R4Z0tzcW1UMDRRS0Fh?=
 =?utf-8?B?OGZQYy80RmVQYmlNalM0YUgvRXZBQ1FkMDg3eTl6elFIVy9EL1h3MDVGb1hl?=
 =?utf-8?B?SDU2SUExNHZSRFZGYWdQTFNCYnMvcmVsRlVxQUdDU0owQi84TCtRdHFrR1p5?=
 =?utf-8?Q?KnY5EsVUWeZ9rNWS3UFHPJv24gE28kEw?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2024 19:28:45.7360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cd151e-7243-46fc-8b66-08dccf734a7f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240907_122855_633953_CA35A0BB 
X-CRM114-Status: GOOD (  18.69  )
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

SWYgYSByZWJvb3Qvc2h1dGRvd24gc2lnbmFsIHdpdGggZG91YmxlIGZvcmNlICgtZmYpIGlzIHRy
aWdnZXJlZCB3aGVuCnRoZSBlcmFzZSB3b3JrZXIgb3Igd2Vhci1sZXZlbGluZyB3b3JrZXIgZnVu
Y3Rpb24gcnVucyB3ZSBtYXkgZW5kIHVwIGluCmEgcmFjZSBjb25kaXRpb24gc2luY2UgdGhlIE1U
RCBkZXZpY2UgZ2V0cyBhIHJlYm9vdCBub3RpZmljYXRpb24gYW5kCnN1c3BlbmRzIHRoZSBuYW5k
IGZsYXNoIGJlZm9yZSB0aGUgZXJhc2Ugb3Igd2Vhci1sZXZlbGluZyBpcyBkb25lLiBUaGlzCndp
bGwgcmVqZWN0IGFsbCBhY2Nlc3NlcyB0byB0aGUgZmxhc2ggd2l0aCAtRUJVU1kuCgpTZXF1ZW5j
ZSBmb3IgdGhlIGVyYXNlIHdvcmtlciBmdW5jdGlvbjoKCiAgIHN5c3RlbWN0bCByZWJvb3QgLWZm
ICAgICAgICAgICB1YmlfdGhyZWFkCgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRv
X3dvcmsKIF9fZG9fc3lzX3JlYm9vdAogICBibG9ja2luZ19ub3RpZmllcl9jYWxsX2NoYWluCiAg
ICAgbXRkX3JlYm9vdF9ub3RpZmllcgogICAgICAgbmFuZF9zaHV0ZG93bgogICAgICAgICBuYW5k
X3N1c3BlbmQKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9fZXJhc2Vfd29ya2Vy
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHViaV9zeW5jX2VyYXNlCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRkX2VyYXNlCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBuYW5kX2VyYXNlX25hbmQKCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgQmxvY2tlZCBieSBzdXNwZW5kZWQgY2hpcAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBuYW5kX2dldF9kZXZpY2UK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9PiBFQlVTWQoKU2lt
aWxhciBzZXF1ZW5jZSBmb3IgdGhlIHdlYXItbGV2ZWxpbmcgZnVuY3Rpb246CgogICBzeXN0ZW1j
dGwgcmVib290IC1mZiAgICAgICAgICAgdWJpX3RocmVhZAoKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBkb193b3JrCiBfX2RvX3N5c19yZWJvb3QKICAgYmxvY2tpbmdfbm90aWZpZXJf
Y2FsbF9jaGFpbgogICAgIG10ZF9yZWJvb3Rfbm90aWZpZXIKICAgICAgIG5hbmRfc2h1dGRvd24K
ICAgICAgICAgbmFuZF9zdXNwZW5kCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3
ZWFyX2xldmVsaW5nX3dvcmtlcgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
YmlfZWJhX2NvcHlfbGViCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWJp
X2lvX3dyaXRlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGRfd3Jp
dGUKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbmFuZF93cml0ZV9v
b2IKCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBCbG9ja2Vk
IGJ5IHN1c3BlbmRlZCBjaGlwCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbmFuZF9nZXRfZGV2aWNlCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA9PiBFQlVTWQoKIHN5c3RlbWQtc2h1dGRvd25bMV06IFJlYm9vdGluZy4KIHVi
aTAgZXJyb3I6IHViaV9pb193cml0ZTogZXJyb3IgLTE2IHdoaWxlIHdyaXRpbmcgMjA0OCBieXRl
cyB0byBQRUIKIENQVTogMSBQSUQ6IDgyIENvbW06IHViaV9iZ3QwZCBLZHVtcDogbG9hZGVkIFRh
aW50ZWQ6IEcgICAgICAgICAgIE8KICh1bndpbmRfYmFja3RyYWNlKSBmcm9tIFs8ODAxMDdiOWY+
XSAoc2hvd19zdGFjaysweGIvMHhjKQogKHNob3dfc3RhY2spIGZyb20gWzw4MDMzNjQxZj5dIChk
dW1wX3N0YWNrX2x2bCsweDJiLzB4MzQpCiAoZHVtcF9zdGFja19sdmwpIGZyb20gWzw4MDNiN2Yz
Zj5dICh1YmlfaW9fd3JpdGUrMHgzYWIvMHg0YTgpCiAodWJpX2lvX3dyaXRlKSBmcm9tIFs8ODAz
YjgxN2Q+XSAodWJpX2lvX3dyaXRlX3ZpZF9oZHIrMHg3MS8weGI0KQogKHViaV9pb193cml0ZV92
aWRfaGRyKSBmcm9tIFs8ODAzYjY5NzE+XSAodWJpX2ViYV9jb3B5X2xlYisweDE5NS8weDJmMCkK
ICh1YmlfZWJhX2NvcHlfbGViKSBmcm9tIFs8ODAzYjkzOWI+XSAod2Vhcl9sZXZlbGluZ193b3Jr
ZXIrMHgyZmYvMHg3MzgpCiAod2Vhcl9sZXZlbGluZ193b3JrZXIpIGZyb20gWzw4MDNiODZlZj5d
IChkb193b3JrKzB4NWIvMHhiMCkKIChkb193b3JrKSBmcm9tIFs8ODAzYjllZTE+XSAodWJpX3Ro
cmVhZCsweGIxLzB4MTFjKQogKHViaV90aHJlYWQpIGZyb20gWzw4MDEyYzExMz5dIChrdGhyZWFk
KzB4MTFiLzB4MTM0KQogKGt0aHJlYWQpIGZyb20gWzw4MDEwMDEzOT5dIChyZXRfZnJvbV9mb3Jr
KzB4MTEvMHgzOCkKIEV4Y2VwdGlvbiBzdGFjaygweDgwYzQzZmIwIHRvIDB4ODBjNDNmZjgpCiAu
Li4KIHViaTAgZXJyb3I6IHViaV9kdW1wX2ZsYXNoOiBlcnIgLTE2IHdoaWxlIHJlYWRpbmcgMjA0
OCBieXRlcyBmcm9tIFBFQgogdWJpMCBlcnJvcjogd2Vhcl9sZXZlbGluZ193b3JrZXI6IGVycm9y
IC0xNiB3aGlsZSBtb3ZpbmcgUEVCIDI0NiB0byBQRUIKIHViaTAgd2FybmluZzogdWJpX3JvX21v
ZGUucGFydC4wOiBzd2l0Y2ggdG8gcmVhZC1vbmx5IG1vZGUKIC4uLgogdWJpMCBlcnJvcjogZG9f
d29yazogd29yayBmYWlsZWQgd2l0aCBlcnJvciBjb2RlIC0xNgogdWJpMCBlcnJvcjogdWJpX3Ro
cmVhZDogdWJpX2JndDBkOiB3b3JrIGZhaWxlZCB3aXRoIGVycm9yIGNvZGUgLTE2CiAuLi4KIEtl
cm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBTb2Z0d2FyZSBXYXRjaGRvZyBUaW1lciBleHBpcmVk
CgpBZGQgYSByZWJvb3Qgbm90aWZpY2F0aW9uIGZvciB0aGUgdWJpL3dlYXItbGV2ZWxpbmcgdG8g
c2h1dGRvd24gYW55CnBvdGVudGlhbCBmbGFzaCB3b3JrIGFjdGlvbnMgYmVmb3JlIHRoZSBuYW5k
IGlzIHN1c3BlbmRlZC4KClNpZ25lZC1vZmYtYnk6IE3DpXJ0ZW4gTGluZGFobCA8bWFydGVuLmxp
bmRhaGxAYXhpcy5jb20+Ci0tLQogZHJpdmVycy9tdGQvdWJpL3ViaS5oIHwgIDIgKysKIGRyaXZl
cnMvbXRkL3ViaS93bC5jICB8IDIxICsrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL3ViaS5o
IGIvZHJpdmVycy9tdGQvdWJpL3ViaS5oCmluZGV4IDFjOWU4NzRlOGVkZS4uNGE0OGVkMGVjZGI2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC91YmkvdWJpLmgKKysrIGIvZHJpdmVycy9tdGQvdWJp
L3ViaS5oCkBAIC01NDksNiArNTQ5LDcgQEAgc3RydWN0IHViaV9kZWJ1Z19pbmZvIHsKICAqIEBw
ZWJfYnVmOiBhIGJ1ZmZlciBvZiBQRUIgc2l6ZSB1c2VkIGZvciBkaWZmZXJlbnQgcHVycG9zZXMK
ICAqIEBidWZfbXV0ZXg6IHByb3RlY3RzIEBwZWJfYnVmCiAgKiBAY2t2b2xfbXV0ZXg6IHNlcmlh
bGl6ZXMgc3RhdGljIHZvbHVtZSBjaGVja2luZyB3aGVuIG9wZW5pbmcKKyAqIEB3bF9yZWJvb3Rf
bm90aWZpZXI6IGNsb3NlIGFsbCB3ZWFyLWxldmVsaW5nIHdvcmsgYmVmb3JlIHJlYm9vdAogICoK
ICAqIEBkYmc6IGRlYnVnZ2luZyBpbmZvcm1hdGlvbiBmb3IgdGhpcyBVQkkgZGV2aWNlCiAgKi8K
QEAgLTY1MSw2ICs2NTIsNyBAQCBzdHJ1Y3QgdWJpX2RldmljZSB7CiAJdm9pZCAqcGViX2J1ZjsK
IAlzdHJ1Y3QgbXV0ZXggYnVmX211dGV4OwogCXN0cnVjdCBtdXRleCBja3ZvbF9tdXRleDsKKwlz
dHJ1Y3Qgbm90aWZpZXJfYmxvY2sgd2xfcmVib290X25vdGlmaWVyOwogCiAJc3RydWN0IHViaV9k
ZWJ1Z19pbmZvIGRiZzsKIH07CmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC91Ymkvd2wuYyBiL2Ry
aXZlcnMvbXRkL3ViaS93bC5jCmluZGV4IGEzNTdmM2QyN2YyZi4uYjM0ODRlOWU5NjljIDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC91Ymkvd2wuYworKysgYi9kcml2ZXJzL210ZC91Ymkvd2wuYwpA
QCAtODksNiArODksNyBAQAogI2luY2x1ZGUgPGxpbnV4L2NyYzMyLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZnJlZXplci5oPgogI2luY2x1ZGUgPGxpbnV4L2t0aHJlYWQuaD4KKyNpbmNsdWRlIDxsaW51
eC9yZWJvb3QuaD4KICNpbmNsdWRlICJ1YmkuaCIKICNpbmNsdWRlICJ3bC5oIgogCkBAIC0xMjcs
NiArMTI4LDggQEAgc3RhdGljIGludCBzZWxmX2NoZWNrX2luX3dsX3RyZWUoY29uc3Qgc3RydWN0
IHViaV9kZXZpY2UgKnViaSwKIAkJCQkgc3RydWN0IHViaV93bF9lbnRyeSAqZSwgc3RydWN0IHJi
X3Jvb3QgKnJvb3QpOwogc3RhdGljIGludCBzZWxmX2NoZWNrX2luX3BxKGNvbnN0IHN0cnVjdCB1
YmlfZGV2aWNlICp1YmksCiAJCQkgICAgc3RydWN0IHViaV93bF9lbnRyeSAqZSk7CitzdGF0aWMg
aW50IHViaV93bF9yZWJvb3Rfbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuLAorCQkJ
CSAgdW5zaWduZWQgbG9uZyBzdGF0ZSwgdm9pZCAqY21kKTsKIAogLyoqCiAgKiB3bF90cmVlX2Fk
ZCAtIGFkZCBhIHdlYXItbGV2ZWxpbmcgZW50cnkgdG8gYSBXTCBSQi10cmVlLgpAQCAtMTk0Myw2
ICsxOTQ2LDEzIEBAIGludCB1Ymlfd2xfaW5pdChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBzdHJ1
Y3QgdWJpX2F0dGFjaF9pbmZvICphaSkKIAlpZiAoIXViaS0+cm9fbW9kZSAmJiAhdWJpLT5mbV9k
aXNhYmxlZCkKIAkJdWJpX2Vuc3VyZV9hbmNob3JfcGVicyh1YmkpOwogI2VuZGlmCisKKwlpZiAo
IXViaS0+d2xfcmVib290X25vdGlmaWVyLm5vdGlmaWVyX2NhbGwpIHsKKwkJdWJpLT53bF9yZWJv
b3Rfbm90aWZpZXIubm90aWZpZXJfY2FsbCA9IHViaV93bF9yZWJvb3Rfbm90aWZpZXI7CisJCXVi
aS0+d2xfcmVib290X25vdGlmaWVyLnByaW9yaXR5ID0gMTsgLyogSGlnaGVyIHRoYW4gTVREICov
CisJCXJlZ2lzdGVyX3JlYm9vdF9ub3RpZmllcigmdWJpLT53bF9yZWJvb3Rfbm90aWZpZXIpOwor
CX0KKwogCXJldHVybiAwOwogCiBvdXRfZnJlZToKQEAgLTE5ODgsNiArMTk5OCwxNyBAQCB2b2lk
IHViaV93bF9jbG9zZShzdHJ1Y3QgdWJpX2RldmljZSAqdWJpKQogCWtmcmVlKHViaS0+bG9va3Vw
dGJsKTsKIH0KIAorc3RhdGljIGludCB1Ymlfd2xfcmVib290X25vdGlmaWVyKHN0cnVjdCBub3Rp
Zmllcl9ibG9jayAqbiwKKwkJCQkgIHVuc2lnbmVkIGxvbmcgc3RhdGUsIHZvaWQgKmNtZCkKK3sK
KwlzdHJ1Y3QgdWJpX2RldmljZSAqdWJpOworCisJdWJpID0gY29udGFpbmVyX29mKG4sIHN0cnVj
dCB1YmlfZGV2aWNlLCB3bF9yZWJvb3Rfbm90aWZpZXIpOworCXViaV93bF9jbG9zZSh1YmkpOwor
CisJcmV0dXJuIE5PVElGWV9ET05FOworfQorCiAvKioKICAqIHNlbGZfY2hlY2tfZWMgLSBtYWtl
IHN1cmUgdGhhdCB0aGUgZXJhc2UgY291bnRlciBvZiBhIFBFQiBpcyBjb3JyZWN0LgogICogQHVi
aTogVUJJIGRldmljZSBkZXNjcmlwdGlvbiBvYmplY3QKCi0tLQpiYXNlLWNvbW1pdDogNDMxYzE2
NDZlMWY4NmI5NDlmYTM2ODVlZmM1MGI2NjBhMzY0YzJiNgpjaGFuZ2UtaWQ6IDIwMjQwOTAzLXVi
aS13bC1yYWNlLWUwMzlkYjg5MTIyZgoKQmVzdCByZWdhcmRzLAotLSAKTcOlcnRlbiBMaW5kYWhs
IDxtYXJ0ZW4ubGluZGFobEBheGlzLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
