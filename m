Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B13C7EE2A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts+mmOEoqACTznEiPMM/SYRzJN+qbrDVZy5Jwbui0/I=; b=x8pHoRePQrGBMGUZGY10H+30gN
	8tTiQ9IA/Z9DqGTC7kalThHW+K5zHYHRFnffTnQo7+mlX93KM/W7eDgei6drhIySEyfP4r9p9Ie3h
	gGEKY2Hcpja5PHP2Yjy2iwpng01O8heRC+rTpl9KU3z3zk9isvbPNJWSMwd5+D7ZI3xehmhK1ddnC
	C+tWYGkWguZ4gzk3EOhIfgC1y5OWVxNyLlgzey8TapnUaXmIJYqb0s4l1cCIiRgnOEdvLBSq2k9nU
	ihuzxr2rra04sbIrfAsAGn+BKeLGnfGrWN9jChEDMzhyIB1Qyr+ikGpUNQiyRs22H5h999WOVF3NS
	9MRUeopQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6AIV-00FcX6-13;
	Mon, 05 Jun 2023 13:30:59 +0000
Received: from mail-psaapc01on20729.outbound.protection.outlook.com ([2a01:111:f400:feae::729] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6AIS-00FcUw-08;
	Mon, 05 Jun 2023 13:30:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb/Fw1qYqJ7/BWBBr1BiEvwYPfvzc5z4AN7AXZ0Me1D+HI3hYXVwrr7D7FoKftSx/5krSfkRDoP89gDJdSdyanyq2Us5Qf+Uf7CPiBj6VTHiWeoG1bHEiLQQiYPVnq9BHA7jBmovT53p5OoebyQEAl4KPWZKrFYYx7B7uv9KL9KsgGYERjRPzT3BlvjjQIDxc8xVXcsm7Niv66aLR4bfBSkZEJ4a8opivT9K0lKR3z3sP6/nJfn4UnjLuFo1uDCg5pRrM8PYk5UrLZBlsI9/FLXk+MgOQziFSmr4Onqm9+OMbM7LdpuP9NOBECS1Hq/AiuPj/bFS54UIdqQnTp2yxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AOf8Mi5+6XHmr+qXMtay8Qr5ZKz3w93LDE/dk8pGVI=;
 b=YoSAKTjqsr4P5mlTIMviRD14PBOjrCo8sihrf6q7yxEFAw2xmp4A6n4FmXoO0YhAvgkBKvp7oCUP1YuyHJ/1809JxgtHQaJkG0OCijfKh6YjpTzPwcklmajiLYDj46N3GxFOwYTXLeWTI+hfxRrn/ASVYmvLUtO257nN0NoifVjQ3MyJRG/XaruMnL2gMjEBRikdsrC+YeBeQsNMYRp0RuWlQs/zeJYtvzqC3DD0nCwLIOJuebitTLWO+5q7U1TDz7BJbtOmPio7FugvfzdYo16yslS3gmzrt2EFfrdI6XrzC7ktN4CdCwXrqHpEsZpnpwRRMzdwW7/088QjMte/3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AOf8Mi5+6XHmr+qXMtay8Qr5ZKz3w93LDE/dk8pGVI=;
 b=GRsM1EwKXYenixBFt+tImkxogsUclVvvqTfSXhJwlcsVitWnAcblkPo+4q7UUfoPCSiT/wCenwML4YSiCBXxwjZ0V3Qwa/VLg/L5d1Tz3hHnGJ7oqlxm4f7WQ10JSRBLopIQ28QQ+GhsVfVFo2QshejSZEXaX2bBBOTZhuPpAluZwgg5Jy1nXKGiO5oqW9/7WlB9xRFL0YIMcLd1ERmgnuNVZ0hOeFpBogKM588TMvvvmjQ+CbaY4iaITQkLeCAmF4roCJ7HwdUheet2LE9hYlO2BqcWImmHrPgk/SqUfb+6eT0hXC1PUkiaG1YSxS/P7vJ4HyzOdtY0c3AqncK4vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com (2603:1096:990:9::6) by
 TYZPR03MB5584.apcprd03.prod.outlook.com (2603:1096:400:57::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Mon, 5 Jun 2023 13:30:46 +0000
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a]) by JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a%5]) with mapi id 15.20.6455.028; Mon, 5 Jun 2023
 13:30:46 +0000
Message-ID: <163e0684-caff-77d0-1eaf-9a58290c200d@amlogic.com>
Date: Mon, 5 Jun 2023 21:30:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [RFC PATCH v5 2/6] mtd: rawnand: meson: wait for command in
 polling mode
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601061850.3907800-1-AVKrasnov@sberdevices.ru>
 <20230601061850.3907800-3-AVKrasnov@sberdevices.ru>
 <20230601100751.41c3ff0b@xps-13>
 <9e106d50-2524-c999-48b1-a20760238aaf@sberdevices.ru>
 <20230605110546.6cb00a8d@xps-13>
 <2a755783-1d56-9842-2eee-b5ab41152c81@amlogic.com>
In-Reply-To: <2a755783-1d56-9842-2eee-b5ab41152c81@amlogic.com>
X-ClientProxiedBy: TYWP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::20) To JH0PR03MB7495.apcprd03.prod.outlook.com
 (2603:1096:990:9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7495:EE_|TYZPR03MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: 03bc3a8f-bfde-41db-e4ee-08db65c9116a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/0GAeuVmNYFbgR1z8RfzXveDdjR2AzQSSf0jnRPmadXKeo71K+Ji1rKhEPSKYFash0F3l1XN7/vrGi8mZJugXlP8tIQqcOIIdID/8GqnXR1UlQDVFa8eArgZQUmkMwee82O65nlWKT2aSl/OgEsikTJKp23TuODmR5Bm13IueLQcYVdmax5L969M/2CxymqcNZC29uJb88EySBC7yhaMOm5+OL/n5e7S/Xd0sNq2R7RUwboa80BQjgFgpMZqsauIoVNFpcs6D0+936Dajwr9MzO7gs1rtBADrAYmgwwA3Nvu89TkvnWX/aqWxNsBvNr88i+RGWJ2+xKYgVXd8pqyq604uwgDWsQ2Nb3GpMlaI6grsS1Ik/ftd07JgVEpaiUwlxOX1dg7M7wf8O+DdT9o74MBX0mN7VKHA1d4XQzRW/4zEvXAzqTNAji8xQM3T4o6QZnIYBZUB9ODF7s23LG6AAwW5acI6LYpkjC8r2D2+iArkDR26sHPt4LTJ39yF3zZhc7fsA4eLgEaXf8AfPmMGq29TJvSSqWFc/rWHQppeIffbt28OBsFQk2OtRGTfd9n9HF0ql/2+ClXwcYtuEGKMiItkU7eBgTTnYRfS6c8R+cAkIlT1JiDvTCkxEMPvmZBHRYQCOTW5HaLyJQ+37VIDzBLCFf92kQCjJcRxtkyG4B7CPqG4aAY1ZAppjFM7jR5XdA063+B+m0tuLLTmLnDfcJPG3wOHwVb1h4rvD03c8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7495.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199021)(54906003)(110136005)(478600001)(8936002)(8676002)(5660300002)(44832011)(7416002)(36756003)(2906002)(31696002)(86362001)(4326008)(66476007)(66556008)(316002)(66946007)(38100700002)(38350700002)(41300700001)(2616005)(53546011)(6512007)(6506007)(26005)(186003)(66574015)(83380400001)(6486002)(52116002)(31686004)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STJRNXc4TXpFMU1WSStQZVVrZDRDV2MwK2tyNGpRWUJZcFM1Mm9kQTRuclJ4?=
 =?utf-8?B?QjVBYjJiejBwYmpmaHdtdHkxMnhvdGh0ajQ4WGNEc0s1RkJWeENHWmFCeUpa?=
 =?utf-8?B?VlpVSFh0VmlqNU5TT3Vqa2pRSlhGekE1WDJKZjk5WHd2RG9MdER6RWUvY29Q?=
 =?utf-8?B?bWVJdkhSbm11MGdiSjREeG9ud1JpS1J0Qm5IeDRFL3JSd09JS1IxTzVVbk9D?=
 =?utf-8?B?bnU0VmgzRGd1SCtmeVV4N0dxNldkNW5heGFnTGZnY3M0OXpYK2ozcTRkVVhG?=
 =?utf-8?B?cEFkZFNFSkN4dHlNYmdMSG4wTjU4QWxLTmp6WFEyWGxvV25KTmVKd3ZwQVUv?=
 =?utf-8?B?eEVHYkd5RWt5QXRlUUhzZm8xMlN1NjhTeWpoQWVXUDFZQUNianVYeCtaejVH?=
 =?utf-8?B?RzJQWmxVV0w0MVZXNDd3UU9rTjRsNzArUVkwcFNqUHprRkhFdjZCQVk5VWZq?=
 =?utf-8?B?SlRJVTFaZ0E5UUFBQXRYTGlzQ2hOODVuMkM4QmVGQWQrL21YS0FyTHZHSzN1?=
 =?utf-8?B?ckxETldDRWhJOUFiWUhsbDd3MVM3cUwydmFtMjkzSVBYemhBU05Bd3hYcW91?=
 =?utf-8?B?N2ZqSVVNaWwwYVk0c0Nsa1AxaTN0ZUN6L2RkTjI5TjE0VGtuQlg0dEYwTGVj?=
 =?utf-8?B?WGRqaEpxSEg3RTJ5cmVxMHZrV0tQb281a1pHWTZKSFppZzZ0SHpVUmNIZllK?=
 =?utf-8?B?R3d5YjdCYTZGR3pPNmpLU0ZlcVZsbmh0dnA1Nyt3RWxWOFovMVN1ZXc2Q0Za?=
 =?utf-8?B?MHJrVUE2RlFXbkpXV05SMUVlSTVFY1hIZE5GY3JuUmpkN2VvUEF4NktQcnEx?=
 =?utf-8?B?cTNVRXpjMGJXeTRPRFB2dkpwdmVGck52UlIwcFVlWnc3ODFCTUh6Nk8zRlFU?=
 =?utf-8?B?VlhhSEZGdk8yQThybXBOMnQ1Y1ZreFRvYzBlN2tmRHkxNDd5VXZaQ3lXamo0?=
 =?utf-8?B?Znh5SUx1elB2WGk3V0xiNVd2TGw0QytiM3NGQkpTL0ZxZ3cyU3lGM0F0cjRY?=
 =?utf-8?B?dVJEUVUxK1VWZjNsRlIxZTg2KzBVM3pnQ0FEaThnVmdvZ3Z1ZkZxVmZ1YUFk?=
 =?utf-8?B?T3gxZHlOdElPRkJObDdxZWsxa1RXSE1GMTFNbGxxSzBLUEw1L0VPMXN1c1d0?=
 =?utf-8?B?ZWxzUGR6VE9GZ20xNUV2cGV0RlhMR1hOV3V2VkJESEpuZmZJVVJLWUc4RFQx?=
 =?utf-8?B?OXdhaE5Kd2lSWGlzbVFJS3N6M0syM2F0Q1ZJTXFnNGZCSmZmYTE4TlRlQlZW?=
 =?utf-8?B?L3I4UXFXbmtmU1o3aE16TnR0RGgyNm1ReGZFdEMzaUdyUmdtVUxRTlZaU0pD?=
 =?utf-8?B?MFQwQklFK3hZTWZ3dlJwbDh1N05mN1Axa3NPR3ptYWluTVlXOEdVSVJ2NnZz?=
 =?utf-8?B?WS9GNHA4WXM0bS9hUGprMWh5VnJmV3lGYVpBZEVZT1YxdjA5S1FWblJ6U3Fn?=
 =?utf-8?B?aG9yd1FWWkplanRQWCtSOHJHNkUvSmNrbHh2SEQ2WWU2V21sanZkVjg0amRX?=
 =?utf-8?B?YUsrRDZlenExcUFsT2FTSWpFWWVGUEtDcFJudmFSOUpEZDd4ajJ5TnhCRmQr?=
 =?utf-8?B?NDY1QWg4MC9lcmZnVEJOSzN1S1Fyd2E0TmZjVEhHYXU2UVJJb0p3ejRjbUJa?=
 =?utf-8?B?VkR5dG9sbDQzZUZVL0MwditmZGdSTHRncXV0MmJRdmFId2tsVW9FU0JFaEFo?=
 =?utf-8?B?Qk5QS2F2LytLMHVCcElYOWZHcU9mYW4xam5YSGVobC94ME9tTFF1V3hjd3Rh?=
 =?utf-8?B?TlQxb1RmN3d2WjJDMElEWW5oTWdPTG95UDVuOHgzUW1INGtqY3dKejhUK1gr?=
 =?utf-8?B?NWR2dUtld3crNHUranFWVGFhaG1DdmNLNFdYVXRDd21WL0IyaSsyL0ZOeG1I?=
 =?utf-8?B?QW5QMUFQNHJzZEhUY3hORDZucitTOHljejVoSm85TmhHeGh3RVB1Ty9vb0ZJ?=
 =?utf-8?B?alNOVDdrNkxOdjlHdU4xUDNVeDZMU0hxYU9EZkZsbllVNVk0MnUvRnVqdTlV?=
 =?utf-8?B?cWJQcXRUQTNxUUtZS1JNL25OMnR0ejdyNVlqY1dRaTJaZThzOEExd0w3VHhy?=
 =?utf-8?B?SzFiQjhIbXpzUGUvNGxNd0VTMWZFYUVSMHVrRFZQU0o3MWtWYW41elFCWU1r?=
 =?utf-8?Q?Z3lOuQlP2Kr0UTcznmuhyhNG/?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bc3a8f-bfde-41db-e4ee-08db65c9116a
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7495.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 13:30:45.9758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1t+ur1cjnv5FJxweQrYRGlQjbc37PQTqcLLMoQVt5ylUrEU7Ine2+bJ2n6GSomk3oxo8fvZygKg4b46tlaleA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_063056_083770_63C6B9F2 
X-CRM114-Status: GOOD (  29.28  )
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

CgpPbiAyMDIzLzYvNSAyMToxOSwgTGlhbmcgWWFuZyB3cm90ZToKPiBIaSBNaXF1ZWwgYW5kIEFy
c2VuaXksCj4gCj4gCj4gT24gMjAyMy82LzUgMTc6MDUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+
IFsgRVhURVJOQUwgRU1BSUwgXQo+Pgo+PiBIaSBBcnNlbml5LAo+Pgo+Pj4+PiBAQCAtMTQxMiw2
ICsxNDE5LDggQEAgc3RhdGljIGludCBtZXNvbl9uZmNfcHJvYmUoc3RydWN0IAo+Pj4+PiBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJl
dDsKPj4+Pj4gwqDCoMKgIH0KPj4+Pj4KPj4+Pj4gK8KgIG5mYy0+dXNlX3BvbGxpbmcgPSBvZl9w
cm9wZXJ0eV9yZWFkX2Jvb2woZGV2LT5vZl9ub2RlLCAicG9sbGluZyIpOwo+Pj4+Cj4+Pj4gVGhp
cyBpcyBhIHByb2JsZW0uIFlvdSBjYW5ub3QgYWRkIGEgcG9sbGluZyBwcm9wZXJ0eSBsaWtlIHRo
YXQuCj4+Pj4KPj4+PiBUaGVyZSBpcyBhbHJlYWR5IGEgbmFuZC1yYiBwcm9wZXJ0eSB3aGljaCBp
cyBzdXBwb3NlZCB0byBjYXJyeSBob3cgYXJlCj4+Pj4gd2lyZWQgdGhlIFJCIGxpbmVzLiBJIGRv
bid0IHNlZSBhbnkgaW4tdHJlZSB1c2VycyBvZiB0aGUgY29tcGF0aWJsZXMsIEkKPj4+PiBkb24n
dCBrbm93IGhvdyBhY2NlcHRhYmxlIGl0IGlzIHRvIGNvbnNpZGVyIHVzaW5nIHNvZnQgZmFsbGJh
Y2sgd2hlbgo+Pj4+IHRoaXMgcHJvcGVydHkgaXMgbWlzc2luZywgb3RoZXJ3aXNlIHRha2UgdGhl
IHZhbHVlcyBvZiB0aGUgcmIgbGluZXMKPj4+PiBwcm92aWRlZCBpbiB0aGUgRFQgYW5kIHVzZXIg
aGFyZHdhcmUgY29udHJvbCwgYnV0IEkgd291bGQgZGVmaW5pdGVseQo+Pj4+IHByZWZlciB0aGF0
Lgo+Pj4KPj4+IEkgc2VlLiBTbyBpIG5lZWQgdG8gaW1wbGVtZW50IHByb2Nlc3Npbmcgb2YgdGhp
cyBwcm9wZXJ0eSBoZXJlPyBBbmQgCj4+PiBpZiBpdAo+Pj4gaXMgbWlzc2VkIC0+IHVzZSBzb2Z0
d2FyZSB3YWl0aW5nLiBJIHRoaW5rIGludGVyZXN0aW5nIHRoaW5nIHdpbGwgYmUgCj4+PiB0aGF0
Ogo+Pj4KPj4+IDEpIEV2ZW4gd2l0aCBzdXBwb3J0IG9mIHRoaXMgcHJvcGVydHkgaGVyZSwgSSBy
ZWFsbHkgZG9uJ3Qga25vdyBob3cgCj4+PiB0byBwYXNzCj4+PiDCoMKgwqAgUkIgdmFsdWVzIHRv
IHRoaXMgY29udHJvbGxlciAtIEkganVzdCBoYXZlIGRlZmluZSBmb3IgUkIgY29tbWFuZCAKPj4+
IGFuZCB0aGF0J3MKPj4+IMKgwqDCoCBpdC4gSSBmb3VuZCB0aGF0IHRoaXMgcHJvcGVydHkgaXMg
YW4gYXJyYXkgb2YgdTMyIC0gSUlVQyBlYWNoIAo+Pj4gZWxlbWVudCBpcwo+Pj4gwqDCoMKgIFJC
IHBpbiBwZXIgY2hpcC4gTWF5IGJlIGkgbmVlZCB0byBkaXZlIGludG8gdGhlIG9sZCB2ZW5kb3In
cyAKPj4+IGRyaXZlciB0byBmaW5kCj4+PiDCoMKgwqAgaG93IHRvIHVzZSBSQiB2YWx1ZXMgKGFs
dGhvdWdoIHRoaXMgZHJpdmVyIHVzZXMgc29mdHdhcmUgd2FpdGluZyAKPj4+IHNvIEknbSBub3QK
Pj4+IMKgwqDCoCBzdXJlIHRoYXQgSSdsbCBmaW5kIHNvbWV0aGluZyBpbiBpdCkuCj4+Cj4+IExp
YW5nLCBjYW4geW91IHBsZWFzZSBnaXZlIHVzZSB0aGUgcmVsZXZhbnQgaW5mb3JtYXRpb24gaGVy
ZT8gSG93IGRvIHdlCj4+IHRhcmdldCBSQjAgYW5kIFJCMT8gSXQgc2VlbXMgbGlrZSB5b3UgdXNl
IHRoZSBDUyBhcyBvbmx5IGluZm9ybWF0aW9uCj4+IGxpa2UgaWYgdGhlIFJCIGxpbmVzIHdoZXJl
IGhhcmR3aXJlZCBpbnRlcm5hbGx5IHRvIGEgQ1MuIENhbiB3ZSBpbnZlcnQKPj4gdGhlIGxpbmVz
IHdpdGggYSBzcGVjaWZpYyBjb25maWd1cmF0aW9uPwo+IAo+IENvbnRyb2xsb3IgaGFzIG9ubHkg
b25lIGV4dGVybmFsIFJCIHBpbm11eCAoTkFORF9SQjApLiBhbGwgdGhlIFJCIHBpbnMKPiBvZiBk
aWZmZXJlbnQgQ0VzIG5lZWQgdG8gYmUgYm91bmQgaW50byBvbmUgd2lyZSBhbmQgY29ubmVjdCB3
aXRoCj4gTkFORF9SQjAgaWYgd2FudCB0byB1c2UgY29udHJvbGxlciBwb2xsaW5nIHJiLiB0aGUg
Y3VycmVudCBvcGVyYXRpbmcKPiBDRSBvZiBOQU5EIGlzIGRlY2lkZWQgdG8gImNoaXBfc2VsZWN0
Iiwgb2YgY291cnNlIGNvbnRyb2xsZXIgaW50ZXJuYWxseSAKPiBoYXMgZGlmZmVyZW50IG5mYyBj
b21tYW5kcyB0byByZWdjb25pemUgd2hpY2ggQ2UncyBSQiBzaWduYWwgaXMgcG9sbGluZy4KPiAK
PiA8Jm5hbmRfcGlucz4gaW4gZHRzL3lhbWwgc2hvdWxkIGluY2x1ZGUgdGhlIE5BTkRfUkIwIGlm
IGhhcmR3YXJlIAo+IGNvbm5lY3RzLCBvciB1c2Ugc29mdHdhcmUgcG9sbGluZyBoZXJlLgo+IAo+
IEBBcnNlbml5LCBzb3JyeSwgaSBkb24ndCB0cmF2ZWwgYWxsIHRoZSBpbmZvcm1hdGlvbnMgeWV0
LiBidXQgd2h5IGRvbid0IAo+IHlvdSB1c2UgdGhlIG5ldyBSQl9JTlQgY29tbWFuZCB3aXRoIGly
cSB0aGF0IGkgcHJvdmlkZWQgaW4gYW5vdGhlciAKPiB0aHJlYWQuIHRoZSBuZXcgUkJfSU5UIGNv
bW1hbmQgZG9lc24ndCBkZXBlbmQgb24gdGhlIHBoeXNpY2FsIFJCIHdpcmVzLCAKPiBpdCBhbHNv
IHNlbmQgdGhlIFJFQUQgc3RhdHVzIGNvbW1hbmQoMHg3MCkgYW5kIHdhaXQgZm9yIHRoZSBpcnEg
d2FrZSB1cCAKPiBjb21wbGV0aW9uLgoKVXNlICJuYW5kLXJiIiBpbiBkdHMgdG8gZGVjaWRlIG9s
ZCBSQl9JTlQocGh5c2ljYWwgUkIgd2lyZXMgaXMgbmVlZGVkKSAKb3IgbmV3IFJCX0lOVChubyBw
aHlzaWNhbCBSQiB3aXJlcykuIHRoZSBuZXcgUkJfSU5UIGNvbW1hbmQgZGVjaWRlcyB0aGUgClJC
MCBvciBSQjEgYnkgdGhlIHByZXZpb3VzIGNvbW1hbmQgd2l0aCBjZSBhcmdzLgoKPiAKPj4gQXJz
ZW5peSwgaWYgdGhlIGFuc3dlciB0byBteSBhYm92ZSBxdWVzdGlvbiBpcyBubywgdGhlbiB5b3Ug
c2hvdWxkCj4+IGV4cGVjdCB0aGUgbmFuZC1yYiBhbmQgcmVnIGFycmF5cyB0byBiZSBpZGVudGlj
YWwuIElmIHRoZXkgYXJlIG5vdCwKPj4gdGhlbiB5b3UgY2FuIHJldHVybiAtRUlOVkFMLgo+Pgo+
PiBJZiB0aGUgbmFuZC1yYiBwcm9wZXJ0eSBpcyBtaXNzaW5nLCB0aGVuIGZhbGxiYWNrIHRvIHNv
ZnR3YXJlIHdhaXQuCj4+Cj4+PiAyKSBJIGNhbid0IHRlc3QgUkIgbW9kZSAtIEkgZG9uJ3QgaGF2
ZSBzdWNoIGRldmljZSA6KAo+Pj4KPj4+IEFsc28gZm9yIGV4YW1wbGUgaW4gYXJhc2FuLW5hbmQt
Y29udHJvbGxlci5jIHBhcnNlZCAnbmFuZC1yYicgdmFsdWVzIAo+Pj4gYXJlIHVzZWQKPj4+IGlu
IGNvbnRyb2xsZXIgc3BlY2lmaWMgcmVnaXN0ZXIgZm9yIHdhaXRpbmcgKEkgZ3Vlc3MgTWVzb24g
Y29udHJvbGxlciAKPj4+IGhhcyBzb21ldGhpbmcKPj4+IGxpa2UgdGhhdCwgYnV0IEkgZG9uJ3Qg
aGF2ZSBkb2MpLiBXaGlsZSBpbiBtYXJ2ZWxsX25hbmQuYyBpdCBsb29rcyAKPj4+IGxpa2UgdGhh
dCB0aGV5IHBhcnNlCj4+PiAnbmFuZC1yYicgcHJvcGVydHksIGJ1dCBuZXZlciB1c2UgaXQuCj4+
Cj4+IFllcywgdGhlIGxvZ2ljIGFyb3VuZCB0aGUgc2Vjb25kIFJCIGxpbmUgKHRha2luZyBjYXJl
IG9mIENTMS9DUzMpIGlzCj4+IHNsaWdodGx5IGJyb2tlbiBvciBhdCBsZWFzdCBiYWRseSBkb2N1
bWVudGVkLCBhbmQgdGh1cyBzaG91bGQgbm90IGJlCj4+IHVzZWQuCj4+Cj4+Pj4gSW4gYW55IGNh
c2UgeW91J2xsIG5lZWQgYSBkdC1iaW5kaW5nIHVwZGF0ZSB3aGljaCBtdXN0IGJlIGFja2VkIGJ5
Cj4+Pj4gZHQtYmluZGluZyBtYWludGFpbmVycy4KPj4+Cj4+PiBZb3UgbWVhbiB0byBhZGQgdGhp
cyBwcm9wZXJ0eSBkZXNjIHRvIAo+Pj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9hbWxvZ2ljLG1lc29uLW5hbmQueWFtbCA/Cj4+Cj4+IFllcy4gSW4gYSBkZWRpY2F0ZWQg
cGF0Y2guIFNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXM6Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgwqAg
bmFuZC1yYjogdHJ1ZQo+Pgo+PiBpbnNpZGUgdGhlIG5hbmQgY2hpcCBvYmplY3Qgc2hvdWxkIGJl
IGZpbmUuIEFuZCBmbGFnIHRoZSBjaGFuZ2UgYXMgYQo+PiBmaXggYmVjYXVzZSB3ZSBzaG91bGQg
aGF2ZSB1c2VkIGFuZCBwYXJzZWQgdGhpcyBwcm9wZXJ0eSBzaW5jZSB0aGUKPj4gYmVnaW5uaW5n
Lgo+Pgo+PiBUaGFua3MsCj4+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
