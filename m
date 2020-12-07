Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51B5C4361B
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 17:27:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6591D2388D
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 17:27:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6591D2388D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O0qCZasNc+NWAkg0iaH5rZX66wMzDw4Ukw0YW54jz/w=; b=QyFaiTg04p/JoXTYQyiYQfEjs
	/M6zB2RMtJd0D0y4Da3AXDwXNPwlqSuga7PPMLiIC36AS4avW+eP/jHKVR4OH4ENUSxP3u+4i/qgt
	lj7W8hp+UJctdXmYdK7R/hqXpPLYLLJoWIXND2FoIJ1JckKY25RDY2sIh4GkE1y4P8bet1UlCRBjD
	xkCgYEowjVIqOYd9YEKulfxoSL3va4uKHzGPaeNvs41ZMa9EfZoTzs3zfcDwIIUmPcVb+41fFXjB7
	imQv9PYIXTddV01z9tJz5wxPgv/Q6hY/y5xoBWJTfgma0n6PfKsQ1FtN+JEz8HpnRzbD7hmbjPe2o
	XNtynpBIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmKI8-00023I-Lc; Mon, 07 Dec 2020 17:27:16 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmKI4-00022D-I3
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 17:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607362032; x=1638898032;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GaPjgrrhvr9VO2logPYb2TtfMFqtQc4wc2xmo5xzGXw=;
 b=qWqSm+/A0p4hhVsB1WtWVw1ga/UKE3ItoBfWCNV5MPSTxpnOSbnpYZ74
 z9WDQpPsDqNTyHcJYqvLPQe7KKMGBsSgi9f2E6PML/OleibKbgaCJFaRP
 W6zFHnBUP3o/xtVVeHR3XHTOYbBqAOTLpL6aFZLWW5e0J0ABfPG1nb59M
 0jPub7hFPHbWXajBmluzFdVJlO7/yzO+tsnxDQXkuiBfPtQz0zewDQcXH
 DXDCDaCpb3YhqqTv28PmzM6lLMVu+grbqZ+T7F/iqshPVPiyttaxQkqsO
 S4UUtD75LXrunhuPQRZ7Ys9gNmtJJI36IBcxwo17asfzj6O7AYSbs0WPZ g==;
IronPort-SDR: XXKrXxYd5wglcYCU2IYxYibMUHf48nDhIdePJUjzkOT0JsG9nBwr7K1eT1j0VdmNLbFxhVIMou
 uZij6D2k03D77kk9Ia1RsxIBqaVT+nQG2DnLU+hI3nL3bzBlrWdocSlm0MHUsi9KONHUiUyqL1
 rZx47bat4ww2qjSNO6QEREZ+KHI5FRwyMKm2lhUyQIVXjQFELHSD5ziDbj+jUTZ+PiZKgoc9V7
 bDUJMishvPKm2DPK2Ohv5AtG7XrxcWfxJsCp8+wnXDvlBcspGHwKd8+YiZEM1yhMVpRl4Fib6e
 pmo=
X-IronPort-AV: E=Sophos;i="5.78,400,1599548400"; d="scan'208";a="96160887"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 10:27:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 10:27:02 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Mon, 7 Dec 2020 10:27:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8FZ2gtKN3UmUiz4bRu4QyAz8PbYBkr2qF5baqSa3ur5KLyNdheGx/IMoG8YggMfpX0gvvTIdP3/8bQNUBlVjEkMhvdM8dXYs1VmFRQJFhMArXVmcbq2i048SQIYSVUWifWk9AGYlGjzXe626pF0ePVkwDeHUHW+BmB4bfPKREjRavkPFt9Dni61udfvdkGswv4kf8O5NkE8vJCO9KPT5Bo/Ejg06i4oD3jW5hWEQ6bJ15+sfb04dzlpjTLCzKeNLipZQaUf4b0K3FSUJfIsOmMUl5wo2L4ZWNRxj9YtSTm3MobkFhSyHHK6xjmxJRyV8rvS3bK6GCNTfOXmP6ZE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaPjgrrhvr9VO2logPYb2TtfMFqtQc4wc2xmo5xzGXw=;
 b=RaZOVR+qfOe5GBOYYR4bpTcqOdVffKUvgqiRiOQpqpwF30BPI27uUQiDXyLziBWAhOV03+4i6GVSsqS7WNiRH8x6joWuFuK3a/qGI4cmKMVChA5INIhsJQSg9oOGjNV8zYQUuZd8Psuh7FACWT/Tg9Ko8jJD82tqJUyy7PMXjcXjPkISbkvyg1j4inHcxMMKt7kzhRZ70KbkmdNfGz66ZOIIAGnyK4Jfp2QHLTbfrE+yXoi+xWth1InEe4M+qWIIrnavPV41nPinarfzcyGlgyY/yNQciQN1E04wjOtaOmX6krbYbWfVevx3MQtP4dJm3MLIIZg0X9eOhKqENx7xAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaPjgrrhvr9VO2logPYb2TtfMFqtQc4wc2xmo5xzGXw=;
 b=njWgfDoUZy0++JVH2fCER6pa5mtdEiLEEaofKATVG9aG0mrY97oVFO3dO77yE1ZY1uBnS3y/QtfruO/zNc2H+7+BNKMJW2HO3PI750z3OxLCW9RfcaMV4Pb67nr+dnQo1DmesNev8dm7MpV1wav3uLVj+a676NP0HJnnradtRwQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3295.namprd11.prod.outlook.com (2603:10b6:805:c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Mon, 7 Dec
 2020 17:26:57 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 17:26:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
Thread-Topic: [PATCH] mtd: spi-nor: winbond: Add support for w25m512jw
Thread-Index: AQHWzL4p6Et9E/t4BEqmXYdEaAmrdw==
Date: Mon, 7 Dec 2020 17:26:57 +0000
Message-ID: <482d020e-bb1a-cf00-3f05-2bf26694ec16@microchip.com>
References: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201016115549.31369-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [5.13.1.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b91dfc0-dd7e-4e84-9286-08d89ad54c9d
x-ms-traffictypediagnostic: SN6PR11MB3295:
x-microsoft-antispam-prvs: <SN6PR11MB3295A6A07047886DB8ED41C7F0CE0@SN6PR11MB3295.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:813;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JqxAJJzsCTiGHiSj97JhWCqP00f1BbMFFKTLWNVznUZlJ/Ax6R10ed49+fOfrWj8IABQ1PJW7asgA507EmO/gqw15wsyXBpHgXtxXE7/AmyClUpHL7G0gl7/er7Pg+/p3b7aZI3REA1ovki6HomqEypn+fE21m5Bj2teVJIxCezCMdu2xFWpz7S4hgsW1j/IfALJeuZoPuIy0G53dfd/tVf50ya32NuUlO3q+SNhxW2RfHtxQu5v3kVsKzH2IQuQpjuR2NPa/JgEehspTecpsdsaPOXFpiIsGimZxunz5CYRiIqUFoL0GCr0EydOQDOa3h8Wtqn57hvfaarzBdmKlOX3iF1byQHaSMnYjgkqfJVYVWECHsO3DnttVAq5twK+6IpS5lBOuNzNnP0wqp2ndVVMsy7e2wiJu6BK/010gcxSgb230rYzmXFNXyudTytD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(136003)(39860400002)(366004)(346002)(396003)(5660300002)(4744005)(6506007)(66446008)(64756008)(36756003)(71200400001)(186003)(6512007)(53546011)(66476007)(31686004)(4326008)(66946007)(478600001)(6486002)(66556008)(2616005)(76116006)(316002)(54906003)(26005)(8676002)(8936002)(110136005)(31696002)(86362001)(83380400001)(2906002)(138113003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bEFLTmo0dlJlYkJ2NWpzVjhjZzhPSGpGNDhMRGw1ZUx3Z09kMFlSbUNTN205?=
 =?utf-8?B?Y2dSb2FNbC9JNnlVY3VVTTZJYVplblRLSEg1Z3JrTXZZSzVkOU90bVhOYWFY?=
 =?utf-8?B?a1oyK3RqSDJKaC90UVFCSWI5T3ZHRzdDR2k0MUUrZE9GMStLRGZZUnJ5R1c3?=
 =?utf-8?B?UmhCN0pZVUZpYnkxWXVRSTNNQXVBV2hBKzlnNGxpRFQxSGlwNndFS25xRWZE?=
 =?utf-8?B?dVZaV1F3Snl0bWNYWHduQ2R3bXZFL2hyMXgvckJtWmxETUw0M2UwRDkwZDdo?=
 =?utf-8?B?VTFiTCtZeFBWa2UrcXAwM25VSXlCYlRHd1E1OEVaYXFCQkI5V0IvTFNEQ2pm?=
 =?utf-8?B?VGRRSTJQVzVZOXVBYmF3Zi9PRUxlUGF5YWRwR3FKZlltbDVKMjdaSUJsQUVK?=
 =?utf-8?B?b0d6VHA3UFR4aUk3UXdKVUJwRGVJVW8xWTZSQjg0aEsyc2xJWW8vTnVNWm5E?=
 =?utf-8?B?Q041aENkRUZxWjdHbzlnbU9iS00xUjBnY2JwVzFZM3YyVzRMZlJZZzV3amEy?=
 =?utf-8?B?RHp1ZEdCR2lvT3FtUS9hZ1dWNHZBdzJ5S3JaT3VmRWRWZEJxaUcrdE1tQSti?=
 =?utf-8?B?c0c1d1c1NzdPejRVNCt3SVgyZGszQ3loM2hxbGlYenE4VFBOT2ZJV1g4dkRH?=
 =?utf-8?B?cFQ5RW1JTXhtT2NXTzJqaCtHb3puK3ZWaEtuWDdqc0piWnl1ZmF2cnZISVMy?=
 =?utf-8?B?ZXIxZXBkN2I0cTZHYmQxM09hNi9jQ2VFblNjUUlPeUV2YTdaU0VwbXZ6Rjd5?=
 =?utf-8?B?blhCb09aa2syK3lGRnMxU0NVM2VJRFpkME5IVDdjZlIvd3h3cE4zbTU5REQ3?=
 =?utf-8?B?djNDOVhYY25xZGlLRDNxQjJsWkw1TFVqNWVxV3IwQm92ZGZtNnVFQ0hsWEx6?=
 =?utf-8?B?UG9NMG1hVjB4TzZFS1creSt2R2ZMQmVSME8rQ2VBRGRCYVlYbTNTTTNlT2wx?=
 =?utf-8?B?RkhrUC92ZG5rK1lHTnVHUzhlNkVvWTI4WUpobEt6NVFVNEFxdmc2UmJBbkhG?=
 =?utf-8?B?OGZ3OVhXSG0yUEQ1RFBCL1lvYzJRZmlFd3UvTEV3ODBTTWxKTjhnYnVvbDRh?=
 =?utf-8?B?U243ZmFXUEpwd1N5bUl4YWljY0FqZkJhL1kwczl3aHAwKzVHZFJwZGVhWXVl?=
 =?utf-8?B?VG9iYTdHWW5BTjVJZ0JnS2YzUFdlWVB4emttekZLcmtHaGZrY0xOQ1pJbDAx?=
 =?utf-8?B?TW1nRktINUlsa2ExWXFnNFBPZEtyYW9nRWtjQWpTSGUzK0NXaWYxQWtLNWlF?=
 =?utf-8?B?Yi9vbGdNZGt1SkRFYS9Cd2FtUUJ0NWtyUWpMaGdLSk9hRTNsZS9LMU9QS1c5?=
 =?utf-8?Q?Ybl3scsriNf/8=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <60C2EFA5AB54674FA43D90F084F73861@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b91dfc0-dd7e-4e84-9286-08d89ad54c9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 17:26:57.5926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdAn2o64iz0AZprNpFnIhFVMGUCoylETVaPLTlBu8Q7//d34MFgzuqKwieDP6o7q+WvNy9QTfMZyGCT8cEIePpDOaB+ydRrIi/LwFNLGsDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_122712_902598_9F3551BD 
X-CRM114-Status: GOOD (  11.17  )
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
Cc: biju.das.jz@bp.renesas.com, prabhakar.csengg@gmail.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIExhZCwNCg0KT24gMTAvMTYvMjAgMjo1NSBQTSwgTGFkIFByYWJoYWthciB3cm90ZToNCj4g
RVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBUaGlzIGNoaXAgaXMgKG5l
YXJseSkgaWRlbnRpY2FsIHRvIHRoZSBXaW5ib25kIHcyNW01MTJqdiB3aGljaCBpcw0KPiBhbHJl
YWR5IHN1cHBvcnRlZCBieSBMaW51eC4gQ29tcGFyZWQgdG8gdGhlIHcyNW01MTJqdiwgdGhlICdq
dycNCj4gaGFzIGEgZGlmZmVyZW50IEpFREVDIElELg0KDQpXMjVNNTEySlctSVEgKDIgeCAyNTZN
LWJpdCkgU2VyaWFsIE1DUCAoTXVsdGkgQ2hpcCBQYWNrYWdlKSBGbGFzaCBtZW1vcnksDQppbnRy
b2R1Y2VzIGEgbmV3IOKAnFNvZnR3YXJlIERpZSBTZWxlY3QgKEMyaCnigJ0gaW5zdHJ1Y3Rpb24s
IHdoaWNoIHdlIGRvbid0DQpzdXBwb3J0LiBJIGd1ZXNzIHlvdSBjYW4ndCBhY2Nlc3MgdGhlIHNl
Y29uZCBkaWUgd2l0aCB3aGF0IHdlIGhhdmUgaW4NCm1haW5saW5lLiBPciBhbSBJIHdyb25nPyBX
ZSdsbCBuZWVkIHRvIGFkZCBzdXBwb3J0IGZvciBtdWx0aS1kaWUgc3VwcG9ydA0KaWYgd2Ugd2Fu
dCB0byBhZGQgbmV3IG11bHRpLWRpZSBmbGFzaGVzLg0KDQp0YQ0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
