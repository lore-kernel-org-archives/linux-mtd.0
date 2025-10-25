Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EE9CCD1BF
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Oct 2025 02:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur0dhF5pL36XfhELvbhcq2a9X0n3rbI/AZ7+kR1Ag8g=; b=VwBhVPohZCatmcs/5WErKQ/NoJ
	Ty9POFOEdla2uml/CX96DYxbKP30oBAXhVFc0N2BrDoWjBMC2b2MggQPwLS6WPfDCHmwECQ43nRro
	H9vtwknKKUU4kEDU+tW1HPtikSGwREY8Q1Qf1hF1geEdjDAt0ZNBvPbhThFTcpV0AKmoEmkK2UMnq
	FyAgeRuqyazkJAt/kKLmwALr5t7kI7g7SSa4flac+m7YgNoVlUcVB6QTxnjUWtI0fbm04ta+13agk
	NoVGcZybb2rbmQ8FTXbWtWE87sjds6Q7NMNGTlJ2OodeKlOwYvj/rzF2wsNsSsdQ79gLv7pfoWMMQ
	CEBqQ4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTtV-0000000Aply-1qcl;
	Sat, 25 Oct 2025 02:20:37 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCTtS-0000000AplH-3iJg
	for linux-mtd@lists.infradead.org;
	Sat, 25 Oct 2025 02:20:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T41dPTmKkzs6khIGoHx/1ji6AFx0yLOeF8BLOX6NbMhxYEqtn9S4zWzZjRyDkpuNGx/pw6lHMK+r9yCJ26Q50JYMa7n3kRLbhz7KgN5Se1AbxdcdBpVT3yu3yf1UjxaEo2CqdxwA2OmByTEOLCOACCXcuyeji21K0UFxF7/f/Nuqy8QoISOzANY+oQyHE0g/a13Z7J4rz1WYZBzpsRS4LsOzpa6KEXHwS+5iCgaCP/k6CPd/ubYsPA2ILCGCcvHzFm3hti6FDSXfEoJa3g32KMhI+zALxXr25L6u+/l62IWb3Y4UteWYwDSmcQ8ER2m0BlGXdfQ8WETZfacp7j/qEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lViSC96tAbMkXUrDtHD1+RD0yxeFjzPX9tiGXz64C7o=;
 b=HGOhfAOQgJABU763M6bF4mcmhAkHhyF1xwOChMy8mYcOma52QGQVrU3lvi/7MjtBRSHFymIXVee5eM+ROWy2wkCwtHa2fc2ou+Fvj8iOSLhyOpulNJTrE7w4yA101esTfOWFvxYcYq/ENnaVamSU3O+9qYRplDZVgBEt7xhWb2y01yHhOc83uVxB+VPsuePV15xzXQIx68swkl9RhWtbvTc4onNIHc3rsudPdH60+Bgv1PZdDaaD71Ks5qFkg6T9vhMjmpW0F4FffQT+/BYCSGYMYWrA6t7ngQyHnxPk8CCDVCxwFZvZ/pATKBqYX/9NY+yCerBLToOPe8i0eImAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lViSC96tAbMkXUrDtHD1+RD0yxeFjzPX9tiGXz64C7o=;
 b=cqtirC/dbBd0xq9MrZp4U+JkF4hiQ5WgFVnD+PsJimiUhfI7UVvqhr+hrBFT/Wd1FmN961k+nNckYDyL/u4sku8g4jMTHPf3YbiH5XNDB/MnqW+/635wbwDn1tWQuyePIPAIRO55abU5JDj16yxmt2bGSBL06h02cygw6F0hFK45Bak/TUQSYWusGD9gw0zSJiTTMwo5th5/SqUaRD2evGShlxB+SVCt3HAm0aexiGTKINtUxHplOATjEBWeXdKbMDozOJyyM/fxjEzzj7vTv+vwIElsdNqwu2r8zYtHwtdZ3ZTDTbLJ5w/I5a6xyDHHk6StUQHC1Fgt+FwfEl6ZcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BL1PR03MB6037.namprd03.prod.outlook.com (2603:10b6:208:309::10)
 by PH0PR03MB5687.namprd03.prod.outlook.com (2603:10b6:510:39::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 02:20:29 +0000
Received: from BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1]) by BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1%3]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 02:20:29 +0000
Message-ID: <c7369d8f-5397-41fc-92de-afdcb47020d5@altera.com>
Date: Sat, 25 Oct 2025 10:20:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: rawnand: cadence: Add support for NV-DDR
 interface mode
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251024102611.310568-1-niravkumarlaxmidas.rabara@altera.com>
 <87zf9gpn1j.fsf@bootlin.com>
Content-Language: en-US
From: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
In-Reply-To: <87zf9gpn1j.fsf@bootlin.com>
X-ClientProxiedBy: KU0P306CA0081.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::17) To BL1PR03MB6037.namprd03.prod.outlook.com
 (2603:10b6:208:309::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR03MB6037:EE_|PH0PR03MB5687:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4c49e8-ac75-40d2-b438-08de136d10df
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDRwanczV3VlalFMaUVLRXVLdE5LN25abHZ0NkUzTWtCVjRqQmt2UXdhMUVk?=
 =?utf-8?B?WFQ0cThRNGVCbHo1VE8ydGJXTDREVWNLNVR2NVhISElVdCtTL1RoZVl1WmI3?=
 =?utf-8?B?UjhFaHVwN1p5aEJ3SXJHWkw1QVpJWW5OOUVDRGFDY0FvZDVUVnBSTHp0NmUy?=
 =?utf-8?B?RmhETzZGaFhIVThzUkZic3Zkb3BHRHZWb2FmK2V2VWlncFFKY1J1b1EwdzZh?=
 =?utf-8?B?cFBlOXJrem1VUDB3TGVYTE1nSkR5OGMyVk5DaTAzQlBLbGpEY0VPYmxkNTR6?=
 =?utf-8?B?djJSeElHSVNFeVZna1V6cmlvdExoN01JRWIvdlpqdEsvQnhiZEZtSTZmdTBD?=
 =?utf-8?B?dnIwd28vYkJPMWsrR0FmeHVqVitwdXlpS3ZkRlNKbXY2Zm9MdUY0OUZOT1Rl?=
 =?utf-8?B?ald0RUxBVnVhRC9sWjBPNHQwbFAyR3RPTkk4K2JoTVV1TkZnRy81RFdzVjUv?=
 =?utf-8?B?SGpaUXN3Si9GeHI5YzR1RGM2aXBOS1UzRDJraFpVRS9LV0cwbTZTMENKazBu?=
 =?utf-8?B?dEFIeTAxSkQyREQxZ1FZWUw1L0hVUTY5SGlTK0UyVCtiKzJFQXlyd09jSGZP?=
 =?utf-8?B?MHEzYmxoNWxld21ZVU15bVVxVGI5TlBJL2tDVVZtV0N3NVdoK3BUNnRkK0xl?=
 =?utf-8?B?YW9zYlFUYzFBb0o0ZkRlMXN0L0phcHB4QlhONFR1QjBPTk1RWEFURmVIajYy?=
 =?utf-8?B?T0NUWThHcVQ0MzA4WUM4Q1FtQy96c0pHQzQ3WUxlVk5NT1lBdktpcUw2NEVC?=
 =?utf-8?B?aFJYVGNnSU1YbWd2YWp6UGg1a09aU3JBNnMzREVkS3dhYjN3dFZldjVBVXR2?=
 =?utf-8?B?bHljZ0RMRWhma2wwTFpJb0lqVnA2T0M1SkMvZ3FmbFFHQlJORkJ1cHRBbEZE?=
 =?utf-8?B?SWFBR1lNSTlCSi9TbnRIcTBGZHBTLytiRXhlVDh5akx5ankwWVZDdjkrNUM1?=
 =?utf-8?B?Q3pOeWw1bUtINkxqc2ZZMzRFTTIrbVlySlJDS3dMUWFXREdwTHVLb0dFc3Fm?=
 =?utf-8?B?VUxITjJXSEhKYzN0cHVlNFp0TlQrTStsYWtFU2pXZE5neHYvVTg4dXhsL20v?=
 =?utf-8?B?RnRJWWxqOHl6SWpJc3pqc0ZxL08zekJlUTUwLy9GSXZTYmNCZTlDYzdiVTB4?=
 =?utf-8?B?bzVRSml0T2JqR0daLzJCS3dobnhYaVVSVTJhT2MrbnZaUU5DWW9mMmtyekZV?=
 =?utf-8?B?czZ2NWFtbms3b2NYaklCbGVobk1VRmhJS01IRGsvSHhpcGFwSnRHY3F4TlI3?=
 =?utf-8?B?cTBEZk1uY2VSN2N1bEFadW1YZnJreDRXbXVqaXV3UjYweENKMkN6VDN2WWto?=
 =?utf-8?B?cnVWaHFTZUMwbHJPa3EzV0dNQlBUNVNFUkwzM3FkV1Z2Sm1vUVV3aEVNTDBO?=
 =?utf-8?B?cElGTnhOeHNWa2FPRkhYaEx3cmVRRURORGpoaHhlY3F6NG9yS1pkaUdJTmhO?=
 =?utf-8?B?NHgzLzJVVDJvakZpK2NTbldMS1JxWkZMQlpnM2IrZUR1bFhkNjFUdkpZdlA4?=
 =?utf-8?B?RDZsVitBN0p6dnV0ZUpjMmpGUWF5cEJCMzg3NzlOcTh2REZ4UTB5bVRRTHhz?=
 =?utf-8?B?T0JqYVdyYmJDcmZ0RVdvb2NiU0VBc3RIcUdTTWJ1dDNtTVptR0ZGL2hKMjJ5?=
 =?utf-8?B?eFZQVXJlbjFLMm10c3B1YklBdzloZTU1QlRhQXgyOGlpV3RKMDB6RWVHekk1?=
 =?utf-8?B?aFFHWDBCVXRlRExCb3JOY1pZUjFuOS9sRXpDbmNvWVhjeDZxYUx0S3ZKWlNJ?=
 =?utf-8?B?T1FlQ28yZExVcjMva3VGVVBXUjgrV2Fmc3lrb2M2UmFUNWw0TGJwclpJdFg0?=
 =?utf-8?B?TThZUzJFVTQ0dklWLzRoWWZlRTBYN2VpdEg0SzZmZHVMMktlRVlPREFSMkVW?=
 =?utf-8?B?RTRRM2FuT1JPOGpRaHR1dytrdk96WUlyR2trUWMzWmwwMlc2clFhT093b2dQ?=
 =?utf-8?Q?NSlfEZD6neZBc1qSkZjqGjFxoZzFsVrN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR03MB6037.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDdycnVjanB1ejZQelUyU3lpSDJXWW1Qb2VDRm40Ri9sb2xLUlp1NEJXeFlL?=
 =?utf-8?B?NGo0T0R2akpsNmFYdVhsZjhraVJpbUhnVjNZMDQxUVU0SjIweitLUkZiK01x?=
 =?utf-8?B?aFREU2xEMG1NWkp3RWlyT3l3V2VhN0VHSjhRZEpNM1h1bkxHYnFxY3BFOURh?=
 =?utf-8?B?RmRSeFYweXA3TUwwOGlWU2N4NnNOYUJuZzRwczdWc3VrWjhVYkxvTzJ1YWE3?=
 =?utf-8?B?WTA0ODhRS0JsbTFuSEJkcGZzY1RacjNxVTRxSERabjZNVDNjZWNHbFBFM1RK?=
 =?utf-8?B?MWlZU0R2QkdIOUducU5QOHBtdkg0TVd6aFRCTG9lZStvRmVycVZWandma2lv?=
 =?utf-8?B?YnV6L2plOFNjZ1AwbVVSc3JXQzZlVkxMcDdCdVI5SU84eWdvMGh6OTR2dzdu?=
 =?utf-8?B?WDFxNVUxZDRkMUJvRm1IZzdhdXFnQU9Xa0grZnFCa2pyNjA3YUNKdlkwZHVJ?=
 =?utf-8?B?Wm5nTW1hK1hqUm9ZeXlheWczeDFXbUcwWG94Z1U3SmtwaUhWVVlFcTlGTHBP?=
 =?utf-8?B?TWhXUnpNMzNkclhaS0dlQ3pSUktyUDc4V0szTVYwQzh4SmcyenIyWlNQRnBh?=
 =?utf-8?B?QzgvcW5SVFZRdkhZNkMyZnI0R0xTVmc1dW5OS3N0UFp5cGljNUJMdUU5SlFO?=
 =?utf-8?B?V214Q0dTeHpyMGkvVjRpMVluWmhzZDBBakZFT2lkckltWm0vdmxtY3ZCcnlW?=
 =?utf-8?B?eGpFRXFLenNQSDNSZ1hnVk41SEFENEpOZTMvZXlTckovSk8xZ21MNlgvK2JP?=
 =?utf-8?B?bUg3eS9kQzVwSUhOV0lNeHNqeC9FZTI0dzFYRVh3K3l0L0RUR3NsV3ExaUd1?=
 =?utf-8?B?eUV0d0RhM2locGtSWThaNTdTeHZCVHkxYklLTkkwTDA3bXlSTFgvcS9qQ2RF?=
 =?utf-8?B?a21YZGkvdVh0NGtyc3pneVY0VHRvcWdCNUlGRmRxTGRHSGp4YkZtNTlFbmxa?=
 =?utf-8?B?bjRObGRmbUFIRXZSbVAxQ2FxMkNXWjJGbFVnbFR6UVBHb0hMOU1sNXMvblFJ?=
 =?utf-8?B?STg0NHJKUGtEdDN2bFlMVStqVWQwSVJYSmhTaHRBZkxOdE5UcmNwZ0dDU01R?=
 =?utf-8?B?ZUhVbE42L3RwcU82aEQ0MG0wYko2dkhxSWV1T2tWY2RLZHVyMStzcFB0QS9U?=
 =?utf-8?B?VVJPZnlYK0tGaW1QbWcxWmVqbGxUM0tmUDdJYUVESGw2dmU1YlozUjVVOU1R?=
 =?utf-8?B?b3BPNHNnaSs5aEJxbEduYnI1RXdmcVB5dWdnV3kybXZWVkNXV3AwYkhReTEr?=
 =?utf-8?B?b0xETlJIKzd0d01VYm9tWUpwbWVWVURwMGp2YW5vT21HMElzNHV4eDREUHJX?=
 =?utf-8?B?Y1MvMy9VUjE1YnA1U05ZN3FMZE9UYnJyL05PeXowL2FuTnoxMnRNbkx5UEN0?=
 =?utf-8?B?MXJoKzFEQ3dmRUxJUFhBOVRQdnlhQ3RZRktuLys0V3ZjMEl6Sis2dDM5Qndo?=
 =?utf-8?B?SVBzWG9OaHZMUmttQ0JaU1JOeXJkV01LU3R6d0JieWxQNjRFVDQwQzRJT21r?=
 =?utf-8?B?N1VHd2RuUHp6ZnF6dHA4azYvSEZUejZDN1BVUndQWURDVDhDOG5JU2cxZ2RX?=
 =?utf-8?B?bmhNQ0FhY01aRTM0aERPQzZQY2FITVJMaFZjU0svSVdiaGhPSzd2c0phRUEz?=
 =?utf-8?B?ZzlzaUM0SmNrSGVMSm4zUFNtaDZ0U2VlVnJWc2cwNXAxT0dxMzc0SUhUMi9k?=
 =?utf-8?B?MHNlUkhCVXlpd0hJSC95b1p0czd2cWx2WEF4bVphckRoNEF3VVNKcFE2Y3dK?=
 =?utf-8?B?L0F0cmc2TEZxcWI0eUU5NUVUTE9NQkRNcE9uQ1JJSTJtZ2ZHb0tHd3MwOGhq?=
 =?utf-8?B?Z0VHZDIvblpYSThCLyswb28yK2pvWFB2bWl6cDNVYWxXa0E1MnZLOGxmQTZ2?=
 =?utf-8?B?R2Z3NlNGQUpkcXlYNkhqRHFINWcvT2c5OFVCdlBPeXdHWU5GZzZlS0VPaDhk?=
 =?utf-8?B?YVFGUWQxTFhiblpWTnh6NnF1ejM2QVR2bEdONzJwQ01hVDFXR2xvZ2FjVkN6?=
 =?utf-8?B?QU9aSFpzclU4R2cwS2ZEdnY5U21BNlVNVS9ybElQRUdQbVZRZzlBdjdtTG5u?=
 =?utf-8?B?cmdEVG5pYk5za0lyTE9PNzlDTGVsY2IrVnJMVlRFUm5KRFBscnV5ejVyOWM4?=
 =?utf-8?B?UXZWaGNCMFRvNndxcHF1eWh3LzNiVVJVSkllV0IxNjNuZytzbVRORXEvK1No?=
 =?utf-8?B?R3hvVFFoTkdHUEdrdVkybitLbm1oeGthTE9LRVdmdktVQ2hUaXNvTUNLMWhq?=
 =?utf-8?Q?zh+EhAkAQCQQ3eyfq+2pf/Zbyf3NC+pX8Tt/3GBmCY=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4c49e8-ac75-40d2-b438-08de136d10df
X-MS-Exchange-CrossTenant-AuthSource: BL1PR03MB6037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 02:20:29.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQLnCoBjPF/G4PteO3h1c1HrCQsMqdA8WUUrebT//zIMqRURqfunn6Afl6jh8Zh3WDT+vId33YCDzwoD5iQiaJwY2dZohrQd+cutBYcDvcFuD5MLD5V5MGvvKNqonEvy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_192035_029369_2CBD2088 
X-CRM114-Status: GOOD (  14.49  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyNC8xMC8yMDI1IDc6MTYgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGksCj4gCj4+
ICsJaWYgKG5hbmRfaW50ZXJmYWNlX2lzX3Nkcihjb25mKSkgewo+PiArCQljb25zdCBzdHJ1Y3Qg
bmFuZF9zZHJfdGltaW5ncyAqc2RyID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY29uZik7Cj4+ICsK
Pj4gKwkJaWYgKElTX0VSUihzZHIpKQo+PiArCQkJcmV0dXJuIFBUUl9FUlIoc2RyKTsKPj4gKwo+
PiArCQlyZXQgPSBjYWRlbmNlX25hbmRfc2V0dXBfc2RyX2ludGVyZmFjZShjaGlwLCBzZHIpOwo+
PiArCX0gZWxzZSB7Cj4+ICsJCWlmIChjaGlwbnIgPCAwKQo+PiArCQkJcmV0dXJuIHJldDsKPiAK
PiBJIHN0aWxsIHRoaW5rIHRoaXMgaXMgaW5jb3JyZWN0LiBUaGUgY2hpcG5yIHZhbHVlIHNoYWxs
IG5vdCBiZSB0cmVhdGVkCj4gZGlmZmVyZW50bHkgZnJvbSB0aGUgU0RSIHBhdGguCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCllvdSBhcmUgcmlnaHQg4oCUIHRoZSBjaGlwbnIgY2hlY2sgc2hvdWxk
IGJlIGNvbW1vbiwgaXJyZXNwZWN0aXZlIG9mIFNEUiAKb3IgTlZERFIuCgpKdXN0IHRvIHNoYXJl
IHNvbWUgYmFja2dyb3VuZCBvbiB3aHkgSSBpbml0aWFsbHkgYWRkZWQgdGhlIGNoZWNrIG9ubHkg
CmZvciBOVkREUjoKV2hpbGUgZW5hYmxpbmcgTlZERFIgc3VwcG9ydCwgSSBub3RpY2VkIHRoYXQg
dGhlIHNldHVwX2ludGVyZmFjZSgpIApjYWxsYmFjayBpcyBpbnZva2VkIG9uY2Ugd2l0aCBjaGlw
bnIgPSAwIGZvciBTRFIsIGJ1dCB0d2ljZSBmb3IgTlZERFIg4oCUIApmaXJzdCB3aXRoIGNoaXBu
ciA9IC0xIChOQU5EX0RBVEFfSUZBQ0VfQ0hFQ0tfT05MWSkgYW5kIHRoZW4gd2l0aCBjaGlwbnIg
Cj0gMC4KQmVjYXVzZSBvZiB0aGlzIGRpZmZlcmVuY2UsIEkgYWRkZWQgdGhlIGNoZWNrIG9ubHkg
Zm9yIHRoZSBOVkREUiBwYXRoLgoKQWZ0ZXIgeW91ciBjb21tZW50LCBJIHJlY2hlY2tlZCB0aGUg
TkFORCBmcmFtZXdvcmsgYW5kIHJlYWxpemVkIHRoYXQgdGhlIApiZWhhdmlvciBJIG9ic2VydmVk
IG9jY3VycyBiZWNhdXNlIE5BTkQgZmxhc2ggb24gbXkgYm9hcmQgc3VwcG9ydHMgTlZERFIgCmFu
ZCB0aGUgZnJhbWV3b3JrIGZpcnN0IGNoZWNrcyBmb3IgTlZERFIgbW9kZSwgZm9sbG93ZWQgYnkg
U0RSLgoKSWYgdGhlIGZsYXNoIHN1cHBvcnRzIG9ubHkgU0RSLCB0aGUgc2V0dXBfaW50ZXJmYWNl
KCkgY2FsbGJhY2sgd291bGQgCmFsc28gYmUgY2FsbGVkIHdpdGggY2hpcG5yID0gTkFORF9EQVRB
X0lGQUNFX0NIRUNLX09OTFkgZm9yIFNEUi4KCknigJlsbCBtb3ZlIHRoZSBjaGlwbnIgY2hlY2sg
YmVmb3JlIHRoZSBpZigpIGluIHRoZSB2MyBwYXRjaC4KClRoYW5rcywKTmlyYXYKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
