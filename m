Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFF1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 10:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNL8VQcrLgvMWzk3GnxO4GLTS0v+qecY+8+cORH6SQk=; b=fytwo6YMV13RN7
	oHH9pLDWC7hpd0OEpZvEKkQPgN5QHx2MxeGIjU8bMnqFbDEOFlsOFp4M6WrV1Pl4g1oOjnvDP0Nw9
	W31CN94HmRO5LdeqVfAU8UPruE8wi53yMAJxHB6/pPW+twhQeZ9Qew3c/2ImbVoQuosZXQEZ6K08J
	5K56BkyEWVzo8TzFj2WXvTGM9uouNgwIWaNCvFNn8VBWZrdO+q8kJH9QXOPq2DsVdAaoH289gQaDS
	quozT0f7aY4Melzbu17RP41/WZ8BDJtEdehowEs5ficSk66VOiXiFCw5WkAShydf9sc5tUYvY4IcP
	7IPuvDU8xx9Y51LbSrwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP077-00GCkG-Jd; Tue, 01 Mar 2022 10:52:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP074-00GCja-Gc; Tue, 01 Mar 2022 10:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646131934; x=1677667934;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=8c9J5nFhrDkBusGOErHiV3+P/hFrg9xVoCP4hg9epJw=;
 b=YxoavjvUMRCNE3kwS7fzyoY2YoVPEVhbvDokbwx9X7CjRuSUl1Gtr2r+
 ojSinvyF0Kj+Z1qRIf56PodOH8c0w+UmRE8Tf6a1oIpXMnOkr9Jwqp0e2
 1rQdmT1Sld9M01qWC9APHmnzvILI+ozHnG/NnPpaQtEusJCDhNX8Ps4Vn
 fzTCy6OGLOlzlTdY5NEuR9zXbetcG3t3m1vheZDuctgK5w3HxM21jEU/g
 lmrLZWvyv0eww8ZPCeN9vQROKNo/Wb3UTbMKttgPB1aRxSGuLvqgfsRqk
 wwpbBi3hF/GVPCvoqHMxxFxLgMeyL1CzHGex5PdpANJELLuHFQrrt88CH A==;
X-IronPort-AV: E=Sophos;i="5.90,145,1643698800"; d="scan'208";a="150376015"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Mar 2022 03:52:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 1 Mar 2022 03:52:13 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 1 Mar 2022 03:52:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oj3YAlui0aA3NrdPI/xI0vZsVQzu+CAsVfEoZ6sP+CFgAgtMYMYNdksjgAZ7NiWVfXqRGfNN9+Al8WClz9iUipthb+yd7z0+gQ+bq3sazU4SVRfOmAgU9fGo5fMcTMeR9jkSXZYr1GrRiYozwKe60vJpHHPOskguypzAjJkgZUthhN2OIs6QtwXn0r8XrY3qWoZWeq3yVlieRZiimTpIW0crOymZpjTPoZ/njd407/ZTz8LuNdyyEK/RFLSdFT8jgpJPLaMK7VMBop/8LAaelsmDQ8K28vRE1e20Q0YIsNcfnnCS1PlV686d/G7FsMZujjqkeLWdWbBu561QayH6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8c9J5nFhrDkBusGOErHiV3+P/hFrg9xVoCP4hg9epJw=;
 b=YAuVJLB/qPuxAgR4FoO+RWmoBvH4LV1ZDcG18gZDY2Z9xZc6Gd8atk7lbJ9wqv9FODNgCQYAXagw5vapxyWP5zrez2mUkhu73WxHtTrLgSIDccQYksE67yDx97TBHfTXnp3jCBU+QqghOIm9CkCIMnE62zn/3JfAtsNw0xzUErrlixX2EUXDYO4paQ0kzqEs1lkAzUKKVmndCb1RONH1WnQ/M/qNmcgJuweiTz004HeEkZ0rb+xe7qKf8yjxaDH7Ce2Ebzz2mYG4uMAUateWX+WgY6ejmAVlPrJx1Mza2nLHA/uLyhQDm0l1yumxBji/z6l0YM0HMPWseKMtFiF9BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8c9J5nFhrDkBusGOErHiV3+P/hFrg9xVoCP4hg9epJw=;
 b=eBqYXcOG+oSVd6h7wgCw2pPlFQ8Xq5nv5z+PMu5dB0MS7j8Ptk1ekSnlv0GhqbeLU8fl+V79sSKe/zUNeL0kKGcuLqQMvMf8a/eqZIkqtTxLyC2+uAuPhlEiJpZ/jyhDSpPbX/efUGVevrlNt8hTvX+o5WGTSCgZKINRejRoP9Q=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM4PR11MB5487.namprd11.prod.outlook.com (2603:10b6:5:39f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 10:52:08 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 10:52:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <heiko.thiery@gmail.com>
CC: <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Topic: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
Thread-Index: AQHYLVplQRnxn1BbbkGpQ8xUF2TdFQ==
Date: Tue, 1 Mar 2022 10:52:08 +0000
Message-ID: <0210b628-a331-d935-6319-bc9fe737fe15@microchip.com>
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
 <ba3a7bd546934ee0174480a01c505663@walle.cc>
In-Reply-To: <ba3a7bd546934ee0174480a01c505663@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e75cecd9-f927-4365-772c-08d9fb71883f
x-ms-traffictypediagnostic: DM4PR11MB5487:EE_
x-microsoft-antispam-prvs: <DM4PR11MB5487459A505345D8DAD5293AF0029@DM4PR11MB5487.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vYubOnDd+640ogeikCWf/kZoMA18349ZB15cVtyTaK8DiYqtXqGo2QiFdGqIE3Qg5DRHxVzMMBbGdMaTqa7ytwnJCKy3vnSwhS34XvemOy7cPc/UIKUeuPBSor31d+NrMrkE9xlTpcj1v5O1UpgFhZeBf32Vlv/TdfPxtGlRPwYnJYhYfJTVs4v7+B+djBTDD9otai1r4l+27emfi+X6M/Tr/jCjVXD3G5LbafKk9pcL1tmCkOa0GuEhMF7IOxhIb4DpJ2Usk7lEvtQtSelBYBxXzPgI+LVtyJvEq5OqMPxTyg9wWXYy4R3pJvuoq7aM7XM1Qx8br02iRZ2PASulSW2/GYTAWgLZHOJlTK9wP+4pmaxzo1ytAqtsr1K4HW8EjLVa15+Bln1+P1Ymk0uBCUU8BAwZSbvQFjMx9JPz0CQlCFC891amqKq9qatqF+x5nV5LJT+6wyWVHMAx/WvV3pwOv+AgfQ1UMbdSSIL38ufyHV8bbBSPO287m0OxE3vhiAniVpdZSTqjlhnQKPQGqbmHbL06rv0117UaoqhuVKbFChQTqB98Yor5OkuSQsCtd98Ae9QbcVFi7VZ5/PxQZ/HNO4yYS/XGleIXbCbuFfCVmpwKbORoWHoWHvio6AsTK/hLNYS46njDOYh05/YrdCzh6ZxpHShU438Zw9wXxIFvtRHuncTRqJiu3RBRGR0sUOc/Bf5lzIxOt3BisTjjgA4XI2qU9LTeMLetaM2wOnwx1RC/pY3CGJpNFhN9UC+Wb2QL2wXyuZOnCD3r2NBmipzgu0HX80yAuyXOpL9aOl/R6S/5ZP3UgD5LJpg5P1hxbrqZCQWTexJl6FRDk+zvubXLaevGlgx68qHTw5g+vsY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(966005)(6486002)(8936002)(53546011)(36756003)(31686004)(71200400001)(83380400001)(508600001)(122000001)(110136005)(54906003)(38100700002)(86362001)(6512007)(31696002)(107886003)(38070700005)(5660300002)(316002)(4744005)(26005)(186003)(66446008)(8676002)(66556008)(76116006)(66946007)(64756008)(66476007)(2906002)(91956017)(2616005)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUZBaW1uQ1VmK09jSHQxN21xSmZIMVdQZ1B5dDFTT1h5VFZRSUsyN09Nb2Iw?=
 =?utf-8?B?bWtHZHlGUCtkbjZaRERGRDdTekVBRnZCa0VvOUV0MnVzeDFwTnJuck90VklB?=
 =?utf-8?B?V1A4SDE2SzlMVlRHR0lzUnNRQmhiNTltMVJNMkY1d2ZUQ1cvZ0hVRmdYNHRG?=
 =?utf-8?B?bjF1YWlSbUs0UkUwdld2UDFvOHFLK2drM2VzVUdRVnhJU1FkeWVqNXRWZ3Bm?=
 =?utf-8?B?aFBKajRDMmdlYkpIbi91c2tUZlVxZG83RVVNOWZTU0VTcVlNQ2NSQmFIOHdz?=
 =?utf-8?B?UGpNZ1BuaGdTU0g5bUs4WHk1ZVljYThtTEZUeGNxcU80U25Jcnl0dzh5bHU3?=
 =?utf-8?B?NlpCaEJ4dnFkNkx0NjZYSUl3NlhUOGIxY0JRL1VMMzJLQjhScHhhL0V6emxt?=
 =?utf-8?B?V1hCdVdtcDYyamVWc2JDSlFJSi9zemtNR0lzOTUxM0MrYUh0dVpkRVhHWHZx?=
 =?utf-8?B?My9GQkc1dnlTbXRNZDNxR0p5ZnBBNlNFRzhsNjdiYzcrZTQ1NzUrWkZpaUhE?=
 =?utf-8?B?UFBodWhSQjg4Qjh6MUo3OE9zRGFNRmY1UnhpZDBibVN6SzA0VDBxWGZkZ2d3?=
 =?utf-8?B?SzhSL3BnRUw2TjdqZUJVSVc0QWlPVzhkeXBwODNEZHQ0TGVteHRHWk44RjBy?=
 =?utf-8?B?dG5BUG5WcEEyY0xhWjVCT2E5aG0wUXU3amRZZ0swZlZLV2RQV1FyMEFYOW1K?=
 =?utf-8?B?VU12SlpIQVdtS1NsTytDd3ZwL0tOWDQxOGErTU02bTMrU0hldGNXWElCOEMy?=
 =?utf-8?B?SWxqZDMxVnpieEluYjJqTlVUQ0hHN3lXcXdyanJRV1pQbmRMUlgrNnFzOVAx?=
 =?utf-8?B?dWVTeDdyczhkdHpnbTc1N3VLbkRJOVJPelFNVUY3bXAwejIrSWtabm1qcUh3?=
 =?utf-8?B?eTJaWUJWOFo5cFFDcHB5MDF3em9lV2ZVME43RDdDbVkxMjlvVUtMUG9zRXRQ?=
 =?utf-8?B?d1Y0UlZBajh5NS85TlNuWGFGVTdMdlpEeklkTFFRSzAxMGQrN3NTby9GVzhD?=
 =?utf-8?B?VmRwblBkWlBMU01ySlB2YlVpTVRrS0NYVzdUTWc4NEJwSTJhemErNkpyYzVC?=
 =?utf-8?B?Yk4rakdRZnk0UzNDYnplZnNwSTFJcW1TQkxwVk1pY3RiRmh5ZmwrSlZRTldC?=
 =?utf-8?B?RjhEeU5FK1VHdHJQV2c1SDhhUDZmbkN1Y2Zvd2RMclEyMTd3MnNxQ1U0VWNu?=
 =?utf-8?B?M0REbTZnSExybXFOemUzdVkwa3RkSDRWQmtSQkN3TGFRWUdyVFdwd29RUlRq?=
 =?utf-8?B?eUVJdmErSEs5WWNOK3JoTUw2VWdNNHhkaEJYV3RZVlZsd3Q5NXFQaXJFVFoy?=
 =?utf-8?B?bUJTVnBTVS9oeUNpVG1pUkZvSGFWd2FxZW5uYTRFeTY4dmJja3dMeWttb1My?=
 =?utf-8?B?emRObHJpbXNXVFp2ZUV3elhLUnNGc1lpV1ZTU0l3b1ZTSWovWDhOVHQzZE1r?=
 =?utf-8?B?RWRaTThtZFhCMmJEYXNVT2ptYXlVV1MvMkNTTThwcXFvZUtEU0JOZjZxdndH?=
 =?utf-8?B?bGxLOWVMMU11TUxuTDRuZ1BneXZ6NHUxc09nbnF5bm1rTXo5bEREaDl6LzMz?=
 =?utf-8?B?TngwOG0xSm44a1BiSG1vSnRMUDdGLytrQ2NGclJ4ZUNFd2M3TTZFZnZaY2dj?=
 =?utf-8?B?RjBINWJEa2xJYnpzK1A3VURkdmtJRnRqYitNY0NVWDV5YzNmdWpGL3VjVTZr?=
 =?utf-8?B?My9ab0tybkR0SXJONTY5Ky9hd0p2TjJ6TVZhMjlsSlFoQWc0ZVJhbUFrZVg0?=
 =?utf-8?B?OC9QUWFOd01QaTBHV1F4SWg0dlN4NDhZK0twSUFianVTSytYc1JCS2Qwem5F?=
 =?utf-8?B?d0dwVmZNMmloY3JKdGZXRFBlNzJiWmNPK2dlZnI0RTRoakJsa3pqNUtpM3ZQ?=
 =?utf-8?B?U2NBaWRMR0tselpIbkE2blpCNzdlOGtZOXhFcnBKMEZZUklXeE5xemxoZ2xZ?=
 =?utf-8?B?ZjZoUG5SVjlnV1NZanpwcHNJNTI4WVFqVnFMZDJRb2FoYmZiMHhSS0hZeDFS?=
 =?utf-8?B?QW5JMndvRkpaU3hQSFh5NWVwUHIrNGg3WkJRTjZ1QllVdjFmRlZNOGUwVXpM?=
 =?utf-8?B?aGNETm02cnIyWEl3Ri9NMXhwd1MvbGJTQVg5alhLaWxFQmZ2VTVMak1pbGhW?=
 =?utf-8?B?V0FzM2JJSHJuM2NFMndSTXd6bTRtNG1POFE5UDkxWXpaUUs3TGhBcWlJUFQ0?=
 =?utf-8?B?QUx3K3hndHR1d1IwN3paNW9mTzJPUWMvZFlja2dpZS9UbFVQUytzTlhoOVNs?=
 =?utf-8?B?RDdVOUlMQ3ZldEV6ODFsM241NXF3PT0=?=
Content-ID: <D780B3E2D94FDB44B64BF7C965AB5AD6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75cecd9-f927-4365-772c-08d9fb71883f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 10:52:08.4747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqSQt8MBEJ6kja17Tscj1MHgB+BR77YbMl3CjLw8/DRfnP7fpC4UkvmUSvGCQb4mb/Mbx3deiFW9uuqpe2JBUF+vFNCA8s6EVsG1iLC6IwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5487
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_025214_693357_01442230 
X-CRM114-Status: GOOD (  11.83  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8xLzIyIDEyOjM4LCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDMtMDEgMTE6MjksIHNjaHJpZWIgSGVp
a28gVGhpZXJ5Og0KPj4gSGkgVHVkb3IsDQo+Pg0KPj4gQW0gRGkuLCAxLiBNw6RyeiAyMDIyIHVt
IDEwOjU2IFVociBzY2hyaWViIFR1ZG9yIEFtYmFydXMNCj4+IDx0dWRvci5hbWJhcnVzQG1pY3Jv
Y2hpcC5jb20+Og0KPj4+DQo+Pj4gSGksIEhlaWtvLA0KPj4+DQo+Pj4gV291bGQgeW91IHBsZWFz
ZSBhcHBseSB0aGlzIHBhdGNoIHNldCBvbiB0b3Agb2Y6DQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtbXRkLzIwMjIwMjI4MTM0NTA1LjIwMzI3MC0xLXR1ZG9yLmFtYmFydXNAbWlj
cm9jaGlwLmNvbS8NCj4+DQo+PiBXaGVuIGFwcGx5aW5nIHRoYXQgc2VyaWVzIHRoZSBmbGFzaCB3
aWxsIGJlIHByb3Blcmx5IGRldGVjdGVkLg0KPj4NCj4+IFvCoMKgwqAgMS4zMjI2NTVdIHNwaS1u
b3Igc3BpMC4wOiBteDI1bDEyODM1ZiAoMTYzODQgS2J5dGVzKQ0KPj4NCj4+IFRoYW5rcw0KPiAN
Cj4gQnV0IGRvZXNuJ3QgdGhhdCBtZWFuIHRoYXQgdGhlIHByZXZpb3VzIHNlcmllcyBpbnRyb2R1
Y2VzDQo+IHBvc3NpYmxlIHJlZ3Jlc3Npb25zIGZvciBvdGhlciBmbGFzaGVzLCB0b28/DQo+IA0K
bm8sIGJlY2F1c2UgdGhlIG90aGVyIGZsYXNoZXMgYXJlIHVzaW5nIHRoZSBkZXByZWNhdGVkIHdh
eSBvZiBpbml0aWFsaXppbmcNCnBhcmFtZXRlcnMgd2hpY2ggY2FsbHMgZGVmYXVsdF9pbml0KCkg
aG9va3MuDQoNCkNoZWVycywNCnRhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
