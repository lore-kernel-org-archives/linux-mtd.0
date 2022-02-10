Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9982DC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzbLwgCyWKgzutaCr9QRsTgsWUurfYBhrS/nzsshfp4=; b=NN5Q1CNEjpAtvU
	Okziq7nlTKEAi3OxhihMzAOOp0pVy/uQwViScOujnpQ7aarXYDWBKRIhdbIQFWjOrQX7wJeAUSTfV
	l2l7Od8t/1muyjGAlSlDY5pakgYTZywJY/BQyR7aoVZWmy238Jn+YoMJkjif5vNLoabcytFt3/8rh
	EwdrDQNGGAmtC8/567IeH22vgJfBu5l1Yoeq/J80A2k7PA/shZBQ/vuZ4BtjtBb98OzOX9mn9gO1I
	2c2EAqpte2/tvSgdsQhKFrMwvfmiMqlOMzmEhVsmXaCgOS9jh9K7A7enxb3i6HRHyxoq1NuibjOvw
	vHKRIOFug38nsiyYah8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzlc-002M1B-1Y; Thu, 10 Feb 2022 03:05:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzlZ-002M07-7q
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644462305; x=1675998305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4ZGNYedXDuh5ygjARy2iIIDHtCo+4fIqqXocjQzm3z8=;
 b=tMRAcAk60/Uy3bsd2VLFKUYaRVPGlscgLthdgpz/3oYWn+NmS+c/WzlP
 vDHdHoNfdkCpkLBon/1uc10tUlllPoOd1egjIUY0Rpw0EZ1DUCYrqdxml
 E48GWzx0ytTcZ4Q9XjNH2VRpNR8QjVQHKihDkdrH+lZNP070bIscoqHN8
 McGV1eY4f6U1eXHt2fvh9yfquDEMiEthhIkVtLzT9d9nJJcgCqBpG82d/
 PszLqCXPvif3MKwZe6iQbXRNqLr/ImgkIZsWdtpEA656AQPfJc3czW6Ap
 Q2+3WpKRam/T0ZJTD5ZgnFdBK02q6NeF0GlCk8YSp7Iypqm+DMRkSKjJ6 g==;
IronPort-SDR: I0MDZoAVgsJPryH2bdij/v31WGnfzGxkoyKyqc8T+Wf9FZowZe8Wij/PQW70T9PLFj/G7NRggO
 /3Uuii8TRsnIZg4qAusISa3+qLTKcQLlHPObPmH2rYl8wXZczFDEtEL4kFJZMKyk/lt7oSSC/o
 mRE6kV8L+6gKsgNZSUPrpeSBLa+3blwFC1ba1HUyQhlY8P78enrRkF3titVXKGYjOinE+inYYM
 d38MwjUjAM2fExz3TWvNOZl8U0oW6SOhnIFgaDClPb5iFiXVl/3E9xF1fWviMEzuwhcX9bCcFD
 2c/PMYT7KuphYkE+JIZMlDqG
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="152556320"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:05:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:05:03 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBakgPz6jA+pg1ksbyqfDQlfzkRIObMQRWu64/Hz7mnNxBe90sR/83uNBvHiNaHIV+u/wUweMftzck/psn/gfTiUv2yWxpjMR8dmGohtjARgyFtDH3N2eT8lqf/+EE8r7EwinhjbzO/Fbqp8qRGbqlfJNxcaJLaLmVVvmQUUH6kIQb2quFOOpqND+SMQyrpVUh9A+8Gc4x++AFNWpqptR6qT3gXrRnW3PCowGbjDK/us4xFn5l3Irrg/wYcXt22o5KEBDAHcY5f3bD7I4Uf7lmAhdmlOUuFldZBTMNz3EhNX9YlY2f8Ecc090X9h/oWgwEbmNPbwLJszIhmmlC5aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZGNYedXDuh5ygjARy2iIIDHtCo+4fIqqXocjQzm3z8=;
 b=D9GD7AV3OVyaTki8Ra22lQHu8k0qjHW4KiMYMOybnv+PSj+d6AkhhPPjmoc1YTn3chlCvkNC4QoEnccSBlLPmLCQDMk3/QM+X6cSWEU1eIwjHThOylk0tJuSPxI2muOcTYs/LYBM89YsR7risVRT5eP/kOKNWpxB8aD93hinfFsFQYuns8dyLvD/1vmusfnok8QCR7Afe/jNbWEkOEQczePaS0kyFQf1U5YCQyP/SryOf1e34wPtTKKx6b/667M/rAJBKzw5nmiNHWAy2nQwvtamsp5X2vRvwbMQjs7OM963mu9tsB5Lvr+fdPO47IdsEq9vZffksvTALB4XCjlFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZGNYedXDuh5ygjARy2iIIDHtCo+4fIqqXocjQzm3z8=;
 b=myjNSPfGh4UHAECz+Ff2ttgV9Efuf4BYlVU21e+SBBVtr5LcrJKqlsyFe88+bWuNUeW7ZKwnem9muXGmR3i58Wzco367aG4RfLcj30/RlNUj13DSA/soIvdZqYf2Utd5WOzIIfN8v/o0UU6BORyMRD48QDzvQZnAuwhQVU6iWfs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BY5PR11MB4022.namprd11.prod.outlook.com (2603:10b6:a03:18a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 03:05:01 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:05:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 03/14] mtd: spi-nor: allow a flash to define its own
 ready() function
Thread-Topic: [PATCH v1 03/14] mtd: spi-nor: allow a flash to define its own
 ready() function
Thread-Index: AQHYHir+a0BBmuf00UOaCqv+u0rxVg==
Date: Thu, 10 Feb 2022 03:05:01 +0000
Message-ID: <399c8ea5-e534-9da4-43c0-199e1b88bfae@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-4-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-4-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e710eeac-9172-43d0-e08a-08d9ec42210b
x-ms-traffictypediagnostic: BY5PR11MB4022:EE_
x-microsoft-antispam-prvs: <BY5PR11MB4022A8F52F5D63B1583A9335F02F9@BY5PR11MB4022.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bm3g2h7yCUI8xmudorrswf4ftajkzTxXRjziVatZbbndTwviQWLvBSkwau0OmlxrxrPj2P9/pU00RA+onEHKMHyKZKTBKQ55pL8M0sXmgfFnX43lDQq+nOFmLh0erXtcDUpjcywi8FRNdpCg07RelrAc0uORSjiB9dt7Olda0qkt2j6nU18UTEbaGMLDeJ1RYxKQAYuFlazlN4zRiuoiNDJhn7q7n3p8PJmbA0Z5a1EAR0swV6vvZUwpO2AmzGXq1EaeDT5rqXSXxKXl0ZOxVzUsO+ng6ZWiO8rz5bEeeVYHLFL2E7DT77lhRF5t/wzyKAbUUd4RD1kzSEgoxLSC2LK9cgkzGsRPbgwhroLRpbtkrxXIyUl0J002Y08xFydgdwBDY7fRNnm84Po0IM8EEhEbQ+yq+77z7Z+PRj83PtDM3qX15F0v0EWHyPZaxM23rRzWU92vu33M4IbR4KGv8Uw9SQ0bd8DUIHK7Irq5TOrp7d41jRh9J3iuGSrUpYq/csOgpCm6kTPX9+u1F4vIG+YRoZDMZkF9RNMIw71m0CoLxfMwKRZXYmOjlf9n46hAIA32A9hX6qgULYbsiFI4wOyrVrSFvEI0JkEI4lpUX0gGBN/HdWIKms4orbSSeauyIcNNzZxlv88l8onRbJX1wM5pcCTX3D7cZXUYikgiodak4fdAzNh/UQDAktbTXN48va0QGU1MnmxN9b6mQlc/GTrueg95/QBYylddBPWHaVinIBqcqK70kvAe8pcLqsXnUoxket13iPylFf2P0ECe5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(8676002)(110136005)(4326008)(54906003)(38070700005)(64756008)(66946007)(31696002)(2906002)(66556008)(66476007)(66446008)(2616005)(6506007)(6512007)(71200400001)(31686004)(91956017)(186003)(53546011)(316002)(38100700002)(36756003)(122000001)(508600001)(6486002)(86362001)(26005)(83380400001)(76116006)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnhBVDBxQTl2ellQZ2RmZXFGc0V5b1ZOMmUzVW9DZ1lTMSs1M3NnYnlMQ3A2?=
 =?utf-8?B?YTBkM1pERDlOVk9YME9TdnRmUlJ5YUdCUWhLNDBFM2dnYnFWWnVTL2Q2OW84?=
 =?utf-8?B?L3ZNUklpSEdpV2h1emZ4dlg4c0ozNmNGUlBsWi91YzdxRTFVMlY1YWJ0UjVq?=
 =?utf-8?B?dVVwUUlRTDBGbkYyZE1GUll5SU5Oa0F5L3JHTFJnY2ZoR1I2Z1dIdGZmcUlH?=
 =?utf-8?B?azZWR3I0ckxieHJPQnJ4VEJNbTh1TDVlNzBsb3hvMStGdDFFTGhPNkR4MlM0?=
 =?utf-8?B?M0lBUktLQmNBV2N0bzE1ZmNRcHZ5YVoyYWVHYnhSckxJc3VjRVRlM0Z0K3BG?=
 =?utf-8?B?RFFtS2xnM1pYYUhOUG91d0gzUGRJdFhieStKQU9IZ1dGcC8zZTZ6ck1sSlRW?=
 =?utf-8?B?bmpQNW1IbTVWcy8xQ1pKYVhzb1licllKNEZDaDRNbFczVFpWVjBQYjNJbW9s?=
 =?utf-8?B?TjNqUVVoSlhQZkMxQ3liUEd5cTREZEtibEF3UkMzeld4WEhMaUpmaGV1RW9E?=
 =?utf-8?B?anVEODN2UjJLVjRQTXE5eCtFNmVsUzZWV1NLaVo3M2pWL0FJOVJNb2l5d2p6?=
 =?utf-8?B?V0g0WWJsTWZxTDFTZmk4UFFsK3pWM2pkYlN0cnQ0bDZSVEQ3MHZxbjg5OE8w?=
 =?utf-8?B?LzVKRUcwTnNMTmg3OE1iSHhVUHdtd3YwVmJjWlUwQlBKSkZVZGordHNBb1Jy?=
 =?utf-8?B?dVFIQnBuNDBsSVhkRndPSWI2TVVKeW5iNUo1MmtCYmJPUVVGVnVNdkV0aHhu?=
 =?utf-8?B?VVF0UW1KWW9KUzFYenl1YktGK1k3ZFd4RmxxUW90cjBKZzZhSE03TnVTUUNU?=
 =?utf-8?B?b3NIQ2MyYUtqckNua0NkV1BZcnpyRnFkNWlNeEhOZitsYzhjZ2g3ZjNCUytx?=
 =?utf-8?B?QnNpN2QwSUpicFI3TERZL3JMRGxkY3V3SGN2SHRDdHhwRDVOY01PQkZiL0h6?=
 =?utf-8?B?QWVDVjV1ZWU0amFmZ205MWxBdyswSUtmVEIxM1ZDL3pJZmdYZ2FCdkNaUVRH?=
 =?utf-8?B?K3lYK2p0OXhveTZ0Wnljb1R2NFA5UXp5aVlJalRVUlhmMHg3M3hEcDRMTGtH?=
 =?utf-8?B?c1Z0aTdKcWtwQ1NGYjB4WVhXa2NQcHNVek1ta2xUbS9OQThweFMxTGVRbTQx?=
 =?utf-8?B?amtOQmN2S051Ym5GNWptSEZDemg3eU5oSjc5V0NHeENjTnAwL1FaanVhK2tX?=
 =?utf-8?B?OURLcGJiOUlIZ2dSTzlOY1Znd29nWXFSbG8vcG9mUjliekRvQ0Z5TGNRUXBM?=
 =?utf-8?B?alNiOWl6MkRiYUl6T21oN3B5SVJUQm52NGhxYU53UVpLNHRBaXBRSGQ5VDQz?=
 =?utf-8?B?Z2p0d3AxN0ZYR3lxSVdBRDBMMDkzSW9iSWwwc05MViswRklpa2wwbjF1KzJa?=
 =?utf-8?B?ZzY2Q2NpRXJXc3NnYlBBZ21Zb3NoQWZhUHFTVktsR21QZXpiTHY4RmcwRExU?=
 =?utf-8?B?MmxmbGVaaTF1VTBLTmdGMGdLQWpQQ0RaM0s0bGxoTXhybW1RSi9pU0FHUHc3?=
 =?utf-8?B?Zjk1QVFzdC9BVk5yNk92L09lRjlnaDh4alpYV0MxdmUwaUR3eG1NVUhjSUtB?=
 =?utf-8?B?dGxISDdUNWFYV1NBbEUwb1BxbHBtODJDNTM5VmxvYWZwTUcreituVzF3SldQ?=
 =?utf-8?B?UmFvREZzYTJ0eTBSN1NqSlpRVjNldVl6eVdCeStmYVpqekphd2syVi9sREFR?=
 =?utf-8?B?Qmc4OElwSkZhWUxBcVZORjZ1WDllbzdYVlg1OEY4aDBIcVZRcEpzMjYyS0V5?=
 =?utf-8?B?U28vRFRiS3ozbzNZTFlPbWEyMXVXdlhBSzVJaXlLcEJybHRUcG9ieDhCaXNx?=
 =?utf-8?B?bklhVloxL3g4Z2JKK0JVcy9IT1E3SGJTUDMybWFzTlNCN0I5SVB0QWd1OVRX?=
 =?utf-8?B?b3MxS3NnL1lqaTBWNlU5WTVpN2VGM3Q3bDBmdFFROVl1VE5BNnpZUWpka1cw?=
 =?utf-8?B?MmlLSHQvSzJucTMxOENNTlNmRGpoZnlMVld6SkNwcmM3QmlsSEhHbmVRczNv?=
 =?utf-8?B?SVl0eEt2SU1iL0drdzJac1I4TUYwL0tzNHFuVGlrbUJXMGliUGpmN0ZyNmdx?=
 =?utf-8?B?em1hNS91ZWwzby9hUlBrYzE5b2lPeUZSZkJpQUtrOVpnRE9OMHFxc3ZPazd6?=
 =?utf-8?B?QXEyWmdvV252T011NWJoWCtsZDh2dUQvRmVja3luSWJ3bnliVGN6UVkvWUpm?=
 =?utf-8?B?TlIxK2J5cmJFNEZEV0lHN0htSkZ4TXNBbDQwMXNZSjI3dVJ2bzU0ek1UWUVI?=
 =?utf-8?B?QjVDcTJHWDlDN2tQek94bXVFRGF3PT0=?=
Content-ID: <9DDF98CF8024DE43B708B5D0765CA751@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e710eeac-9172-43d0-e08a-08d9ec42210b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:05:01.5277 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7/ZAdUKcQf+hlA3gMuxrpmv7AgdI+wFFkS6png5OPVTlrQtcFYz3isl+tw76eudTDQqVm+3owEs9l646+1FihDG57Z17Md5ANYdT5+Tg64c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_190505_337077_527558D2 
X-CRM114-Status: GOOD (  22.47  )
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
> Xilinx and Micron flashes have their own implementation of the
> spi_nor_ready() function. At the moment, the core will figure out
> which one to call according to some flags. Lay the foundation to
> make it possible that a flash can register its own ready()
> function.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c | 4 ++++
>  drivers/mtd/spi-nor/core.h | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index c8cc906cf771..c181f2680df2 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -794,6 +794,10 @@ static int spi_nor_ready(struct spi_nor *nor)
>  {
>         int sr, fsr;
> 
> +       /* flashes might override our standard routine */

let's start comments with capital letter and put a dot at the end of
the sentence. s/our/the

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> +       if (nor->params->ready)
> +               return nor->params->ready(nor);
> +
>         if (nor->flags & SNOR_F_READY_XSR_RDY)
>                 sr = spi_nor_xsr_ready(nor);
>         else
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 10f478547dc2..446218b0e017 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -261,6 +261,9 @@ struct spi_nor_otp {
>   *                     SPI NOR flashes that have peculiarities to the SPI NOR
>   *                     standard e.g. different opcodes, specific address
>   *                     calculation, page size, etc.
> + * @ready:             (optional) flashes might use a different mechanism
> + *                     than reading the status register to indicate they
> + *                     are ready for a new command
>   * @locking_ops:       SPI NOR locking methods.
>   */
>  struct spi_nor_flash_parameter {
> @@ -282,6 +285,7 @@ struct spi_nor_flash_parameter {
>         int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>         u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
>         int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
> +       int (*ready)(struct spi_nor *nor);
> 
>         const struct spi_nor_locking_ops *locking_ops;
>  };
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
