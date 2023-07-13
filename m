Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFF7C001DC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 08:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6kpxyOiSXbLR5+I1Rfbm6hhjg8VBhstAgrR5FAYD9E=; b=Ho9vsHNxV7D6FBCP5f6aGktGFk
	FnK801qw2zNAzCa/tvltBIVgk672jhzJL/0roZ0Twg9aA52mDXjlP9oxKavzc1rdCq05P7xA97m6S
	alKwcVNhBhwINtqGc1XeUdP8ADqiJFPkfE+/9OllbdypO5C/T48RKYb62kq69NTab/Zbiw+tKRkmx
	WiyiAGLWiDKK8B5eQmtAOttK3FEiVz0WFwi5H60dN+wXZYybVEeRRKCtoaKxMYIiVZFq7zGBR0kLa
	ne2cyQKtNXmY0JOtgj9OatiwDox1KShYRhMpbibQkpZO6NozUlEj84uxwviMD6i+wRzZJm7aZ4jaA
	fIKDB+4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrTG-002PJr-2P;
	Thu, 13 Jul 2023 08:14:42 +0000
Received: from mail-psaapc01on20707.outbound.protection.outlook.com ([2a01:111:f400:feae::707] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrTD-002PIr-2d
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 08:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YQolX8qBKebZShbIt7oZQXWr5DhwmOFIof6zcrhw7cZ42TuWOU/bVO/aRjA/t6fPutMUm0MDmunUqSARBpho6yuRGVoGa/JGLWroy8TU3C6rp8qzsQ3DUn0JkkfgB9601WkFD5MniNDW68n7Ss4PuvogL/+JHY6+El22H4YDZye3CHZ0Pb0mCjh62lErypac5+OynoKZSYh9aWf78/Ysn/nCKmHBoZ6uwB8SkLM3GzYkMbPKx9XKqrf4eNUU+X3LU173PRb9ola8fe6mI3goRappd3OpWU7b/lIFjofz8JcE0sEc494Vft7TzPFcCYJbBpyyUpvHSYPAYHl8Se0+BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoj4WiEE3DwP8/N3bZM0fkuXe1WoGm3w9LsKLj1MqlU=;
 b=LnnOEdsLeL+Va8lF8axnc5UgBNvPReid3iwNpBPKhNhl8uwQ3tEAznpztgIcBbcoHcHa4W3z0xJHGCji9CQPt5yE/J+hEeOhihzIGIQcTo2+KjF13rVGTFJYKv5NMFZhdrDCL6cC6x6VJr+1URm84zdWQDZIqJnM36+rcZcKQjOwb5uJmmhxnDkc6OsDW/aNCU0cIF9wTeplG4OiEGOtCVgWj06jWMeh5C4R/HBwnY7jt4blK57H1LoEhN+jTNE7LQ9gZY34xXJ3Dt2c5jpO0/eftfKC5DhGrAuUcrsnyKj/SUderW2T9y9bf4xTNJp7kkeuopo+oduvX2Vh0nqZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoj4WiEE3DwP8/N3bZM0fkuXe1WoGm3w9LsKLj1MqlU=;
 b=q0KttmxNRCggk5F/Klx61ledPG1BCBbt2HEx1EXspfAXGYqTO34WN5YP+OsjkcZzuJBzfkw51hP7dZrP7GLW95qtVEpG+Rc1k75LziQ3XEAQn451sz4GXkvxLh+pXsTqo8e8jTVhD3N1McbQhU1xWxv3Pbs1zi2xL1AJ+uavQWJ0rOvqOkNZ0w3shBZxYeoMGLHCXVIkHPHH5k/RBLpKsCi+YNqqKZO72O+e3SKYtELz0uFo6PawMqrHVKrf0QhNHu3l6etnl42Ow7lakXHJkWYZfQTwfbmVGQLFbWaokooywdVNbKTKKhR/8OHEq1MlRoyomJFzvRSQ79VpYKbScg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6349.apcprd06.prod.outlook.com (2603:1096:101:10e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Thu, 13 Jul
 2023 08:14:33 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 08:14:32 +0000
Message-ID: <67103218-8f89-f4ac-81b7-0d5c54a59220@vivo.com>
Date: Thu, 13 Jul 2023 16:14:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 09/18] mtd: rawnand: davinci: Convert to
 devm_platform_ioremap_resource()
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230707040622.78174-1-frank.li@vivo.com>
 <20230707040622.78174-9-frank.li@vivo.com> <20230712140953.30b5309c@xps-13>
From: Yangtao Li <frank.li@vivo.com>
In-Reply-To: <20230712140953.30b5309c@xps-13>
X-ClientProxiedBy: SGXP274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::25)
 To SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e53f0a7-db94-476d-80e3-08db83793026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UBZH4l67znvCuq2EFMd/UgvYqZ+JvoQJXYg/hVs6NBtY8GaKgGpOxr8T/R9/F1407iIdZ1CLJCtBSBUtarS+JdUzFwDPbQx4jFVB5wvrxavwdWJAVh3PFsXnFA72A3gLmhXid2uoztii6BOJFWNaM8YR5EpYBZfhLxo8Y7AXCcn6rF27NQX7fVp6jfSJbl5BnnJwkTCCbPq0uhFnKxuIHS26sa3JtfJbQEXSV6uNxQOXJpwt536HtbMUaYAHAFlv1t3BUVHD42aceE5GlGlLyoWuPl3vgw7zy6kAPfxJR7TDBxU4PoeptRleoEMTScaewSkZsAAw7JHcqcpXHqfJfXuzCIBDvzr4OyI/L3InFrahcy4i1c0+eT0BCQ/X9uVcuK4KgcxUNe30o9Ngg0SMACC8fUTTrq3GTw9gM5k6EdtA1IfbeJ7JFYcfpZ7CIgv4KBZkig/hT7nmRXOa51Aa2f5HyAyCC4HMBMqdcIciCp4FKP3bPjReuxpm8XjhBGQFe/h+N/kexIDaowP62und420BLPHmxcXEpd3Zw4y/qSz9kusPFwYzfQtOu5FbUkKg4w+Jc1G1KBP328gMBwkNpVy10OsMtQepqcfZAaFFBz41MaOIPTcxmQ6SODFWb4HJC1zRRlp2kx2kCp3JWsrEfHdbuXJUCReyegWsoTKcKINr0aP6ilIyeKmAdTI60hmo
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(8936002)(8676002)(83380400001)(36756003)(38100700002)(2906002)(38350700002)(66574015)(2616005)(31696002)(86362001)(53546011)(26005)(5660300002)(6506007)(186003)(31686004)(6666004)(4326008)(6916009)(66476007)(6486002)(54906003)(66556008)(66946007)(41300700001)(6512007)(52116002)(316002)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmQ5bUJLQ3R6SEd1NmNMNXk4TDJKTVhlOGxGYm5XejNXOFFnQnNIRWU3STNV?=
 =?utf-8?B?QVVobWlwY2U1UHpOa0hRM09aRWZIVk9jNU9CTXVqMU03alc0YW8wcklxOWFB?=
 =?utf-8?B?WnR2Wk00V2tHbGVmQkg0cG1wa0MwV2VhR2VpeDVkdGI4MUFIUFRpZkNZY3Br?=
 =?utf-8?B?WkVVU1E1Wk1rSXdUUkZiZXlDdnFjQmxmV0xBcHJRcVh6SUJucUtNN2N3Y3l1?=
 =?utf-8?B?N3NyU2V2TFRQa1ArZm5pc1lFNFBSY0JIcklkNkZQR1RjV3VGMEhWV0NMQ3Jr?=
 =?utf-8?B?YkcyMFZXbUNuN29XNkoxSm1PRE85VlE0ajJWQjZ4TDd5WUd3aGJaamxyODBE?=
 =?utf-8?B?VnZQWkJxOGMrWkdPZEErVTErNEF0eitiQkRNa0FxaHJId2lXaTZ5cm5GUW15?=
 =?utf-8?B?VkFSUGhkOVFXbWIxRkxLeThNUFlYSzR5SHAvUW1TWW1CaVlWc2NJVTdGVDdR?=
 =?utf-8?B?SFMweVMvNlY3Y0ZxMktOazRDVkMyUEVDV1VPL1dVOStJZUlYV1JZUVdyRGlZ?=
 =?utf-8?B?WnNCYjNqK0kxNGxxaFhsY2JPWXBEWjJpU3NhUkxVMy9ucThxY1lBMll5ZVZC?=
 =?utf-8?B?WTE4SDdpMDhnekZhdE8wOHBFMGgwbnZmbmYwM2oxL1dxL3dqdUNUUVdxVFYy?=
 =?utf-8?B?QjFXRjdTTWkzT0FXMm5pK0dzdmVyd3M4Z3VpMDUyN05PblYrb3NBa3lGQURV?=
 =?utf-8?B?UWNKTlhldk5VeFo5b0huaFlTZDVKdjZkaGIrY0xkZFJjMHdESjJnWDNKYTVI?=
 =?utf-8?B?NnF1Rno1M0ZaUXNkb1ppd2k0bUk5Q2tZdHd6VHd1WVNueFg0VWpPR2IwU0ls?=
 =?utf-8?B?ZnB0b3czYkFyMjNZSVpwZTRYVTE3cWdwOFhydXRzRGdEQUhHOUdBczRxN1Nj?=
 =?utf-8?B?eDJ0alRHaTYzd1ArSWNTaytpUFJkNXg0cHhDVEdSdjFLVG9lWW5iS2U2OFdn?=
 =?utf-8?B?bko0aWtxa0x3TWRGdGdTNlA1eldQVWVsWUZ2L2NTa0RJQnZRMkU2L1p2T2FI?=
 =?utf-8?B?ajFMcVI5bCtzTDNSYkNFUFlZdlJ4bEovS3lZbDRHL1VlQjNoRlU3MHlMYzlv?=
 =?utf-8?B?WU01REI1TDhhSldSb3dGb1VOdHE0T1VwME1XY2NuSXVOTHhjS0F0RkhtUFA3?=
 =?utf-8?B?UHVsMmwzTDJHSHcwUEVEZE9xdEhsREEycFBQcVZENHExOXhXUjJJTTFoVnRi?=
 =?utf-8?B?UmFYTzVCSkF4SmxTRmJ2Y3E3Rm1CZXZ2MDR5L1BYdXpZL1dYSWk1R0dybFdn?=
 =?utf-8?B?WEVCYUNGanU0N0VUR1l6eEo0UXZ5RDd2T3RpUHE5K0JUNjhGVlhhK0VGdy9i?=
 =?utf-8?B?eGFEWGtBK29JbzZNUHh5K01kZHEvSytMZGhPQWtiK0NnV1dIM01LNERIb0dG?=
 =?utf-8?B?QjE1NGMzT3c4MGV1MDRybWtaSzYza1NGNTluQ3ByNmxTRkZLclBUS2lQUGo5?=
 =?utf-8?B?SFBFcU91RXBnT0F5WnVhdU00RkV2NTlzcy94ektiT1dNR212bjFxRFBBd213?=
 =?utf-8?B?SVBURmw2a1RLZFN3TlczK1A5R25yM08vdGFCUWg5ZDBLR2RMVXU2SHd2Yzll?=
 =?utf-8?B?QUM3eEQyWFdrc1ZVOU9xQVBMMW9saW52UERtL0dCSUpjOWJDb0dYVHQ3Q2FP?=
 =?utf-8?B?MmU4OGdXNCtPeUtZbXB1LzhPd2NBb3dUdEp6Tk5jWmNFN3hFTVNYc2d4bGRr?=
 =?utf-8?B?WCtXdjNia2M4cXpQalVhK0hYUE1PMGI2UEpyRkpvbFlYbTVRa084TVhDTmRY?=
 =?utf-8?B?bHZTME9nT3ZBSFk5VWdXRzIwWWVRckRSL0J3RXl5S3JPd0ZmZ0pZYjBDaXJU?=
 =?utf-8?B?UngwWWxaTjhQR0V2Y1F6ZFVwTWYzdThyYkQ1bUg4ZVFOcUtlQVRWM3UyN1Ba?=
 =?utf-8?B?bnFvYTFJcFA2d2p6UjVsSDJpWkp4N1hMZDluYndkMDNzWkNvUW1xa05rNElE?=
 =?utf-8?B?dXF3UWdKWGp5Z2VaSm83RGx1TExaVmtCMUpzK1FFK080dXUzUzUwNm15QWMr?=
 =?utf-8?B?ZDhOcDVtWFVYc0FIME1NWmRVME5YZEJTcDY3RTVYSTBJTUt1TVo2eFQ2V0lj?=
 =?utf-8?B?SUlIaUtqaVluYU01NnppdDFUN3NFTHh4aExXZzFRcGFNOHh6TTF5QThoOUJ0?=
 =?utf-8?Q?w6K7pmi5LoH1/x9UIAdva68eF?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e53f0a7-db94-476d-80e3-08db83793026
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 08:14:32.6810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHVOh9CpaapwQsqR97lEJtECI+Zqxz2Ioq9ixOm4sM4F1E7mER/DL7h190J9dEhNqxJaSjWbZeaPmamKTfB44A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6349
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_011439_861399_D1540BD2 
X-CRM114-Status: GOOD (  19.97  )
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

SGkgTWlxdWUsCgpPbiAyMDIzLzcvMTIgMjA6MDksIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkg
WWFuZ3RhbywKPgo+IGZyYW5rLmxpQHZpdm8uY29tIHdyb3RlIG9uIEZyaSwgIDcgSnVsIDIwMjMg
MTI6MDY6MTMgKzA4MDA6Cj4KPj4gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgp
IHRvIHNpbXBsaWZ5IGNvZGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPGZyYW5r
LmxpQHZpdm8uY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9kYXZpbmNpX25h
bmQuYyB8IDIxICsrKysrKysrKy0tLS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9kYXZpbmNp
X25hbmQuYwo+PiBpbmRleCA0MTVkNmFhYTgyNTUuLjJkYjFjZDFkM2QwMyAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMKPj4gKysrIGIvZHJpdmVycy9t
dGQvbmFuZC9yYXcvZGF2aW5jaV9uYW5kLmMKPj4gQEAgLTcxMCw4ICs3MTAsNyBAQCBzdGF0aWMg
aW50IG5hbmRfZGF2aW5jaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAg
IHsKPj4gICAJc3RydWN0IGRhdmluY2lfbmFuZF9wZGF0YQkqcGRhdGE7Cj4+ICAgCXN0cnVjdCBk
YXZpbmNpX25hbmRfaW5mbwkqaW5mbzsKPj4gLQlzdHJ1Y3QgcmVzb3VyY2UJCQkqcmVzMTsKPj4g
LQlzdHJ1Y3QgcmVzb3VyY2UJCQkqcmVzMjsKPj4gKwlzdHJ1Y3QgcmVzb3VyY2UJCQkqcmVzOwo+
PiAgIAl2b2lkIF9faW9tZW0JCQkqdmFkZHI7Cj4+ICAgCXZvaWQgX19pb21lbQkJCSpiYXNlOwo+
PiAgIAlpbnQJCQkJcmV0Owo+PiBAQCAtNzM2LDI2ICs3MzUsMjQgQEAgc3RhdGljIGludCBuYW5k
X2RhdmluY2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAKPj4gICAJ
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaW5mbyk7Cj4+ICAgCj4+IC0JcmVzMSA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7Cj4+IC0JcmVzMiA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMSk7Cj4+IC0JaWYgKCFy
ZXMxIHx8ICFyZXMyKSB7Cj4+IC0JCWRldl9lcnIoJnBkZXYtPmRldiwgInJlc291cmNlIG1pc3Np
bmdcbiIpOwo+PiAtCQlyZXR1cm4gLUVJTlZBTDsKPj4gLQl9Cj4+IC0KPj4gLQl2YWRkciA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMxKTsKPj4gKwl2YWRkciA9IGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPj4gICAJaWYgKElTX0VSUih2YWRk
cikpCj4+ICAgCQlyZXR1cm4gUFRSX0VSUih2YWRkcik7Cj4+ICAgCj4+ICsJcmVzID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAxKTsKPj4gKwlpZiAoIXJlcykg
ewo+PiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJyZXNvdXJjZSBtaXNzaW5nXG4iKTsKPj4gKwkJ
cmV0dXJuIC1FSU5WQUw7Cj4+ICsJfQo+PiAgIAkvKgo+PiAgIAkgKiBUaGlzIHJlZ2lzdGVycyBy
YW5nZSBpcyB1c2VkIHRvIHNldHVwIE5BTkQgc2V0dGluZ3MuIEluIGNhc2Ugd2l0aAo+PiAgIAkg
KiBUSSBBRU1JRiBkcml2ZXIsIHRoZSBzYW1lIG1lbW9yeSBhZGRyZXNzIHJhbmdlIGlzIHJlcXVl
c3RlZCBhbHJlYWR5Cj4+ICAgCSAqIGJ5IEFFTUlGLCBzbyB3ZSBjYW5ub3QgcmVxdWVzdCBpdCB0
d2ljZSwganVzdCBpb3JlbWFwLgo+PiAgIAkgKiBUaGUgQUVNSUYgYW5kIE5BTkQgZHJpdmVycyBu
b3QgdXNlIHRoZSBzYW1lIHJlZ2lzdGVycyBpbiB0aGlzIHJhbmdlLgo+PiAgIAkgKi8KPj4gLQli
YXNlID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHJlczItPnN0YXJ0LCByZXNvdXJjZV9zaXpl
KHJlczIpKTsKPj4gKwliYXNlID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHJlcy0+c3RhcnQs
IHJlc291cmNlX3NpemUocmVzKSk7Cj4+ICAgCWlmICghYmFzZSkgewo+PiAtCQlkZXZfZXJyKCZw
ZGV2LT5kZXYsICJpb3JlbWFwIGZhaWxlZCBmb3IgcmVzb3VyY2UgJXBSXG4iLCByZXMyKTsKPj4g
KwkJZGV2X2VycigmcGRldi0+ZGV2LCAiaW9yZW1hcCBmYWlsZWQgZm9yIHJlc291cmNlICVwUlxu
IiwgcmVzKTsKPiBJIGJlbGlldmUgdGhpcyBpcyB0aGUgb25seSB1c2Ugb2YgdGhlIHJlc291cmNl
LCBJIGFtIGluIGZhdm9yIG9mIGp1c3QKPiB1c2luZyB0aGUgcmVndWxhciBkZXZtX3BsYXRmb3Jt
X2lvcmVtYXBfcmVzb3VyY2UoKSBoZWxwZXIgaGVyZSBhbmQganVzdAo+IGRyb3AgdGhlIHJlZmVy
ZW5jZSB0byB0aGUgcmVzb3VyY2UgZnJvbSB0aGUgbWVzc2FnZS4KCgpJIGd1ZXNzIG1heWJlIHlv
dSBjYW4gYXBwbHkgdGhpcyBwYXRjaCBkaXJlY3RseT8KCgpJdCBzaG91bGQgYmUgbm90ZWQgdGhh
dCBkZXZtX2lvcmVtYXBfcmVzb3VyY2UgaXMgbm90IHRoZSBzYW1lIGFzIApkZXZtX2lvcmVtYXAs
CgpoZXJlIGlzIGRldm1faW9yZW1hcCAoZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24gd2lsbCBub3Qg
YmUgY2FsbGVkLCBhbmQgCnRoZXJlIGFyZSBjb21tZW50cyBleHBsYWluaW5nIHdoeSB0aGlzIGlu
dGVyZmFjZSBpcyBuZWVkZWQpLAoKd2hpY2ggbWVhbnMgdGhhdCB3ZSBjYW5ub3Qgc2ltcGx5IHJl
cGxhY2UgaXQgd2l0aCAKZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlLgoKCk1CUiwKCllh
bmd0YW8KCgo+Cj4gSSB3aWxsIGFwcGx5IGFsbCBvdGhlciBwYXRjaGVzLCBwbGVhc2Ugc2VuZCBh
IHYyIG9ubHkgZm9yIHRoaXMgb25lCj4gb25jZSBpbXByb3ZlZC4KPgo+PiAgIAkJcmV0dXJuIC1F
QUREUk5PVEFWQUlMOwo+PiAgIAl9Cj4+ICAgCj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
