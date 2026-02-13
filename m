Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9903EDF17D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qilg/bmZsLnQd1UkszsnlI4nMVfmUnNsz+LhR/HEI14=; b=wzFhCjiBlY1kyzfGb3tyG1mwwS
	eQ7vktKuaKTexdTpHqO29eoTjtndeLtzkcQeANOosIW97/O0nwTbtNuDsd5+rOJG5z2CrAqxM/wHR
	mXfA/R1LTLyqmt2HBnxfZysoY16ZtDE8vUY4P41gW1HlGk9oJBkgUmKP1XjUI0A0O0F4AiI+5it9r
	OpbdCokRrBY155CqabbwUdk07+WDvW7sAXG0mlsQ/kXMXNrdnYrzUUur31OXqRyJ8TVSQ7kld10E/
	qprL8Cb+Q3J2aBn6Rz3haVoBljW4kaUhII6IHvTUxiNEdILx1pNlWkGdJfk+ugg2HaNCH/lvZfwQo
	BhwUlDOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfL-00000003iS6-01v7;
	Fri, 13 Feb 2026 17:09:15 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfG-00000003iPW-2J5d;
	Fri, 13 Feb 2026 17:09:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7oVAIDiIwSFfspSOZif80G+G0lH/6yRhJwtr/NpBtfdrvn+giYf0APG9xNxsiXam/FGlSeEECy/QoxkKcMimR3SH9zkWFbtkY9uVnNX2Ed/HGMNQDC03LhCj7cYF8M8f764rwM1a7cumb2k+l4j7PFhTPDwdpvQ1e+Nms27ZIKNePr6PpBFQdIdKIOToXhlC6G+Bp8vhXphmKOgHGtarjEOWi4BUfTe2SqFV0gWO0C9x/jpiAk5iCsWJnBl+RRXJGHmJfXI4dPd7Oq+4R/Uf5dk9MqY79ThMPMcIbVI7KFkuRCz8AJs2QPq5O1Ovevjfcbnmm8fSv3CS7PiWlH95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBVFaUicTMnCkb3gY2zE9cEJ+FBZoepkgnYbFB93icE=;
 b=Goj0fEPckCI0QGP50SfG0odskeSi25CdL0Ajd5EM0Dz+aU6IVhgBDaYsOtoAisAyLn+Phb/Bq2Y6BvISYYDO2qUKgXCpuUeQk8T24VwF3QD2c80Wo335Cwxob3CENcqBzZarYOZAj/FQGcP359tNT8dXY/qcBXlyr83IQTDt9Ugn1nCTXW/k8N5qAj6tKVxZwaqAOt0ZQkVnQwjNBLih7z3MXpvrowkbVj8p4Gi2bFC4ODgOTepfW+Z3sqbwfCVSmkOArlkrVvzOqCA6oCpJe5nFfIdkIDddqilmc+lParztEUBoFsX6FXgQXV1pJSz7wcwh+1TcgmAoUQgE7bJfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBVFaUicTMnCkb3gY2zE9cEJ+FBZoepkgnYbFB93icE=;
 b=fyLXZiCmV+gODHddb59t2ufO8Sfu6f3eDDCw6vb1bqxyfocbvdkEDWLfZJff7xLa6e7cc8zicCweMxKiB2ArhUp6+hGmEbLvwgN6iOTzp25D21eR/eaOrh66RWanhkoDuewOW3XY2r9a8FrTx/uwBCqSI706huEexX/rjuePObAUHtoaWQ2HTw3JxwknHwXUdEmNVWNhqlVan+ecknnHoRPxvP50YTCmi5/tj/9KO5QhQj5arN2k+AfsXfBzNaJ/SX/SY0J9tifwKrwYiMptBOLjVOq+Er6J46g5eUQMJ26nE9bcuh/rYT+l7jUJwi1fYzOhV6h+Sw/cd2q1BDb7oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10441.eurprd04.prod.outlook.com (2603:10a6:102:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:09:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 17:09:07 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 12:08:25 -0500
Subject: [PATCH v2 1/3] dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27
 nand support
Message-Id: <20260213-imx25_nand_dtb_warnings-v2-1-f9d4b43bba24@nxp.com>
References: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
In-Reply-To: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771002540; l=1142;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=AibLFExSlcL6TrW1acrsUpIYNe1hWErsdVrNZ94NB84=;
 b=fAsighx1BabWCWigFLXuSrtEGMqkP6S3TYXxjtLZVrxjVBAu7XBiR4yhcjNSDnL/loI4H+Q3J
 HtJMgZm7gXKBrZPUdZiUNG93FyGZzP3fpsCi5wOsGVResnjXuNVvrMa
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10441:EE_
X-MS-Office365-Filtering-Correlation-Id: cac2d398-3d9b-4118-0823-08de6b2298f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3ZOM3JVcUN0RDMxSXkrRnNiUnplZjdrUnFWSEdsMldDdjkwSUx5T001MEYv?=
 =?utf-8?B?bXptYlpXQ2ZpQ200OEE1bk1acmNNQUFIOWV4TkM0SWtUUU1nZmVFU0J0clJ5?=
 =?utf-8?B?NFFYVXlid2kzV1Q2NTBXdVQ1SDBkR0ZNMW5Xa2c4alZPanVsNkxyK0ZZdnpw?=
 =?utf-8?B?L054aHQzaTluVFJYeFk2cWtqQUl5TEIyT1ZSNkhkVHRlZmRZYkZxL2N6anBU?=
 =?utf-8?B?cnhHZzg5VVl2RkRpTVpaK2N3Z0RkMk4xSkpOTE1Ic2hKa3hzWW95QmNjUHZP?=
 =?utf-8?B?WmovbUlnZHEwNmNsYjFodml1aTAxdk9CSjZSUWlqRmtxK1FERlN0blF0dWZw?=
 =?utf-8?B?WDBYSUQxbS9PM0ErbDUzSDhQbHhXdzVabmI3QkxxV250OU1CRzVNbkNPVjdl?=
 =?utf-8?B?bU4xdXMxTStlZlZ2K2R1RDlXVUxOK3FBYVlBMk9ZVTRuZnpHZTJsaTdsWEpF?=
 =?utf-8?B?enpYTHluMDVabCtRVnU3RlczSERHM3BBMi9LOU02UUh0VDNJUHRsU20wWnZS?=
 =?utf-8?B?dlJwdTh1QTZJUUpKQTljdko3YmdnTk5EeEh0SHRnaHB2UFo1N3BETjNwTlh1?=
 =?utf-8?B?bXROc3Z0UWZTZjdDWDNlZWlxeC9xakJGRVl4VUVTNkFYWU1pZW14aEtjNFVn?=
 =?utf-8?B?QTc1N2x0QlZocXJ3eEtCeDJ1UnhqQjVFbjMvRkF2dW5OODRWaVE0b3hCYVM1?=
 =?utf-8?B?cTViRUVKdXJPdGJ1eC9Jc0xhMHozSk5teW9waFljazNpUHU0V1kwM3pmNmZo?=
 =?utf-8?B?VlI0VmVoeVhSdU5MWklqaGphSFZTd3Q3Z3RFZlRKbDZtTFNlN1FRUmRWOE5W?=
 =?utf-8?B?TlNyOTZSOTk5NEtCRllzdDVTcU9GeDEzRHZOei8vcDl2Rys0MWFPTWh3STJo?=
 =?utf-8?B?ODVHYVNFOU9SendyZktGRTRmNUh4T0lHNUV2TCtxSi9DVFBTMEl6SGQvQ2da?=
 =?utf-8?B?bzluYURDSXpPcm1vVGNZNU85bFJiRW9YM2FVdVRHTzBURlhCK3BGeEpqdHZh?=
 =?utf-8?B?Skxseld4YlRqWWU2VUdWQ1Z6UnpscE1pWXZtSFZJc1p6QVA3NU1wdjlnYjVV?=
 =?utf-8?B?TzBMMTZnQlA5NUZKVmQrMm9ycjYzNnY4emcvTi9Zc3JITk95THU4WGIzRURk?=
 =?utf-8?B?alBWKytqY3hzbmNhMGJSbk9QMk5IM0dOTysxdlpmQ1N2dTBUL1VwOEg1MXhq?=
 =?utf-8?B?eVpyU1ZscXNyWTlNb0RPT29MOWxuNFJzWGJOdldUUXQ1WHlNUHBhU1Q3dTJW?=
 =?utf-8?B?Z29HYng1RERYSzdlZGp6OThtdENScWFDT1hOMDNlRnBqc1pkL2k1VkFJcStv?=
 =?utf-8?B?ZWt3RFE1b1N6eVBNSTZjeEF4RnFMQzZHSDV2QUdFRmo2TmkrL05hNExOM0tx?=
 =?utf-8?B?RWJPSTlxT0tCbURKOC9lcDdpUnQrSm1RRmlrT0ZFdFBUZVRYdEIrT056U2VI?=
 =?utf-8?B?R09CUHd5U29Bdkl4ZnVYL0Z5RGluUHhHdDlIdFFzbUxDS1gwNHY1VkY1QUVq?=
 =?utf-8?B?MllNbnhSNGRXeEZRQWIxbzVJdFZnR0FUbUJiM2VmdDY3dEFrRFJnNGkvdFJT?=
 =?utf-8?B?cWtCSUVkc3hadlUwRXpsUkN4b2xQditiTnEwaWdRaXFvd3J5RkMvd1hlU0tI?=
 =?utf-8?B?QkJzcTRNU1BLYSt5TWRueE8rRnZWY0drVUh1Qk1yS0xZZkwzcXZTQWRTcGxs?=
 =?utf-8?B?bzZYWVJzeEpwbmVMTThsTDBhcEZ1S1BhREN3cVpnbFlGKzN3TXA4MURJUENy?=
 =?utf-8?B?NW03NTMxZGh6aE83Q2VLOWRuWFU3TStoMnNGM1RmVXgyTnBJeVptd1ZZalow?=
 =?utf-8?B?Qyt5L2ZWSFcxQ1lhaUl3d0VxTVBtSlkxbnpuczhPNnpyREhVWElnWlEwbnpQ?=
 =?utf-8?B?aU9mRENxaExVVnVMaVV6cjR1bjM1WGJCeXNvSjF1K2J1V2poSDUxNnFTdUFz?=
 =?utf-8?B?UGUwTWtOSXE0SFNnR2RzSUpGTG5vODZMZ1FUSXREeE5UOW5QeFhNdkFnTC9r?=
 =?utf-8?B?RVkwcWhFdkZCMTFxK2JQS2R6TDVXTWMraTJuMUJDbklvdmtwNkthVWsrYTRv?=
 =?utf-8?B?REQwRUFKdzlQOEdTdHFTbWEvTldJZTk4djIxeEx0dDUwV0FTdEFESm9CNmxv?=
 =?utf-8?B?QjVmQThyN1ZyZFpmVDNyZnBKeGJsa3R3QjM4c3B2MmVad2pQSnQwRU45ZnRM?=
 =?utf-8?Q?qX4oq0FypKL9fbjaDFCFYqIauNbk6cuME7JFuxc1OQvl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHFLdXlrZW1nZmtUSWZKaDEyZDVwMklLMy9ob0prNzRsOEhvN25RZVdUdWZE?=
 =?utf-8?B?SGpjcHNnaTA5TFVyRWdGQTQzVm9FZlhWL2h1VWdRYjl4UlRQME1mSUx4TFNh?=
 =?utf-8?B?cjdOREszdUdydVQyek5GUW04Z00rNk95OW8zTGZ6bEtGMFJjN09rU1NVcFBX?=
 =?utf-8?B?eVlSWS9oSTU0THNGbG9qMkNXaVB4WkVGdEdCNS9jcFB6c01KTzB1UXdJOVdN?=
 =?utf-8?B?S2YzZGVIV2ttOGI0Vnc0bmJaYUswREM3T1hISG5CMk1mOGxFMWRPcUxuVVRQ?=
 =?utf-8?B?aGU5bmN6ZVJsSjczZ01ueE1WZFBoeDV5NXQyNlE1ZmZGbVo2N3hNOEFGSTR2?=
 =?utf-8?B?cFBxOUIyOFczRWpaNi92MTVxOTZhM3R1RW4yaTVwT09hSzZRY2ZPVGFrci9Z?=
 =?utf-8?B?YmFNbzlKcVBCdXA4SWNvczVuV2VMcFNyeUlNV3ljY2dvYW5peGYyRXdYeDZo?=
 =?utf-8?B?ajkrQ2plV1ZYMnhnMkVzYkdselVsVHBIVENIc08wR0VwZk41ZFV0YjIwY1Fz?=
 =?utf-8?B?bnJMSCtWT3FaUnE0N2R0YzRWMEFESnZvOUpPSWEzb2VKNEkxZmNoTW0xeXFi?=
 =?utf-8?B?cUZrTlhMM016MWlPSm94UnNQeVdkWlFydnJwTHY5bzJyYnZDZ0xlMkVHanVB?=
 =?utf-8?B?ZEQ3R00vZExDV21rMmdtVjhZVGVxZ3FxNWN6N1FuRXlsVHNhV3plUk9TNjcr?=
 =?utf-8?B?eDVNbGhiY3hnbU5OL3lzSWNrenRXTTFOdjNzOUtIOTRoVTVPMUsrZEpLUjN3?=
 =?utf-8?B?bEp5bXU4ODg4b0ZnUDBpTjZFYU5NdXJuRGJ0bWh6RHlLd1V6Z3ZERmVWOHF1?=
 =?utf-8?B?ZG9uVDZFZm5YSjI5L3BFSGVCNCtTcmxFSXBRTnJBWVBNcUF5dVdQVUhRc1hp?=
 =?utf-8?B?RG1xaCtCNTZ4SktCQmErc0NTWHZRTkt4UEpCdlE0ZWRjRVhpdml2RUdtMVZp?=
 =?utf-8?B?YjM4dDFSS0RYM0h2MER4cjB3WG5WZmsvYlcxTnFaRG5IR0lmYm5leWE0L1lp?=
 =?utf-8?B?Y2ZvUlBKa1JXNjltVk9hdmgyb25IUlhneGszNUNCTlFDeWNzTFVhSWlTa2NH?=
 =?utf-8?B?elM5Zk45aWlFVm5JdjJHdDhIZ1dmaVpHNkxTc09jdGptTlJFRCsxWGFmWHQz?=
 =?utf-8?B?RFB3TUI4L2JOVkphQkUyTU44NUhTb3BKcm9QMStjVGF5QUhtMDJYZ3NreGtl?=
 =?utf-8?B?dWxUR095d3NQcXpnL2I4eDQ1VTlzcHNzL09xTWgvZmZGMUNYdUZ2RVViNnZN?=
 =?utf-8?B?bFEyYzI3bzN2NUM3TlJTamhLS1pERG1XV2RvRVFKSitqVWRsdDlpbnpIOUZp?=
 =?utf-8?B?ZjhVVUZqVnByL29IUlhYbThvZWVNeVU1eENhVGtIM3M4YlBURWh4M051N0lZ?=
 =?utf-8?B?MkQzSjZhZm8yOEJWN1lyUEViOE5DdWdCMkxNVVVWc3AyRmRFWmNWMjhSUmpG?=
 =?utf-8?B?b3lTa2N3cS9jVmlCeGpnSGR0eWI2b2k1OU9nN1BtN2V4anVUZndpaXdCVXpU?=
 =?utf-8?B?TUhuWnpZMkJ0T1lUVnpENW1HZUlsdHJqUkx1a0hVSjZ0SnlqM3Z5VUhoR3Ez?=
 =?utf-8?B?NTRPanMvSjFjRkZRaWpNTmkzYlFabi9nRVk4dXFtQnU1Z1YvTnVGTzVwMFVn?=
 =?utf-8?B?TFpPbmVLYzFCM3lzTzNpaWUySm1DMDdNVFZDOUpGclExMHo2RWV1ZjE1Tm1S?=
 =?utf-8?B?NlRRcThzQXQwdk5WcjVoaHdOcnVmL0Urc0wrcEhFNnIvT0RCNmtVNFZnZC9U?=
 =?utf-8?B?eThDN1JGcjc1TTZESEg2VUpqTWVWeG5Rc2EwWnZjWkdweWZ2MWtoNlpXK040?=
 =?utf-8?B?d0xmdnBOcGlVU0dKMWVuQmhsbFcyMzhocm1XYmJtQWRESk1aZ2FoVVF2cDZF?=
 =?utf-8?B?OGxVSzdyMmI2aHBLTGYzakRNN2tqRG8xb3RpSEZ0dG5PUWhxQWpxT3RKOXRv?=
 =?utf-8?B?UVZNcUR5L2pRVkRTZjhKN0hkTmp3OExQS1NSQnFJSkVtMEp2RGN2eU5VU0I1?=
 =?utf-8?B?SDlNOWhRQVpzL1JnSXcrdnI1QkZxUTlFWW0yZ1dTSy92V1V0UGJzVk5UZlV5?=
 =?utf-8?B?empiQ2VTQk1ITU9mTlErb2Znaktma0s5dnhCeXVaK0pTek50eFgwZjNVcm5I?=
 =?utf-8?B?SWFXNWtxZXZlVjdYeE5ISG9SOEdrY1FGOHM2RE5PUDhHbnUyVE95d3A1OEFv?=
 =?utf-8?B?SnRTSkV6UWp4K3BWV2hJdnZvZ1BwSkNPMHdPM0Y1cjcvaDF3RlpFaEI0TkN4?=
 =?utf-8?B?U1pzY3ZmblJ5T0I2OG84UW9vNWwxaTJtRjFwbGJWRnBvVHo2RDhJODA4a0xy?=
 =?utf-8?B?R1lkQU91Ny9vYWdQV2srNWUrSEt0dm9XVW1yWU9xNGZNcGdSUllQUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cac2d398-3d9b-4118-0823-08de6b2298f3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:09:07.4224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r12COOmIw9yS3+/iJUeS16FuGQtco00pE7LIcifM/EIE7vtWuKk2ZHtYz4ChMnesMMTQP+MRlTNmV/CAcrUvrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_090910_596047_20B972F7 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
chips). Add one optional clocks for it because i.MX25 and i.MX27 upstream
DTS defines them.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
