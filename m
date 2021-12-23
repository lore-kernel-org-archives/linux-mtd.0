Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F8EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Dec 2021 13:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dAKtlgGbBSPGDRu8z8hqoBvwUk+/cP0VmI8E5cKRV4=; b=QSw090SIms6khX
	XB7bT/xoDiSTOTj+uBQVkCyWrhgF0Qsf6bol5WiqYgPVqu7gCfS9381ZfEfg2WrGrJFhNPCZ5a7aA
	sQTiZ+6dYzOMYZom4HOBQf9KtXUXNK1yLy/AdwtYY32M1tsp4HUrt5iUfgcMvNFY64ArZVIafQfMR
	UbfEvxph5Egp0OjQzNTSyoWx6psSAuUN+rLYflrd3E2oO9lGrCpX6rfTGdXzs4VoygoyREKmRQf0u
	RLzmpAntQhazIZygj02A0YTdGWmsdoo9Q59l7nZcZg12ivD0uGvmhQJ7QjavuSiiBVhzCpbWdehss
	mFSZnyNmOj43WicqK1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0Nh1-00CkEy-Q4; Thu, 23 Dec 2021 12:59:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0Ngy-00CkEH-IF
 for linux-mtd@lists.infradead.org; Thu, 23 Dec 2021 12:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1640264372; x=1671800372;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=VdzY4+hA1mxEzJCHgZ77J2UtkOrxYsIVbi/kUbJ5paM=;
 b=H+2s8fkQIHeki/jlO4prcCZVZnwmlvWojJgyP31O9YCJAD+fyFyqZkwJ
 pDPVRSKE97qyaPQt9iwHTB58AX4ifmjbhnxWR+tordoBiHEhzyIC99cs3
 bRr++OnnnL17zM3Ll5ucvlJVz2/L9zsXDsFkjNIAX6BBMeIo+x2kbXQHY
 ZMcEeJDwAd1kL5OuYA7loEKtH+9WnAVvZI4MGqhgSOZHsNDksf1Y8b1EJ
 VjeejVWmtZzqtvBuC4Vet4pw81SuBpSZpmgTS+KgdIR/q7rdg6z7Yq2Jy
 DBVoRpUV08lzjwhl0wnRCxTSgZAZgswecyrvQz0cf+Ge9JDz7YG8O4J8F w==;
IronPort-SDR: hsKoFrlD6iV4jAd8Uod8l1wnC1awlOTxoHkB3qixQrKYzyCSl1XpMyhJFB1XNyzWqXPOlI5Rth
 K+OepJFQmfWbedverd0yT1xDheLJBE70rM5bni0jTuG41nhH9V29tRZ0T7syrPA/NS1c3Kc8do
 Dc5yFXNjQlNK9wk+N43sP3DE1ngaAUV9j145XjC8N3tdz96USaCK/LU7Kulbg/IlACaxSqcrSf
 ZSdndno0dcihK30Oc/Yi4qjMFhW8cIuH6z0wiNKC4/+eeNo2lQZ6UAUco4R+FwFaDz0mS7qY4X
 pPhy84W7FuS4L+GxBCnFNuSF
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="147606720"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Dec 2021 05:59:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 23 Dec 2021 05:59:31 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 23 Dec 2021 05:59:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB9pRci1qOTWWu4c6EqdlLZTkeAY0p0eA+WRRW7KiVIzkBKM/TInjzkDYqZM896MOGaJhPCj6fP6G4Lys6KmxfD4LktGoGORISy7Xwn3u8/4ONeSamNWXR7GmQcOeFhhuRWgtJvDD6dUJcWsLVOVUOBaS+M8KHFSwKX1+Dia6P5e5LBVVd3PYY3A6xpFOrGsETqpzW3I5Yn/QYEuM5fxSKAvNCl5baDlydj1YMsEH4nySnhlqmJCZVjyhI3TP3+szirjLqGe6HSND213HZWW8QZlaqF0qWL+4UNTF7qqLvyHQk9GC2hCd9wpJCp8xnFiri3hfiqjDS3ggHEzYNiNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdzY4+hA1mxEzJCHgZ77J2UtkOrxYsIVbi/kUbJ5paM=;
 b=UftRiSudcDGECpxLE10YruDO+CKmuTMWylgO3XF9xP5xKH/6x/A5Dozb253bC/1+H+HNe/6tBB5Ch7Oh6UlqfUzw26PnfOhQgv4RDwkc5blTLVSKgm0HS6sp/stMosiL15Dg6Aq8jdcXuZlz+PQ7Qw5l7CzdkeiYBYiqcOWKTZNlGeZrNttBnGNtmlxEyiA/LroeH86wprwhmrqkUNJgYLdWtwYiZE/pVtoP1TgRQ8kl5sXsjciI2GvV3ERmI0iayOZT82iEvfntr9A0jp/zUGLnuB5Y2Lqooe/NEw2E4N73fMubdCd/Ctvv5Qsv7YwW2IflBViU5TwXwQa13C2wVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdzY4+hA1mxEzJCHgZ77J2UtkOrxYsIVbi/kUbJ5paM=;
 b=c4e2Xdjec8DrTC1txvRxP5UN3n9kEkiAJpFeEp/HXxN/t/pVUkUQGIUuf7eVDE/1D9jL87QO8PK9HfEXloNITWmzO/Thxb29ju61oYsPC+0KtIXi1tx2oE9hJWW3ghx3c0RJjg3W1b5Pf8zF24A4YtG+TLzVB5uUtD5HHprTRoQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3487.namprd11.prod.outlook.com (2603:10b6:805:c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Thu, 23 Dec
 2021 12:59:29 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%9]) with mapi id 15.20.4801.024; Thu, 23 Dec 2021
 12:59:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
Thread-Topic: [PATCH v2 6/6] mtd: spi-nor: core: avoid odd length/address
 writes in 8D-8D-8D mode
Thread-Index: AQHX9/zrLXrw121yvE+Ca6lw9QdNMw==
Date: Thu, 23 Dec 2021 12:59:29 +0000
Message-ID: <91d954d5-f301-76ba-2da0-9e088b7ae291@microchip.com>
References: <20210531181757.19458-1-p.yadav@ti.com>
 <20210531181757.19458-7-p.yadav@ti.com>
In-Reply-To: <20210531181757.19458-7-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebe9e656-7e75-46fa-6452-08d9c6140e7f
x-ms-traffictypediagnostic: SN6PR11MB3487:EE_
x-microsoft-antispam-prvs: <SN6PR11MB3487B293B2D11792DAE83187F07E9@SN6PR11MB3487.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h04k355YHTzqSPfR/qPpF79dL944vThugR7rC0cE1ZQQzRs5BARsOB0TqEC/RrjhjikerfJScbZ/qN5ZSTIimtwb3D9E5ar70NEtE9cTF7wkaA7alq5qqSgS3BddvCGmhxbOirDISiz8dBeEl1hn6QslyBC3ufLRU2d4FRqBJA2OgKvPzgKyUXH756XHUVNTzeWwc2cSPmi962IBRKPcNb2mFX2LoPtFBHDvnCfXTGFf0E9HFxJDUYpZGQCke3L35Hzk/eyN1PwQBVV3tsqYNsBVkbRMzHKKWpCFcA3uHVEP5qx7+yd9LOAgESrzLrCQ6oMUVEmqF+Y7OsHNZazbLa1wpQHwfy4fPzZhxwH0wgymX8062ZsOPuNhb7D0jQP9F7ub/XG5yTWjh8F9v7U9/IEsj9eaZtOX+Tmk81KHwqbjuysfhOgbieSU4QrtsW9bq8LgzaEiXXNymWRPFBaBI+z1600BmhTEhQUwFgHdmacgb6LwFIbfqOcEhiyNXn+TJR+7JSXgWXHByMqzdqqEDNi2eVuW0Swp0kVzN3a+qI5opFz9clw4kmfiRpkmmzrJy6kVlhwrnZ7zrofVIz1QPPqDGcImZUteFnK6NFp/2/3Xqv69JumibHNKw9V7UJQO15ZPmvVQlx3MuK+Htd05dXeerE4vSDrDMyhnO9QdZzo+DS9ln8J5kHa0euV6arS59GeCbpF7apKPJCrZef4vrQWm8QkyJASLcu2U3jLcY68P1dbLPnzcEZoY3TO6u5oMvMv1UR0/dX0MmGA951X3bA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(122000001)(31686004)(91956017)(83380400001)(38100700002)(2906002)(38070700005)(8936002)(66446008)(64756008)(66556008)(66476007)(76116006)(508600001)(66946007)(8676002)(5660300002)(186003)(2616005)(71200400001)(86362001)(316002)(6486002)(110136005)(6512007)(36756003)(6506007)(53546011)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2ZJazFBRWZLZzlnYnlwbFQ4VkVWNlZ2N29DVmJSNW15TmRPcVlXRW9YMk1M?=
 =?utf-8?B?d2VjZVpTL3FZaVZyZnphR1JYcGRIZ3dqRUo5K2VubytvVkRMY3dJSEZHWFY3?=
 =?utf-8?B?NDRBRHdla1c3N0RrQ1N2TzY5NXNtM3ozd3pYdmJGTVNMbmFQOENwUi9WaVp6?=
 =?utf-8?B?M0JEb05SREo4TW9UMHlQa3pGZzRBS0hYQ3djaDFlUS9HR3RnbTRIb1dnYWZP?=
 =?utf-8?B?UzlabVc5Z3FVY2Vma0RyTlZGTXRCVUV1VVhjeDJJR0Mrbk1USHI2bUNvUU5s?=
 =?utf-8?B?dmVEM3ZqeWFUZUN4TVhYRzdpUlVTWUZ0VWRIaVBHOWxUdDBrVW13MDFqUHFU?=
 =?utf-8?B?eGxKdVY0cVhSY0hoUllCakxSejB2bWRuNW5tK3NkWEdpdHZYQk4yTURpYk1v?=
 =?utf-8?B?NitkME1vVXdmZW1MdFJXVXhHM3RuV2szVGJ3N0J3QU1LSkFqaEIyNUlqdGVl?=
 =?utf-8?B?aGRPMDJCZ3MwTEpiUTRYWEptdS94Z1NLNkkrc3M4VnJjM3hRMmJndjlTVVZr?=
 =?utf-8?B?VStPWWl1cHJqTkZHM0xhb1FTeVJQblVHSm02R0YzNmdsQ0VwNlBXZWhFdFJ4?=
 =?utf-8?B?WVRuaHVwekkzVG1GTE9aVy9mODBrQXd1dHkrczAvMDFGZDkrVWFlSlFnWUty?=
 =?utf-8?B?VTZLTnlueVJSN1FpaWQ4dDBwUmcrMngxOWZ2YXVucnZKNURrVjhxQnZuN1Qw?=
 =?utf-8?B?Yzd2TXRhVUpNMS9tYVdiZjU4L2wxSmtxZjg3YkRWWkgxTjUzaitaUkRCT2VV?=
 =?utf-8?B?RlNOL3VZYWtqQ0w5UktuYTNLQnhvUHZwZkIrenFxSENHbStXOTdzWElaNHJ6?=
 =?utf-8?B?dkZsTGVZaVZzUXdQanFvQVVTNTRaeTNjdHhCSS9mc3JBMlJWaGJUbEZ5cFJ6?=
 =?utf-8?B?bzJhdzdTVlMwbjRtVi9BTVV3alEva3c0NDFwdTdIT0g2c1BQYWhQanFBZysr?=
 =?utf-8?B?bWVBdkV1d2E2Z1FKdFZlVTk4UkhrNEVVUGEycCtYa29YZTZndW1GcE9RWWpN?=
 =?utf-8?B?QVZwZXJTMmRyZGo0N3c5a0lDdzc5VXZtTGVyUVJ6RXlJaWllTGpuNHpwOG1r?=
 =?utf-8?B?R1A2TE5vcHF6WWtYYmo2QWMvcjdhemxJeGhBZkJWa1YybTcvS3ptQXJVZDdF?=
 =?utf-8?B?VDhGRlhuWjNFZjExRDlmbGllcXVBZU1ZSFQwRllCSVlZSFdpUHJhVm5xakgx?=
 =?utf-8?B?VlRUcElycStRb0pEWnhKQXl3dVVHTWlNRXpqR1gyYkgzL2VNQWFDSVAyeDBB?=
 =?utf-8?B?RytpeVNjRkI3N2REQWdvOGNxYVZaREtFQWZwbXBmUzZtN2hiR2dIdjhPUlM0?=
 =?utf-8?B?YlBHVTVXQlovK2E3cWE3ZkZYaUc2clZ0MmNOa2VhRGxJbGFiSWVIbndlV0kx?=
 =?utf-8?B?cmRYdlkvM29hSFA3OVo0Y3pEU21UMm1YWERweG5oQjBMZ1JweTJjV1FIbW5w?=
 =?utf-8?B?YlV0R0JKVDVnUHhhRWg5cTFNOW5CZC9Hb2kzVUFuNVdJb1Q0bkhsUnNRS2pQ?=
 =?utf-8?B?czdrVVdMNFRKZUZTa0ZzSVJwZkNKS09jQ2dxNGNzSXNwNXhrdnRIYmdNenV4?=
 =?utf-8?B?YWxSVkU4eUllMzZaYkQ4cGJtZ0VDNEhMa0tlSlJndkdSbW12MlBuWFRlVDlN?=
 =?utf-8?B?NVorU0dpdFU1NXNxeGxKMVZzakdsMTk4c1ZraElHRVBtcWNFSjFsZG9CWGEx?=
 =?utf-8?B?TTdWdEtBUDNvUkg3MW4yZ2taSWtyb0FhVjltREx4TWZDekNtejFPSnhVRWc2?=
 =?utf-8?B?VHBhRU0rdWljWm10bGdOM1UwQkY3dEVUU1lyUHFJY3RaRm5UOVV2blpyK1FO?=
 =?utf-8?B?V1E1cTJ1UXR5aUVUbWN5bHVoUktmWUF5US9TOUFMejBuNUVlQ1BIT2RZemJr?=
 =?utf-8?B?emRPQTZFUVNadWUwR2M5UDZmVUsyM3JJV2xaYzIrTHZhdGUrclpLd0I3Z2JD?=
 =?utf-8?B?MzFhWXI4N0F3OWNUR3U3TDBmMWdLOHlrRkhwR2VoTnJiQjBYd2xkU2JOeTc3?=
 =?utf-8?B?ZXc0dTBlSy9vT0FKTC9heWcxWE5RcnZ6ZVlpcG5HaXV4MGM0YnBuMDZMOWxC?=
 =?utf-8?B?RGgrYWRjMEtiUXhvQVpqMFNkdlU0YlVhNW11ZmZEdDFPS3o0VGQ3VndCT0h1?=
 =?utf-8?B?VHVKNjhSdlJhb0piL3laUXhVU0ttWHdIRS9KdVhyYWx3bVdjRWpCSGsrQ1Q5?=
 =?utf-8?B?UzA2djJ5ZW1scEl0RjF0RDB3em93SW9ON0lsNUM5V01EemlPMjFTOXBBclgv?=
 =?utf-8?B?b2h0bnFkcjRpeGU2TFUwOGZqMEtnPT0=?=
Content-ID: <E75C826122C62A43B28226D61F1F8611@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe9e656-7e75-46fa-6452-08d9c6140e7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 12:59:29.3286 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0SvLu8ehFyS9ULYdUsKB4Fp3qB6NT4l+bbtiyhPgtdw6QpTyW70/3ytckKAzsOlOWFsKOcNdUXQjY3iLgH8dqwUtR7wqm5eX6rkiVBptS64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3487
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_045932_744136_6581FA0A 
X-CRM114-Status: GOOD (  35.44  )
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

On 5/31/21 9:17 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Octal DTR capable flashes like Micron Xcella the writes cannot start
> or end at an odd address in Octal DTR mode. Extra 0xff bytes need to be
> appended or prepended to make sure the start address and end address are
> even. 0xff is used because on NOR flashes a program operation can only
> flip bits from 1 to 0, not the other way round. 0 to 1 flip needs to
> happen via erases.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> 
> ---
> 
> Changes in v2:
> - Replace semicolon in subject with colon.
> - Add a comment that ret < 0 after adjusting for extra bytes is not
>   possible, and add a WARN_ON() on the condition to make sure it gets
>   spotted quickly when some change triggers this bug.
> 
>  drivers/mtd/spi-nor/core.c | 73 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index a696af6a1b71..d2a7e16e667d 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2023,6 +2023,72 @@ static int spi_nor_read(struct mtd_info *mtd, loff_t from, size_t len,
>         return ret;
>  }
> 
> +/*

let's add kernel-doc comments for new methods.

> + * On Octal DTR capable flashes like Micron Xcella the writes cannot start or

strip "the" from "the writes". But I think I would get rid of the Micron Xcella example,
we're using these methods for all the 8D-8D-8D flashes. You can mention Micron in the
commit message if you want, but we shouldn't mention manufacturers in the core.

> + * end at an odd address in Octal DTR mode. Extra 0xff bytes need to be appended
> + * or prepended to make sure the start address and end address are even. 0xff is
> + * used because on NOR flashes a program operation can only flip bits from 1 to
> + * 0, not the other way round. 0 to 1 flip needs to happen via erases.
> + */
> +static int spi_nor_octal_dtr_write(struct spi_nor *nor, loff_t to, size_t len,
> +                                  const u8 *buf)
> +{
> +       u8 *tmp_buf;
> +       size_t bytes_written;
> +       loff_t start, end;
> +       int ret;
> +
> +       if (IS_ALIGNED(to, 2) && IS_ALIGNED(len, 2))
> +               return spi_nor_write_data(nor, to, len, buf);
> +
> +       tmp_buf = kmalloc(nor->page_size, GFP_KERNEL);> +       if (!tmp_buf)
> +               return -ENOMEM;
> +
> +       memset(tmp_buf, 0xff, nor->page_size);
> +
> +       start = round_down(to, 2);
> +       end = round_up(to + len, 2);
> +
> +       memcpy(tmp_buf + (to - start), buf, len);
> +
> +       ret = spi_nor_write_data(nor, start, end - start, tmp_buf);
> +       if (ret == 0) {
> +               ret = -EIO;
> +               goto out;
> +       }
> +       if (ret < 0)
> +               goto out;
> +
> +       /*
> +        * More bytes are written than actually requested, but that number can't
> +        * be reported to the calling function or it will confuse its
> +        * calculations. Calculate how many of the _requested_ bytes were
> +        * written.
> +        */
> +       bytes_written = ret;
> +
> +       if (to != start)
> +               ret -= to - start;
> +
> +       /*
> +        * Only account for extra bytes at the end if they were actually
> +        * written. For example, if for some reason the controller could only
> +        * complete a partial write then the adjustment for the extra bytes at
> +        * the end is not needed.
> +        */
> +       if (start + bytes_written == end)
> +               ret -= end - (to + len);
> +
> +       /* Should not be possible. */
> +       if (WARN_ON(ret < 0))
> +               ret = -EIO;

Is this really needed? Also, I think I would squash patch 5 and 6,
it's the same idea, and reads and writes are tied together.

Looks good!

> +
> +out:
> +       kfree(tmp_buf);
> +       return ret;
> +}
> +
>  /*
>   * Write an address range to the nor chip.  Data must be written in
>   * FLASH_PAGESIZE chunks.  The address range may be any size provided
> @@ -2067,7 +2133,12 @@ static int spi_nor_write(struct mtd_info *mtd, loff_t to, size_t len,
>                 if (ret)
>                         goto write_err;
> 
> -               ret = spi_nor_write_data(nor, addr, page_remain, buf + i);
> +               if (nor->write_proto == SNOR_PROTO_8_8_8_DTR)
> +                       ret = spi_nor_octal_dtr_write(nor, addr, page_remain,
> +                                                     buf + i);
> +               else
> +                       ret = spi_nor_write_data(nor, addr, page_remain,
> +                                                buf + i);
>                 if (ret < 0)
>                         goto write_err;
>                 written = ret;
> --
> 2.30.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
