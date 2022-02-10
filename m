Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF21C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfjTaKM7a5tDxZo68Hp6a1RzxvXIQb6t2qC5YzXbE04=; b=leBc80P4XbGGSx
	xGAPhqC7qq9HaxvA2AhjpHUx2IOZ8LwRTAh1jZZiHMO7cU/uF6cL/JDb8jsGd+Ere1RpxPaDmuZob
	D61XtCZwtMiW0ByMcVSnqf3VcsSVFEXVsKEIKebjY8o82ySXYyNbfkIN5y+XhBQueozBlHn1EQyAv
	oD+JDc9HnYzoX93Dd5V/svOp7/s+uduHg7RTkcizXOsXx+OF8qzigcyyJ9skxlpW1fU4Su7I76dGX
	m/CXytwXaWsa8Iw6GqWxMEg6tMCojqTMom5YqqfCHyzcZyVztm0n3MtVYGX4lO1/72UvTDjMrtN9W
	VcmEVqPVlKLrm1A2UJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI03l-002Pqk-Lu; Thu, 10 Feb 2022 03:23:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI03K-002Pmm-63
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644463406; x=1675999406;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2hVPBhm3bJVayKa0Iph58q53MY9aD0Pb4IobGDeNwYw=;
 b=dfUoKiAbcTYfBM6PDNncyGDGJazskhacayDT0rgH56xmYxMIf92UX2eu
 6ZUtMR17E6paVOeaAxfg9HwvtM2QR0GKh8CNJHkbM9fm/LSunpp3oNXRf
 VahMp2hzqQACB/fpZ8iG26vtpzq8hoYo7YW82TXkZQBpMlZOxoWcPmgQd
 zOWxTPhSazCYiZj/JZCDU0qASE0/qP4D7ukJO+2tjwpYdg8Dz+B9EkKa3
 /G37weDXhMR1eNPzqmNJzidJVZaF74Or9VT+5MKEraLtgzpY6YAwA720g
 GdptYTp7SYXGfvnJM1CDTkoXYJ68qPlPsQUMcy9itI1JHvNg9j8Kb7M1T Q==;
IronPort-SDR: jePZvD5sHaOGE7APs4gvN9aqY1MI1lzLxv0F+dSYEwMFZ00a7TjeIXNxsziYAfML5MmApltlEX
 SYl5AE2Lkh+Vo5Lshb8sOfkVTMGohZv6zZz077S7MZXy6Ag2Rs8nb0z8A3yZKX8K8PP3ckV32y
 vDtXlEJdpIZnJXkNheYyP6PajXCVB26idSrjPGKdh+eBicqN6zrTlMmWoV9xgkR47FFvx9AD5O
 W2lY0GKK4/WBBrqEYv3+n+Nnbxo6pguYqv15hXOu4ffKYhICAOJVA0xTYRRDOFujcXraM9pq/Q
 Nm721m8Xg/3QunuH9YFT0hNQ
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="153078411"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:23:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:23:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:23:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMtAaHwIZzH+wGWZVRtNhY+rPBGxQX2cLr1KNxW6XZn3XvNWhqK08XZXPvscro9p8NTqdP383GfhdBKXVL7QHyjEyi7B/LKgFMDwTTxTpgRV+RV/fSSpiXmcuxH94XCs9cUcqLDczO3ceQCc5KZfCul6liV6s/o/BIjkH9zMR+ec/DQnPGmGDYt3SO8GzYfFzRkLcM/OHZZIy4ztD+h708v/JIq66BCN8N8QqBYmeLbWI03YO43f+BHiHAPedt8nAmu2Bm/QNZrpK09c3IYL8vCxiMbP9ddWfqhogrOa8tLDKGtRD/4UIB5QWAmCTDXOWC2gU4jXBxsT1AiUYRy5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hVPBhm3bJVayKa0Iph58q53MY9aD0Pb4IobGDeNwYw=;
 b=n6B7t98UAPMkmQ2M81kpeicCXd4PKQx6yJ2NE7AQA0nRFhWsPa2x238xbeWFPvWN7Pi4Gkls4AXPeDguhcD0EHDhY3Zz+PyH0zvdtJAZmwc9oEQ0o9VndjMbrA8zRTxVApwkF2awsUq+Inxm7sdsnlAYYrtuJNcT6szKqtmiFLnefTvdV107PsQZJlDfLs9HNZICKPe8YYwI6fM/OcotIVH+W5gOJbghQz8Mk7dE456R9eFtHe7fmmJYloVqxcdqn3/UCk0J+6cV/k+cfzYV1Uvj0oZwYeYlJ23wvNekXQJ7nT/ZmdpZghiK/OkzZaM38UbfSc5df7xrsnpq0dyfzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hVPBhm3bJVayKa0Iph58q53MY9aD0Pb4IobGDeNwYw=;
 b=GLKWaT8Cy7v/xvwDWbRfF6MRLS8O/Li310GAK5r6j8D5ROk2XKa+QSrKBwHAr0od0RC5y0Zs2SNJas/7fkhXhqHRPAVdIqlHn9384mMbtXbACpmcx7kQbpy3yXi/VojW1/Wp+sgl0zKPfAt6SKdrS0Sib06CqMELAu9pwW3iQNM=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 03:23:20 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:23:20 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 10/14] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Thread-Topic: [PATCH v1 10/14] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Thread-Index: AQHYHi2No5a64VrrkkajkVo0YQK4Yw==
Date: Thu, 10 Feb 2022 03:23:19 +0000
Message-ID: <39cda7ec-ba71-98f8-4477-cffd7f66fb8a@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-11-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-11-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9db800b5-6a79-4999-bd53-08d9ec44afbf
x-ms-traffictypediagnostic: DM5PR11MB1914:EE_
x-microsoft-antispam-prvs: <DM5PR11MB19147AB2FAB0F4B6C752205CF02F9@DM5PR11MB1914.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yLwyWQD+6Vb+HWp6yaEbUawvtGrbuDAExowA89PiOk+KeTHjzpEc/K2p72Tot6t2N6bRY8wcpTGVVgQfh4ikSncp/vmJurys45rvDemA4UxIg/4ixNb/oM72WyJgfEqTqRbzvFsOOBwJ/erixCIO7/PEUwlgk/Z9jElDyfV3p2NdAdC+vArJMmFW0KhT35Sfzt6apWqNWis56fUqCo04SGlrpcaE5pahVGtssgual0W+2/YD40o/BaWqLX65EI4WHBssakzIL6IY2YJYl38nDLhUaGJuPPoi0gfvNAe3jNLe7H7lKaILmXzb/nU6Qc9GyzoixOFH3PI6yX47RPSJlKzfjyn5XH3T1g94HWYiLNaIRbDjnUD5/B3hI7GNJ5PDeBn6FcuCFvHwwmCoJEZRaXJPrNKDckYIkFvWuO5iuz0gVHU+RUnGWWUDp6P3WeS26GwSTmVydkdhd15LO5fC0Qr0P4+1qhrn0plxMjIses7IAUEzgWElOniW9wGvLrMdBJoTZNfuq3Jfrk7tTxaC8BEn+N+m7syz8204tNiIGDFJXhbMEwNw9+GE/yufMz0UJ4iYP/KJXjATPU7WmdreP08MFRWdM9F5ZHmo5nFMmWf4pF/JNFXasxJdIkCF0PGSezq/oTAYd/pmpBrshXl/ggKusLndLAOHJJrHH4joRPzDDoZheFnrux4uqKIVXWGmGky4WkpkJGLBrGyA8cCjLitU429iBLPk/M+o8vKXT3IM+dFjjGEenTzv8vNvPmCQenJfUPHbY8Nrfa1Z3I9c6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(122000001)(2906002)(8676002)(86362001)(316002)(66946007)(31686004)(4326008)(38100700002)(8936002)(64756008)(66446008)(5660300002)(76116006)(66476007)(38070700005)(91956017)(508600001)(54906003)(66556008)(31696002)(2616005)(71200400001)(186003)(83380400001)(6512007)(6506007)(53546011)(36756003)(26005)(110136005)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3Jkc3F3QXB6emh2bG1nbzZyaTRRU2djZEVNV3FyelpYNC81T0tZOTFTYW92?=
 =?utf-8?B?dkoxUnhTWGdUVDF1d2VHVkNxcUtUVXQ2WEgxdkE0WTJTemRBTXJ3R0pMNUtW?=
 =?utf-8?B?SEtsS3ZtVUhZWXp0ODNPQWE2blR1UU1QN2tiTUhFbVljZjZFRzFocG5mOG9l?=
 =?utf-8?B?Yndtdi8wak14MkpERE9KcGRxM2tTWGFJUHduV2M3NUFwdVdDWU14Zm05aU1j?=
 =?utf-8?B?Nm5QZUdJY2NzR2kxZ2pvU2xGalNDWk04QldWQjdrWnprdHVFZDhCdDd3V2dN?=
 =?utf-8?B?cExONTdMMWh2dkMxOU9NSzF2K2VUdUhod0N5MFlRbVB5b0NUTjlwOXlGZ2tx?=
 =?utf-8?B?NFY5cFZodkIyUXQ0dHF2RTNpWnhQWXdNZUtNOTlWSHlXVUV2WE9oVXA0K0lL?=
 =?utf-8?B?cXdWcGVJZXJkZXZrTHF0MjFiVW5weGVVcGsyWHIrbklqV21tdWkyWUNRNXhK?=
 =?utf-8?B?Z0gzR1YrNFY4blhBOGhtZDhrT2NTdElvWkJBS2Z1NDBRMmoxTTBsMVdnRHZG?=
 =?utf-8?B?RXpEWExHd3ZQTFRYZjArekhqSFd4WDJBeGh2V2FPQjBBYlI1SCtRUlNwcmkv?=
 =?utf-8?B?T253b09acTYyMW50aFNoaUFyNm1GcW56WS9PMjNPVTFTczJCak1nT1lwMnAw?=
 =?utf-8?B?eExETnBKZWZKREFvMVYzaGk1TXBzUW1uc1diYnE3TnduMkt1c3FqV0g2aEd3?=
 =?utf-8?B?SmEwK3JoUHZkbFhGQ3Ivb2ovMjAzQWJrNWJybVFVWEtDMlNTTWlmbldPOVJh?=
 =?utf-8?B?L09rV1Y5dDBqZDZzaHdxSWFMVlNTdGVWNlZJUWlJb3lSM0pLbGxzeFZTNzJF?=
 =?utf-8?B?LzJKSVBqV0RCUUFRdVBZRGhyZEl1cGtXOVhnQkt4RmZNT0l1Tkhha1RQSEpO?=
 =?utf-8?B?V1ozcXU2NWFiZE5FZkplQVd4OExLVTc3Rmt0VGd4ck1rTjdiK1IwakJJMHBK?=
 =?utf-8?B?VmpFMWNic3FXbGQ1YlFHcXFsNlREc0dzdTBVeG1qaXFsYlQxVkZFWDdEbSsz?=
 =?utf-8?B?Q2VHQUtXbzBPRnN6RjN0Q3FBOVdoN01ub3J5S25Kb3VjSXdIUncvZ2dtb2w4?=
 =?utf-8?B?RHJVYzRuRVZIWjQrMmpmQUNyTmNISWZRWGdaNmxyRUxzYkR2NGx4bllsekV3?=
 =?utf-8?B?QWFZN2l0MVRsclR1c0ovcnNBV1FRcmRTc01NL3piY01GQ3VhRnRtNFRxUUJQ?=
 =?utf-8?B?MmlSV1pmZ2doemszVzNKck50OW1XWHFweWoxNmRIWGZoNjBQaWxSdUZ1eW9F?=
 =?utf-8?B?c1M5azBTbC8wNnRuUVU0TUtLUlFYUWc1SUFqTVIyMkNjWHFqNzRBTmZncThn?=
 =?utf-8?B?NjVhb296UlhoU0t4THRkQjRUdUJlZzRhWkNTUnhHbG9abWJ1ZmcvdFpTNWts?=
 =?utf-8?B?NWpZVmZlTWdZSnpnWW9OZmNSWmlSZ3cyTU5ReTgxOElCeS9PT2l1akxpdXZm?=
 =?utf-8?B?MzJWRE1ocVRFVzgwMVRkamV3L3BtbnBQUkdoVmczMi8rcHRjd1lsbE13aFc3?=
 =?utf-8?B?RWlHR0lRMStIUjFhK3dnOFBYT1NwekVCVERBUEpwQW51ZS9RUmVZV1N5YU82?=
 =?utf-8?B?anYvZHdrN1pYbjZPQldJUFVRSEE3WG5yMkx5OHVDYXBQM2VLL3JjNGt2aTAv?=
 =?utf-8?B?aktSRi9odUNqTkJ0bExWUzY2Tmo4YWxYT3V1NSt4cmhOeFJnK2w1S3lRc1Ni?=
 =?utf-8?B?UVgxeksrUWVYYkljNGU3d0ZQR1B4aCs5WTJuNWoyNGNVdWl2WklyZUtuN3BZ?=
 =?utf-8?B?STVQREhVRWpqQjIvaHVkOUpYVUtyclN2em5zRmE5bDdwdkRadm95R2t0QkZu?=
 =?utf-8?B?eEIzcFM0cWcyVTVVanNLWnpSc2tqQ2plc2g1NGdlejU4SVp6TllYb1FaSDNO?=
 =?utf-8?B?VHIzY0NWSE83bXA0RVd3SEE4WVhmanZaVkNHWVZpaFFCSG1QRzFtRlBVRnNU?=
 =?utf-8?B?TVNZR0xudFJ0emtNWWJ4dGZia1pvdlc1eEZrSkVZV0lYRXFWdmE0TXZZR0c2?=
 =?utf-8?B?MWhra1d3NVMrZHJ5N2swYXBjNE9URjlZZW9FOElQZVNzcnBjNWpQRFVtZjJM?=
 =?utf-8?B?MG1hNTFrZk0rWWpvMmhoOTNnWi9GMy8vVWVRSG1qeDlZVkJsNE9wM3o3L01z?=
 =?utf-8?B?b1BvOHhRRzJDS0ZiTUlpRFZEakhDUkdKMHJ6YkFUZjJYMHpDUHhFN3FMT2J6?=
 =?utf-8?B?VjQzVGtQSjRLQkcvbnozYytXUjVkc3FDc1BUZ3RoYjBOUGNHK0lGTEM3cHNS?=
 =?utf-8?B?Sm9RRXplT1lhbzVUMDdBbEtObWtRPT0=?=
Content-ID: <151A30A7277A6F48B81B594B7959F0BA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db800b5-6a79-4999-bd53-08d9ec44afbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:23:19.9208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypmbi1qbbdcoE8iWlJhwZf3Fe+sj7qRFFNoSCnWfMyZ/Tyxcjfikuwf29wK/aO4gZ+R68nE5f9GAkkzmWU+hjglFoTcURwMZ4WkpTFoMhNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_192326_317455_9F4946A3 
X-CRM114-Status: GOOD (  22.45  )
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

On 2/2/22 16:58, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Drop the generic spi_nor prefix for all the micron-st functions.

please, no.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index ca368b48bcb0..988ecbffdc36 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -308,7 +308,7 @@ static int micron_st_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>  }
> 
>  /**
> - * spi_nor_read_fsr() - Read the Flag Status Register.
> + * micron_st_read_fsr() - Read the Flag Status Register.
>   * @nor:       pointer to 'struct spi_nor'
>   * @fsr:       pointer to a DMA-able buffer where the value of the
>   *              Flag Status Register will be written. Should be at least 2
> @@ -316,7 +316,7 @@ static int micron_st_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
> +static int micron_st_read_fsr(struct spi_nor *nor, u8 *fsr)
>  {
>         int ret;
> 
> @@ -352,10 +352,10 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>  }
> 
>  /**
> - * spi_nor_clear_fsr() - Clear the Flag Status Register.
> + * micron_st_clear_fsr() - Clear the Flag Status Register.
>   * @nor:       pointer to 'struct spi_nor'.
>   */
> -static void spi_nor_clear_fsr(struct spi_nor *nor)
> +static void micron_st_clear_fsr(struct spi_nor *nor)
>  {
>         int ret;
> 
> @@ -379,13 +379,13 @@ static void spi_nor_clear_fsr(struct spi_nor *nor)
>  }
> 
>  /**
> - * spi_nor_fsr_ready() - Query the Flag Status Register to see if the flash is
> + * micron_st_fsr_ready() - Query the Flag Status Register to see if the flash is
>   * ready for new commands.
>   * @nor:       pointer to 'struct spi_nor'.
>   *
>   * Return: 1 if ready, 0 if not ready, -errno on errors.
>   */
> -static int spi_nor_fsr_ready(struct spi_nor *nor)
> +static int micron_st_fsr_ready(struct spi_nor *nor)
>  {
>         int sr_ready, ret;
> 
> @@ -393,7 +393,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
>         if (sr_ready < 0)
>                 return sr_ready;
> 
> -       ret = spi_nor_read_fsr(nor, nor->bouncebuf);
> +       ret = micron_st_read_fsr(nor, nor->bouncebuf);
>         if (ret)
>                 return ret;
> 
> @@ -407,7 +407,7 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
>                         dev_err(nor->dev,
>                         "Attempted to modify a protected sector.\n");
> 
> -               spi_nor_clear_fsr(nor);
> +               micron_st_clear_fsr(nor);
> 
>                 /*
>                  * WEL bit remains set to one when an erase or page program
> @@ -433,7 +433,7 @@ static void micron_st_default_init(struct spi_nor *nor)
>         nor->params->set_4byte_addr_mode = micron_st_set_4byte_addr_mode;
> 
>         if (nor->info->mfr_flags & USE_FSR)
> -               nor->params->ready = spi_nor_fsr_ready;
> +               nor->params->ready = micron_st_fsr_ready;
>  }
> 
>  static const struct spi_nor_fixups micron_st_fixups = {
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
