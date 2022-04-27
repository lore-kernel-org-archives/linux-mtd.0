Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C61BC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 07:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqDb3iTj3Q9bKsva70KBmIBYHg10PwJ7RLvuvDJ4pQM=; b=LCfq8WzpS+OJJv
	R2czZueoXKEVLZJoHVNVg1bfrqWZDMiqMQXLlxnsnwZAhReh9cbNi+JqmIZJPddG7cz+TLIjpj9T/
	T2SbJauS3aPvIT9dGNGWmCKUtLKoWlOkBNXnq2hKTSv7EzGx4N0dpSteIjPlFahbUsVZsoQ3i9D85
	czwiG/GplC1gYyTjMZcPKewBi1cAYqSpP34+qSfUFKoXW5cELDQ4KNM7ZpkVPjtjKBTgqNJ/pPBnw
	sv/RwzbnN8TJQh2e+jKGfbCBQam2PUGQ1+oLSzMHcCw+ge/MgT0cFjdqg7Oz0+fSfd8p1HLb3sOow
	8gn6ROa0ZaJgL6M9r7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njbs7-000D4L-2N; Wed, 27 Apr 2022 07:13:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njbs2-000D0y-V0
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 07:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651043634; x=1682579634;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2R4VjUjnw5PKNM8hBnAzgrGYNVxaeQpOrmJDnS4kuZ0=;
 b=xL6eKgc3QfGJkFJuqpkrOdb6tODyoDMOaeq4qf2dbsAzUgWBsMnyo1+J
 rhh2l6GUmRIb7gF+Zu8NyAaHvVFBJh4ymU391wRpYISa+4SjtS/OYNw4u
 aFtkl45H2SOzPb5dmO6Arlvm7iEQMnUzaDPEKEmGkZRRFwlRQWDruGQsJ
 HPwhziZGNyYbIYVq/8/8DlxuO7Rkuvz5SifnpJEtupi3TVIox/XkzeCeu
 HKTgskaWekkCzTkqkN58Yvw3gEde1REBt5Bp7dZbvki0FE2xCFy15c9QN
 aKRIYD9Yj4UmiMOisKBsmF5zNMYd8kAfH8JL93oMdlLoCi5VHwDzckhsg A==;
X-IronPort-AV: E=Sophos;i="5.90,292,1643698800"; d="scan'208";a="171072811"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Apr 2022 00:13:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Apr 2022 00:13:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 27 Apr 2022 00:13:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lk/DHCvEe2lSr2ng37wYsA+yW3YEyy0kE1p/RzbD6OvvbDupComm5V8MsPp/o/EjzmYvFKHRXezTBbN5ibGPCcp+vAlpjPVm8XsU/ElNkeX6RdgBR6XzK/MntpI5kNq+agtBQ2rmgdLbfXZDtZ8bcDzQM1AhCQ/E+D/XFfn11qIIGsYVVpMma+MqKAW3rfssTng1hDI7xKTlKAmyJ9oEicZHEc8MoThn6Fq0z/nPLdeC4Y8dKht3kWVf3NpP0k0mjjzYNj1vIGliojmIkHr+6NoI4hxX5zxvBZF8Op9173cAJbAzi2C/o4DEJRzuavwLK1GpDQG2gCQ9jugMHEo3dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2R4VjUjnw5PKNM8hBnAzgrGYNVxaeQpOrmJDnS4kuZ0=;
 b=nfEKFQ4jQD3Nn76yyWPqAMDvt7kR1e43JkEJKr3Kkm4/g80hBBDfCRzocMShlROIptOF9g1Pu7QT8BFO/TFYuseLXndxbL9cpLcOQfmTxt1X6wZc80fGwMaV1lY/FsWhBn/eAse73YSkrvuqj3LsKXzd+TkBmPLnOjiraLwsL2Y+AhFjPBMCewhqFvLa+Ulj260RnMllv+nYqqbXNbJITLo6ZYA1FYwhD9wZv1iN7h5NzCfcx3X8mCDkSsSXKujIC9su9OtCaR0Ab95BAVJARuofRaSpXPPkXlIscvhGy7hOn/jfeFrNUCSTCz7tJzoN148dsM51gtqzrsd1o7cQug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2R4VjUjnw5PKNM8hBnAzgrGYNVxaeQpOrmJDnS4kuZ0=;
 b=kj3BBU9C3Kfjaqae59VY+2rD9ZFC0WJQeFhznIptl7KUfk7WAOyMg94zEeXzpmE4mylL6RQW1MHDVw0YJXpltCQUAJwSykj1/381u00fK5odWqEIOelRDqMTnknDBVJ9AQsj0Ulixus+JittEmbTUnapH2FaU6GOqw+d1GToNOQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CY4PR11MB2056.namprd11.prod.outlook.com (2603:10b6:903:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 27 Apr
 2022 07:13:45 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::2447:4025:79e6:7c08%5]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 07:13:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Thread-Topic: [PATCH v4 03/11] mtd: spi-nor: core: Use auto-detection only once
Thread-Index: AQHYVU/7/NTsfvb/Zk+xiSXQh0nwdg==
Date: Wed, 27 Apr 2022 07:13:45 +0000
Message-ID: <07b60613-21f2-678b-7551-cfd658ebd408@microchip.com>
References: <20220420103427.47867-1-tudor.ambarus@microchip.com>
 <20220420103427.47867-4-tudor.ambarus@microchip.com>
 <7f570c32-d0be-97ba-0a1b-9aca93cfbbf1@microchip.com>
 <20220421131657.d6hm7rltyxcb24wo@ti.com>
 <6f81d38b-5e4b-eaf7-0466-3c6fe5e84996@microchip.com>
 <20220427052000.xmctvowj4kuc727d@ti.com>
In-Reply-To: <20220427052000.xmctvowj4kuc727d@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a834ab15-37a8-4072-68df-08da281d77a1
x-ms-traffictypediagnostic: CY4PR11MB2056:EE_
x-microsoft-antispam-prvs: <CY4PR11MB2056A57337FDC67A6EE30BBCF0FA9@CY4PR11MB2056.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QVSGK78F1D1Fc6i55XUNaKlck3ey8pHDjl95UBT/YPEJ8ef0JH3L2nVK4u+zINUM3ww15LjIl4gEJ7nK0nkDvW3ksNbUzW1yN77DfGPypeodHz7FrlaLC3+B7O25hwAof1NARauLm74xGa+U1b8xyGWXbWbYx03cMccu97k8zPx2rg2iYxolnwVpgY4w/ApsgwgCggMRtP1j+6CX0shRwWayP6VhNbp7xZNm34qvg2fYx3SxnVfceMuMoD/wn1D3/JJp3wMjENZ5VVlk2HZ4Mc+2oUgExaEUp27s0NML+GyvExxAOqMBPIdJD1FEwvfY6inrdMrFV1QaAQYVeziJOlbX5Y0aR3mWvmQD0DkDyqPQ3W8ThqNa+Mpveh5t3rcpVOlc4cx+0jrE+zI3QWL/Xkl7GrRXRAz4IFkhWmFK9cB/gbhrHm/8oZgHXx73bpSA0ee47ZEUV6otF/Ak/sFvzYfPAlVkCYdPah6a9zP4TqmZGD9DNa+fNaMA8OqOUaB6wXOz1hvuIry2E2ttbzeOXtnfo9KOVMe9pxD6S6mvQwmaYaonkV+JX2E0SiFfQ/rTDoCUTzWQqzmVw+exyGaR18zO7OgxGiENAZD2ZHlwxmX+HKjCEEz72K858ABqSG4ZQwBWVzUcGY8PdnGoAr2HN9KZjiBLEkwE/tofuBp16GrQlCdq8Moqs6SmsCNHT3OiE0xw2jmn+03izDZgaBh8jmeMTYAAqfaGupXOp07W5Rp7rAhDxgXTNTICBZ3PMqETl/zkfhUOepdMvT5ulYGzqQCFDzNFMn6hdpvfj9F8AhSUHbmqv9o4yHZmIb2FdCEGN0mukY/mX2fX3OJGOwjI1L0LIpoSsbVdClcj612cjuDb2jb0pE6Q+KRftWqFG9IVB+aSQt2dG1AVXdGE/k3BoQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(66946007)(5660300002)(6512007)(91956017)(122000001)(8936002)(66446008)(66556008)(4326008)(76116006)(316002)(26005)(38100700002)(86362001)(31696002)(38070700005)(2906002)(508600001)(6486002)(966005)(71200400001)(64756008)(8676002)(66476007)(83380400001)(186003)(53546011)(6506007)(31686004)(36756003)(54906003)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0RYS3FxenhPWjZ2M3E3ekU1cGIwWFd0WXRHbS9wL3pLZThjSXpQZUQvVWoy?=
 =?utf-8?B?QzFMT2MxN0h0VzN4ZEpGVHBMdEJLQ3UzTlpac05aN2xBc0JxTGpLOFF0MnhD?=
 =?utf-8?B?YzNHNzdBQy9YcmpJWHZhakRMQkpubFpZOUhYT1lIYUwrQmNXM3pjSzBKZ1B2?=
 =?utf-8?B?UHkrUjI0QUgyblhCS3VzWEpFeWNIUFZnVVJDVHRGdit3V0dnaG9CeEFDQk5z?=
 =?utf-8?B?TFZUK0x0eGFkRVBHSkt2SjREcjJPRldsQy9ZdVNKa2RaNHNYbGZrbUdldVha?=
 =?utf-8?B?cG1qREwvTjA5TGRJRml5WUx1SU5ZR1lvL0lkZENsZklhalNEanBOaW85UFgv?=
 =?utf-8?B?U1F5VFpYd2UxbHZDTlVuNm9ic0oyVXRxdVF0TXkwUHJpeTVEb0pmQ1E4VnJ3?=
 =?utf-8?B?QUpiVWFmOTBBZW5uMlY3cXdXNndtN3pNbVdCUTY1aUMwZW9MZUNzY3J2TjBu?=
 =?utf-8?B?emtsaW1Ua1I0R2s5RXMvUEo4cmFZaXhSdlB0a25RbUY5WngydFNxbSt2SE9F?=
 =?utf-8?B?UUVzT3doSjJCZ201WENTbGlESG5ORFNjMGJPV0ptVnk2UFdRRlpXQWJqODAr?=
 =?utf-8?B?MDJJRGJMRnYyeTNhSDM3bTVNdFFDdHYxeWxzMUU1bk5WT3pndkpnSUcxQklJ?=
 =?utf-8?B?ajRHRVFyNm1PZnpjSDg2MlhZblBSYnhWNWMvbjdIQlJMdEFvaURtaVlFM291?=
 =?utf-8?B?VjE5WTJ3VWpWc0xZUTdEZkxaMEJReHdBT3ZHcjNxR2NCNHErbkx3OHU1bjZI?=
 =?utf-8?B?ekpEUVkvQVJtRWRaQ3JYamZldFZCVzZ3UzdvVW03dGJvWmxqcjVZaE5hcm1x?=
 =?utf-8?B?V3JrRkd2cnphYnMyNERsK1hzVXAwcWQzV0J0NGtYczBiRDAwM0pZNWpDWXBZ?=
 =?utf-8?B?S2liLzBRMWszcFUrQ2tFSVpTZ2YzaFI5QnEyN1lWdkIreDh6UEJab2o1b0ZI?=
 =?utf-8?B?UEtFYnJNOEhiRUZmamg0SWNURXhUREl6VE9QK3p0YWlneVMwalpKMUpLRU4w?=
 =?utf-8?B?cGJ6UnZUL2w2TjVraVZFaElUT29tUkNFM1JvVGlScXRGS1FTNDQ4LzNUOTVO?=
 =?utf-8?B?WFAvOVl3TzRXMUFCUVEyUWVTQnlxbjN4NjJzTm5NRnc4UVFOeE9hZEsvNHVx?=
 =?utf-8?B?cHpSWXh1Q3dHcFRXS3g1YTNxZnpKR003bFBXM09Md1FIbHdoalZLcmxrQnlw?=
 =?utf-8?B?NE5MQm94VFpRb1RNUDJTVitBRHhJZ1c5SG5aZDAzeDdTRzVucXVLSFFQQjhC?=
 =?utf-8?B?bnZWcHhwWUZoNjVXK3YwUExrd2ZGUVpWM0ducDBLOHpDa0Z4bXloNm9tVkRE?=
 =?utf-8?B?eTRqQUc4KzY2MkI0dmRraUFNZHZRUEI4NFBMUUlNblgydG5YYm4xWUp1WEt5?=
 =?utf-8?B?YTNra201Q2Z3cmNyVFAzb0NSNUdtNUFZQ3BOOGtuSjlrNHRGTVlDb1BLUjRH?=
 =?utf-8?B?ZGwxWktkbSsxRk83b2p1TGd4aWZVTkw3WEFFT3JYZ1NlRFlFdVBoaFBkQWdD?=
 =?utf-8?B?aDdmL3lZeWptNUpJTVk3dkpUM1NXUC8rMDVYNTJNTE0rMnFOS21VcVJ4WkRS?=
 =?utf-8?B?VDRVSkdUcjVaQW9nTCtGK1BqSzNkSTVPNXFuWHdwRWtDWVJsUTlrbE5MTmZa?=
 =?utf-8?B?REpDZkdSRU1PeHpCeFc5QzJGdTAvT24rOWcyWWlibm00Q0pCZHlWZ2NlcUNh?=
 =?utf-8?B?RWsrdVFITG1OdHNiNmRmY3g5MllMOGpxMXQzaTNhcU44NHhoYmNCdHRFVGJT?=
 =?utf-8?B?Z1puVzJqT01WUWxoeGFGa3ZhQjRGUGtLNURucWRLaVI5OGZSSVJVQzZNc0U5?=
 =?utf-8?B?M0FibjR5YkNPYjhlc0h2YmhDdDczOTRJcE9mQW1xdDZEZjR0TC8vWmZKTE1k?=
 =?utf-8?B?WDh2VGM4SzFlcUtrOW9BWEMrVmFocXl3ZUxyOG5XeitjYUVscUVvTUxvTUlt?=
 =?utf-8?B?OXp6WmdoYjkxcndEQ3pOWDRtNmJKVitYekpRTzhPcmttK3pmTEE3Y2ZnWDl0?=
 =?utf-8?B?Y0lNTWxNd0EyWG5sN1Zqb3ZoWFQwZExtMVFvaG5udVRvOXAyOFo0aDdXaWtu?=
 =?utf-8?B?dEg3NFN0ZVdkM2dtME5uMkFwaW5MemRUN3RHMEtJUnFGK05WTmZrZnFtYlI3?=
 =?utf-8?B?VjRjV3JDdTRBbWhRTEVta0hRZmtZS0VLaTdFdWFVZFN3WDl5QUxXTUprMHNP?=
 =?utf-8?B?N2lJZnBvMWtwa3pXc080R2RIaTViaTI3aU11TTlQeW8ycWdXVUdhSEx6NG9P?=
 =?utf-8?B?UzUwNjVIbzhzSlNWYldubkxhSGRtQzhJdkQ2V0dUZkZkVEEvUDFwL2NsRXlZ?=
 =?utf-8?B?c2lHZ2hJSlhCMDRYRmtoYWtPVEorQ200d2FaZVhRV2NMTGNEL05kOUpTNFUy?=
 =?utf-8?Q?xax7JYTcuNENyj7Y=3D?=
Content-ID: <1C7C573DAE1E21498243EB6A93DBD93D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a834ab15-37a8-4072-68df-08da281d77a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 07:13:45.2263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+AOqHz/Fr4Wv6WARPTx5OpmxCv4e5uqLFEJabiTbbrR1ElwhCVGHwKtvTnbWe302JkGhMh87Vr6751PB1Al6iQyQ7nLvwrv/2uEbZZj1hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB2056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_001355_063410_6B3D23C2 
X-CRM114-Status: GOOD (  23.57  )
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

On 4/27/22 08:20, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 21/04/22 01:41PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/21/22 16:16, Pratyush Yadav wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 21/04/22 07:18AM, Tudor.Ambarus@microchip.com wrote:
>>>> Hi, Pratyush,
>>>>
>>>> I forgot to remove few checks, would you please remove them when applying?
>>>> See below.
>>>>
>>>> On 4/20/22 13:34, Tudor Ambarus wrote:
>>>>> In case spi_nor_match_name() returned NULL, the auto detection was
>>>>> issued twice. There's no reason to try to detect the same chip twice,
>>>>> do the auto detection only once.
>>>>>
>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>>>> Reviewed-by: Michael Walle <michael@walle.cc>
>>>>> ---
>>>>>  drivers/mtd/spi-nor/core.c | 13 ++++++++-----
>>>>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>>>> index b9cc8bbf1f62..b55d922d46dd 100644
>>>>> --- a/drivers/mtd/spi-nor/core.c
>>>>> +++ b/drivers/mtd/spi-nor/core.c
>>>>> @@ -2896,13 +2896,14 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>>>>>  {
>>>>>     const struct flash_info *info = NULL;
>>>>>
>>>>> -   if (name)
>>>>> +   if (name) {
>>>>>             info = spi_nor_match_name(nor, name);
>>>>> +           if (IS_ERR(info))
>>>>> +                   return info;
>>>>
>>>> As Michael suggested spi_nor_match_name() returns NULL or valid entry, so this
>>>> check is not necessary, let's remove them.
>>>>
>>>>> +   }
>>>>>     /* Try to auto-detect if chip name wasn't specified or not found */
>>>>>     if (!info)
>>>>> -           info = spi_nor_read_id(nor);
>>>>> -   if (IS_ERR_OR_NULL(info))
>>>>> -           return ERR_PTR(-ENOENT);
>>>>> +           return spi_nor_read_id(nor);
>>>>>
>>>>>     /*
>>>>>      * If caller has specified name of flash model that can normally be
>>>>> @@ -2994,7 +2995,9 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>>>>             return -ENOMEM;
>>>>>
>>>>>     info = spi_nor_get_flash_info(nor, name);
>>>>> -   if (IS_ERR(info))
>>>>> +   if (!info)
>>>>> +           return -ENOENT;
>>>>
>>>> also according to Michael, this change is not needed as spi_nor_get_flash_info() can't
>>>> return NULL. Here we can keep the code as it was. Let me know if you want me to respin.
>>>
>>> TBH I don't think a NULL check here hurts much since the behaviour might
>>> change later, and error paths don't get exercised as often. But I have
>>
>> I agree, but at the same time we're introducing checks gratuitously. Since
>> Michael cared about it, it's fine that we removed it. I don't care too much
>> about it.
>>
>>> made both changes when applying. You can double-check at [0] if you
>>> want.>
>>> [0] https://github.com/prati0100/linux-0day/commit/67d913746833ee54bf4c661040f3ef13657dffd8
>>
>> looks good.
>>
>> btw: I think this patch
>> https://github.com/prati0100/linux-0day/commit/b45bbff85d49529f8daff83c341a292f6c6492ca
>> may introduce a regression on some atmel chips. Let me try it please.
> 
> Did you get a chance to try this out? If it works fine, I would like to
> apply it.

I tried it on a at25df321a. When calling unlock, everything seems fine. However
I haven't tried a lock/unlock cycle as lock is not supported and I couldn't
allocate more time. Even if there will be regressions we can handle them
afterwards, so let's apply it.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
