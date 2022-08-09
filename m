Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BFAC19F2D
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Aug 2022 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+PCY42RGAvVL9MbXjPUE6YV2wFMZRLQA4SNR8tj+MM=; b=ypNkA5Zw3jSRbB
	Oa/0XYMYCkvudRAmJAmESme8vkIs7/EUKFJIwJbrOmBMNywfREfCPUsi9rWVcQhNbc4bsnZHdLOuD
	GOELgQESgud33/ENBxnC+eUS0XuvaJhgSjhZwpm/N3s41WF3u/4b9lZo0g3LJIVbE3cWf8Nd7vnxF
	+PhihMVBVmPmYG7SeoFY1et7t5TnYty6lEaVry/s85Ba8G/3DQT7/r0y267Z3oPpxoM7IdUr5BGfT
	R5P1z0DdR7E7libjrSJBjZ4s6LIjFrB7pmi3/J4dCe9owf1mNtDagw8dS+9/Z35WMatNfbVXPuRc+
	oxA4ecpToSvPDjGrFhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLRQT-004j9N-5q; Tue, 09 Aug 2022 15:45:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLRQP-004j7C-Fy
	for linux-mtd@lists.infradead.org; Tue, 09 Aug 2022 15:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660059945; x=1691595945;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1umr2qSKFFsjMxkBdbLaGClBrwg2vsGD5CGmadT7NmQ=;
  b=17uksECJcEYoIxZdQQ4TPQYoD8sLHp3iraJTWLsC9GBx4v/Gz6bFA7Y/
   dSo2QIxPbv6L0y9Lt9yLYvutq12/gZurXFd/4wzEbpCuihhWcPm7yh4IH
   6nWVYobfu9fuO07VE2JDWXrovUQZtZOWJz03I9qFJU29sn5A7neA8upgC
   ztqWokbLxQhg2iybfOmNGKx8XhdI7GYM82nIo0e3njpgYhtRJjMLzfzLN
   HYrN9sK8V1Rop6h6AOAWsZp4Ia9ppGJ9f3AjJx1NV1a6bx0ieRlEl4p0W
   tP5IMbFWoHbQ6vLRDmvtT+0bpxq6wrKqCinW4s+OGSztsyxtJFqedY8hY
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; 
   d="scan'208";a="185756956"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2022 08:45:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 08:45:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 9 Aug 2022 08:45:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clSwpSW1LjdwOu1XvOM2zkaaETn6Ve3OUoKZN0nL4c63rPEOZhM2Y+l4JbiWZoGjTVcj0wo5iO9INDe8n641SAWn0+gALKQW3tnuc0p7s9KLxw1eHPhBNsIRdFuDgM9VrfD56CRyq1qM18A7b4XIM4hsIAZxh5SugJyZJkuPoI1EGB2tO73MN0FHYmRpAdtBTsvXwpcbbD0u5xG0H9dsNKGehVEoWQlIyvLx8f3Map7s7+I1iZ63P6n6hAPnKecldhLN5vjRIgpr+jldPHTN6GXYqQ/STnNzOJhPcuOEie2bAVs+wv6BQlRQgZVj9mmQKWHvTniTBzod2NV1HLdY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1umr2qSKFFsjMxkBdbLaGClBrwg2vsGD5CGmadT7NmQ=;
 b=krhxYGSXt0Y2O0ONW52q+ViZvuxulRnpho03xMdAVT+VZlTWkE9sUcJFPwfml63nXt+4pV+8RvVjWwB81vRwxQ7+16ooIDWDz8y4HAM20ODy8Q/KeS5A9IjXm53rehVKF6l2+MUwPSLPbdNNr99/gx4u2Q3g/CUd/QJkhkDqwWVBEymGQ5uCjL776kY07hzeQqD8+lZuQgdm76M5rcWjeQLgu+uqbys5z39ZrK7+oDzLqKBVyx3mtsvx1lVJeZhY80XknlowpCdVUMOh3+x+17dkhPQ+5SsRqJNTVM3uuVI3asPq8fuoacpbomJuEcDPo2tN09pKzYtI/rJEdtvp8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1umr2qSKFFsjMxkBdbLaGClBrwg2vsGD5CGmadT7NmQ=;
 b=Hc8OikuqtbUyG1v3E7YIgAYusf3x9C5lEnX2MYY3kCAAbKgQtMM/++uyVMLkFgKUXIp9PQvIrTxSK/9XqLuLUcnfE+SxgvfcfgkHmOFtFvU3YJqlyZo1jBzRRoT9Ff7BDX37TTmABvKr9rnEhz986b05kN0Np5GZMm5lbt/9dEk=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Tue, 9 Aug 2022 15:45:34 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 15:45:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <hacks+kernel@slashdirt.org>, <linux-mtd@lists.infradead.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<p.yadav@ti.com>, <michael@walle.cc>
CC: <git@johnthomson.fastmail.com.au>
Subject: Re: [PATCH v3 0/3] mtd: write support for minor-aligned partitions
Thread-Topic: [PATCH v3 0/3] mtd: write support for minor-aligned partitions
Thread-Index: AQHYrAcPDX0T6EFNhEKIREFWvaxuug==
Date: Tue, 9 Aug 2022 15:45:33 +0000
Message-ID: <ac104658-b100-90d6-e07e-84dcb7f4a76d@microchip.com>
References: <20220729091636.59287-1-hacks+kernel@slashdirt.org>
 <E33639E3-F4DA-4344-964C-60D88443FD24@slashdirt.org>
In-Reply-To: <E33639E3-F4DA-4344-964C-60D88443FD24@slashdirt.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca1bad42-9596-4556-dccc-08da7a1e3262
x-ms-traffictypediagnostic: DM4PR11MB5296:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Czvnp/SCRXyk35G2LBY+htqmEcpxYm14LX8NoygcI8VtaLuU6SJcRYn0R1JkAQsf/5HwxwNjtTh/wtyMsEy3LGmwIBCcCjA6XG5hVNmxdLeC5/Y8mCRwy2oMs71f2uDYzphJlkLjVmyKf1tXneCYctgTdlZ4pvxl+R2POwtge9xitWGroV9nZgrrG6QwyjidjhrVMuO5IMDMFxqjUr91BR61ZLdglCiF4FNp6/MzP3KTQDKfQ8s7p2s0E65cft9tL/cv9PooDA/dqLQKP7umSKmNcr8njGiA9COvSLuZoioQwb4as2eEHwCbois7474pRlyt4MCq7msZ8OF/zLvS1TBJ854ZJILcP14YNBbNrwMJXDvB2Yw3rFrWyKRbApwjreSTTjFAX4vHnwmoT8mE7ADaly2k2A5BTYqq+0Mi1O9Q9qs8BSgQMPAR1Qhn7HS9su6C2ugZVYbfnB4pQBrolL3oyZ6cVKRnQOo1P6fBotrbiXi1aVtS2DpnPAAW22YGHoVv82DDILPyEUj8EOZ2xYrI0Wg0nCaggAnIDSGRojM35js7piy73gmIoU8CQfTknZHSpvZ6kAfiAHiNDTPvDqf2tvffP8bhwzPFZRtGUEQWDiwCJBIjla14G/1gaP/CVf4XVLMosAAx7QyPNuQ/wHQ2pSnlIy1xHfm8PKE157fBOtFEHlJGTT9P9DMMN9yBii1UeUW79f4ikjqU5M+oYKThGFFG/Lhg3e8ODZAXLS3zar57HalUoGqcLpBEnZkCwAB27/vKAt9tt6CA9m/vABOTih53VQvkw5kUwXUhwOPcnIM7GB+fwNKkr9rhRNtMyBPtg8v4LaI+aRM8RIgf9sBj7E77YwFPkQnA4otf8tAOsErS9E8Vh8zVRwMnVAHsuhAz2TXTG+BUp3rjGi35Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(346002)(376002)(39860400002)(6506007)(26005)(71200400001)(36756003)(38100700002)(6512007)(86362001)(31696002)(966005)(41300700001)(478600001)(6486002)(122000001)(83380400001)(66574015)(38070700005)(2616005)(186003)(53546011)(4744005)(2906002)(4326008)(8676002)(8936002)(64756008)(66446008)(66476007)(31686004)(66946007)(91956017)(316002)(76116006)(66556008)(5660300002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Qjd3SjVFU3psQ0YwUHNqZ3M4dFdXZjdmMEVBNHZ6ZmpnS1puTk5BV2x6Z21l?=
 =?utf-8?B?Q1U2QUNwTnpoV0JLeTNtMVdYRlpzNE5CNlE2bmdTbzk2N0N3bmhYdythZVJo?=
 =?utf-8?B?TlZhT0szRHJhVkN4aHJaMjY5K0RuRVNhSmhLVWpkenR3TjZuaDFFeFN6b2pl?=
 =?utf-8?B?dklHcnFFWnJNQ3V4bTZOcTRKWEVuN1JwY0JCQ2YxSVRIMWt1Qm91QWVrTDV0?=
 =?utf-8?B?WWdwemhMbzd6RC9ZdGpXOFMwTktaOEN1OC9QOXRNK096dXY2MXNsNmRxcm9k?=
 =?utf-8?B?bmF6TlNLaldGMVF5K2ZWR3Bxc3ZrL3hFeW51TmNmaEgwTTN5OWU4ZDdtdkR5?=
 =?utf-8?B?ejBRclNBMGJ0MCtMeE9Jd2lLTDl3TnkzNEtCanc3S3l0TWVvN3ppTlNNQVRj?=
 =?utf-8?B?bmQ5QVUzWWNMUkVDUytORXZnS3psWDh0TTF3NXQyK2pTbmh4akxwRFh0VjJu?=
 =?utf-8?B?ZTdEdC9EbnVySmVoT1lEZzN2SEVxS3l5SFpHS2doMDJyYTBVVGF3bVgxazJo?=
 =?utf-8?B?cnkxZlkzcWFxeUUyMjJyWWx5SnpxRzRmb01SL1p3dGpKcFV2WVhVWVRYTGpw?=
 =?utf-8?B?V2ZNbUdxSFNkVmJ0ZFdBSG9CbGxzNDBlUmJmS2crUDJJY25RRmtESTEvS2ts?=
 =?utf-8?B?S09qRGliYTQ2ajZLYUE1akpEZlVBZGJyRFRoYWNRZFFENGw2d0hINkgxdUhJ?=
 =?utf-8?B?cmhBTmMybGpIS1BrbTVwRllvbzlvSUJzZ0o3VDdKclc3UDg2YUZidGhOb0ti?=
 =?utf-8?B?c0hDQkJKL3IxNW1jN3JyM01pMU5jSTdmT1NDZmF6UkVyS0pUbXdhbWs1Z3A5?=
 =?utf-8?B?OWdKUE1WcWxjUG9RM0FZWVcvNzljVFg2cDJkZzhyQ2hIRVFHUFZsRWpCaTVx?=
 =?utf-8?B?SWxNMFUxQURzU3FRMHJTS0o2ZnloMXZ1T1oxRlhXeWx2Q2NPSmprdXlQZHRm?=
 =?utf-8?B?S0srZGVocmF5WkRCeC8zZmlaYnVVYTd3ZGQvWWMvY3NCak5EdE5RQmlCa1gy?=
 =?utf-8?B?VGUxSGxRUlp5YzJFa3UrRGppWTdENS84MVU1VGl4R0VteHZOVWRXY2ZSVml3?=
 =?utf-8?B?TTRaaEdTK2ZhNGdYL0EwVEtENnUwWHhJRE9LeElTRUduRGxweThZbmZlNC8x?=
 =?utf-8?B?R0RoYXZ6WFVaa01jY2Z5bDJ3Ukx5V2VvaTUveGJJOENvcmJMVGJaNEE4RUt2?=
 =?utf-8?B?ZjVsZWdGSkFoT01qTkhhNjU3QStJSVZFQW4ycFNGMDAvemd6S2xkM2NaTFhI?=
 =?utf-8?B?MEZ6UlNyaE1xczJ4QjVyaDJUajZPUTBxdU1kblVBOTR6M3EzMFQza0RITTFv?=
 =?utf-8?B?SldsZHVMSlNscXl3OG84OVMxZ2NTUnE3VS9LTjg0c1dCZFZxZEg3YlhWWFk2?=
 =?utf-8?B?MS9rRFh0OTRhKzIvWUdJWHB0cXJLQXUweFBKSWhlNGxyTDdMYU14dm9GalhC?=
 =?utf-8?B?U1BHN0YvZmlhSHJFeTBDUkZsbGFrdUFld2dYWGpQS2FXYU51YjlaUVk4TXlX?=
 =?utf-8?B?YnZlcUxkb2YxaFZLYU5aK1h6dEJYZGt2Q3FyWHZZVVhoZlB5ZUFNR0h6aWJt?=
 =?utf-8?B?a29YWFppWlVSZjZxYzF3Mm1NYi8zemJXeE83T1NGb3VSWUNZNVllRysyTXA4?=
 =?utf-8?B?dkdvQ1VZMkJtc05zM2RqcGZ4SEFZcFBKM1R2QTNLWnJSRUtHRTAxUlJ0UVky?=
 =?utf-8?B?VE9reXViMGRvYjJzcHVNQVNBcXgvNHVpcmtSejZKNk1iL3RiY3AxUkhuRDRJ?=
 =?utf-8?B?eEdhVS9pZmtRZTZBVkN1TWtZbnNWeURXZ3MwN3R1akphMEZMa2Q1NDM0eS83?=
 =?utf-8?B?Qk41a0t3dTJwVDRQNVVPNkJIM2NFTy9PMjd6Nk9kV0tSbkh3UzF6ZnNJZ1Ja?=
 =?utf-8?B?cjkrdzh4d25HZDNhWlZ4bDI3ZGYrMlRxRVJ3Tis2SzlQRUZEd2NwUlVMZVp1?=
 =?utf-8?B?MVlnM3ZsNDhNWWRyR05xanhCRnpWc1dkVVZSR1N1MFAxdFRqZ0E5bytxQW52?=
 =?utf-8?B?MzQ1b3lWMmxJb0RycTgwU0Ryb2EydlBYVGVxTVdMOElaYmtyMGpPZDBlblll?=
 =?utf-8?B?ekhQWEJqLzFnUlJnaGJpV2hyekVmSXl1NDhhOXJkdFBadnZXcWloS0lXS0t4?=
 =?utf-8?B?azA1QkxVcjhTYlF6cCtnSmxlSUczT21vQkRVYVlJaUNZMXd4NWd2MzJQbWt5?=
 =?utf-8?B?L0E9PQ==?=
Content-ID: <86C09A1178F91B40AA3BF07280E061C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1bad42-9596-4556-dccc-08da7a1e3262
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 15:45:33.8669
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v8t1uO/UxSt4U98AfHhB4HLVQsYGDABcz4ljky2H3LDFXsYyt7ayPSPnnsk/r/EDYcGq1toF4sXetMdpTh+AdQpDigMWBEx12apSE8PZ+kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_084545_781495_F21CD7D1 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gOC85LzIyIDEyOjIzLCBUaGliYXV0IFZBUsOITkUgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gSGksDQo+IA0KPiBTaW5jZSB0aGVyZSB3ZXJlIG5v
IG9iamVjdGlvbnMgaW4gdGhlIHBhc3Qgd2VlaywgY291bGQgeW91IHBsZWFzZSBjb25zaWRlciBt
ZXJnaW5nIHRoaXMgcGF0Y2ggc2VyaWVzPw0KPiANCg0KRXZlcnkgcGF0Y2ggc3VibWl0dGVkIGlz
IGNvbnNpZGVyZWQgZm9yIG1lcmdpbmcuIFBsZWFzZSBiZSBwYXRpZW50DQphbmQgYWxsb3cgdXMg
dGltZSB0byByZXZpZXcgaXQuIFlvdSBjYW4gdmVyaWZ5IHRoZSBzdGF0dXMgb2YgYW55DQpTUEkg
Tk9SIHBhdGNoIGF0Og0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4
LW10ZC9saXN0Lz9zZXJpZXM9JnN1Ym1pdHRlcj0mc3RhdGU9JnE9c3BpLW5vciZhcmNoaXZlPSZk
ZWxlZ2F0ZT0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
