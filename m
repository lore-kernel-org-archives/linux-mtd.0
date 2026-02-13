Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14DAEEA860
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rF2tnyS0J6quFxHfJCp92+lZ9uAwmGjdZBQGKeluKD4=; b=yH24aRdWljVjNdvZgePU2IN4f2
	EnnZrSg8qnrMLR/9VvQ/Bxt4FHo/WS+jipGR6JEksht5bPdNY709oH8ezXO2JFi1szas67dogfRlX
	DHyC2dk/EZjjqmD6XSROdWku2jWR5sT+iMxaEd9tw2LbXNKKM0GoVXc5uxnB2teEJ4C6tdP/bSNtU
	Ur9ZUUii3oaLSEPSYveUiE1ZLI81E9NcUZl18n1vW691NEs8RxyrkoyZ6DBt+rMscwgdHDDvX6ufv
	Lqzywrov8vHiE3Ge6/yLNaxhRStj98mJ87nYs7kGl33JQH5XGAtUPcUZuIDlWAkdpRWTEDcndOtoT
	+Pxy0ErA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfR-00000003iX6-1CUG;
	Fri, 13 Feb 2026 17:09:21 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqwfO-00000003iSn-0Gae;
	Fri, 13 Feb 2026 17:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oykrOb5qF0U0aDqAfyGeVUGLNTXh4cXkl24ebcOkxvhwUh5AfNEdPGl1tEmc1OG1loGGYwYXGVpdmTuUTgGU0eCitvSKoc5NBGwySBQRf2GPwbFEcStebxdHzd3AfYaN8q2cKxfYsuptaInpZv3Cgq+87eFVv/A+P7xvDoyo0yRSeuUx30uO5fnptc/1mTNDhP8MvEatAk0oTYuYicxNxi3fcBDio12E6EsTbfUtO7CasPtbCA9jF1PqQNHtlw1Nepf+LRvEPV9LIYvr1/ZvWQV/eZARWD1XxjPP724tBaL0ZUwGGY7gWKvivbMjmHFwlmy0WqbhB8BNMt6sJ+s4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBzSfR2KF8Hmq2tbXBQWxLRcMzQFMRQJZ7S8j5ArGdQ=;
 b=FOhFJUjHfSp4pQrQytqAwIJjAPoXV8/0F4TIs94fLRKrOSrk1FilLHkZE24nUemD0vR9hvoYQhEwrzYuZK+KCrYkpdLHYeXpAZs8+1DEupU7rPHwzUhrWLrOdnLvYv7nxq6hUwAjq4aW47IscFs7tfsXEK4n/68Bz69PCVD323vwDkzYyBPpBS7aBVfH5uN+HupWUwPKaG8tG4uzeVBCGvObbaALd8F2qBuRIiaApzcEuBa7gMmt3PJDQuFRdhdn6wJ0VvR118nQVKTc/t2FUg5Xa6ezoAzUZ15FSj3H+WX6P6yVmmr347uI8pcqJ9de50bXECCIUi0nz+1TlBiq9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBzSfR2KF8Hmq2tbXBQWxLRcMzQFMRQJZ7S8j5ArGdQ=;
 b=VGF0137q7UYefv09yPVZnZkt+xbCHqnKzbO9qD+eK/nFYtwQtndAhWiemjaZ91lQOr/i+G1vrZF02WM5+yq1Yo0rgBkGY8oNvcCGAmD1WPlyfPN0+L6K/LQlJTiSSY7S9H/Qw0/xCb9wvoKJUq6coyXsyjxPN50vOeAz48fzcv7foJ8KdqjslC5IfsW3RL9VsjQ2OjjpNCrYKVU1am+35NQbwP/TAkSagSNKv/OzS3fD2J3IwUO+4zUnm97G6LL8elzaxX3WLgeVOqPIaIoswpJCvOPPZ3gvdwvOnqiHXxw9zOYLVH6iIJHlRcD+0QZLNrtsTqYpBOc1rt4grBnXsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10441.eurprd04.prod.outlook.com (2603:10a6:102:447::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 17:09:14 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 17:09:14 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 12:08:27 -0500
Subject: [PATCH v2 3/3] ARM: dts: imx: move NAND properties under nand@0
 node
Message-Id: <20260213-imx25_nand_dtb_warnings-v2-3-f9d4b43bba24@nxp.com>
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
 linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771002540; l=7477;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=J/dR82bnrx+lkucIYaQ9l78VRNjBB67uDQknzSkVvGI=;
 b=Iy2SZSr9fVZCrCtroef7lmQhvqqLo36DZIIYlNtI55re7U9+l1uMUhyletKwl669R4RM6gmMa
 3JwJzSUGWk+DfWHSqY2YIyejfd5AZ6CEmZz7qXH//44LkpRgkMHmkoX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10441:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9bb2a7-363e-4fd6-4712-08de6b229d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UE5JVUEvR2VDelIrc0NUWnhzNDd4VG9OekErTXptNlFxOVBsNTZQRURFd2Ni?=
 =?utf-8?B?bDZEVmlTaktNeHhncEVnbUhQMWRhMTQ0MFNqckVRcFlqSXFCWnNxUldYWVkv?=
 =?utf-8?B?azg5U0U4QzNidVUzT3psMndXaGxMQ214eFNvaTFtYy9KSlhndnJpSFRoWDRW?=
 =?utf-8?B?YXBhejFLYVlRVmw3VkRod0lNcDB5ME9rTE14a0xKeUZxdzlSd3B6ZlJHNklN?=
 =?utf-8?B?RnZIejJzV3ZGMjAxMjV3MFAwMW96SmtoTDBaWFhaUkZjSlp4T1YxbUdGN2VH?=
 =?utf-8?B?cUZDdjV0S0R3eEJwR09FbjVQMkZLcVFMbWJKVVdaejRQYkVHY0Yyc0E1aTBL?=
 =?utf-8?B?VHRnN0RWUjFxQURpV201eEhzNXlkR3BLNWFqU1k1ZFFrbVQ1RlBKMXFlZGlR?=
 =?utf-8?B?TnVUdVo0K2NQdmFrR3ZGM255NXg2UG02THZpeGQ3aVliNTBQV25GTUNCU3Fi?=
 =?utf-8?B?MDkvZ05LRDRFU1kwSjA4bFQ2OXo3dFp6UTZnZjhPRzZqTW1GaUdWSnd1QUZK?=
 =?utf-8?B?VXdIV0pWYkJuZjZWQ0YwV3ZoeG5oUHQ3aU0vMEZqNnNrK2RYaGJhKzMzU0pK?=
 =?utf-8?B?NFFpMmJHdHc0TXl6OG8wUi82U0hrd1FOYkh2bm9JaWJMak4wMDVXRmNPcHRM?=
 =?utf-8?B?bnBZMTlHMFdwZXF0WGtTOXNjWUMvTk0ybVFQS1VSc1ZQWFNsZkJpT0w2VmNz?=
 =?utf-8?B?ZUVXQm1mRFc2cXhXdmhSMjNsTWs3ZWJNcWNmQUdPREFXdmhnWVl2LzZjWG1a?=
 =?utf-8?B?ZktwTUh3RDMrTWRyK3VMOVVxNE5VUFBsSUdXblpCdmx6ZkFmMytvY1luTjBS?=
 =?utf-8?B?MEM2UjBEMmNHVTNmbkQ3QjFwcXRGSjI3NzRmVzY2MklzTDVVeXpvek1XbjdK?=
 =?utf-8?B?VHo3OWNldkhocFJIS2xEejJYK004bFpjeGV6d2U4eDFrUUwxb3hMVFVZVDl1?=
 =?utf-8?B?akJvVSswVGNpMkJLYmFqWWZzcHhEVlJVeWUzWTRBTWFOR2IwWCt0NFgxK0cw?=
 =?utf-8?B?Zkp3TXRqVk1iSksxYk5jOE1OTVJRVnFkNTErTU5JdTF1OFNwYTBhUDVtS0ls?=
 =?utf-8?B?ODJkZTlaeUYzVW95R3E3TU1mRVVWdXZyYTNneElESjE4QkErQUJMWUl0dFNq?=
 =?utf-8?B?d3Y1R3YxekhZU0xSczB5bFhhOHJsSUt5UllkTHQ3Zlh3QWkvbnY1MzRPQU56?=
 =?utf-8?B?ZEVhVEVhbW4yR3I3Q0RtTFNLQTAwaVZSNDhHUVBqZzhkMmpYbEtldWtFbTRI?=
 =?utf-8?B?eXF5NHRjMUpCZ0FXYk9ibllITzdZZ0l6Qk5sbm83MmdEK0NXYXd1OEhtWjla?=
 =?utf-8?B?RlF1bzJHY1lIc3crRlRNQjVSZC92N0ZXQ3ZCcTdzR0l6aE0xVnhQRmd1RzRN?=
 =?utf-8?B?UDVBVjc2S1BrZTExbGdlY1ZLVUpTdUFQdThXLzlVajZzZlZhT2xFbDlNZ1Zx?=
 =?utf-8?B?aDRpTXRqNXZGZmtYSEtXWmVxeGUxSzU0NVBGQm80Y01kRDNIQnlLL28zSmVW?=
 =?utf-8?B?NlhpYmlXQ3krU0pyNldsT3ZqNlh1eC9XVFVoTWRjbno2VFplS2xlYzZNb3Ju?=
 =?utf-8?B?QVRENG9Ua0xqZm1xdEhabTFjQmNwKzBaVnpWU2F5U3JQdnllS2hBMTFrOGYy?=
 =?utf-8?B?NU5BQ0NuSmIxWVVoQ3Zha1JxUkdOZzI4WGtZVlhrY29vOEhsQVZrRGJoRzNH?=
 =?utf-8?B?bm5mUzRzOEFDMm12RmF0SDB0Kzl2cTVuVDFyTHAxRkJtQkNmTzV3cFcxZG5G?=
 =?utf-8?B?UWNUN1hWYkx5RU16TG5HcmRXVSsvOXFWT3R2Rk04Q202UEJyMzJWRmVJdFd1?=
 =?utf-8?B?S1c4aGNTbGY2aExFMHE3NXpBV3JBcitLMWxzR013aEIxVTFCbTVJV2l6MW9B?=
 =?utf-8?B?VUhPbmxldGhUTkg0cUlXTHJnbWFuK25hcXJpakhra3hFOVRZOHE2MHFMVGZo?=
 =?utf-8?B?NC9WMExtTmJOU3ZjQUN5aUIyMDdpcHFYS3dkcFozR0h4SkpKUzlPazdxRXdX?=
 =?utf-8?B?OFp5Wm44UlFyR0JlTkhUZUtjbUVSejJ0ejBUZDVBTjZtWTRnRWtTYzU2ci9i?=
 =?utf-8?B?SW42MHlpcWQwNkk4L0J2OEMxRnlnVkxLMXVTaGZ2YkpVMWd1RTc2dGdQMGkv?=
 =?utf-8?B?c2R3NkNGZmNaV2k0Unp4bHhabGxZTTlLQWZXQThIU0pSK201NzY3aFB6ZnF1?=
 =?utf-8?Q?yjr/xZwAVexgZyWMBld55IGAELNRa1DniZAitXpFach8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkc4alVaYTF0RklUUktlRC83TzhTd3Q1cWpRZzU5RkVRVCtZUnEwb1I4VFRQ?=
 =?utf-8?B?Y1VtSERTYW9aZlRZWWNzUHRTSGc4Z0syeXVmQ1ExVE1xNHZtSTRGVDFNaFdq?=
 =?utf-8?B?YlUrUC9hZEt2NjhFTkx6cFVVK29XemQ1WE9EZXpYZyt4Qk1sZ3FIakM1NDda?=
 =?utf-8?B?RXg2aDJuNHpJWWMwQXRNVk9odmlsblovVklqcm93eUsvWXYyL3ZhMzNrVnZU?=
 =?utf-8?B?dnlRU2hlcnZRR3VSZlFGNC9QdFpzRDMwU3p5akt6dENjTHo0RTFWT1AxUHJW?=
 =?utf-8?B?QVU4RFVrK1N1Vy85eVcwYW42Vm5SSC9hQjZvR0NtWE5MWmFVRkVzbkxMSlc0?=
 =?utf-8?B?SUlzWENRa01keEkzTE5tREI4anNOSjNvQXQvTGoxbFB5dDlxa3g3WExYSTNH?=
 =?utf-8?B?ekUzcFBCaklLTjJxZ1BIVktPWStrbzdacWpSM05xY0FZVzlOaFp4UzU5TVpR?=
 =?utf-8?B?VXRodnFYWERaNUdsQ0NOSlhXZTY3VjV6cXpqT0g4ZHFIVVFkR2ZndnNCT3Rq?=
 =?utf-8?B?NXUzS2NRbm1qOXlCVjdvR0FPRjQrV0MxL0lqUWdxWEdKZExpWStmcTNSeEFu?=
 =?utf-8?B?cU5xdUsvT0MxeWpWcGV1QThDYnlvSDI0V2ROOElYMFlHQTltRTJ1bDdGaThN?=
 =?utf-8?B?cUxQSzFXL2p1R1N0UzRzMkZyeXJ5WlhycUlxTUZWRlNsNkNGVmJjVUZLREli?=
 =?utf-8?B?ZnFkakJSSlNlY1h5enpMRU43bm81em5UZllXeURpbmQxRlVHcWtBY3V2dWNi?=
 =?utf-8?B?b0RXK2pyWVBrTjdFN0swQVVVUFVndENPMDlublo1Q2QyUkxaNjR2a21LYTBv?=
 =?utf-8?B?aGZqbUNqaVVmcXp5QlJCOTBRQWNyT0c3SS9XaCtXaUYyZmwzTlJET2MrdkNl?=
 =?utf-8?B?M2lDdnFzbmpGZVE4UGJSelNsYkNwQmdDQXFKN0VSTzdpU0RUM1RvcDBQZUxx?=
 =?utf-8?B?MGpKdE9tQUFqV3hMSmIwakZXQzFtR0ViZ1hLREVVbEJNTVVvKzRtczdXZml4?=
 =?utf-8?B?eDFEeWswcGZHenZIaWRETXVPVy9xWldXeE9ULzFia1hyd1RHQXNrazBCOUlx?=
 =?utf-8?B?TU5sbGFRMmlEY2xCVHVTVjA4Yjg2bHQyK2s4MWRQMEFuaVNaV3lmMkpWb3JD?=
 =?utf-8?B?T1FjVFgvVVpvSFlXZlEvL1JuUkY1QTd4dloyUkovMEFUMXNKcWNRUHdHUmt2?=
 =?utf-8?B?YXQ4akwwN1FFRWVwUTd1Qm1DQzlYNWpWS0Y0ZHlGemlkcUlIZHJnNDI0VHk3?=
 =?utf-8?B?eGk5V09WWXlnbFhpa1VVZ3hLV0RHazBOTDk3anErZGVvckIwOU53bS82UU05?=
 =?utf-8?B?cVl5MUgvMG1aVm1ieUU1eVUwZHBpNEFhZlF0WXVjcnk3MFBDb3ZtTHg3SFRD?=
 =?utf-8?B?ZXJvREhkaDk3NExFZ1RhaUdVK24xak0zL21NTEZZdGNVa2xRTjB0NmpFblpO?=
 =?utf-8?B?TlhMYWprcUc5RHgxNXhOWFJGeGZFd2hyNHIzbVZ1NWNQVi9lek9iVEQ2VFRv?=
 =?utf-8?B?RXArNDBDSGx6NUkyQnp4dldGaDU2N0xkeGdkK2c1Z2xNWnZWUk1qclVWdzJy?=
 =?utf-8?B?M2tQL2hhQ0diVXZQeTZFeXRRdUV3VVdkK1QwSk5OUG5PWkRXSDh3NXRyaC8v?=
 =?utf-8?B?SUNOelQ5bHkvQWhPdUY0Y0p4SEx2NnBZWHRVeFBjTUpHSVNlQ0JQVnc2YVYv?=
 =?utf-8?B?TyszdVNjM1ZMaHdBb0dRWDZWM24xTlYxZDQzcFNNb21VbDdOSDB5MlA5dWd2?=
 =?utf-8?B?OXgvbXkxa2tiK0x4aGdDT212RytOdDNDNFJsZDJuVWhBUWxrb1g4cUdHT0ov?=
 =?utf-8?B?aWsyYmxYOHJhNjdEc1puMWExYXFqRHF2WjU3Ykl4TDdUdTNNL3ByeVkvSTV6?=
 =?utf-8?B?MXFXRmN6WWZLcnp5eXNLdkxRQnViNFhySERiUGNDbGprT295WWpBenlBZnRG?=
 =?utf-8?B?Q3UycFpPS20zVUlVTEZvUU5Ga1ViWmN5L1hWWmJYNnYvVDgrSkVnUHIrWFlR?=
 =?utf-8?B?TWRqTDhYTG1qWk9BQWxYV212KzdMRkFNTUM1cTk5NGxtdk9XSTcxZnIwQ2tx?=
 =?utf-8?B?T0JSc00xNDZFME5OTUR6ZXdyZVN0bURsSWNJcVJtNWpQY3VEblNRaWtYLzRa?=
 =?utf-8?B?QjJ5anV4aC8xVDd4bVhvSzU5OHJ1elpqVDZyY1NBNENzejNha3JtbVIvaHpD?=
 =?utf-8?B?Y1VZbHBjMU1KZDQvTlp1bWk1Q24yTjNuVXR6N2ZTczBody9HRWxwV1NmRzBJ?=
 =?utf-8?B?ZHdyQnlJVjNKSk5mcUxmZFJNN1pmS21HdUZGdTRZRy9oS3NGSzFZa3ZSOWhH?=
 =?utf-8?Q?fUmaItX/Z3gnW5GFZu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9bb2a7-363e-4fd6-4712-08de6b229d39
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 17:09:14.5635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: las14zEfyk87WwlG9IvFj7t96M6KA9j/2163RX01GOYaXttZ7Nx2kwtYccRoi5GGUulYynenS2Yy4Sia7GdNWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10441
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_090918_268986_8E385B1A 
X-CRM114-Status: GOOD (  10.72  )
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

Move NAND flash properties under the nand@0 node and place partition
properties under the partitions node.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx27-apf27.dtb: nand-controller@d8000000 (fsl,imx27-nand): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clocks', 'nand-bus-width', 'nand-ecc-mode', 'nand-on-flash-bbt', 'partition@0', 'partition@100000', 'partition@180000', 'partition@200000', 'partition@280000', 'partition@300000', 'partition@800000' were unexpected)
        from schema $id: http://devicetree.org/schemas/mtd/mxc-nand.yaml

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi    | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts      | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx25-pdk.dts            |  6 +-
 arch/arm/boot/dts/nxp/imx/imx27-apf27.dts          | 82 ++++++++++++----------
 .../boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi    | 10 ++-
 arch/arm/boot/dts/nxp/imx/imx27-pdk.dts            |  8 ++-
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    | 10 ++-
 .../boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi | 10 ++-
 8 files changed, 92 insertions(+), 54 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
index 31dc2a6403628db1527a1707460afbf9de893abd..29a7f99842e3a70c5dc7ce70c547afce2ed73f9f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25-eukrea-cpuimx25.dtsi
@@ -57,8 +57,12 @@ MX25_PAD_I2C1_DAT__I2C1_DAT		0x80000000
 };
 
 &nfc {
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
index 458b94d3d4ed4c97adc5b9f2597698f22edb9350..7fd8656f529b1a9f3a4cacc68fe63ad0f23571dc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-karo-tx25.dts
@@ -94,8 +94,12 @@ &fec {
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-on-flash-bbt;
-	nand-ecc-mode = "hw";
-	nand-bus-width = <8>;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-mode = "hw";
+		nand-bus-width = <8>;
+	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
index a35778ba6ffa0474d67f77005dfa4299b27d947c..04183ee7ff6851fc26874a640002bf702fe7aa07 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx25-pdk.dts
@@ -245,8 +245,12 @@ &lcdc {
 };
 
 &nfc {
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-on-flash-bbt;
+	};
 };
 
 &kpp {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts b/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
index b67bb21af3dedf1124ccdff6a1ac3ef703a6e22d..a61b0afa958ad304338192d8b8eb76a5c2004e3a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-apf27.dts
@@ -69,42 +69,52 @@ &fec {
 
 &nfc {
 	status = "okay";
-	nand-bus-width = <16>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 
-	partition@0 {
-		label = "u-boot";
-		reg = <0x0 0x100000>;
-	};
-
-	partition@100000 {
-		label = "env";
-		reg = <0x100000 0x80000>;
-	};
-
-	partition@180000 {
-		label = "env2";
-		reg = <0x180000 0x80000>;
-	};
-
-	partition@200000 {
-		label = "firmware";
-		reg = <0x200000 0x80000>;
-	};
-
-	partition@280000 {
-		label = "dtb";
-		reg = <0x280000 0x80000>;
-	};
-
-	partition@300000 {
-		label = "kernel";
-		reg = <0x300000 0x500000>;
-	};
-
-	partition@800000 {
-		label = "rootfs";
-		reg = <0x800000 0xf800000>;
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <16>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x100000>;
+			};
+
+			partition@100000 {
+				label = "env";
+				reg = <0x100000 0x80000>;
+			};
+
+			partition@180000 {
+				label = "env2";
+				reg = <0x180000 0x80000>;
+			};
+
+			partition@200000 {
+				label = "firmware";
+				reg = <0x200000 0x80000>;
+			};
+
+			partition@280000 {
+				label = "dtb";
+				reg = <0x280000 0x80000>;
+			};
+
+			partition@300000 {
+				label = "kernel";
+				reg = <0x300000 0x500000>;
+			};
+
+			partition@800000 {
+				label = "rootfs";
+				reg = <0x800000 0xf800000>;
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
index 3df70ed6056c4d122c83f9d6dd1ec1af3c64ff0b..bc28250df7a7fb729c2ef76b1f4b3c1199e7f1ba 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
@@ -42,10 +42,14 @@ rtc@51 {
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &owire {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts b/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
index 2fc4ea5b9501f4765624b42f8badf013fbcdad6f..a1e3b387ba8ee290746fb094903989366a9968fb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-pdk.dts
@@ -88,9 +88,13 @@ MATRIX_KEY(2, 3, KEY_F10)
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nand>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &uart1 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
index 2f60b3809f39b2f2c92cdb6a61664103380e3478..ba6cf03b60057af41f291a2c760efeeecf064301 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi
@@ -150,10 +150,14 @@ MX27_PAD_USBH2_DATA7__USBH2_DATA7	0x0
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &usbotg {
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
index 7d5d24c781b9834dbf8834c798b923829fd98444..cfa833cf0c114d987821ec563c7af5053b153a62 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-som.dtsi
@@ -280,10 +280,14 @@ MX27_PAD_USBOTG_DATA7__USBOTG_DATA7 0x0
 &nfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_nfc>;
-	nand-bus-width = <8>;
-	nand-ecc-mode = "hw";
-	nand-on-flash-bbt;
 	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-on-flash-bbt;
+	};
 };
 
 &ssi1 {

-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
