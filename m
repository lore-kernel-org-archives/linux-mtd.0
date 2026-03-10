Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE44DFD2D9E
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:
	To:Subject:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ccqs50oDgSP8pGGnotJYwt/W0Sh29wAA2UXYgeTi+ls=; b=kSkMPKatFbDr3Q
	G4ex/DETrPLkRM4TU3ETUNjBBejcQNblt194J4tXG5MzR94bcWt0bfHPLygPkws1aVB2d7Tdw076D
	wrDfCvGCesJaIr8bv1V6eKilHByL69qJE9yvXQj3qn6XHcjxqb+CDc18wv29ZTtQeTSeMyPMmw39I
	ElLgqk+6iasjwBsTHVAUgUtnUfwD2lJC7REanue85PmIQ5GSXU+u+yT3B19rtZUE5YYeGosj4ggM9
	4Nq2bOtitYST9Ao8YKcQ9AbgUsw4MZsrkVAB8rJq3z5ZoSR9fkJEwp1qdcsreSVkR5HeOWm2v/XE1
	RW/ZwLR8mJYKXYMMQcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxtX-00000009gFE-27He;
	Tue, 10 Mar 2026 14:17:11 +0000
Received: from mail-westeuropeazon11021073.outbound.protection.outlook.com ([52.101.70.73] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzxtU-00000009gCp-26fc
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 14:17:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxVUdsea4rurD60LhtZ4trWYJBe7sWLK2GhWUVHAX7T5gy6V3Ee2uuWVoKaGXUvv2FQl8UVwd3BOlE0bciJpD+slvmnJuYX81xhUzD4g2nnD//B+i9n9495MRW1Mcj20fs3sWhJiXJOqgCwl6If7wUQIl4zfmN4MQk0O06j+qNfStI0DzVvv54UNgTnh5/45l+jIPE5VgLYsaRYVntTfmz9wvAw7Dw4NQunAijOZ4mE/YYGH9s4YjDZbLVcffiT3hN2OCFYaT0/xSMJUuVO81g+V7JV9y5Bmd519Dbpt/s2Z+hILVo703eZnOdL1cA92USd5yLz83aPjjlBud/tzZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuSLZiRFm/8GvPY7B9QBJxZsAmfA7TRm6XfYxr1lU0o=;
 b=LXF+Pa6ofJKKueKJINiHYiNQrMptFeTGB+r9eWN3MFsrwLNb8200aXIY4kzQ+Z6/OrljxtSqlhe51+kCxYG73ZMeu75vrvJbaMNj3VkvUt7eIR/TzBSYZV6MQZHYnhlXETfc0B3anWFoc+puZANERVFppK1cu9mGq2Snxty5K1bHTwJxxvwiFDrGmwR5vtaOFXdX5eJQ7+7qtsqDLQhTGDwNbQU8BIhkHbU5UoyK/GELhOg90vT1AC87Xq+WFie3UqaSq44kAV9ceZzNHNV8eTrP2Tlwe5SeHBn+7wsehLZfADN7CUjp7YxbXTuxdSl8UtnoYTy+9XD3lB9RBlYFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HuSLZiRFm/8GvPY7B9QBJxZsAmfA7TRm6XfYxr1lU0o=;
 b=leAKjPeit5KJXCqT4zBe2iKnDO86tHoJ3TyQP6mY9s9oC1GiQ7PpJaiJaCMT1r4vI+29Ed8INNPqn1gQN79X+iYP1ibtm6KZ38ztMa2NziOUo8Yz1ewFrb2R12vbNeLXHEMIzEvfEGh6yOSgEqPx1GlcaCMbKAhKNkarlUDVig/j3kkE142yO5HzY0oYkDCHzCGgcmVyxDNC4O69CDcq82F3X8LyVuzKEP7l+YH/fwyhfIL5SzzH43k+I+ipg7vpweCaQVUYcYHBheT2ep31Ub1YfOxb8TAp5bsL8X+BlNIXR4LzxNPyEmu6USU6ZmNIWRe7SJM+Tu5i5asMndUwXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by GV2PR10MB8040.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 14:17:02 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 14:17:02 +0000
Message-ID: <fe541df6-ee96-4c8f-b04e-58098d29485c@kontron.de>
Date: Tue, 10 Mar 2026 15:17:01 +0100
User-Agent: Mozilla Thunderbird
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay
 values
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Frieder Schrempf <frieder@fris.de>
Cc: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Han Xu <han.xu@nxp.com>,
 Eberhard Stoll <eberhard.stoll@kontron.de>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, imx@lists.linux.dev
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
 <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
 <87ldg1nij3.fsf@bootlin.com>
Content-Language: en-US, de-DE
In-Reply-To: <87ldg1nij3.fsf@bootlin.com>
X-ClientProxiedBy: FR4P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::20) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|GV2PR10MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1eaea2-9c3e-4ea4-aad0-08de7eafb306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Dk9xqjzOVq4cr3a5dTZBMaTioOjUTm7KaKTRIp7nz4lY1rVRQp5npQpTNGMvww7nUEHDFY1kgQXkOsYhctRJDitNM6eMjaRM9DN2OOM/8WgmxjMu66j5xCkoCd5gA5kKiIlpVIa7XlKcaznlIw5vB46O7dGvdCdgsC+HR7KvUtKVyHhxpDtM1vi5oC9ubgWN97uNjfMmKxDL7jpf8S1LCtMN8XTPNj0WPpNJWq0gRzXr+LQ2FMX/h45us/2EI1ZqKUrPO5+B6nMHDHo/aj1W6PBKM+e/SDyGAdiHmQksLhP3O79KSF5nJJHA/KjBqz4eDB5ZBPSCEDncvmCeU9zp42FAvYFX5l5o9X1fCFa4GMbFreKvjuRDml53rxKF3z6G57MxhqUrtDAFtWZyykqokY2LU6gi2GqnraD1gI8I+qHD9Nyr5HO/Ni2hcptQHe9ucDmFNyvRRUWvFahx8jdJVkIA3wDLt5wwYG/aQ/F6j253ilKrFUXJEGScyuF8G/YqZYHikbPORbnWqSOY+rglciCSr79Va24W7l3BMrE+hWNpdRWZ/PbLsHbKrzsZRxcVuDw5LZwlJXHqX0Pr9QK17JWhUSulCa6dbukrDM4F89viaWXC0tmtmaq349BZz+kEpbyNN0QG87gurG7xNYQVhZj9fyc6CN7XiFYXjdKkX4LABPbwZp2oCA+SZl8kNGY9Gr0TOjxm4R+4Qsy90oNXiAQgScIlQsS5iyH6b+nFHdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHlrZE1RTGQrVFpsOW03aTQ2MXByZzFuY3VwNnpNSFU2SGpHbVI4dCtuWmsz?=
 =?utf-8?B?NVR0MGpjblNtZnUxQXZIMytjNFRlbEdLaTBUQ3hLTjdPaXFBait0bVVLRHdF?=
 =?utf-8?B?U2pBdE11MVRqbitEOHlCWkc0bG1DVDNtdEdkOGxGdXVYU3ppVkd6Yk1oeDRS?=
 =?utf-8?B?Sk5ZRGIzVWZKK1JyVXlSYXA0UDljWHljVVZPTHdPTWxlV0l2bFh2VVZLODI1?=
 =?utf-8?B?MStjQ2xmdlZUN0lrMjhQQ2hNbldXa1B1NFQvUnZ3cmU4d0FodDVTTnUzWUtw?=
 =?utf-8?B?UFNvb0VQRHpYeDJaTnRqc1hHUUxramdwKy9va0RLVFhacTNFTlpVYWlxdmll?=
 =?utf-8?B?TEhqTWNHRzhyWVFkUTFiS2w0VFZoaWlkd0FTOUd6cDM0ZmpGQXB1K1cvQld4?=
 =?utf-8?B?eWxUMDJ5LzBiSGNsb08xQ0psWW5IaE9zNW4rUzlmVzdVbE5uaWZORk5HZEli?=
 =?utf-8?B?M1hORDRmYS9ENTFqSEhudDRzS2ErK09ZWkNBTXJFK1Z1ZTFob2VJNFBHeCtO?=
 =?utf-8?B?RWUzYTRZaVhIQVBMenprSkVwSVFUelpnNlZraWVMeEdNNndDY2tqQlZqKzVn?=
 =?utf-8?B?N1ZSK1U0RWR3TDF0R09SQVlGVUdjLzA5RGdrWG52dllteW1XYWV0WU5RS2pX?=
 =?utf-8?B?N0plOW81OVA5dEZvM0kwTUVhN01KZXJhR0FMUGhXMmZRN2hwV0tMeUQxVjhp?=
 =?utf-8?B?SDA4RTQ1SFg4Qm5Pejh6UVFtTVlLRnFQYjhrK1ZuWlpHdU11TzA0UFQvbWUx?=
 =?utf-8?B?ZTVJWjR1aU0zR2NPb2o5Ulp4eUxMOVpGSHlkNHZDVURxc29qdXZJQVc0Yy8y?=
 =?utf-8?B?WEJ4VXpCeCtabzR6b2FKZUlQdm8xRlVxY3lNMmljOGoxUWI2ZFVLR201cWVu?=
 =?utf-8?B?cC9YOTdmTGZSTjNpNEZ6YkxKQUhTT1V0VHlNajl1Tzk1dTREakxaVDQ3V0c1?=
 =?utf-8?B?WENIdjF6T2dGTjJhOTNERGlpaHRGTEw3YVI3akdZMlgvTW9UM0lub3pXYllJ?=
 =?utf-8?B?QVVXK1VYbjB3QjNtL1hxUzdjbC9POW9Ub1NNNDVUa2lwdWorQjVZdnVPUnlL?=
 =?utf-8?B?c0RQVGFXMDdFTG1SSExoZmJhUFNuM21XM3h6dExYcHBrTU42VzlPamIvM0NB?=
 =?utf-8?B?YXpGcjZPMnFGRlMwakZ4Tk54aWd5Z0FjK0gxTXM4b01tbFZLc0Vjd2Z2WW9D?=
 =?utf-8?B?KzBONnRieEJqSUtsZnZKNUVHQUNqZUM0VVAvaXY3cWlUSEs5L0kwR3ZES3Zh?=
 =?utf-8?B?c0FyUHFNQTd4cWZjNHFnR01oWW5MaDYwT2VtNEt2UWkyWTdoaFZkSjFGZzBT?=
 =?utf-8?B?TXltUWVXVW8yeXlaOERhR25Kc3cwSHNESlgxazBCK3dJZUtTVzlpamtHc0tQ?=
 =?utf-8?B?NEpEMXE5SjV0eFBlOHNjUWxoOU9mUEUxdFpSQzBXUXZkNjFEN0xOeXJmMmIz?=
 =?utf-8?B?d0QrVVYxSEwwa2dmdU1aM2pvaHF1ZlVTa1J5aExmeUVQS3JRQVpVSHplem1x?=
 =?utf-8?B?Tktqcmp4NllrK0s0M1FwWE9jNUc5Um9ndThIazdVUXpPQlNITURrUTJSTkxS?=
 =?utf-8?B?a0FXN1N4RlVkbkxnWGhNRzJ2MTVoWXQ2WkMxbVZ0NDBTMk1FSUhmNUVER25z?=
 =?utf-8?B?Um1VRityR2ZSWm8yYi9CRTVzNTRzbmhmUUFhdG5DdnV5QVBYRmZxTk9RRmV3?=
 =?utf-8?B?dWJSc1lVelcrVEZ3Y2tHQzBFL2NKUWZNcDJpbHoxaEZjWnFLcEtKYzYzMmZT?=
 =?utf-8?B?RnRWTHFaME1vOGI0SzFvaFRSTXhkZlIyNGhvL3o0UGZFeStvR3RzSkJ5K2xK?=
 =?utf-8?B?dE9kZmgyYmxEU2R0VGgyM1E1TGVRSjRjWklqNWlaVEg3YncxUjlhR2s5NXlY?=
 =?utf-8?B?OW44LzN2aHltMExVcER4RTQ4NFZDeVhqWlFoTWxtbVlzQVNzTGFYdldrckw3?=
 =?utf-8?B?dkEvdnI1SmhsSXI1YWYzaU56RHJKMXBzc0duZWZmR1dOOVVYQlhCVkZjc3lX?=
 =?utf-8?B?b2oxVDUxZ3pPdG1NMlVyVDlpRW4xR2I4MENlWFRuellTUkVHdEhKYkRsanhi?=
 =?utf-8?B?WWcvODU4UVF4NGNsbGlvQnlwUmVaUmhQLzFaT3lJSkU5SlZKOXJGUHJlNDlI?=
 =?utf-8?B?N1YrSjdUNXdyZUpKOTBBeVh5MHlYOWZIbXJTeTUzSFdLT3VEQkgybG5MTEgr?=
 =?utf-8?B?ZXdzYWNBcngzeGRmMlZYbEs4R29jNmRCQThTaHA3cGwvZEh4aTlBeThOejNL?=
 =?utf-8?B?SVpkT1A2UHAyeVZ2d2xnT1NJUS9ndjcwWitOVVRKWkN3S2NFZjEwR0U4UVlL?=
 =?utf-8?B?bWh0MVpSRTJWMk8rT2p6RS9NZHBpNk9SUmRYRXpyQk52bE9PaDBvWW9xMnZq?=
 =?utf-8?Q?huObROzuT2SbZh/w=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1eaea2-9c3e-4ea4-aad0-08de7eafb306
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 14:17:02.2166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7qwUO3Jc5bffimJFBYHUbKqAJXaDE8GcQT6X1HKKYJaTjH4VriFB6GofR32fPlt/5hU04D+vTkJ162CY3zfsryM5LI51Avb2aHJZO2D7Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB8040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_071708_550517_491EA855 
X-CRM114-Status: UNSURE (   6.84  )
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

On 09.03.26 16:12, Miquel Raynal wrote:
> 
>> @@ -277,7 +291,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
>>  					      &update_cache_variants),
>>  		     0,
>>  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>> -				     tx58cxgxsxraix_ecc_get_status)),
>> +				     tx58cxgxsxraix_ecc_get_status),
>>  	/* 1.8V 4Gb (1st generation) */
>>  	SPINAND_INFO("TH58NYG2S3HBAI4",
>>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xAC),
>> @@ -288,7 +302,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
>>  					      &update_cache_x4_variants),
>>  		     SPINAND_HAS_QE_BIT,
>>  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>> -				     tx58cxgxsxraix_ecc_get_status)),
>> +				     tx58cxgxsxraix_ecc_get_status),
>>  	/* 1.8V 8Gb (1st generation) */
>>  	SPINAND_INFO("TH58NYG3S0HBAI6",
>>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA3),
>> @@ -299,7 +313,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
>>  					      &update_cache_x4_variants),
>>  		     SPINAND_HAS_QE_BIT,
>>  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
>> -				     tx58cxgxsxraix_ecc_get_status)),
>> +				     tx58cxgxsxraix_ecc_get_status),
>>  };
> 
> Are these 3 changes legitimate?

No, they are not. This is a last-minute fixup gone wrong.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
