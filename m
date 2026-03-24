Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16AAFEC11D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n20MCAbnwxV2woKPc9pvs1mp4v5ApqUNont2a7ADt/s=; b=hqC9VuUOx1h7T+
	B+e7EP9tW7mMl5O9LfoWA7ESbVQHCspvC/K7eOqVjgC8PCPQOMPi9ltrFTcQWUsK3tbne6jMGx/ZQ
	e4bOsDKH9vadr4b3GT813SMqU9NTC4R3F7HVV3XdbVnBcvna/VSrO/V0hwfsRPnjDmdBO+Mv4OwO/
	aEtorWP1bz1YwINdtd6YcaQBBHAAznNhIpMa+qoQ4J4LiuYCVQaS0ikKZ/f1Uj60eRMJKnVzBXsxD
	hdKG42QcF1koIzxR7jqkqjJR3zuOBeeQMD5UwQlUnYj+j2WVxWVEiJi6LnmP9nJdpeQjX0mfZOL9z
	QbMJXq8lDoJZEtMgPoxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A47-00000002Ibz-1yUd;
	Tue, 24 Mar 2026 22:17:35 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A45-00000002IZ0-03gV;
	Tue, 24 Mar 2026 22:17:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAGJFkuAxJYT0TYBENJA5jr9FtKGyw4n8t4caTwopTdRBGSW1vlgb53JqLBXwJ38CijCMrCGfToN4CNKI+4psxB/PjbWD5CWmy9gw9xsK7JzJ0SBjrXPZj9rf5woXSut9axi6Mbef7CLFbJSc2hxK+79iMAhLJ9bP1CTbCosOjzmJqIm5oX98W8Eoc8iWSNKwZ0RbMc31a9llrK/yb3EVsd66nLHAz90EHZ2ZYASI72nWKdzMLD2Icwz8gFnqUoqhZqTdALqVqWO1Dfyw+4Ji7l9CkJeBWNlwSui8qoqd5DEHCQkjPb08DPPKAEOfUZgrzNd1wq32HdieG4h/wmcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir8roe9Lh/ICEYhR5b7GYSn2ttnEPSxpZ92nivEnBrc=;
 b=s4RGXChdN25ABNk5+EF3qLmClxszF/b1MNBu1qFNRM5SAociOBqt6Rwx/0UgYgCeSlLV8f/75pwVhuobcFDZhII1I67vs0NIaVn9WYGlagsYfSwpWJibfDtiy/0O0ku5yXPK0JeAtMKG1XCWtpJIBcig/BQKUzUCNPjtv5lPJ4Rsx52A3PUIr5ONj+a+WQeHEgoYpq+K11a4s5ux7UEOPFbCfs0naYDSBaLF15WtVT15//FrBFkfZwBrJvpDjr2lGWdPNNDeG9LcGaOJCA1/r7gdACtukcQbWvDQNyx4y4Qi92lmbh1F1hnHOYIKtHjcbz0kUjrk1cxulplVJHWQUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ir8roe9Lh/ICEYhR5b7GYSn2ttnEPSxpZ92nivEnBrc=;
 b=RAql+fzyHYbV5Q7JK5TOorqOHpCWAP9AFnahmPLUQqx0L2NjnaDptkRuP0TgDBm8GIQCxzTnLbVdOilj4LKchrwbLnTIGpC639ScbW/HsNZS+k7fAHXkgEPzOIEAp4aOjwh6B+7s4MEc0nM+kHteAbReWsvH6KiOWzYT7NGOmbqRmi57oN06GEfNUqpZXarI6qg+L+Ef6fejZzYbMcPivAH57kN4dMZunYKIlnotHrQy0raJgAWr4zNP5NEOwIfA/A+K/DlwADL/ihnKmOpQpaKmM8HwOE/n10qCH9SvoCmqvmLmwfsqiOJrglj1Z9WORvlh/SWtmQNjiCSenntszQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 22:16:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 22:16:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 3/3] dt-bindings: mtd: mxc-nand: add missing compatible string and ref to nand-controller-legacy.yaml
Date: Tue, 24 Mar 2026 18:16:20 -0400
Message-ID: <20260324221624.2424092-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324221624.2424092-1-Frank.Li@nxp.com>
References: <20260324221624.2424092-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SN1PR12CA0075.namprd12.prod.outlook.com
 (2603:10b6:802:20::46) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: b5136fb6-e7be-4005-73e9-08de89f30592
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|19092799006|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NbKz0jnltmYA0dpfT3RayuWF5vabtW3XLtcxWwFMk2Dam+HuCZmfWsIZdNfysygYQNpv2tbYB5In3vuzzPd6upb2QqgVVRft2lDyzQLzQRmpU1pPtU/Vvpq7kUrpj9xJJW8DA+8fXDm0yV26e1vjtNa9VJ+Ry8AkSYq7t8onQA0czoti7a9/0kMGWrDeJW2tUO8S7UtRh5sZJ/wwzdNLCTfKQjJ0qHdPQ4qsoTQtqy7FZCJWbn2jdQ1J6OXCc8dd0AkbAEldGhd3l4abfirKfAY+z3XmqYAdshMetaCgzY35y1ysGRwTIcAeOiDikU65skFV7ra3IDps0dZ5zgL0yqNulotNwnj/KDAS46ynLTjuRmVka6mtR1GQ48cHiLkuwsvZV+6OK6+jmBKeLddMepkHVTvP+vp7ga2iGw/mzT/j8+FY7UkY9WvcR8W3/M7zgNuUjfM4KbtvD8rq1WphT+7otJqGifvYL7DJ4dTLSuo2tQj9ODgPLDOtYm8Uj+xYNoiFxPwZ1eFIBSGIOynTT90lZOFtxMB9FD+bpgmpM2U38ZlPdfzgE7nW8ko0jWAdN0hfinhjuLzRVUyzuKAz5TDQv70uHfw32mLZLUWOkjrKm+mYNpEL9lFOW3dZqWgA9kHmRgLyWHH+m7heaKecG4NQReD88u3fh36vRqYaQ1sfzMAzyrZlDCdNqK/UFMLXcLFYYoZpnPZ1mDH6HnLB//C7ZO8v9xP14g9WURAabgs2nIC6DbYucskRLZ5WJdpBQwAHOb4J81IyXP/SpRz0IK3Prh8uGzO+yOG55FG4XuzGjZotB4Wa15nxLp8dAl0a
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(19092799006)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3NuR1E0U3FobWZtM1pDSEVWL25majVjYTgrTW9XZ0FlTkNQbTVjODBsUmIz?=
 =?utf-8?B?N0g1b29BT0VzL05zejRJeHVkaDJEb1h3WFBZNjJTbmw1VjJ0RElJWEgya1R5?=
 =?utf-8?B?VWNYRllkL1FwMDR5SmNuc0tnQ0FacHg0QjM0QUxjZ0tNdm9LcGczdnlJUUpy?=
 =?utf-8?B?cmxWUU42c2xndWxqVWJaMGpDa2VqWG80b2JzNFRJZm1PSitrcnVSSG9PMUha?=
 =?utf-8?B?TTQvZC9oYjFORm4xbnZGbHdhYjVqT2hkazRzOC81am5ndGFKTXgwSmpRcVVi?=
 =?utf-8?B?bllOSGU3N1hMRlBadUdHSzM0WEVSa1ZRNXVBSmxMaVRuMXdEL0E3WjBtbTNK?=
 =?utf-8?B?emNxWE9YQUZWbkhabTNOUEFGV1ZXSGlNR3VaeEpCZ1VUU0N5bHdYZm5kd3Yz?=
 =?utf-8?B?QU9hdGQ3WG9IaXg0bVhuN0VDcC92U056bS9jbUxRdjF5VmlWUElpTk5iNi9a?=
 =?utf-8?B?c28wc20rR2QzRThPbDFvWG1hQXh1aGVNOVNQWlBNSXQzWTJqbWgvbHRvd3FO?=
 =?utf-8?B?b2x1R2Q1amJjejkyUHZWV2JDSkZQdjQ3bFdON2NkY1N1dzNJUGZORFVMK0J5?=
 =?utf-8?B?MWZlNDNHdWZwYnh4b3hXKzFUYnRFMVB1ZHAxaUI4dmx5dFNubk5wVmVDZklL?=
 =?utf-8?B?RkZBN1kwQkExZnkyN1A3bW5XNUVUeDFzUUVhaEd6a09IN0hrOFNOaWo4bTQ2?=
 =?utf-8?B?UEtYWUExeWJjSTY0b3RpZWo1SGdGRWNPZ1AvQ3NPTUd0c3pFVVRvbzF4K0NZ?=
 =?utf-8?B?dUc3TmVHQ2JBbnBTSUx2MGlSZmV3RXBvSXI2U1NEQ050N2xtbG1VVkpSUmkx?=
 =?utf-8?B?WWtLQy9XWGdwU0VRVTRUNUxDOUhnbmE1OFh1eEtsL2VDZ1QyVEVHL3lxUkFm?=
 =?utf-8?B?dWdUR0tCa0g2YVJUSXE5Wk9BdWd4bXpJVFlSTmcwL2kwSXViYzFRdGNGRWlk?=
 =?utf-8?B?YThzZ05lMHhRR3dmT2FOZGRCRVhNSzF1WGFRWDZYYldtTmZKbndUU0pGVVdu?=
 =?utf-8?B?S1c0TjFxLzVFUUc5eGUwWjJXKzNxN2gxdWlsL093UHN2ZGxycmxMUWMrQnIr?=
 =?utf-8?B?TGZyOUlPYTJucUVWNFJkSGV2MkhmQ3lhVEZkeWdJQ2tWN1p5a21zV0U4Qk9W?=
 =?utf-8?B?VkhQTHVKTmdSTlZieEc2QUp2eEN4WXR6c1pKanJVenhlVnNyODROMXVjUkp2?=
 =?utf-8?B?OWhKbFZrSlVVYU1mOUFzVnVBdUdUa29iL2Fidk9iaHhFa2VjeEx4VGxnaVNq?=
 =?utf-8?B?U2xnLzN6L2ZXNkFYL0tNWTJoSE03TmdSc2VzdXZveG9rK2VJb2dTL1NaTkJL?=
 =?utf-8?B?cU1uLzBRbEt1MElmSUczTFo5YTFUbG0xUkdSK0JrbTVEOWZzT2hBTUx0ZHM4?=
 =?utf-8?B?ZUFveDB3OERtLzFUV25yWW9ha1MwZzgxWU8vdTRqcEJwRyt6cE1xdUV1aGwy?=
 =?utf-8?B?Z0ZaT3F3TklsOThxMFJmR2hHTlZrOUpWNnJDZXlIWCsxODlMR0hWTVFrKzc1?=
 =?utf-8?B?Y0ZwQVA4R0dIVjV5ak8rQk52QXZydmkvZ2hUdHhVeUNXTTlyR1pDQmdlR1I5?=
 =?utf-8?B?T21QTStNK1Zpc3RXY3lvMDM4UUVReFhlRlIxMklwT1IvYU9Bc001UXFzOE9z?=
 =?utf-8?B?TTJLaTV1Tm1GUzg4USttTkJaL0FjcUI4QkpxM0R5VEJYdW00aDU3d002UHBu?=
 =?utf-8?B?Wm8rdi9nMnZnVW85WG5XVGVIL2pwTlptNjMyU095ZmJCeUJac25GcDk3Yyto?=
 =?utf-8?B?UU5jT1hIVnlCNUpXR0xVdWhwKzkzN0J2M0QvYzF1QVlFY3F5RHFPcHZsL25Z?=
 =?utf-8?B?VHlQVEMzWmdXaEd6T3loYnhTSE16WXdkVzdEMEI0NjNmdU1UNTErZTUxMHpr?=
 =?utf-8?B?SkRoaC9Ma3NTQ0k1ZWN0QTQrZXJQVnp2akpYTkRHY3FOTzk1Uyt5WDlrTVJR?=
 =?utf-8?B?RUg2YlA3VGJOdFE5OWQvRWlaV3U0UmFKSW1tVFBmSUR1Mkt4Nlo0QXlZbCtZ?=
 =?utf-8?B?eDBydnpiMFdiY2xDRDlVcG5ySFMzK1VxNldkUlJ6ZHRaT3lHNFlvb0t6QUs1?=
 =?utf-8?B?TlNka05uc2NEeEppRkJFTi81aGhIaVdJNXdPcnNudTRkT0xwZlA0L0Y5Q0li?=
 =?utf-8?B?MGw4Rm43MXgyak5QK2hINE52bmZQeDRVR00xaS85T2wvT3ljaHRIYkthSmpo?=
 =?utf-8?B?TW9VR2pHSTNlL1NMU3V5YnNQb0Y5WDNSbWNSMHl0RWw3MzZrdGZlVi9lL1Yr?=
 =?utf-8?B?STBSUXhOMnBiZ3lDV2pFa2JuQ0g1VDN2RjJBcHpmUzVoM29nTlp3cUFMdnI1?=
 =?utf-8?B?UG1jZXJaRVQ4UHJoTkp4c1ZZaUJRQWJCdVA5U25BZnl0OVBIMm40UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5136fb6-e7be-4005-73e9-08de89f30592
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 22:16:39.8519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yyzYuFYN2tHTPXkZ9L64lW2tf/PQ7wna2sKcybh0dhlvsGvGI7L4N6Y79PiNBsdacedq3ZO3aGU9JsD52IumiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_151733_054218_43ECF403 
X-CRM114-Status: GOOD (  12.19  )
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

QWRkIGNvbXBhdGlibGUgc3RyaW5nIGZzbCxpbXg1MS1uYW5kLCBmc2wsaW14NTMtbmFuZCBhbmQg
ZnNsLGlteDM1LW5hbmQuCgpBZGQgbWlzc2luZ2UgcHJvcGVydGllcyBkbWFzIGFuZCBkbWEtbmFt
ZXMuCgpDaGFuZ2UgcmVnJ3MgbWF4SXRlbXMgdG8gMiBiZWNhdXNlIGkuTVg1MyBoYXZlIGFkZGl0
aW9uIE5BTkQgZmxhc2ggaW50ZXJuYWwKYnVmZmVyIHNwYWNlLgoKQ2hhbmdlIHJlZiB0byBuYW5k
LWNvbnRyb2xsZXItbGVnYWN5LnlhbWwgYWxsb3cgbGVnYWN5IERUIGxheW91dC4KClJldmlld2Vk
LWJ5OiBSb2IgSGVycmluZyAoQXJtKSA8cm9iaEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBG
cmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KLS0tCmNoYW5nZXMgaW4gdjMKLSBjb2xsZWN0IFJv
YidzIHJldmlldyBieSB0YWdzCgpDaGFuZ2VzIGluIHYyOgotIHVzZSBpdGVtcyBmb3IgcmVncy4K
LS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXhjLW5hbmQueWFtbCAgICAgfCAyMCAr
KysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbXRkL214Yy1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL214Yy1uYW5kLnlhbWwKaW5kZXggNDMzYWU1NzI3YWQ4NS4uZmJhZmY3ZDNlZGE4NSAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGMtbmFuZC55
YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXhjLW5hbmQu
eWFtbApAQCAtMTAsNyArMTAsNyBAQCBtYWludGFpbmVyczoKICAgLSBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgogCiBhbGxPZjoKLSAgLSAkcmVmOiBu
YW5kLWNvbnRyb2xsZXIueWFtbAorICAtICRyZWY6IG5hbmQtY29udHJvbGxlci1sZWdhY3kueWFt
bAogCiBwcm9wZXJ0aWVzOgogICBjb21wYXRpYmxlOgpAQCAtMTgsMTIgKzE4LDIxIEBAIHByb3Bl
cnRpZXM6CiAgICAgICAtIGVudW06CiAgICAgICAgICAgLSBmc2wsaW14MjUtbmFuZAogICAgICAg
ICAgIC0gZnNsLGlteDI3LW5hbmQKKyAgICAgICAgICAtIGZzbCxpbXg1MS1uYW5kCisgICAgICAg
ICAgLSBmc2wsaW14NTMtbmFuZAorICAgICAgLSBpdGVtczoKKyAgICAgICAgICAtIGVudW06Cisg
ICAgICAgICAgICAgIC0gZnNsLGlteDM1LW5hbmQKKyAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14
MjUtbmFuZAogICAgICAgLSBpdGVtczoKICAgICAgICAgICAtIGVudW06CiAgICAgICAgICAgICAg
IC0gZnNsLGlteDMxLW5hbmQKICAgICAgICAgICAtIGNvbnN0OiBmc2wsaW14MjctbmFuZAogICBy
ZWc6Ci0gICAgbWF4SXRlbXM6IDEKKyAgICBtaW5JdGVtczogMQorICAgIGl0ZW1zOgorICAgICAg
LSBkZXNjcmlwdGlvbjogSVAgcmVnaXN0ZXIgc3BhY2UKKyAgICAgIC0gZGVzY3JpcHRpb246IE5h
bmQgZmxhc2ggaW50ZXJuYWwgYnVmZmVyIHNwYWNlCiAKICAgaW50ZXJydXB0czoKICAgICBtYXhJ
dGVtczogMQpAQCAtMzEsNiArNDAsMTMgQEAgcHJvcGVydGllczoKICAgY2xvY2tzOgogICAgIG1h
eEl0ZW1zOiAxCiAKKyAgZG1hczoKKyAgICBtYXhJdGVtczogMQorCisgIGRtYS1uYW1lczoKKyAg
ICBpdGVtczoKKyAgICAgIC0gY29uc3Q6IHJ4LXR4CisKIHJlcXVpcmVkOgogICAtIGNvbXBhdGli
bGUKICAgLSByZWcKLS0gCjIuNDMuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
