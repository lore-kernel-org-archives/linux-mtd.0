Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69257C47094
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2651160FDA
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 08:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2651160FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3TL28LWTrBV411WgAzEd+8I4HJMhjPAZhopd3S9Zgw=; b=udnsxFGbp8Oym1
	If/luE+hkD2qTFlanYY1m4OM+/bTPGSzbyOjiP1pjYn8tJnPmOMCOfyyhhPcAwWlBG4KLutVZl77x
	7SN3Pl6QBbdhDPkc0maSh1Nu1ycgpZk2QqLBNvzzlkfDhjUxMUhbznHWBeLe8oLm7nVNSPwdJeOEJ
	tcRM784OQXaDtGF2RvbUV8ZcQ0NLHuShcwZb6pEn9hxtwqtOuincQWTLqIdhFo9iVW/siuIar+zkt
	fbaf8wzo2GyIVW9ChwdJzl6XuQ2MVixyahzW+XTKPDhVhlrW4t5lBq5Jbw7rkeMGIeSFbLwbV3WjL
	lzUazSdIOPTCnC1agztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lndj2-00BZFC-Sa; Mon, 31 May 2021 08:56:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lndiz-00BZEm-UR
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 08:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1622451402; x=1653987402;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=piK1XbY7jcBDQj8Xy0QLZptWNmt4Tdfoj6wfPDC7wdo=;
 b=QwGeL1EJWtq1esWCHcRNDq0zFy6ygba5hb0dLJnrSyHHXwJg3GBPwLww
 zxz3hpW/4yZAznm/2Ia5cfvuuc3g8MxnzouHad+c3a4TsEI9GA0J1uMV9
 LayJsU9m4GtlapjCF7OvhZ+W3CCE7j1KqIAlKlaGv1XlTrez89B7YaWlC
 ii0upqaPVyp7Sky3bklVb6jlU9fyBFYYr4p8GVMI0XIQdVtK9p8mE5MH5
 519OF+Ubh5bM097t9Dtssv/LQtmjhpj0SZwkYR4ZW5X8A0MGW5YcNYRJH
 WMMXU0L9qIBQYglWU6ITYBcHYENab2RmWY3txiLQr9iMKTIj3qAaMiLtc g==;
IronPort-SDR: ktdcm5B57fSt3FlykvyEHbm7zE2AljYGs57ySwoqGpcg9r6T496AvARLcC1jd370Rpu4kTpFDa
 v4n57F0P9+mVGYKVLaEGxZPeTiMN6ye+Qqkqd/dyloZO5Mbz4qBPYAr+5ddROVmOGl081C804R
 WaZS5bjThQ/Kdq666s8jbGn087h6ggTPO6c7hvSdHLENEA9uZjfqUtZT/9NxkV6yAC6e5VkN+8
 oV4l3G/j/V2iREnDaUgsk1Q3uZLJv8eQug5v6IztReTi4ur/T3LHv9Q7t+g19GiwCqFbk8YEvb
 N68=
X-IronPort-AV: E=Sophos;i="5.83,236,1616482800"; d="scan'208";a="122957300"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 May 2021 01:56:42 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 01:56:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 31 May 2021 01:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkvQxzaxh1ecxSNqQSn0u9BvXSS98s3BzleQCpSpMSaERJgCf8fUZXCZHfQv5k5uQriEIfnvKacToRyQbRnz0Ms04lLhyM2cfEs7scUTfTZBlhV4hKCFw6wpU7QbXdes0X//fmmKXOLDc0Gkqri8mC9NeC6+0ggDH9Solnx83FDpQ448Kle08qjITO+dJjNi051b7Fp9H1Jf7z0pCa1H3DSRNfgAziKf6V2YVTk3gb6PCOUVMHCpVEnuhI+2ryZ5EjwSOF5OBcsZM84dllDzRVAFRrpt9hiDpitVpNFFVi/seuWvFmOMudHzT7YDAZBZw69EhSu8DeHRFQadLWXeBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piK1XbY7jcBDQj8Xy0QLZptWNmt4Tdfoj6wfPDC7wdo=;
 b=KdQPW9J0Q8xnpg5AoVj/2vkPOk7s/oNJX5dsw9MK7t+vKNJeIz6rlRKx7dj2ihLwild+EAH0AlTXB0cJSUzDPQbVE/xMBx+xaD1ZLWTVTKvVmExmcJn43T+4qrfI3L7VjuqeTZifpcXOWZ7cWQIn8DxCIw1umKowjOtka6rf16CuqwDirVwtvuYLty4zRlAGLM1+Mj3y8LaIkuqCWk7xOFzw6gjfKVWWPiEDXuBW1CeDiaowfhptzKeZd3Y+kPgyxlkBkjDUkCk15m+CaQlq9O5pkge2FRx4fLMKET+6skiOaMs304sM5Poc5EnGsgeehkG9GgpdlRUduvoGLdPN7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piK1XbY7jcBDQj8Xy0QLZptWNmt4Tdfoj6wfPDC7wdo=;
 b=KHO+GVscG1DnShECYhGdKxg8u961+JT3kyyBszuEUUrjS+RUwVN0zdllgQ7jX9niKegr5Tvwjc8ZAmK3L+KUAkZCDpNPvCa5HzEKkHHGgVIUSrrnXTpwIuZSvEEZr/gn8TcjyBFxSacf+3FAv5BJdtKocri9feoExsREEJOuecc=
Received: from CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9)
 by MWHPR11MB1840.namprd11.prod.outlook.com (2603:10b6:300:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Mon, 31 May
 2021 08:56:39 +0000
Received: from CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370]) by CO1PR11MB4865.namprd11.prod.outlook.com
 ([fe80::1c4:1014:a541:e370%4]) with mapi id 15.20.4173.029; Mon, 31 May 2021
 08:56:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v4 4/4] mtd: spi-nor: otp: implement erase for Winbond and
 similar flashes
Thread-Topic: [PATCH v4 4/4] mtd: spi-nor: otp: implement erase for Winbond
 and similar flashes
Thread-Index: AQHXVfre5CE4GzTJPUCkLlU8wI3quw==
Date: Mon, 31 May 2021 08:56:39 +0000
Message-ID: <2d04a7f5-c99e-3177-5a1f-debe49f51ef5@microchip.com>
References: <20210521194034.15249-1-michael@walle.cc>
 <20210521194034.15249-5-michael@walle.cc>
In-Reply-To: <20210521194034.15249-5-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59fba66c-600a-4885-044d-08d9241200e4
x-ms-traffictypediagnostic: MWHPR11MB1840:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1840629A9AA81F71909E7258F03F9@MWHPR11MB1840.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F2giyjrtueOCNJI3EuBWR2lyYOOfoO6lN8DwmFN82FsUzUuICNvrviJfC5uRoLRzO4YnDjW2PYqB4L7dzskkcS+hEARF2H+YpEWecM0JyTLbAQHu1/yILfCFaBd/oE0F26MALv67N1LzaMF/AqGnFAhRsrvr5RWZMLs1ow4Lb07nmyLWN/EOIBodzoGMHqEkHzOaIgY9KFY+IZJnoLY+jaomPoUK0UiSZG8CbDvJDE/08CO0a/5krN9sNWCYuRlAH6rbJ6Oj/T5ng4SMxFQnDlF/9eoqsnBtSIkS7sGeGjwZlnBmaWJileyOAUxtCvCym0SZBFzoE0qIHM7kOmx6BPj5MPp3MyB3Xyqnv7iQidHy8bix1NCbnu+U2oEQOVPYCcGbiMMTeMqt60SVjCq8aKhIIsk//EZ9Y8POtMv4E50Y7PBslFOiiliyTcn7D4dX37NGiWlC+hhxERaO/+f6nKbZNoqjL526/V74dADn1yBbq41ERUCr12r65BmbsnTgFfdUGKEnh7YpQvLZX+2WB/4uS/bH2T3oTB5mxtuYFiJlwv88C9FSjWXDdoeUZhqcgZi+xRsPsQfe+vKIk42eHDf4l3bsdiluVe/96yrn26J7v1Qk1nJ63VqZpjf8EHJcTWL+AvJjcrclZIEdMW6MOgwjseKZf/WZOjINYWQhSfn+cqf3L3nQfpmsvtU2ROQj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4865.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(366004)(346002)(396003)(76116006)(66946007)(91956017)(2616005)(66476007)(54906003)(4326008)(66556008)(6486002)(66446008)(31686004)(83380400001)(36756003)(6512007)(38100700002)(478600001)(26005)(31696002)(53546011)(6506007)(5660300002)(2906002)(71200400001)(8676002)(86362001)(110136005)(64756008)(122000001)(8936002)(316002)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VzF3QVlhWEpLN1JEWWphdG5pb2s0aTd6YWY1TGFKVFo3Z2VLSjdEN1E0Q0R4?=
 =?utf-8?B?TWlOa04rdW9oWjRaS2Raa1ZyT1lvL1Q1N0FXcFNLNzJyaUFXekRZT1YxWlJZ?=
 =?utf-8?B?RFFTbWNUME1QQTFjSUw5U0I2L21zMGRHYnZVSVFBM1VvTFBlZjJ5OEpZaDBl?=
 =?utf-8?B?VWp3MWE2T2l0QkhsYU1VaFZydlAxYnZ0bng2MVdPV2E0ZE4zVjlSZGZEOWNp?=
 =?utf-8?B?Y2xuQVFhMWdjbmkxaXU3Nk1XZDV2eDNEeDVQb1l0cTZJeUE5anhoUktzK1l0?=
 =?utf-8?B?VUJYYko1VU04NmNweGsrWjFFQmlnUUZHL3drT3M2TGhmdkpQRXNYbk0wWEdU?=
 =?utf-8?B?M2dZeUx5QksybUVWK0xkMnB2TzdDeDVXbUdFajNoY0tTVHZ2RTNuQk9vNU8w?=
 =?utf-8?B?SVg4UzVyRmlCdjhFM1AwWGdwSnRJV1p6bU9RMFBXTHFCS0lwRFU4b21ZSXdC?=
 =?utf-8?B?eEo4SkdoSHhjYTRERFFEQkNaT1dLQXA2dWk5Kzd6L1k1NUU1RHZoRTBacG9J?=
 =?utf-8?B?NklqYXZidWdWeStoS2crcWErSEpoZmQzazZhUUE2SzlxL1J6M2RlUUxaQTN6?=
 =?utf-8?B?T3hvalM3aUhxN2FaUnhOVVdhMTJEQ2d3RjdpczcyT2FYcDdtMkFrSVFXQnM3?=
 =?utf-8?B?RE14NlhFOXI0UUpZa2xSOXdSbldxSUtGVno5eER0cFlTTjNlNEdVRE4vcm05?=
 =?utf-8?B?Z2tzVzdIUUYyYU9yeVUvOHBWLzVxdHRxQ3ZheUdUSzRRVU9tcCt0VFBmS0NU?=
 =?utf-8?B?M3NLVGdnZVBpVngzVkR1bURna3EwazF4VkwzWW0vRnhXNmVFaUFMeVJVcDNl?=
 =?utf-8?B?amJaNEZ1VjluZ29PZ2E4dTdGZURUUTJCdmRGZFE2c0lKaGZqKzdkQzgzZTNh?=
 =?utf-8?B?V1RUVnBka1UxbjdwaTNMckg4U3drdXlaaXZpTHJFYkorS3dRTFNyZDhjR2pa?=
 =?utf-8?B?Z1FOT1VIQVo0ZjN3SXoyTEtGb2p6VFRKTlBTZ2I5T1RQTzFPNCt4b0dQVTl3?=
 =?utf-8?B?RnZqenRrSHFSajZpNWtDMWt1LzExeTc5N2NDV1ZMUzZmcFdMcWw3V0JsbXgx?=
 =?utf-8?B?UEpBRjE1T2dlUDhTVGlGcm9NTmdxZ3psQnAvYmFBOHlHN2pqVGhOeVlxRjlF?=
 =?utf-8?B?eGY5U0xFeXBmVnEyT0I3TFZVd0ZuVCtjQW4yVm1NUDc5dkNuRmo4SUc1dmty?=
 =?utf-8?B?MnY5akNHYzBwbm15UXJBSTMzUWVkVDdBc0FtbzlwaUJlUXNKV0E0RlRKMlZY?=
 =?utf-8?B?ZS9VNG5UcXVpd1IxbWozc2dwVUlPbEFmRmVtM2lYYjNGdW44YXBUZEpPWGRL?=
 =?utf-8?B?a0tPMHR2WkZyYjR4NlpDK3lqMzlvUm1QTmkzb3ZURjE1aHFMdmYvQVNpSlJH?=
 =?utf-8?B?UzBKSjFOMzJrSkgrOFd6WGJPdXo3b1JyVWRFVHIvTGNMcTdiSTZqY2lzVGw1?=
 =?utf-8?B?d2FpTVgyVkEzK3Iwd0FIcjRaUXVQb1JvYm00aEwzcERwaldsaHVaZXlpVEx4?=
 =?utf-8?B?MlVNUENqcnpTa1V4SVJUdUFRYTVDVFdjSkYzb0hKdWlmTlNJU3RxdC9COEg5?=
 =?utf-8?B?eVlVVE04N1BsQ2tFRlBIK0hvVGpMWk4rSjA2WFh3cjZ2bTI1a0NHSFVlb216?=
 =?utf-8?B?VmN3cEt1RDVLVFN5c3pFRStVTCs4bGVSM2d2TkR1Tnk3UWhvNWFvek5VclY2?=
 =?utf-8?B?clNrVHNYRS9WbWNkdjNxMDhiNTJENjBrenJJM3E3MEcrdW00SVpsVXM2Z3B5?=
 =?utf-8?Q?UKPvoZ9YvLIuonGF74=3D?=
Content-ID: <5D89BF85BECD2E4CBAE0780F067FFEDB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4865.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fba66c-600a-4885-044d-08d9241200e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 08:56:39.2162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JcH4RD+4M7NUXXr/zA2/Ck7Xprxbr7vsNoD3JaLJKtBOFHkqQBjHVsZYA0tfNzrUFRjIZqD130MUsWI+0nx1fC2BghgbjMQAxJ5Uxd2nTss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_015642_020961_CFDFA31E 
X-CRM114-Status: GOOD (  20.49  )
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

On 5/21/21 10:40 PM, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Winbond flashes with OTP support provide a command to erase the OTP
> data. This might come in handy during development.
> 
> This was tested with a Winbond W25Q32JW on a LS1028A SoC with the
> NXP FSPI controller.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c    |  2 +-
>  drivers/mtd/spi-nor/core.h    |  4 ++
>  drivers/mtd/spi-nor/otp.c     | 83 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/winbond.c |  1 +
>  4 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index bd2c7717eb10..9551effb6a44 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1318,7 +1318,7 @@ static u32 spi_nor_convert_addr(struct spi_nor *nor, loff_t addr)
>  /*
>   * Initiate the erasure of a single sector
>   */
> -static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
> +int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  {
>         int i;
> 
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 28a2e0be97a3..9398a8738857 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -207,6 +207,7 @@ struct spi_nor_otp_organization {
>   * @read:      read from the SPI NOR OTP area.
>   * @write:     write to the SPI NOR OTP area.
>   * @lock:      lock an OTP region.
> + * @erase:     erase an OTP region.
>   * @is_locked: check if an OTP region of the SPI NOR is locked.
>   */
>  struct spi_nor_otp_ops {
> @@ -214,6 +215,7 @@ struct spi_nor_otp_ops {
>         int (*write)(struct spi_nor *nor, loff_t addr, size_t len,
>                      const u8 *buf);
>         int (*lock)(struct spi_nor *nor, unsigned int region);
> +       int (*erase)(struct spi_nor *nor, loff_t addr);

maybe better:
int (*erase)(struct spi_nor *nor, loff_t addr, size_t len);

>         int (*is_locked)(struct spi_nor *nor, unsigned int region);
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
