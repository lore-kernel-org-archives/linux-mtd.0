Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B03E6B26B
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 02:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jn2bqYjbfgXu9zgqj8xH+pRVctFmeIN13D6zh6Lx5ag=; b=kuf8GuwwX0dBi7
	FQE8Lqp6dC1bwsx9kFJ3rRe/9Ko4rr5tnyNVG4CTa3KorVKKgmCe28jp/9DkjBzHI8tNSP/KUuTq1
	CLE9T4Bph1UVXzHCHjRVHdsjINoqK4hmcClkRNMLHb6Oz5cNkr6O/HZDDOzFcA1KPf7BTvk3XwhRW
	rMahStvhsObqxnbbg5viG+ximTc2jsouD6ncw4XG5yEKI9lSOhWtG0BYFRF877cysnTI73rKJ7rUC
	tQbm3P81JFjSLnk0DOBug1a92VzFipbxKiTh0MJ62dsboEbxD6nVUj2La/j3TwFbgW2+1rVxEb9Lt
	YBhWmkcClctd9bvZTw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXric-0000000EPQM-1w23;
	Tue, 23 Dec 2025 02:01:46 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXriZ-0000000EPPN-3CyK
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 02:01:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVxBf7op/+tN4Pl7O/XwklXEMjL7HRcilOkNEpB8OWIEef/GIwclJhzIEyF3us1Ys/GRLXOZLFap3P+loqOZNbujuQ2k/kGJcTLZT80+yekFhz6lygqR6HI0p1zxlp6w/cQOX02vYMqBkWPfXbyhNBtR3t4VJnegoUvsc4BGUvUcOC/3tSXeCyNNWwT7U7BguEG517msZHimswfzQpA0UIMb1UoMvopoSV5nKn2t3l5K45DHtBZZ47oTbqB35G/lYpXypRYlnFkM51XEO9vINDQgUcjBikiFExQ18th7LuGQxD4nVtr1czXGsrVXU0QRH8iZ/lFbviOu8u/sO+DJtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4dNOCLWPZar6VFNrVxQcBok1WcyrFFHygkKjIHmxWw=;
 b=KJW7h8RlrFfWEtfVAhidsEt3aPikAc9/3KzFhiClErjOghpzPyvDyj7rRL7fFTobHqcDjlYtAeNNDE3hUvSukFt1hVzZZV5mxKpPxXZ44Czpo/iG1lfBibWDbYmT88qswbwZRpbB60I6vddZGlgkcJQtzdM32z5PLQVxEgJfZm9uq8BMjbZlQLO83lkvstmjHdyKuWLJiTpmMpC6IDcXBJP8W1W61k0RfL9rVwhrZpvLakiwibZbqNmQMiDtpC1j5Kjh2gV1ZGSlOe9HmO7Eo+2UGEiYotrbKsegTE9+swgVwc6MX3nH0E3bIyAlsjK6abpNggYGo2FZ+cYld37Ndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4dNOCLWPZar6VFNrVxQcBok1WcyrFFHygkKjIHmxWw=;
 b=C1XsJhFD7guHyagw5z2xKSJs2MtSwtlx3+54Di0LEnpf4oDyGVmUq8OVn1DBtmLzEui2uJGY2UtI/fgBoHeyYchGAOwIabzye176tNoc4vOQpgQ9k+8PxetCzidJkxC/W3C4TCtLjrWrdeJu7toSY9CQO67qq+TfVWnKCrbP/RaZHuuvYsf3E71/dI1yfJyV+N5cZQiPsMQP+NPSX+zmxyL8uOlk8YLNRmV0FsNWOrDkfHwkT4tpRpJNCNiZeuTuGu1IT2Rxzon5RGTB0XGKFaDItNxks5+JHdPUQZdAyCHTfPSAfzouQXzSuNic9FUrVe7b+CUXlQh27RgUdNwOgA==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PA4PR04MB9709.eurprd04.prod.outlook.com (2603:10a6:102:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 02:01:30 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 02:01:30 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Pratyush Yadav <pratyush@kernel.org>
CC: Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Walle
	<mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Han Xu
	<han.xu@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
Thread-Topic: [PATCH v2] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
Thread-Index: AQHcbaoXF9ceZC444EeCGGSy3Vo9x7Ut1xaOgACtbhA=
Date: Tue, 23 Dec 2025 02:01:30 +0000
Message-ID: <DU0PR04MB9496ED0C1AA219CEFA574D7F90B5A@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20251215-nor-v2-1-e75c0451e597@nxp.com>
 <86fr92cypy.fsf@kernel.org>
In-Reply-To: <86fr92cypy.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|PA4PR04MB9709:EE_
x-ms-office365-filtering-correlation-id: 2bca7506-ce5b-4c5b-9c25-08de41c730bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?gb2312?B?VlpTVnI0NjVSUEFTdmxobmZyV2xyTnR4K2gzYVNaNGo3bzRIN3hBSko4NFN4?=
 =?gb2312?B?WVhhV2FlcmZ0ZElYWGRwMW40UzZTOGpMTHpKY09iTzNYZVFMNlN1NllNaWx3?=
 =?gb2312?B?eVVHWEh1OUk2RjJNT2cwWU5icHloNmNNMmRyMUtoNXN4eUlmT09iOUZqUkVX?=
 =?gb2312?B?MjlabmZnVFNJamRGL2dVajhVdFNRQitIVjBwVWpmK1l0ZFdLSFlaWU9WNXdo?=
 =?gb2312?B?TlZqR0JYK1NkM0ExV3VJeTM2eDhQbzNJQXlGQ3h6N3pCUWdlVWlicDI1bjFz?=
 =?gb2312?B?ZjFFc3dRR1c2cmEwaWFMSXdBbUhUMElPSUwydW04L2tXamxBTTFlWjE1ei82?=
 =?gb2312?B?WGdJTHRwSndINkhPU0srWjIwTWtpbWRqQStwMzlPT0sxYUFPZ1pFVjhWRnlz?=
 =?gb2312?B?OUNXYlpzczAzKzFNZDlHQUtTS0ZjVmpJTDNuZXMzQ1llNzBiRkF1OXpMaFRy?=
 =?gb2312?B?NktVNnJPSTdVY1RwT09LdmRHTTRpanpQL1VkN3lXanVTeThDb0Rhd0RhTXRU?=
 =?gb2312?B?V0wzYk1lSEFzZ1hNeHNGSzhwdS9CMWs0ZFFyVnQ5M2hiY2E5OW5VcktLTWFr?=
 =?gb2312?B?clRVRXk4MjNOSDlGQU5iWm5KNTRsS2FiNU5YZEYwZUIzWXo0MFRqTHh6Q2F0?=
 =?gb2312?B?anUrdGRVeHFjdlNzaEIwUHJBVkxKcFoxYVpEZ0QxVGVYdEZXWjZUb2ljMFdF?=
 =?gb2312?B?STFsd2t6aDQ1MWE4NG5jY1NYWUFlUUd2VkN1Si9NS1plNkozLzc5L25oWFVO?=
 =?gb2312?B?bWNDLzI3M0pCcS9hNDFuc3ptQUFlSXUxb0wxbnNLUnZGQmplTlNmd1EwaUh6?=
 =?gb2312?B?TEFZQnp2WVFQbVo2U2liWDFtWFBnb2NOM0FNaXdmQnc5MFpBRVpHZGdtRCti?=
 =?gb2312?B?Vjh2UGpIOFM2MVlDYmJHUjRQYjNNZ09wSk9hSTMrbUdBMGFiQUdvWTJKY3l2?=
 =?gb2312?B?WkVjTVJwbjRlUkpTV2FzelMyeFd1UUVJeS9jMnNRZmtYUlM2dUFYVlBORWlo?=
 =?gb2312?B?R2cyUWxGU0VGYU5TdS9pN1l2QVlSOUdCbDRjN3JZVWRsN3d1UmpnK1k3SFpp?=
 =?gb2312?B?RDB1NmE0NDJKRkxTWk9tamJuY1BrckhYRUowS3AzT3NhVGljYmRvbW5BWjNp?=
 =?gb2312?B?Z1IrbFcxWkdUdXRNZmovODVpd0g1djRod1Y3YTdaUXI1WDB5ZlQ2aFhEMUhX?=
 =?gb2312?B?VVF2bHZmZ1ZzamUxbkhGSEZ4dU5rV09iUE4ydzBBeENNYzBwMUV2TzJ6aUV4?=
 =?gb2312?B?R1BWZjZGLzB5dC9JL0VZeS8wM3BJcmFGdkZ0cnBFRXdodVlQTnZvbGIwZ3Zu?=
 =?gb2312?B?Y2hud1VFcnYvY3JQdEpwVkw1L3N5cnZqMXdHeDBGSGFuSUtHaEg3Nko5MXNU?=
 =?gb2312?B?dGV1a2JLM3NSUE1BblpUYU9rWE5PaTJlVnVDV3VEbmNGVTF0QjdYSzMxSm1C?=
 =?gb2312?B?dFdDb1RHZmhQUXo2bVZmeUJwTTYvL0p2R2xXVTlrMDdnL3R6SW5RaUdwU2NU?=
 =?gb2312?B?QkJ3enNDYVdaYUZHbmQ0bFVEK0NQaFNrYlBxN3BaWnlEK1p5ajBpQytRU2N4?=
 =?gb2312?B?d016VWE4eFZqMlJPamM5d21CWml4eWZESmprTGRXMG92QmZzUFk2TkRKVnhI?=
 =?gb2312?B?S0VkWDNQUUJlZVZGVzNYN3FIWjB4SjM5ZnVzS0wvVW1DazV3NFgzekhxN2VK?=
 =?gb2312?B?ZE1GZ2EvdzMzZDRzZ094UmtSYVRtZDBtVFdzWjRVNll4dDFjVzZkRG84TUF1?=
 =?gb2312?B?RDFqSXhYMTBXdGp3ZFZJL0IrYkpNcmdEY0E5WXJFY29JODFkamt6Y1ptZnJ1?=
 =?gb2312?B?WUNvenFPN0l1bXNINzVvVEorNHg2dlcwUlJsWWVWWjNUVjJpeHp1TnZnSGl3?=
 =?gb2312?B?ejNxR3kwa09vVzdtWmZtaUtGclhqRVBmZ0cyd3NPK1Fqbk54bTlhcVF0R05I?=
 =?gb2312?B?cDVjNU00TS80Ykw3cVU5dCtBZ09qRXJrTlN2RHlxcy91N0ZNWERaejByTjdv?=
 =?gb2312?B?RUJEOGZCUG9PbW0xbEFIck5GZlNIZFhPdFhaTWc4cWswSlMrY2cyMXg4ZDhy?=
 =?gb2312?Q?PxfxdB?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?SkFualBYRGhyaXRqVW9aR2xxS0lJTGJKM1VyY2w3dExOeElOUWZFQ3QyQlRF?=
 =?gb2312?B?bDNJMU5UUE9BVDB2dGd6MFVZVFNKcTVvZFVtZmZqSVQ0TzhLRUw5ck9Rd004?=
 =?gb2312?B?M0l0WFhlOW1HQkdjUHIyZXdlUWFVT05uVmxEVmRoSE11NnpxcnFvNUlROXM4?=
 =?gb2312?B?cGJqeEM4KzFqUUtXdUxxcUJoczE5b0J3M3BJVThvdHFWN0JMbG5NcHBNZWdy?=
 =?gb2312?B?ZENhRXc0SEpQcFY0ak55eG8vSDVQdm0wRS9vVG8yQ1J5VVhHakZRTVlGZEsv?=
 =?gb2312?B?NndmNVdmYUpXbFBVaFpEVnZEd2UrT001ZXEyT3NDZnBzWUZDK3BuNE1zY1Ax?=
 =?gb2312?B?bG9ZNU4wL1VjRngvVmNUTWFXbkFvWnBDU0dWOVpXbFZmRGhVdDRadWZFTFQ4?=
 =?gb2312?B?a2pkZVRWMlNxMFpSV0pDZDVSVVY2N2NGUEZpaWpPOVoxcDZkT1JzbGMrVXJl?=
 =?gb2312?B?K1JoalJZbktoSjEzYS9kKzgxaVRuVEpqbVhCemh6c1ptL1dwbHJxbXdQY0NI?=
 =?gb2312?B?S3NuR1QvbitkY05WbjI2ZmhZdEVMTjBPL0xPaVZ6MmZLaVRhUHpyRi9QMm15?=
 =?gb2312?B?L3gvTWE2alFiUUlQdE5ZMXBjVCtOYnAyOTdnaTFJVXkvd3kyTjhVN3RlTHNt?=
 =?gb2312?B?TTkxVTJKS1VuVGpYSlFnbTg0M0ltd3RzZlFDRnl2NUtUaCtZMHJaOGhpUmE1?=
 =?gb2312?B?bVZFeEJrVFNkYjVZZExTVmNJdWwraFNWMXlwZE5yQkFady9MZEg0N2N0bklp?=
 =?gb2312?B?TUFiZEUxNVBWaS9VNllqYk5yTDNOZFl1ZXVQVXNxdVZlbDBqQi80OERKVnhN?=
 =?gb2312?B?YU5WS1B4S0ZnZitCdkRMdnJLNVUzRTVjUzk1NVFMeDN0b2hjSlVLVVp1QUZE?=
 =?gb2312?B?YzkycFpmZFltR0s0S1RueHloN1VKL2JlL3FORkEzL09zYi9BRmNDMWpxZVV6?=
 =?gb2312?B?bmxPQnlZbjY1TUpwNTRnM0JhTHBIZU03L2pnT29naXIyWFRTMmgxZ0VtSkxZ?=
 =?gb2312?B?ajNrTUpKMlYrUFNNYlJaRmZyYVVQTXlIUFYzdzI2OEpuczhpZEp3VmM4bjFT?=
 =?gb2312?B?VFk2QWh2RHA1bWJINmdXTXN1bW1RYUk3bCs2VURKS3N3bGg4MmdoY1NpbXpH?=
 =?gb2312?B?Y3pzcmxRUjcza1pVbUNsVzFkQ2oycTBFRkpDMmliaUlPWlB3YldGZ1dGK2Qy?=
 =?gb2312?B?eVUxZ0Y3ak5WdE44QkpRWWRYZXN5VUIvL1RscElTUm9HM2F1aGt4SUZ4dWZq?=
 =?gb2312?B?bnQ3SVlrYURKN2UxUHpyK3lnUHp6OFM0UFVhcHJTQlRYMDhIeVVuSWVhRjQr?=
 =?gb2312?B?TUZyK1RodEhOZFp5SHNuYVFJbmtueHpsNHpyS0YxMUwxZEt5eTRtRmpsNDE0?=
 =?gb2312?B?bG5wU3BzekRiNlMzNk9QNzJrb0h1NE5kb05CWjFxQU5FNld2NEVjd0JnUVkr?=
 =?gb2312?B?V0E1QTVLRVhUcE83UWN6ZEhtN1kzQlMyakF3S1M3ckJYWS9wZno0S0tOcHN0?=
 =?gb2312?B?bEkwNWNHSG44Mlc5Y284VHZVbm0wRThtc3JsWjZaWEJURlltNWU3cE01b3dx?=
 =?gb2312?B?aVlMaHVmejRwWCt2YmNIbklnVFhuazJ5WStudXZ6aWVScWNQaTd2L3hMMVdF?=
 =?gb2312?B?MjFMSXIzMTZCbGdpeGoxUjJKN21vUVdHUGkyaldRMHk2K0Z3V29sSHRFYUxm?=
 =?gb2312?B?YWRTZzlsb2RZMUdpMDhSTWZ5WjZiNzVQdm54bzhWc2lkSWMxQ09yRHBHNWJ0?=
 =?gb2312?B?Ti8wbWZPUnNwMWl2MzJ1ZkxhV21MalRSVXNQZFkzd2RFQ2pWSEJXZnUwN3NL?=
 =?gb2312?B?N0dwbUVsTTNFVTZabm9HYlZXbWQzTE9ZQTJWUkZiZCtnWVhtcGx0K1pNeG0w?=
 =?gb2312?B?cHd4YkRucEVvMDZiandzSVBDeFNWZFJEcDhpOUZqdTZSazdwQ1laQ1FhS1Rk?=
 =?gb2312?B?ZjhYaVE5bTBpdm5BVXBOMmU3cHZrc2Rucjk2bGQxWEkvK3ZqU1h2aS9mUGdx?=
 =?gb2312?B?c01jaFpKajVIVS9MU2d4bS9MVGx1c1Z5YjlmY1A5dUV5MXhZZ1hkRnRHV1VV?=
 =?gb2312?B?akgrZlVPcStGcU5QRHAyU0dkZmxvOW5LckZkTEhtT253YXkvUEVTWDFBbmxy?=
 =?gb2312?B?OGd5Qk5QTzNQQkdpYmZicWtPeG94SmZWZ1R0dWQxUE45KzR6OFRneTFlK3Q2?=
 =?gb2312?B?Y1VLMnZGTWh5T0toWFpaVnpmKzYxek4yR3IwaVVqMmppY2paall3bm5GZ0Vj?=
 =?gb2312?B?Mys1ZU8zakQ5MVZ3K3QxQkhtNXhOb2pRb1ZPNHYrb0hmOFZxNlVvd2lvNXNz?=
 =?gb2312?Q?OABRpzt0QL9BRfwdV6?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bca7506-ce5b-4c5b-9c25-08de41c730bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2025 02:01:30.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZ3lMpbD6Hrn30yJiF2UAcOSEzaRnLvdlgrwvZrBb1mOKWQ1YJ/znGdZsz+WKy0McNiQ1RI4iX2tUuijE5LXaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9709
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_180143_837416_4DB02B46 
X-CRM114-Status: GOOD (  28.58  )
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQcmF0eXVzaCBZYWRhdiA8cHJh
dHl1c2hAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyNcTqMTLUwjIyyNUgMjM6NDANCj4gVG86IEJv
dWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4gQ2M6IFR1ZG9yIEFtYmFydXMgPHR1ZG9y
LmFtYmFydXNAbGluYXJvLm9yZz47IFByYXR5dXNoIFlhZGF2DQo+IDxwcmF0eXVzaEBrZXJuZWwu
b3JnPjsgTWljaGFlbCBXYWxsZSA8bXdhbGxlQGtlcm5lbC5vcmc+OyBNaXF1ZWwgUmF5bmFsDQo+
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjsgUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJk
QG5vZC5hdD47IFZpZ25lc2gNCj4gUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT47IGxpbnV4
LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBIYW4gWHUgPGhhbi54dUBueHAuY29tPjsgaW14QGxpc3RzLmxpbnV4LmRldg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYyXSBtdGQ6IHNwaS1ub3I6IG1pY3Jvbi1zdDogYWRkDQo+IFNOT1JfQ01E
X1BQXzhfOF84X0RUUiBzZmRwIGZpeHVwIGZvciBtdDM1eHU1MTJhYmENCj4gDQo+IE9uIE1vbiwg
RGVjIDE1IDIwMjUsIEhhaWJvIENoZW4gd3JvdGU6DQo+IA0KPiA+IEZpbmQgdHdvIGJhdGNoZXMg
bXQzNXh1NTEyYWJhIGhhcyBkaWZmZXJlbnQgU0ZEUCBidXQgd2l0aCBzYW1lIGplZGVjDQo+ID4g
SUQuIFRoZSBiYXRjaCB3aGljaCB1c2UgdGhlIG5ldyB2ZXJzaW9uIG9mIFNGRFAgY29udGFpbiBh
bGwgdGhlDQo+ID4gbmVjZXNzYXJ5IGluZm9ybWF0aW9uIHRvIHN1cHBvcnQgT0NUIERUUiBtb2Rl
LiBUaGUgYmF0Y2ggd2l0aCBvbGQNCj4gPiB2ZXJzaW9uIGRvIG5vdCBjb250YWluIHRoZSBPQ1Qg
RFRSIGNvbW1hbmQgaW5mb3JtYXRpb24sIGJ1dCBpbiBmYWN0IGl0DQo+ID4gZGlkIHN1cHBvcnQg
T0NUIERUUiBtb2RlLg0KPiA+DQo+ID4gQ3VycmVudCBtdDM1eHU1MTJhYmFfcG9zdF9zZmRwX2Zp
eHVwKCkgYWRkIHNvbWUgc2V0dGluZyBpbmNsdWRpbmcNCj4gPiBTTk9SX0NNRF9SRUFEXzhfOF84
X0RUUiwgYnV0IHN0aWxsIGxhY2sgU05PUl9DTURfUFBfOF84XzhfRFRSLg0KPiBNZWV0DQo+ID4g
aXNzdWUgb24gdGhlIGJhdGNoIG10MzV4dTUxMmFiYSB3aXRoIG9sZCBTRkRQIHZlcnNpb24uIEJl
Y2F1c2Ugbm8NCj4gPiBTTk9SX0NNRF9QUF84XzhfOF9EVFIsIG1pY3Jvbl9zdF9ub3Jfb2N0YWxf
ZHRyX2VuKCkgd2lsbCBub3QgYmUNCj4gPiBjYWxsZWQsIHRoZW4gdXNlIFNOT1JfQ01EX1JFQURf
OF84XzhfRFRSIHdpbGwgbWVldCBpc3N1ZS4NCj4gPg0KPiA+IEZpeGVzOiA0NGRkNjM1Y2Q2MzIg
KCJtdGQ6IHNwaS1ub3I6IG1pY3Jvbi1zdDogdXNlIFNGRFAgb2YNCj4gPiBtdDM1eHU1MTJhYmEi
KQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4NCj4g
PiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+IC0gYWRkIDhEIHBwIGNvbW1hbmQgaW4gcG9z
dCBzZmRwIGZpeCB1cCBmb3IgdGhlIGNoaXAgd2l0aCBvbGQgU0ZEUA0KPiA+IC0gTGluayB0byB2
MToNCj4gPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZsb3JlDQo+ID4gLmtlcm5lbC5vcmclMkZyJTJGMjAyNTEyMTItbm9y
LXYxLTEtMjBhNWEzODE5NzljJTQwbnhwLmNvbSZkYXRhPTA1DQo+ICU3QzANCj4gPg0KPiAyJTdD
aGFpYm8uY2hlbiU0MG54cC5jb20lN0M5YTJiZjU1M2FhYzA0MmM0MTM5MjA4ZGU0MTcwNTYwZiU3
QzY4DQo+IDZlYTFkMw0KPiA+DQo+IGJjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdD
NjM5MDIwMTQ3ODk2Mjc3MzU3JTdDVW5rbm93bg0KPiAlN0NUV0ZwDQo+ID4NCj4gYkdac2IzZDhl
eUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1p
SQ0KPiBzSWsNCj4gPg0KPiBGT0lqb2lUV0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdD
JTdDJnNkYXRhPXB2WE5JWiUyQlh1WlVYDQo+IEh6NllKZQ0KPiA+IDNiT3olMkZvYlJvMU54djBw
cm5xbFBxZUc1YyUzRCZyZXNlcnZlZD0wDQo+ID4gLS0tDQo+IFsuLi5dDQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0LmMgfCA0ICsrKysNCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvbWljcm9uLXN0LmMNCj4gPiBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvbWljcm9uLXN0
LmMgaW5kZXgNCj4gPg0KPiA4ODAzMzM4NGE3MWU1ZDE5ZjVhMjZjYTkxZjU2YTQ5ZTMwMTcxODNh
Li41Nzk3YmI3NDhiZTY5NmIzNDBmZjEzOTgNCj4gMTU1Zg0KPiA+IDVhYzhiMWY3NDA1NSAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL21pY3Jvbi1zdC5jDQo+ID4gKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9taWNyb24tc3QuYw0KPiA+IEBAIC0xNjcsNiArMTY3LDEwIEBA
IHN0YXRpYyBpbnQgbXQzNXh1NTEyYWJhX3Bvc3Rfc2ZkcF9maXh1cChzdHJ1Y3QNCj4gc3BpX25v
ciAqbm9yKQ0KPiA+ICAJCQkJICAwLCAyMCwgU1BJTk9SX09QX01UX0RUUl9SRCwNCj4gPiAgCQkJ
CSAgU05PUl9QUk9UT184XzhfOF9EVFIpOw0KPiA+DQo+IA0KPiBQbGVhc2UgYWxzbyBhZGQgYSBj
b21tZW50IGhlcmUgZXhwbGFpbmluZyB3aHkgdGhpcyBmaXh1cCBpcyBuZWVkZWQsIGFzIE1pY2hh
ZWwNCj4gc3VnZ2VzdGVkIGluIHYxLiBQcm9iYWJseSBhIHNob3J0ZXIgdmVyc2lvbiBvZiB0aGUg
ZXhwbGFuYXRpb24gaW4gdGhlIGNvbW1pdA0KPiBtZXNzYWdlLg0KDQpTdXJlLCB3aWxsIGFkZCBp
biBuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMNCkhhaWJvIENoZW4NCj4gDQo+IFdpdGggdGhhdCwg
ZmVlbCBmcmVlIHRvIGFkZDoNCj4gDQo+IFJldmlld2VkLWJ5OiBQcmF0eXVzaCBZYWRhdiA8cHJh
dHl1c2hAa2VybmVsLm9yZz4NCj4gDQo+ID4gKwlub3ItPnBhcmFtcy0+aHdjYXBzLm1hc2sgfD0g
U05PUl9IV0NBUFNfUFBfOF84XzhfRFRSOw0KPiA+ICsNCj4gCXNwaV9ub3Jfc2V0X3BwX3NldHRp
bmdzKCZub3ItPnBhcmFtcy0+cGFnZV9wcm9ncmFtc1tTTk9SX0NNRF9QUF8NCj4gOF84XzhfRFRS
XSwNCj4gPiArCQkJCVNQSU5PUl9PUF9QUF80QiwgU05PUl9QUk9UT184XzhfOF9EVFIpOw0KPiA+
ICsNCj4gPiAgCW5vci0+Y21kX2V4dF90eXBlID0gU1BJX05PUl9FWFRfUkVQRUFUOw0KPiA+ICAJ
bm9yLT5wYXJhbXMtPnJkc3JfZHVtbXkgPSA4Ow0KPiA+ICAJbm9yLT5wYXJhbXMtPnJkc3JfYWRk
cl9uYnl0ZXMgPSAwOw0KPiA+DQo+ID4gLS0tDQo+ID4gYmFzZS1jb21taXQ6IDRhNTY2M2MwNGJi
Njc5NjMxOTg1YTE1ZWZhYjc3NGRhNThjMzc4MTUNCj4gPiBjaGFuZ2UtaWQ6IDIwMjUxMjEyLW5v
ci0yZjM3Y2YxMmVlY2ENCj4gPg0KPiA+IEJlc3QgcmVnYXJkcywNCj4gDQo+IC0tDQo+IFJlZ2Fy
ZHMsDQo+IFByYXR5dXNoIFlhZGF2DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
