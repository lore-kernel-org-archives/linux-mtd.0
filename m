Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 726F8CEDD94
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Oct 2024 13:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MwjHIuoGJR7d1Piotr9ePTslrMxYPCaEDqJi9HKUNME=; b=0+R2JAJnpSDLYXY0z26NQsWKiT
	I8yyfJhhZPhDJuIvwbWc+OU/kIxEQ25o0CUCI71pGFkjNw9AGgxMKwz464v8o7m2PjfpWJK/ZkQVj
	Is6J98LVfU+Li376AdSIQUkCdKril1JOZWi6UnztmKMOBdCYev3DLhphkUTtVHl3EU8LgybogVEEK
	GFTn0CpllXAAOTCYtBgcvRpS6RaQhVYnP0Y1hbJdXzmhC4Rz6Tj8yBsU/VR4ZAlIVSzq29ziAg+Je
	VW5TelLuKD6EbMiiTN0O0Bh7CjdK6dt3CxAyfB77MIovUWnPSF71O+TadewKQVtYLEGJcoylzJ4aJ
	zGurz48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWs8-00000009QrW-3VHF;
	Wed, 09 Oct 2024 13:37:00 +0000
Received: from mail-vi1eur02on20706.outbound.protection.outlook.com ([2a01:111:f403:2607::706] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWp7-00000009QLf-3gh2
	for linux-mtd@lists.infradead.org;
	Wed, 09 Oct 2024 13:33:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9eNWM3whXq9Mn4Db2ZND6phhxFDtDfTUEHY7gR8LD1SHCN+ZPvl+93PpE0K1xqZqzZdujPnT+LjOkgyz/lMf9I0qhnNsCcsJKQR05tkk3bk/br7Gzbnz4Sv1EJmz68BGqu/bkwB/shAln0S3QxtOQPfSLBoUPdD9Xm6oUUD3TFtmPvkd+p/WAIaE8lPkRE0gGjFBdL3x7s7lw+IhUCgr4dIYN98e8v4SQ6zjrn7TOH7utV0+rsg9pTaDAFLgvxD1xUsS/te+86MX67/ZDjtnjMtHgsrL8i3mSUAch+BRwiJP6SRZFYbEEoolYbt8Rc8DtWfbYyRizDIoZOUD+Vi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIElHgNGEGcDTgJu+wKwPs3MlPREtcylCUUuSBulXxI=;
 b=pqqwSBwnBfa+MRqdtrrwh7WeJnaZJku2IpFElrobrsh66174r0QaGvF74CIKOvIks2rViB59c7CkxFZkp4P9EhVxqP9fWOk/cFPkRxjEBqljKTkzCTD9QqNbbeL+AKiSRQk6Z65Npw2hpW/XmboOh65xLoccO8yHbCXbu2i0Q/D5KXJgywpJ22Q8s/QhQTClhKLN1veBfj/6BDcd1BsyQsL90DpiBlbk1+U3gVtqoE3hA2qkFtL6JXoP7z56fVdHYb6LTugsz54srVszuwecAv1hICyPKMDI9wUPz/2IcP5/CVllAnwFSp5pqVK0CEnnOmW9m00yvz6vYp7MGQJtdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIElHgNGEGcDTgJu+wKwPs3MlPREtcylCUUuSBulXxI=;
 b=LGy3e0WlJlLqkdq1cSsdSGObLgDggSJn4hyoq8LLofaHGugbcBrBTmZzzK7iAqo9T8GHI7uGBkitP3MqbW6ot7MtDxKaeRp6teFnaR5Jc4UbeMJMCKV92rKm0cU1m9OyDkeJLnZGgykS7iyyNPyCKBfBD24+l9cyYEwCT7HcVCo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB7912.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 13:33:47 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 13:33:47 +0000
Message-ID: <a584763c-3fc8-4647-98f8-0a8dc8816796@kontron.de>
Date: Wed, 9 Oct 2024 15:33:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] mtd: spi-nand: winbond: Ignore the last ID characters
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
 <20241009125002.191109-4-miquel.raynal@bootlin.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20241009125002.191109-4-miquel.raynal@bootlin.com>
X-ClientProxiedBy: FR0P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::19) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 55857ec0-90d6-48f2-a47d-08dce86700f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHFJNk5KRGpvK2ZQVVhMU3huMzFXNUllb3l6TGJ5YnJxN0Q3ZEVkaXBwK2hC?=
 =?utf-8?B?R2Vhb1h3SlZ4dGlVbnVXMXY1Q1lYYlhDWlBDYWxyV1BvcVJrMmJkVCthRm9p?=
 =?utf-8?B?NytCUGovMUpIbDh5REJ2aGI2Mnc0V3RZd3ZaZWx0aU9XMmpjKzBUNVAybnhx?=
 =?utf-8?B?RGxUbkRFazZKTEZ2SWxaZ215OThSdHVmZ2hmME9YY3grYjQybmszRUdBeEE1?=
 =?utf-8?B?UjZ0eFRORFNXQ2ppNmFuTDZUMmhxMVhUTXFHV2prdmpQeURrd016a1QvK0FL?=
 =?utf-8?B?ZlByZEV6VmFzY1p3N013dHF3bzd0MFYyTjBjOFpNZkxBTXFJaml2RTByaTZS?=
 =?utf-8?B?YVNiNVdsZklsQ2xPTVNQOVd6bnBmdFFXM3BncUQ5bUkwenBjNXBlbW5UWmlC?=
 =?utf-8?B?elErV1lSWVdKbDRlRFA0RE9uS3Q0Ui9uc0hUSnpUdlBzaEVhSHNZSUtvWjJE?=
 =?utf-8?B?NWE4N0xwWDQxc0gyaTlwYWFZM293RDFMT0Exc3k4eEp3SGl5ZExiQzIyRmlN?=
 =?utf-8?B?MldFRS9YNWplS2MwVkY0ZWxPWHIzMXdTL2tVWGdGYUFzeGl5ZFhiL1ZzRito?=
 =?utf-8?B?NHVGYThRbEtqNVJYTHJWQ0JLUkV1ajluS2FjNWN4cG1aRTh2eXZ1R2hRTFRF?=
 =?utf-8?B?M1JMa2s4Um9ac0JUcWhYYUhYcDA1QmwyYWVIZm45ajV0NjczMmVvU0R4QzFz?=
 =?utf-8?B?ZHp6dGp4M1RHUTg5eENIVlEyNm9sbHZ5UGNyYlQ4bTFtbGlyOXdSRCsxNXRL?=
 =?utf-8?B?a2p3QVk0c2dMSXd4dFlialRGS3hIcFI5Ry9qTktxS2NTdGZpdzV4L1JiWDc3?=
 =?utf-8?B?bkliUzhGbFFFQ0pnM2c1WW9waHNBRytydHQwUW4vSWdZWm1sSTUvZm5vSTdi?=
 =?utf-8?B?dGRBb05aV0tSaHlsdzU3K1p6OWJyN0haRnY1VW9lanFwM2xrUHVLNm9iWnNQ?=
 =?utf-8?B?WDVHanZMaDd3Q1h3TklsM3lQbHlRQmM5blNzSzk1RTVVQW55MWZxQ3BkUFhq?=
 =?utf-8?B?dzNrWTJrYlJEOCtKZFFtajlKdTVtUDB2c3ZlTW03UThGZUNrQmVTZ1p0bit5?=
 =?utf-8?B?SzBQREFjdjJLbDlvODkwNkNBMXNaU3BTejdlRzREdW5lVGRzTGRyUEtmVC93?=
 =?utf-8?B?ZlFaUWRhbWpaMzkrRGJqWEpTMkZwaHRucEdmUjQzRnJxeDcxbEV1aVVuNGsy?=
 =?utf-8?B?YjFEUVE1dWltRjllQm9HNGthQk02K3lZOG1oQlR5bDY2NEJyT3VKZGpvMGJJ?=
 =?utf-8?B?RzUwNTZnUHFmTmR3Tmkzd3lOZEZuamw1WENvdVdmaGhpS1dtZnlrL1VYK3Bp?=
 =?utf-8?B?b3ExNFdiem13V0IyYTd1Mm1teDFzMFVaRzJ6RlJwRTNCVDJpTWRUaHh2MzF2?=
 =?utf-8?B?OXBFYXk2anpTVG9YS21lY3JmZHNiZXpVQ0x6dFBjbEhGZm1EU3RoUVQ0endx?=
 =?utf-8?B?eWg5alpoajdOSzdvUG5RVDVkbjVac2tKeU41bEJqeDdEbndDQ3dTUy9RTEhW?=
 =?utf-8?B?NWFRMkpOMUZUNFF2OThTZTh2TzdNaXBacVUzOU9vL05MckJFaE9sS1ptY3Jt?=
 =?utf-8?B?dVY2QVBVSXoxM0JSOG5ubWZmMktIMk5DV0hDSTF2Ynp3dFNFTzRXQ0l5NlBE?=
 =?utf-8?B?b2ZqZ3llVkVXWlV6ay9wRmthc0VQZzJ3dW9kanU3N0RhVjRvS0E3Vytld3hH?=
 =?utf-8?B?YzkrWEgrTERTaU1iaFdiSnJuVHJ5MFBOSjVHb3dhdllxSE1sR1ljeEJ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExsdWF2QzgyWk1KR2VqNXV0dkRncXh2c1lTZFVBZzFKNE9JbGhmcmo2K1N0?=
 =?utf-8?B?NXpuNk9GMUpzVFhwdS81NTJEVTJuTE00REdDc2JjaWdNUnh3TjF6SXF1MVU3?=
 =?utf-8?B?RU1SYlBCbjlkc3ArZms1Zmd3bDF6UEVsWldydms0VytuRjZibU4zUjVURE5T?=
 =?utf-8?B?c0xEeGRjWDYvRll4eFFOVDI0YS9FL1FYZkZEd2E0TGRTVTkrOHErY0dQdnhY?=
 =?utf-8?B?bjdGOVBkVXNDUFFjWVFBNDlHU200TE1qbzVTdVBJcCtISk1jT2xRM0kybkRl?=
 =?utf-8?B?ZytXbU0zeS9CdVphWElaSnoxd09iY05BN2ZrSnIzYnh2Z1o3OXZJa0dmSUt0?=
 =?utf-8?B?UnlDTWpmQ2VNOHJwOUd5Vi80NkxLY1Y0ZE8xQlgzS0NEN1FFM1g0VS94UnQ3?=
 =?utf-8?B?MGdqai9ZbmRNT3BDNXNPYU5OWm40S0RWMi82UmtRWjhjdGN0c0xSVWp3L1Vj?=
 =?utf-8?B?aGs4QUlQYVFKdno2RmJIUmZGczY1c09JOFJFZnF5QWJWUUZEVjBjQTM5aVFU?=
 =?utf-8?B?WmJFOE03OEJobEovVEhBaTZjTmZYdURMcjFrbEt5MExEemQwNDZTa2hzSEpI?=
 =?utf-8?B?c1lvcGkwaU4zaHloMVRxcTVJUGVtSU9YNTd3cFRCYWlicnMzb1BEeCtyeFN5?=
 =?utf-8?B?T1dSTFBwdnkxVlZYUjVLUjVXaXplbkpqS0dUNWtmMzBrREFFYW01Rjl4OEcw?=
 =?utf-8?B?T004ZlNWSWV3R0h3MXp1VlNmQnE3elJpOXZMbFhUell5eXZ5S2U0eXZKZ08v?=
 =?utf-8?B?N3NKdEgvckFpVFRMSGNwR3NGbm9qOWNjWm9GZkFxYjRndEplMHY3M3FpUi9G?=
 =?utf-8?B?RFRidFdZbW1iTnJZS2YvUm5seHZVbTdlUHdSdFg3ejVIT2Z1VTlFMUVZd1Zx?=
 =?utf-8?B?OFJiZUJLZWcyK0NBcHNQaURsVU9HUEVCSSs1NnlrK2FLQmlUS2F4SFQ4Q25E?=
 =?utf-8?B?SUorWkdhcU96bjNwK3ZVM0tsSUtLTW5DcTdYL0Via0ZKSkc1eUhRa3Yrd1ZS?=
 =?utf-8?B?SS9WOVd0eEo1eVA3bkZSWndVNExyd1F3UnQ0MmwyY0s4cU5XSXhBVXAzYlBI?=
 =?utf-8?B?UE5qYzAvK29vOTZ5cnV2a0tKUEpGVHRaQUE0Z3owZmJUVytaNDlsbk1sUDAw?=
 =?utf-8?B?TDRmVHQ5UHFqWS81KzlxeU1NUHNrSm9lNjdvNWJqSnYyZTBqUEtUWTdKczFw?=
 =?utf-8?B?eGhZOUthN2tteCtyRnoxVTNRazZKcVoxdkR2dXZqdXo3c2tHQVIvTExmV0Zr?=
 =?utf-8?B?TktwVE1sUFk2RElKZTZQRmk3LzB4MzdzY29XdmhNb3ZOU2RpQTlwY1VqZWd4?=
 =?utf-8?B?eGdOcE5wYnZTcnNaNll4MEhTSitONFdWOGtQNG9ueWgxaXgzTkhWTHBLcWo2?=
 =?utf-8?B?OWlBYUZCUEhBUjlqRlhZcUs5Y09vZjEydWhtOGUyekswbDBwdERDZEwwM0Vk?=
 =?utf-8?B?SjZENDJIMG84N3VTSUFOaTlDYlV2S1YyNkhzcXhFQ1JWeUY1WGZvRWFDTURs?=
 =?utf-8?B?MUNCcU9telZLc2xISEpNTlZhZHBxWnk0M0J4YWh6OStjTnpIOVVZaEFXU2Nn?=
 =?utf-8?B?MllrMGpGYmE4NGtVRUlwZjc0d1JPM05QU0xyZ1lsT2FXSFZqaWZKdkFJUEJ4?=
 =?utf-8?B?Q3EyZG80K2JjNzhpRFZ5TzdwU29rWFJON2RKZlhJSVpPZEpCSndLZUM4REhQ?=
 =?utf-8?B?WEV0RlpoSm9qc3lIeFc1MW9pWktZdVh5Y1c4RVYvSzJPL2hISjhUUW0rUlFs?=
 =?utf-8?B?dTU2WXhQbllGelpXYXVCdzdZUEh3eG83WEp0RHd0VHFnbmswVTJFY1pOWlpJ?=
 =?utf-8?B?dzV5NEF1cEdmWVg1Um9CaFAxL2t6OU5VbTFsMk9wcnhqdWJzZjREVHkrSjZl?=
 =?utf-8?B?dXhKdExhZW5NWmxFY0I4Ykc3SnRaejRpSmE3RytQRnlSTm1TWmRmVG1ERFVv?=
 =?utf-8?B?RFg3dW5jeC9vYTFJWVRPVDU4U0oySUp3dFI0Ri9Jc0xyZnZsZHFZMHVIa1d0?=
 =?utf-8?B?cHVJS2VWejFwbnMyMGxZNDRpYXpTQzU4elp2Q3pORk53ZzEzTytZbG1rYytx?=
 =?utf-8?B?WE9OR1dkS3d0L3RxcTRDUnFZTTAwc01wVlFYaEVpMXc0TUl5bDhSbGtkWHJU?=
 =?utf-8?B?M1dkUzIvc2dtZlFER0Y3WnhRMkYwSHVRTm1rV1N2RC81OXQ2Rlp2Ky9XQkxr?=
 =?utf-8?B?T2c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55857ec0-90d6-48f2-a47d-08dce86700f0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 13:33:47.5765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay3/tk4osUK/Gbn5BimFW1O/JSpjni25Z9wgWImcnTKe21NLCFLLq7oFGTaW/CBMwTGmcuUI8xYPYC1r86//P+WAZZBlJYe9cYEanezrpzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_063354_190315_50098E8A 
X-CRM114-Status: UNSURE (   9.42  )
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
> The last 4 characters in Winbond's branding indicate:
> - the package type (ZE/SF/TB),
> - the temperature grade (I/J),
> - special options, typically the continuous read vs. page read feature
>   support and its default (G/T/F/R),
> 
> None of these information impact us, at the software level (well, the
> continuous read mode by default is impacting, but is already handled
> gracefully by disabling it in the initialization phase), so let's get
> rid of it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
