Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F7DC2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:20:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0E461352
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 05:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E0E461352
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2f0BGo1DMbuGglsvQll7xxbJBskb+jQZ1aCZOoJvzs=; b=407pP3wPVWjBtn
	Fn3YSMxsL8CSr2zfcCseA0z6g2GI/ykfaAZDs4fXZe1WHbOEiFE6SIRmj74EukaHNwFgMycMA7DdK
	DmkCy0gQzwHmKD5YZkOs8TNx/9c5yUAoVPhIywtDHQKFshEtLBhHrZKSF82rhqc2NRoq5kFIjpjOA
	gZy2l7TbrlcAL3V+JYu9EBbI+wYWo5Ze4+GK5PIYI4VwMlJFan5sDadPmbL1svL1jKgA12wFK0q1J
	/uhqIazYoGIKfBuCBUNg/IYYEkzRrdL0fXg6W7B1C1daWXTmHX5lnd5WkREjIboBvI10JWJ5nBIXd
	72K0j/b3GHKJHeIfVPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxjg5-006nXj-MS; Mon, 28 Jun 2021 05:19:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxjdy-006n5C-7u
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 05:17:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624857435; x=1656393435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Rn+YCAtkAkh+TSrcqoKoWDCwyYYBDWmjjj8yBR8SrnI=;
 b=OM+5XeIAdKdfMBfDRCq5mAahzRToYuKS8IplK6rCbRiJutT8itk368s3
 LIM1PhIQ6/UYF3Jr9FZcRUvJdWm1tFkmvWqExkT9gY+WcbLdwjUbdrFd2
 RmDjFc4MyiMDc7vFJzXR0/OxGs8ta2NX0b3sltwk6KJ3Pg7gh5gVCRnxB
 ZsdH+rrVpX8Rbpp0+yGUcmVVu5B3u07H/bt/O3hVFj8/TkdN4KVE1hpl2
 wskOQudEUWUxz2oQ41/22ba06oD+0dIoP4RCfBJD7IG9I7FA/jYtXbHeL
 kN2H1UORmWv2e1BJX1RkIiAcWwvsI/YTPu8zQ4ATJPFlh4HKaedOxnu1o A==;
IronPort-SDR: UUnBrqD/KCBwtc4+3YQHfDvvxIVKjnIMztVE60xQHViadWVmwPwy/uYXftAXR17ycIk2RXpOL4
 s3/lul4aL2EWMhuX3qor3aeN36QoHxFRAS6xsrptwP6OBPRgoc5zZ25p2Z6ehGc9W6TQ4mfEhx
 P/94zlYtfjt3sMIRmGXKuT+QrAFvIC4JZ8dzbUEg7wtFhye/QH3sLLLTvvP5jHDaQFPrStoEc0
 vumeFTcLU2XM+418H+DjY5/ku+GjVOm0WRf4A2Ij4jUkiSeN8i9+kM77owAnzPrsEBwwGfMQgd
 Es8=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="126278471"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2021 22:17:14 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 27 Jun 2021 22:17:13 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Sun, 27 Jun 2021 22:17:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsqZBfd+BTaAzDlv7M/I40TXucX8baIfi8dyrS0Kk2mYRd5u4cFAyWshOdONAFE6QHrE7ptN1/fSZbqos08vJYAPiGHayIF95JTXiCBhFxJ+L2/K6qnCG7aQxP7YVTkqmboqVlXHqYPpI+xF8qWygBymuKaAAjG5Ku82wEE01Ka73wxAeECtBCqfTiBxJv+/aEco5cYNpDbOgQz0NZzcRLqhropq8B/sqrQ5W8cVqGgSUxe28mOPT7r5tLviSzBjreV9eKRCrdNI9j1X+ZubNyc6uKdS8gogCHsPp+AQ4Wsb2H6W5Y8JnLUVSvfubsyRyVeP6ZQNvFvRkAlrJUomRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn+YCAtkAkh+TSrcqoKoWDCwyYYBDWmjjj8yBR8SrnI=;
 b=Xtg/FQ4RVxEHqgYVFUN7cSh9QjkSLIyRmhpfSZHRvG1NChAM+jcL4Hy+gsCqyIlap1IcHQPQ2yz+0JRYtiy8BiVEzn7Ee0P9wEwxxPaG+yHKJ6SdnwMgAu4zcEYzp7R+cuWvHgqc8XulTm8foh3UYd5PgnV3xApJJmk0H4dOG8VRPGDeaXao2/15RX2fDelY9uBWtZPlhonn11QMAcUmu1gFp/9hf7olR+dsj9D8U7+HwfB3fQyf1/x7Rs95SeEWz2qbq53GWlCkBL2H6k6GJMPWH2mgEEwu13h8BHhr+YwhlmG/mHSDkX/qi47LAOkaCCIOz4zY0Cv5jx5KHrtA9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rn+YCAtkAkh+TSrcqoKoWDCwyYYBDWmjjj8yBR8SrnI=;
 b=hOtepQ9lRWTMJ4qzXU+G79vG54QRLcgw70eKygeGuTiSzco+oqbMID0KRDmEFD09n4NvgUFhck82SrikxXDMZhQSTIY+OC7HOXmIm4DXgXxq9Hp8y3CBEnWVfIEYl551JUOO20WXT+TQ4Xyl9Ix7rJk+huLYxR0VF8f2GGdyeWE=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4871.namprd11.prod.outlook.com (2603:10b6:510:30::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 05:17:11 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%9]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 05:17:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <code@reto-schneider.ch>, <linux-mtd@lists.infradead.org>
CC: <sr@denx.de>, <reto.schneider@husqvarnagroup.com>,
 <miquel.raynal@bootlin.com>, <p.yadav@ti.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>, <michael@walle.cc>
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
Thread-Topic: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
Thread-Index: AQHXa9zZhBHIVrQioUm7jO1Sivr3QA==
Date: Mon, 28 Jun 2021 05:17:11 +0000
Message-ID: <0a9ea6f8-b8d1-cda8-e2c0-652adf957a90@microchip.com>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
 <f022abf3-a6fe-d060-9868-985303c4e8a0@reto-schneider.ch>
 <3bb5ae427dc01b82be4434dff39e6c8e@walle.cc>
 <d9ff3a7a-7c2e-80a2-7910-3cc1a530833e@reto-schneider.ch>
In-Reply-To: <d9ff3a7a-7c2e-80a2-7910-3cc1a530833e@reto-schneider.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: reto-schneider.ch; dkim=none (message not signed)
 header.d=none;reto-schneider.ch; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41521dcb-59bb-4c92-6fdf-08d939f3fc04
x-ms-traffictypediagnostic: PH0PR11MB4871:
x-microsoft-antispam-prvs: <PH0PR11MB487196768B0915B86234441FF0039@PH0PR11MB4871.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oNZ7LbeMFxCd5+iaFrkdFxSf21z8t0Pnl7HrriObnxz0hPwmfLwxtJeQ801l/InNCcus0gYdWr36a0YC50NFkQOw/OTWnmJmpGtGvjIE5VTn/u2ywxXlWrGWD+aTPP16wGZRGrqhS6LkmB5NqP++8Qoffkr7FmYBNmNK7udLSeOKN+Bd2XDhcnmhiAUjLt0mg2OQeGYYr+DmUPdAwuHHwcn+D/BYMXQtNrEHF9C8tEmRVSqCKFpWERzT8VB4mYZlDUnQ0XfAFsmlDTx7JLg/PA2VLZLVo6JBXzBCsbFbnBvF9Wg9KEpxBUo+DVuzu+r7hCVy1DH0i2iyI5oWvumpgdb8H135Fn1rb9Q+IpQYe44HIp7+l3z+QN5iC6iFwUNrjVuLHJHbJUwi8j3XiHO6YOd1sdrFjkaZjaoRbYpp+Ns1WPF4JdtiBGWcqSybJ7I3QX0B89y3J7N/tW4BSMfBOxT9SRhPma3DRuyCI4rAZ5yXLPpaJwPG0O7xfUc5tD2vUjHrGC/jUYydGxzys5AmIRQK6YFKBz3v6Uv1B7puDIQYT5CH38OmkLla6QA727HFwX7Hn/1e1V8XRQ44Nv2KdW/CoDb7HG+aDNICr68ydQi91X/01TkIujO81qdt2VBsdu4o5zYY1NkKSGSJ7ba+ROQ3O3ykOfZVxUJ8MNU0ZZAcZwEqnmRuT0jaeH8Ag6zc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(39860400002)(136003)(376002)(26005)(4326008)(186003)(6506007)(478600001)(66946007)(31696002)(66476007)(86362001)(6512007)(66446008)(76116006)(53546011)(64756008)(66556008)(5660300002)(91956017)(122000001)(6486002)(110136005)(31686004)(2906002)(2616005)(316002)(4744005)(38100700002)(54906003)(36756003)(8676002)(8936002)(7416002)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3hCM1lEVnV6RE0wb2NiNnVQMUx3dURsL2U1YlNERTBBdEdNNFFvdmloaVAx?=
 =?utf-8?B?d0xpN0MvMjZLZG5TcGkzTzFETjF2NGVoTTUrV0N0S29UK0F0aEdQaDF2Smoy?=
 =?utf-8?B?R20yUzFjMmxWaFdkUnJ1dllYU0IyOE9Pa0FBQzhnTmFreFZDZmtRbEl3eVU2?=
 =?utf-8?B?L1FwQXNjak41aTZrNGlmMHhiOThiUG1OQ3JZZld2M0VLdUZuMjBEazdFWGxG?=
 =?utf-8?B?LzB5Y0tYbjc5NkZ0QnVMelVHNWtRa1FIVXlnQ3lGRVU2VmxkRHZVQ1pOaVEw?=
 =?utf-8?B?NkE0bVhhaVNidWoydWpxRDdxNnpiYkFuQmVuNnJOMXJsU3NHNVovTElma0NF?=
 =?utf-8?B?N3k4VFhJazR3SmhxM01PUVBXSW96WlVQajlJS0lWZEhBZTlQT2V0eWlzcG4r?=
 =?utf-8?B?ZjFqcU5ZRTdwU2hBOVpmNXJINnRXdG4zNXE2bjFtelJIdFUrbFcyckd2ZkxN?=
 =?utf-8?B?c215em5nQ2xwTW9MaXNaVUEvWlpwNVkxS1JXaVhTOTh2TXU0OFVzTGVmMkEv?=
 =?utf-8?B?Qjg2R0RTd3hmOVN3bHhBR1FZZW81c040TDlBNU1VenBHNzBZaVF6QnBSeS81?=
 =?utf-8?B?cE84dE9NQUVFVEZyblNUbGUxWWQrNkZ1Y3Ewa2NYVnYwMFlzM2JrZzhPYTZO?=
 =?utf-8?B?MEFhMU5SbVFacHlVWCtKRXMzQ2laK2hXdjc2N0tGZHJYNEZqOFFqQkVBUjcw?=
 =?utf-8?B?VUNSekV3T0tPRHFCc21PNFc5ZjAvSlp0R1BaNTI4R2R4Sk5lcHpsMGUwNnJV?=
 =?utf-8?B?QmpPcHR4OWpmU3MrTHVVSG9HNUZnRFBzMzJqMFlES0pDbnZ1OE51ckI4TXQz?=
 =?utf-8?B?Y2hkcEZZWkRZd3JDblA5cnJ4KzNud1RqSkVZUlNrRzV0Lys4ZG5KaXlKaGhJ?=
 =?utf-8?B?LzN2dnB4OXc5ZHA1aXczR0Yva3pZZndRZDBxOE5DeTE0emhFQWtEN3grUUJW?=
 =?utf-8?B?eVB4b1lROHdBZlgxZEp3WXByTVVSOTNNeW1DYkFTMmlOWWlBK1RPNkFLd0dL?=
 =?utf-8?B?ZVVESjRZVTdGcTNLSFMxcWgrTUZEVDRYemJxTXl2Z1hmS2RWalRsZXlmOFZh?=
 =?utf-8?B?REJQTklMOUVVK3VqSURiZEdjanBIYVJLaGZRNzNxbmNHd3RRenREL0RTWm00?=
 =?utf-8?B?bjA3M01zL3FLY1I0NGZ6UVNUUmgzalhjQUNLNml0U3ZYeStEMmMzTm1RLy8y?=
 =?utf-8?B?ZThybDRHbTB2OUlvUENwRWQ3R1lEc0lQaHdxSE0zQUI2ZmRoMTI5aFFzYWtU?=
 =?utf-8?B?dEdBQ0JnbTdub3k0QWlmU1Rha2l3cFBXK21KWThxVXB0eFpsalpHZDZGenN6?=
 =?utf-8?B?TlZVUWlsZ1Z5SHEzNFVDWWRhVWVFSldpcDM3SzkzSlFuTzBrT2k3NnczUmtp?=
 =?utf-8?B?NXFpc05wanRYZVBBSmVxYTNrcm0xN3pqbzRhdGNudGpQTENRZXAxQWJ5ZUFo?=
 =?utf-8?B?cTVNdFpPZ0pCdHh2cFozQmoyeXBUMk4xU2lxVHZnS3o5cHIrbjRLRG91aFN5?=
 =?utf-8?B?MHdFcytWdFYxdGI1NHJXSXQxdUVPaFhHekZSUVdrNis5eU5hdWRlS3NBUXRR?=
 =?utf-8?B?cVJLM3NCL0FIN1pkR0duVUxjTmh0WlFYL0Z2Ty93VWluVEN4R2FPbnRNRkh2?=
 =?utf-8?B?WjVESUlLRUZzSUdxRjBhc053N1hUMnhEcjF0OHhqcEd0aVkrRUY4M1AxQVd6?=
 =?utf-8?B?ZjZ0Ky9KbVIvc1k2UjhjdUJ3T2ppYW9pWDZLUVZCLzQ1d3BjM1p5RExWR3gx?=
 =?utf-8?Q?/EOF7XKl/L6sqy8xV0=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <64EEF85851D40549B859878A0F385082@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41521dcb-59bb-4c92-6fdf-08d939f3fc04
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 05:17:11.6635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gBGp5/pi3UwHYvcrj7rVTZF8qEA3PYAEZ5ecwOVTl+4YN5TKtN3lNbW4eiPCIpVfQ8DVforBGWZl71Vic3xmG2Uv4yu3FfiAfqT1OX9Uxv8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210627_221714_395538_71D090AC 
X-CRM114-Status: GOOD (  12.54  )
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

On 6/17/21 6:06 PM, Reto Schneider wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi all,
> 
> On 17.06.21 16:19, Michael Walle wrote:
>> That is up to the maintainers, but sooner or later we will have to face
>> the problem regarding the duplicate IDs.
> 
> A strongly worded statement by the maintainer(s) ("the Linux crowd")
> against ignoring the continuation codes might help (me) to put pressure
> on non-compliant manufacturers.
> 

We saw few ID collisions even between flashes of the same manufacturer, macronix.
Reusing flash IDs without providing an extended ID field, or ignoring the
continuation codes is bad design, and I would avoid using such flash. But I won't
reject new flash additions solely because they have a wrong identification mechanism.
We'll cast an indirect public shame on the collisions by writing hackish code when
trying to differentiate between the flashes in software.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
