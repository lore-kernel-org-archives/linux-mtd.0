Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05D3C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Nov 2022 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4FFIvgY6cH+qmmYVbHXonwEU0AikEoo7mz2HbetYjnc=; b=eGRpmRl4VtjDB+
	xdbL1i8b1AV9jd8aYMdPeYxiIbqB24Q5SBIbKN2VLNWPWwWXbpOVNLrdzOouwuh+bUgqAX3S8FCi+
	Arw+wCyPVGQ2fXH1Bn+iIZhA0xako/DJf4aicMr32g1TXBpkQJLYI9YqkD/nh8eYhgJ0rQ7AuF7dQ
	1Iy+6icH/HoJnr2kINd0ZpzZaNEYMSVBFE/Os2YrwvXRXuUigiPenPW742DANGRBFhMNwOPI7XXKf
	BQZRctCitq6WL4QdfQGJ2qrYySjHa4GKsOjwy0YnchWZpAlKto5O7XOHHKJBAx282gBQrP+GX36Jf
	Bo7xs7lh1WfasklqRb4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8dt-00F8QV-1G; Mon, 21 Nov 2022 15:23:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8NE-00Eza2-TA
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2022 15:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669043176; x=1700579176;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hlPz0Q5hQVVfm5sJG/lJGKSRrOFQzj7JlNWbl/xH404=;
  b=w7CbzmUJz8kTGy+dIoZQwogDBRygVFHtPGQpym55N3xqySyG1RtpiqEC
   9cQ4MkokFanK7v4/y0fDLw+E7I1h5ZTjZdWWWDnhqfYP1xpFUSkm7yxNv
   jTCmDlYkvYC7t1iDrOb2WILPGKNODwxiO3/W/CYy4POq3kdHy1R37LdXM
   2UoqjTF1ag5WvhbRFsRPPOmsOjZ8iMwfdwOB7pCytHYfmc9wp1G/orpz1
   c8/hV0y6shmxAFhJn2qizES7TSxx8kb+v5szSd3E22/ToLhleZoArKSn6
   LKAXZ6Vnc/yITw3jRvzOh2OMQrMZnM3UrUItzEQa18oEdsiDewycN3jt7
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,181,1665471600"; 
   d="scan'208";a="200719999"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Nov 2022 08:06:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 21 Nov 2022 08:06:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 21 Nov 2022 08:06:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRXIhH08NZAB0NWDUc3XrsnO9w3/SajElPfxIFF+GuQukr+sCybFZXgY7gJ8gaR9KzrWCwKyjfv7FLIP+ReU6zSrow9Lw/hkpiZECpkXy5RND1XCKYFvGZsawuhyknlAROhLHrzOBjjoPKK/OVNRe/CocYF++t4RGz0kOWn/pyHgUVB4YNnZNFbZZgBLIXwGEq/IJoHF6HvjfKt5nKVd5xJTh1OOf7Zxq3SIE0qFW2vO1yBbKBtL1sm8f2cx1jxPl3+JE0ixmeW40cA+e3Y0PZC5wJ9Sm2EZjuheH0kL52MMTwjDmPdq26LbMpc9RKoxTDsxGiFLlFeUWVLINhJpVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlPz0Q5hQVVfm5sJG/lJGKSRrOFQzj7JlNWbl/xH404=;
 b=KvKMANfQOWJ+OQuNQ1aIzeItZsDcCzhU1wAz6Swud7rTEQ+6hcEDS6pmOu/SmXQxJCMSJajHUNqD6u5OxSo1KFLq/rfoBqqgKStkuasaoWXMIGjc9QhK2lxBfm0ZWcTqzaPDPHs4JNInprbCJDGn6HstLWQll0M5XiCFf95agNzzOORyAArZtPO+OS9ukMYZB4TycPemB4ZNK49TlcvXmyRcP3JVac6/nubN7M57m95TfMyuHzEhDXVQPUYIiHONRf+duaj7EYtgjrqYWJqndrM/iKHOkhqreDdJ73BDoBQr48niaZVwAu8tdML0VEla+YhnwhfCgVtGxaocfB7Mkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlPz0Q5hQVVfm5sJG/lJGKSRrOFQzj7JlNWbl/xH404=;
 b=XEvJIOdGzGyjqObAxzZl3urZywiZ05jUF5f1i4Lq6sThQmp5by9N5URBN6migY46oyzEKQJmLz4zHgWE/kHjtfDNBjQ3XOWRK1UYxk8ASRpNQM34STNRlSQ8bnVM25JyCTuJuSMGrXkqIYDN8ezBpPUDPB0H0pnk/xvgJ75/7qA=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SA0PR11MB4718.namprd11.prod.outlook.com (2603:10b6:806:98::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Mon, 21 Nov 2022 15:06:12 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%5]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 15:06:12 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tomas.winkler@intel.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>, <alexander.usyskin@intel.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Add support for mx77l51250f
Thread-Topic: [PATCH] mtd: spi-nor: macronix: Add support for mx77l51250f
Thread-Index: AQHY/brLyrs62aNvt0aSmsrEsRAssA==
Date: Mon, 21 Nov 2022 15:06:12 +0000
Message-ID: <97a3b023-b9bc-c34d-45a4-ddd56f47bd76@microchip.com>
References: <20221023060407.1139129-1-tomas.winkler@intel.com>
In-Reply-To: <20221023060407.1139129-1-tomas.winkler@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|SA0PR11MB4718:EE_
x-ms-office365-filtering-correlation-id: 176dcbc6-6b74-45a4-04fe-08dacbd1ed92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WaGCbTT71pSqWjjo5Wx2vYaymBVuoO50k7Q4GMLNG8McT8ojUhSXWN+zoodnDlhpS7Oe0UKBNmJINfXg9JaotFx/oO5E88AKAOSU9mJwx76P1nylI7d2uhyEdbWkUa7MQRycBFQPE4/Mf6GTFs4dPOckTsqqSdN7iIEqPPvPqHhLishJGz9fNCK/cW+Abq3xywLSmYWevC215wKWjm3+63kKlOe9rFYA78GkeXYB8IgGXZ00OVJNkU0exmHBY/Q4lkFafTYTt5sYi0BRcLSAgrS96vQmM6lsqqMxBe0aTDJqrp/NXDvrXoUcErOJ0fL0MlAwmOy66uMaK+J1saqGmXr0Zsm2kf4t0xalABgUQdz1dwhh5nBDBtto8vh8+mPtXLTEITctN9v9LMLEn+E2OjZBVK7kuC75Rtw0QCDajFWz5BRZzUu00NdmrGZlZzzbg1wU8PJelxasicVhaZeNpTqUDeZ33DoZykOXFD4jyfhlGLnaLI8NgkH9tZOmBk5F7wMH4eNKgOkIMSC4S52ROobi7gAd9AeEbApMQHudhI9VoxHKMhx5gS53UZvvplhyrov7KkhseQuYPlKekf+XTPHEorhjqBkB0YrzNFc4HzqsKEUy9qVv/auVQEP3sCGUAWrjIXOyxGssXxydm3iixqIjBTlPEmITmeepwMrVGrOts1T1V9Wnms+6MIjwZTaBUpudrYZkn65XBOv0rc/4Dtn50TNkry3RYQlBsOYQGrBpjxYMC7V93VhIKihe/RH3aHioBzVF2ehOAOSnmtH/aZb04W+Pl+XoeF2ESHvUbEC/kXEEZfrSlMahG/HdRZCc3Gsc/nnzx4sI6zSD2zLmnZKr8UqtotaytktqatkhAEM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(122000001)(38100700002)(86362001)(38070700005)(31696002)(6506007)(53546011)(316002)(66446008)(5660300002)(186003)(2616005)(8676002)(6512007)(26005)(4326008)(91956017)(64756008)(966005)(76116006)(110136005)(66476007)(54906003)(478600001)(66946007)(6486002)(71200400001)(83380400001)(66556008)(2906002)(8936002)(41300700001)(31686004)(36756003)(43740500002)(45980500001)(473944003)(414714003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGdhcEFXUWxJcUhSZ0hYNWlMUnlnbFc5cEhsL21GRThkY3ZCYk1meFA3MjlW?=
 =?utf-8?B?dWlTZmdVRjROR2RPVnZvMDB4TzNoNjZDb09mbHJRYzBvM2ZEbE1IZ2hvU1hi?=
 =?utf-8?B?dGpoNHRIbENrUkoydmRWZDcxUDFRdkluSzI0RHdpaS9McG5XcURNRVFESnl1?=
 =?utf-8?B?TEFoUWFQeE1BTU1EeGM3aHA4TFk5ZkRNRngzVC9TQVJwdUM3ZDB1dUIzdDZ1?=
 =?utf-8?B?QkwzZW1maVJra2xLanJ3TzdhTEZ3TE1YWEs0VTRISzZrNHNyVWJzeGc1bit6?=
 =?utf-8?B?MWNmaTVjQ29zUzZRajBRVEZoMDBoeW81aG83V3ZJZlhna1Q3ZWU4bi9JdVB1?=
 =?utf-8?B?MGNHNVZOdXZBYllsWUV5V2IwZWpjZWJrbDc3cFpCay9GZ01ZOGd4c3pyRHJS?=
 =?utf-8?B?RytOUnROTEl1L0diSkdXaCtyRC9CSnd1Ry9PVVp1ekhORHVoVktla1VucGhK?=
 =?utf-8?B?QmF1dnNkTE9GY2Q2Y2J0bHI4N2VCbjNKR1F2TTVjUDgvbWI2Nlh2S2JNUTVW?=
 =?utf-8?B?MStjc3hxbkk5WjJhZjhBa0ZlVGNIcW5KRFJsVzE0Y01UcThwaWx4V2xHRGFH?=
 =?utf-8?B?emFoenVYV3RieHZoZzJmTy9KamFTU3ZIenZzZ29BMVBnZWIzK2VhVndobnpF?=
 =?utf-8?B?RHFXTGNJTk5vNmdmckh3VVl3NnJ1QnF0dVFlanJ5TUVaNWNHMVBnaE9MSHVT?=
 =?utf-8?B?NHI1SFVTdXFxZWdYM1dyZkx3L2NTejk2TzV3amd4d20ySVR1TkRET3B4TjVt?=
 =?utf-8?B?V1B1YmxVYkFsbE5UanVSYVJJTnFTbXJLN1NPTS90TDVxUW1oSERTS0cya2x4?=
 =?utf-8?B?OVVsQlU5L0l0cy9pOS8vcVJ2NStxc2haNE9UUVhEbExLbWV2Z1FZWGRaUU9U?=
 =?utf-8?B?T1hsbWVyT2dlVjAzRE1abVM5OHBIc1JvOEswK3IzYmx0VEFVek1GRWRjVzBD?=
 =?utf-8?B?U3B1b2ppNndmUDcvOGhqU0NTK0lHb3lpQWpScW9oSjVBNlQ1d0tweXpkdEZR?=
 =?utf-8?B?WlFYOUZhSFpjYWFsZGFCRmR2Rk81RVU3cXZmRVZ1YTF4WHpjdXcwNkRmSFNN?=
 =?utf-8?B?ZmhEN0R6V0dxcVo1bS8rejNicGRPVkMzZFlEbVpwQzJ1NWh0eUdqTmllTXFk?=
 =?utf-8?B?emx5Y3lPYlQ5YjN1LzJ4eTJldDhCczJkVEQyUkNKNmszVFdrU09qSjJLdW5n?=
 =?utf-8?B?QzltOG5WV2hrSHIra1ZCeTlvTUJRRm5CVjVHNzR1SEtOdllIN3RxYkJVc2xy?=
 =?utf-8?B?REorUHpPbE9iYkg1NUZMTW9PNWZGMkl3dWZQNkl3VElGc0pHSWdLQzN0K1l6?=
 =?utf-8?B?dG9DUk90L0JuOE0zc293M2RxRjZ6Zno2UVJBNENZTHg0ZkZwUjhWQ2lEUCt1?=
 =?utf-8?B?dlVCeXpPWDEyeU9NZWxPU3VjbUtxd1c1K0M2NWlpQ2YrVHRDQ0Y1aFFTc2pN?=
 =?utf-8?B?VnZiaHhpTmVQdEwrQ2JWNThLNUtzUHNzcEVPQUFjVUNxMXlndFl5N1A3Tlg2?=
 =?utf-8?B?ME9zSUJ4dWpQMG5iMVVLZzd1dWRYWU5qczRUNGZIWk43QjlYb3JxeklZYTRw?=
 =?utf-8?B?enRzNnJIK2syOGpRWkFnYTQ2WVRBa0pnc1pNWklzaEdsbWRJQk53eFZEZ3Vz?=
 =?utf-8?B?YVFPb095TmpNZlpsd3dVUlgwNG5vUVhkMFRBZTkveThSZE1RQmNGaVVNUmpD?=
 =?utf-8?B?aDRiMFRoU3hxZ0JYN0MyQXk2cmE4bTQ0Q2JxM1hYdmtpemxYWnYzUXIrayt0?=
 =?utf-8?B?SXU3aHhBbUtnYnJqYVVWallKV1RHeHlDc24rOGFJSi81NzlzS05vMndBeG4r?=
 =?utf-8?B?QzN2UGppbVBFTy9iNnFPbDA4S2did0hKcTFtcmEvZWRWdVR0cUs4dDB0ajBq?=
 =?utf-8?B?ampab3lWdFhLYjhDcHJVaTNXVVJ5Z1Zuc055VHRyd1ZoKzQvUWVrZktyMHJo?=
 =?utf-8?B?SUN1NjlKeFMvSE9JSFpKbkh2bW5sOURoSjVaNEhuMTVicU9nTURXcnZLU3M2?=
 =?utf-8?B?ZnIwUVRCbXJIekdNcGUrL2c3WXl3aTBqVXNsbGpCSUlDaVlJQTh0OFNvTWtH?=
 =?utf-8?B?RXh2NHB2RDdHd1JUc2I4SU0xK3FVdUdKai9nYUpwbEx2ZlNGdWJNSDZIZks3?=
 =?utf-8?B?cWgxbWpxUGxTZnV0N2hkYWJNNHdibUdpZEtQajhUTSt0RllYWXZiTlpjMDEv?=
 =?utf-8?B?bHc9PQ==?=
Content-ID: <5255F966FAE74B4F80A81D95805384F8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176dcbc6-6b74-45a4-04fe-08dacbd1ed92
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 15:06:12.0250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDWqW2HLKwTiV3tn59njDiKeMAsrgJ1RIbtjnwefk7HkBKlcUF8P1FT0L96sfxrCuVR0/6FuL6JknKCZrqMNOivMB1g1QFms1AEHxkwvq8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_070617_002988_3151FB86 
X-CRM114-Status: GOOD (  20.09  )
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

On 10/23/22 09:04, Tomas Winkler wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add support for mx77l51250f spi-nor chips.
> 
> Datasheet: https://www.macronix.com/Lists/Datasheet/Attachments/8760/MX77L12850F,%203V,%20128Mb,%20v1.2.pdf
> 
> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> ---
>  drivers/mtd/spi-nor/macronix.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index d81a4cb2812b..ec7abb64e2bc 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -100,6 +100,9 @@ static const struct flash_info macronix_nor_parts[] = {
>         { "mx66u2g45g",  INFO(0xc2253c, 0, 64 * 1024, 4096)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
>                 FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +       { "mx77l51250f", INFO(0xc2751a, 0, 64 * 1024, 4096)
> +               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
>  };
> 

Hi!

Does this flash support SFDP? If yes, you should use PARSE_SFDP instead.

Also:
When submitting flash updates or new flash additions, we require contributors
to do a little test using mtd-utils and to dump the SPI NOR sysfs entries.
Would you please do that?

Here's the simple test:

Run the test_qspi.sh script: 
#!/bin/sh 

dd if=/dev/urandom of=./qspi_test bs=1M count=6 
mtd_debug write /dev/mtd5 0 6291456 qspi_test 
mtd_debug erase /dev/mtd5 0 6291456 
mtd_debug read /dev/mtd5 0 6291456 qspi_read 
hexdump qspi_read 
mtd_debug write /dev/mtd5 0 6291456 qspi_test 
mtd_debug read /dev/mtd5 0 6291456 qspi_read 
sha1sum qspi_test qspi_read 

The two SHA-1 sums must be the same to pass this test. 

Here's an example on how to dumps the sysfs entries:
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
s25hl02gt
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
342a1c0f0090
zynq> cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
spansion
zynq> xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080104ff00080114000100ff84000102500100ff81000118e001
00ff8700011c580100ff88000106c80100ffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffe720faffffffff7f48eb086b00ff
88bbfeffffffffff00ffffff48eb0c2000ff00ff12d823faff8b82e7ffec
ec031c608a857a75f766805c8cd6ddfff938c0a1000000000000bc000000
0000f7f5ffff7b920ffe21ffffdc0000800000000000c0ffc3fbc8ffe3fb
00650090066500b10065009600650095716503d0716503d000000000b02e
000088a489aa716503967165039600000000000000000000000000000000
000000000000000000000000000000000000000000000000716505d57165
05d50000a015000080080000000800008010000000100000801800000018
fc65ff0804008000fc65ff0402008000fc65ff0804008008fd65ff040200
8008fe0202fff1ff0100f8ff0100f8fffb0ffe0902fff8fffb0ff8ff0100
f1ff0100fe0104fff1ff0100f8ff0100f8fff70ff8ff0100f1ff0100ff0a
00fff8ffff0f
zynq> md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
86aef254bcfdf763bdb92e4c31667242  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

Thanks!

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
