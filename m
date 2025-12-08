Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E73D3B7DD
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 09:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IlpNQ1M0E21iotSMKTGHk4Xp1QEU0xLQCMervGoT1fE=; b=eeoVzipPz3ZQfy
	OQcSqJeqyMGBgMZlFQMiiq2UeJJU9RXQaMuIU8svaMukRVXHc3mG4xxkm4WcaacW3D2rNqosZlKRH
	ydNNIAMb4cTYDnGx1HWPT9zS/HxXbpN5uRsXv1NEHdCJLgfVtjRaTTzy9gLObtsUBUaete5kcaYKp
	I2WJcCKrnEhmeT6wt2cCbjcECg+pbjDeNuPCuwKz5ClD6C+OUAyPRL6j4F8XxMvDpMlgdmaY/46i3
	9x8mnee0s8eQP8RF4pMSf/DHv3L+6cio1OBPOtCOU7+o/4cigKb47bgIA4WEFdkRj5fbGUVk3rAoM
	4mu1MaBXUreGSk5haXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXKn-0000000Cr4m-2Ao0;
	Mon, 08 Dec 2025 09:15:09 +0000
Received: from mail-westeuropeazon11013063.outbound.protection.outlook.com ([52.101.72.63] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXKj-0000000Cr3j-4591
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 09:15:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnUa5O5AtG+omUVBxY7EWl9T78tMKiJN0PkUbJRetG6bHPxnlR3jDzYf7cKxvP8Z8q7XKqHkLb+03Vze28ZuTqApzaR1Uk8nN6vg1wQliYWHeanCd5Ly8pQgWwnmMWQEluthOmIxrUMAE4pI3I/X1u3zCCjYw+BXmS9LFkLYPmpwjKLK4mkUEUyfFAOIuWp4+YBnRi0FSYC6/ymUy3+H36yRFbQXZWhRYjfetgNM3SlALbUvP2e0+KZ27u5bS/in0/9Wr0G1UFqAmRBnt+F5G4FKCd2mzbdhIeuiADVa+86UT7tHHMpuEvy5v+IUflsTW9ZMMs53tF8F/d7irK0xTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImrK+7PxfaHdskzUvZzWlyZDgZdhYUYjlrPCfip1Rak=;
 b=sZAmiMIzJ0nXGko3WeA96vSzZr06cdSZkTkGuT0t2PeQliCdTrQbLrVmZARamrjL0XkjZYlC5PykOhbaH5dsEkmJpNFBD/rr8RA3yiT/edeuOWRTOYMOxNoTBO4GgdaK5N2k8cV8zrFjZPszmJLqBFTQX05CtsjOucRBVKQc0ZF6oLJ7ycDwT3Lexi8OjwUT+c4fNbo/ME8y1F7QQFXMt0rw47fYb06HYJs5qINR2ClvIjaFUp/aUEutyMml/ZzD0IyBHGRD8lB0Sy45boBxmP4sJIq37GnmFZu5xl6VPrF68NYUlAjd0L3BO266C9V4uTucpQXASqpMDJSDIvxL1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImrK+7PxfaHdskzUvZzWlyZDgZdhYUYjlrPCfip1Rak=;
 b=T9krZbcHeaYSOhXfMrGEbApJge8e3t5S4ZBrntR+7Mll6H5akOwVd/oXLsLcBtJKKevjonnik2HPQNhZpbc4Sub90RlgL8ZC8ro0m4id/StB6lSQBMt7AAwZIILWUq5Y/awx7lee/OqNJCfXl35u29210EXk4EM76DqoJmakoUSa6ecExcr7t0NEGik8OCQ5BEves2WgbSDEFwtDT24VJdveQCrOZA73LAH/0vBXKaj2vIgxgR3CQgpi4aCouYZ59HCpn9ZD3HBd9FEEDXh3MxCzZGovsRHt54NY6RsW0LboeYMSYUWK/FG6vkEaBUy9t6P0bA71kK20lP6CvuP5aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB8675.eurprd04.prod.outlook.com (2603:10a6:20b:42a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 09:14:56 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 09:14:56 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Mon, 08 Dec 2025 17:14:14 +0800
Subject: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when check
 read operations
Message-Id: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
X-B4-Tracking: v=1; b=H4sIAOWWNmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwML3eKCTN28/CJd0zSTlBQDA8M081RDJaDqgqLUtMwKsEnRsbW1AMm
 s1dlZAAAA
X-Change-ID: 20251208-spi-nor-5f4dd001f7e1
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Pratyush Yadav <p.yadav@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765185369; l=1142;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=/PtifCkv/ZBrbkN+qhfEMqXLAAUQM+b7HIH702rqRMQ=;
 b=RKCbAbdpTnpX73WmXwt0T4ugw8SY9HhXpDHuRC2GVmtSWU1COeMpI07X8gfhOUgp/lATP5/Uq
 ZiXXG7ajbRHDov2djYNWjWc0g2oCL0yqjNo6P5nnNpGMQLtDf0PqDTC
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG3P274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::30)
 To DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS8PR04MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fe9336-55b0-473f-4ec9-08de363a410b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dktSbCsyemFxNkhwTTkxdFpvWnM0cEFBNXRnRnIxaDdYOTNXb0hicnlLek9o?=
 =?utf-8?B?R25TQm44UVpEd0s1VVVlVm9ITUlwTlJCUE1LcVh5NEVrYlNoUzROV3ljYWNk?=
 =?utf-8?B?Zmk2eXpSTW42SFBEWlJKZk51WWw0c0hEZEh2Q0N1d2ZZb0p3QXY3dVkzdUNJ?=
 =?utf-8?B?OG5JczdtQlVhcjh0TlNSc2JuaGppQW1Hc1dqeUZ0SW9WNGE4ZEpzUG1GR3dX?=
 =?utf-8?B?d2k5WVJzb0FOTWZSRWVXWm8ydCtsdXF6N0Rld0xSMlZ6Yk5TMy9WcnBzL1N3?=
 =?utf-8?B?TnBLNW1LalJmSmhFQXR6SzltOUl2a2J1MGhjNzV0dWl2RzdwbS9LTEJzVmsr?=
 =?utf-8?B?a0RaVEtpZzgvRWRYNXkxbWNNWUp2YVpBWlE2d0Q2VmtLV2E5UnFwSWQ2UVYv?=
 =?utf-8?B?Z3ZVUFVMRE0vNjRjWTBwaXVkZ25aRTI3clNUSVY0dmhBN0VIb1pUYzNyQ2Fv?=
 =?utf-8?B?Y1R6cFkvQkIwY0p0bHRMcTVRSCs4ME1EVmUzV0NNZDMxZDREMTVZdW1uUGUx?=
 =?utf-8?B?Y3NsSkhNVHBWbSt3Wi9MYmZSUS8rWlN3SFlSUnZyR0pqbktLemJpOWFrTGdz?=
 =?utf-8?B?S29lNk1QS05tYVI1c2J1eHFBVEhPdUhyeVFjK3E2QWVFVWNic2Vta2MzTlds?=
 =?utf-8?B?aDhLaE9XVW03R3BERFdGMFlXVjFTbHBHR3lpemdFYUR4R20vZVlNMlZsMy9l?=
 =?utf-8?B?WUdwcHZqeHoycktvNzltaGZDYmxMU3lTZC92Q1lLdkpiQlArbzZCWDk0WUgz?=
 =?utf-8?B?TjJrelZQNUxuREFhK0piWEJhU1N2SW0xeW9QeG9NYlJ3eWtXd2FFQWZld2dD?=
 =?utf-8?B?aWpNTVh0MGUrVE5XMDlOUUlZNkhPOG1kY1JOWHVrSTVUNzBudkordkNqNS9j?=
 =?utf-8?B?dmw3VUFDd1J3NjBIc1Z5VkoyRVlzSTBmbEovVjNqZTh2WFF6Qy9ualJ4YzZD?=
 =?utf-8?B?NUo5dnlJNUFXRlNTL0ZDbjlWTkp0TmFHa2dmS1F1N0ZibzFtUmRKTGw3ZDdn?=
 =?utf-8?B?NHFXNTg3VXNPUzFBc1plcWZEM0YwWUV6Vnhaa0wrUkRTU1VweCtRMnN1Y3Vl?=
 =?utf-8?B?V0V1RUZkMXZ4eU92d2YwTlpYaUU4cW5GMWpnT3RvaXVUQ0pwbHdINUpUNnJO?=
 =?utf-8?B?MC9LbTVlSzlIQUpMYTdHVEJ3WG1nQTJKUWNPdW9oeGZXSFBud05XQ3FxTTYz?=
 =?utf-8?B?QTQ4aU8rYkdQc2xtNDZ2T1BwbEZaZUgzeStXWkV4ZGpoTHV4dU95YzY1QUIy?=
 =?utf-8?B?VER3RGV6bXZTbTl2UUxyZ2NRYlZkWHBaMFViZmZtaDVleGhPZUVIcElkeDVR?=
 =?utf-8?B?ZDlOU3FqNFlaSE4yaE91UlpCOVhrQjM0OXpyTDZSZlhpSjhmNS9GVytHUVBS?=
 =?utf-8?B?V1ZQZVMzUE5COUl1WTJsWms0TlJ2K1Z2cXI1S09iWHpIaTUvUm4yRHluUXlL?=
 =?utf-8?B?L2xudVplMm9NZFBiL2FyUUFsZXhsd2d6Y3dsSUVNem1XbXJESDlQRVA3Z2Vu?=
 =?utf-8?B?MzRFMmo4MkZSUGt2SGNIY2FScW9NVUR2VTU0SCtCQWVQc2lxRzdVcTU5RTF1?=
 =?utf-8?B?Q2hkQXZPWDRvNEVYN0M5RDI2WW41c1RMQVpJQ0lqMjNZay9WMkQxYjJEYzJU?=
 =?utf-8?B?aXJlMDIvRFJrdWRkeS8xRkpQc3doQ2tkM0tzS0hoMFdkSE8zYmZVSklwK3E2?=
 =?utf-8?B?cHZZeFBjMFZ0cjVadWxBcXBSeTd0Qk9EaW4vV0Z6R1dTUzR1VDNRWTJZQ2E5?=
 =?utf-8?B?TVNLemx6MGNyZDBYTEV1UWYwaTZzTE5DcnNmWEpqMW5JbndWdW9xMkFVdWpo?=
 =?utf-8?B?Z3Jna0Ivd1ZMWi8xSXhOSEZabnhnNUY3STRJWmN2YWlKaTN6K0NsVUZuTzFP?=
 =?utf-8?B?NGdCT2hRbW01WUYyQjU5dlcvMDBwSFJ4eTJrejRaa0djdkxtQ0NsVUJmMnI1?=
 =?utf-8?B?VWtiQXdDL0VpSEFVcEZWZjE2dGowbHFDR1Q3azlOcVE5NnZGUWQyYndxZ1lX?=
 =?utf-8?B?OElBQU1McEdtOXg1S0prSkUxVnJQT1BWSzZHcDRpV1dqREtPS1c0NXI3ZjdX?=
 =?utf-8?Q?kbx7Kz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U25IWnozYk93NXZsU001cEZlT2hTZWJxRVU1L2tZYkVDMmhrdkdkbllUeTNY?=
 =?utf-8?B?UmkyRTlXTExUbE1TQlhTYXBxeWFHMjg5ZklDSlJVQ1Vnc2lDV2xMZEg3a3JD?=
 =?utf-8?B?QXZIWWhMeFJqYXgwQ1M3NzBnOG0vKzNURGNSTExmeEtUclBFVlp2WEQ3WFNr?=
 =?utf-8?B?aEl2OUg0bSs5QmJyMGRRSHF1TFJwWmhOaHhUZnU4bG56bzNzUmh3anlKZFJP?=
 =?utf-8?B?OUkzZS9ka2Z1NHQ3NzJHNzFPNVNQOWRqYUY5MlhrZ3VsM1pnd2xaRnN6NHBr?=
 =?utf-8?B?VmlIQ3VEeC9GSnNTbmo0cGdyd0d1YTBWNFgrK3ZlNkwrOVkrczdEbzRXalAx?=
 =?utf-8?B?SDJmeGg2THlaS3ZPUXpzZTZWZGJNWUc1QWRCTmkzclZrbG9yVStxVjltRXBp?=
 =?utf-8?B?RVJXd0V2blZQbGw3NlVyRkFwcmYvcm05UytRbmlkUkhZYUR4dE5WNEh4bDRC?=
 =?utf-8?B?d0poWmRWT2JSaFVBOWFvbWFOMCt1aUFFd2pUWllqeXJIeTU5SkkyWkw4QVFm?=
 =?utf-8?B?ZlNkRHVqaDV0Y0dlMjhHeGR2VlNMUU9QWk16ZWxsR3dTWmRLL1grZHhUODkv?=
 =?utf-8?B?MTZjQno2MHZHV00xajM2NDkzV1l0MGpPUGpDWUFhWXpVbmZrV201aW5HZ2s2?=
 =?utf-8?B?bmtQa0NaTVo3a0hvM01yWXpscGlJL2R5c1VocnRQTHNkbDJzVlRHL2I4S2V4?=
 =?utf-8?B?Z3V3cHdCOHNyWWpvZlYvY3BWWXZuL09tYUdIbmJXdmhFa3lVTW1DYUpRZWI1?=
 =?utf-8?B?NGwwNzZjYUFTMXpUVU04eG9qT21MdXpXeFJZa1J2Y3RLeDVCTkRIRExzREhH?=
 =?utf-8?B?UHpWcVhmcTBPT29WNjZYYUs5TEFXNnc4cXUrWUMzVnRZYkgzUjNCR1dGakNu?=
 =?utf-8?B?S1RwNWEvcjd3TUhvYU5aeVdtc0gvRmJoQjdvMjFlcTZyYkdWYVJ4bFdKaGdJ?=
 =?utf-8?B?dWI0NmUvZFN4QnZqY1JpWGZXbEpNdERoOC9yQjc4K09JcU5VcklVWHJOSUgy?=
 =?utf-8?B?dTRiUFBCWXJwZ25FOTExWFFYajlKZjZQNGl4MXhKL3Z2WDFVdmRmSEhDVUx2?=
 =?utf-8?B?TW9iaTgzalFueFBHbTlFTkwyMytONlJVYXFmS1Y2QlRRWkZpWURUOEdzckZ6?=
 =?utf-8?B?aTBRenVMOEFLM0c1bTJET1dLTmRuR2dUUklic3FmVnVzQVNNQ2FPYjRXUC9q?=
 =?utf-8?B?R3lYM2RhMTlCbXVkVHlJVmN3UFErYkhOUU9QMW9MRms3MkQ3TFpuRUF0TGRm?=
 =?utf-8?B?SHF3M1IxcEM0YUcyN1V5TFRtSStvS2NGcEVjU3Fsak5EOWNCR3E2Y1ROQ0tV?=
 =?utf-8?B?V0dZQWRFQ3g1RlFZRkdpc20ybS94aHlKOVp0OFpXbVUwL2ltQUFJZjFYUVpv?=
 =?utf-8?B?Q3Q3eGt5R1cydmNabThZNklxdGx4Q3NMZ29yUUorVXlWNTQ1NGplVllkSjBt?=
 =?utf-8?B?UitHNHoxVDVnQnVnOUJ5ZWRpU0M1K25zOGhNNzJDYXhnT3ZPTlVVUEVWK0hp?=
 =?utf-8?B?SzQrNm9oQU9UbnAzbTFSb3dPWXZ5K2RIbm9KWDF2S2s0bER3Ry9VTWw5eDd0?=
 =?utf-8?B?enFUZENyQ1EwSEZUdlVBeFZMNUZyTDVjQThXUTA4OXJiQkNsbENkWXo2ZDIv?=
 =?utf-8?B?NnNCY0lKS1RENnFsZDFJY2ZqT1EvU2psYUxrUldQZ1ZHRTFnVUdpUDBsNkJ5?=
 =?utf-8?B?NFAzZ0Vydk5yRGFZVFBaS2V5MDFVNlVpR09DMXVzUnl1anFwQkdNOVRMeE80?=
 =?utf-8?B?RXQvcE9ianR4M0tZaGwvUmovME5VNE9LdWVrRHd4OEE3ekxsVURpZmNNc3NR?=
 =?utf-8?B?a2VoU3NkQVZpMXJPR0FoOWhUeTlRNFdZTlR5UUpuWmtEdUI0QUU4bWtwMWZB?=
 =?utf-8?B?T0xGZGhTUjRKSEhaNTAzSm5OMGwvMVB0R2JGckZRT3pvUFMwUUpkNHJjb29o?=
 =?utf-8?B?cFREK3QxYkJsZGZvTWRSbXVYSGtDTGp4V1pjM0YvcGY2STlWQXRpeFQzNldM?=
 =?utf-8?B?NEdJRmIxLzZxV0pTOVNpY1JONzRqS2Ztb05aSm96REg4bmhBaUNZeHY2TTJ3?=
 =?utf-8?B?ZzdKdWlQUzlZZjh1NFNZWnpkY2tKbTlRKzhuZTFqenFCREhhbHA3K2FhdFhH?=
 =?utf-8?Q?bfQFzNZT9N2iVv0ES2WYZvCJb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fe9336-55b0-473f-4ec9-08de363a410b
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:14:56.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: envoqfm/fVXpDRjYeoNbo3T0Z3ePK351YkMw9X3KdTLsSMKQUkALMj8ZQUvctS5U1dUkdnI2VAagjHOqcyp4HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_011506_176820_1D554210 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When check read operation, need to setting the op.dummy.nbytes based
on current read operation rather than the nor->read_proto.

Fixes: 0e30f47232ab ("mtd: spi-nor: add support for DTR protocol")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d3f8a78efd3bf9032b807e81b7a8b77556367e71..09312300108e4ac4307934a983e74a5510f3e844 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2393,7 +2393,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
 	/* convert the dummy cycles to the number of bytes */
 	op.dummy.nbytes = (read->num_mode_clocks + read->num_wait_states) *
 			  op.dummy.buswidth / 8;
-	if (spi_nor_protocol_is_dtr(nor->read_proto))
+	if (spi_nor_protocol_is_dtr(read->proto))
 		op.dummy.nbytes *= 2;
 
 	return spi_nor_spimem_check_op(nor, &op);

---
base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
change-id: 20251208-spi-nor-5f4dd001f7e1

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
