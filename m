Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08A1D3ABEF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Dec 2025 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VbmYeELi47ZWlRXTWc/NEWdup1kLev/POpASo9uMUpA=; b=StfHMXblMBcy9WWK67DDHUlSWF
	UtSgzFKX85Y31zZgLN5v/4vBSAFPKduSe72WTpYYZwGx7fG/HmuTmY54AGewpNAo0qUcvuRpDYYFQ
	NXqwEtPKHGOo4y7V46/VuxRScZ+oUlw8txYv0JUv+/1sGHy2/5EeJAUATBuqUnpHuLt5NiMHRtq9W
	h74CFCIoPKFJik9w3JSPhbFyklxV436y6rO6Wem6fegSB8e2zsnsIteWNRjKuhXX5bjJe56osbQgf
	kkMFa3fnb7NLLh57Ts2jfnzm2hbrJ1Tw5+RgbZLHY0fVPGL9TcG0/rwLYLvwv8qeC4+nZthwNH+mp
	zGfD66KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXW2-0000000Crnj-3CJY;
	Mon, 08 Dec 2025 09:26:46 +0000
Received: from mail-northcentralusazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d111::3] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXW0-0000000CrnC-1W9J
	for linux-mtd@lists.infradead.org;
	Mon, 08 Dec 2025 09:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urAlVlPxQ+GxNaDcs9hGTXHkCEwdUh1JdtaFGyTh9fD/HRR69eTaXqdo85Y7b4w6Ke5Hk7a3QkF8K8I1Je3vNBbrmXgo8jf0VMGTUNBm+zLZMAz6iC5jA0HjYzqlQRdxXRDaZIeQfp8DqU6X29FQ9aiNYLyQlstTRh9SXTWIG3tPBxgewLxoTfzqkRnHKDkTOhBwey78rBLJWCh7JAjO07QL4VniqdP2t3KxXc1EKPPvQCjwhZC9rYY9XS6PynQ/PIRnqFhl8PweNXcbT33T98mT6TtZf5TnP4p7GHRyzB3ykJG+VYGg4bMhDZp8T35tVjrOGXdaBoHm9p6R7p1DBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwhNqoFnftJTDZmUtXyrCrhpIufknHcOwwhGP3tjBpM=;
 b=aecU2mmlXuMfJVpPNpHPBWE6abydXhDbn3OLOUjcLs6Zo6QhIqHtuHmgQlaQUwEdQu/0UzOpgOSSd5h2kNLVcbMUe+9MqAwPF4nGj34QXOavS1+3HuO66mY8K865RyMet+B06NgGrrMwxrfw36znhA6AdSl+K1yE+7IJAAgWpjyb+vxNoeWK5DMirljLJRYDuRk0FAjyvAituuj++hCr+7LlcEBzWEKve0+EqoJK5PT5YmtwwHYCEXj55dTiEjQ4eI/JmalQJYJKOrIR7X21iZhBux3HhicI2YOKAn7KjRjTs8X+yVHZun7mSex7YJpKffjp91JY3OXLqi//DQxDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwhNqoFnftJTDZmUtXyrCrhpIufknHcOwwhGP3tjBpM=;
 b=eyJKwcdCTdCOVJBnnIVd1c6U9GarpsStbKF+gJxPx4Ck93xd975yu0p7gKxEyBm3Z/HCS/ZqhXuBg+B537VpksXF6YnUa6YpoO2xcwJUBuJRQZHE+9d4N/mp8C3oo8RWkATRhsjwXTh7ewpYCKtF2gyC+6UyEMWDN7N8zeGa5UAOIe0l4jIOX+jXZ1Zd31NAoazd+R2HLWGl7rlUVM/J4uRdX3pATqmtzWCqzijKXo+SwNJf3YQuNmJcVHjO+6mQGEjhHREVy/ow9Ijf2aULVFDkx57xJgHBqgfAddxwBnu0q+X/WYxN9MU3z84a1Mb4bgozH+dd6PUH+oIjygsGeQ==
Received: from BL4PR19MB8902.namprd19.prod.outlook.com (2603:10b6:208:5aa::11)
 by PH8PR19MB6570.namprd19.prod.outlook.com (2603:10b6:510:1c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 09:26:38 +0000
Received: from BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4]) by BL4PR19MB8902.namprd19.prod.outlook.com
 ([fe80::b62f:534e:cf19:51f4%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 09:26:38 +0000
Message-ID: <BL4PR19MB8902CF825EF35C4F145300BF9DA2A@BL4PR19MB8902.namprd19.prod.outlook.com>
Date: Mon, 8 Dec 2025 13:26:21 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "mtd: spinand: esmt: fix id code for F50D1G41LB"
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Ziyang Huang <hzyitc@outlook.com>, quic_mdalam@quicinc.com
Cc: richard@nod.at, vigneshr@ti.com, tudor.ambarus@linaro.org,
 mmkurbanov@salutedevices.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <87wm2x74pz.fsf@bootlin.com>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <87wm2x74pz.fsf@bootlin.com>
X-ClientProxiedBy: DX0P273CA0065.AREP273.PROD.OUTLOOK.COM
 (2603:1086:300:59::16) To BL4PR19MB8902.namprd19.prod.outlook.com
 (2603:10b6:208:5aa::11)
X-Microsoft-Original-Message-ID: <64e98c4b-dbe7-4b8b-9a68-d424286361e0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR19MB8902:EE_|PH8PR19MB6570:EE_
X-MS-Office365-Filtering-Correlation-Id: e7508f8b-1e29-4ce8-4fa4-08de363bde94
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TXC3SDMOKasxb1Truxn0Xe/vDknw79VFOQDR+Rt0BUobu2A5wHwTDOVOCIl4mho0WsmLN35CbwZ7gIh3gs/nPSCvwwouORGgDrn/xrfdib657ABSCUL9pljFO8/sKg3EpI5OPrllotvhfDmm8gZJv79hydBDd3tRtjyJy+KuJuMktBXdC1NC8Mmlm3c82w6ljHLC/oQ16yl4wOlwkLIKSOYOkAtDcArXNWk8ioF1WDAu0OuQo5TXkZcTfESZJdlRoCiCKFHU8lJBQI287rVmaP5wSBRnDqpOsCjeZlizDBLEgXT5VWiQPfrEZpeJy9ZEdn291JrpCWXERMk3A0cpP1G2tvAFrU12I8K3lsU48nDjkFcxWz4pIQfBoxdB95QMVexOzTWwzkvcKPCE7kNb+IWhPru9emyUIJIlrJF8sBGCpo0CFsq/JY0Jz1M0X27MfqpJdDhmu1RBvpGLmUrfcrWYP12XnII7Y09x7XEYBE2X5d6q0rBRgK8xDgwmztyKDP+8d02m40Pm3MFVpI5eE2Nje/XA6HdxZ3p14HabRzUtuoJqCuSH1P4NmFB22fenMmlq58xqHh98ItNE9AixMZwEOnw83u6Ur+2UeBbOya9sZPWtk/NP7D+c3Dqr7ryiUDWZmpXATg+ri4cJ6iVrA/nz2P6OCnObBVCKhSv3X9XMpZjB6wsyhyb73f1v9/RI0Xeo26kpkuFRs3PFM7GxYdWAE0HhAqbVFU9jRhNPHvQl7xNyuDapqoAfX9g9tSie2XU7EhmX3Y9QOVT2XWa8j4h8E9z9yw66h8=
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|6090799003|461199028|23021999003|19110799012|8060799015|39105399006|15080799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUVacW8zL3lFVXRMSVQwbExQY1ZONWlzdGo3SzlxVGhRbHgvb2xESmFwd1dO?=
 =?utf-8?B?UGpXUEsyRGJQSVZtN3g0bm84bXJQbXlGaEZKeGJHbFdrYmtVaEkwMmowTmVI?=
 =?utf-8?B?SFhWRkpCRSt6TG5aQzB2cHlZZWZRQU9VVjcrR3k0RjhPUUhvK3lBVEp3Z1dT?=
 =?utf-8?B?THI2L2I2RjBMS2J3eTMrQXplMnRjQmhHa0Q0L1U2QXprRmE1UzdzSGlSc1pM?=
 =?utf-8?B?TjZTR1YvV2pzcXhTVlFMZVlRT1RZeDRrYVpBV0I5RDFjVFJITy9NaGtEVEJv?=
 =?utf-8?B?TkhjV3l6VnBLQm5QZU1NUjhqbjQxaTcyRkk4K0JxVEkyeWJBUS9tQkpNV3lz?=
 =?utf-8?B?RWFNdmhzdkIvbGdKK3BKdERPNW52TTdFeGNBMWZpLzJZZS9Ub25aR29sUnc4?=
 =?utf-8?B?bitNUFJ3WCtVRlo5cGZleThiaitoaGlQSzR5ZU90Y1FoMEhKQWs0eEgxMW14?=
 =?utf-8?B?NDNaYzEyem9PdWc1YWJGZ0ZRZVVHRVdPU1QrNG5aSVI5SEkzZUlBOXpocFB6?=
 =?utf-8?B?bGpVLzQ1Z2JxNnVQZVhCUG9YTkpLWEcydFZMTmc3VHU4YXh6M1B1SUxiVFRZ?=
 =?utf-8?B?YU5IK0tDb0VoRXpQbzRCU2wzM21UK3NuSXN5emVadk1LOC95cTVpSzVCVGJ1?=
 =?utf-8?B?d3NzbHhvOE52MUNmN1BXaVVJSjUydWg2THVoZkZWc2UyQzM2K0pnbkJSVkk0?=
 =?utf-8?B?UEtjSnRBWHRJaWk1c0x0ZDNSRGttdWsvL04ybmVXTjFqMlhySnRXdHIvSjdY?=
 =?utf-8?B?V2s3aVNkcnlFc3lNWENCQ3BPYVRqeEVIY3c5RDUySDNQVnRqU3ZwUEJSUC9L?=
 =?utf-8?B?OEFrUi9LUXp5dWJ5cEttNVhEZUwxV3hvY2M0TExJR1ZYbVlpaFRyczE3R0lM?=
 =?utf-8?B?bDYra0t1UkZBQkgyN2lPejA1MHhMREFpQTkwMnNjR2dVTFFNYUtJV2d0MXlj?=
 =?utf-8?B?dHowNjZUV09YYjZMbG01WnduOWs4Skp4WDQ5UHUySE4zRGlJSFBvUDkzelhr?=
 =?utf-8?B?dkdlQ3NhUzFkaGdZN01VbDhjNlVHNlFFYTZZTlpJaWRQSWptV2JldHM4Y3V2?=
 =?utf-8?B?M2tPZEpUa3ZEb05DSytMNTFlUWVtS1hURi84TWJya1FSZFV1aHB0a2ZWWXFX?=
 =?utf-8?B?YWRSUi9mUUEvQ2ZNYVNOdks5ZXMyYWxCemlaZ1N5R0VGTE9NSFo0MHlWcUw0?=
 =?utf-8?B?eTZtZSs0S2RoSjdxUEsvRG1mUER1dmQ1WEN5ajJNTFllM2dScEhHb0JRQmc2?=
 =?utf-8?B?U21oNkprVWZQNEZJR0FZQi9KdTZ5b1BYcHk2Ym5CTTVDQWhjbnNWbjJqb1lx?=
 =?utf-8?B?N2NYWFNJVndwUTUvQ0l6cmpXUGVVbzB0MElaN1F2c2xRM2Ewak90UUdKQVFu?=
 =?utf-8?B?d2xNUTRKbExMV3FWdGZZU29NazcvQ3lYb09KOUc4R3RFbFFidERkRVR0YkFB?=
 =?utf-8?B?UCtNUjQrSmZiT2Flb1JSV003Nmtad0lOTkhNNFhpdGdRNE1ZS1hhbVpiN1ZP?=
 =?utf-8?B?c0x5Z2c1MUNFdnkwMDU4U1l2Tm40V1pnMzhHWTNqK3dETUllaHFLWjQvRVZs?=
 =?utf-8?B?amlYK0pwaVNXRHREN1p3T2FWdEJsTXJnci9zd0ZuSEZaK2E1TEJ1NHpyaDFN?=
 =?utf-8?B?dEVWd05ldVQ1YkxVNXRyeVI5d0xjRFE9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXZqM21OeC9iSXQzUlhWR0xMbndiWU5QNDJqdm1OSEZrWHdWeUh2SFM0YzRF?=
 =?utf-8?B?aG5mdWxhL3RMTVl3aG5iNEFzbzVSeHp0NE5USS81OVB3NFJpRG4rakZEZHpt?=
 =?utf-8?B?VGx2VUQ1ZW0wL0IxV3BwSEtFR05tS3NTdXp4UDlPSTY1NmRaaks2RE9MT1ps?=
 =?utf-8?B?WHV0azcvK2xvb09Ob1Bxc3RNa01pN1duSmxwT2lucC9odWFPMGFpZmJjVE5D?=
 =?utf-8?B?cFplUGY1S0Jsdlo1bmhjN0ZiWTFTZ2FjUjdiNzRpN1R0aFlNOEFMbXJEQysz?=
 =?utf-8?B?WVVzZGhmaFBWSStWMVB2VVR0TFZkY1ppRzZnTkpQd05TSUZVTGlJSU8vZmJL?=
 =?utf-8?B?R1pKTHVuRVhWSWpCTVA4Q21ab0pudGx1WHdveDErTkx5WDUrRElvZG5FVzFM?=
 =?utf-8?B?eWZnRFVOUXRiNGFzN05OTU9JK3JUNUZPN29SN041aWJMWHQ5cXVsTjFQWHU1?=
 =?utf-8?B?MTNHVTVQNnlWUG1YK0E4VHpNYkdjZlArZlc3NVhRZER4RjUydXlwQjRBRmpL?=
 =?utf-8?B?Uy9mWEE5bVFNNUdvamJYeFZiRVc4eDlsTGx1UlA3Qms5QXVpZ29UekNzT1ZQ?=
 =?utf-8?B?RnlDZUhXZ3d5SG5uWU5XYlBXQnJTOFN1NWEwMGJWOUVYUWJJcnlGd01jTys3?=
 =?utf-8?B?OEU0ckVWckRHN2NKdjFhNjB6d0RBUUdXd0NUaW1BeFlGeFJpY3ZBOVFoV0gz?=
 =?utf-8?B?alFmY1h2UnR6c1YwUzR6U1FYOHF3MDJ4Y1V3NDE3NThFU2EvbFpnZDZ0eDIz?=
 =?utf-8?B?bnM5RGwxME9NdldLMXVRMk5INFNQK2MxYTdPbE9QOERPZWluUTlxS1JuQ3Fm?=
 =?utf-8?B?d1ZERnNMcDI4SkMvSmViRHRKUThIdGdoL1VjS2locUR0L2FxdmNuaHN5MVZF?=
 =?utf-8?B?b2tGTFByMDdyR0xpTXVJbmxEaUt1U0l6U2hQemd6bXJqcEd2YXdmSEtRSWpo?=
 =?utf-8?B?enIvVEppaWp4RUxHZUR3czNaQTZVUnoxYTNqNlNTUDI0djY1NVJuSExSRFNE?=
 =?utf-8?B?UlZieFBMSVZuMkNSMWRnTVd3WkVCZmpWMTlsVWVrTG4wUzAvOGJPclpoWE0z?=
 =?utf-8?B?NXZKcjMrNG1nRUtpWDg2Y1gvTVlVZVliV0JGdkJjZzNJdTVsOWhsclV1ZXVt?=
 =?utf-8?B?WVlXZGEyS1c1eFdtbTloUTNPU0JvWDlydytLY083dHV2NXU2c1NGc0ZyLzZh?=
 =?utf-8?B?N2pWT1N3YncyUDlHdTBKd0VaMFVFOHl1cEpXK3pub3VnV2tYeDdOTG9TY1BD?=
 =?utf-8?B?VXhqT1lVTEdMWnV2OU1nTFZwdUNLV1lMVnVudnNBdkl4TlNaRzJ4TmxNdjVE?=
 =?utf-8?B?dzc2cDBGZnlYdTAyMUZmMDVLdi9SZCtlOWpzcW1XMWxqeHgwb1JzRTU3K0U3?=
 =?utf-8?B?UmdUSmJjVEY1M2U2aUN6SGM3SnNOWGhuVThEZGhlenExSkkzalRvMU1JM0JS?=
 =?utf-8?B?Y0JzL2lLMXJJMTIva1JJYzlnMFl2VmR4U1RQSG9uMmNaRWpMcFZCNTVmNmVz?=
 =?utf-8?B?dnlyOGptYnhWZFRaS24vTUQzVExQQUZlNC83UkdrcUtUeklBbkxjWE9XOE9p?=
 =?utf-8?B?aHZYVHdDYThYNENpY1FOS1pIMUVLYzh6NnRic1hWa2NWYU1VNG5mcnhkd0Ft?=
 =?utf-8?B?c1M5NklHa1FEaElOb3VKTDV2dkVFc1Q3TkFGNmFvVVM4N3YvdzBiQnhCQUlq?=
 =?utf-8?Q?iZ8GFdE5bIgPD9OrnV+R?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7508f8b-1e29-4ce8-4fa4-08de363bde94
X-MS-Exchange-CrossTenant-AuthSource: BL4PR19MB8902.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:26:38.2929
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_012644_441475_D96589BA 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAxMi84LzI1IDEyOjMzLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIDAyLzEyLzIwMjUg
YXQgMjM6MDU6NTYgKzA4LCBaaXlhbmcgSHVhbmcgPGh6eWl0Y0BvdXRsb29rLmNvbT4gd3JvdGU6
Cj4gCj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgZGQyNjQwMjY0MmEwODk5ZmRlNTllYTZiMDg1MmZh
ZDNkNzk5YjRjYy4KPj4KPj4gVGhlIGlzc3VlIEdlb3JnZSBtZXQgaXMgZHVlIHRvIHRoZSBsaW1p
dCBvZiBRUElDLCBub3QgdGhlIGlzc3VlIG9mIHRoZQo+PiBmbGFzaCBjaGlwLgo+Pgo+PiBRUElD
IG9ubHkgc3VwcG9ydHMgNCBieXRlcyBJRC4gU28gdGhlIGZpZnRoIGJ5dGUgaXMgYWx3YXlzIDAu
Cj4+Cj4+IElmIHdlIHVzZSBzcGktZ3BpbywgdGhlIGZpZnRoIGJ5dGUgY2FuIGJlIHJlYWQgY29y
cmVjdGx5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBaaXlhbmcgSHVhbmcgPGh6eWl0Y0BvdXRsb29r
LmNvbT4KPj4gLS0tCj4gCj4gU28gaG93IGRvIHdlIHNvbHZlIHRoYXQ/Cj4gCj4gSXMgdGhlcmUg
YW55dGhpbmcgdGhhbiBjYW4gYmUgZG9uZSBvbiB0aGUgcXBpYyBzaWRlPwoKSGkgQWxhbSwKCklz
IHRoZSBoYXJkd2FyZSBpdHNlbGYgbGltaXRlZCB0byByZWFkaW5nIDQgSUQgYnl0ZXMgb25seSBv
ciBpcyBpdCBhCmRyaXZlciBsaW1pdGF0aW9uPwoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKQmVz
dCByZWdhcmRzLApHZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
