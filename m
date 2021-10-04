Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18266C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:02:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2E2E610A0
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 05:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2E2E610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIDAP43sj6F72LTrBSu/7htBW3it9VM+VhppCZsEV9A=; b=z7mqOEcoqN3Sp4
	RMb3a7sFlHJHAvuXUerANjvk8SaJmfOtpLbP8QV/iKlkodhbdKJTJF31lf2lWVNfAe2UY1Gn13wiE
	lP47ALw6tQKM6IKAdPiPxLyR9tspSnBP0zzNYITyrEu5AcAwO9hc7PM6jwmiQwMuD5E1C7b5LAGOO
	E8+o5fHAMZO+pV3y6hay7g8AuJAGIsqwDMpioQKrYlaDiDzR1s2gkQy4CKBUCruJDATyWhjM0gMLG
	IoKuqX3TaiDl4kcormfGNnn3N4tWulwVtW9r6BKo7YSFYUR0diaMgTKhs/TikEWbxTyfViaDooKNc
	gNHJqbKgc53XZSk2meGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXG6o-0057N6-Vy; Mon, 04 Oct 2021 05:01:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXG6j-0057Mf-PC; Mon, 04 Oct 2021 05:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1633323705; x=1664859705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BuOLu6TGd2LFINgh8tU6xZK0g1wDoepX274aq1V4l5A=;
 b=vxZeWiYionv/uLn2YIcazspcfuKDuf6TL1BxqpICSOcCljNorhNH5+zF
 7on0KVXaPyn4i8p/qRHjfDxPKigkGzoEJXYvYVHKsXyknwh0a3ET/3kkC
 LR93Ct1U4zcEz/7jhPtpIpiihYq4yv+OEONzPC2AndY49UjeR5YCsPFSA
 Mf5yPvOENDw053xdaB2DBfIAgER8E/je43PoTC95gNiw7ic3I8FcfbQNA
 ZyrFZrSUuSUHTEUCPS3XoFmFh6eorCFkRvWRh1nXeE6omLWR6heO4ice2
 06S8aZhHF219qmvYwePci/TeJbfvrVZtZBD+44pTEoSQStoGp10zgQLda Q==;
IronPort-SDR: YNlHcesw47rVtYNcTto/qSpFkExw4HfB2KLTN10iOq34lW57kyVOUMIPqZKbcRim88mx4+oR5X
 MsUIperjpEVzCOkfdT+cA1Kgubee5XodARqNsZb1EtSBMpBL8S99XwDlqlB8ecW3SbKi9cUcPc
 WbuBq/FFuo0hk5NQeMFAP372Oevyn/NJeqsvciQpBmYEoY4kMhEdtpYk51vBQ09ldGq2J5Ffxs
 u93dD9iHJtSN9Z/jkZU9M2qHyOtnv90FfJsScRR223kJrwijHQY6KtIlCwaYqPVmIvqB6byVLv
 9ChJi+3q37CGGrUOa1ikzE4l
X-IronPort-AV: E=Sophos;i="5.85,344,1624345200"; d="scan'208";a="131599930"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Oct 2021 22:01:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 3 Oct 2021 22:01:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Sun, 3 Oct 2021 22:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hu6qj6DYOMUhOvKtHT4Uzx6Ue0AMGJxY0ZEbFkI37hQayPljG2212zXYBLySy3Xk/rnupr2k5JYazT6W7n22oxHt8qfqszIr7Mse2uMUtthBCxHarcS2NaA3ADGQafa8PjeYlaxKBH8o4Mx9HXhImvCoB+ylD1iaHitlpuMxXePd1c0UvhuRueeMBY0PKpP11AeYLPnG7b2uI2Iieyltazgo0CnzctExwQqDQx0Z1+k2BIVBDw/lquWOGjwYPKDsoEwqAICe3UR0HSRssodngI/ZUUtPkl1jjxlWoReE/KOnwCw2xhCUnDXUgzctSbH8bBC3LAg2VvJwijvmocI0qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuOLu6TGd2LFINgh8tU6xZK0g1wDoepX274aq1V4l5A=;
 b=XpfLTMKKjMTqXgXtgpjkBDnTLpbW55AEKLNi5GVSIKDyoYa6j28ayEOmBx45+A0UN/KeNgpVsIW7sizCXnP34eVeblP+xlPdnNrb7oUGggVT4kI8F2B/2e85YbxMDn0riYG+YVfSFTeuy5+uIuLl2xGBELvA/H5CQHyHZnBsflQKO9Iperk78r/csxjzamwlU5PveWA1wCAvjFibJoFEijdMusmpYXQkfLwV7LSkRoJJR5lzLee02HFibW5AdPDUfvBAPqR+P9FpOzZ2xMXuynL/x5Ij1xO9YFSxP/JGn3wM1u4C9gAfJKx9rtmqLdnwvUsAnWNsiLxxEqqyBmo5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuOLu6TGd2LFINgh8tU6xZK0g1wDoepX274aq1V4l5A=;
 b=T7oPtT1cJL/AWxSJUNc77bBmwFjDMUK52ziXrTh1hw2saMNJrqI1H6F3zIBoGI6zajNE8QjU8PbeNltISIyJk408LyXKCd2GE7OyaKcecS5x2nidFrWpyPrmDjmqa1Zucx0KdSAEi05A+mnEq8og1eDs2zDBRomS9cIkKXu0/hs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2943.namprd11.prod.outlook.com (2603:10b6:805:d3::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 05:01:40 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::a496:d4af:df74:5213%9]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 05:01:40 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v2 27/35] mtd: spi-nor: core: Init flash params based on
 SFDP first for new flash additions
Thread-Topic: [PATCH v2 27/35] mtd: spi-nor: core: Init flash params based on
 SFDP first for new flash additions
Thread-Index: AQHXuNzqavvXGXQpeUW+ITKmACoLmQ==
Date: Mon, 4 Oct 2021 05:01:40 +0000
Message-ID: <ca0df88f-2d62-a27a-624b-6640d437e535@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-28-tudor.ambarus@microchip.com>
 <20210824175138.vggtefa5xoomcjto@ti.com>
In-Reply-To: <20210824175138.vggtefa5xoomcjto@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4fcbb3e4-4083-4a72-8f8e-08d986f40d50
x-ms-traffictypediagnostic: SN6PR11MB2943:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB2943BCA5AF8C4BC990FEE22AF0AE9@SN6PR11MB2943.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wDSRLEbSI3hFED7jTd0wAMqF3kkmi2SeAizo4TeGD6Lpdu+xK73nyxmhBgN3uFP38MwGSL2ZD61RA/z4LHWO0fHlVRYBRpuEKDBcElyi68btpILtNTaJeqjzY2QN9gE77X4pQX56gKp7EW/vrQAsKgzhD+kbfdp5055kO8O9f2KKSOZvfeDgF/K32C6+vDBcOZyEl3uGIzjQtGixtNR1WPcZeM8f/U3yUK/eD7/03Pzj9JKeTmiKsNJn6O4h/sxO1WY+xEOaQC1tiptOMAtYD/WyLdum+IvOiFE4zP9OFeByV8B7fLZkOGMm/WFdXnEHamrdCG4ttI7+Lkya4cazhjbOiMJ0TFNY6b/COBR5/K0x8TDmlr7+ZKv8a25JiayA6N2+5Ewmn3VoWKubhqa0ZWNLd3eD2EEJVXf8VGOLGjiRGbO0hkscaGjK7PDaHkttVI4YcR1E+vn2UjZp+cFPHx+52w3ssWuEIboPgNdHNz0gtRgNnKmLZJfMSBqBjEcIuoqFxwzjYIRaxE+F4ahXb0Qx7S9zyE1d+hOF6RSjsg1UrBeEmodSXAsmZCzr1j3uSq3ZpQisQGlhwXq9O4nKOtJmWdyiVbjnwVqg4QKSpG4V7lKsvpBHGomTHKYRPpIu4nxI3BCv20b/SVNyErA+/OPesErjN9q/7PW0nxIYeW18NOofS1TC/WqxDvLJkzNYYMMrYlssLKQRyQfMgmqXJnC5obRaioQynwyc+QT6Tl6h7GjFkUyJJidT0csQ6b/ewkVGLPp4zm6LJ+2DnSFhzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(38070700005)(6916009)(83380400001)(31686004)(36756003)(316002)(71200400001)(38100700002)(4326008)(122000001)(6486002)(2616005)(54906003)(186003)(66446008)(2906002)(53546011)(508600001)(6506007)(86362001)(8936002)(31696002)(64756008)(76116006)(91956017)(66946007)(66556008)(66476007)(26005)(6512007)(8676002)(107886003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUpNb1FSdjlkL1NqOTd6L3RhQXhJay8vSGNHTXY1UzlwNjhSbjkwdTJVWlRL?=
 =?utf-8?B?dVV5elRBcWpMSTZiRU0valN6WHB4Q2dSWWhjVjVpUm9WUHlNYnFRNnZ4RG85?=
 =?utf-8?B?em1JMEQ5aGQ3ajJjYzQ4L21sa1pxdW5iUmtmWTVycllyekdGaGRRWGx5VUNh?=
 =?utf-8?B?Q053bU1mWnl3Ynl6bDJ1T2Z1R2Y0Q2JrWEVQaEhLallyekkzS2JRVHRtdG80?=
 =?utf-8?B?SFdtalFUMjhEZ3MrR3B5akJNUzBDTU44S0R2cDJaTzdJRHkvQVg4ZDB1OEpH?=
 =?utf-8?B?Z2ZtSE85NmJzZHBIYlFFODNNM093RWJjTG9paXhPbzdKRm9SRk82bnNudHJJ?=
 =?utf-8?B?Vlhma2Znb0RBMUJXclBaRDVTQTJVMlNEcy9hcXhEcytFQWtwY2tscjBUeTI0?=
 =?utf-8?B?bHV3LzU2NTNiNEF5QkdaRGl4K1BMdU5LbmEvRk5Wajg2RlpNbzB2ZlU2cnRt?=
 =?utf-8?B?RUV6V0VkRWdhWktOZ0NKY2JDTVhPOEJlU0dpK2RHUnRWd1cxTmNwcURaM3BT?=
 =?utf-8?B?eTlsS2o2UzE0bTNMZGZINmxZaXIxRVhESE1zbkxwbDJuRkRrQ0t2b1lsSUlR?=
 =?utf-8?B?eXoxVk9GNUxDV3dtZzZoVFREUk1LUWpVWUJGSjVnWDVFQVdPaGl3dStjVjJw?=
 =?utf-8?B?VmIyekRvaTU4Ym5hQWRFZnVKeENscFk1SnI0ZmUrdFQyZ0tvUGVZVUx3NXhQ?=
 =?utf-8?B?bW9NOTFRc3dPSzVvUDVUaklvMlBUMVRUWGNqQ0F2OUN1N0t1VzBTUEljTmVx?=
 =?utf-8?B?cjJqT0dwang5OVRRekxWYXNHck1ZVGg4WlNZNnBtUVZrR1Y1UTlUaTNsMEtK?=
 =?utf-8?B?UFlEOWtKQzdlL1dZYVlMWHRsUnNzb1dIOUxhVHJoREFmbitFa2NPRnBod1dU?=
 =?utf-8?B?UUdjMGtFblNCMHVaMG5xUFcycWI0UHdpRmhXcjdQaTBwSTNsWXZ6N3Z4NmRw?=
 =?utf-8?B?WDJjaTlEUGNyOTd5NXhVSTFXZ2dCOEd2TmhRcTZSMVBONDBwM2tOZjhzdmkw?=
 =?utf-8?B?YkNjQWxOdENYZlhwamxuNytBRjBRdytIMmxES3lXcnhPMU04RGdGeHdpOXlk?=
 =?utf-8?B?QnNoN2s5c1poWVNIcGljckphTUhNVEtxN0hjT3o1ZmoxYmxSM2pqNitISXdV?=
 =?utf-8?B?ajFuNGZSZGZ5Z0dPdmJXUXQyZzlSVUdFY0YzTHh0T0FKOVJxMzJ6ajFXSHlj?=
 =?utf-8?B?ME1XakhUWW1MQnVFQlZ3OWpjU2lyaHIzV1NUL2sxUmZ0aU8yZlZrWWZCYWFt?=
 =?utf-8?B?VmZQVU1mdm9qKzlxbXhiRzlMaDlXNnpnKzRuSGxuQWx3VGpESytVdVVkNmY1?=
 =?utf-8?B?WnFCQUlqaHM2Mmc5NGJkUDkyQUtETWtFVW1RcHJmdjVoTVo0MnF1MjBLVHhF?=
 =?utf-8?B?NElWdG8xeXloRWJISEFqc0J6eEJ0WGJoUjhJNUJFNUI1MTQ1VGZiZ3cxYUhY?=
 =?utf-8?B?bjNmbFIvSVV5TGhqSkdFbWdnUXphYW9QRWUweUVUTlZVU3VZSC8vNHhaamxa?=
 =?utf-8?B?aWpaZE1WZ1Q3dE5uTUpFRGVFSE1IWk94Z1NtUnlxSmdTWk1WbTdNVkx5MzBH?=
 =?utf-8?B?WmFhamVtVHhZejdHa25ud3hOMTIrWVluTldybGhZcnRSMDY3Qm1rcndFRUJm?=
 =?utf-8?B?bTBmUG14dWVmdWgycE10N0tTUmdVdGhqTk1PNFBwUis2ejNQVk9TajdZMnFU?=
 =?utf-8?B?dFBaeGUremRsWVFvRW9IZEtTRnFCTW1KdHd4K1pUWGZmTkNZNnNmY2ZhR21m?=
 =?utf-8?Q?P8JALO5jQFNPwrMBR0=3D?=
Content-ID: <EFAFCA03E0449641AE333EA4830C9FD4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fcbb3e4-4083-4a72-8f8e-08d986f40d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 05:01:40.2006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXi+hcA4XhfzdsyR5pilSGQkBSUiDHDvecDSnwPZngFJ+Noz2xnlV8xakmP7GAMtT61Oxf4GbchK1UwbAjzKq4/OWnnDzoGIWqHruinszTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2943
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_220146_028566_4A9428A7 
X-CRM114-Status: GOOD (  24.95  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 8/24/21 8:51 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/21 07:52AM, Tudor Ambarus wrote:
>> Remove the spagetti way of initializing flash parameters and settings,
>> at least for the new flash additions (for now). All flash entries should
>> be converted to either use SPI_NOR_PARSE_SFDP or SPI_NOR_SKIP_SFDP.
>> SPI_NOR_SKIP_SFDP should be set either when the SFDP tables are completely
>> wrong and we can't parse relevant data, or when the SFDP tables are not
>> defined at all, or when RDSFDP command is not supported by the flash.
>> After all the flash entries will be converted to use these flags and after
>> the default_init() hook will be removed, the
>> spi_nor_init_params_deprecated() will be replaced by
>> spi_nor_info_init_params(). The flash parameters and settings will be
>> initialized either by parsing SFDP, or via the flash info flags.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 103 +++++++++++++++++++++++++------------
>>  1 file changed, 70 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 9193317f897d..ef06a8d6abb8 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2627,28 +2627,6 @@ static void spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>>               nor->info->fixups->post_sfdp(nor);
>>  }
>>
>> -/**
>> - * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
>> - * based on JESD216 SFDP standard.
>> - * @nor:     pointer to a 'struct spi_nor'.
>> - *
>> - * The method has a roll-back mechanism: in case the SFDP parsing fails, the
>> - * legacy flash parameters and settings will be restored.
>> - */
>> -static void spi_nor_sfdp_init_params(struct spi_nor *nor)
>> -{
>> -     struct spi_nor_flash_parameter sfdp_params;
>> -
>> -     memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
>> -
>> -     if (!spi_nor_parse_sfdp(nor))
>> -             return spi_nor_post_sfdp_fixups(nor);
>> -
>> -     memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
>> -     nor->addr_width = 0;
>> -     nor->flags &= ~SNOR_F_4B_OPCODES;
>> -}
>> -
>>  /**
>>   * spi_nor_info_init_params() - Initialize the flash's parameters and settings
>>   * based on nor->info data.
>> @@ -2722,6 +2700,39 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>>       spi_nor_init_uniform_erase_map(map, erase_mask, params->size);
>>  }
>>
>> +/**
>> + * spi_nor_sfdp_init_params() - Initialize the flash's parameters and settings
>> + * based on JESD216 SFDP standard.
>> + * @nor:     pointer to a 'struct spi_nor'.
> 
> Missing documentation for treat_id_collisions.

ok

> 
> Also, I assume this will go away when we get rid of
> spi_nor_init_params_deprecated(), correct?

correct

> 
>> + *
>> + * The method has a roll-back mechanism: in case the SFDP parsing fails, the
>> + * legacy flash parameters and settings will be restored.
>> + */
>> +static void spi_nor_sfdp_init_params(struct spi_nor *nor,
>> +                                  bool treat_id_collisions)
>> +{
>> +     struct spi_nor_flash_parameter sfdp_params;
>> +
>> +     memcpy(&sfdp_params, nor->params, sizeof(sfdp_params));
>> +
>> +     if (!spi_nor_parse_sfdp(nor))
>> +             return spi_nor_post_sfdp_fixups(nor);
>> +
>> +     memcpy(nor->params, &sfdp_params, sizeof(*nor->params));
>> +     nor->addr_width = 0;
>> +     nor->flags &= ~SNOR_F_4B_OPCODES;
>> +
>> +     if (!treat_id_collisions)
>> +             return;
> 
> No, this doesn't seem quite right. Why would you not want to treat ID
> collisions for flashes that use spi_nor_init_params_deprecated()? What
> makes this not possible for them?

I think I wanted to motivate people to switch to the parse SFDP first idea.
Why would we care for those flashes that use deprecated methods?

> 
> Anyway, even if we don't want to treat ID collisions for those flashes,
> we can't just return here. In the previous code, nor->params is already
> initialized by spi_nor_info_init_params() so restoring that via memcpy()
> would make sense since it would restore the info-initialized state. Now
> it would be just 0, with no useful information in there. You are bound
> to run into errors somewhere down the line.

you're correct!

> 
> So I think you either need to make this function return an error and
> propagate it up the call chain or run spi_nor_info_init_params() for
> both type of flashes to make sure we do our best effort to initialize
> the flash.
> 
>> +     /*
>> +      * Fallback to flash info params init in case the SFDP parsing fails.
>> +      * Used to handle ID collisions between flashes that define the SFDP
>> +      * tables and flashes that don't.
>> +      */
>> +     spi_nor_info_init_params(nor);
>> +     spi_nor_manufacturer_init_params(nor);
>> +}
>> +
>>  /**
>>   * spi_nor_late_init_params() - Late initialization of default flash parameters.
>>   * @nor:     pointer to a 'struct spi_nor'
>> @@ -2797,7 +2808,9 @@ static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
>>  }
>>
>>  /**
>> - * spi_nor_init_params() - Initialize the flash's parameters and settings.
>> + * spi_nor_init_params_deprecated() - Initialize the flash's parameters and
>> + * settings. The function is deprecated, it will be removed and replaced with
>> + * spi_nor_info_init_params().
>>   * @nor:     pointer to a 'struct spi_nor'.
>>   *
>>   * The flash parameters and settings are initialized based on a sequence of
>> @@ -2821,11 +2834,40 @@ static void spi_nor_nonsfdp_flags_init(struct spi_nor *nor)
>>   *    Please note that there are ->post_{bfpt, sfdp}() fixup hooks that can
>>   *    overwrite the flash parameters and settings immediately after table
>>   *    parsing.
>> + */
>> +static void spi_nor_init_params_deprecated(struct spi_nor *nor)
>> +{
>> +     spi_nor_info_init_params(nor);
>> +     spi_nor_manufacturer_init_params(nor);
>> +
>> +     if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> +                              SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>> +         !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>> +             spi_nor_sfdp_init_params(nor, false);
>> +}
>> +
>> +/**
>> + * spi_nor_init_params() - Initialize the flash's parameters and settings.
>> + * @nor:     pointer to a 'struct spi_nor'.
>> + *
>> + * The flash parameters and settings are initialized based on a sequence of
>> + * calls that are ordered by priority:
>> + *
>> + * 1/ Default flash parameters initialization. The initializations are done
>> + *    for all the flashes, regardless if the support SFDP or not.
>> + *           spi_nor_init_default_params()
>> + * which can be overwritten by:
>>   *
>> + * 2/ SFDP based or the deprecated way of initializing flash parameters.
>> + * Ideally at this step the flash parameters init will be done either by
>> + * parsing SFDP, where supported, or statically via flash_info flags.
>> + *           spi_nor_sfdp_init_params() or spi_nor_init_params_deprecated()
>>   * which can be overwritten by:
>> - * 4/ Late flash parameters initialization, used to initialize flash
>> + *
>> + * 3/ Late flash parameters initialization, used to initialize flash
>>   * parameters that are not declared in the JESD216 SFDP standard.
>>   *           spi_nor_late_init_params()
>> + *
> 
> Not really related to this patch, but we need to document the return
> value here as well.

ok

Cheers,
ta

> 
>>   */
>>  static int spi_nor_init_params(struct spi_nor *nor)
>>  {
>> @@ -2835,15 +2877,10 @@ static int spi_nor_init_params(struct spi_nor *nor)
>>
>>       spi_nor_init_default_params(nor);
>>
>> -     spi_nor_info_init_params(nor);
>> -
>> -     spi_nor_manufacturer_init_params(nor);
>> -
>> -     if ((nor->info->flags & (SPI_NOR_PARSE_SFDP |
>> -                              SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> -                              SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
>> -         !(nor->info->flags & SPI_NOR_SKIP_SFDP))
>> -             spi_nor_sfdp_init_params(nor);
>> +     if (nor->info->flags & SPI_NOR_PARSE_SFDP)
>> +             spi_nor_sfdp_init_params(nor, true);
>> +     else
>> +             spi_nor_init_params_deprecated(nor);
>>
>>       spi_nor_late_init_params(nor);
>>
>> --
>> 2.25.1
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
