Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2351CECD6EE
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Feb 2026 21:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yV0WSEquHpxNCXoEnX/pCzj+vNdvrWmaHdvUnI5v2e8=; b=RnZoviycNgJHdRvdDuEtt92DnM
	OEAm8Jp5JCA8FrMEIlkTMr7StDRJV/pd9mE8EWAUm3nYljbFP7k2JC1PP1M9XQGdz8sx4T2dM32WH
	MrsTdyaEL1647Nl3VN5u8ttoV8sanEyJ9lrLFvCG214h3KfSG+9L95KEpGqlOBZnYD2MKhZ0bAoGd
	z/XU3mlk8abcxWFPblo/68OvkqriMYeM/h3jxcI8vVcjohROeLs/YqH7l20qNo256XjDe3mhx1RrY
	qEnQ18HSJr6yFAeXG4nahE8aXm8rYygEoRDp/KAAjyIgBEeTG0qhT9ljG0/GYgE429fhn3TpBBfXK
	vRXroh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHd2-000000014NW-0nd2;
	Wed, 11 Feb 2026 21:20:08 +0000
Received: from mail-westeuropeazon11011020.outbound.protection.outlook.com ([52.101.70.20] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHcy-000000014LP-2jkx;
	Wed, 11 Feb 2026 21:20:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sI0a7/WfwZUjfEt5MqOZH5s1BU4JCZ36QT2g5/bn6IZLhGrEkwEuUo4aRSSk4hAvJ401WN93HkN9z9E1up5jl8JtQeSzJZmASwHyem3LqzHLJBaELDyyZ04SQigNK1/qp1g+U+Ks/zoKF/6pkHqFZIHIY5yPNOVqfe3xu+F9IRlMh12vV4TrDuavpXMFYUXgkMUa325EY8o78w7BeuhB7Ll72HlOsB/EcW5UnTRDyYGhMxbMPxjXgb8Ep/Xl0JUJ7KikoaNPi5F+Nvkv0x5jWDct4kGV5MJ1KG0aF2tKqndGyvcCT3tUz3KCKcONFdjdsjNS4bMnBMkiNhpwhHLX1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEKhJLaZN4A8InwP1so5YWbTK7KmHfi1d2GT17yb7jE=;
 b=wrCx35JqGy7qSQjSBp446xHwIoI5EcN0UTWjGc298ehtFXx9aNVuVaMF5Vi0uEIbXWOpxV7kV1iAcPeRf7+LlYKKGzdakegBh98xXogdTcHt6pxSxDcZ7vOnYOTHcBPYvxjEeEdwI5X0EZowjUM4irQRnRpE/32rli8WTsHx2kTyJxHT2pff1RWw2wjo54HIY8e1OJHX4r09GjMsirYBTxdsW/PiyfGv0ntVTBPExWbx33bbjbAKqVxxxhUoheV2/wzbgY3xLiEgFhGQQb0G5BIdPz1s1Q4Q76NwUuqK7e8Xx8C+qDNw/mlzKO92IzBSAqReb3dwL8/Hkz4ZEH7Yqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEKhJLaZN4A8InwP1so5YWbTK7KmHfi1d2GT17yb7jE=;
 b=J/MaCmhc4Ibu18dMDxN5kmqieMAHKBHbOuO6HznOV/8actKWP+S0c4YxtrPPZx2WKq3G3c5pxTKclkyJ7kSgwtY4kcMn5qlUe0xUY6Uz4W1XnYVuhVXH5enlQ68J7qDFFQbuMF4hdLTh8E9s4XMRwSpPzc+iax1e1/Wlm3wWbx14MXyUwkCPVzmYmgXWTz07wkCcZksAjy2R3jqC12rbrJtuifEF/kGXkti51MzKNnTiBKQMH46D33Bp8cgAfAUqAtvrFLF6uPd6EeDh7g4WQiNLk8ilKiY4y/ybuIqk7xndT30nBRy4SBzHE/hY0I0twlaXCz+Zc5m7LBASvW86ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10154.eurprd04.prod.outlook.com (2603:10a6:150:1ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Wed, 11 Feb
 2026 21:19:57 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:19:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 16:19:39 -0500
Subject: [PATCH 1/3] dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand
 support
Message-Id: <20260211-imx25_nand_dtb_warnings-v1-1-2f06aaa1e3b9@nxp.com>
References: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
In-Reply-To: <20260211-imx25_nand_dtb_warnings-v1-0-2f06aaa1e3b9@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770844791; l=1016;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bGN5kdxrd28qxH2WUsvQB4a6VDS60yEwqYDE0PjGWqQ=;
 b=jgycAApArmNZesqf85oXYtZVk4n9FCmgARYADShJai6KKh447DNNDcYBETHqE0nbepZwqLzKj
 grmAZo8yLFgC1X7HBtJF34Hx3fgoZx0t77hs7EtvBIhUilJkw22k0BC
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d623a8f-e7a8-4422-a0bb-08de69b34ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFFzOEVZTFUvSzgwWXlodWgraXYycllQVmt5by9zMXZmUTcxbVJnYTFmc09H?=
 =?utf-8?B?MlozMG5PN0NEK01qRFJaNEx6NXNzcno5OXRJUk1IcXBHNEJLQTRzOWEzbDd0?=
 =?utf-8?B?OTNNTmRWZU9pSldRWmdxN200cGE0M05BVVRwUG0vajV3Uk1qSHV0b1hCdWxU?=
 =?utf-8?B?UzA5UDhzb0x6RHgxUG1aaHV0UktWcDc3YnBDUkhpV1lVa3NwR2RqMzFxaVha?=
 =?utf-8?B?VkJ6T2tDenpsVmVtUll0LzFOVXhsOW0vS3BIbS80cHVkYjJtVEpYRGlIUkl0?=
 =?utf-8?B?Z2N1TVV2ek1aUHF0OGhIUzBobUZtemo4ZW80VjRTLzErajV4czhBZDJ5MEdp?=
 =?utf-8?B?N2IxcG0yL01Idk9JNFBpdkVJdGc5eVlnTUNzOFVGbWhtaHB6blJzL3hRTHY3?=
 =?utf-8?B?QlhXZFdpTk0wZHRDUWxtdFR6REZvZGl1N2hKblB4RzhEVndxdFpnRGQ1UmdT?=
 =?utf-8?B?cG9OeW5UNlFOWWd3c2JWcUFuK1Q0c1RuaFUzTkRMY2NKTTVodGtRZzA3bmZY?=
 =?utf-8?B?ZlRmZmhLZGNvNHFmdG9sa1JQOHk1dFBlOWI2eTA3MFBHaHhXaUszd0JWY05n?=
 =?utf-8?B?RExpSjRhSTFxdmU5YngrbVg2Mnc3K09mNmhXS0swVFF4ZE5yYVBrTFRXQllU?=
 =?utf-8?B?M050V0ZJbmJTL2RPMkFxcDQwekQyU3pvNjZ2YXMxY1RhNDB5V1V1eExVaXBF?=
 =?utf-8?B?NUpHODJKR0lwSVgwU05HanVzZWlrc1ErY3NBUERhd0E2UE12MnRLR1dGdGZV?=
 =?utf-8?B?alhMMXphcmdadWRBV0NRRE5YZGVscWlzc3pldnpnRFR4QklGekM3dnhiZndx?=
 =?utf-8?B?SDBNM3J5TDNDM1U1Z0VhOWFNQWVnSEg2V3UrQzdTOUFzS2tlL2JPK3VkOGpC?=
 =?utf-8?B?aHRyUTVRdTErK2FncUhpUFZSc3NrcGh2ZkpHbG1nRk0yVGQ2REVyZTYrdCtU?=
 =?utf-8?B?L3lSMy9panBiY2k4V0d4c1ZkRlE2SGY0SHRWSWdZY21NZXJza0xQaXVQaGZo?=
 =?utf-8?B?MjdNVkUxYVFpZEtHTEE3aGJmQmlqczcvTmpEbUZwSnNBeTFCNFo4ekkvTVNU?=
 =?utf-8?B?MXVUNDFtYk1hQXk2NWM4VHlrWGViWHpOY2tWUTk0cTI0N3BwQ3dMUTV6Y1pZ?=
 =?utf-8?B?UTlrTEt6UmFoeVMyUXJmMUNwUFV6MkFvWExqdy9rNFh3ZlZ1OWhVMTlKa2Qy?=
 =?utf-8?B?WFJ3WUhlTnJpN2VTbW5mYzFOa0NIMWtIbXE4WEtuVTllZEdwL0xpR0Nsd0pC?=
 =?utf-8?B?VFNtVzA2M3JFYktQVklZZnAzLzI1VzNLS21TUjc3clptN1JqRWNGMUZqZ2gv?=
 =?utf-8?B?Vm8rV1crUTViRVlqYVpuYzhxbk5aMXV3Y1N5ckFmU2pPY1F6V1UzRHpxVkhY?=
 =?utf-8?B?UURYaHc3UnJIUzNXdlozRFdoUEZtTGR2Q0xkd2xjZlozRXRxQnpaVHBlUXFD?=
 =?utf-8?B?N2dYbC94MUR6bmlPbmVKeGEvU0tuQW14TURyUm5jdERPSTI5N0xoVGt4Yldn?=
 =?utf-8?B?bk1tQjJsRGRZTkJFMG5YdU0ydCtzOXFBOXFSODdwYWtzVUxhZXVSVlN6TDly?=
 =?utf-8?B?RTN4YngveEdwSE9vYld2cXFtQmVPN3p3R2NyTXE1YTM5ZzN6MDAvYzlIQldP?=
 =?utf-8?B?UTVJUlAzdFRsWnZCOTNzRXl4RmZlOFY3Q1pnY2Y0RXkycmFhZ0RQNzlJbmlM?=
 =?utf-8?B?YThaR2llcjZpRnFxTjJNeWVOSWRxN3pycXdUZmRDNE81Q3VzREJMdnlUczh1?=
 =?utf-8?B?M1lWU0JCOVJ6WDVxc3cyY0pudHkzL0VSRC9wMEI1SlJ3ZHBMWEJMdUFVZ0JB?=
 =?utf-8?B?TC92Unk4dVBPV0UrZjM5c0ZSTjRsdGVMUE9wbUhjL2xDakZ4YUZzMkdGVWMy?=
 =?utf-8?B?MVd1YlJVVzZIR0RMMVdON1E2TEFFQmNMdTJRaHF6TWxQaE4wekVjV0JjTnF1?=
 =?utf-8?B?WFltMC9SL2k0YW5SeDFwTGU4RWxIWktYM2tWR3ZBRkRDT3hKSEcrNWY5VmdK?=
 =?utf-8?B?aVUxOHA0U0ZyMzJvbUorcEEwRHRwSHVHd1lBZFRQZ2NmYkRJcGp4QXgvRFlD?=
 =?utf-8?B?elorU1ZUeGRoOVBEejJUM1Q3T3RpTGdid29HMmtuUUhyMGsxMjMyU2pBcFRU?=
 =?utf-8?B?QzNJazBNRHA4K05IbXFDOEREL0ZENkVwZWFiNkxEZFliREVDaU92U1Y5REJD?=
 =?utf-8?Q?d6+NXo0zI82JIQsRWTl1tLbWUSZzYwK7YF0yaj4eoicu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODFuQlo2RVlDWVovMG5IZHVuQ0xXeDRDZ3lVUjVlSlREN1dDV09SNlhid2ZN?=
 =?utf-8?B?WjBQMmliM0NXcnYzMzhtR0NRd2s2MkVzUkIva2VOb2g0Vk0xWDRmbVFadzQy?=
 =?utf-8?B?SXliSTlLa0NLQ0FKTzVWSTdTYVZWbUJidHAxN0VSUjdkZWFXUHNDeTQwYlFZ?=
 =?utf-8?B?RVplNUpwb3ZWNWljeEhFL3FGd1lPUXprMGo1eHQydnRETlhtREo1Q2JIVWRw?=
 =?utf-8?B?eEg3S0V1Z2F1dDVXdG5WamlwYUpHaDU5TFl2ZDFUVE5aQ3NtS0ZCMXJReGVL?=
 =?utf-8?B?dW5PSk54bk9OUUIyWW1scXZ5eGlveUdkWUw0MmhZNldTcG9SaGtPTGNiTmhK?=
 =?utf-8?B?dHROMHRtb1VJdFNNOWp0Zlh0MDdSM1d6UnNCeDAyQTZ1WjFzVHpZdGRNM3Z3?=
 =?utf-8?B?akJ5NUFvSENRTk5zU3ZNQzhqWXhZcTU3ekxqTGxmVWZGME5GdGxzRVNNT3pO?=
 =?utf-8?B?bWZpMUsyWlNpaGQvTlRJN0E5WFRCK2dueVFWTTNBV2w0VkdvWW10NUN3OHor?=
 =?utf-8?B?SFhwWGswYUloTDI0SE5Jdmc5Q0QxT2N3dUlqUnJJY2d4SjVBWi9DZlJiZWk2?=
 =?utf-8?B?dnljb3ZjZEd2YkRPNmh0SE9TSHVWOVhrRHEzaW5GUVNsV29QL25lSUlReUVk?=
 =?utf-8?B?Q0k5c0c3Nm9nRHM4bjg5QzBBT1kxZDFIa3BKSk9MZmFpb1BIQWkyVWxYZmsy?=
 =?utf-8?B?clovbEgwclhJalgxWUNMdW9iRFVReFRIVnVZNjd0U1A3bHNDaXg3UmJYbFZn?=
 =?utf-8?B?em1xazVFcEp4d2dJNHFEd0J5cGxreDBLUGtLVUx3M3RQRGNDb1lzc3ZCdHRN?=
 =?utf-8?B?djlrQm1pZ2JLcC9YdkxaQzBZVXZQNXR4M1JSY1pYdGRiV3doN3F0TEFtbXhU?=
 =?utf-8?B?cmJPSzc3bi9FQkpVdzRrOGFuNm1XcG9pZUt5RFhTL1hWSXlBdXJqSVk4bEgr?=
 =?utf-8?B?YW5UdUNsU0NiWTVpUUdyV3pGdGNwZEx2MVM2dDNhT2pack91b2w0TVhjWDds?=
 =?utf-8?B?TFJzeGFySHJMdzVKaVpmRXpGRVRuZ3hJTkRQb3N2allncVZ6d0NzSm5Fb2Ru?=
 =?utf-8?B?NDBJTzFnejcreU5PRzZQWkl3TktoT2dXeTh3V1RCM3NKZHNnNXFNOEpUeWtB?=
 =?utf-8?B?Z3prdE5SS2pITnNwcTJVS3BjQnJ4blA3YmozRlBxZkJwenJJd3hXS2JZSjgr?=
 =?utf-8?B?UmxNR0dvaVRRK0hoQkY5clBUR3pNNUJja21VdW9IRTdUZFNKVnpnQ1Y1Y3NY?=
 =?utf-8?B?TVc5Uld3V2c2ckh2aGh3ZlJ3aUFKYTZWZ1hFTDJvYVU4M3A4N28wUHM0RTJ5?=
 =?utf-8?B?cjhkaVl3aEtXSko1K3R0Y2RldE1sNmVDZ2Q0eEVLQy8rQzRCMUY1dERGYWw2?=
 =?utf-8?B?clNrQXA0ZDdJZWd1MFZoT296MVQ3b0N1N3ZEM0UxZVN4SzgzaE5RN1Vyanli?=
 =?utf-8?B?SGU0V0xxdWxudU5XSHREd2p2cW9KZExLbnhPd1l0S3kwYWNXVkFtQTM4bkdo?=
 =?utf-8?B?V2YzL3RDQktlbytrWWdyN3QzVWhYOEJ6aGlxbWVKalcwUGxKdFhvYzY1S3RU?=
 =?utf-8?B?dWx5clE1dWFpRzBWTXdzTVpVc3RreWpjTFZuTmVldzJZU2hPTkZaSjBXMFdi?=
 =?utf-8?B?c0R5d01saDZYVFNFSXkrWFBpMzIwTW1xdFJrZkFXTWxWdHhiaXM1WTV0aVNy?=
 =?utf-8?B?a3hlU2UvdWxMWnVIcHFNMFhIQjUvM1ErZkRBeExHU2VpSkE3SXBNUzZJWlZl?=
 =?utf-8?B?aE95WkxYZCsrV2ppaGJGS3NGc1NlTjVUQkxpaSs5eSs2aGQ4NE9NZTdpMzdQ?=
 =?utf-8?B?WUdGK29pVlRUa21GZlhvc1hvSkcrTVBTYWdJdjFCVmRKWC9LZDFaS2tzL2Fq?=
 =?utf-8?B?Nms5bmJtaG1SVkI4RmxIcUd0NmM0K1U4aWRtQ0RPc2dpd0FseCthcXJ4STJx?=
 =?utf-8?B?dUFOeVhUb0lubFJycThxTFM1MjZsdytzOGF6VXJ0TGp6UlIzZ3J0eVZHbDlu?=
 =?utf-8?B?U0QvRFMvTWtJN0E2eUpxQXkyQTlJSzAxdkhMcDc1Qm5hUnl3M2VYeHRWWko4?=
 =?utf-8?B?VkJJMGUxN2R5M05yalgwZDgwN3JONS9FeG81aHZpbzZOdUl5TGIzT0tTbmUx?=
 =?utf-8?B?dmtwYktDMlNVcFloYU44a0JCWE1jMi9xT1FkclpkUDZnSjdpSTRlM3lFRkVz?=
 =?utf-8?B?a3Q2WjBPOWcvWllNRDY0LytnOEl0bVIrbU9ZN0VyUFF0Mk5XN2h6d3ZzbVha?=
 =?utf-8?B?bkVQVkVMcThza1l2RysxNUNWS0NDMzd6WHNkZ2lEcWlWTlZsU2YxbEZ4c0g0?=
 =?utf-8?Q?hFF/L3Cz+qGYc9cUnC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d623a8f-e7a8-4422-a0bb-08de69b34ee4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:19:57.8528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfth8dK0qH8JP5DpLU7bTa80GjtYkXUtH8a33oiAGaza02GDfH26e8B2o8+rGbpk2B0n7Dj8POSouc3OXn6KcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_132004_698571_8C1818C9 
X-CRM114-Status: GOOD (  10.46  )
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

Add compatible string fsl,imx25-nand and fsl,imx27-nand (over 15 years
chips). Add one optional clocks for it.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mtd/mxc-nand.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
index bd8f7b6839535fe900ebf8477c79bd28c15726e3..433ae5727ad85b0fcb9617b5096fa57dcecb1683 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
@@ -15,7 +15,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: fsl,imx27-nand
+      - enum:
+          - fsl,imx25-nand
+          - fsl,imx27-nand
       - items:
           - enum:
               - fsl,imx31-nand
@@ -26,6 +28,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
