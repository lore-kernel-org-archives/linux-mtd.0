Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5852BC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 19:51:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F7AF617C9
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 19:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F7AF617C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sz3c/4bUjNWLYDhrw58wSoxScTA/6Kmv8zeE+CwbFBQ=; b=AHrlWuXnPVgQijj9hOUaifV1g
	Vd2Vw7+FVuIILKniUWuFo4cdUruifKzkWHr6tYDHRAabzVVi53+iSm/GpmFFtSoWKuF+5Co+iV/4L
	PaBW8cKJoBbwyl5cHjIgp2bVsLMbAC+QyB1Ah1Jon7EoSaQARMcJ2yb1qdaFJU7lLpBWmSbsHJBxx
	1MrjCNJn0/qh03OORu9bh7k1NRaUNJKuowLh4yVeVPe4HoJqwSJi6rA1VZSD8bWPNewaidpQlOdsa
	TX5JDGSyu5yPasI3wMV1+82ssedTRIqRE2yV7ahkE+nVfKus6LYuA5aVhH+7QwYHTqXkS9bXD6dga
	VHLru+A3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxto-001JeC-OH; Mon, 29 Mar 2021 19:50:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQrgp-000fXn-Og
 for linux-mtd@lists.infradead.org; Mon, 29 Mar 2021 13:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617023540; x=1648559540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gp7AMClWeemgwbjtS5GPwl5EblHLaphzXXMTmy+GKsE=;
 b=lTIca/TR9nqYlyfpU9oXJm8LBg+gEWU/XkMJdJVWdrZNE8nkh/GcR/I4
 y1eqWnEaFu3KOwejFhia0POJIEjHFfSvkhzLsQHJ9gWKyfyUrr8Ez7jhS
 4OnLt+QjjRn+Q0+SIvPoRKANMIXhb0SUoGrruHTBmKWpk7xDd1kfJf39g
 T1MiPVg2jEZptcKcCXN7U51DwgX7N58vFDY9YWfzRbqdWDU85Yh25bgSW
 XuhY7+w66rirdPaNY0NmX0lmihurRcxN8LFt2nD5RdZBCTVDhJpGTvJof
 PnRf97BYLOfOf5h2JbOCawSBaRpUTbh11wrHWIdAI95XNvYiUCyzCTHFi g==;
IronPort-SDR: kMvY9p0N2bA9Yg6hRBtvoLreRKah4NGPNJ8kZqLMb4oFch8SUDYEQ5CS0w781GOeTaqIfBUiDx
 NME5A5EKxusihU7/Y1Bm/FapTfzME6+6wm+8tFlzPjpz754cJXBd+rdfviEFnF99vr0hE+385S
 BqrPNufBW8x4W597xnT+cCicIMFdQHfa2IpEeZ2oDuiidyo04YfBE4DbAKMK7iyAD8av67iGKS
 5OZ7We9pbj+lgfliKTwT4FlyYplUaL1iMkX9e3qMwExkNl4/ALaYzLa+HwYIM0yjo28qa+ij3w
 1nI=
X-IronPort-AV: E=Sophos;i="5.81,287,1610434800"; d="scan'208";a="114517293"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Mar 2021 06:12:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 29 Mar 2021 06:12:11 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 29 Mar 2021 06:12:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZFShFXKZZlECNEBYBA1hGTTtIqQ0yJ148+VUlKEK0+9Euz/2Lhhl5aVyRe+36e43gTKdUGcGVuGfzJehmxKJeDDN0ERUam+GVIoP8UOjhN1jFnIs3F1xt4nEqOZqAVYExz7u/nMb1kTvRTMN/v+D8x0UUXucDkCY1OZcZf8VowlBxKZcTeNAJPf+n3ZrvslGudKsOQpHnsna/32swkIBciHktGhYRN3p0HKZa7GcWhh1FudKHX0HoBM2hn5rfCNF6llgTDt5QTNdgzNGSeo5lojEmWTErR2lqtLCfmSSsfuVT91jBonoHE1dAy54e1v/0bzil1CGx2sAc2+IAPIeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp7AMClWeemgwbjtS5GPwl5EblHLaphzXXMTmy+GKsE=;
 b=nIk4/xPf1KddhmoagDboYePIyjyv2twdoGRFANXGoI081NiMw334Zj7qnEocukKNVfNRqzQBj74TMwGL8cK+tlhIVqPHg0s4gxQoXCC0YhrjXRSy9kuZm2f3iENLiQEG0h5B6L2TBJIbJq4mqA2spjqFkJOKTai/6vPjT4ketIkN2GX1cs/vR9ZhX/dJ4S1ctVHk8b4zNWzOYh0rbXPM00se7PUltfryvOVNbuWtpqMlkaXAAww5XHJz6jYPGiNBRJ7e1fC52rIFmdnMTuLYGsUCKNmGbsZI9MwXbdhvWLmFcdE61nlzbU+DJvXRiCPkdYaRgNXylEoC9CIcY36kdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gp7AMClWeemgwbjtS5GPwl5EblHLaphzXXMTmy+GKsE=;
 b=ACAdoiAcMqz/pLI8sf4dc5HVhuykRte//U60G6f3t2Y7u/Hx08y4BvUIf1px+6R8HuE+nE32O0xGGOPbvFjNzKEve0q6j04Xg5R6Qs8EsMV/Vzbg8uz0HVSra9es1jemZ+wdm2M3BGRL5qMle0x2WDiJ+V+t/Iml8SQpAdt3es4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5020.namprd11.prod.outlook.com (2603:10b6:806:11f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Mon, 29 Mar
 2021 13:12:09 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 13:12:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Yaliang.Wang@windriver.com>, <vigneshr@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Topic: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Index: AQHW8a94mMSXtQqoOE2NM8lFQHXK9aqbVt8A
Date: Mon, 29 Mar 2021 13:12:09 +0000
Message-ID: <7c8daaf6-a802-5de5-63d9-81febd7dd7b7@microchip.com>
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
 <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
 <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
 <6f868908-ee07-690b-98ea-47d81acf009d@microchip.com>
 <d80d6cd2-87c3-c336-7add-b91ff4e0b177@windriver.com>
 <549f0999-ec8e-a2b0-2c2a-2c09a4951ad9@microchip.com>
 <17a9226e-7d95-f3e6-7d94-ce6415ccd991@windriver.com>
 <2966c209-190c-750b-9313-605157e20604@microchip.com>
In-Reply-To: <2966c209-190c-750b-9313-605157e20604@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d2c4c46-1877-4a1a-6c0c-08d8f2b44234
x-ms-traffictypediagnostic: SA2PR11MB5020:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB5020FF6418D83348D3186FD5F07E9@SA2PR11MB5020.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 64vHdmzgfSkx7bSZCu2CCon47acCybmABUdHDjpPZOz0vD4rmBkCSrRyUBQ86TIY4nhlC3pkJ7mqdh5lt7V1fJJsZi7QPCq7KbDaX19by3eL/GDXtMYeKuggi3djKh1wez7KQFk+hKA4+Wug9pmuBJAJR0XYf2BD9jMdJpNVszKEcvUekWNgdn8ATleGyiK3hdIYiEX9wMKBrYAcEXjLvXfn1b5JCzAKns1WnwjYKQ5E7ZWwespqFhDtq8mOs5pqUPQLgNCn5Vs8+hArj1rOXoraYtCIqEGBiHqg8SIWE/Yf/2r9QHKB3Oc/3ANDQ2NRx8LAiMTae2FLj4AeuJ0uUkfbYD+PpWuVB00LlsY1ayk0rHFYEcbUO6BrjSXHD4+TFIG/c2PYK9oglhyGceDo5kUwhQfqODXYTUYq1FW3/oPdXO/b3920AnrY5rvEGzNKs9AdhG9Ch5nWcuxp0qKnY+BDFepXJfO/weVyagNrDqTjqsdVJcJLGzxkQGWEaXTQ7IEwAXcHM9LWc0suLTiOQXoZk8qRsct10objEAQYfwRD5S9vvorpY4dzDvPHihOwMiwkIS1HdPIK8h21av8ExU2w4Er0qJQwbLzOt7NaxhcUKRNxQUYnUTZAQFUpfhjHbF9Y0HHjbr1I0wNNEAByo6tO3ghehtbat7wsBBGlpJXvaNwjT/txXgTr9YYAbE3HkBsgcD5OUW5qWwD+5uCGts5HRGVXNc9R1PsgvLtZRbs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39860400002)(366004)(396003)(136003)(6486002)(26005)(64756008)(71200400001)(66446008)(110136005)(6512007)(2906002)(76116006)(53546011)(4744005)(66556008)(91956017)(66476007)(31696002)(66946007)(316002)(86362001)(31686004)(38100700001)(186003)(478600001)(6506007)(8936002)(36756003)(4326008)(2616005)(5660300002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RklwQllHUzJLcE9jbVh0U1U4cThDSkxyYm1obThaSkdHUmlRT0lIZlJTbXlC?=
 =?utf-8?B?eTBjcUFRcDBMYVhNM2h5U1h2NEpBdDBtSTVuTEdBdTNSbEJkZDJLL1dSRXB6?=
 =?utf-8?B?dmhvVFBoMGY0VXE2KzJySDY1dEcyTVBLZDZNTEYzRUQ0RDE5cW9oU0VXN203?=
 =?utf-8?B?VlVOejM3bittc1ZIS1VndkVvcW55YWEwYzdzZDVNdE5UdEQvaXhyM3k2U2o0?=
 =?utf-8?B?Z09xaEx5eTBjN0NZQ3lvcThqemRzSnkvWXpYUTljZHRqcDB3cGpEUG9KdXRr?=
 =?utf-8?B?SnZLVitNNVhTV2F3b0VxRVBpc1BGcHlaYkRrb0RWa0c0VE9SeWZrWFJNSDFn?=
 =?utf-8?B?a25TeHVsbElVWlZBQ3BCV1FWNDQ5S05RN3J6SDd6bWNXRkFHeWVxVVRjbG00?=
 =?utf-8?B?dm9IRXFpd2M3ZndQSk1taW85eHgvaDdzK3l1SHpmNUhIRFR2NTIwTlFQRWZw?=
 =?utf-8?B?eHZ1WnFuRHRyZ3IrSm40RU1KSVVCNXJCS3VJZm5mclNOVW4wL2E1SFNURlFX?=
 =?utf-8?B?bG9uZE43WktaV3RIZExQcW5RalJhWGFIY2dJS3dubFpKR040OEQvb1QwZTlx?=
 =?utf-8?B?emp6ME9xaGpWVXVxVDF6c05EYkxTbWJVajQwSzBrOEh5ME94UlIwdDMxQXdO?=
 =?utf-8?B?bkh1RnNwOGxKbVJFQ0tadm1yUC9seUpEQ3V6UW9jQXBhL05CQjdkZi9oZkNJ?=
 =?utf-8?B?R0t2YUNFLzN4RFl6ZzlxanBOSXVOM1IwbmJkQWZPd3MxMEdwbjJLakVZVVJr?=
 =?utf-8?B?YnpuZVhwWXhoV0NhVXd0Ymp1YS9JQm90VkZQTnlEM2dWOHJXSWQvTlNnbVp4?=
 =?utf-8?B?bkpXcEpYRmdUcFFqdkxHUlI1RXFaOEMwVm1nTzlMSmZzUXN3WE8zcFlTQXBX?=
 =?utf-8?B?bHVVK3B1VnNjaUljSzlYWXo0YmV4UU94QkJiZWZIT2lRZnd5QVhZK3NsZnZ5?=
 =?utf-8?B?NVBzdHhUc1ZhbDFwejBqWTZsSTlpOGNmOUhqdEp2NXc0cjVtM3RYTFdydVla?=
 =?utf-8?B?N0pnWWxjOU41bjhGUGRNQnRQWUhvcjFmeTBiWFNHWldTRUxEcFZYbE5OMXFX?=
 =?utf-8?B?cUZVeTdDcURaNlhHRmdNWkwvVVQrZGsyWlA4TjEvTWZzUk5aY0tRdUhiWEV5?=
 =?utf-8?B?Zk1LYy8yNmxBS2tnc3NiNmV3UDVEaUxEMXd0VTBrVk9SZDE0bHlXMW5TSXdj?=
 =?utf-8?B?UTJ6Y2RvNW9uNlYwYTZEVFhQbWFLdEdlRWZiYmdiNzFRTzNxUkExb1BtbzVx?=
 =?utf-8?B?N2syR0xoU3hEaC8xS3FTODcwYzFjbk5Bd0pWNHljbVVSaDdMOEk3aWdjaFg0?=
 =?utf-8?B?MFdMbEdsbFN1Wmw1QlZUampJY3dhampFNmxFWmVVQ3duekV3dklDVVBaQmpq?=
 =?utf-8?B?MkFHQXQ1dklocEgvMlhwNVFLSUh0RmN1UUl1MXc1QmVmZG1wWVc2dUsxSjJm?=
 =?utf-8?B?MXR3UU9UbklaMm4wOW84azRnL0hhK0NqU0hRclNqSnhGbGpuOHYvdFdnNEdW?=
 =?utf-8?B?U1FrcWZ1dEVUVlFVSzkwcnBRV25DdjI0RSsreDlsS3VEbXl5TnBoU2tHcyt6?=
 =?utf-8?B?cUdVSXlhNkhSTDNDZlBFL05zZ3hUTWJvYVM1YVVTV0xUMkxCNEl6S245dGp4?=
 =?utf-8?B?MWorTTNaNkhqMFlidHFkOHhGVmhWMytzVHdHY1JQOGxwUWwvQndKVXN0cFZh?=
 =?utf-8?B?WkVGZ3k1bnI4cjVoNlFqMC9haHJWTWd1WForaU9qY1NzbEluYjlhWk9hQkhV?=
 =?utf-8?Q?GGYGdsBvwThwSCroKs=3D?=
Content-ID: <50D2EB6CBA9E6544A55A3FDC32941BC9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2c4c46-1877-4a1a-6c0c-08d8f2b44234
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2021 13:12:09.0855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbGBJ5vbCqPvYZgeVGRWMuNw6PVp/rIZckgNgul6v7sR8xQyZbMSjNQQ0hU4vH1W3V3KjG+BHBG9FCppg71lQF4j9LqsvIsRPo+5UeFdTvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_141220_347218_91220AB1 
X-CRM114-Status: GOOD (  10.74  )
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

Hi, Yaliang,

On 2/24/21 6:30 PM, Tudor Ambarus - M18064 wrote:
> Yes, please. Let us know how it goes.

I think I hit the same problem that you're trying to fix, when testing a
s25fl064l. What's the status of this, do you still work on it? Do you
want me to sketch the core patches and you to come on top of it with the
spansion fix?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
