Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8975C2B9F4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 07:30:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A748619C4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 07:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A748619C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zjjsH2Gzmc/EJK6m3ghcT0MLcmMXp1GVmpn/amFb+o=; b=tL4RHHMY0KuRF4
	pKo8wDPaO7G4QtNR7zBK4LMpdCyhNoEQO2QoCd93MqOf0ZYqcQR0bWL6eG2YW0KrPwcOV6etk2v6+
	PHeioK52yStQM7FAtU4Oefyn3fXv8cIyhg9RKKorw4i5IfdQN09ERt1mrMqi2jxtnp6IFy67PGLz0
	g9l2XAkimSNkCDwaGbqE0ijKfiA2IQWpB8AAMYQsn3L5rP9PiLPhXgix9i7Y/APaG019i3OocpmZH
	AhksiVn1dHSwopJfBWlR08PI0OS331Cap1QUv7sjLxb+okl69i1P4qO1qkT+jn/I4fma2zhQ6tSXF
	dnRReSsCuLfKUyJ15mCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxlhx-007F6h-Gr; Mon, 28 Jun 2021 07:29:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxlhm-007F4W-2K
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 07:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1624865358; x=1656401358;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RhsLl4rYbmZcEG8lmS5gON3p3+Y75nTCZ4iHfTP+e0o=;
 b=Vp7rqDPkirTai+CBK/XigFukZUgw4C21jJNi5cyJu3mCLJbUR/K+SGE0
 LJf5KaRiUBKRC2TjK9lL8N4Zl7H+qQcTU01Sd5KZp2qLzMqsdgEZw+i9X
 4U2A/0jn7p7WmMMOefX5kJ//lUHkJWAT9NeO5rGiZUd5288FabtHUyqJy
 SJcAkRxuQXjQi5VL4KivztJWFYpDDO9Z2kGLqKpUaJiZmX7MIWubZRG46
 D0swyP4XP81G4JTzw6bObRG0xihU3V+KpWd8u1e3tallLNW2DSMFHgekP
 dAGJM+pdsHu9M6bAmqgb7DXGmAEHeX7fpC84uwh0tqj4+DrTuST96i5/j Q==;
IronPort-SDR: tKybHIgUDLtUtQqLv0AGD4ASDowlIdHoYZKlQ0i9ZCynSV+XvYX1tY4zViap2C0NqPO5Zj4NU/
 Aan5QPFIZAUuZqRRVuw0STC/bRzhCI/HDO7342fyKjH8o27UXSY+Y1A3FG5CzXvKuNHDyYmhpF
 xQUn42s1Eb9oEOo1fU8GSZP/0nA4BnWdlhr8BVq8E3DJcb+2H0B0KCxryoy8UoVcH8Pl8QTGQ/
 IJxtcDkEt8rM9QZFYxWtTmIrHpV1Tycs16xHXOBNFLEjXsOaHPwASRnkYWaGsgLHWBMrJiZSZD
 C4M=
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="126292739"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jun 2021 00:29:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 00:29:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 28 Jun 2021 00:29:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLjl4K5jMmEETw9s4CcVYcc6jLVIwq2h38DT+STpa7oW46tpBCEscqJYfo0VXFtnFQQNEiqK6+ap095orSvoz9T4SCgAHmycz6knWC0bclNcXtxNWF6qgUvArZKigYc2YIDpVvE9xfgwSZsYY5i67JbHRfdbZbtn3PdYCg8gicEpTnQEOVCJaLasPOpUxUXbApnYNPEW3gEfoWw4Hpjz+vQTeJQMX6nVJm8eulfFmv4HZGNlOXsd+iLDxh4kn+t4bQ0l3d0DrjdUHnavORqlxcxScSa53zaYDE/0PiKMKZZ4MQoHGZ5UYSSFWw3fT1c2nhm46d0cLqmgBDb1KWgwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhsLl4rYbmZcEG8lmS5gON3p3+Y75nTCZ4iHfTP+e0o=;
 b=Bnqte3w6/71cI5gsFGTXUflNKHFR8tKSqEvnv3fV+ERlgNDq4L5GvxDQWHIWHe9iUrufRXXhI//cUC6QLFYQES+eJJubgQEJgQxzgENTX9C+6ddYNVTZUIJhIwUz5k0/FcjHeyOfZffm+eHdB8o33JIgkd8VyIZAQx+v7LVdOdYxinK3DZJoNBa+bW4O5XUMPS1LX8ALSY3qx9No+emCW9WLcZm6HJ6ZemwAgpInGsQompTEWspiQcSmTl2FHliCz3ctEOzKdBNxMitDLaojSeLEKyvyHyV4J4DFupe7OJ5FRr+jf9OWL8hRuUYd+F5cIl3vv/fqn86NO8SgGYHIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhsLl4rYbmZcEG8lmS5gON3p3+Y75nTCZ4iHfTP+e0o=;
 b=FTmuekQ2/7NB4/bVsDv02++1/USGe924+ukxknDviDQX4gRBf3/HZ/KMu5F2/7KyHTacT20kX02NS1G0Fjp9rRBvAqHaBrBiF0JC0VHf9I6NvA1kSTY4+xzzIdIQEVAGhSuhODS+Lfx+sBed6fFiwXx0j8ceG7KzdZwPYFVT+YM=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB5048.namprd11.prod.outlook.com (2603:10b6:510:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 07:29:14 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%9]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 07:29:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <heiko.thiery@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <michael@walle.cc>
Subject: Re: spi-nor: maxronix MX25L12835F support
Thread-Topic: spi-nor: maxronix MX25L12835F support
Thread-Index: AQHXa+9Le4sFhEzgBkmrdg6lQhxWmA==
Date: Mon, 28 Jun 2021 07:29:14 +0000
Message-ID: <14962b80-7dbc-94cf-1e9a-af694672550b@microchip.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
In-Reply-To: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d5201f2-dcf4-4d5d-85d4-08d93a066e8a
x-ms-traffictypediagnostic: PH0PR11MB5048:
x-microsoft-antispam-prvs: <PH0PR11MB5048235B6698E8BF4D7BD5C0F0039@PH0PR11MB5048.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NCJJVRoHdwwKpkgqzT5+qh4VVwYIJbQIqYVTDTyGx+6l/PcLbR/KIh9GaSpb+U3TCJpAiruOeCoW3xSC8dOFV1MRTCMf8Sb4jdc5QazCd2nEAK9DjPuoI+hXKQbRnRrAVso1K7LhU7bZMQXAtSjhqBBX6K2jbD3gh7a4Xm1VH6VeyiG2iAraR72I/m8+OQ5A5UTu04dq4w+lWybd7WQqwRStJlk+BdIXGDX6daXZg+HzP+C7WjsWqWgztFmq7JLEUt/wJU0QO80cB8KKl8NNMr2M2Uwoal4qwzIZ5I1MZ2id9/iqQ3WezI54PwFLazVLfcxTYVi0kgwVkwM8HBVXPmfydiCUBBWamutME39oRUmOVpYpSlaRED1Eal1dHOx7vqQMCdPxd4/Ht2dZZNXJetHeqiTLPxaqlj7+2vtwbMizXQ8rw25iqcfd+gHnZsst+1AOSactK/qiWhr7KF9ZSPaxnQZzan0ZA4Y6+uK7q1oJpXndbhvAfwYF7o3YB6ZgAFQ9JAl2ijF4WMbPPd1KjBUiwA/CbjDorXPa0My3F9ktJwb2FVeb+WoQlLglgiDMN/aphTj1qfUXLZcvgdZ3rEdyIUtzmh2lHZnnLYXZOxb5z3zL4v5BtwAFl3Cjfp5E6/Aw6IPAAksCVu86N3t2lgl47tdJ/hF/OpKu995jazMv8LQnoikUsWiLvYs6FdK0ZJYLUff7fIPJT6ggueYeFYWe9YSYDLNT/Y1l5YBaXuU5ZWW+5owulPCNfBzexWdS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39860400002)(366004)(376002)(136003)(71200400001)(8936002)(2906002)(122000001)(478600001)(110136005)(4326008)(2616005)(38100700002)(8676002)(316002)(186003)(6512007)(26005)(5660300002)(36756003)(66946007)(86362001)(66476007)(66556008)(64756008)(66446008)(6486002)(6506007)(53546011)(91956017)(4744005)(31696002)(76116006)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWxERUovZmNoeDNPL1g1NEM1SEREeVZzbmJZOHgxcXJHNlNySTZVU1BNUGps?=
 =?utf-8?B?MCtMY3kveWxMdDhDWU10bnlvSmErSC90YVVhQnNvS21qS0lrUzdNemI0R0lk?=
 =?utf-8?B?SytGTGhuWEZtcjlvRXgycmFIdngzNzJicm5md3dkcmorM3lnTlNpcDBnTXZT?=
 =?utf-8?B?ZUhsY3poZnc5cEZBaUZhaFQ0SDVEOWdMN2VPMTFwVTNJc2VvdzBEYWlZSExJ?=
 =?utf-8?B?Q2FnamRxcGE4cjBmd0p4TFI3UHI2QWd1YTVpR2UzMFFsUGlYUitRY1VtVjAx?=
 =?utf-8?B?M092T0lwcmk2WEFKYWsxUmYyUlUvd3pRS2g0OHNZbS9FNkljbis2T0tqa2JM?=
 =?utf-8?B?d1VzVnVlSGtPZXUvSURoMlVaS3AwdGUxSlhCOTJEV051M3FYQzhqZkhqeU40?=
 =?utf-8?B?ekNmbEFvMWtsZGVSWW54L2pvN3F1R3N5VTIyR2N5bThxWHFsWGMxckxuT0p1?=
 =?utf-8?B?Q0NBbjBlenc1cnpTcW05c1pTU1FROTI3UW5PMzdlN1dGcGNUL29mQklJcUpL?=
 =?utf-8?B?S0RiZ2tOUXF4T3J6bmhNK0NLOW5OY0pMQnFRYUxuSzlHK1FnRElma25sTXNm?=
 =?utf-8?B?dDBqMTVFaTc3NkdnbW83NDNEQ1dheG0rRXJ5T3dQTEF6cVZwMEtJMnphQXFt?=
 =?utf-8?B?V2xrQUMxMERKenMvNVhveURFcUNsRU1NR01Rd2dPMUJzWGM5VjN3Q1g3emtE?=
 =?utf-8?B?dVVOTHhUTHlNWEMraWV5dFJmeVFweWQwNThjUkdLZm1kY29BMjVOdXJOdytx?=
 =?utf-8?B?Y2V4QnpsWTZTWjcreVhDcDNBNUNLZnBzZ3JUOXFwdnhSa2RwYWN1MFA2d1RL?=
 =?utf-8?B?ZWpHN05FR0RZbEM1OFJmcFBkMjFuUHdzYUErb3BDakJuRGJmOTB6MjJIZWNB?=
 =?utf-8?B?bWlYRlJINlpTMTV3UWpucWZQRjg0N3dWSTNEYU0yaW5uMS91ZU8zak5KWVhF?=
 =?utf-8?B?NFliaWR2NTBmMEowV2JhdUk3VmZVdG5jdTVWVlg4VHluZzlyVmdqbHBCYkxR?=
 =?utf-8?B?K1JOZnJjdUh6emh2OTgzQWQxY3RQdXVwQVFkZGNkajEyMVM4d29VY1V6bGtH?=
 =?utf-8?B?L1Q1R1FXYklqd3ArWTg3NjFGM2lCTkEzTFk3Q0lKTUM3YUMyTFBWNFJwK2dr?=
 =?utf-8?B?V1NtdnlQaVBKR1MvOFVKOGpRczhYNkhzbUF4MjV1QUFxKytxMmpZNUpsWlBD?=
 =?utf-8?B?Z3RQTkRpVTNhVEFtVVI5dnNzY3c3Rk96c1gzVzBsTXlJTFRXdDBJMEtqUjk0?=
 =?utf-8?B?QWwrZko2alo2aGR3b2pJQjZxQWREbjk5c2lta3ROYjhTNERPU1NuWGhIZXdW?=
 =?utf-8?B?bWwvbWNlZFZkOWVNM2R4NE9yMnVybERiZHFnc20vMjZUNWk1S2RsOEh3L1lk?=
 =?utf-8?B?ZmRaZVZTMjQvbEhoSFhVc1hzQTMzSW91ZlNBUUlLenJjV2MrQXFJM1ZyY3Vw?=
 =?utf-8?B?TFBMUk0wR1dBZWJ2VVlRVjlpNHVDbnA5SFEvWElZTHRRWGt6YWx5STB3aFJ2?=
 =?utf-8?B?QWRVRjU0VHV4VEFYQnZsaVdCQTRZcndWTFRoQXRWcHJxd1dKd1hHUnF6TDdB?=
 =?utf-8?B?SUlRcVNaRUhrdm5xVG92MDFZZ1JURmVSd2MrYy9ZcmowN2RnTUNBcnVtd01o?=
 =?utf-8?B?UEFVQkNNZjdCZUhVRWpBSEhaWWxBT2JKdHR1ZWU2RmVFZGY0MjBtTVpQNlNZ?=
 =?utf-8?B?SytXZ0N2S1krUXphSjRUU2E4Mk1UcDlJRlNacmZWc3doMUZVaUZueW5wWUVN?=
 =?utf-8?Q?RxlALmf4PhgM22dtkY=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <B9DA6DA1915E6C4FA90C702CA908B937@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d5201f2-dcf4-4d5d-85d4-08d93a066e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2021 07:29:14.7715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wulpYqUIR2+7dy/BAjabZYAA17sEfwHl7cm50lHjfVtOX2awJn5hIG1QIdY1u8FFJ/i9jY8yU4l3EmCeAQL8pGkx6qW3AsPHgD94itbsNWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_002918_289251_B268A7EA 
X-CRM114-Status: GOOD (  16.10  )
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

On 2/15/21 11:53 PM, Heiko Thiery wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi all,
> 
> I faced an issue with a SPI flash on our board. We use a macronix
> MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> the MX25L12805D [2].
> 
> The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> while the older doesn't.
> 
> I thought that I could do a fixup with a device specific
> post_bfpt_fixups() call but by now this seems not possible. The older
> MX25L12805D has no flags set that allows a call to
> spi_nor_sfdp_init_params() and implements the fixup.
> 
> Has anyone an idea how to solve this?
> 
> 

we'll differentiate at runtime, and the differentiator will be whether
SFDP is supported or not. I'm taking care of this, patch will follow.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
