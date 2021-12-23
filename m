Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7A0C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8kEjSaL4eUzrbAmC8RzH7j9RFCnRd15LS5gWY+pz98=; b=L08bdnHEFgCI2k
	RRhHHSCp/3125Q69ijBhoLLp3/HHuAwSWynrpnhIRYjewcHxkCh50UzyhNih9uA5ZYwhEQ4Njx3kV
	n+PnbwS7NatTHZxmaf6nbpP2K2Tv2gjPZx24i2WIvRWigU3lTYs9xvuZ0zGbWs18ZLI2Q3qJW4DXC
	qygE3QzgcusoaCoWsnGEK2V5JQLINCrXsLvR2GCkEZJF4gfUPjx5iMgA/ufazO9JRPYlSGv7aobRs
	NBTHPY/VXm5PxEnbK6FQlFVcZ0rMZZCX4zK6la7aSfBpnatTM6B9sR/ijHj8kIdT0fqT5Xp4SdzVX
	7H5qzVaxNld8OGVhsX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0O5H-00Cnag-Qd; Thu, 23 Dec 2021 13:24:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0O5E-00CnaK-43
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 13:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640265876; x=1671801876;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=xBo7p3t42/nbdCrCe39eQQVsy0LNYQAfk8M+gsw+IPA=;
 b=umAhRWTw8Go57De6UlcIoFyMc2ERnzawVQlItuU+4/tkhL2emNgYcIn2
 JvJPD1jf4BM9njg64QUSqPBUvzI60uDgrmttJr2Kg7U1aTUx9bq9BCxC6
 rkVY5q0f9AhLdMA7I1NNSzyxuC3nf1gPiOaXPmLyMDxOm9hq1cZDeGPpk
 3IJqaDgqTvFA7YACrdyV9ojY5qxR1Op44ZmGSDG4hRg+shA0ZV2Z7O15v
 2LacLEDsfe/J1hiek7vGeN2ui7CILuynYEjenpWx2XHXOlF6lVSp75Nmk
 ldmuUqWTxxpD9YErDciotBl6X8znTlJadtcV5FHLYQH9PQj1aFTMfpV09 A==;
IronPort-SDR: H3LkQQ6AaXtS/3wECB1MmLxtNnOofk5f0FmVZVL18MVPd18kgC3rpM+fGOOy5hIdDbWiuDf/uY
 DkNa0p538R4EdGYBJ/RKfLI9wCHedVp3mo6jJmBO+3sm+z3jCQ7tpQAzAGJpSl+3nkZz7NfVCS
 gQtWASMBbBZccGE03U0YOm8JjyLHN4jmgIOL90gQWohN8uFUi28QWHmd9tiYxbCC+Rb0eyFQh2
 dnC9V1Zji3FMrm86XUYLoaKdQFI7/yulC/kDloVg51GJ/fPxGP5r/gk9AyjoAlSlCz/4WCmfgn
 KtY7GvbnI+6WMRk76S9iH38V
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="143361109"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 06:24:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 06:24:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 23 Dec 2021 06:24:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqWeNA1rgSO2O5yhtyQPFVouM1DOsn9F8aRrwqDEVMOR5o4VKsoCSoLxJS09pRyjVktG9M+E1ok7BpV48dz27xgX14XO5z5LcqwgUDhssiSbemazxWKM0UuDB3duuxTDrzZIKdGC5/SRkLpZckS+sy+4NkG4syZCssZaRHDYVGFTwxbi+SB8umNMh0hQDf2Ao28F2NhOhNlxVdQF+ScU8wVbR21sPfffL/dgiuY0qFlDJvv0sVGzF9uxsOQY16l44AXBjegzTCWOMVrNDhr1cGyxrTOUH5FMILhh+2bNTxBjtwOJWOQgD826/vQotAgMogLZf8S29iWRaanFpTBRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBo7p3t42/nbdCrCe39eQQVsy0LNYQAfk8M+gsw+IPA=;
 b=F4epOgcJDNVE13z0lcrvGxSRJmdBZZJPBzOlOBUriFhkm262DHiS2eiR4DZ/8s0VpLJgX6xQgxPLGi5en+zwGKyDmDTvhVHzbHPSUQggnMViIsf9+lBVgV70zxcnSEg/ACuc4/fsqWua6cFcciFT1vRBY6bZq6GfVD9o4EANZRenonfZ5nN2OGdYIJ4tgJIPRMA0iR3OZP8zBAB/KFE+OSIMUl9kSce38bvgbN2s9FYBg0CddyGjNZnq+s5rKemUiRKz73+Ey9F1otCWdiDIRoezy1faXN+Ow2pBhg7KP8k7Z3YAA3xilC0k1c56T4JB01udroW1j+6SMpbjYPozQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBo7p3t42/nbdCrCe39eQQVsy0LNYQAfk8M+gsw+IPA=;
 b=u5BAZ1XqSi4EppZfGucWwZXhQNrE4KBuWBvPx4S3SNR5GoI9Hx/5Fee/PiCbeHRiL5Uh8iZazHSvN6CHFHi1jY8nbTNW9W9Ovh9gkJ3T1q774Q7UMpTYOSabJcpC1LCWGnLlyKZfI+si16WU9JYV/glHvUf50SCjiMSrBJGjLEQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 23 Dec
 2021 13:24:32 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.024; Thu, 23 Dec 2021
 13:24:32 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
Thread-Topic: [PATCH v2 2/6] mtd: spi-nor: spansion: write 2 bytes when
 disabling Octal DTR mode
Thread-Index: AQHX9/3dZMPS/7j9wEKlAvg+zFmXJ6xAENsA
Date: Thu, 23 Dec 2021 13:24:32 +0000
Message-ID: <3b52e88a-9e34-9089-9d57-62eb5b50ef4a@microchip.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-3-p.yadav@ti.com>
 <ec30ca85-5341-cd06-e007-c6c9aa24b0d1@microchip.com>
In-Reply-To: <ec30ca85-5341-cd06-e007-c6c9aa24b0d1@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a15710b-709b-446d-3804-08d9c6178e60
x-ms-traffictypediagnostic: SN6PR11MB3055:EE_
x-microsoft-antispam-prvs: <SN6PR11MB30555D7ED1F3A36BAB1BBB95F07E9@SN6PR11MB3055.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AZCCsi4UXUTvb0TreSXMUUz4f68w7P+Mur01SHeRUDrHRiMop8oxBgHYU5w7s+M6mkhouigdZNFVkHDVXaY+hWEFu4om8p7tqjlG9hwxIT6o56KL1BDsvOUzB1isrGdKJLRdipbTlNd/VCDXFXektyiJk6P2cRMnIYAbIG2xJPnqaSh3n+7fqT5t57bzlMezxJETQ7dDIWND15LN/03qUmDnHDY6ghsXklymrKWeSk+Qa4Cqu/fgjOukZ49VPE9znCP9aydquREgIhuHsIomgdgwtflKbD759zt5vJPKsK8yeMUSnghH6WJ/bcpZ+tWdmr+cjRlAlhbzvxQD365c2e31tWdZ8kMg7X2u5aO6ImlFwozEBoZpIOmsnCcXGz+cGOthZxOoOf7FKYCy/Qhu8UkFC1LLED+wAYwbGgqTG5usvJ3YaVY/yNUkfZRmKfnH+VxaCa7eglecDlcMtmQT3E8tklWliU4QYecTNEv2gRgriJ1vRwv4zyTGQCQJfyscR0qeAUADldw7URGW6tPDXz05eYw9OBfaCNJVLSIfJB5qBpQb4ayMfZ5NW2oN6QyRqcMxyqzRQ9NhaMvt/TTPRFapivS1IyYSh5EbQw+jgM/Ax3nftZNT1HH/qh/kHhSy+42uiR/2vZP7rWNR2I8IoM4/gxQODaz0oaqXKNjqPN49W1piwfRzw74wCTcsgrlTdcPybjt7A01EFgvi0PYh/SjQ1NBKcz6ln6/bbUSXIKJJ/bayJbb9CTKhH5X003NTwk8C1CrnbYRa3DuHDL4mA1TmLLJ+XIXk7arYOoNOISeykjkfztjyBYTWqfRCqaLbrny4PNN4jYNywzC+tdnSmuZdm1M31kYAxwUJgbL1cOI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(31686004)(122000001)(186003)(38100700002)(36756003)(83380400001)(508600001)(2616005)(2906002)(5660300002)(38070700005)(6506007)(110136005)(53546011)(66946007)(86362001)(6486002)(66446008)(66556008)(64756008)(66476007)(76116006)(91956017)(8936002)(71200400001)(31696002)(8676002)(26005)(6512007)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d1NEVHF0VFkyWU1tOGMxZEhhekZFSGZvMC9RUWpFekF4elhNZVZhdnN5LzUr?=
 =?utf-8?B?Q0VIWVo3Z1cxN3hISEdPaEVpS2RwcGk0STFUVDB6cnkzd0xBZkxMRDdyQWhs?=
 =?utf-8?B?cTNXSXpMc3hnZXllNU9jeFVRdFRkMEFVZmFmdWVrTWRpTWJyVFhxdFhYY0RW?=
 =?utf-8?B?TDd0c0l6TjJ5RUpEWm1GcWJRNE5NcGRra3JtYmY4UFVGSlBxZXI4Z1c2TWQ3?=
 =?utf-8?B?UlJJTk82OXkvc0dmZW92eHk4S2ZRa21IS0NkRk1BY2JNMnRKaTR5VWFKZmdL?=
 =?utf-8?B?cFFLaThLLytqV1dSeGsyTy9DMnZzdUFMZHVSTWorQkhMZXFyNXd4VnFHcnc0?=
 =?utf-8?B?bGE2aDJRbTFRanY3Z0hqZk1KQ1ZEd0s0SStCMU1Vc3YvSnhJemdSb252MUEx?=
 =?utf-8?B?UnZuMFRxK2t5ZnBSKzR3U2VNTUdRcExHWEhON3dlb2Jqc2VmcG1pTW5rVFJt?=
 =?utf-8?B?RWpnL3lHK1VUMlBYdXhzY3NOeGUyMGdzdFF4WWpPai84bjBlc2dRREV2c0wv?=
 =?utf-8?B?ZWVQUVcvVm9pRURzR3dGeWhjRHc4MkhlcVd3L085MmtQUmxBSkxNTGRqNEpH?=
 =?utf-8?B?VTZrVmlocmRpQlFpTGNwamZSeWx6VVp4QXpIb3craERRUWF0TE95RUgxMlVG?=
 =?utf-8?B?dXRaZEtLYnpPUzJvRFdSZm1HcUhta2lDaURtRmlnN0VJa3g4SWJ3ZStwSUxR?=
 =?utf-8?B?L1pLVVNmbTc4UVllTXJ3S2N6QStLREJPTUdNMWYwMzlZdVR3eVlSOUtUYTI1?=
 =?utf-8?B?NlA3aTluNTNZSC9XbjRHVWVtTEJUSSs2TWxtVlIxenRuZjEyUzBKSGRGUE01?=
 =?utf-8?B?UVZpVDBpOVo1VWtCUlN3NGk2cWJiemhSWk5QNTliV09TSXJRZ0N1U1Y3WDVK?=
 =?utf-8?B?TjM0dTBpUVQ1WDNkS1M0ZDlpSWFJNm5QRDdaUVFJZzJlWGJuaUxkUGtzWlNy?=
 =?utf-8?B?dlFEeUtNTFlyZlpEd2MwOXhVRjE0YjFCZDZUY1dEMHhNNVIzN3IwM0k4OWRT?=
 =?utf-8?B?RWFob1IvQVYwbTZ6UkVxWDFUVlhmTWJtZ3hFSEJOMjVMbjdZYWVXRnlRSTdh?=
 =?utf-8?B?c09iYTV6dFIzSG5MNlJjN1RJbHUwTjNMVVZXRkdkOEdVdE0zZW1WUjJDanJj?=
 =?utf-8?B?NVJvYlY2Ym5iWk1yODN6cnhtbDJEWktxalg3VzhmUm92bkJBeHhkMU4rSFMw?=
 =?utf-8?B?Z1g0Nnp6MkMvYjlOZUVqMGpJSE5YdGUvVVZoamRVS2dhWDQxUXhUZGdWbHNT?=
 =?utf-8?B?aXBkSWJSRnNxMGp2UjFIbVg1RTVlNDZXV3dOWXRKdENzVjFDVEk3cnFSVERZ?=
 =?utf-8?B?dUtYUWNXRUh1Q0kzenF2K3dmajNDM1F5U083WWNGL3hTd214eUp1QnpxNzRX?=
 =?utf-8?B?OVJ4MkVkdlBkYmVLODVTa2hDajE3MzduaFVrdnVBYjA2RjZlQjJTemVRY1hK?=
 =?utf-8?B?Y3pYdEtRNFJFVGVIaytJUjNjMFp5TFErZmxPR3NnL2oyUFJMRW5aY2VVWGtV?=
 =?utf-8?B?TTd4TThJVDlVUWdLZkQ4TjFOM2VNckxwMVRJQUFUMXRGUmVha1ljOU9CYklr?=
 =?utf-8?B?U1dOblpPSW1TN3RHWHQ1d2wvVGdpNWo1SVVTMDNwcWFWWkhHNzdpek5qTjNw?=
 =?utf-8?B?NWkwU2Z6a0NFK1plMExJRVBpeGFOMkE0N3NqVW1TeWIxcmg3RGp2NHEyUVh5?=
 =?utf-8?B?NEZidS9wNXBpKzdEakhodjcrVWs1RWZwQ3JkOVBYa3AxQXlpWjBOZXFhTXh6?=
 =?utf-8?B?SDVNNFZXeU9kNlQ3Y21ZcjFOUlpMRWpjOUdiK3R3NHR6QW5rUHNTUmtlVWlL?=
 =?utf-8?B?enZVQkFvQmZhYndTeGdxaEtxdVR3S0UrNDJIaXZMUFQwbUdzdGhGc2p0NW5O?=
 =?utf-8?B?VklhY2d1Qm4yM0RiWmtKUHJGTlJOWVA2a1VZdGNxbTM0blRhbFpZbDdMVFVo?=
 =?utf-8?B?a1ZDVEkraG1tQmhQL2dieXg5TlB0a21PUUttQ01FYWY5QzhzeTYydnFVM05h?=
 =?utf-8?B?aHA2UmdsUENnQlArajFZeVBaaGQxbU9zc3lFS3JpU3hhRTRGaUN4bEttcytq?=
 =?utf-8?B?bGQ4V3g2U09ZdVN3K1UreUZDNzNCVkJXODdtWmVFSDdNUXYrK1hzRzRoYnNv?=
 =?utf-8?B?V0NjNzZMT3pSY1hWUlc5SlpJSUJ0em1YbjdIajVZUmVvdU9kTVBjM2VWV2hZ?=
 =?utf-8?B?aFQ4SkVrak9WcW90UUJIQUcyS2REWS82Sk12NThiR3drU1cvNW8raVh6aTJw?=
 =?utf-8?B?cHJCampOQUFaY0ZRaEMvSERZcFd3PT0=?=
Content-ID: <74D24A1142306F46A4E535493687D7A5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a15710b-709b-446d-3804-08d9c6178e60
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 13:24:32.4545 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +TZxDs0hOSd31DxZcUISBhXLlmTRnC9JCH1rr3rTNaWgvlwHkth9X14pX/qdoCI1p4q3XopOZhv6cY1NoqJMqM7Odaqjwpy8x1bGRSH7Q4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_052436_280198_6DAEB387 
X-CRM114-Status: GOOD (  21.04  )
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

On 12/23/21 3:06 PM, Tudor.Ambarus@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 5/31/21 9:17 PM, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> The Octal DTR configuration is stored in the CFR5V register. This
>> register is 1 byte wide. But 1 byte long transactions are not allowed in
>> 8D-8D-8D mode. Since the next byte address does not contain any
>> register, it is safe to write any value to it. Write a 0 to it.
>>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> ---
>>
>> (no changes since v1)
>>
>>  drivers/mtd/spi-nor/spansion.c | 18 +++++++++++++-----
>>  1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index ee82dcd75310..e6bf5c9eee6a 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -65,10 +65,18 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>         if (ret)
>>                 return ret;
>>
>> -       if (enable)
>> -               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
>> -       else
>> -               *buf = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
>> +       if (enable) {
>> +               buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_EN;
>> +       } else {
>> +               /*
>> +                * The register is 1-byte wide, but 1-byte transactions are not
>> +                * allowed in 8D-8D-8D mode. Since there is no register at the
>> +                * next location, just initialize the value to 0 and let the
>> +                * transaction go on.
>> +                */
>> +               buf[0] = SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS;
>> +               buf[1] = 0;
> 
> how about writing 0xff instead?

it doesn't matter, it's a register. Will apply first 3.

> 
>> +       }
>>
>>         op = (struct spi_mem_op)
>>                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 1),
>> @@ -76,7 +84,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>                                            SPINOR_REG_CYPRESS_CFR5V,
>>                                            1),
>>                            SPI_MEM_OP_NO_DUMMY,
>> -                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
>> +                          SPI_MEM_OP_DATA_OUT(enable ? 1 : 2, buf, 1));
>>
>>         if (!enable)
>>                 spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
>> --
>> 2.30.0
>>
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
