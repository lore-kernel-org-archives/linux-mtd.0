Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA37C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 16:06:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9A664D9E
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 16:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E9A664D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IWK+KPQyVrs4d1B1ZqyrFENhHtHfOEWZwNcQzSaJxC4=; b=MVei7o4AIK62eZi1sLguSzxhV
	B4I1PLR4e9wT24KI49aTbFGWcbrSqRT7A/fgCmaCMwKRGq57K3gWMElEThx9D/X7JcNfSCt8mfJZS
	Gu3QlMdOqcf4CF1j8JXLEbG9qDp051+fOXRGpw0N328Qyj2rX9v+aeeP8QQuQINulIt5zy1hszYX3
	2jSGFl0uCS2UYXz7q4ZGZZ6aRR719HCz0CH5c05bUvZBFC6b47KnfW1m+rW6nxkbMg5zagqWaR7Rh
	JbkUUQOPF5TxtMdYCQhqF/PVptWZ7XxoQazzB+UqVJ8C5qxs/BnZFcO7/JbnXRPEVTILVQbgE4R2o
	EHRu99oaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC2rZ-00009p-1t; Tue, 16 Feb 2021 16:06:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC2rS-00008p-4S
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 16:06:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1613491561; x=1645027561;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=K+tQMD8xx3vpOED+SB7C0XmgOhYTAWP74+X0dKdV+jg=;
 b=HiOzLB4/lDUSpn6ugtV5uu2APBlySBW+DEAdhCMfnILoumujSORzbyG7
 oTtsKQ6QXlGGHUrwNhPJwCUK4rbvzXGQreCDggvNtF6apDF1Isv2C3dQg
 YfAIE4Lo0HmXnsWmCc2zbzgNf9Dl7Y+Jo7DhuAFMLwcb59eO45ezhIHNl
 wpxHmqCPM4/jgRoPi4wApqwbVYN5loS4GMTyIh4CboOCX7ckgQihZXna8
 xUa1YCevm632+/hG/I8k/In6jUjVCQ5acB002kQyCN45Qrhsz9N4JdN71
 N+so5uYLO6UaUFMJiGv8+aL0qW7H/OOLY0X3SQFWtd2a1hw/n1W727Jqz g==;
IronPort-SDR: md+biAe9G3WMlW2CpQnA4k5A+4vwGVy8k8ikl7Ip/pH9/5g6LhLuyG32nfEcCesdb7YEf7bLY/
 rntfqcint+XUfAbj2/b278zV2FMS1Q+6NCBY7FYN/rfkuea32ayC8BwDwbItImyxB8wCWKq5zW
 oMjTUFoJ4pKg32Tr5qaAR5Sjh5H3nj62a+q07tjFNcZJCyCrIAquQZLxWmymIfuaI6261yPld7
 T92vHdYLXCkTzM9idwBth46G4myRGfJ0cxyILkpkRkwLW7bHLXVsDT7aBi5nafQ86mVWWiidGM
 X3E=
X-IronPort-AV: E=Sophos;i="5.81,184,1610434800"; d="scan'208";a="106768685"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Feb 2021 09:05:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 16 Feb 2021 09:05:56 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 16 Feb 2021 09:05:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxFEkaNkXvjWoMcWmgoDgCjidnzxNvNtIfjva7KQgn+ejYejPrOfCPun4zhB325h7Ba/J4KyzsuwIfDYI7fT1wVnA6QXA+1aj3R2b7AALuWmNAFN59DNfkQDKBj2HGH7hI5T9QoCGC/rev8aV6jAKsIcSCNw9qMNBvx/HMZCUP1XkMDOtRDg/wSez6CIrt2XFvZfohOPR8AVoM9kgbsIsseebbTI4r6yird2PaL4r3mlv1rUNV4rcEPqUYT27HbxoNZG8AkEq0Cy5ATezBY/zcaYcL3X/OHk19cSHcsP9DlzdSny3WfR9ETtFzJRZksFWMyGBn0WMoKymMKAcinr6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+tQMD8xx3vpOED+SB7C0XmgOhYTAWP74+X0dKdV+jg=;
 b=izo18I/1DQ2/szWY9cpQBoVfnVerrHEUEKng0f1jmCj8hruQsqM3PeQ1Ihlrob8Xzs+f6x3ySnUcylUFMZinol6e3k0lARlIqWZPoEF+Ub3AHQ78gA9z6fXcz0ZHrP5trIzYewpu4gNB+I7hP3vbJRlK6I2HSljKUmEdPplQPZg0tiFGAlZ5Eomm0ah4hhayv31DwOGfygjUH8lkH76Sdvgi1XK+vtD4+Gm8tGzzzH9j625BL5LAoGen7Z/Qzty03KtdaYKytnNMOFVVCRGFj3MzoFLqFCfL2Iw45CJ4osAvZzjMcP55R8y+WLfAk25oqRbYqccBur2I7TAlbkuakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+tQMD8xx3vpOED+SB7C0XmgOhYTAWP74+X0dKdV+jg=;
 b=DIUZOID4lXlpaT08EiX649Xw64ywTyJOJRbiqpV3VIukx1CT0PQVU1kIRrJf5buY4qNNJNz6BP+BFi5CzaRoRZ/Z5WTYzqfMmUjgbJ0/w1t6GCoc1KK0yYb9ONfudtLjcAeCKXYxvtVLw22h6reT/SPFjZMqdDKUVTxy4WxOFxY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3487.namprd11.prod.outlook.com (2603:10b6:805:c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 16 Feb
 2021 16:05:52 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%4]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 16:05:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mdalam@codeaurora.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lb256e
Thread-Topic: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lb256e
Thread-Index: AQHW/tRbqHaAg4NgD0qNJyhsV2Um3w==
Date: Tue, 16 Feb 2021 16:05:51 +0000
Message-ID: <360f45eb-a45d-3b61-52f8-db82ffe754a6@microchip.com>
References: <1612869079-19593-1-git-send-email-mdalam@codeaurora.org>
 <2df4218ba5ad2a039833bab8c401fa07@codeaurora.org>
In-Reply-To: <2df4218ba5ad2a039833bab8c401fa07@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e2be4e64-3b3b-4d0e-c086-08d8d294bbc3
x-ms-traffictypediagnostic: SN6PR11MB3487:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB348752F9981893B0E9D99E6AF0879@SN6PR11MB3487.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /vnZw8vFyzcr9iT+rdse0CJkvGZoxnB+CuSox43gTxY4CTdzpMnjoFjyZroC4YTkCNGsyFt7WsH2fMw53foMBLo862uYUm96ifpqgKPOPbhzW81G+1NOA7f8VtFQmUAy0dI0NKNj74PnQQ0VtxLBjUTu7urnHhNcv8rYpbW0G/UcVdUT8GHYd/zx4lBqJpreQEY3fqSx9Kg1XkGM+hMGgj5tR3z1qPAjX6zcY7LY4O3oJJIjDsqLJTdZ9zAwFmUI663xmaO/D1xdMC9546aj5wamM2A7zIMXUCIpXJZItWbUwY6RxfayWfThcGCWy5wSlX3CPGZTNa9KJ0tQX919QICPlILcv0kXkr1EkKOPDm0e+Nv61KtjLVNj0K/9+0+WUqW4XkkOU/kopVlmb8Renn2RmdbivH1epQx2a6CkBY4YpfXYugvQ+RjTFK5YK/yRrkXACwgG/JwcbFTpfuDrCdVicUO+vM5vK60QBd2p6K15AVP0/BcuUkouTunyR8k+555mEhmLplBHFNEeeoWfgj2RM25uLrZoyYn2TxIxS6W3gP9Kstkqos8qYBEs1NTHT6g6Hw33YlEgThd1/E9stw9EtKvAM53Tg5eMaN4HzNT89+AnWlPJxAQiLHADpGjhph23J82MwblNupxuFcZxqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39850400004)(346002)(396003)(376002)(186003)(5660300002)(66476007)(64756008)(66946007)(31686004)(76116006)(6486002)(8936002)(26005)(31696002)(53546011)(4326008)(71200400001)(91956017)(66446008)(6512007)(36756003)(2906002)(6506007)(86362001)(478600001)(316002)(110136005)(2616005)(8676002)(83380400001)(66556008)(138113003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?MlBYVTM5OEtwUTF5YlEwYXNSWmk4TVYxRjdJQlBXaXRaL3hZTCt1MXFnYmpZ?=
 =?utf-8?B?NGgvbzlDcTFVcTY5aVFmMEdlWTkvTzg2Z0g1dnBaSlM1S3hTak9SSTVodS9O?=
 =?utf-8?B?cEtWUENOaVNuMHo5ZXVyekg3MlNIRm5YTlZOVnZtQk93TXZKbll1TTBLekpW?=
 =?utf-8?B?dndHU0NIS3NCYmtTZmpRUFowRHRkN0U2L1NtaEhudXZ0T244bU9lbVdJb1Bx?=
 =?utf-8?B?dzMyQVdDWEY4L0VoZGdWRjVNdUFtRzdhV3RxT2d6YU9UOFdaZERyWnMvMjJ3?=
 =?utf-8?B?N0JWd1RvYzRkMGt2ejV6Y3BGbkRqSmdrR2d0TmdFVm95UUxYc1Z3WmhTMEI3?=
 =?utf-8?B?aG15WTl4ai9BSUc0VGZNV2twVnkvNzNFNnkxajFxYWZPS3Zjekt3UVVwWlFz?=
 =?utf-8?B?a3BIWDZCdllNd3NTaFpwdDVQeTI1YU51WkJhcDc1bmU2QWVyWHE2QjJ1SHZM?=
 =?utf-8?B?UzQ3M0hWN0pSeEswM0FLSjJoOE0zdEZuSk9JZ2MvK283RXRDU29tUXlHUkcz?=
 =?utf-8?B?aHFPUnNYQWZyTGVxQTEvVkgxUXQrNWdLeFNJRXQvbTJtTXFod0RRS0wrOVN1?=
 =?utf-8?B?blJzeklJam04VzhKZTB2dTVwTEM5QkVEL2gyRjdsSlVPa2ZOeSs3WDZKeUlI?=
 =?utf-8?B?bk9ScUs1ZEZpY3ZGbmZaemprUHRDWUxmcXZNaUN2dlNJSUhIK2UxRHh3eFA1?=
 =?utf-8?B?VE5XNGsyS0RpblVLTDBPakpFamFoQjhRajAyUXl5VDN1bDhlTElRRkQwVGxO?=
 =?utf-8?B?ckk3N1RWWDIvUElSYjZPUVpaKzF1aXE2NTBWY1J6dkFRaHZGSDRONHpWQi9x?=
 =?utf-8?B?MitxT3VoN2gzWmtTbE83RzZoei9xV0FLOHRKalV0MUdmb1Q5Rko2RUZ6TW1y?=
 =?utf-8?B?SjB2LzNIaU15VmVUZ3dTMWp0ZW8wRGFVQ1MrZ25QR1RyOUY3VFNjcWt5TTZL?=
 =?utf-8?B?eFRXNDZrQkxJYXFpQW1ScjlteGhMN2VKMHVTNlZCaldoT2ZZbkxpYWFCdnM2?=
 =?utf-8?B?M3NYcWp2dkttc0l6YmRWODVqb1QvK3ZiRDF4UUpWNE9BNTJ4eWRCbm5obkxJ?=
 =?utf-8?B?V1BvUmR4eWVaVG41VTJtRW5sZmc3MVMzakFPSzJvdlVkVHA3SGM2TjNrZEpp?=
 =?utf-8?B?UTloUDdlQmRaa0pIYjN5U0NYeVdXZ09OWDJCcmRJWW1nRzE4NElhTzhkdGhx?=
 =?utf-8?B?Nm9LVFhjQXNUenZXTkdtOGhPejRRanl2ZVdwK2QxK3BFZWJFb2lGMTJNUE9O?=
 =?utf-8?B?UDkrTWVzTmxUOExCczgxUkZGenBvMDVtQ1JYRHAzQWwwWlRTWVNnVFBUZCtV?=
 =?utf-8?B?eWozSVZuMCszUGVjenVxQ0QydTNWVEdGZ0dFd0JkcDVnUGkwb2kzcXBzZjlB?=
 =?utf-8?B?dXV2RlU2NnBDSUoybGNwTGY4akVqaTVUWDdrQ1Q2dkV1c0hnQ0JaQ3dnVVRQ?=
 =?utf-8?B?aWl2dU1jcmkweUp1a2ZseVUwMXkwRXpVa2J1MkpkbHFrU0REeml5ZUVWUlNK?=
 =?utf-8?B?Z0p2dTJkemRLSGhmK1ZRMUg4YUZuSDIxTllidlZja2lpUDRnUytqRnNrQUJH?=
 =?utf-8?B?WTZtWVZQMVNORks5MVNJYkdEdkRDYmU3bmVielZIdHROVkQ2dm93S0VybDAy?=
 =?utf-8?B?REYzaUlWZ1NMQWFmTVZ0cldwbWNiQ29VMjRtRkt3Q21reC9qZVVFWFl0Q0tD?=
 =?utf-8?B?clNUYnplZVA2QktDaW52MFZnRFQwcVdPWDJNZ0xhYU8yQkxPOGxlRGU5eUpC?=
 =?utf-8?Q?qBd1ziVk9edZ5DmmrQ=3D?=
Content-ID: <BCDFE40BFBEA2548ADA69AA8ECC42597@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2be4e64-3b3b-4d0e-c086-08d8d294bbc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2021 16:05:51.7646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xg7mRxDqvVipcm2YLjQ8xQVvsLOSZ9+VpWK/5n9cn9viFLTHkYZRscRKKpdJVJ2X04+iLe1Dz1sQhzue0ghmZMFpjquYK06oGxsR3OclxGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3487
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_110602_725035_D716E50B 
X-CRM114-Status: GOOD (  15.62  )
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
Cc: sricharan@codeaurora.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksDQoNCk9uIDIvMTYvMjEgNToxMCBQTSwgbWRhbGFtQGNvZGVhdXJvcmEub3JnIHdyb3RlOg0K
PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDIwMjEtMDItMDkg
MTY6NDEsIE1kIFNhZHJlIEFsYW0gd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBmb3IgZ2QyNWxiMjU2
ZS4gVGhpcyBkZXZpY2UgdGVzdGVkIG9uIElQUTUwMTgNCj4+IHBsYXRmb3JtIHdpdGggZGQgZnJv
bS90byB0aGUgZmxhc2ggZm9yIHJlYWQvd3JpdGUgcmVzcGVjdGx5LA0KPj4gYW5kIG10ZCBlcmFz
ZSBmb3IgZXJhc2luZyB0aGUgZmxhc2guDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWQgU2FkcmUg
QWxhbSA8bWRhbGFtQGNvZGVhdXJvcmEub3JnPg0KPj4gLS0tDQo+PiDCoGRyaXZlcnMvbXRkL3Nw
aS1ub3IvZ2lnYWRldmljZS5jIHwgMyArKysNCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2dpZ2FkZXZp
Y2UuYw0KPj4gYi9kcml2ZXJzL210ZC9zcGktbm9yL2dpZ2FkZXZpY2UuYw0KPj4gaW5kZXggNDQ3
ZDg0Yi4uOGYxZTdlYyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRl
dmljZS5jDQo+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2dpZ2FkZXZpY2UuYw0KPj4gQEAg
LTUwLDYgKzUwLDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGdpZ2FkZXZpY2Vf
cGFydHNbXSA9IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBTUElfTk9SXzRCX09QQ09ERVMgfCBTUElfTk9SX0hBU19MT0NLIHwNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElfTk9SX0hBU19U
QiB8IFNQSV9OT1JfVEJfU1JfQklUNikNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5m
aXh1cHMgPSAmZ2QyNXEyNTZfZml4dXBzIH0sDQo+PiArwqDCoMKgwqAgeyAiZ2QyNWxiMjU2ZSIs
IElORk8oMHhjODY3MTksIDAsIDY0ICogMTAyNCwgNTEyLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RfNEsgfCBTUElfTk9SX0RVQUxfUkVBRCB8
IFNQSV9OT1JfUVVBRF9SRUFEIHwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTUElfTk9SXzRCX09QQ09ERVMpIH0sDQo+PiDCoH07DQo+Pg0KPj4gwqBj
b25zdCBzdHJ1Y3Qgc3BpX25vcl9tYW51ZmFjdHVyZXIgc3BpX25vcl9naWdhZGV2aWNlID0gew0K
PiANCj4gcGluZyEgSXMgdGhlcmUgYW55IGFkZGl0aW9uYWwgaW5mbyBuZWVkZWQgZm9yIHRoaXMg
Pw0KDQpObyBvdGhlciBpbmZvIG5lZWRlZCwganVzdCB0aW1lIHRvIHJldmlldyBpdC4gUGxlYXNl
IHN0b3Agc2VuZGluZw0KZnJlZSBwaW5ncywgZXZlcnkgcGF0Y2ggd2lsbCBiZSByZXZpZXdlZC4N
Cg0KQ2hlZXJzLA0KdGENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
