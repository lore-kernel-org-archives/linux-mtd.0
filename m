Return-Path: <SRS0=n0JE=H6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1E5C433DB
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Feb 2021 12:01:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F52164E4A
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Feb 2021 12:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F52164E4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+sElZgSvzI1r6a2v8kkkorLcSaunbnvS9S37YlrR5yg=; b=cX0oIGz79jvy1Mbu9WgwPyNVF
	JKC+Jz2mFkZmSjAhyU4ljPU4kKaawTp8ZDmZsI6smpa7yTpa+ym3lTHLr0P+Da1rx7/c9HGiCMsYm
	SEOiG0+PoageM93wSSTYBNl4ifMBOy1TX/sk0PJ7tkQxxsmHF60c+reL3TVk6xil3UVIRz48oSf8c
	K2cknY2uaVLlImkVMBoOayE8jsh6zAhXIJytWXy51Jp3U2NxmLm3+sm4czZ3IqbFk9rhNAFNNbSrO
	mDf7i4ZjS4rUNTTf/BTgy8enOvnHYfeUQrjiTJ8ZrYvQU1ULAiV2t6fhvvFVPynvQiRRcHKGBIyoC
	HfoJFW0GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGKky-0005lh-W4; Sun, 28 Feb 2021 12:01:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGKkt-0005kv-Hw
 for linux-mtd@lists.infradead.org; Sun, 28 Feb 2021 12:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1614513659; x=1646049659;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=76cLspJ5vRGDiNT2vL8GqhMlWrgei/eM3JcPQGvNLNc=;
 b=aKnwdEDLMe3BunO2O435C2lbyJNuKbZbb4OakiPIcLjnfZNd7hATHqKE
 doV6eg0PDbNZlQIut54V60L8lFNtrJEswAKGmKK7CCCp7oTE2dXCMn0nX
 ttuvpaFvyQi+4gpo/3itNgfZZHJOEXfTZ5Wpy7KlOUjhsPAv6OChRYo0j
 lKe6rW3MUBamawMBjBEKeFN4ibNQc06eZHaaAJgBsjdiAxSJk0PTI0qOh
 YXMWwc0sipwnyicnim4XJwYm9+zEyTEzDxUTC0f8fjEHbpCaKQ1qlusUt
 hTv4hyNk4UV6GbNZQOTgzWrNuOVnrqsPnE1qmOIOFuVKskL5tH8h0dhJG A==;
IronPort-SDR: loYrsMCZfx+rQBi6D5OMOuMAH86d3bn+ThRm7BCnfQphoOrZOBOyF9AVhkb/9I/4uMAaMA4L4x
 hEPX+VRx7ufjg5G9iEgyrZHVv9S/ERHZNqZrj88XrV3yW9b5AB3Gd8wLWr8tJeD5MkYvkJ9eQQ
 vu69Y8YUPbgQU8hvsyF27JMoJ7/Ihpba8MMVQEDTSxwQPjwmEQAmoO5yx4qY5gFDPa1Vpcbzm/
 3DYJm+FCXOx8FUIHMcV/vMJJFfK4XSOXL9RcY6nBewtz7krwmzAtj/kpkALsZK5lhfpFvlUTjV
 1x0=
X-IronPort-AV: E=Sophos;i="5.81,213,1610434800"; d="scan'208";a="111390400"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2021 05:00:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sun, 28 Feb 2021 05:00:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Sun, 28 Feb 2021 05:00:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO/KoVDM16pNy/yrMhzzdFCvexe1fyNqJTeFIibdxQaDAJ44eubFAXeef85kV1RvojgyC4WmE/4Fig6XW4e2wt7u6bweEX1Tz8Z0GC7syKVCCleddjK2OASEHgA1K7vafyU+y3lVFPA9IiDV8Em+u/aUIZ7C+pwpK5F4hqLJ/iia8JfLL2MC5VBRBao01oaMXNBwEM2w6oRQXfn0sG0OZGI1t5/194tpg8OeewvM7ew5PKbylkpQtBrmDSgZU/m5W2AVSd/JMQDx/SofNTwSRdEo6oP7m/fgucoawXAKLliKCdVybz9tOSwEp9pSQz9nWZjKZ95zsKBgmqHRP7UaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76cLspJ5vRGDiNT2vL8GqhMlWrgei/eM3JcPQGvNLNc=;
 b=ITQ+mDLMQS89ufqyo5devREMdTrMtCSSooubxvEVXx/7Ty0iWPF1sal4QcCeAdeQScM1K/bOgM095eYVQ3BAIDT5ufbqhiQVkj2CP/Ny5kpIbRzApIHnDXGkdGat+kLJVsRtNWTAkvSw5bgLoNFttSbQm0/NLsdLpCc9zmJ9yEFVrJYHUFE5fc1Fp29X2LtK4v4TTdnem0U2NtGuWa9RUfAR1soBoNY8f5+S289byy11TXaPyGaWitCMs4QO3eNZxiSDH+XElX3MM8JRU8auduHAi1liIqVDWY2BRxk3P77YfQYPotc/WahWlR6vuHqNuR6/KXtAaSRBKYeHOszR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=76cLspJ5vRGDiNT2vL8GqhMlWrgei/eM3JcPQGvNLNc=;
 b=etvq73NMBAW30pnNcU8tzDJ5mEJWvwfNGnjqhd+RhW+BvrflnwmFkfExMKmiu7x/Q7uUpzWqSg3x4acCruOnG1diMmfeqqGNYr6Uk+6eoAzJHx6Bmy46ft4IwV6VnpOM6PubmoQqpSLMEVfWPJzZj/Kj0NPGvzjQWcrQF7NYsKE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3054.namprd11.prod.outlook.com (2603:10b6:805:ce::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Sun, 28 Feb
 2021 12:00:53 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3890.023; Sun, 28 Feb 2021
 12:00:53 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add OTP support
Thread-Topic: [PATCH v3 1/2] mtd: spi-nor: add OTP support
Thread-Index: AQHXDclcHlguiOZnr0yr2S1GDQLc9w==
Date: Sun, 28 Feb 2021 12:00:53 +0000
Message-ID: <d4f74b1b-fa1b-97ec-858c-d807fe1f9e57@microchip.com>
References: <20210216162807.13509-1-michael@walle.cc>
 <20210216162807.13509-2-michael@walle.cc>
In-Reply-To: <20210216162807.13509-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffc54138-1109-407b-59ba-08d8dbe07fda
x-ms-traffictypediagnostic: SN6PR11MB3054:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3054E09E9AC17E9B8F8C9D02F09B9@SN6PR11MB3054.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 09q5Jrx4nkMOpa+3kVhAThcDkeZxnxOIuEhKypjWNA+2N94tL0w4VqBOXiQU5UIgCO1TVQn3iFvbaUdB3xDV0en1U2AHQrhTZi0F1KkOZpwMntquKNnqOvhhHCYlk8CV5Kldq6ZVyxbGOomqsWDUeagCkIfdfOBldMm6IPl+1YgzWwLDklDhgCv5lrxsyZ67+mxhRbCrh/zRHEt2hqmITwKaBPmNUul4LuAw8IGSXOP0+W123mU2j280Nw8ZekVaRdE4OaDLXjDQOXp7HtH0lkQzoAv5XcPO0DqGGqFqBzOsyycWDz2BG45XlDG6E9LwQ1MCmX/Psjay65sueY6zBWzmJnx1voj+lip9RvZY9fFpY5UVn4z8AqFz8p8KBdrhCsLrgbhEWmrjOXSiyU9fMCE+f87wM6eIbsuofy+o58KEurGtrZZpiNypcAjpGLqCuKUekHVEGcWMNVfPzPKqP4nuXl3Y568otGC7UrpRdgV5oOTjH6OOnk1p6zTu7na9125sFO6Loy+pTURPg8OQJnIVKKb/+fRuq9f6UWZQKEg4lLxjsYrUQGeBPJcbIfH/X6euH/WT666g/S5htc2Hot0Y0ivM4mXRDabTVJDhwwLBETyhe/VlbzU1A+NfiHfT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39850400004)(376002)(136003)(346002)(366004)(30864003)(5660300002)(71200400001)(2616005)(2906002)(31686004)(6486002)(26005)(186003)(66946007)(66556008)(76116006)(83380400001)(66446008)(8676002)(478600001)(316002)(4326008)(64756008)(54906003)(86362001)(110136005)(6512007)(31696002)(8936002)(66476007)(36756003)(6506007)(53546011)(91956017)(43740500002)(45980500001)(309714004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WURVV3pCV0dSUjRVN1hhMG5aUFdPTVVYVkZiR1NxcndDZU9vUmdMT1l0SUkx?=
 =?utf-8?B?Wit0ODU5aHRqbTlaYTl1QXFjQXRXT1VscFk2cUUrM3Z6NXloeXFsdjlQZ2pX?=
 =?utf-8?B?b2k4d3JJZmRnOGZDNzFoNzlTZjVObXZVY0sycVlGL3VXcXIzN1hIbHI0WDBi?=
 =?utf-8?B?TFllVytCb3pNUEZHREo5anZ2L2xwOUg3NFBLY0RHemNaN0xSK1NOcTZZWkxy?=
 =?utf-8?B?a09qZ3Q0a1MvRG84bHhMRFRFcVF0R0VFQ3FzSEg0dEpad0NFNTNKbEhEMi9B?=
 =?utf-8?B?NjZpVzNrK3VtOTJhekJ2NmxhMWI5VlRHMFpFKzBRWWMvZ1B0a2VqK29paGRo?=
 =?utf-8?B?NTlpVHBXWExyMkFWR0ZVQ29xeFdnN1k3M2lBOGtQRnRHMkdhTWZkaUw2aWp3?=
 =?utf-8?B?QVM5aE9ES0tscGRlb1FYRGxyU0VZSmFYNzAwN3krUFVhNVA1ZXAxL2VZZFZv?=
 =?utf-8?B?aW9sOTNNTFlZYmVDVDB4RTZRMmcrRnZzWFVZSjIyTUVYdkc2N24xM2ttMDFM?=
 =?utf-8?B?QllCZWNjTjdSWTVuOGc1ZXQrMGdhZDVVcWtTWm9lTHNva1VPNEZGaEhTZkNE?=
 =?utf-8?B?QTJtVXVKY1VtOStJMm4wa25Fd05UM2dXT3NlZFNRRG9nM1RjdnRLMWttVEtt?=
 =?utf-8?B?Yk5US3pNRzBFc24wYUFkeVkvbDlEK29BZDlER2wxdCtvbzJDY2NPWjhTRmU1?=
 =?utf-8?B?ZllqMi95Qmdwbk5pbXpwM3BGRjBWR1ZXcmVUWVlpYjBlMmVKaHNPTHJzN0Fk?=
 =?utf-8?B?QitMSm9GS24zYUFJd0diaTNUMklKY0hwbUFhYXY1VUFNZ2QxVEhqeSt5YXJh?=
 =?utf-8?B?T2hNRFVXTnBZUU5yVEs2c1FHOHJscitPZlNZbjYralo3dE5IRmQvZGM4NllY?=
 =?utf-8?B?ZGMreThDZFVaNUdxQ0IraW1MSFpkT3NyTDc1TmgvRXlwMGdHclI2SUp1Wmgw?=
 =?utf-8?B?WnRiUUllOUZEa3YzRHg3Rit1OEM0K1FycnBLaUFiMmZER0tWM2R2ekxObGEy?=
 =?utf-8?B?L0IrdVhCN3VkQmJsSnkzbmVqNWx4NGtZL1VXVkg2RWpNTm11T0J6V3YrNXB6?=
 =?utf-8?B?UWVlNUwxZkVJd2pSaXJnZnBSejFLTkxsc0E3YlZhMy9zd0dJYWN3OU54WVhw?=
 =?utf-8?B?TWRjOTU5cmYvOUlscjNqMlVkaHVjQkR0RFllaXdpWVVWdmw3NWRMaENJQ1Nn?=
 =?utf-8?B?TXVHZEx4QVc4bXVueUtxa2I5YlNGemtybndxMys2dko2dHZYL2dtdkF4YmUy?=
 =?utf-8?B?ZHdzVFdsR1podW9JdjdpTEJRYWJ4cUdVSm1NV1RYaHlPei90b0g2ZmpadzNY?=
 =?utf-8?B?V3NkckovUGh6NzY4RXlXam9Dd1ZFSWRSZ2xOR05Yby9jYTEzWWEvaVowZ2pS?=
 =?utf-8?B?OXlFNHJkY0JQRlM5cWYycTJPdzB3eDRoWDFMZ0NHT3RwQ0MrVGJsMXFNbDFh?=
 =?utf-8?B?M1o5OHExRTBGTTMyVzBnSERKOTYvQUVMeVM0QnJ1ZnZIcEVPVHRWUW84M0pD?=
 =?utf-8?B?NEpWQXg2S3lzOTRmK3VjR01YMmVTb2Y4T21sWjAvWk9wNzBLVzBQeC9CMjZn?=
 =?utf-8?B?NGhBb2lGQWl2REhNelBRd082cmt3NlltL1Vpbkl5NHFCQnJ3NHVuc2tGekd4?=
 =?utf-8?B?eEg2Ri84OVhaWkc3OHVFekNRcldjV05tKzJSMUkybWw3ZFJGQUlUNWJNb25p?=
 =?utf-8?B?RDdONHh4a3JyY2YwKzl3OFUzMXJGSnA2Z3kzWHVJUk0xZmNsK29WMUJ4L29Q?=
 =?utf-8?Q?I4MSomMcN/q34BhLxg=3D?=
Content-ID: <29FA0D3A974D7948AE5128144256F048@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc54138-1109-407b-59ba-08d8dbe07fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2021 12:00:53.5684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rwJs2kU66i2+k+gbwJRCVQ6RwAjGXkASXcKWiY9Pb8MAMcNoNakUlUItoQj90jIZk3FGvG/s9feG8RwPnikw5buAFsvuHpuyHL6E4MzwmoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_070100_058470_F0FE1AB7 
X-CRM114-Status: GOOD (  29.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael,

On 2/16/21 6:28 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> SPI flashes sometimes have a special OTP area, which can (and is) used to
> store immutable properties like board serial number or vendor assigned
> network hardware addresses.
> 
> The MTD subsystem already supports accessing such areas and some (non
> SPI-NOR) flashes already implement support for it. It differentiates
> between user and factory areas. User areas can be written by the user and
> factory ones are pre-programmed and locked down by the vendor, usually
> containing an "electrical serial number". This patch will only add support
> for the user areas.
> 
> Lay the foundation and implement the MTD callbacks for the SPI-NOR and add
> necessary parameters to the flash_info structure. If a flash supports OTP
> it can be added by the convenience macro OTP_INFO(). Sometimes there are
> individual regions, which might have individual offsets. Therefore, it is
> possible to specify the starting address of the first regions as well as
> the distance between two regions (e.g. Winbond devices uses this method).
> 
> Additionally, the regions might be locked down. Once locked, no further
> write access is possible.
> 
> For SPI-NOR flashes the OTP area is accessed like the normal memory, e.g.
> by offset addressing; except that you either have to use special read/write
> commands (Winbond) or you have to enter (and exit) a specific OTP mode
> (Macronix, Micron).
> 
> Thus we introduce four operations to which the MTD callbacks will be
> mapped: .read(), .write(), .lock() and .is_locked(). The read and the write
> ops will be given an address offset to operate on while the locking ops use
> regions because locking always affects a whole region. It is up to the
> flash driver to implement these ops.
> 

SPI NORs can support some OTP-like behaviour, meaning that in addition to
the tipical OTP ops (read, write, lock), the SPI NORs can also erase the
OTP-like memory before the permanent lock. I find the erase useful, in
case one writes something wrong from the start, in case of errors where
what was written differs from what is read back, or simply at development
stage, to check the implementation. So I think we should add support for
that too. If not now, maybe later.

Michael, the overall implementation looks good, and I think we can have
a version of it merged in the following merge window. Some suggestions
and comments below.

cut

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..af9d7f194f01 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c

cut
> @@ -3502,6 +3508,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>                 mtd->_is_locked = spi_nor_is_locked;
>         }
> 
> +       spi_nor_otp_init(nor);

since this returns void, we can do it the last thing in the spi_nor_scan(), so
that we don't gratuitously init fields in case of errors.

> +
>         if (info->flags & USE_FSR)
>                 nor->flags |= SNOR_F_USE_FSR;
>         if (info->flags & SPI_NOR_HAS_TB) {
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..5fb54ae08c5b 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -175,6 +175,21 @@ struct spi_nor_erase_map {
>         u8                              uniform_erase_type;
>  };
> 
> +/**
> + * struct spi_nor_otp_info - Structure to describe the SPI NOR OTP region
> + * @otp_size:          size of one OTP region in bytes.
> + * @n_otps:            number of individual OTP regions.
> + * @otp_start_addr:    start address of the OTP area.
> + * @otp_addr_offset:   offset between consecutive OTP regions if there are
> + *                     more than one.
> + */
> +struct spi_nor_otp_info {
> +       u32 otp_size;
> +       int n_otps;
> +       u32 otp_start_addr;
> +       u32 otp_addr_offset;
> +};

How about the following:

struct spi_nor_otp_memory_organization {
	loff_t base;
	loff_t offset;
	size_t len;
	unsigned int n_regions;
};

> +
>  /**
>   * struct spi_nor_locking_ops - SPI NOR locking methods
>   * @lock:      lock a region of the SPI NOR.
> @@ -187,6 +202,20 @@ struct spi_nor_locking_ops {
>         int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  };
> 
> +/**
> + * struct spi_nor_otp_ops - SPI NOR OTP methods
> + * @read:      read from the SPI NOR OTP area.
> + * @write:     write to the SPI NOR OTP area.
> + * @lock:      lock an OTP region.
> + * @is_locked: check if an OTP region of the SPI NOR is locked.
> + */
> +struct spi_nor_otp_ops {
> +       int (*read)(struct spi_nor *nor, loff_t ofs, uint64_t len, u8 *buf);

int (*read)(struct spi_nor *nor, loff_t offset, size_t len, u8 *buf);

> +       int (*write)(struct spi_nor *nor, loff_t ofs, uint64_t len, u8 *buf);

same here

> +       int (*lock)(struct spi_nor *nor, unsigned int region);
> +       int (*is_locked)(struct spi_nor *nor, unsigned int region);
> +};
> +
>  /**
>   * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
>   * Includes legacy flash parameters and settings that can be overwritten
> @@ -208,6 +237,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> + * @otp_info:          describes the OTP regions.
>   * @octal_dtr_enable:  enables SPI NOR octal DTR mode.
>   * @quad_enable:       enables SPI NOR quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
> @@ -219,6 +249,7 @@ struct spi_nor_locking_ops {
>   *                      e.g. different opcodes, specific address calculation,
>   *                      page size, etc.
>   * @locking_ops:       SPI NOR locking methods.
> + * @otp_ops:           SPI NOR OTP methods.
>   */
>  struct spi_nor_flash_parameter {
>         u64                             size;
> @@ -232,6 +263,7 @@ struct spi_nor_flash_parameter {
>         struct spi_nor_pp_command       page_programs[SNOR_CMD_PP_MAX];
> 
>         struct spi_nor_erase_map        erase_map;
> +       struct spi_nor_otp_info         otp_info;
> 
>         int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
>         int (*quad_enable)(struct spi_nor *nor);
> @@ -240,6 +272,7 @@ struct spi_nor_flash_parameter {
>         int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
> 
>         const struct spi_nor_locking_ops *locking_ops;
> +       const struct spi_nor_otp_ops *otp_ops;
>  };

Let's group these altogether:

struct spi_nor_otp {
	struct spi_nor_otp_memory_organization memorg;
	const struct spi_nor_otp_ops *ops;
};

and then in:
struct spi_nor_flash_parameter {
	...
	struct spi_nor_erase_map        erase_map;
	struct spi_nor_otp		otp;
	...
}

So that we use:
nor->params->otp->memorg and nor->params->otp->ops

> 
>  /**
> @@ -341,6 +374,15 @@ struct flash_info {
> 
>         /* Part specific fixup hooks. */
>         const struct spi_nor_fixups *fixups;
> +
> +       /* OTP size in bytes */
> +       u16 otp_size;
> +       /* Number of OTP banks */
> +       u16 n_otps;
> +       /* Start address of OTP area */
> +       u32 otp_start_addr;
> +       /* Offset between consecutive OTP banks if there are more than one */
> +       u32 otp_addr_offset;

Let's use the structure that we have already defined:
struct spi_nor_otp_memory_organization otp_memorg;

cut

> diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
> new file mode 100644
> index 000000000000..59bd1a3f450d
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/otp.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * OTP support for SPI-NOR flashes
> + *
> + * Copyright (C) 2021 Michael Walle <michael@walle.cc>
> + */
> +
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/spi-nor.h>
> +
> +#include "core.h"
> +
> +static loff_t spi_nor_otp_region_start(struct spi_nor *nor, int region)

const struct spi_nor *nor, unsigned int region

> +{
> +       struct spi_nor_otp_info *info = &nor->params->otp_info;
> +
> +       return info->otp_start_addr + region * info->otp_addr_offset;
> +}
> +
> +static loff_t spi_nor_otp_region_end(struct spi_nor *nor, int region)

same

> +{
> +       struct spi_nor_otp_info *info = &nor->params->otp_info;
> +
> +       return spi_nor_otp_region_start(nor, region) + info->otp_size - 1;
> +}
> +
> +static int spi_nor_mtd_otp_info(struct mtd_info *mtd, size_t len,
> +                               size_t *retlen, struct otp_info *buf)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);

const struct spi_nor *nor

> +       int n_otps = nor->params->otp_info.n_otps;
> +       int locked, i;

unsigned int i;

> +
> +       if (len < n_otps * sizeof(*buf))
> +               return -ENOSPC;
> +
> +       for (i = 0; i < n_otps; i++) {
> +               buf[i].start = spi_nor_otp_region_start(nor, i);
> +               buf[i].length = nor->params->otp_info.otp_size;
> +
> +               locked = nor->params->otp_ops->is_locked(nor, i);
> +               if (locked < 0)
> +                       return locked;
> +
> +               buf[i].locked = !!locked;
> +       }
> +
> +       *retlen = n_otps * sizeof(*buf);
> +
> +       return 0;
> +}
> +
> +static int spi_nor_otp_addr_to_region(struct spi_nor *nor, loff_t addr)
> +{
> +       int i;

unsigned int i;

> +
> +       for (i = 0; i < nor->params->otp_info.n_otps; i++)
> +               if (addr >= spi_nor_otp_region_start(nor, i) &&
> +                   addr <= spi_nor_otp_region_end(nor, i))
> +                       return i;
> +
> +       return -EINVAL;
> +}
> +
> +static int spi_nor_mtd_otp_read_write(struct mtd_info *mtd, loff_t ofs,
> +                                     size_t len, size_t *retlen, u_char *buf,
> +                                     bool is_write)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);

const

> +       int region;
> +       int ret;
> +
> +       *retlen = 0;
> +
> +       region = spi_nor_otp_addr_to_region(nor, ofs);
> +       if (region < 0)
> +               return 0;
> +
> +       if (ofs < spi_nor_otp_region_start(nor, region))
> +               return 0;
> +
> +       if ((ofs + len - 1) > spi_nor_otp_region_end(nor, region))
> +               return 0;
> +
> +       ret = spi_nor_lock_and_prep(nor);

please check the ret value

> +
> +       if (is_write)
> +               ret = nor->params->otp_ops->write(nor, ofs, len, buf);
> +       else
> +               ret = nor->params->otp_ops->read(nor, ofs, len, buf);
> +
> +       spi_nor_unlock_and_unprep(nor);
> +
> +       if (ret < 0)
> +               return ret;
> +
> +       *retlen = len;
> +       return 0;
> +}
> +
> +static int spi_nor_mtd_otp_read(struct mtd_info *mtd, loff_t from, size_t len,
> +                               size_t *retlen, u_char *buf)
> +{
> +       return spi_nor_mtd_otp_read_write(mtd, from, len, retlen, buf, false);
> +}
> +
> +static int spi_nor_mtd_otp_write(struct mtd_info *mtd, loff_t to, size_t len,
> +                                size_t *retlen, u_char *buf)
> +{
> +       return spi_nor_mtd_otp_read_write(mtd, to, len, retlen, buf, true);
> +}
> +
> +static int spi_nor_mtd_otp_lock(struct mtd_info *mtd, loff_t from, size_t len)
> +{
> +       struct spi_nor *nor = mtd_to_spi_nor(mtd);

const

> +       int region;
> +       int ret;
> +
> +       region = spi_nor_otp_addr_to_region(nor, from);
> +       if (region < 0)
> +               return -EINVAL;
> +
> +       if (len != nor->params->otp_info.otp_size)
> +               return -EINVAL;

Does the otp memory organization matter for the end user?
Can't we lock/read/write past region size, for example 2 or 3 regions in a row, 
depending on length?

Cheers,
ta

> +
> +       ret = spi_nor_lock_and_prep(nor);
> +       if (ret)
> +               return ret;
> +
> +       ret = nor->params->otp_ops->lock(nor, region);
> +
> +       spi_nor_unlock_and_unprep(nor);
> +
> +       return ret;
> +}
> +
> +void spi_nor_otp_init(struct spi_nor *nor)
> +{
> +       struct mtd_info *mtd = &nor->mtd;
> +
> +       if (!nor->params->otp_ops)
> +               return;
> +
> +       /*
> +        * We only support user_prot callbacks (yet).
> +        *
> +        * Some SPI-NOR flashes like Macronix ones can be ordered in two
> +        * different variants. One with a factory locked OTP area and one where
> +        * it is left to the user to write to it. The factory locked OTP is
> +        * usually preprogrammed with an "electrical serial number". We don't
> +        * support these for now.
> +        */
> +       mtd->_get_user_prot_info = spi_nor_mtd_otp_info;
> +       mtd->_read_user_prot_reg = spi_nor_mtd_otp_read;
> +       mtd->_write_user_prot_reg = spi_nor_mtd_otp_write;
> +       mtd->_lock_user_prot_reg = spi_nor_mtd_otp_lock;
> +}
> --
> 2.20.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
