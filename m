Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C2FC00144
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Jul 2022 05:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6xGmGY528fYj/GSy7iNxt/zDtXszYUpBmj7Tpppvmk=; b=ODWphBngV2A7zB
	2mQxq8V22alMDBgy1BqXaRqiODjFBpkMEG3hlMalhglV0hkAfTqkEqPWNxuZxqat2FHqE5Dy2GTi0
	Vx/ExC4n5kgYGOiyQz6Tozy2FiAdMPqbKfqkoC8nG/SfgRv11NG47ypyT/7qFVJHxmYj02OuFdH1J
	dV9zpvmb+zZmGtVysoilOrNvBVqt3t5bLJ4naamqf0qvM+9+Iox/M8a3kCr3KRp/ieznKX3w/xSLV
	dsQ6mY9u/r3btfxbTSVh+q9KwW4xuV9ygZHM2pzOMs+BfjYy0bU6GiJR1wdqs+MAIjCZ+GHBqDNGW
	CM6omi4YyyuegZvOb+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHIbv-001Zzx-Nh; Fri, 29 Jul 2022 05:32:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHIbs-001ZzI-3Z
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2022 05:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659072747; x=1690608747;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qq+pbjhx7O2t8n3KGQVNK5yCd1EiAJDK9kcCNtb8PUQ=;
  b=sMag6KoAREGWfSRCgq4mg7qIeL6QxUEwliQ0N9mp2PLPDMORa4lkBymL
   UBtR/c5VfkZEzjZjtlygsv07n4ketv32GlkRP0ega76Vy1vCdS5wPj333
   QxT1GukV9y4bRwSSvUZMlhyqojfTFHdT350Wq+dLw8Rt3/h9VtesU8YO7
   y4t1n8elX8ZH5UUIqyVgVUe6nKNwiFCwQ63SyeNJZeI243OubGHDHmjT3
   ogu9imipC95x2gAZxmpcPZC/4N3gaKrAQG4FhllAjRJF8glJA1EuTNGjC
   NnkG0yfSkbjOS52w/fvIwgkLxsjw9ePelprS3kQy2yeUWUmv+17xWRUkO
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,200,1654585200"; 
   d="scan'208";a="184252484"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jul 2022 22:32:19 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 28 Jul 2022 22:32:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 28 Jul 2022 22:32:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NaZYJEmnYPjUCgPHLi9zXfKCcLesiGMBAjhyKD3QNvXKzFb2SfMvWPgzDwmCmhH3DU9FzKL2wblzUlkIakRIx+GCrO6IP0dzUGRxY0j3feqSnwhIGQZXPoFYnGJo9YnFWpGKObvEUuUCsPrDHxMaJ4vzKN632KgHEXKSUd7WVsUdunauBlTp1rpoxXi9exZE2ebWLikdcvQFvbNwcc8e7hXQAW6cC7K/5mgBedJM6tw/zh6TbLNmQCEuM679FZcYG/CrBJCj+3nfp/mC5NvVsvRT5UHHqZFKZw2TokyLgkWkECY7aeE/dICij+pybrmvjvdLtq8q/XpSip8foAkr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qq+pbjhx7O2t8n3KGQVNK5yCd1EiAJDK9kcCNtb8PUQ=;
 b=ITxv9y4NdZkczjkq98Oq6BOuxCp3zLkR8u595zVoz3nqZxPfc/8zAo8csERZbsjxeVr8zJLkSLZvFrODa+UFasqt4yqmIdjyv4XOEoG66u5KMeSOWUujTUIGOUMczDX/9fZb0A7tsFnbQ3NQ4SsuimdWJ5wDPJP4q1K/nWKpbz5xWNvZtTB74g3VAJU1p/DFB5mRKNqhevBgr2rVuR2PLVtQePfxurF+MyyDvHPg41x7ZYU447zeoVSHoOkZSAjhX2KUIHutZ+jZ5gQOWmo7LKY8a6EBv6w/BisT+OJIWZ3dLkRWPwo9pEjC275IHvldunaX4knQpqvtqRVqitPqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qq+pbjhx7O2t8n3KGQVNK5yCd1EiAJDK9kcCNtb8PUQ=;
 b=gS/zUVjNB4tqXKT1opd5EMUEgH1ir9bq2/c4z0e5D2JJ2cB/WRscKpvRgofoGDN8tuu0P/FvgJFEt9PPPy+8WrpK4t2uZglFquZxhi7lLZiyTPY3J2Ct7BnDMVs/0fQNVLLxbzY03zTohQXL+gQmcoP9DlgYPZtPl91vFHERUa0=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM6PR11MB3340.namprd11.prod.outlook.com (2603:10b6:5:56::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.21; Fri, 29 Jul 2022 05:32:17 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::7549:c58c:5e93:7c35%5]) with mapi id 15.20.5458.023; Fri, 29 Jul 2022
 05:32:16 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <p.yadav@ti.com>, <michael@walle.cc>,
	<Takahiro.Kuwano@infineon.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Bacem.Daassi@infineon.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: spansion: Replace hardcoded values for
 addr_nbytes/addr_mode_nbytes
Thread-Topic: [PATCH 1/2] mtd: spi-nor: spansion: Replace hardcoded values for
 addr_nbytes/addr_mode_nbytes
Thread-Index: AQHYojpVJR1vNMR4l0imlC4GBfCU4Q==
Date: Fri, 29 Jul 2022 05:32:16 +0000
Message-ID: <486a0bbd-3000-56f3-863c-73df31cbe996@microchip.com>
References: <20220728041451.85559-1-tudor.ambarus@microchip.com>
 <20220728041451.85559-2-tudor.ambarus@microchip.com>
 <3e6bc7e6-678c-176d-d289-0e9e394fbb2d@microchip.com>
 <aeb5771d-16ff-cd8c-ad25-a076b4dd11a8@gmail.com>
In-Reply-To: <aeb5771d-16ff-cd8c-ad25-a076b4dd11a8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef2635b3-0500-4387-e8c6-08da7123b311
x-ms-traffictypediagnostic: DM6PR11MB3340:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9hMzEQhmIe3u5xUytezXd3vCRqMyAbeFtyySMMEJCKNadTzJ6lCvZtbwQBxYNQvUcZDoHW62NZTcAqi758xqkSqtMeyVQwOoKQtj26Wtmf7uplTkDtT6+uACzeP4yPrDuSZ9mTEEuqejwjFuhrwb5Y6YySjIhL2wp9mFLT1dd2pRHSnZAJPZnZAl3XokWEhpOqRAUlvd7+NsO7B5LkaCiqUay6bKgAE1gtnAImnZAtX1iNlrIkrWB1G32c1i/zd6QZ5nCDVeGivPbesQZl9KDHa1MQT23sXQ4HTtKQTyOtlyGM2OD3zekE2K/uoyvbMP3y4CQEyX503UfuTiqa1xZL//DOahFJuRWEud/5sVfm4d9rgv0iGFp5Mu9/Yogu/Ii3um6Uf1gy9pYq2Lv7P5CxshvMobMCfFmmuhgp4Z+mxDRatqlCO+B8TqNw5+zICMmB5vdIlrvQHm0fBPW+o9etKZYQNWw5Bby8nUQkXjpOPjkdQsR9wQXp39DM7rNL8+wK0v8KRCOW8eAQMI7w6Q22CdiorPIcXvJ0NzLUR2ZSyDpM6CmMsY+hX8pxSwEvTjCJTvs7tI/kxGLetOJU2Z2y7D9gO23CHUKCsXRSBmjVmtK00wzvPEgLhLRL9c/utQZb9er0YAsYwCooI2pUvl+2irpsmnR/eAs86DFdNVd+Ee3JQ1Gmr5OglXx6JhfWJnYHXtV5y4wcgye+Wrgh92Sc2iv4LzvsJnn5oj2rKeUaWt2a9EGfc2xFhhH1D9/6m1Zc38RbTiVAKeOVBVc2m3V2Dp+Ee5yOwGU2cHJ9FhB7YqeA1Gmu7kHeI8S2yTttCm+xpdsy0wuUp8QSXDO5+QFWFuPSMHiuBO5icfErXm6Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(136003)(39860400002)(396003)(366004)(2906002)(38100700002)(6512007)(8936002)(71200400001)(41300700001)(83380400001)(86362001)(31696002)(186003)(5660300002)(36756003)(4744005)(122000001)(31686004)(66476007)(54906003)(38070700005)(4326008)(8676002)(316002)(110136005)(66556008)(6486002)(6506007)(91956017)(2616005)(64756008)(66946007)(66446008)(26005)(76116006)(478600001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDB5RGluZnAzdXJPYVlTbDBKUGlVc1FSRGYwMHpUUjgzWW8za2Z1MHQxaFVa?=
 =?utf-8?B?OXFuYzhzMVFKU1lpV21vTXdrZGFnc2FvRnlpd2pjQnJ5b3pTaFEzVlJmSTJ6?=
 =?utf-8?B?M2ZUM2k4Vi84dm1hTGdvcEVKMU1uMlRpNmxaL2FPUEcybjRyMkVrNlQ4Tzlu?=
 =?utf-8?B?Mi9KWUVpd2xtcUlSZ3FKbkRkeDFEbWhvcmE0cFVSb1Q0SVVMVU0zN0N2dUlj?=
 =?utf-8?B?U3AzOXNNRy9PRGoycDJORHFOOVFHS0tudTR4ZnQzLzVYQ1VOWHNFRkhaWXRE?=
 =?utf-8?B?a3YxQXFiZG5oekFvUzlIV2Y3VXRodzFjU0JueXJlVklaNDJ1cSsvdnN5L2pB?=
 =?utf-8?B?NEJWVzlmRFh5MWhBMnpCNmZucEx1SUhSL3BIY1lQTzhtdkQxbU5NYk9NUGho?=
 =?utf-8?B?dTA0algvMndCVVYzMHp6dFU0djhEZi9wYWV4eTcxZ3NET3hxNlBCQ0xDSnor?=
 =?utf-8?B?MnVmVGRHdmdVbXppbGNIK3JWUi95VEk3VGtHQWlQbUZqanZ6S2JuaVFvd3Fm?=
 =?utf-8?B?MUttNWJLV3YwMDk3RUhiZTkraGcxTXo5QkFqd2lKUzllTlVBMVBqWm1UQW5B?=
 =?utf-8?B?VWg2WWVmVm1PVW9tZWxlQlpwKzc3Wlc3RWg4YUtMa1p5Sk12dVp3ZWlIck1S?=
 =?utf-8?B?WURxTHRpWG1qZXpScFVMZXVFMjZwT3pPSm1jRjgzdzBITTNJZTZ3OXZqeEdU?=
 =?utf-8?B?RkxIRXkwQWxTYzlvOXdFY3h6cSs3SG5WdnViRlBNYnNzcE5SNU1BcWRQbXlW?=
 =?utf-8?B?UVdCZktHblk1dmgyUC85bG9lYUpLS1lHQTc1REhvcDRTVVNURmpwa2x1Z2J3?=
 =?utf-8?B?NFhoaElOV3lPN3NzT09CY0hMdEdsYThyZGdpdnVEY0ZYNEVjN1dUOGQvSVpY?=
 =?utf-8?B?Tzk1N040UlAzSlRxSlp6MVFPL29BbkNNd1NpMVlRNURwZUdKZkQwQzZ3SFdH?=
 =?utf-8?B?ZFJQNmdBUmlTVENzN3pEcTVtNHlHMVRWay9ZbGVrQndUb1cvU0Z3RmNHUDBI?=
 =?utf-8?B?eXJWWDFsVDlmeHVNeGpHV0xRbnlodHFFQjA5SXdESCtPNlBndHVSdHBQeGkw?=
 =?utf-8?B?WXQ5b1pUOVNwNGYyOXFKVVZONDVkcFJ4K3ZtWlFOdGEzWUFpeHVDVE9ZUEpF?=
 =?utf-8?B?RWowU05uNFRMdzBFY3VEelQzRzB2Qmo5bDlibEtnenVWNldudnRlUTkzYlFh?=
 =?utf-8?B?MWF3WWx5T1Juek0zWUJCejlSV0MwQlZEd2lMT2xLVmoxaUJYREVTNGd0K3pL?=
 =?utf-8?B?cGRMTEJXeXBhMXRFeVV3MXhMQmZRRG5JbFJCSmxnbll2d3ppcGhHZzJaVVJE?=
 =?utf-8?B?L2NjZDBiZjM1QU1wR3BQcWZWZTZLUHZBeFhNOU53RlE0N2c5VkZuVkVFNGIw?=
 =?utf-8?B?dHpvQ3RUQUd6RG1QQzljOU5LWGhZazhUWW5NN3FCVVRzTmtrRTdMSExiMEtn?=
 =?utf-8?B?dDVja21ZSWV3M3JPNmc2MFFFWVR3OE1oNUt2aTlGUlZwejhhem81elBTU2xh?=
 =?utf-8?B?cVFHaDdOUkVlTzlmVDlvV09VVEt0RXpZSTBUQmIvZllTeThBL0NoYnk5UUIr?=
 =?utf-8?B?d3NsWUo3U3BxQkhvUmUza2duTGwrN3N1cGcxbCtCR2Q5ZHdxUjBkZFd3N0k5?=
 =?utf-8?B?WjVpVjN6VWJ6YUJoNnNXM29SNTFjN2RRT3FxYzhwS2lCS2NMR2tleVZ2UTFy?=
 =?utf-8?B?dVVYT0JrY0tocEUraW9JQlRrTFVRdjVNSmV0TjdNWlc0aUtaSldYZ0Uya0FC?=
 =?utf-8?B?U0l1YXpmMlY5aGlacGhaQ28zL09NNE5KVDgwZnMwU0xpVW5ZRCtYaXE4L3RW?=
 =?utf-8?B?MkF4ZkZLa1lLVWF5NDJpZGdUN2dLS1Bxck9zeXZEelNxaWdwOXB2eEhram1Y?=
 =?utf-8?B?dkZhSXBDYnFqUGVQRmVrQXdvbDZ5ditNanFzQ05JemxJcXgwK2ZVWGRzZFZk?=
 =?utf-8?B?L3JnRWs2TUJmS1k3SVlHOWNMTUR3RE9TbENGaDFuS3lXQmdIWnBZOE5hSTFB?=
 =?utf-8?B?Q2hjcW1FOUZ3Z0VzN1NkeXpPbU1VSzhuakl5ZUlteldPRHFoRHRKVDgyc0xn?=
 =?utf-8?B?VlRFK2s3UmRrdGl0d3JZanJPQmwxck55Z01laUJod0VQZ3hwclhteU5qeWsv?=
 =?utf-8?Q?qRZi5Syh7y486fHATwemZr+sM?=
Content-ID: <FB4C21ADD0BB104BA09659A3972DB84D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2635b3-0500-4387-e8c6-08da7123b311
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2022 05:32:16.8123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yyQv4/ALKVDOGRoELc9mSzrcGW35VqfTGMTkESK7lf4ezMgLG6XwSztiOVWv9noCw097cmYycLemV4W+sIpNn0hQ8cAPW1sendvY42b2dgs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3340
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_223228_419866_934ECB4D 
X-CRM114-Status: GOOD (  12.06  )
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

On 7/29/22 05:35, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 7/28/2022 1:27 PM, Tudor.Ambarus@microchip.com wrote:
>> Hi, Takahiro,
>>
>> On 7/28/22 07:14, Tudor Ambarus wrote:
>>> We track in the core the internal address mode of the flash. Stop using
>>> hardcoded values for the number of bytes of address and use
>>> nor->addr_nbytes and nor->params->addr_mode_nbytes instead.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>>> ---
>>>  drivers/mtd/spi-nor/spansion.c | 16 +++++++++++-----
>>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> Would you please test this patch. You'll need an s25hx
>> and an s28hs512t flash. Thanks!
> 
> Both s25 and s28 works fine!
> 
> Tested-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Thank you, Takahiro!

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
