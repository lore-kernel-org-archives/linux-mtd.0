Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55726CEDD91
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jBf0/t6RLpy1SUVj/E5km7e1OMWheeI1qzoCoTGYRtE=; b=jz8WZtCMpYroq8pztxaZgkS6LN
	9dZAB2gNa9bmgLTiMVEtvAH9w34nIELFS6ANg4xLVXcTONc97Y+2OC2hT6Q7CzDBuoRHOKPN18xX3
	4f/NAgw0mo2v+O587+dNSjQ4JKUIbl8lRgi7xqssB5qmSU1cWN5uLW1Nit/lN7mLKaeL7y+vvy4I2
	RkKoD2XEkjad+FGcim2UGMJHrNLMXQCM5Y7l94I9YYdpxPFSJdtDpl8hAxYI+HhEDHZiz+f6HOP5w
	0EXGl8cuNDgUKUvY+XQS8ATqFFtv6WiBp3WJW/79xLM0afrVvJziljEPMwZH0bquPDU8k9TGyV5DZ
	cYbBEXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWum-00000009RXw-13UE;
	Wed, 09 Oct 2024 13:39:44 +0000
Received: from mail-db8eur05on20700.outbound.protection.outlook.com ([2a01:111:f403:2614::700] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWrN-00000009QlW-074E
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 13:36:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThevplYCOk6r2zcN0Kc1IpwkaC83KezjyGTmoUFxw+aFK7CdXkSvbBU2AJQGr1qp2/MVyYi68fd0XQgwYz896/IQ+2eetdNBhyJtgjM73Mu0DakQxk3WitHIV7GrXi9rrLWYlw2YMUW9t3j8PzhXXpw/ILU8R+vZcPRlqOjzkkuPfbqhJwH0nP02tMAVYVxAhISl6tjj1FKvaqpGc8uEMh3P/eUHf9QsqvZVvwLeZwYM9lzCjJiWSxiVtzCmiAXM/cP0EiQPLXfz3y8k2h/hqdSnX+jWG7jmr6x03hUbSdiO8TfY656IYabJjsAtnQ+OEfgsbuOHeD3Hgm9D/cANzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hev6k4L96h8Wgp1Omb0SjnfBA8lHesK3NHRgdfZka4=;
 b=Sa/iePdg+3cRAusqTlqLQYKRfDwj7N9XLKb2O/eE3cM7eHaU1HSoy9FIycBPDISQLJfgvBdwobHFIjQi0r2VZKNyTQWGN5hGxSkR36/vSsZw4/L7oikk1tGlBAIvbBG4/4CXHkbUaq+VbWqvBRwwrpRZltmuho0oKOt/vLMO+lxeC4Wu4WlKJCCGlsyRVwxrwYHCe8VI8FNdaDz41nwwdNbKsXqlmsx8A78QHZ8oj7Cn7T5iy+7Ku5yraxdHKeLrot/BlZv0ZTkqSzitB5pAgetLkRnE0aTsfg7luWYRn23DejuRwOCGhDYM4Mz0YjwoZwS/W/vD/iwIKuMzVKJ+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hev6k4L96h8Wgp1Omb0SjnfBA8lHesK3NHRgdfZka4=;
 b=jvKEhB6sj/+L++Mjtg10N/gnLsFobh9HDjGCoaLODsncyDIPQpnt+npBDu8A0omiI18RAd84umG3mzMhmev76vf0coKtzstdz8cKH69MyPUIAmISPXuOU5ggMIkYLxioATYjZCW+3dXr+vSY49YaZu2m6R4EPJ4jWRFbxc9gWsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PA1PR10MB8766.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:440::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17; Wed, 9 Oct
 2024 13:36:10 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 13:36:10 +0000
Message-ID: <ccce7a28-0f95-42d4-a071-8e8123e0579e@kontron.de>
Date: Wed, 9 Oct 2024 15:36:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mtd: spi-nand: winbond: Sort the devices
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Steam Lin <stlin2@winbond.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Md Sadre Alam <quic_mdalam@quicinc.com>,
 Sridharan S N <quic_sridsn@quicinc.com>
References: <20241009125002.191109-1-miquel.raynal@bootlin.com>
 <20241009125002.191109-5-miquel.raynal@bootlin.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241009125002.191109-5-miquel.raynal@bootlin.com>
X-ClientProxiedBy: FR0P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::17) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PA1PR10MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: b3119cc9-a011-4a6b-3574-08dce86755e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TU9xQzZBZmhOeFNMbERnOG45TEhPTkFWbWNXZ1Z4NmdUbkZmSHdxeDc0NUtz?=
 =?utf-8?B?eGIyZUtxQ2Vaa1VJTllWV0crS0duQnhkNDhlL0o1Vml1bEpnWUlsY2pBekxI?=
 =?utf-8?B?dkxmUFFEOTJrVnU0bGo0RG5VM0YxOFdMQ3pIVGtXTG9jRHI3N1BjUDV0clRi?=
 =?utf-8?B?ZXJadnRGcGRVN25zcEJWZGFSbGwrRy9rQVFvQU85K2k3UzVaOU5Eb3JvSDd0?=
 =?utf-8?B?anNGa3lCSFRzZnpRQlA3ck8wR2NwY2t6d0hZY3pSdDhvcWZ2ZDQ2RmtjaXZp?=
 =?utf-8?B?Y2ZDWThtM2dlNEZ2eUtZemN6d0Q3RXF4bUtIRG42d0JDT3UrRkZOSlp5MjJN?=
 =?utf-8?B?dm5Hems1aE91b28zaGRBWG9neVlHMURWTE9iTDNra2NjYldnRXBTRVBQT1hu?=
 =?utf-8?B?aEtUWUNFMGs0dHIzY0ZtSWdaamdTQnloWUQ5R09nL1lXalJTVjZQWjZVQ3hW?=
 =?utf-8?B?OU5aNTc1Ymp0M2FYS3dKMGM1YWprUlY4RXh4KzhsL09waEtaWUlQUnRyQmhL?=
 =?utf-8?B?WG8zZWJRSmFyV1hwWVVCSEN3dFNGejNhenliSUs2bTN6d0FTa1VOdkJqbXAr?=
 =?utf-8?B?N0xudS9IWFJ0QThlT2w3NFlIbFhCZzdyUHh6UzBKdk9TRUlwR3VQbXYyY1RH?=
 =?utf-8?B?Z2RlZ3h0RXp3V0pJaTNIRnJSaHRCYml6QlF6cDN4QlFObjg5S2YvOG5pL0tt?=
 =?utf-8?B?aVZjd21KQWZTcGZMdmdLd1BHMkxIeEw2ajQ4RERGTmh1M1hGSnpBcXZYR2Nk?=
 =?utf-8?B?d0QyMXZ0aUhkdzYzMTErWDh0R3I1SDM1dTdqTkZ1cjdsaURIQzdmMHlRWHlm?=
 =?utf-8?B?c1RienlzK25SOS8rakdHV2doeTJCb25MMkYxZXRKa21yc2hPRUpoL25XS0pJ?=
 =?utf-8?B?bWc2L01ROU1BYkNoanV4WVl0VEFEY2htRktYalJBSlJoSmM2b3p4Q0ZPMkVL?=
 =?utf-8?B?Znp5TkNwbUZlNzArRzJGeEtyRnYxT01qQ0swcUZPYkYzSEpaaitaMkJRbnI2?=
 =?utf-8?B?aXNzaVVrVmtkV2pnSTQ4NmFiczVLdTRvV2MzSTB6OE5sa2FzRitZQ0piYk1C?=
 =?utf-8?B?VFpuZi9rUklPTkw0RnhLYkdXU1FHaERVUm1nMVpVRWZtbVd3cE5pUHFiT3Zu?=
 =?utf-8?B?Q0hOUGt3UEtleXVMdW5tUG9WMHB1YVVJRVBPR2N0a012TTRDZWNrTnZ2VnJQ?=
 =?utf-8?B?UnhiU3EyMi9pZTF4U1FyVmgxYXphSUxsVHp3WStJUjFGNHNoYUNhZW9xbWdu?=
 =?utf-8?B?TmVHR0Z5TUk4V0NFazRwY1BZSWtQRlNPS1FndXZXbmQxNDVqRmY5RlNDY2VB?=
 =?utf-8?B?bE83aXMwTzJMRTNiZWRlRnNjcnhiSlRCUmVrWkdjaTRXVkJzc2dseWFrSWFN?=
 =?utf-8?B?SmJBRHozbzJqQURKcnVOQzZBWWxKZEhibVNSVmRoYXMvYThCL1g2b0c5V2Ji?=
 =?utf-8?B?OTJQaEt2dEZMRUNiTWZ3VmpXSU5jNDFOL25QZWc5UWVQSkd0ekVmTGErSnZo?=
 =?utf-8?B?SWw2bytYc212ajE1UHk0a0JUQXg0dnVvSkRNdzVlNnB2N2hLY1JxTU5xOVBD?=
 =?utf-8?B?d0ozbi9nWU0zS1NLRU84YWF3eUNacks2SGtXV2NxQjV5MTJFazNxMFZFMFd6?=
 =?utf-8?B?VUR5bkN2K2kvVldnQkxCczdYTUI1ZjlvcVIyMzl1bEZHK3pnV25DSW9FZjEz?=
 =?utf-8?B?R3hIaTdRY0ZUb2d5eUFVeWlyMEdIcHlqSUJNWVg1RnRsYlFRU2c3c0pBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjhxeWNvbzl0cXdpMzlUVWo2ZE91WFdjNHJNb2tnLzgzQXhvSk5rblR0NWpi?=
 =?utf-8?B?OUhBdjJQcldjdWRVeHQyRkRZK2hReHhRSTVUcEFnWFhqSlBvT0t0d3lhVSt2?=
 =?utf-8?B?WFZKRUdrbXBOM1hMeXN1VnhFcFVwOUc2WWdFcDlxK3p1eWdXWWpobVp1QkUx?=
 =?utf-8?B?VFlZQmNTYy9Od3BEcnlrTFNrcXJQOG56c3JJZWFVamxta2F3MkNUSXcrYkhq?=
 =?utf-8?B?Wjl6cUNLQjNyWHF1UGdvQ1kwbmkrN1BVVmQ0Y0VNKzhQODJDam4rek1mWkZF?=
 =?utf-8?B?Sko5eWdpSXRRTlFwa2xBcVVFSW5Ec2dsT3ZpRmc4cHU3OThnSnI3TDJpWVFx?=
 =?utf-8?B?aHZRUWs3cVpCdmNrdExWQ1Bvdkp1OE44NEh3NXRuZStkdEozaHZEWXFWYkIw?=
 =?utf-8?B?cmdpN2xEbHZ2bGJORzAxa2NTWlY5M1gzcXZBQTdJaWR3K094MEFjdTVOam9X?=
 =?utf-8?B?NHpNUmNib1NMbjNKYXgyTW80enFDOXIyZHBrc0pDZGhrQ2JHVEFZL2JVck5C?=
 =?utf-8?B?Vk1NYmo2bWd3SmU0U2VuaURpRUFZSVZEdzB6VXgrSmxRNEFuV1JWSzlCSHg4?=
 =?utf-8?B?R1M0cExNL3poT290RmxJRjludjVZWU9HM2xCV2M2eVhpSWczeStQVzUyZHpw?=
 =?utf-8?B?WWJrQWJVL0g0UjZzWStCYUpWV1RVZEhjS0s0Z09RVzBqYkZ3dzlBaWw3UUxi?=
 =?utf-8?B?Ym9qTWFmZWlXbk5KUTZXb0d2L0ZKVTQvaHBOejdxWEUva2x3eXpJSUJud3hy?=
 =?utf-8?B?cEVoTFBwNWhaNzlZdVYwZUcvemtkNHNoSlkwYlhzd05vNVRXOElkTEFvNUho?=
 =?utf-8?B?SUxEeGZPMXpoSjNmdVN1cm4wbG10UjZVcFhDMXcrblRoY2RlWk1LcFJMaGNR?=
 =?utf-8?B?ZlFpNFdkZThtSjJEdzJvU2piNTJQWFFsNE1GZm91WXlMMENaRXlGbDhUaDhu?=
 =?utf-8?B?eXB5U0gzdElrM2hwNzI2cTcwdjBiVEo0RDllY2JZNmVZazZmMXgyclhoTzNi?=
 =?utf-8?B?ZnEyeVFaanNUNmljS2FybXR1VVBSS1lBN1Rra3pqV00xM1pnOGxXeG9IaUps?=
 =?utf-8?B?YUFvQzBwUWo1NjF0Vm5Peldib3FNb2J6T0gvS0ZWSWVvMXc5WjN5WUxYaGJ6?=
 =?utf-8?B?d0Z4Y09Kbnc3T1dpWnRPVjFOeGlRcVp3R2lDMmFPdS8xejMyRzFWUGY2eVpW?=
 =?utf-8?B?dVIxZm9MOEttTzQ3cUhod0UyMVBBbHd5L01lME84Wlc3TU85TTJtTkdiMzBj?=
 =?utf-8?B?NStJUS8yMEEvbnc2MytLUWRDN3ArN2JWcEQzOEF6UXRrOGluWExqZXdCeDQr?=
 =?utf-8?B?YXJLT1BHRFNxTlJuaytzT0NucXpDQ3ZNRUFlNUZXejlLUWhEOWpNd1RTWnA0?=
 =?utf-8?B?U095anRBQ25ENzZsd1ZIdDdPY294UE5GU2d2ZU5HYW1CTUVwMFZOSUZFVVVr?=
 =?utf-8?B?T0ZmREJMQnN3eFhiS3UrOEluZmR0aXhScTBRTWFiQlBaK2ZBSElxcC8vMmFk?=
 =?utf-8?B?QnR3QTFwUlEyN0RVS3B5UVhpMzJJRXJQQkMxeWFtQndBRDZVSUpUazNZY3hm?=
 =?utf-8?B?ZVdrUVRTL0RhVVdZaVlzaWRpWWppSURNQkIrSkYzYzBQcFhWNExjRXhXbi92?=
 =?utf-8?B?aHdNUGZ4Y2RXd3E5N084WUFhdGZ3MjVvbEd5cnJQZ1piSi9BZ2dCMEp5d3J0?=
 =?utf-8?B?bnArNXZQY1JFeDdBelhRVWhERVNQaVJxYitweDdxWWI2amorUWxIT0RDY0Mv?=
 =?utf-8?B?L3RPNGIwV2ViQkZkaDlHZWhCUVdSMmFqU1BkMUJNZ3lzY0dJYTI1aHYwb0xt?=
 =?utf-8?B?Y1p6Myt6K3YrM0xlaU1BbmhSYUltT1ZDSVYxM09xVnZZZ2ZPV1pucUU3aWdU?=
 =?utf-8?B?T3BwQWxHYXdXeHZ6ZTdMcWJCNEszRXBMRm9TN2FTMTFNQTNPbHNBcDc5MjZT?=
 =?utf-8?B?MG9RS3lhTTNDVEhlVkEzS1ZCS3pXakRQUmsreXlLZWMxNU95ZGc0SmFkRmpZ?=
 =?utf-8?B?ZzIvNE0yZTQvUk40eUlxQjM1OFltWlU4cFpOa0RMbWRFVU1HTkFNdlhaWTJX?=
 =?utf-8?B?TGtId2lrQVZSSytFOEY0L0UxSDV0dmxNM0NoQzB6ZDVXeDZ6QU9lRWJvN1Ja?=
 =?utf-8?B?UHpmM0JySWJHNnVTTEdLTjJ5ZlhPQjYrWTNTV1lmNVE0VU1xK2M5NWpxU3VR?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b3119cc9-a011-4a6b-3574-08dce86755e5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 13:36:10.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7xuD6qPfXc3vTyzK+NIERNxaQXnKUZcQ+QAbU0uZ8SiL3gX7tff1B6Fr3y6pDsR8/xVE4VD35ik4C1eglHo7Fur10w4quQE0YZvZ0RMUk0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_063613_104518_F4DC2162 
X-CRM114-Status: UNSURE (   7.95  )
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

On 09.10.24 2:50 PM, Miquel Raynal wrote:
> Use alphabetical order, not because it's pretty, but because it makes
> sense. This way the devices are listed by density, and then by hardware
> feature set. Add comments to make the list more understandable.
> 
> There is no intended functional change.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
