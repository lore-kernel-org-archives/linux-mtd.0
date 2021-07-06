Return-Path: <SRS0=yrYE=L6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BF4C07E96
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C44561945
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jul 2021 06:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C44561945
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaMYpjkQvj4kWvdStZ75SyRr+Q2ZS6/kkMtGpIsF+EE=; b=oomdUoyj8krn8H
	aR+pQ/fhQ4Jao/1OlZ5w+/0Yt/ybYHKRLYpe9d/srWL8WGxxGsZ4ArGF3cXWGq/dnR5GQRK/Ane79
	M1LgK78ZOByR+XGtoACdPrVbv59m50zkH7hbcB9PGg4vrRDPgvLFnvvcVPYdv/UvJWR+R1OeWVJwp
	af2VxAaCmmPpbHU2qemz8JXaQHuy7bAfMVOBL1cUxrj9kmfyYaowp+em9KAbGoso5wiR7KyDeX7x3
	/nTx9mnhlaAPwVJy9AmO9PsGiqmKRsFZnMGl60hITbnX+x2A8Zv3zNvUF4fGMjJ59pQ/zPHGrzb1+
	x0iSDEkQpMeptx99qjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0etN-00Ab7l-J5; Tue, 06 Jul 2021 06:49:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0erF-00AaaY-Cn
 for linux-mtd@lists.infradead.org; Tue, 06 Jul 2021 06:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1625554020; x=1657090020;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=eMXRWJGCHAeIB3753ZYmxWj6KEgDTywVgj3LUb5yNvo=;
 b=FhSrHC+ecGZlavxAH0UFMrI+9vo4iZ5ovL36QGSZm8zfS/f+0+t8D/51
 RJy+nlmHWf/53FuYsjqAVzwahir6BaEmLkcugcthPdLWQneXO9Jkv402U
 MolU6IDsSb9vHkVZQlZgYBoqBhw7AlOLCAkvJuSDsREcTIX7gMf+j+uNo
 MURV7PHE6QpqopKY1l0Zc+gRVhDqSS2Ho5UFLTQmtyeLq4XZtmx+FAHPb
 /8cmss8pR192geltuYxcDmT+hm6hW7aDUyFCFQUNxVEQWjy6AdznNcxap
 2hUDG0h5NkCYF2gGIaacrkSuhY6WpnshM68Dms2cSIdmeCXFPczlATga8 g==;
IronPort-SDR: nZjDj5xet1mDHHoxIpZkvLZrDvSz9LltPIY0AOx/g2CGuYfQsaCurczmwUNGvoUW+DKn6LbLBp
 XX2SDJ3ZLGz4h3snwBxNj/MWaLbb86y9sO2Zk8UFAjw7pRs7QvxqU6UtFJycGXeG5zbprisu/G
 Ga3IKZjybdjk4XQLGuWX8raENhN2NpzliHQdD5u3Y39BfyxcjafR1r3eVUyHqu4I0aQ+8OzIQr
 fSTa9Vp7K/2P9lHmpK32S37HdyQ5qA4asA7mCxKhitoykK9VkPsw9LA0Thy2gDddzsGV3CzQn/
 TB0=
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; d="scan'208";a="121068809"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jul 2021 23:46:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 5 Jul 2021 23:46:59 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 5 Jul 2021 23:46:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpZYPEq9SvWlp3Bwg6kafKsnSQTQaXHmNesLVWimxhSJ8WmNqsiytDuGEOwBE2LZsivQsmVzwan1l1cxI2HopRIiIuKBdxNGCMFa8KsWkS6K5Prti2ABRNSw7AYcAyZQb1d9lhi/3q57rt+GRESn7M/YEx8sbPSsty0zTspTPb4h+9bdIKI5jINihRmqEFXLCAPnHgUvG2RE7ftZjupfpbelpeFrTkR3KivFetLSuCL15Xe1nPa+1d7QYSNT4StVRlSCnusr5biqmyjQc7y3I74B+RDy5Wj4FZ4W4TqkYEwRyTnaPh0069CFePkgu9bOItvWWQxIFmQweBNfAViM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMXRWJGCHAeIB3753ZYmxWj6KEgDTywVgj3LUb5yNvo=;
 b=JfEidD6jmG4qbEOUuJs2RgU9PfF50gIAnU8qRoZ3qkr5vHTehe18yLV1aTR4pcMU/FZ46XLkoSqcFJlSo/2pQMamLj4qJEPN4Dm6A5RMtlpMGEQ7ldoZE2yK55zxoHCmeINwc+8+tbtm3Z1O/HW54dhJ0YzoWxEcBgc73Wz6QGTV4Ji9Z/W/5apEcsfnRLjcbQnoRTdeR2RukQG6qx6v8Z0qgqeoelWKtfcz0NEZPph2V88SFcaa3bMHLCghfNeOFlVd5yuoAyuPC9wKPs5m14zoyYVyTkjmYkjsu3bx74by2QMIAFv1bJ1ozoaz2rWlqVgdy3DeUI1Sya0vWICO6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMXRWJGCHAeIB3753ZYmxWj6KEgDTywVgj3LUb5yNvo=;
 b=QfCOjaohSwOBUsqqJSjlUbcBWtfdGRq3KF+b7D2nFCgExf0/2jXkaLPl4CyhQaVDgjwVQ0VGKhVxPmSXOzvyeL85x+DL7GPi/RS0vSR/j6tjHA5u8+c1T1WJ4pqD2yMMoX87pFsOBtKN8D1BRglFFY8FqWSYKVt5+6QMREYsLuY=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by PH0PR11MB4886.namprd11.prod.outlook.com (2603:10b6:510:33::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 06:46:56 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::5067:83f9:991d:2ab4%8]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 06:46:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <vigneshr@ti.com>, <figgyc@figgyc.uk>,
 <mail@david-bauer.net>, <linux@rasmusvillemoes.dk>, <esben@geanix.com>,
 <knaerzche@gmail.com>, <code@reto-schneider.ch>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>, <heiko.thiery@gmail.com>, <macromorgan@hotmail.com>, 
 <sr@denx.de>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 5/7] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Thread-Topic: [PATCH 5/7] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Thread-Index: AQHXcjK2rTxgLrYLI0O2xn/QpEc4ZA==
Date: Tue, 6 Jul 2021 06:46:56 +0000
Message-ID: <f4f86e38-9952-081e-4e2b-68a085839237@microchip.com>
References: <20210702144110.250481-1-tudor.ambarus@microchip.com>
 <20210702144110.250481-6-tudor.ambarus@microchip.com>
 <20210706063451.z5z5mb5z7jshifme@ti.com>
In-Reply-To: <20210706063451.z5z5mb5z7jshifme@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78a66728-2ac0-4efc-beab-08d94049d8cf
x-ms-traffictypediagnostic: PH0PR11MB4886:
x-microsoft-antispam-prvs: <PH0PR11MB488699CE554F36A28BB86552F01B9@PH0PR11MB4886.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qx8Av6esIKSgsiStPz3iOGbh1Jsv2yfiM5xnJYiUSPgMTdtMiJ2rtun+cexwojhumO6G/M9FIU5hT47HA+7TIXdYdsb03In6jhQu3ZHnQbAP78wywCJBxz1JzzH6nSVzo6Et+W9g/IochyDTHZClWR4CYHBz3pl6W6K1d7gox/hhHvNT4xq86IYWQAhPmVvYLYI5KcX37GADy3vBihlARWYOR+rS65ipMbNUiYGwGEcOeBJz2h8kejnmIARPGDYNtKVMqFo7P5vg3tLErFElUMegInmDqZsKlqO7enEI7LD22y1Rd5jS1kgiWuyl40pc4gvc8JOOAdCES+q3Qsy2g3KWel84/KKTWhUJv5XpsMZ95FoZNzx665fe492xLsMVq49E99SZMSc4U3CkuiETWX/q/Eft3dRagLTDjOKX7W6z9rivqfF8g3RD6h6niaqX6JlrGCRhHM/jpzvMo8Pt53bOpDcKpwcwRO2rdWa1On88DxEQ7BCbqKDn3d4iqdk6QXFuP+LoYFIGwGamasYcR1oet5AdAxlG5RUCWYBemLDBU7fBPQJOES+D0pm+FMeLAd3NKJC9MirOblzmaK9MkptS84g0HW6EXkIOGTw1DKPkvfB+C4Osk8qOH+ba4156Q0cJg9WSutxNVFcc39YI0uaEuYz8TM3EHH0qN/zBIxmP5487T9Ldo5o1ov2iD803wLG5IrHWSO5TAY+UlYihMz/s5uvSA+HPzAMZIGWDh/s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39860400002)(376002)(396003)(346002)(6506007)(7416002)(53546011)(6916009)(91956017)(31686004)(36756003)(2616005)(6486002)(64756008)(66946007)(31696002)(76116006)(66476007)(8676002)(66556008)(86362001)(54906003)(66446008)(2906002)(71200400001)(122000001)(38100700002)(8936002)(6512007)(83380400001)(478600001)(5660300002)(26005)(316002)(4326008)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmtCMG5IdFJCQ1pyRGM5K0xyT054NEVzVkJDV3dzdndSR05kWkNYa0xkc3Zv?=
 =?utf-8?B?TnQwelpIeFdmcVpoMjE3cGJRdU9sZ1ZmejRtM1ZaNnBHM1kvNy8wR2R3SDly?=
 =?utf-8?B?b1RheEUranZJOEJyWXRmcTFvdFd6cit0OEtQZWR0amVnVVhzcHVIYWtoK1pO?=
 =?utf-8?B?VGRTOGQxSTdodGVMVDJHUHpHWW1YU2hBNGUyQ1JEQVp6MXplSTNtemFONGNP?=
 =?utf-8?B?MVZtNTVtcGZkZ2Y0VEd3NEpMVG9RbXdlakFTRUM2R1VvUHFZa2NlZmthRlNL?=
 =?utf-8?B?WjJham5aWmIzYWhWRzJNTWRGbUNhais5eU9xV2YraHZTUTloYWgwMm51bmlk?=
 =?utf-8?B?Z2I3d0dmVytLeFFhL2k0OHA0cXZ0K3NRK2RUYjJtMHF4QmlKMUtHM0N4Mkpy?=
 =?utf-8?B?UGQ3ejYzQ2xkY3EvZWVKcW44aDFZUGVTQjgwZkhKcFE5d1Q0MzN4VnlsK0dk?=
 =?utf-8?B?VzczRVcvMnpkdGtyekdOTDE3ZFN2aWhDOFZRSGsvSU81UGQ0TWN5c0NUcmxD?=
 =?utf-8?B?RG96MGJyNU1tQVliazhvVzNnSklDTTAvTUVVWmtpMmRxWGJUN3liZlk5UmF0?=
 =?utf-8?B?T3ZTYVNEdUpnMkZOSk5ZYjd3Ymk1dGplbG9ua1BxdHpTZk12L0FRV3FSeElU?=
 =?utf-8?B?SVFxcjUvQVRXNVFlWDRMdnJnaVRoZEp2Uk1SREl6VTRKcjRCNThYcStSYmFW?=
 =?utf-8?B?dXVmaVRrTllzZTZhaS9HcWdha3pqMGc2emx0MzhwVy8vK2VVZmRkaE9udHcx?=
 =?utf-8?B?UkxQcGFuS2htU1hRL0l3NVFFclhJK1d3VlFsNFFLeGlTTGxCSWMxNWRMYmI1?=
 =?utf-8?B?MmNKeFRFc1h1TngycUhGNUxzZ2RTeVplWnZSY2xBdk1rWGRldjkzTEc5R08x?=
 =?utf-8?B?ck9mNkFFcWh4MTlJQk1iUS9mSHYyb08ybG42VHJxbTRLeHJPc0R4MGg1VWtq?=
 =?utf-8?B?OS9SMy9HcURuTUJFS0x5dUFqc2ZCKzd6cFk5S3hrMHVGMVRMMXBweGVkUThS?=
 =?utf-8?B?TzF3Y0RBRFJEM2RGS0M1RDBvbmYwOEIxc3p2R3JRemhGRlFrcVg3YVhodWJS?=
 =?utf-8?B?YVlSOTBpSU1SaFhZRC83bkhmaGt0K1dJcldhRkttVlFBUlhidG91VUthY1hZ?=
 =?utf-8?B?MWpwb05pOERVaHZzRXJTOStJTnkzVmJCMzJTYjkvZmcwZ1JmKzh5djJQeWNr?=
 =?utf-8?B?Y3NDd0VaRS95Q0EyVzZ4TUxrOXdobzRSOHQ4TjhyUjBSM0ZDQXRVaVVnclVi?=
 =?utf-8?B?R01GL3FKcHY3c0N1S3RwU1dMMXVLOStvSmlDSGdMaGV1VVE2ZEt0Z2JhM0Ur?=
 =?utf-8?B?THBwQXhqKzlVUEo1OERxMVVPdDI5ZlJ4V0gxTGkva1VEUHVkZ2w1LzU0cURF?=
 =?utf-8?B?RmZqOExFYjVkd09nbDRJVldSK0RHV0xSbmpiYlRpSlNuNmhuQTB3eWg1TVZY?=
 =?utf-8?B?cVJFekwrcFM1N05xRUpyV2w2Yk16ZmxlRXNvTjJXQVBRWFJiM2JwODM1RzNN?=
 =?utf-8?B?WHJ1RXpJM3dLZ0x2QkRxdzR6dkxaaEovS3BLRnJjRG5ncnBwaGlBRG9QNFpt?=
 =?utf-8?B?b2YvVzRWY3VlRk1zKzZaNXowdGdQbGRnUVAvTW83eTFtRTR6eGl2a1NzTXo3?=
 =?utf-8?B?YVQwMk9TVUxWZyswSjRFMUN6S2V0VWlob2UvNEdlOVI0RTJWSy9yRnNxUmhZ?=
 =?utf-8?B?Mm9JZHdCajFwbmVOYlNXVzFHTnVoZ1Nqd3RNRzdKTTVHaU5XcVVtb0t6VTFS?=
 =?utf-8?Q?GxAclavRNo1N4f+c60=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <0F7326C1981ADC489BC88971B503CD7F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a66728-2ac0-4efc-beab-08d94049d8cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 06:46:56.2844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rn4FsvqNwVd3OYNBVo6KrGoag9goFG9uSUssvEh8aUsCswUaHzQxVY5IN/nVgI5o4s21uezPeuoswMCfsmOg6wudXdlzfxipzu9ZmSNorWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4886
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_234701_571459_4E0EB411 
X-CRM114-Status: GOOD (  21.18  )
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

On 7/6/21 9:34 AM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 02/07/21 05:41PM, Tudor Ambarus wrote:
>> Some manufacturers completely ignore the manufacturer's identification code
>> standard (JEP106) and do not define the manufacturer ID continuation
>> scheme. This will result in manufacturer ID collisions.
>>
>> An an example, JEP106BA requires Boya that it's manufacturer ID to be
>> preceded by 8 continuation codes. Boya's identification code must be:
>> 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x68. But Boya ignores the
>> continuation scheme and its ID collides with the manufacturer defined in
>> bank one: Convex Computer.
>>
>> Introduce the manuf-id-collisions driver in order to address ID collisions
>> between manufacturers. flash_info entries will be added in a first come,
> 
> So all manufacturers with an ID collision will be placed in this file,
> and won't get a separate file of their own. Ok.

manuf-id-collisions will be the place to add new flash additions where the
manufacturer is ignorant enough to not implement the ID continuation scheme.

Collisions between flashes of the same manufacturer can be handled in their
own manufacturer driver, macronix being an example.

> 
>> first served manner. Differentiation between flashes will be done at
>> runtime if possible. Where runtime differentiation is not possible, new
>> compatibles will be introduced, but this will be done as a last resort.
>> Every new flash addition that define the SFDP tables, should dump its SFDP
>> tables in the patch's comment section below the --- line, so that we can
>> reference it in case of collisions.
> 
> Can we have this rule documented somewhere? Anyone who doesn't closely
> follow the list won't know about this rule, and having to ask for it on
> every new patch would be tedious. I am not sure if we have a place to
> document this that has high visibility though.

Yes, I thought of adding some guidelines on how to propose a new flash addition.
We can add them in Documentation/driver-api/mtd/spi-nor.rst
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
