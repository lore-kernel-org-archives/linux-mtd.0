Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C6BCCA479
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 15:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/oafqDYpAohlIFAjno+9hUOpHoCsJ17d23PMRRbvOw=; b=rkKGkdPVDn4gVm
	DgRS/6efB7joB0XFAqa5/3zcKSicrHDmbSiweyKYMUOuauJzigAOpVS4AW1/PfNeMe9II9Fdot+2i
	PVwWMeuvXAPoSV/pOxd5J4AXge8NAHNZ3VothisKYqLwONd8L0hUh/X4NELoCU5nvuR/KCqHI+6p7
	44NWmov8+yhfHoJ7AJVaViSn5/zep1b2oG4IROyR1DPzl4ok4h3EkWxzz5atvS6i7hfXrY+YumH3U
	iW185VPj0EIufoIq1JG5cIEdZEFzsgPzAAhmwUyTGuZm8tkX3feQyVGmUULIonNvNJ3VCWhz6OmqJ
	rGK18qobTd81Yy0qNNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSHN-00G1rz-KI; Mon, 18 Jul 2022 15:03:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDSHK-00G1nc-AH
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 15:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658156602; x=1689692602;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hB+83e3NtsIxcveZlGzr8AnjswBp2UWIKzAbFdX9bgg=;
  b=RKYhvSFzuktK7QmleJm4np61HygzQQ96QJ1dExvrVppFUY7KWxf+oDL5
   CpM73xUlePodyDpQhGQrw0rNzfsf+ugnAxDG7x59LoB5WO9tQEXI1E4UY
   C/QiOVf43Cw/6VWloVWGlglXMZsSfMbhAby3nGFD8qRevyBFKfAlq2ZDm
   Skn9Mcxymb2Fz/T4vHuxzY+bms4aOusFQzBikEjEeHfh+85pD+GiXv5XM
   p8lBu1Wx4zbM/a3XMdIY7wsdnn2S8HdycNytHClGjZebKSVqYyMuy+RdF
   msWHF3i5fMIF8O4urlylIK6yV+BKXlPCBl4BXnB1re+hXDD59FG0CbyiH
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; 
   d="scan'208";a="168329841"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jul 2022 08:03:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 18 Jul 2022 08:03:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 18 Jul 2022 08:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4WcXnE9sHnNfA5bVB+mfnAWqWiTW+75LPxOdqXYFe8EC4svNYTF7YkHHVvvCQj6pEO5nOoE2UY61aqJmGMtNYQA5L01GDqwiV/7oqTK3uq3K3GbYVRuM3Vah4puSl+IrVWTPI9JEYv7HPiFQkBpnDKzQddFYwFG1NI5+CczMmh96qVxs2r/i3sRgDC8RdJM8v2TA6VDlHxizNO0aHF3R2pO9JAbDwzjmaAKY2pqiODori1I8/avjpXot07Y0G3B5ppJlrzbFXptnhqEt3H7xKlvhS8h/lkNpAwhL+DrNQFlF7Fyko/lxUHCAEmhXDDjuek7C+eItrkMqOCYpnVYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hB+83e3NtsIxcveZlGzr8AnjswBp2UWIKzAbFdX9bgg=;
 b=DZfve14Eq2RCe4n7PHKLe0EZsLDFsSgdiIBaLlDzKSd7rIgp41/dN2gefa8dcuNbBzukmGvqJ1ZwIC0s8DGtnlRHd1uY8Afg0NIK2wx5G+UV87zx+WsAoSyF1DOVLhCpWEIvXpp/8Mv32UmszS+jElDczByIiVw0Yx/tEyxcYnFgGf/SgFOp6gk4O5Ff6F0UABp87MHPrxEYA83k3PwzbgoWzRPaEry9biYCDBI2rGzT0U8ykHWdQaaSALrnudl6DRsuA5g37qcKPReS2KLXiyuChH0FOhPa2livGxkoX0XsOz4jfw89gJ9DzZeJLDd5DRwkeJF+QEWzIFcOikuEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hB+83e3NtsIxcveZlGzr8AnjswBp2UWIKzAbFdX9bgg=;
 b=KxYB252IcXnzqhCnwLuo/ghl3daOCQtWaVveIKhzt91KtFgQ67Av0PCiaxV76rcNpNdS1+ERYFQK5vdFkygLGF6eWiISH4RvIem1xSO4h4co3uyMkjyo5fpjZyUy4P7T1oUs+sBSKkcLuZHOOQsaUFIZVvqwP7aFc9V9OUNyJxw=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Mon, 18 Jul
 2022 15:03:10 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1954:e4ab:eafd:9cb4%5]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 15:03:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: mt25qu: Ignore 6th ID byte
Thread-Topic: [PATCH] mtd: spi-nor: mt25qu: Ignore 6th ID byte
Thread-Index: AQHYmrd+aog517p4mEKV2tXjGhUFYA==
Date: Mon, 18 Jul 2022 15:03:10 +0000
Message-ID: <c553ae5a-3a95-7b24-09cf-506d1f4d2846@microchip.com>
References: <20211119080402.20262-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20211119080402.20262-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52e5cea1-59aa-435d-51e3-08da68cea183
x-ms-traffictypediagnostic: SJ0PR11MB5198:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wK3af99C4nSzAL20K56nQCta9md7HbJIKlZETB9hTURNuGXiSjakrpU6V2P8ZGR+d1E9X+UBKeGu836axwUiI9Sr44tHKfUnbLHvdyQH2+wU+CPjML6ux4KlsNjAphZW341zuquhV8g9bB1TAR3mMDAt/T9W30TahO8W19A7boH/6BXiwsMTytwX3tk+09Jz8pJmi1l8sXB4HqLuut2XpqUt3LpKizQdwwq/phkl1+kUkBhrRSPK+HsybxZ923BOTvhq4HyTPEntIhZbuhQUdHE5xp+J6BDxMT8paJlOZqv/vuyxY9oqzjbI9TDz7L1E0Xp44uvW+YsG3oRp4WGSADYW5ztVU0R4EOlgRdi3owpOQZ6uAusMS0RRao70W7Fs/qDQrJ9SxqUTs4b1vODNIGDmdzPsij7B9RAcR4ezuWecW8gwapwDEZMw+ixF+X+JSQXVT8SMfQ/lue/xXClf9GJEFzI1PMDSoyLsxd9n1t4xDVKuyOpUGI00OWMl3I5KQaLd7Guws9tAEXnYPEf8BgGpUa3SA9iYVHWidD9avCftDc3Atz7TQ4y/jr57gJzaOglqb91ZHhHc78Z9e8VS/Wq0gr6LMT0Pnc2CjXKD/gUKRtGIuef0bBrcE9n7OTmn/S45tkIUudvOj5RtvWDcCtGpUmcodjxfVUsy6OALlSAgwVQK2iVRUQMir1EmgctfhdNf/rMR28BDz+eQzxIwxsF3fQ0Pvrb195BOqquSrzhNE3w2upmTqaOQRukj8N4h5XsiTesOaSWW2BdBfKva4RBy3JI/jtFrjBWAVofG2snyMegWuMmEQeDbZ5wVIhrAg3cI2SKqVEvxzO2wWraPDQ5YCuIW/TOOtVLtM6U7seHtp4oLLH08PyT6sWI7I3AV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39860400002)(396003)(346002)(366004)(66556008)(8676002)(76116006)(66946007)(66446008)(4326008)(66476007)(64756008)(38070700005)(8936002)(122000001)(91956017)(316002)(54906003)(110136005)(2906002)(296002)(86362001)(38100700002)(31686004)(36756003)(83380400001)(186003)(478600001)(31696002)(26005)(53546011)(6506007)(6486002)(41300700001)(71200400001)(2616005)(4744005)(6512007)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFp3TnZsQ3cvcUtxVjZmVmMvWFFDd2Y2THF3SFhhMEMvbWYxdU94ZjlJb1Jl?=
 =?utf-8?B?YlpLZXdxZ0dCQkllNzY0TFJBQi9ETS8wNytPSVNmU2tpRHhHV29jcFdlU1VJ?=
 =?utf-8?B?Z1RaVEkzZ01hVDZQZURDWHJGcjRBVFl1TlMrM2Jyb1J4NlZ0OU9Jd3Fwby9H?=
 =?utf-8?B?SVZ1TW1URXc2eTBLaE1VQ2dFY3hXZFdFcHVySmJmTWtsNXJtZlcxem9YaGdm?=
 =?utf-8?B?S1BoN3FvTGtqQjkxRlpkQWZPWk5FMk1KZ296aEFkOGJqYVk5VGNTeTB6ai9E?=
 =?utf-8?B?NmY2UmdkSFAwWEdtTE4rUnhBREhETW40U1hWT1pKK1FsSEt5YjRobVo1M0xB?=
 =?utf-8?B?Vkd4YUZwWEdiNklQYnVCVVlOcmV1RFFKNXJxYlhlbHFZL1N5N29Ma2lpY0Fv?=
 =?utf-8?B?YkpnNTBobFpRV2xyMDhOMWpyaDFIOTQwR1hFNGpKckJVdUFhbTBadTREWnN0?=
 =?utf-8?B?UGRwUVUwTUpuU1BVSmdiS1RBT3kxOWFrSENWa2R5c2g5YUN4bEFXVGxJb1Z6?=
 =?utf-8?B?ZVRTa2taSU5kQkZvRHZrcENpeUVBVDJYU2MxUDlCYnpiQ2paNldtVDJ4dnFK?=
 =?utf-8?B?Y0N2Z3VxUHdmTUZoQlMvM2lQbFdhR0hnR2RULzcxSmF6TnM4Y0ZaYkhua2lK?=
 =?utf-8?B?S0FDVHYzTlBNbGJOT1lhTHFtNVR3N2xqMEpxK2kzVEJNUXE5ZDJmOUhhWHdl?=
 =?utf-8?B?RHVNTEJoYStLbFU3dkY1UGFpYnU0dGU2ZDU0NGNEQ1hWZ1ZDOGhFUTF2dmJR?=
 =?utf-8?B?SmNoazVzWXRWTlI0N1JMeU1TOTV5ckF3cEtObm5mYkxXUEdTSDdaTmxmK0t2?=
 =?utf-8?B?TXpDSkhmaWRtc1c1MHdka1lYd3R5L05DRzdNamo2ZElmajM4L1hCWkVIRFZm?=
 =?utf-8?B?QnZPbkNPQVNSRGpVT1ZIZDUybnAxdlVJQVF0Q2M4QTk2cEFORmhsQm1XQzBR?=
 =?utf-8?B?MmVZMmJuanBIQWhEeXJINGk2QWZuSkRnVEtPRUp3eVlBdmgva1NqY0xGZGVr?=
 =?utf-8?B?QU9EOWE2emFpVXY1WlVGaHpnZE9Pc1RzT05TRUhJRWdkK3YvZlVGOENLZTJ3?=
 =?utf-8?B?ZFgwcENIcmtwVEVSVDRkaG53dFljSk5XeDJyeVpsTEl2SjVBRmZTSjhNY3Z1?=
 =?utf-8?B?OUhqQ3BJOUFaRkEvOUs2MDM0Ymc3YUVURWJPdlpySkNyVjg5TXlyNzRGajJh?=
 =?utf-8?B?ODR3YWZuY2p6SXdiaThoMHJnUWZwQmk2RlpyRElvVVI1dFFib2ZFVzhUU1Fh?=
 =?utf-8?B?dUlId3RtUS80ME9uQ3V6S2drbEtTZDVsL0NsdzNoYVRPMW1nbmpNa05kelZF?=
 =?utf-8?B?NGgxdGFLZFgxWlNDYjNnOXpoazhRRGZJTllKcG80TTlLcXVmSHYwSmh5enYw?=
 =?utf-8?B?VytYMWJuWDhHdE1Sbnh3a1lTbm9kaHZCUy9TdVZSRTJPN3dxSjZHUXVING4y?=
 =?utf-8?B?Mm9PaGkrYytqa2JsS1VSemEybm4yN1lUNHBoVE93RTh0RTd1c3hEVFRJcnNP?=
 =?utf-8?B?TG1lQlg5ckF1cEZORzF5V0s3MXY5V2tFdHAxdlhkdVN2SmtaZWVnVnM2WG01?=
 =?utf-8?B?aHNRbFl0YTU5WDVmS2ptU2tPb1lnOUM1ZzBRTzFEcDluM2NDbkpobFhrUk1X?=
 =?utf-8?B?UnloUm9oUHJHaWcrK2RqZXY0VzJYVVR3YUo0RkVlOWdnQkJtT2thTEUrS0hs?=
 =?utf-8?B?UmJQNENjdUVRTzNhb2p5TjZLUi8xcHk5M2k5R0RnWkZtMnlDQ1VJQ0laaHRo?=
 =?utf-8?B?WWNVdkRwUHA2WkxoRytTaDhRV1pEQmpTcGJJZGVEdkxwREpodm1sVXcrd0VM?=
 =?utf-8?B?bkIxaVQxeU5mVjByM3FrRzd1ek9JWm9OcC92Z3N5aE5rRnlqelU5Nm1iZm01?=
 =?utf-8?B?RTFBOHpRaWVzdXVZdWoxelp0REVGVlVhS0ZqY1R1aWdNNHpybzRNazkrdkUv?=
 =?utf-8?B?VVBHT0NWTlBoWVkvMkhvdm53VldpdmlYaDFLTGREUndSRk9vL0RiRGp6NitX?=
 =?utf-8?B?aEVkb1NMa0trZ2xoZXNrTnVaMFBRVGdkWGNKak14bStSMXRTSkh3WVZXOS9k?=
 =?utf-8?B?QTI5bWFRQmViR1RRQmt6UVhCbWs0dFZkd1Q3ZnV0Q2xyblRJbG1jZXlVY1h0?=
 =?utf-8?B?VnFYMHpJVlFuV1kwVGcwU3VHQ1JrMVlVNiswQmE4WjBQa3QvWGtKcjVlYk9p?=
 =?utf-8?B?VEE9PQ==?=
Content-ID: <F89AC54D68CEF340B07254B5AF69AC80@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52e5cea1-59aa-435d-51e3-08da68cea183
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 15:03:10.8167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dsJ78R0JS+rlvMSv+1sJ8bEEbtvpUrRrfkm6QzazB2vPVrxjXwPPqMpunp+rGoeoLZ2G3x7BgtCSa271J/BF9GR+btUdYIfJ8xOF5dGzedU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_080322_476910_C59259EC 
X-CRM114-Status: GOOD (  10.29  )
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

On 11/19/21 10:04, Alexander A Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Ignore 6th ID byte, secure version of mt25qu256a has 0x73 as 6th byte.
>

By reading the thread I understand that we don't have a complete view
about the differences between the two types of flashes, thus I'll
mark the patch with "Changes requested". Feel free to revive the thread
if you think we can progress on this topic.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
