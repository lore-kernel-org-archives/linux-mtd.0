Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3937EC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 04:16:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842F161168
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 04:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 842F161168
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxvQK/zI4miHBuTKWaVsejkeVhyi0o/yLBr+aBSlNCI=; b=pmrqp46bqVKurJ6HnOKKXvMRU
	IxPAD7chwjvdDIV6rVMlSOXN38WRbMO/RalAuNQx4H6pIGFOBBl5DFal7HoVEZgE1Sp2fVEg9Tbhn
	F3sv514Ymj+AgEnvzYBCG1rJcfjpAPP2hnyLfMaqtasIoMW6YP2dp37Z4bntj+/qwRFZ3M1X4WRjh
	2vkAIQPvrYwbZocvh2/t/eKf1VqLb0cGPtNIJ3symIcuDYTMJPQ5nJm5r+W/ytnXN6IFaHKQjqfzD
	PZEsRHd030BbpolYSodi+b6vmdML5L+3Wqba07rTL6ljua8YiGTtXxsCLmCUMjbRR+xjZLh2Uu4Xh
	lZDezx/1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUiYQ-009z1t-V5; Fri, 09 Apr 2021 04:15:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUiWq-009ydF-Tt
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 04:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617941636; x=1649477636;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Y0MSFIoxA/DU9vt81PAv6dK5iUJoYZ3Fc0DsMN+ByCY=;
 b=KAquvMmbY3zjpJ4zdto0AAp+4hfQOcjifYKHiWUI7qBmf8Bg0vJc5pVH
 QElqfYQ5Qqr9Jvc3sP5rW6QOQ6mulIZ3GsfVBUrbzk0n/W9/j4TazVonh
 I2yrACQuBSvCY22xiu33DP854ZQGzh4p64yS5/5TnowNm2mJ2A/KTN/mY
 L12yF383myd4Gzhw3sU01dls7bosWRB4zTlNsWhvC4RLuqgIiOzohw1KZ
 4swOc+R6Bspd1YWOq3QmYgo2x40CM62aSQaOmnp6CtvSUln3swiamRbXa
 MN0I3vVuFNqC9RKk4p28zew5xxfRQcAdlJpylW+hm9ZpLrRa7H+FLlUTV g==;
IronPort-SDR: gAV6oGMpBWiulwdyEAtvRLoOvPMk9pDSl6EbbSTWg5KJr3nEiG3xSe9SVsS5eb9bK0uxSp1jnI
 7B08rauCcAw4q+4ZklivNplHVB+xGCQdJ7LJXmGreAXaQsqtJSo18Mr4ZOQHav6ZJr1cyav32S
 0oK5c6hF1xyQ35x1YakLK8gtGbgYZ0XA3QhWFWdxR8OOJrHf2jV3NM3uAYbYvtL3FdLwQB+dx6
 wUyNvYFcEFz460CXott1yMnL0PidxbmHfYjPljKy3lChSbpGeToNPTkNA3BhVsrQu4cgNM3DW+
 yCU=
X-IronPort-AV: E=Sophos;i="5.82,208,1613458800"; d="scan'208";a="116386921"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2021 21:13:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Apr 2021 21:13:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 8 Apr 2021 21:13:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfLzLRKN1vkpHDdAgrfi1dS7KjpHxSX4MIye79nRUl5riOy2lcAdSqxtLSN/N3fkfOafLVyl9iqsuTDuXY81Qi0ggSRQFHW11PwCWSQBHuyA6FfvWpe8WyC+F1k4iDG2sa3dab/D+v3E6ZxIcMzpK5N1fCNi6fvMHACIntWtLmNxsPEixzqH48rvW8crh2AoijwtN7CwnojlDhKzBqdjdAbnQyGokVbAfDh4YJaJ2R8lhSoVbAbUgkEiX0VdhaLt/34fd/LDyX84JYyN9KbJqJJCISXHB9UJvwbBnfNgHZ7zYDDzhpcIiin70gYphMNAm1o7BjGi8OQrErPVQtcF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0MSFIoxA/DU9vt81PAv6dK5iUJoYZ3Fc0DsMN+ByCY=;
 b=I/em2TOabUxCLMrI2qzWfVF6R1LJAYrwHjxA848HVK5GadqmiCOE3h5VYE7tOEtNf+pur0DUUERwNNmOVZCcfG9I4XRkvG3ohyktUT+05EnwpRRTVsic7ljSMTQgOOjnW8jAjHngJ4eMEJuXrUEsa4YNgwFek6CAmkHXZoppshBKeHLoa+D9G1tKnaNG/Onouhu3YOqsSLr8TcJk2Il3EuQ0Vv0kQV2WazhMWT+aZfEBkwVsDpbngfD4if+iud9sdlaCaD38Q84AqR5xOfC2qcMfSpBWtWUkn9P/JWcbb6AI7ky6HOYLydBzh1Te4vsI0RVzwnzUNjzRUBMfBcquHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0MSFIoxA/DU9vt81PAv6dK5iUJoYZ3Fc0DsMN+ByCY=;
 b=DWzyTF5pTobInHpHitKQ2uaQFwCGXTp32nj1DGZ7hcZgpRMmmATxJ/koIjsEfkMbvBz2RQX7i5oPtktLCPXbbm+CwQYnRJMI7wGvpLB8K00rONH9JwoPPl0yFeAg28NAa8nlzLXlYrOHZViYZWku8ZHTJgfm/Yf1K2lztGX9zrw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3533.namprd11.prod.outlook.com (2603:10b6:805:cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 04:13:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.4020.020; Fri, 9 Apr 2021
 04:13:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yangyicong@hisilicon.com>, <p.yadav@ti.com>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linuxarm@huawei.com>, <prime.zeng@huawei.com>
Subject: Re: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
Thread-Topic: [PATCH RESEND] mtd:spi-nor: Fix an issue of releasing resources
 during read/write
Thread-Index: AQHXLO9zrsin2tR3IES2teSB3cSkLw==
Date: Fri, 9 Apr 2021 04:13:45 +0000
Message-ID: <c5d1ea37-4a38-c7b5-8cd5-88f304d68fdd@microchip.com>
References: <1617262486-4223-1-git-send-email-yangyicong@hisilicon.com>
 <a77d9b48-e7c4-044f-3c14-25bcc817b43f@microchip.com>
 <a2133aef-eb35-838e-db76-7ea3781019c2@hisilicon.com>
In-Reply-To: <a2133aef-eb35-838e-db76-7ea3781019c2@hisilicon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: hisilicon.com; dkim=none (message not signed)
 header.d=none;hisilicon.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f48539e-914a-4627-a58e-08d8fb0dde0e
x-ms-traffictypediagnostic: SN6PR11MB3533:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3533A8A8277A737EF8217D2BF0739@SN6PR11MB3533.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:663;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JjXSdovFS5NNR14H/4yOhAvLQ1bVkmFTbSeT49jN9zdhXRREmTNHrHjARGXb0VTUo1PNomKa/HzHp854HDL57+TB4z3/r3Ia9qdv0irfubBWvFY7e7IgFNuKOQu199sxHrggEaJ+2LhbzdQsQVp5VFCF1yO69KJsmnlETrsGfhOdDxkIlq4GF+jLSI/BhTMIYx3NKSz8f2aoTwALLFa1dY/Ms72BdrXdUhJvaNVLtjnj83YA5gN447nyNwdXmb47DmJfv6HamS6aS0S0ZcVQPgGr+Aee4BQyt1hD9PtXZLeHCext4fhLN2fhFd+KQvxCO4ZEm2eKMFQreGqTo/bKV59gwt4IZvnuv/CU4jrpoRLLZTW5G/dJsGRQ2GMoSVLpv5WnL/3l+lcs7q9W0yY+bnOeKTrMGNugQnfv5WoV1eS31Z0rgqhS5UQ1grlTkB5jKgs9+Y9OU3FwT2WbHB4gKaK47QdCqFs3Vf2M9WbmlHhJ7iZNeuOv3SKd9hcj78cElIKPQ7qByz0p83WfxzIYQ5Acb1D2qJxgv3sUzHXbviTwfc/QZb0yG3EYBToeMW1rSsJ6eM9a+Lv5QNgdcseiZIdhaIZ/In1pKHUYA1FubFxENy+UxACTJlc8yIiSTsCN3tsLNPe5rR57RsFl/XGQl7OstgzxZL1EDio94q3LuCJLObeGt9wTj3b45bjOTQTNqrbTAqiXzzDK//wiq1HVSxCEQVoDSu4yO6Na+ddZLFc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(136003)(366004)(396003)(31696002)(66556008)(2616005)(54906003)(66476007)(66446008)(478600001)(66946007)(64756008)(91956017)(6512007)(76116006)(86362001)(8936002)(31686004)(8676002)(53546011)(6506007)(316002)(38100700001)(6486002)(186003)(71200400001)(83380400001)(110136005)(26005)(4326008)(36756003)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Tk5oNytPRHRYNytOZm9SVXRUVEpHWURudXh6QWJ5dy8zUjZKb3VvdlkwUFZi?=
 =?utf-8?B?MlBzMk40dUFCckpxb3IvK3VHWDd1bk5zMGVEQm1NYUs1cStoU0pxbG5KdTFX?=
 =?utf-8?B?eUt0M0JoYjd3ZmJwWTcxbDFla3p4c0pCRWZvVGV0RXFNbVpZVkxqOGJnNlBv?=
 =?utf-8?B?MVFmeTZhU00walFqOVJZeGF0ZFJyS0g2Ui9BYkxHSXdQTmtKWWV2cVZkaVRW?=
 =?utf-8?B?UXFQQ2hRcjVZN3NiRmtmNi9WYWk4eHFLSEJVMUxWOWJXU2lwVENXa3NobytL?=
 =?utf-8?B?M3ZCMXpoczlpWDMrejFkVUpGTWpzSVpESlNidzgwYk5tZnFCdHp6bitBdEFy?=
 =?utf-8?B?WElBTk9hdG5BNWt3VzhQZWIrcWFBTzdLQStNc2RIZ0I5dGhGY2tKdVY5TXVu?=
 =?utf-8?B?SWZFUk1HaGpnUzNFN3luYnJBcWh3ZlVXNm5vRlNROWdTMmNwYjJKVTFZdEpy?=
 =?utf-8?B?ajErY2tmNnRRSldWZkRaKzFJYzRxRGV6anJrb2VOb1MxNDBUaXJhMndFZ3ZW?=
 =?utf-8?B?NzkyNlRIRC9jUUtyTVRyNmx5VVVoaHVGdDdNQVh1YWhmdE9Ma3l1TEZETnhm?=
 =?utf-8?B?b3B4VUxqdFVvOG55ZlZSY0xnVmhmWlFCdUY1Qkt6UXBFR25FY2paWGV2UDF4?=
 =?utf-8?B?MHE4a2YrdFdjbVkwTlEzd3g1OWd3bDBSTk5tSDFKY0VheWp2SWxhQUdYWWcr?=
 =?utf-8?B?UEFtRHBBWHBsWnJpMVN5Q2YzdDRObjZ6MHhHMXZRK01aMG1NL2NGSmVXNGpF?=
 =?utf-8?B?RmY1YWlBZVMxT3YxekhDRjRXdE9sSHJLUUlZR3V2SlFmcUFmK0JOc3pXMS9N?=
 =?utf-8?B?alFhNkdRdFNPYjV0OXVUeElseC9UcERkK1UveGlIakpodnZwcDN2V3hhc1ZI?=
 =?utf-8?B?Q0ZDKzZUZnM1SXdEOEdLQUNRR3ZzaGlJdFZLcGs0WmphcmNsS2dlVXlRSWRq?=
 =?utf-8?B?ejFFL2VyVkZCZ1FMaTA4SjdsUFFacUNpVncvay9zZlBKYnIwTFB3M0ZSVnNl?=
 =?utf-8?B?UUI1T1hZUVo2b2VCTVZWRGZMM3pkaVRIcSs2REZwdnkwa1p3WmxXRTdCUXNT?=
 =?utf-8?B?MHNtVjZzekxSS3VlUjY2alZ5Sy9oTU9JczNrZlV5cE9RRlFNY2plZEdmekdG?=
 =?utf-8?B?Q1UwaUQxbzlFdlJNK0VGSFJmbVY5SU9HOGk2T2VVUCtLNnltc0ltZ1U2MWhS?=
 =?utf-8?B?RlVnYk5rQ2MrRklVMGZrRE5Xd1djTVBQOTAvZUprOERjMGIyemovOEhtbWxT?=
 =?utf-8?B?cVQ5cTFtcXRTUFU5NXVYVGlreGNSN0F1OHgvdWhVQXNDNENXNGMycDhqRTR0?=
 =?utf-8?B?SG82a1ozZWpWbW1CeXpnUW5DU2prRWZqb2w1aVBsdjN3QlRjNXQxYkJobnVz?=
 =?utf-8?B?MjA2RGgzRFAvUnNPblQ2My9uaHNENXZTR0x2QjUxeUI0MGI1cjVlbk5FaXJW?=
 =?utf-8?B?MFlpbzViVVMvakpFTGx3ZWVjK1BWL1RuL0VyMHJuU2tmb3RMd1FpM3g2UDZB?=
 =?utf-8?B?L1VIc1hNL2dmWVRYU216WVk3cCsrYnBlL0tpRnNSdnZldjZNZkY2NHFIdGNU?=
 =?utf-8?B?cGVucWNVeXZ1ZmJzdjgyWjFTTEZsa0FGTkphUXc2WDFVMUNMZU9VbzhmSldo?=
 =?utf-8?B?NWczR2hYNS9jUEZZVEhXbUhRNkdBbW41NnJ4bHI1OUhMcGdlUXlManoxODQ3?=
 =?utf-8?B?MXpZSkg2L1BwM1JweXBiRTNxaWYxZEZMaVh2MmlUY21Eb0FSd1RIOEk2b3Mx?=
 =?utf-8?Q?E19uXy9M55Er6/wFFs=3D?=
Content-ID: <FCDBD42503FE474A8C9D5F161D5143A9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f48539e-914a-4627-a58e-08d8fb0dde0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 04:13:45.0458 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RdkK/22HBZtAU4MVkP8TlzkPBLARBkJOw8+h8acMK4cUhgrOPRwif3NgXy0u1j8fbnUKcVsPgaKWN/PtQD7r2BWqZkq0UxV30CXRGrsMF9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_051400_732020_DD9BD7EA 
X-CRM114-Status: GOOD (  21.24  )
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

On 4/9/21 7:03 AM, Yicong Yang wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 2021/4/9 11:21, Tudor.Ambarus@microchip.com wrote:
>> On 4/1/21 10:34 AM, Yicong Yang wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>>
>>> If rmmod the driver during read or write, the driver will release the
>>> resources which are used during read or write, so it is possible to
>>> refer to NULL pointer.
>>>
>>> Use the testcase "mtd_debug read /dev/mtd0 0xc00000 0x400000 dest_file &
>>> sleep 0.5;rmmod spi_hisi_sfc_v3xx.ko", the issue can be reproduced in
>>> hisi_sfc_v3xx driver.
>>>
>>> To avoid the issue, fill the interface _get_device and _put_device of
>>> mtd_info to grab the reference to the spi controller driver module, so
>>> the request of rmmod the driver is rejected before read/write is finished.
>>>
>>
>> Do we care for a Fixes tag and a Cc to stable? I guess this bug is present
>> since the introduction of the driver.
>>
> 
> yes. I cannot find a proper fix tag. so perhaps:

Fixes: b199489d37b2 ("mtd: spi-nor: add the framework for SPI NOR")
should be fine.

> 
>   Cc: stable@vger.kernel.org
> 
>>> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>
>> Tested-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> Will fix the subject of the commit when applying.>
> 
> thanks!
> 
>> Thanks,
>> ta
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 33 +++++++++++++++++++++++++++++++++
>>>  1 file changed, 33 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 0522304..72bc134 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -3301,6 +3301,37 @@ static void spi_nor_resume(struct mtd_info *mtd)
>>>                 dev_err(dev, "resume() failed\n");
>>>  }
>>>
>>> +static int spi_nor_get_device(struct mtd_info *mtd)
>>> +{
>>> +       struct mtd_info *master = mtd_get_master(mtd);
>>> +       struct spi_nor *nor = mtd_to_spi_nor(master);
>>> +       struct device *dev;
>>> +
>>> +       if (nor->spimem)
>>> +               dev = nor->spimem->spi->controller->dev.parent;
>>> +       else
>>> +               dev = nor->dev;
>>> +
>>> +       if (!try_module_get(dev->driver->owner))
>>> +               return -ENODEV;
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void spi_nor_put_device(struct mtd_info *mtd)
>>> +{
>>> +       struct mtd_info *master = mtd_get_master(mtd);
>>> +       struct spi_nor *nor = mtd_to_spi_nor(master);
>>> +       struct device *dev;
>>> +
>>> +       if (nor->spimem)
>>> +               dev = nor->spimem->spi->controller->dev.parent;
>>> +       else
>>> +               dev = nor->dev;
>>> +
>>> +       module_put(dev->driver->owner);
>>> +}
>>> +
>>>  void spi_nor_restore(struct spi_nor *nor)
>>>  {
>>>         /* restore the addressing mode */
>>> @@ -3495,6 +3526,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>         mtd->_read = spi_nor_read;
>>>         mtd->_suspend = spi_nor_suspend;
>>>         mtd->_resume = spi_nor_resume;
>>> +       mtd->_get_device = spi_nor_get_device;
>>> +       mtd->_put_device = spi_nor_put_device;
>>>
>>>         if (nor->params->locking_ops) {
>>>                 mtd->_lock = spi_nor_lock;
>>> --
>>> 2.8.1
>>>
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
