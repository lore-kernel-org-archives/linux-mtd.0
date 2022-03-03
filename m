Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68DBC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Mar 2022 23:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLZwH4gNTfaN5w95hYs/oxxL78GMhgAKc5107OV+PTc=; b=1y6JOACiIgONi4
	x+eAd4WYP0h0LvboESojMUG6cyQqUHbMHi11ax/PY66h0NXIU6Tmu9GUJ/MclRlBspNLUpOtN9Tah
	IHKE0M9Q4ZWtMQ8j0kNKL/zvZuWRn5XARaq32Zj3Q32zqgHe9rmuVDRZm0nk4HLz3cawDwH5Vg7+g
	bztdiNauvFHgR+EF0uhpNM1P5O3TYNhXkxJ3O7wJoKnOiFyBsiANoofRR1c/a1aecd00te7P8ls9Y
	TQ3QoDlq+d+EySDseccvSdzetZrVng76jjb1FCrB4QcW8DFbCUMc59aBrUfJKM8Va0tgJU8DpTVHf
	9olcekH+nm3ozTKq1cFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPvDk-0086qW-CO; Thu, 03 Mar 2022 23:50:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPvDg-0086oO-EF; Thu, 03 Mar 2022 23:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646351452; x=1677887452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=fp7nveG17hioNsgE5HEulBeoP8/5syXdKbhLPvIAABk=;
 b=o7LDp5NxNGhe505BcneZbqcmEKBAQ0xMYLivFWh/jno/5QrCnNGuTDmq
 v+48rVZ9PZiLpoF3gTq/hp/a/4C2+wH+U+ZKD9qSs2+p5X9F2wco1jWUk
 nClCpOCsziH3+f8cranLEq9ac7o0p5pzQT0FTNMvDdziRS62VvUoPVAxI
 HLouFhRhH/9x1m7F3K7aA+ShiB1h2VGrRlxEamEqVNqsUHaH9AMLgQdc2
 B2ld8yeHPjFkw/0IwVIbHmYfggne3qcC3wUjOKyoVIICkTeY/hGe6G2BW
 oEcp3nyjE0U+s+WwcjbcLo7x1CEOSUljPswQF5K2UVhFGbevNFabIbfL9 g==;
X-IronPort-AV: E=Sophos;i="5.90,153,1643698800"; d="scan'208";a="148029871"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Mar 2022 16:50:50 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 3 Mar 2022 16:50:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 3 Mar 2022 16:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FJp9Y6+ASH3fVhNevc5swLwx/xDrEKqA22r3CmAHQZ1BndxvtLoLb4MTZ2qDfdV1H+omstXdxmnQ6myJ4lLutAnig1cal/XK4oreOpZpXJXRymR1OgUTGleCoDSgiMBmtOcTAH6JnNGD7M7BbXtKLsikqU3cJ2uDk8h/h54Vir4KhjKUWQMj5ZX94kSLGvmqXJIf2TyhxC9bI1kTt4gWVF1L+FP6kYPLI5oS26L2vFNZ+flAdW2l8F6dfkgIlehSdARKadSlZz6yGqfB3S472D1t0j7CuuIoiZLdVHzzirjxEB1HsYqnswPZNP0v2T3vvzMlfBptgEAXDglYrUoJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fp7nveG17hioNsgE5HEulBeoP8/5syXdKbhLPvIAABk=;
 b=lJH+zR4k11ZDfA+B0sYdYsmmxIv1LsvDNVVc/8H8pjJ4RdLMVrNGFhTeAFvFum8NdzSD7G3Hxt7Cje8UlTivHi0lRa14wFilUJL/l5mzpgOqOO9si/ijqRii+PAAFXCkVTdNuEnfJ2J74n85VWEMn06hOdWzbTvw6Jx3T9L779rGxJxTvhELwB8Tcxq0rbNq7Hze9GZoMSdqmx/dYW6QAKNX5mE4SSyDXUsWOtz0Jo6tTFjduV1DcpRjzBK1DRNl6gqCrrbjIeaOkRehnBMvd6uPl9YeX09i9ulM6WJnq16uPdmkEEYDpvkjEOubpeHUOmHSq2Mqh2w/RUdiCGHSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fp7nveG17hioNsgE5HEulBeoP8/5syXdKbhLPvIAABk=;
 b=UeHXHamhk+VUbcCTErU3EXlyPLNbHmdszfPxSCiUMMAGkwKJK9BLsimjGctyiA/E9LMVsxNoWvoyp1R4SMCdXSMUWcizdrhcFOaeJEKGWNPkNcXevTuRCLvFhWuO5s32tyq5VmkNmjpcAjbvI6JUsy52UgXWR/OMi+m0h+Ur3tM=
Received: from PH0PR11MB4869.namprd11.prod.outlook.com (2603:10b6:510:41::8)
 by BN6PR11MB4161.namprd11.prod.outlook.com (2603:10b6:405:81::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 23:50:35 +0000
Received: from PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::99fd:2029:398a:65d4]) by PH0PR11MB4869.namprd11.prod.outlook.com
 ([fe80::99fd:2029:398a:65d4%8]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 23:50:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <macromorgan@hotmail.com>, <michael@walle.cc>
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: manuf-id-collisions: Add support for
 xt25f128b
Thread-Topic: [PATCH v4 6/6] mtd: spi-nor: manuf-id-collisions: Add support
 for xt25f128b
Thread-Index: AQHYL1l5tOtnFJYJm06gyUfnCozfew==
Date: Thu, 3 Mar 2022 23:50:34 +0000
Message-ID: <1e78a5bf-8948-c998-8275-87bbf841c304@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-7-tudor.ambarus@microchip.com>
 <1a05176e6e2457c1b86035522c3f691b@walle.cc>
 <SN6PR06MB53428C8EB83C2DAFACFDBE70A5049@SN6PR06MB5342.namprd06.prod.outlook.com>
In-Reply-To: <SN6PR06MB53428C8EB83C2DAFACFDBE70A5049@SN6PR06MB5342.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7b526576-b31c-4dfd-2787-08d9fd709c4e
x-ms-traffictypediagnostic: BN6PR11MB4161:EE_
x-microsoft-antispam-prvs: <BN6PR11MB4161C1B632042F777AED7A92F0049@BN6PR11MB4161.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EfBanZQd+rio6XSARsJRsrfjXFRGo8tblVjwH5w5sv02KF2Mo5wL/dgc1/IjC5UWTY+av6EUXPgCQISpZ7J0xeLQVihfIk33ugPXLe0RCjZ2RB0BNx+1QwZmnnVqJH6JQm7M0lEMk4nFQy9YRyQ3s0tcqFb4sFhINMzbQ1giaVYCYGMGsDU5sfJ09TZAxPLLvucmfcHdyWT2hTnOwkOlEngtTCts0fFZ9JG844IJp1aDM6vHekNK+5JwwgIeAKl2KNjE1H+XnKPGHbTm1fLs/rSkgTRARIhIK66t7RqgxW7AeEqKSXB++6SVjm8AHNJcpiemYF0pX5s0PW8XtN82aY51gdTDU4ASzcy4QLeRpr2pz/Q5VAxyac/iP78wR7R/PAYHVsgE1p97pDBi458VpLmLDgpy6tfV0nmBRij7s012LmoMNltI2Wz4ZsgiEGAVM+p00Hdzz54yHD0kYwUpDWxWu5Rol1Lsg0ZQlyr4BnU57LhclM2cCkJkGB94cQRi9Vr3rCemU9Xemudsk9F0mnQ5fAkZGOPSMdpdYHIgvjM9bohI/b9nIagWxs5mC/0dgC/1yDpy0vkEq1oXmSSqyxxv8sQKq18kmKltQAD4x5680bSO26mhp4bdck5DU7SdsVctMTUC3a6lQANW0y0CWS+k1n6FBMFIbsaPNdcI8QPh5IDjoKZKrZiGD//83c3MJTpAQF+zodEpAokL32qQAsTWxAne1ZKDC0ONyOQXYtFVCkcwAZI2F2iCe9ZL4sgbls31ld4wg1SlcKEqmblQ4Dm7AOLUvvsgEfqGcnAhKEEG8puZgboSmXJvS2KirxMFPrfxZAeh1Kswfw/giA5i2PjnlIDOONEGj6Nn198BF18=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4869.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(186003)(31696002)(2616005)(107886003)(83380400001)(31686004)(6512007)(6506007)(2906002)(53546011)(36756003)(122000001)(71200400001)(38100700002)(5660300002)(508600001)(8936002)(7416002)(91956017)(76116006)(54906003)(6486002)(66946007)(64756008)(66446008)(66556008)(66476007)(8676002)(4326008)(110136005)(316002)(86362001)(38070700005)(138113003)(43740500002)(45980500001)(473944003)(414714003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWNNU1AzaFdtSzhrUFdjZXJGbTR1Q0ZqOC9YZTFhTVFKMUYwVTdoVFVGZ08y?=
 =?utf-8?B?VHFmWExmeWdITTFxdHhXTDVBdDFZV2loY01mcUpiN2dLWDV5WGRsN2lQU3la?=
 =?utf-8?B?NTRnWG91aGdIUmVyYlQ0VkJ1OEMxYVBSSm54WlMyOVlVN2p5aGdiZDgzNVAr?=
 =?utf-8?B?SWF5VVg5VXZ6Z2xWRHd0TFJvMnNSckhQY0xZK29wRVIwUVUyZEVnQTBoKzRT?=
 =?utf-8?B?S1V5SnA1WkRjMnFqWU1HKzZheUtIQkEvK2xJZW1QNGh4aXZSVmJtNUt2Y3Y0?=
 =?utf-8?B?MlJueXJ0aW5OYnZobzBXWGcxRks5bGlqRi9nNkVNU1hFTUdhOXY3cEFHSTRz?=
 =?utf-8?B?RFB6Y1hGa2dZYWlOSjJCVnVmbHF2RkpUUWJhQUJZV1k5NmtZdHhFK3JMTmNx?=
 =?utf-8?B?WDhCdmoyYzAxNkVtRHJhZGRhSlY5VkpXMzM1MTZnYm5ldnJUN2JiK3E0QW1m?=
 =?utf-8?B?WFJXTDZkb29aVVQ4N0dkb1RuWFhlOEVKVWxvQzNTcXkrcTliOWdtK1FkaklC?=
 =?utf-8?B?aXBQRDQwQWRDaE5LY3QrSDVVY24wMWhzTUlXL1RnM2U4SWo0U3RiTmZQcXR4?=
 =?utf-8?B?WkdYR2gxT2tSYzAraDd0aFFFYVlqTGFJUmFOcXhlNitFQzBHQWxCOU9MZXBF?=
 =?utf-8?B?bjNOV2FBM0ZudkxVQURsYmZHckJiaFBjQ3Y2OVZ3UEdKT1p5QmMxT1FkSHlr?=
 =?utf-8?B?cDg2N1lWZGg2OWptV2d5ZUtUOUNWSE9WREgvMXJ5Rk1WdjFzZTdDdUUxOW1i?=
 =?utf-8?B?Smt5ZjZmVE9RMnBEcGtOamkwNXZsYlI3bDBqMEptWk5LS09YeHR4QlNnaVor?=
 =?utf-8?B?bXY2VFBSSE5tZmZ6OG5RRmM4SitwcGx5SkxOTE5VNjJ1Rm5PYUJpcTlqWXVG?=
 =?utf-8?B?Y3lRWjVxTzNpblNaRzVWN2JKUmFQeXh5V2hKSlQzaGx6RTN5VWdXVHZjZ2oy?=
 =?utf-8?B?bTRSai9ya21WRDBwbXFoVXhzYyt2NTltREgwRnJaYXZ0SkZMMDlXejBOZVRQ?=
 =?utf-8?B?Tkg3Uy93Zkg0bDcrTnBweU1RUThtb0RXM2VFUEd2MVl1cy9kK3ZkZkR6QVdu?=
 =?utf-8?B?T0l4MDJpQXo4ZTM4VW9tRjl4Wm1YYTBpMWRsN1hBQ293dEh4bmlRZU9ZZVVP?=
 =?utf-8?B?bHpWWHd5cDNFbXpkdFRHUG14azBCU1JXOWlZN3ZiSXFpcXh6ODlvMkZSajZs?=
 =?utf-8?B?VUNrd0JCK0R3dkNFcFUzL2FYaEU3YTg4K3RVWXJoYzNFMkJsZmYxWXYwTTZl?=
 =?utf-8?B?dTJVZTBDT2VFVVNlajhqQnBFcmZjeG5TZU1ybU1CdnhZQ3F0U1dRdElNSnE1?=
 =?utf-8?B?aFZFU1FleU5KL0RONnJkZ09DbTRFL0xhbXBhNXUwMmNqT2VCMXAyVzVEcjgr?=
 =?utf-8?B?MHBGN1lnL0pDcGxLMFhNKzUzQVl6cnlVa0wrUDlTR09SNExZQkxnaktTZkls?=
 =?utf-8?B?cS9mcTZxS0pDay9Td0V3VEtMbXdBZWEvSXB1YXZmNHRXM1JCYi84MlFUTzVL?=
 =?utf-8?B?STB1T3RWZlFSdGR4QVpCN0VIb2pxWGpqQ3RVRnFJUGlZME84NjRTTGlHRGxh?=
 =?utf-8?B?cTJ0SUJSOGY3dlVVNlBBN1p0TEVMMFdzTVNyelh1SU5TVC95amRVZnlEY2Zz?=
 =?utf-8?B?aDlQcVF4S3lFKytXaDc3V2ZHdVFsL29RV29TNkd3TnRJQk1kd1dCdlBEQmdn?=
 =?utf-8?B?M2loL3ZyM2NTcFNLTnFpMzJYSi9td3dsUC9kT3RsbE15SUJrVlZBVEdaUEc4?=
 =?utf-8?B?WDNsNGVDQS9KT0JvaFlLaHZSWjBQbW9kVTgyWENLYWxBWlJhNU5LbERpSUFK?=
 =?utf-8?B?YkpnTHNJTFVqRy9veFFRdnArSmt0S1d0K0l2ODQ2SDZYVjJJcW1nN256M2VF?=
 =?utf-8?B?dkMwVmNybE9uOURMdGJKWUdJdG1nUzJYL3hxTTVTbkJoTUNQaDZ1Rk1vbzBY?=
 =?utf-8?B?QlNoWUJja1EzU2tjSE9zZkMvWHpDY1Z6MW9aRXdEODhHbkxUUDlhY1YrVFkz?=
 =?utf-8?B?UGJBYmhNYXNCV3RMVTNLSWV4dEpUM2MyVEZCM2Q5akN1ZTEzRmkvTFhjUysv?=
 =?utf-8?B?ajRjRkVIVXJOWWxmS3luNTVqaE50TFgyTHdWSzNmNkhwdWlsclhYOHlCNDUw?=
 =?utf-8?B?YmpmeCtsUTN2WTdFOUlPbFIzcUw0NnNjcy82UUV3cWp3OTlKTnBWUHFURHB6?=
 =?utf-8?B?UE9EaEFZR1hsY0NkVDZWUHFmNXBzMVl2TytBeklaODdwUWdpVCs2ZU5HNjVW?=
 =?utf-8?B?aGNtMnpaSll1NFJuTlVsT2hLcHZnPT0=?=
Content-ID: <6974CC2FF4051A48AD93BF3F47C43E2A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4869.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b526576-b31c-4dfd-2787-08d9fd709c4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 23:50:34.9074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Q+NHGcEW+cO6OY7MSt83pYBwKTxyiluu492HJw9UjQWG7uQEWQBJmajlUfokBU7Wukm8CYKfp7L7dq20tmD0ZkHFEU8SK81DDBMzyQ7mJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_155052_697201_FC3D31FB 
X-CRM114-Status: GOOD (  14.89  )
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
Cc: vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/3/22 23:04, Chris Morgan wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Mar 01, 2022 at 11:23:24PM +0100, Michael Walle wrote:
>> Am 2022-02-28 14:45, schrieb Tudor Ambarus:
>>> Flash does not support continuation codes and may collide with a flash
>>> of other manufacturer, Intersil being an example. Add support for
>>> xt25f128b.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>>> 0000000 4653 5044 0100 ff01 0000 0901 0030 ff00
>>> 0000010 000b 0301 0060 ff00 ffff ffff ffff ffff
>>> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
>>> 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb42
>>> 0000040 ffee ffff ffff ff00 ffff ff00 200c 520f
>>> 0000050 d810 ff00 ffff ffff ffff ffff ffff ffff
>>> 0000060 3600 2700 f99f 6477 e8d9 ffff
>>
>> You don't have this flash no? because the md5sum is
>> missing.
> 
> I have this flash, what do you need from me?

Hi, Chris,

Thanks for getting back!

I would need you to dump all the SPI NOR sysfs entries and then do a little
test. Here's an example:
# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id
c22018
# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer
macronix
# cat /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/partname
mx25l12835f
# xxd -p /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450000101ff00000109300000ffc2000104600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
083b04bbfeffffffffff00ffffff44eb0c200f5210d800ffffffffffffff
ffffffffffff003600279df9c06485cbffffffffffff
# sha1sum  /sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
c5e5abe6c5650a9d9c448690b1eeebdf5bfe57d4
/sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp

And then an erase, write, read back and compare test.
1/ generate a 6M file:
dd if=/dev/urandom of=./nor_test bs=1M count=6
2/ read first 6MB from flash and check if is already erased:
time mtd_debug read /dev/mtd5 0 6291456 nor_read
hexdump nor_read
	If at the hexdump you'll see anything that just 0xff, the flash has
something written to it and you can go to step 3. If you'll see just 0xff
data, then jump at 4/

3/ verify if the erase is successful, then do a write, read-back and compare test.
time mtd_debug erase /dev/mtd5 0 6291456
time mtd_debug read /dev/mtd5 0 6291456 nor_read
hexdump nor_read
time mtd_debug write /dev/mtd5 0 6291456 nor_test
time mtd_debug read /dev/mtd5 0 6291456 nor_read
sha1sum nor_test nor_read

If you reached here the test ends, you can ignore 4/.

4/ if you reached here the first 6MB of the flash is already erased. Do a write
read back and compare test, followed by an erase test:
time mtd_debug write /dev/mtd5 0 6291456 nor_test
time mtd_debug read /dev/mtd5 0 6291456 nor_read
sha1sum nor_test nor_read
time mtd_debug erase /dev/mtd5 0 6291456
time mtd_debug read /dev/mtd5 0 6291456 nor_read
hexdump nor_read
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
