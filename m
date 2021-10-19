Return-Path: <SRS0=PxVx=PH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 701A5C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 10:17:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CFD860F59
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 10:17:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CFD860F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDU9N2FJzSZXLYrQcMhSR2FyVeWb/ZFfn2/62lhrqMY=; b=c7mtz6n8cFuNdQ
	d7Tx16U4wRtYpnNNhJ5W80tdKlaCm8BponkciMulTVVi9wKwyqVKvTHYsj5FkXnzJ7RqZHqB71hub
	CvDDezYzdsw0TzYJ2bjnlN0nQKOYJ0SxOEukkOhdC0hdlxH0h1pRf0MgAaB85fKo9/ixZcc+xXZjI
	XQsY8zHohRCxeL+TD4qKs+wA53PTbiuKr7c+EB/2lqmzfVt4pxWzJMqrLVUHrZETYUaRxmsoHU5Ek
	CgA3iKf7hwMFBJejQJ2ezHfawFahpUL3Af1hehXywzCwf7bbB++LANsUViDthACt1G1nHF1MPUo0N
	NXq8dm764KD42d5bBAAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcmB0-000mlT-Ba; Tue, 19 Oct 2021 10:16:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcmAv-000mjb-WF
 for linux-mtd@lists.infradead.org; Tue, 19 Oct 2021 10:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634638614; x=1666174614;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Gy/ToujxZQ21iAd0Q1wZ8djn8qJJZvi2e/Md5VdwRxI=;
 b=pbDVmmVz1LB3q6c82NZGKR/rtbEYcdauZjVeA30rQwMhWdTKK8D2Q4aC
 pXiYi9R1uLdmpFtGNJKJ8HKuZwc5cN0VSsJkSWE7hJ3DZ7cNzqiaHxRnc
 ghQVP9MY5aCx9Q8wRlS1Wvy2kJOBRLbAWETIGNbPsF2cxsdRKWzA6ewj3
 t3jKfiP8TvvvNZXXPA2YMqDKGzqA0c6qWKHfFub7O4I6R4NW3iNiH6sza
 20eJ12ajWyISB13acfC+PAaqvSuRtKhPjU9cVg5u1B6QHuJ8XSTLsKhpL
 up7BdZRBWVueTfT5KhUVn4oh6jCyBH2YlIOV0QZxfebeJy5pPrueXWEK4 A==;
IronPort-SDR: psIfeJDmU6MvOCl6r1psVqXgpmsM21XVirQdyHMmD7afDHLob/bR4bySjmRUXD9lgweIdkx078
 l18SKbC3f6cmDLgGf7gGmfWBiVJYHurvRlKARK842zEHYgkQ4teVVB9HtiS4aSJeQQDAmIpy9+
 CUugTMc8zrRiL9PCLWocexDuIj3pqMbkdptAu9Ww6bYdwKts5DkzCRBFbENKHzpvXWfGPhUgdA
 g4twczN6PmG4JyHUvwAtdxctl+LFBmwD/qH9PAv/DGYDK8LHMR2b3Ees00vIkLJ5Gf7IShk7iY
 fxon/19jf2e//EFFOYS1TDyM
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; d="scan'208";a="136085614"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Oct 2021 03:16:53 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 19 Oct 2021 03:16:52 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 19 Oct 2021 03:16:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dshpt70TedB1S0Di1RWoRhg7Bv91gxls+rWwilQDZad0V6Tuugeo1f9hAo8YOhWnIiVvYKk5arG+bUjDCDaUywpSGDjzoNw/M26nTeg63agaSLss6y8LWB/Dj1Bv1CFGGmqJSJ9uO25F2xTAmdJG4Ve34jFLbfmxtWJWxDxAvceXBVp2tWEfrqq4gP7RiL+Og6+EGdEcgBw18QXJQ2NEpGArx/w3SixZS0AuHWvbl/iPwRxjpfw1SiZCkcpRbd4hv9DSCqFYGKqpLlwpcDBsLJVxVmzlR8/CZfusDHGYvuEJGljJCNEproOF6jYTAp8W+P1Hfi8PxoxRDndi1wUv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy/ToujxZQ21iAd0Q1wZ8djn8qJJZvi2e/Md5VdwRxI=;
 b=YhTRd2hnwMbYPKUW/ZJw5drKXCbXyg6WUuuXk/MtvGpfmkcn21n4BHm2SP60eWHqIYNJ7p6CA+GYG2plbcgOPNVEuiJmob6kRA4wtyuSIkAjhXbwufHqW9MaZigM50JPNezhuayMtRL3Iu4nL8gQBlBMW3nH5WtUkP1rduFRrxaUCA+TDQbuAF0GpAKB7WoK1AHvEA1nFsVtfrp4Qsy4wfl/SiNIVa3MZumAKp7IMiQRa8iXH5kMYJK3NzDXrWD7/PB2abSd2HVuv2RrvqBRaeFu4qk7HgAV89GmBA6khHR5rl4DwpFXRkiS34C8lnnMy3fWbNxIcAr8tmtViGb0Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy/ToujxZQ21iAd0Q1wZ8djn8qJJZvi2e/Md5VdwRxI=;
 b=hDHJyRMVtLYq4raUA1ZdDra4G3pprRfJFl1Fwyn4s0ES+3jAJu26F0qVnq9s9eV2IAPHqXVaAiez4SypdPcGwQsdGtb9NkKcbLUdpXnMdnM+lK9bZGHQmjBF0dha654Wm+rUL7/owLo38OIkLNRybckTaQbV2JN5mPHIFavMwpo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4687.namprd11.prod.outlook.com (2603:10b6:806:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Tue, 19 Oct
 2021 10:16:51 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 10:16:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <caihuoqing@baidu.com>
CC: <michael@walle.cc>, <p.yadav@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: hisi-sfc: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Thread-Topic: [PATCH] mtd: spi-nor: hisi-sfc: Make use of the helper function
 devm_platform_ioremap_resource_byname()
Thread-Index: AQHXxNJvvxZm1pbEV02BwEKGxrmaDA==
Date: Tue, 19 Oct 2021 10:16:51 +0000
Message-ID: <b01790b1-20c7-f016-8bce-af5b00cda683@microchip.com>
References: <20210901074259.9683-1-caihuoqing@baidu.com>
In-Reply-To: <20210901074259.9683-1-caihuoqing@baidu.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: baidu.com; dkim=none (message not signed)
 header.d=none;baidu.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8cce0e8-244a-4f1b-69c0-08d992e9918d
x-ms-traffictypediagnostic: SA0PR11MB4687:
x-microsoft-antispam-prvs: <SA0PR11MB468725DEA442B2D9D598979EF0BD9@SA0PR11MB4687.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:252;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VRDit3O4Rtwyl7KGUFV+tTm6+cbFXIKfaw2GZoWYs6LF/8Cp3ooxzRomgdeRb2kVOSgNwEBRE7Z4LU1lAUMyXprtXSvAmZQldQdgfXDnWrohwP7DaQs7J7HodEnuTghK7yq313ipBmErc+gKBG9UfHQn/+cF7QAs0k3SvWptfWWJwJKuMA5P1iqwwQcCukwMyVM3+DNgMCsO2gpTQ3rTcYc3YmAjyJKFvI0t2KLckwVccuknu3LhTR45jntcYIQodaUpHeoxUAxLCRXT7HpV55VMCaVwiJoVD6/mQczRkA35uUOxlILRSwV6G4u+tPCuSGyRkmdO1JzaS3X36kfQEd2UJokjfZJgQKzDgYoPNw610AkkojYqx6KCFnnY7JWKPHJ5UaVqjzW6gXPvd2n22pL8cysJ6vrfylUR9FnuMSGgz3iH0zg3bdZpzE8hwMYBTKity3yadaidnlmGnGOA5pSE5eM+Jw3fCNHTNnYFQwzjHZDj4zYIrSzs6w+jaJxmYANB49Z38JHuAKRFqK2p32wh6HVjfNROBStyUbPaHgZ651RbbmJ71sPp4sV0nl+5XOspGJHDQ9cx2ngtJcq6PYjAmrP78NvYls+xo3DITcsxvZu0J4yb22nBjxnAsWGKuIIgi1T7SzzUQx0x3vl7lk02kX8Kk0j94ZJX3hNEDUGK7cVX62iG0kxR/7IYWg1q2NbbOWYL4qTUwBbQFMjyclAbzxXHidcgpw+X10J7N20IfMoWXdg8fYtQgH+ikaVlMjPyQxhZtcQLIjCoTcaqxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(6506007)(53546011)(6916009)(6512007)(86362001)(5660300002)(8936002)(76116006)(91956017)(316002)(83380400001)(38100700002)(26005)(64756008)(4744005)(508600001)(66476007)(66946007)(2616005)(2906002)(38070700005)(71200400001)(4326008)(31696002)(6486002)(31686004)(54906003)(122000001)(186003)(66556008)(66446008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VnBTenNEWU5MUnlSNEJHbzZQRnAxSlFXZVVHKzVWcm45ZytDeVVZRDlocEk0?=
 =?utf-8?B?alY3SDJ5WlVhUlFmUXJGaWdJU3doUzBkTnlMTGM2UndSU3pDMStGbUJYd3lz?=
 =?utf-8?B?T0tEL1l1OEJaVUsvaTJFV1VHYXVmNFZWMzBxWCtnWVVJK21vVEs0SU1QK0ow?=
 =?utf-8?B?TlMvY3RRcDNmZDBFUXNlN041VGJiK0hQcGFzdDFTWHJ3M3R2Vlh3QVduZks5?=
 =?utf-8?B?S21nSlNRelppQmNmeGsrNWtMa3JQcGh4REd0OFlUVkJtSlVadkRBVy9MMFB0?=
 =?utf-8?B?em1WY1V3WGVCcEFhYU1rbG9wd1o2em8rN2hPOTVuTGMzc1VmS01kSkRRSjVQ?=
 =?utf-8?B?OUxINVZQN0FqK3g5UitZOStuK2V6VkJncW5Vb0wrTkZ2aWNWY2gxVTlTVGVU?=
 =?utf-8?B?NlJOT3p1cVd0RmMzUmJEbHBiYXUrV1ByVWJHLzQwcDBXaTNpbzdPQk9TRTIw?=
 =?utf-8?B?OXNVSUdLUC9oSHNTWDNWcHFydXRMWWJvSzJzQmdhZ1g4TzhJdTRVOXVsUFlQ?=
 =?utf-8?B?UEVSTWFNc3VKZjlNclZQczhkaHdqbFFuVHpLMVRmUGpLVEluRGNGcGl3ZlFT?=
 =?utf-8?B?R0dJK1VkWk1pRXJmSWR6aFdpSEhoZk5uY2h0Z2dFL0RoNHQrcERUc1N5b3dM?=
 =?utf-8?B?Q28xaTZvakFaMm1xZ1ROZ0lDZm85SlV5NllyVS82d3lFbUt2VHBiZTg0S0VB?=
 =?utf-8?B?bzU2MndPalQveG9NNEdiUU5pdmNoWnZKMys2WFF4UlpGWkMvNXN0Q3M1d1B2?=
 =?utf-8?B?NXpibkhaZmlST2FOcEMvdkFsUGVFOHg2cjZYZlFVdmVvMnM0SG1vZ0Z1QzFl?=
 =?utf-8?B?ZXBMTnlMVlluNHBOY2hnazduWDVYbjRJMlQ0OHhQTlBrU1JCdWp4Zlg3N21u?=
 =?utf-8?B?YXNoeTVLT255WTFjVmRxY212QmJrY1o2TVZIRG1oWS9yb1dGVjZNN2ZFZTlt?=
 =?utf-8?B?RU1kNGU2Y0ZHY2VvN1lQcUt0UDBkd2Z1K25Sd1JXTkE3dlJXOCtSRm82bFVM?=
 =?utf-8?B?V1dZZXlocUtnWFc1UFkxLzN1SlRrVzJWbEwzQ3ROOWJobGpTZmw0cEFnbzlC?=
 =?utf-8?B?VUlJZXFRM0dpVEh2bXo4cElIa2VVdGJGaURLUlRFVHNLelczb29ER0JubUNC?=
 =?utf-8?B?L010cXlZRDV5SUYzRkNBTnVtbzA4WXcrWDJQcXNvbHVhL21YVTREcmIyOVI1?=
 =?utf-8?B?RXlVWndxQnBycWlVQVd1b2ZoK21DUGdqdUx0Z2NCNDQ1Mml6NnV2aXcxMTl4?=
 =?utf-8?B?M3dWL1lVdkJDOTZjNU9ybG1Wclg5R1NvT1NFZGlqVVdNOU1rQkduYXdMb2gy?=
 =?utf-8?B?WUhFa2dTOXNsMU5QZjVVUjNLRW8xWjdOWmUvbHZ6MTBTTU15VGoxeUxIVjRt?=
 =?utf-8?B?Q09raDlXaFhOM3QzWG5XMlNMNnBPd2F4UnZVQVFXMFlEMXorTjAyRzB1dzFV?=
 =?utf-8?B?Umx2RFhQVk1uSUJpQlh5TjlQV05mMERMRkt5SHdPVndVSUtlNjZtbHMzNmJO?=
 =?utf-8?B?ZjJNckFnM3RaOVI3NTB4aG01SVVDajltZ1ptbjVDUDFBSXRyK2dveUtyVlpH?=
 =?utf-8?B?R2FsNyt1OXh6NXBZMkxyT0NzclVIRGZoMVNuMDJzeUc4S0QxeTJxNmlqM3Zm?=
 =?utf-8?B?MTdNNFhvYmJTTzZhNjhJanE0dFhndzR3dGpiaDFFUG1MQlVXNGlOMXI2ZXln?=
 =?utf-8?B?dkdRMWhHSmQyQzJaZFlQZEgxb3owRDdSWGx3cXNOcTl6S2ZwcFNMbnUzcU1W?=
 =?utf-8?Q?p708YtvtZhhMOdpyiA=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <04243B28EAC2F54686D6639E82C11B78@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8cce0e8-244a-4f1b-69c0-08d992e9918d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 10:16:51.5500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEXx2rFSwBnReBgupNtWaM68EeUFBC/XFPjJkjgfTSN3PTQnbPyZsf83pqwoZdJWvFcONkezPBwacmEZJHbutscdb1mPs0gqbWDEhlN3+h4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4687
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_031654_171068_9EFA8501 
X-CRM114-Status: GOOD (  12.81  )
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

On 9/1/21 10:42 AM, Cai Huoqing wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 

Applied, thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
