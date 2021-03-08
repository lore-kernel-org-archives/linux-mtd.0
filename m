Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C57AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:13:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E946865142
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 06:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E946865142
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rMFIdkpLnQXhF2x2Heb93Bvc/jr0gNDb+rsm8YG+OfE=; b=RcR+9huQZuKVdew29PFiE0l+w
	ug2lN3xv41yXe/eubQQj4cmmVu+1HW6Ux0SF5OU7AuBAbpyKnasZoYlmzO0Sy+G06mTkiF+2KX2LW
	fUWvo6puRHIAqgtXiz3WltKlouRQdtljsTKzXUQzxM8TgL/ah8PXRzH9hRpV7hlSbzZmTI6qZl98a
	kITF2Dby1laAMYG6sIhLNiz3aQsgLkjA5PFWfHcHJtdTrqSFYFBeZJZ96s2+AxZxNbKq5KFyB7hho
	4oBJSInlBGKh7SiA2T2AvIttCEE1pIxXdvBVDmf9onPu3MnQ6O40sTs0uRoH7u8t1NAoMCTAAgEnu
	Ao5NLSQBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ97q-00FQuV-IP; Mon, 08 Mar 2021 06:12:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ97h-00FQt2-TY
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 06:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615183929; x=1646719929;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=REKB72ve5KxYO6ml787WxEeHPDegAxibEtUa/qWwJ9k=;
 b=Rc6FqjRbsOaU0xH5P37mOwznD1dkpETj777L6UB9WqATJ40CWY4ASAId
 XcnEiMU2n3uLAjp2qpa+V7Db0kAoPkago2IL8ynASrdHw8UAad3k9JKeH
 r7Sn9N+1Go69qJk0mgBBmfi8VLmlPnavnJK4YUmov0SxFGZZ6cjCSsc7k
 CjZU5OhZ3oxZOZoO8jaGsYH6OhPRskPZFfvTBgcuie5xzVwSJoCPgPcHO
 qZWEjmVkv3+HDYQAoL3yJDIMmy+kaIUVTQTwXilzRR9Xrycs0l+lwCEUW
 /VKWxUYmC9fRP0j4cwsobr3gZGgQwdWKkg94pK7XgWGlFRa54qcnImyk+ g==;
IronPort-SDR: HJf0MB835k4zywr2WcUgaBwBeRrS6QY7n460g661fUq/Apu4KJ0yg5QBIeWJWgf/HXYBgLIgRN
 bwgoaVfJ+eX2YMo0QUXZ/99lKXlQOrKGP5s8VSgXChhr9TLqhZf6PWU1CpYF70ROOoQTODknrq
 rsPg0RJN2IRo8340yYXrMlbnwUKJd0z5NQkjJGNWaAQq14TWWvb6eYUekQazYLe+iiIXBHSX6k
 mB6U63QUXaXVDiRc+6o1iSoUhanv+InyjqskVTYkATekvqbmlfOOTO+apG5HQCLZ36lwVTsBTi
 f5Q=
X-IronPort-AV: E=Sophos;i="5.81,231,1610434800"; d="scan'208";a="117924198"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2021 23:12:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 7 Mar 2021 23:12:03 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Sun, 7 Mar 2021 23:12:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7LdzU2QBFx9oBGDga3LdLG6NdtYWabDtp2rAuSkuOiAsllrxM92u+oYxJ/nH9VcdgjHDl2Ft3gML2HRv9FYobpa4JBu7UK0m3gdXvn4vWRy/OIhhcqOyAb0Kgnm8HW/FT9fnAIUonp2DPaIFJYK/XKU+YHhf6ePGLJNnFMG0HcpqbRyOtiYLkTI7mYYeJ73OFXeiP7b4Q79IoN7HTlkLD7khDcCikGBKMACja6vXug7hAOc65nVqZ0Qxjr4Yb7ccs9QeVfEvmYQ9ox3laeOQUnQ62V6d7pKPRlUCO9ZwRnBi1QAi5QmwXFz8PpnXDA1o0OsFQARd0n65Q5vT1af3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REKB72ve5KxYO6ml787WxEeHPDegAxibEtUa/qWwJ9k=;
 b=YlQFn+XhQjBFp96cKn0hl4clpPyMWzJshbTtDfszahW22QfcRu55qUes6lrTunGfAaWpot+YypjbjwiQtwi63/w5Sb/ps4/WQe4Up8BcV35z6+FeBBVUaAzBSsFubjjhaFg4U5QgxutKl3+oq6V2m8CJUUp8KMpj2YlkG7rTuY9xAf/DmhfcjApOffRRCkaJXSkUGiEJmI/0CDXwqjpiaWmw0HvN7aP/t/BwXcOz961LGT27KWnFEj3GYR6Ki6uDoRVZv8UVz2yXcvc2oiaasGQHIM+Ifqxptq80gV09h/NrlQegXhrUKVps9trRe6+dfYo6NMruWfMPCzELRazpWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REKB72ve5KxYO6ml787WxEeHPDegAxibEtUa/qWwJ9k=;
 b=ZmlVpLYrY39YHNI4spshVD3Ag5cNrO7GtJnzwk7kVOMTc7rVpsQtNnmWeRZPLf7ks16aB0VdcFKIEhfuecvoHmEt2RRI7dRFmPNsDLGqFBO1hWdQ8vmpI9TtK/XZtjACnM74AwghGFyVyN6v1xYGHV7+nuguQI79S0lNxeB4g6I=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2574.namprd11.prod.outlook.com (2603:10b6:805:59::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Mon, 8 Mar
 2021 06:12:00 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3912.027; Mon, 8 Mar 2021
 06:12:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mdalam@codeaurora.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <sricharan@codeaurora.org>
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lb256e
Thread-Topic: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lb256e
Thread-Index: AQHW/tRbqHaAg4NgD0qNJyhsV2Um36p5xjyA
Date: Mon, 8 Mar 2021 06:12:00 +0000
Message-ID: <0de29904-2fe7-aaa3-902d-849c766e2190@microchip.com>
References: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
In-Reply-To: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 417bf698-979e-45ea-6137-08d8e1f915ee
x-ms-traffictypediagnostic: SN6PR11MB2574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB25745C656A3A3A2E22874614F0939@SN6PR11MB2574.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6SZu6wTYtWGn+lG9f72Fz6Pjq/EVAeyBSdlNbLapXbknZdku6T5BOoiQkcDBurzRNY3CW0nwT+rOCzw+Pl6AngJwXBtmM+dmHD7Yy5rAQRKE2W04E/TBKddvBB+HydPJ+bkEXZU82mFeHAliFLwltjPBs4fsWInfKb2q2O7aMtojzPlVK9GXj7Xgsj05B2PPfJyAZe7417QyzrVWmRAuzoKtqfZ0P94LQRwGxxWIvfFavSJLO0Ftl1N9bWCGoE9V81H8whbqvAX85/BEXHxUSm61zuVoiOPMkI3wXBlmmDyIWjLU3d4kqDklpQ4KvEiPbn9QliCE+4sqyv0bRCSF6IFvshDMjQ/8TQr23f4Wn0vA/WLtOyZ1PBI7Ol05vtCQTEmQwk8u7Qd8POyT2wErBvpSI7XfrvMlQRORUx1Qc5TqLIhOfXNMGipnCd9f87AiZqDEWS3G4mPdA6/LB/q6mZ8cy8YHFHWiGEeBbgK+EKrQ1SRrGaag5t6XH6nM/4cKLmDvzPgA2uixWdg7kqMET2CanfznUBE69/VWlS5xs7b/kJcYPXwCbiIhkOT0VIxfSKiazi5JMneJF2cDDgesip/MyaX9y/GBNyBGVWGppZgCu9WBIsV65R/Yg6OEt/9GNn3S26GSmtw6U5UJaioOcA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(396003)(39860400002)(366004)(186003)(53546011)(5660300002)(83380400001)(26005)(36756003)(66556008)(64756008)(6486002)(6506007)(76116006)(2906002)(91956017)(4326008)(86362001)(66476007)(110136005)(66946007)(31686004)(66446008)(2616005)(316002)(31696002)(6512007)(71200400001)(8936002)(8676002)(478600001)(138113003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?QTAwVm5NcmdpR0V4UXg1dUtMekx4Wmg3VVAwSlB6VzJmYk03U0lDeS9ZN0NG?=
 =?utf-8?B?cDdocVB2T2xPRnArYzlOUlphN2IwaDMyRFVaT3RMRzNnUDUxUjNWbmljcFlw?=
 =?utf-8?B?Q3U1RTFhYVJ6Z1BTeHFCMjdnSVBneXdWZkdkQm9PRDYrakM1elF1b002UGMz?=
 =?utf-8?B?bFVkU3haVm9iSjhwN0VKRkFJc2FDWE1YV2JOTTJQZ3dtWmxXOVBwSStGbHdE?=
 =?utf-8?B?WnZmZXNSejNzWk9sRjNLSHRSeERaUGZkek85ekExOXZ3RVZLeitpT0M0Zk9H?=
 =?utf-8?B?cmVxQXY0bDNsUDYwa25ZWkpPeUdrb0gvTDhVTGpSRWNpUmhlK1U1eUFrZHcr?=
 =?utf-8?B?VVlNMHhlbEVYNUpGUTZkMFk3TlhWU3FjL2Y4YTcxb2lOWVJ0WkVtTlU3Rmpu?=
 =?utf-8?B?Qlo0cmZaeUtJZVkxbmppZjkrYzJHaE93M1BlMnRNYkMvYU94NDhIdU9CdzE3?=
 =?utf-8?B?Rzc0eXNoczVxaW4xUXhWTlVONjFENkhCbzZXNmdkSkFyNW4xTVl4d0RKMGZG?=
 =?utf-8?B?VXFZSmxUNzd5QVZOVjIvTmo1RGN1SlVJWnhpYzVwbW5uSWgyMHdCdXdoTWVD?=
 =?utf-8?B?UDljcjBNUmM4T3FBVlBuV0E3amF4OXVrckxWVE5US2VadGlyeHVsV3ZWNnBl?=
 =?utf-8?B?K05TSFlrSVVjVEp1a1hIcWdHamxLL1ZacmNkd1lxcFVyUTNTdUNVbmI5V0hG?=
 =?utf-8?B?Rk5xMUEvQTlwcnpOdnFveDZ2MjJubHQ3bGFORlZFUWVQZmYyUmdUeURTeDIr?=
 =?utf-8?B?ZC9UekM1QkRaeFU1b3dMb21yYzZpT1pEZm9STHNaMW1uWkNQM0ZmVk9LRjRw?=
 =?utf-8?B?UThLTk1HY3JzZXdOcXNzNHdCb2twbHMvbVV2dEk2YWJrdVJNcnRuYVZRQmdy?=
 =?utf-8?B?QThITnRKSXV4dWFxMzdoMktCWmVQWkgwcWpVQktXR1B2c2JpSmVQa0RhMC80?=
 =?utf-8?B?WWhtNGtQY1FPZVk2WHpEbUNVd2dTLzI5Y2I5emp6QjhtajYxQlpzY1lsclhW?=
 =?utf-8?B?Tmg1ZC9Sbm5mY01PM0MvdDlTck9wNEhQTTBtZ0NFdDhIeVlwamdEOGE5dnd0?=
 =?utf-8?B?VzdqUmJ6YVB1ZmNwb0FSQ3RsaE9VR0ZQckMySGlJQ2ZrZXlTZlpLajJkTm1L?=
 =?utf-8?B?VS8vcm9ydlZFSkQ4TW1qM252NGVXZ0lxNmtZd2t3UE8vQ0l3eWVESFd4SENG?=
 =?utf-8?B?TTRFVGVxS1dLVWRlWFZ6c24vTllTdTN1UEZFYytLU0Z5b3VSZHN5VFRCMSs3?=
 =?utf-8?B?VmIyMVJoK3BhQjdBTXQ5bmFtWDJLRm5vZS9aaG00ZTBacnpoUm5PdjNvVHFI?=
 =?utf-8?B?RUpwM1hMQ3BmdExZWUlpbnJQcXVBM1BQT3o5dnBKUmZiNlhaaittN1VNUHNv?=
 =?utf-8?B?QXFOajg4bUxoK2tFazk3Z1ZySGJxUjh0UjZQc3VrSlk1TTU0OXdTZkpnQVli?=
 =?utf-8?B?WE9lQWI2SlVEVUwyNllXam1SYktndnorWCtCN05lUVhnaFJ5QjZ0T0xEOWJF?=
 =?utf-8?B?ME5FRnVzQW1adWVPZkkzZWRXbTFyYmdRSzdRTEhLRTRvYlZvNHd5alVyUXVn?=
 =?utf-8?B?Z1BBOGJPRUp6WGRmNFdqZkJRR1I4NTU0Q09PUk5vMWg4VmtiK3hCby9BeXMz?=
 =?utf-8?B?SEowQ0hVVDRpYkt3WHRDdlUxYXdpUFFRSWhRZ1V3Zm53RThPRU9KbmZ0Vkd2?=
 =?utf-8?B?VkwzVmt6ek9ITEtYbkVZVXVTSEdCMHJNdExJTjQ5R0JoTGJERjFDZmZkcDlj?=
 =?utf-8?Q?5bm9mRPqenBpB9vWVo=3D?=
Content-ID: <130A2EFE4708734E811A603A308F71AC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 417bf698-979e-45ea-6137-08d8e1f915ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2021 06:12:00.2800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ksf4krU6HKhh9dXInkuaeAjQ5phmeaXqQrImnQ7zlH9KYmro7ggb1lJWSp71OnHKenjLtxVBuKn7uNM3DP8gv0wLWkagTDiGqHKvlbMBNpM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_061211_126290_64A50472 
X-CRM114-Status: GOOD (  21.93  )
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

On 2/9/21 1:11 PM, Md Sadre Alam wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for gd25lb256e. This device tested on IPQ5018
> platform with dd from/to the flash for read/write respectly,

typo: respectly
> and mtd erase for erasing the flash.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index 447d84b..8f1e7ec 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -50,6 +50,9 @@ static const struct flash_info gigadevice_parts[] = {
>                            SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK |
>                            SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>                 .fixups = &gd25q256_fixups },
> +       { "gd25lb256e", INFO(0xc86719, 0, 64 * 1024, 512,
> +                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> +                         SPI_NOR_4B_OPCODES) },

The flash doesn't have support for 0x3b command, you can't add the
SPI_NOR_DUAL_READ flag.

I see that the flash name contains info about the generation of the flash.
Is the generation differentiated by a different device ID? If not, we can
strip the "e" from the flash name.

Looks like the flash has support for BP0-3 protection. You can try
to add the flash locking flags and test the support with mtd-utils,
if you're interested in this kind of support.

Cheers,
ta

>  };
> 
>  const struct spi_nor_manufacturer spi_nor_gigadevice = {
> --
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
