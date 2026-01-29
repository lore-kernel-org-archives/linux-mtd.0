Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAC05D46C19
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 01:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X1bocuvC5jLJAQpHzn6LgkgERRSAY7qqgmOvSz/adYk=; b=Vnx9M1jTWuIEZE
	dvVhf0S5vYKfCisM32onS9xzqaxy6/PYZGRTkuV8hzVYkdfiXM6UY/Qrx071xlDtMiRvifq93XdU5
	yoxItdRozL7fEwgk36DJkiJx2VKczDTSATqBhcLC8Wb1tEapldp/c9ev3giwywjlBaqAsFhV/vEPI
	myK0ZnD5FNwB4pvYeIle2fmftp6VRDIb1g+9/kG+xoeBfxlQBE37m8KKay40gRhjp0tVnJj6rUcw2
	Wj4dGp2xJ4I8KjlULSR0Fi4Y8tv6gfU676EQ4xWG5nu6xUiDMfaVl7924erdnrph4rmRB0AiBtNWO
	z79OzxM0xYDErlBYRJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHH4-0000000H59T-2CQj;
	Thu, 29 Jan 2026 01:56:46 +0000
Received: from mail-westeuropeazon11011031.outbound.protection.outlook.com ([52.101.70.31] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHH1-0000000H57P-31ig
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 01:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lAxB5bfmV4QKT+xn7H8T4mQJBAwbE1mmNn0r8ABepTNQrnFvN3b+hxKGn3rmkmk7hd75AXkGhy122rvhnO+eX+ZGsV1YgPZcaiNryPmLgyLG6u+Hh3wTTIyC8gc52zWuSOH2mJf09pyY/C/EGBkHKUMo4EQNBKiRPqkiTmhJYnJUHgrFLq6cOu70mcp2hDGt2EVpD0o3chVXZos2V0gs42uSKO49pZSlLUPovnY3+YhV6lL/lTBb8QwThO0sJ/hpP835n+LtLdeGnYQR3saa6A18TRIRaVkX69xeshHYxg7/hqnVQOjIAy3zufis65jEU3HofVZZFytKXvDOQRRtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSySfAawfzvDOTpJKJF0bCupS3p0TN//1VIPqptRinY=;
 b=PQyiesCbt8iUPnnBsNTm9uV6EeHvEdrJmAGhXHMcq2zPuIf7yMCkswhivbZRBf7bd46E0O3FkRf+da4RkLq0xRf72RE/N9Z3TB9M4OURJ/1q8Us5PK7QypYxcxln6iY/jHlzojvgioAj8xHMVt0uhhXeLc41B4rZIXbYuDkwFF7Ft0gU01ifCKEcwDgE3TDVa/zWkb5KKnPG0TOaHoCIImMs4xjw9XuFidyehy68rRBxt7wU6i/AdhxC+8O1erHm1xiPkTP+q20aJAJJbpB+N3Z4nP3ChXMfrw+ReXzjn6NUsFgdIWuGEntRD2Tkc/ef5soXti0IOWwaFEf5dQzSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSySfAawfzvDOTpJKJF0bCupS3p0TN//1VIPqptRinY=;
 b=hsgDc485JslHDft4atMcOAAuLxgsgSmgqL2TKJHaSQGATRRh3Zb/vKPuVZ4/Hqk1JCLRaea4I36C4JLdnCYt22ME0SJZd6eW+/WwYPFEn1SwfjQhXDDplRzu5UR/+W/FOweWtSFBDhUpDLA4KUr1r8lB3X94ul+KSs2KWuMs4KOCCC0ogMQBARVGhIn6cQmCnrW75qPtq6cq18vmA1PlYlB68ggZY670hxbm7mvtZDdBS2gvwwSFPxDXPpZpqtEHYJmk2XvEDX+8tl6c8r+V0CWiVwkDQfNug26sNfK0/Oyw6uqtxxBwkBfEM8/xhHxceFuYp8zcBZeEONqjo3zFKQ==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS5PR04MB9731.eurprd04.prod.outlook.com (2603:10a6:20b:654::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 01:56:41 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 01:56:40 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
	<pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
CC: Pratyush Yadav <p.yadav@ti.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
Thread-Topic: [PATCH] mtd: spi-nor: core: correct the op.dummy.nbytes when
 check read operations
Thread-Index: AQHcaCMeJDvJbfjJeky70BWaM8plh7VotK3g
Date: Thu, 29 Jan 2026 01:56:40 +0000
Message-ID: <DU0PR04MB9496760AE1881329E33F0B7F909EA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
In-Reply-To: <20251208-spi-nor-v1-1-f6669a645395@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS5PR04MB9731:EE_
x-ms-office365-filtering-correlation-id: 290d1c60-1b76-4b48-3d19-08de5ed9a51f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RVRwQndhbzUxWnBhRnAvdm11a3poOFV2ZGd2LzhDdjZzTFh3NXdhQ053b0cr?=
 =?utf-8?B?a1J1YlJiWWh2VitwMVJQNURjUjdIRVJ3aTZLS0NJZ1JFa0pJZVdWcVovMnla?=
 =?utf-8?B?a2VpdW5IaE9qZFR3eTZGbEZXYTJWN3Y0Q0JVSFllVXN5czV5Ykcxa3FDNk5W?=
 =?utf-8?B?dlI2Tk8yb1FnL201UysvWmh4OGdBTlhDN0pOZ09LeDlzY2x3UkNJZ0xkdDFS?=
 =?utf-8?B?eTFubHFscjNQM2xkVFZJazZ5aXpJdXRIalcrT2NrN2VqcitGL2lqUU1zVVIx?=
 =?utf-8?B?RmtxZFlKb2dDV1lqOWpCdjFDNHk5VlliYytuZ3RtRWZKYWwrMTR3UDh3Vkho?=
 =?utf-8?B?NHZtWXJpUEdLeTdGUjF2ZWF0R2tiSHZtZFhSRm1IbUNKNkw4ZVR6d2xscEFn?=
 =?utf-8?B?Vi83dHBkcWt5VWdLLzhjcVdTT2lEdkZJOUZuTkI2Y2wxeERJeHVDUi9STzda?=
 =?utf-8?B?YzZvTnd6UEIvU3I0OGFRQ0l4UjRvRzhyWStrUFZGN2FDUlVVQ2h0YmtFRDVZ?=
 =?utf-8?B?aGxxRjdGY01aOERFZVpYK0xHcWlEQkZ1TjRXZ25oc0VIV0tQbXFrUVcvYzh6?=
 =?utf-8?B?QW9BTWRhY3BHYkM3Vk0rSG9hZDRMRm1mODNESlRuSGY5ajZqVHpYTlROMk1m?=
 =?utf-8?B?dXhWWnBNMjJvNmRveGhESzFKYnNUQW92a1p1enV0ekRrVDhiUVRZODdDSG1w?=
 =?utf-8?B?b0Mxd2I0VkQyZk9zdWdsQ3FXbU5PWVhZbXcvR0tac3c4ZkEzU1lXdE1jcnIx?=
 =?utf-8?B?RStuNWpPWEZSMm85SWZrRTBTMDZoVk5wRUZNc2hWcUtLeEtoYktHR0JIQ3VM?=
 =?utf-8?B?NUpZb0dlamFQVFJQTi9lT2Zla1prLzZoVlM1M2hsdnNOMENCMTNzcDZ3dXRZ?=
 =?utf-8?B?ZWxrbUdhbDdrMWNKNW5SS0JHRVh0SVpGbmZ3UmxMZUFLS1VuOHlVdUEvZ0tn?=
 =?utf-8?B?c3J5WVdqNzZYTnUzU2pqdjB2RUJyTFk2a2FGWlhIa2ZTTFJCWUFVUlZabjlE?=
 =?utf-8?B?QS9aT0NkWWxHVVNhdVQ0REFtUWpQUGhIblpSVmkyZ2cyMHh6aEpTMUVjeFNP?=
 =?utf-8?B?aFY3LzkzejhkMnNIcWl5SG52WHdjamxnMURYRVgxdFhtYXQwdDR1WENwT2RQ?=
 =?utf-8?B?ZkFiYjhIdTBpenVFb3B0M0tkK0doSGc1SVoyRVQwVE5qM0YwUGlDNzdndm8r?=
 =?utf-8?B?NE84SWpIUTdTaFdiK2FLSy9meUE4OXpDOEhaNHRBNTZvaEVvb3ROYldUN3Vs?=
 =?utf-8?B?RldkNTl2WXIyZ2tSdUdZZVk4WmRIVEx2aGhFdXEwTTBIMnRhRFZleXVtUU95?=
 =?utf-8?B?U3VleEQ3aWFpazVZVElwbDVqNXczd2xHa2lKVlAyVlpoWXRXZTN3RXFZK1hK?=
 =?utf-8?B?TkdqMUxCVnczRWxWY1BrQi9BdFBlWjdLWUE2ZGdwMTdPeWhEWmV3VWY3YW5L?=
 =?utf-8?B?S0VzMG5CbGtxUHl0eEpsbGxxS2lDTGFoRjIwRll6V05iZHEwWUhENEJCekUx?=
 =?utf-8?B?THNGbWtNR3BwUlBTMXhBWXh4bWxHQy9BRFVyd1BaQjFOYWJZdDl5eGhaQ3hU?=
 =?utf-8?B?L2I2ekNtUXNsT3FmSU9zWGRveDZqTko4N0lTNHVtamtuN21FclZqZXhBSy9h?=
 =?utf-8?B?ZUZObUxHS0N6bXFOTTdFYWxNSndCQ096UWdQRE1BOG5DdEtxazVIR1Q4ck5B?=
 =?utf-8?B?VUQzamk3RWI1L25zRzZCY09qZ2o5Y3lBRjNDU2hUcmVKbGVHQVYyclQwT1Az?=
 =?utf-8?B?L1V1aTBWWlR3WE5BVjdpbTNLMEZJbHJHWVpvTjc4cW1xN3VMQVJpTlgwRHZt?=
 =?utf-8?B?Z3k3em1yK2M2SlNyMG1Lb2d4R0JsQi9yTnFvcHBscllYNzRtS2IrK2h1aWph?=
 =?utf-8?B?VHk3endhSzM5UVAzQnllV0hoZXd6VGU0MWh1MlhvdU9XUTdiL2JCdTNzbE1k?=
 =?utf-8?B?K0I0a05DZU1xbDNRbnRyaUYyZ3hNdStwNHZ1eno1ek9qZnZTQ1FHa0VILzlI?=
 =?utf-8?B?cmxteWZOV2NEd1ZnaXd5ek8xRm43N1JUdU1QUjdwUVJCTncwWjg4NnM0T3E0?=
 =?utf-8?B?cjdIbzhuZHF2OGNCS2dhMXpFTUpkTWcwN2cyZ3loN3VNbUZDM3VSQ2RYSTUv?=
 =?utf-8?B?RDRoWHZQbGdZVlpmL2s5NlMwTGswNGhnb1dhcHYwU1ZSblA1MWt4RHBJUmI3?=
 =?utf-8?Q?KOm2T5pdKnIr8BMuSeTMmA0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmdlQzZkSy9rbVlRWHdibUdIRFRhcjRSbXdmaWlCd0dtV0loWnRIa05JSXRQ?=
 =?utf-8?B?c2Z6Y1FvenNjSWpveXYzRGcvVnhBNTNwUUkrdVRlZUpVVzRJVHVuMVJKRWpX?=
 =?utf-8?B?MmJzV0ZuZzd6cnNvWHFxYzZrOWNvNjdVbVQxMFNucjc4SGZWS2Jjd0Y1SDQw?=
 =?utf-8?B?THJ1dWJjbEk2UGFDMWNpMG5zTExBcTJIWHB6U1pQanhQSVVScmhKV2RTL2RL?=
 =?utf-8?B?cUhyRzRGUnY5R0h6N3E5RlVPUFYzMTZQYm1xMThpa3pwWUN1UW9iZ1lIRlZJ?=
 =?utf-8?B?TWdGUGo4Wjg2ZVRldzNTL2VHSXJjQUpIRFVMcjJMd2hQVFdNWTBXYWRjanZG?=
 =?utf-8?B?UFNZa0pTWUJBZHpPdmxZbWlQWXhlNDJ5RDBiczdnYm5CSmJ0VWJacGFkbVJl?=
 =?utf-8?B?UXE0N1dQcGEyZ0crOXZjVlpRVkFvTm1qb0tTZEIxdCtsS3RwblRWQ3Jaby94?=
 =?utf-8?B?elkwNnJFaWVVUHFmM1diV2REOVg5a01FMVdKNWdGQnJwMzZXd2VRSkJ3akQ1?=
 =?utf-8?B?clhCMW9zMW5RNUhZTnozeHY3SkdtckZ4VDNUVEZ1cThnR0dNREZxWlVFTklq?=
 =?utf-8?B?dW9PeUg4L0t0MmphNGVia2p1RlRRTDk1bUsvcFQzb09KT05OclRZYUJVbE9X?=
 =?utf-8?B?anVqVDliOWlWM1I1SGwxZ2lIWXNTWFI1ckpxemZHdHRxVi90MFE3WGpWc0do?=
 =?utf-8?B?OWtNWHR1eGlvUFVBT1RoOFYxUFVSMDJudmVlLzdOWjVTUElqYmd0K09reGdr?=
 =?utf-8?B?d0o0YXBOd2lEVGNzZXRyL3cyNklBM08zNHZZV2NlSkhkKytOV0MyNHVrWitj?=
 =?utf-8?B?Nlp6MEk5NlZPRU1xaUJUc3NvWjhGcTROeGJaelVBSUxsQ3pQcG5aK1grK2Nq?=
 =?utf-8?B?UGlaTWJHMFFVME5iNjZNOFBxamorc0Y0SEVUWXBEY0VEbmkzY0dhdDJtMnN3?=
 =?utf-8?B?WSs5TUVsS1VSWS9pYXcrcmlsM3QrYXdzV1dqTHU2cHVDNjk4Wm5jZllLUCtF?=
 =?utf-8?B?Nnh5MWJCOWVYcEN6cTJKNEdtN05ad0xwWGFBa2o2NGw4QlRhWFNNU0xneFEr?=
 =?utf-8?B?bjhHV0FEenFsa2J4U3Avc0xBbTZ0V2c1K3ptRFA1S3Q5ZnU4T2E2MnhVcUEr?=
 =?utf-8?B?MldNWXlVZERvSTRHZWV6cVhBczNVS21ha3NheFRzWHRHckUzNElES1A4WndU?=
 =?utf-8?B?TXp0UUZmVG1MTU9GVUZLaHhjQ1lFNEdNRXlTZVBuQ0V2WHMxam1Sb3h4YUFN?=
 =?utf-8?B?NHZTdUhmODFBaHA3K3ZHMkRMVWVIU2lzQlArdWFCUHB4ZmdWS001NURoaFg3?=
 =?utf-8?B?S05MTGxYbGhBWjlUVVdjSHlTaWl5SmFmemVQSStJMUdjNVVmUkhrcXRod3hB?=
 =?utf-8?B?NktHa1ppb01VNHp4OEZwWnp6SU94a0U1Y2tabEs4SlZDRU1WbHdVS2pGUnEv?=
 =?utf-8?B?VFl4alJHSi8yUVZjNTJ3QzdBeGNWaUF3cFVhWXRoMUlDSHpnbEJ3MUpsOWdX?=
 =?utf-8?B?QWw1SnVEU2ZGSjh5VitybUwvTmdqOWxCYjAwQ0JmckFlUmRKblpLZ3JZMU1h?=
 =?utf-8?B?SWJXUkRaZmFaUXVJNU10ZFBYOGJhUXNUaCtMUDh3b3lyRlpRbkFWRitJU21R?=
 =?utf-8?B?ZzVrZ0V0aWt6emVBM2x6SWhEK0RCQ2M1MVJlVEw4U3NNTkh3Z1ozV0djWkIv?=
 =?utf-8?B?TVdHczNUcU9wYk1rdUtrbXVXRnI2SWh3NXhFS3lFR2tzVFZoOWFwc3AyMXVh?=
 =?utf-8?B?ajRGdC9Ic25aYTZOTXIzUEt2RUxtY1YvLytNZGZOK2psVm9iaFU4MFp3QU8w?=
 =?utf-8?B?N3VHUVM5UUhyRnIvQnIxS2lNOFNvWDYzM2JiUGVWZWYwRWVSWFkza2g0M1VB?=
 =?utf-8?B?Z3Rvb1ZEVzBnNzFzQUx3UURWVFdDMWg3b0o4US9VUjJFTm5NOXVOSmhuUmox?=
 =?utf-8?B?bnN4emNEMFZJTWt6TVBvQlVLTFozaEJSQkx2NEFsYS9LSVIwZGIwdDNKb2lT?=
 =?utf-8?B?VnVoVWQyNytuQnpOd1ExKzVHZUxiUzFUVWhqMkpjUzB1NmNMMmlsZTJNU1c3?=
 =?utf-8?B?dlpZQ0ppaTdCR2tRRngrVnhOVWdlNHFTT3p0V09vYVJsSlVlcmxwWEh0MDhv?=
 =?utf-8?B?Y2RDalBvWkFIcVNxbjB3b0lITmxhWmFHMnl4ZWc4L28yajR3UHFHRDJlYm5u?=
 =?utf-8?B?QnJ6TVdpUVNXOGEwRzlkWjJNRkRnZVFYV0dObHdjQnFXUW0rbm9JOStWZi9w?=
 =?utf-8?B?NDdYdGxlZ1NaY3A4N1B1cTltSitFTHg1UVE0T3lTeExlWEZTd0VBYmEzOHVO?=
 =?utf-8?Q?WcXgrLc7DGg33aH3Oq?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 290d1c60-1b76-4b48-3d19-08de5ed9a51f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2026 01:56:40.4272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xfJqQOXgP3C3C0r9ApE5WGylF4HV91pjLEVtFCUjJqlyaPYbzf7hRUYJY04Pn79HVCRAQfSceyGbteNDitYxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_175643_768301_33C8C054 
X-CRM114-Status: GOOD (  20.50  )
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

R2VudGxlIHBpbmcuLi4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBC
b3VnaCBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IFNlbnQ6IDIwMjXlubQxMuaciDjml6Ug
MTc6MTQNCj4gVG86IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz47IFBy
YXR5dXNoIFlhZGF2DQo+IDxwcmF0eXVzaEBrZXJuZWwub3JnPjsgTWljaGFlbCBXYWxsZSA8bXdh
bGxlQGtlcm5lbC5vcmc+OyBNaXF1ZWwgUmF5bmFsDQo+IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPjsgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD47IFZpZ25lc2gNCj4gUmFn
aGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4NCj4gQ2M6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2
QHRpLmNvbT47IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBCb3VnaCBDaGVuDQo+IDxoYWli
by5jaGVuQG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gbXRkOiBzcGktbm9yOiBjb3JlOiBj
b3JyZWN0IHRoZSBvcC5kdW1teS5uYnl0ZXMgd2hlbiBjaGVjaw0KPiByZWFkIG9wZXJhdGlvbnMN
Cj4gDQo+IFdoZW4gY2hlY2sgcmVhZCBvcGVyYXRpb24sIG5lZWQgdG8gc2V0dGluZyB0aGUgb3Au
ZHVtbXkubmJ5dGVzIGJhc2VkIG9uDQo+IGN1cnJlbnQgcmVhZCBvcGVyYXRpb24gcmF0aGVyIHRo
YW4gdGhlIG5vci0+cmVhZF9wcm90by4NCj4gDQo+IEZpeGVzOiAwZTMwZjQ3MjMyYWIgKCJtdGQ6
IHNwaS1ub3I6IGFkZCBzdXBwb3J0IGZvciBEVFIgcHJvdG9jb2wiKQ0KPiBTaWduZWQtb2ZmLWJ5
OiBIYWlibyBDaGVuIDxoYWliby5jaGVuQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGluZGV4DQo+IGQzZjhhNzhlZmQzYmY5
MDMyYjgwN2U4MWI3YThiNzc1NTYzNjdlNzEuLjA5MzEyMzAwMTA4ZTRhYzQzMDc5MzRhOQ0KPiA4
M2U3NGE1NTEwZjNlODQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Yw0KPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYw0KPiBAQCAtMjM5Myw3ICsyMzkz
LDcgQEAgc3RhdGljIGludCBzcGlfbm9yX3NwaW1lbV9jaGVja19yZWFkb3Aoc3RydWN0DQo+IHNw
aV9ub3IgKm5vciwNCj4gIAkvKiBjb252ZXJ0IHRoZSBkdW1teSBjeWNsZXMgdG8gdGhlIG51bWJl
ciBvZiBieXRlcyAqLw0KPiAgCW9wLmR1bW15Lm5ieXRlcyA9IChyZWFkLT5udW1fbW9kZV9jbG9j
a3MgKyByZWFkLT5udW1fd2FpdF9zdGF0ZXMpICoNCj4gIAkJCSAgb3AuZHVtbXkuYnVzd2lkdGgg
LyA4Ow0KPiAtCWlmIChzcGlfbm9yX3Byb3RvY29sX2lzX2R0cihub3ItPnJlYWRfcHJvdG8pKQ0K
PiArCWlmIChzcGlfbm9yX3Byb3RvY29sX2lzX2R0cihyZWFkLT5wcm90bykpDQo+ICAJCW9wLmR1
bW15Lm5ieXRlcyAqPSAyOw0KPiANCj4gIAlyZXR1cm4gc3BpX25vcl9zcGltZW1fY2hlY2tfb3Ao
bm9yLCAmb3ApOw0KPiANCj4gLS0tDQo+IGJhc2UtY29tbWl0OiA4MmJjZDA0ZDEyNGE0ZDg0NTgw
ZWE0YThiYTZiMTIwZGI1ZjUxMmU3DQo+IGNoYW5nZS1pZDogMjAyNTEyMDgtc3BpLW5vci01ZjRk
ZDAwMWY3ZTENCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gSGFpYm8gQ2hlbiA8aGFpYm8u
Y2hlbkBueHAuY29tPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
