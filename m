Return-Path: <SRS0=VKOh=IP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA06C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 06:10:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C04F64F92
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Mar 2021 06:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C04F64F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ODadKXuab5Fy77IbLsUF2DWfJXXin0gNrQFrR54pYMg=; b=pBb6ZKeXtOyFIRi98V5XvbDzt
	37NNYwrB2nK0VEJGaBa5wa4NB94ojoIOl7hf9cMJDxDebHlRX8eTZmnAaR3sLJIBLLOE4H29RmGie
	nl7MKECHga/hIs0KvhEZuG9pPNI3fU29nKTsO0kX6eQc4OjHJtqOs0krW8dPzlKjOlVl8TrkCk0fI
	SeFrfo33p8LCyfW9KH00U0iU5wDAWMKY0NdwYXBc+zaUz/WwCrKMj3iaa2X1XcKYbuXROSau9LoIv
	x840B7pKnRFd42CTu1tIzDrNXzlT1wSUSoXMf/llbQqTXFEc4szgHRiTC72k+m2IAkElthsKlCZX+
	Zjc5QPNZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMPMz-002XXX-Hj; Wed, 17 Mar 2021 06:09:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMPMv-002XWn-74
 for linux-mtd@lists.infradead.org; Wed, 17 Mar 2021 06:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1615961361; x=1647497361;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Plha3SIXw9hzITUmYy8bPF611zQMYl621i997gP1BI0=;
 b=FPy7ZJ5c9FqCpfIAP4MZ8Dn3m0bU/2Jxfx6sGcQFSVBOCVehtyMJzHWx
 Eg8bcOdoeTE7UOfkzOY1V4i6LAkJIslRHcroDtO6EMRwfBBAKNo64bE9W
 xSEDJ4dW1ay/K4QhNoEzkkp/aVWPhJc2eHqVXMKjw2Y76oryzo27XqytP
 qUo6w8zkrZuKoiddxB1p4YkPuUYnP2fx5vw8Tsgbl7JDYxg5HzsZoLPzG
 TWKiysYMjjF14RU80UAuoilncC56OgZE6vbRsD000JXXa2UPF61ymjX6o
 eZsNZLq8tzk60kl3tPSSl6BN0ngidZFAsx4f1iFwXFpVNfAE280La7kWy w==;
IronPort-SDR: xtt/XVsYvALAuQ5p2FZ6/Dk/tHWrCor5jJCo4ZqPg2EHEdaC40uwm3Z5jmA1VWv8OQRjlNR486
 TUOCV+xGD9SsIYMQXTXGWnEcxwki/pxTr2qjWoUsDY3oB86EabE1yvR+XXRK/JwyQ8sKp9e1bi
 iD/bteLlahmjvqjpzR/SMj4vRAwdYXKjXuO7Abnt3OfVAisYPYvs8ymFgh0cdORjbnq7SNjVQd
 taN087m0YR22yq4NgrGpSuhFAJApwW3vhmVawMax/eK+2QrwESP6OsoAFB2QfoUuxzqs0pd5/8
 SXQ=
X-IronPort-AV: E=Sophos;i="5.81,255,1610434800"; d="scan'208";a="113046639"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2021 23:09:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 16 Mar 2021 23:09:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Tue, 16 Mar 2021 23:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MhAN9772/kAYsRv5kVCnfMrwXUWnUgNLzPZXl7kkD74KJVTPkX1nuWzXouf1hm3UpGFOl6VAf8SGDTaVBWTdcq3V7pOxbAqWj7vcp7VxlysGuSC96KMVVHCJrAWPFDLkHLELKoPaBOhVC9dFl+aidYsON82/MvY5x7Cw/NzEh7Cg9bTsW8pWeDUqamEjkG6hAy93dapqwVV605GR2AYA05nfrAs29g8UG7N+IKUkFLn5gFeQMz8GB2p0KZC50dt6scxIp51GkoareHdaH223MEIKaRTOSdljm9YSrx7oOKkQ0R6uFcXTSybAEEnyBG5c5NlTu+AgqGBU5+1EdSNcCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plha3SIXw9hzITUmYy8bPF611zQMYl621i997gP1BI0=;
 b=PTwysHSy/M6fjn/tBD6MlYHrwgOsEHDKvy3Yl9oENE08iY9AlSKSg6ioMgyYcMRgb9PYD63d2v/Fxl6xNb8ms5iWW1fF2fa6mHiuOhicF/cEz5Aa0L4SES7HuqR4CRsqcgp7NX+Bfp6aoSVHfomQMS3WS23ttIyvGQ/cRiODK2hlTGgTHBqEAvxHOBueo5/+GBeEBmotrwJu4H58abkGE+V2tZybk51e3QYmL1DEECCqL9gWvqUuoHV18O0lALbtHAWwfl/Tj505rkQaqKxThHGwd0NTuobUyUKAsD5TsN99ZRXvnQcEYvB2CAfgX0v4lpwRDHt44GyKbmSUIoudLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plha3SIXw9hzITUmYy8bPF611zQMYl621i997gP1BI0=;
 b=XfqFr2e+VBseiDEWmlydPxCcF9uj9FSCN4XqHg44Y/sjR0BfuiWL4WDAdU4gyL7oFwB6jydbsN0Rp0ExiXfMwXVp0C8yAskaqkzxVrxpjsBNoAigjH+/pSmW6AmgBDRoyyW7tiL0D2IdzgmTGUmJA6/9YUyiMB5n2uoDfv+guBw=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2832.namprd11.prod.outlook.com (2603:10b6:805:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Wed, 17 Mar
 2021 06:09:17 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::c9e8:9bf4:b08c:c30f%7]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 06:09:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <p.yadav@ti.com>, <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection logic
 out of the core
Thread-Topic: [PATCH v2 4/5] mtd: spi-nor: Move Software Write Protection
 logic out of the core
Thread-Index: AQHXFLXahW+TwdBlzkur1VDkcdYBtg==
Date: Wed, 17 Mar 2021 06:09:17 +0000
Message-ID: <45d00a12-cb79-774e-f8e8-d65602629a90@microchip.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-5-tudor.ambarus@microchip.com>
 <963232a4-9100-ebca-927c-7f5a1e947fbe@ti.com>
 <9889bae0-8eba-7cbc-d9bb-04e038bd28c8@microchip.com>
 <6016b725-a779-1d2c-9884-099c58f53557@ti.com>
In-Reply-To: <6016b725-a779-1d2c-9884-099c58f53557@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bb69ad3-2fc3-44c0-0e4d-08d8e90b329c
x-ms-traffictypediagnostic: SN6PR11MB2832:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB28322E6443C4F4BF59E54128F06A9@SN6PR11MB2832.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6oI/ryQqoEh6uWOcK1NdjvbY3MM4xqBZP7+RGvEUhABfR95DFgG4H2naxXG2Q1CPpeTtmdTD5Sqhlmt7Op/H5iQKgJ7NXA+DsLwirdetyGVdrZp2fUGh2Qd6YsXezGufeEE8QPRAqQowfkRVdkV3Q87CuS49Jyu44MUpXukG2CJb70Tjj2+J4dLg9j7H+KrV5wo74CR+zlHO/gensYhBkSzPboPlkUNPxvnA5idjmDaDvCz3aWKNewD4doDQ1SpAhTZBePze8IiBIcOjMfoo7L1lNHItrj8Y/s6O5M53Iyu3x9ViY+cd/XON+hODnPZgtm6ZzhxNCySqbmeWVsdycXhducpyd5WRxsc/FYgWvyuq8OpOsDh+UnPeGazQg8WAcSqjugTmldoS4yvnp778cIZFtY+fUbCKn0x/u9k/J+NkmzU364YbiVMj568k5t3CuIo0rdYgC9kZxJABF4dBxxTWalGSGw6ZAnOu6ATJsFp48I2PsFIfMuZJ9TiE0auXyae0ggIvhWy1OYcTaYWJ41xw8HPM9OQeIaRQCxreG2G/ZfYS45w6bLkllVN4viPcFOZPHWZUbxKl3YMlE8c5C8exmxO7ltnErqkID74YACZUu28pTnB8cBqg+UozLINQ3PBYgcafCD0UkEcEq4c4zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39860400002)(136003)(366004)(376002)(4326008)(36756003)(53546011)(316002)(31686004)(54906003)(86362001)(6506007)(8936002)(31696002)(66446008)(8676002)(110136005)(186003)(64756008)(2906002)(478600001)(76116006)(26005)(71200400001)(91956017)(66476007)(66946007)(83380400001)(2616005)(6512007)(6486002)(5660300002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bk9XWXNkaFdmaDF4Y1I5OHU2dVYvbmVBSExFb1JjcDVRd3NaSm0yeTZKck9k?=
 =?utf-8?B?MXQrYlQ3WkFCcGd6cmFuZ0ttRFZnWjhEYm1UN0xORVQra2pGcWU5bFcrZmlj?=
 =?utf-8?B?OTZ2bEZTMHM3bjF0R1pOTy9mVUt0SGFSa3EyVFVRb01WWmx5eE9LcEFwZkFl?=
 =?utf-8?B?bHJ1Y21OOUd3T0lYUkIzVzdDL05RYjBWcndwaHFkL2FvRmxKQVFVL2pqVUZW?=
 =?utf-8?B?QjVnRzZUM2I2b2l0NE4zUko5cnBXRy91NzJTYjY5WjhycEZta1RNZnhxMG5j?=
 =?utf-8?B?TmlJcDd0NUdjVVUwNitiR3RWN2RzNmJ5S3lhUi9jRHZvSXhjbi9SaU9uSlpI?=
 =?utf-8?B?WnF2OW1mVjcxd3lNY2FVZmFDQ3EzT005cjlHQ3RVbWF0Z2xnQTQzOHB1bHNK?=
 =?utf-8?B?K1dhenlmWkpQMlM4ekZzQnFaQkN4QWJSVTV3ZXJlUWwvRHVrS2t0Q2RIS1lS?=
 =?utf-8?B?cng4M2ZHM3ZXbjduSTZIcCtXYnBhajBJbnlHWE9icmROZ0YwSE5zdDZjU0dt?=
 =?utf-8?B?bUgrM0R6TFpkRDVMTUREeUR1V0Vjd3lNSWZtbktCZElURTBuZWQzUGFYb29k?=
 =?utf-8?B?Ly9kdkhrMGFvK2FvbkJTUFVIREFQRzM5cUNya0IzNTRxNmZESGpOSjJMb3gz?=
 =?utf-8?B?WXI3SU5JR1N0OGJMaWZFbklSbFBwdVNWWVNFUkdLcFROVVcrMWIrS1ZWV1lS?=
 =?utf-8?B?UUc1SERCd2dUMUFCdFY0cVd1YkZOSDBETU02RmF6UGFvMWlzUmJ5OXZKM1pu?=
 =?utf-8?B?UlRlbytSUzc0SjdpUzhNci9SZ1JXdmU1THNPMmpBTnJDMXJxeUt0b3pKa3h1?=
 =?utf-8?B?TGdvYU00K3JLZmxCQUhXMHJaSjU3VFZFVm1zTk9jTmJkeUlqWGNFRUI1c3l3?=
 =?utf-8?B?ZTZlVDBJZWZ6dVM3YVp1TmJYTmNXby9ENFRiVEIyLzlicWo0cVJSMDQ0L0g1?=
 =?utf-8?B?aWxkdHNyZnFFd1FVWThzNXF5UW5tNG5zdURpY1V4Y1dodEY2aUxnSE16OW9S?=
 =?utf-8?B?b0FVT3NQRzA5NC9VV0syUFV6dURrMFlTcVlOWjhyR3ByUjlldjJwN2g3d3VL?=
 =?utf-8?B?VlNnQm5KYlVJM3hOaDhRb0x3dHQrdWF4ZlQ2TU56cTBDTUx1QzZ3a25wRkdH?=
 =?utf-8?B?WExkK0t4VVYzazJTT2VXamhWN0ZBT05UNmM1NnUxWlJZZVBWRm9vbTk1ek13?=
 =?utf-8?B?N2RpZHNhVEFIdlFzN0kxcFZVVU0zc1ZKRWVNSzFpM0ticzRiQlErS2phVm80?=
 =?utf-8?B?TVRXeGlRS1NHamRTTGlHZzFURFJGeUFZMXgxNkxPbHdhWHBLQkFHUi92TGhp?=
 =?utf-8?B?bDFjQXJJU1h1bUxrc2xheElDOVFoWkxmMEw4OE9uTjBEczFodHJZaFBtRGhP?=
 =?utf-8?B?NURTQVVZeFhGNkduOUU1K2RNQ0szb3YrTk1vTkp1eG1YaGYwdk1WeHlCaHJL?=
 =?utf-8?B?NE9NQ1hNMU5RZCtHZ3pwYWFBNTlpL3k4cFVjY0RWUldya3p5M0EvMUJQQ0Q0?=
 =?utf-8?B?WmRmbkpzMUdiNTJmc1FhOWtaR3RIWDJ2TnlqTkd2VUsxK3g5REw5bGRlYTlO?=
 =?utf-8?B?TyszcWNwWTQ2Wk9lblVqWTBZbkx2ejh6Tk1YVFZqc05zdFdrVkNZMlRqNjJD?=
 =?utf-8?B?Q25DNzlkQzR5VUVPRnpDTGlEVmJaZldaaDdJZUJPV3lDUU9xcnBNWTd5NXdt?=
 =?utf-8?B?UHFIQzJsOCtHZWY5N1RucGtBWWZQQXRLNm9hQ254b2IvcHRpbjVJREFlZ1Bx?=
 =?utf-8?Q?1tuY4KQzSCcjZMsaiM=3D?=
Content-ID: <731C115E97BB7F4287E77759502BECCC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bb69ad3-2fc3-44c0-0e4d-08d8e90b329c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 06:09:17.4531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iGawYEJlLCU+ZsQybVGhlyNeuKuo4LkVh73knTkIjKFJZGJiOGH8Mr2SWsozhOu2elJtSrGQ4aQ8GX8K9ZlPH8xyE6PhKvtHIqczOSZTkxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_060921_696430_B925217C 
X-CRM114-Status: GOOD (  12.11  )
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

On 3/15/21 8:23 AM, Vignesh Raghavendra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 3/9/21 12:58 PM, Tudor.Ambarus@microchip.com wrote:
>> On 3/8/21 7:28 PM, Vignesh Raghavendra wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 3/6/21 3:20 PM, Tudor Ambarus wrote:
>>>> It makes the core file a bit smaller and provides better separation
>>>> between the Software Write Protection features and the core logic.
>>>> All the next generic software write protection features (e.g. Individual
>>>> Block Protection) will reside in swp.c.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>> ---
>>>>  drivers/mtd/spi-nor/Makefile |   2 +-
>>>>  drivers/mtd/spi-nor/core.c   | 407 +---------------------------------
>>>>  drivers/mtd/spi-nor/core.h   |   4 +
>>>>  drivers/mtd/spi-nor/swp.c    | 419 +++++++++++++++++++++++++++++++++++
>>>
>>> Hmmm, name swp.c does not seem intuitive to me. How about expanding it a
>>> bit:
>>>
>>> soft-wr-protect.c or software-write-protect.c ?

Having in mind that we have the SWP configs, I think I prefer swp.c.
But let's see what majority thinks, we'll do as majority prefers.
Michael, Pratyush?

>>>
>>

cut

> 
> I am not a fan of renaming Kconfig options as it breaks make
> olddefconfig flow which many developers rely on.
> 

I'm fine keeping them as they are for now. If someone else screams we will
reconsider.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
