Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09311C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkxRDY93YHUk1Gky46hUEZcqHwgFLe/zutl2B6Tur5I=; b=n8q8pdYXm8OuuQ
	dXVkbYnfMPnsWpRaAxP1jx+JFsqCtr3aV03RLNeQl9VRrZ9sQfFth7Xps7JYtiddz0c9IkEiR3jng
	OOyeWfgAuE61I+qE5b1cqo0qEx0rWbeAhC71tLCTthhA2Z+7TiTijRjtFsleWkcrLp1JEDJKCS4T2
	xcB+/baDtF39j778XO18MMWh+J3g7vvgStw1Nbd/0MT+bzqr+EGL3LRXSGFvSoXplDTHdFKa0TbEF
	W1vHITcClRFMqwCecxh5PUZIQgEg05H0fUz1kY0F6M+K6qmjk1HfplGau1VnN64Dfdi3NLjdbEUnP
	VwBd/l6h9LK1nVslaQnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI0E8-002RWa-C6; Thu, 10 Feb 2022 03:34:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI0E2-002RVN-Sy
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644464070; x=1676000070;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OL218jjZaXv01rPcn3bN+VPh/tZ3smNY+qgDoHkK0RM=;
 b=tEV2/T7bg1ccs83qJQhhk2nwXE6OkhxJt29SNOBHgxWrcbfI5UAE/d1l
 tG5FlhojbL6Yd67ctqyfhntob/Rt5QlZOCZ1W7TG0Kx2P2bfz8ca+0BeG
 JcZjzsZ07UjAKigT2n7kkx+fcRF/cb20SjZyO7+23zCle46xgp/mooYyW
 kj7PEYlzGHcvJZ/Vkw58e+CZWwphi2reONWwY4FxCucPcRsLV2y4lOypv
 MwOkBj0w0ad2LC4AOcW6l7TB0LHvCtlCfVezC/v4xZ7AIFijpcYJ1Pcsx
 1RySbFD53hrTi+5QSQxmz3RpWipyuMaMztD5Nav4ufGuy//wJk60s1yWJ g==;
IronPort-SDR: DE2elfTVuseEfWLyjR9uHxJP9ffJhZJG5JHgkoUCCjbVTm/XYIgEKbIsESZzwjK9+fm5oRkJb9
 kDgG3TrubuidzeACymFh5Npove4XgSIpfQiIhGBQptUDPg1pMNDOGOMr+R6KKv8Sz8FX1B3sVt
 ZCzLg04w7PvG+zu3sumiENYhZUUgMZ76oXpl3DAAHnMICwH/3Lke9yFJmcWYOehwzg9cbyWl7q
 mxSpjTSfjGnoFIK/BqA8SQ2+Ywh2xs0V9CnfCsKWyTlbR7Wi62dFpGyh8URi9Brs7vw7JFiwy0
 /q0NHPQw2KUueODyA9QPOJai
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="85254335"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:34:29 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:34:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0H7grVtMs0IlnWIvLPN1OZmEZ777wTivelfImaZmMtwX35gIhtmIpGhXDYyXngMRC9tiED1kRbbECoQq2o2AW8SARZhIOjDwD76TLYpTz5cdqYuD5qTcKEMctL78BsbxDUMR+u7WiqmvYyH8zFJV6DeL3Daas1w8N8L3MTHJg4/O9yKFkCqD/j4yi12fuAIGyijf/rGcNexIvOyn33h8b/5Ay5c5V5Hpao9n114tDswYgMNmYnNXnCWdu4XjS724sPkUN1AjU2qKp0nkIbFxTQERjzFnK3mkQYZPCZb0zFPCpl4cOcuah7m82Hh2rnkhPNGr1lin88Q0SxGEWuRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OL218jjZaXv01rPcn3bN+VPh/tZ3smNY+qgDoHkK0RM=;
 b=BzSBBwmX1a+2mo+fYsMJaXfAbkE3EIUR1UyQK8bbn3A2Nh7UU5dmPh43hqYoK22SHzl7XB9vrILK+vMrJ1CpzqyNbHvRXkhZ0mHFvTcnCvEMtgpxOeVsMhH6sudA4E8KLu9MwyTeBehc11CPLR4jBssuSBlpG1HKZJgbvYLGlYf7ATFK/62Sbh4VYddeg6B2ZaiokVUQ37CRH+6xjLwAFCmJeMjfEzasmDGDzndx2rdw8+ex1olXOqVlT9DeGRwslT1dp8STsmuoD36J+FyTIKXf7YYa8UXwBAqOlgPX/g0dA0tD1U3LTnhyqBHvdUxMkQ2EY11cFKA1iYD/8asmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OL218jjZaXv01rPcn3bN+VPh/tZ3smNY+qgDoHkK0RM=;
 b=TUxYHsQaYpOuJfXeq5GX9AHVaxvgRl8/tSJ/1HDlgO9lgwe/t/vZfrzK2r29nLZ6FShJYCoHJAJhzfXH96e7oRA3QZpw7boY9NdhxL4BYi8ytyP+HiI8IP3bXx61++n9FT+Nhd6iK9R4kQe29mLjMHuQi4/juFXM/C7orgEa98U=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR11MB1411.namprd11.prod.outlook.com (2603:10b6:404:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 03:34:27 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:34:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 13/14] mtd: spi-nor: spansion: convert USE_CLSR to a
 manufacturer flag
Thread-Topic: [PATCH v1 13/14] mtd: spi-nor: spansion: convert USE_CLSR to a
 manufacturer flag
Thread-Index: AQHYHi8atNTWWpNFSkuFuhIx1pqRfA==
Date: Thu, 10 Feb 2022 03:34:27 +0000
Message-ID: <b02814f4-bfad-6b80-e849-1bb57b74702d@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-14-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-14-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2651532-ea57-4597-88f6-08d9ec463d78
x-ms-traffictypediagnostic: BN6PR11MB1411:EE_
x-microsoft-antispam-prvs: <BN6PR11MB141189AF8F5C9DCCB5D52060F02F9@BN6PR11MB1411.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uxaBkbi0tyEkns21hNfTELr3n5P/CpzofWrBXkml/emTngd1Ds94pYtcAONAEIIlGbuVq2rBo4K8yUBybC5EXTPMDi9NLwAhJxknBT6StevVFLoqKwq4YhoQEa7JRDLTHDAebHHq2MoPjCCbvMWDBH3VkkQY7zxWpW80pdzRCbkbLHYZWj8BmhOm4sHFFRIt3e1xJFj034n1U2pNAMTHGPi7E1igizfO6oh6rSKIjIGuNAUZ8cRLzi/m3/WRjdn+7In+EMiVNSuqaPyh1f3x9iqPmi54XgAKrO9SoDJYOs4OZIK3uyX0z24aFpQiLi7hm+YvoQ7zJZv3TuiMeeug98YJWFegSXitvcGrScMLT9VQvvwfXAmpenpWyq2O12g/wVo6YCN13t9SB0TrY0re81EtD80aTWnEz0kNeNTTOqD96BQp8EOygtIQFTnmnthF74yixTrzhUwt+fAbvlCq5BqtLAZcNYmnkFY5mx7qUT3werRTZO+1k7YeGDlxIQpSNwF8Jryq+VA1E2xrK6jQToPZq/qoXkrCbDBoqAOhmCSkBV59j4YcLruyWf54ri4Cbfh70oYkocXU7qHYrDIibFrHCYJl5NX2uPmlWu7qa08IWuWIoaxzDMMkGJgO4WNK0UJ+ktMCa2g7P2sxlQDTivCdKTsAIYqETWro1zzjq8TQMkGdsxx8+jXm5HkFW4hxzsO/7yJM48agxcBRcXo56DzOIVuOUv4P1lDvkRWPnMPqzeL/N02bU9TuWmgruKvwxVA1ZOX4HLwQRgvp8KSRDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(5660300002)(31686004)(122000001)(31696002)(38100700002)(36756003)(76116006)(316002)(66556008)(508600001)(110136005)(91956017)(66476007)(54906003)(66946007)(38070700005)(2616005)(26005)(186003)(8936002)(8676002)(64756008)(86362001)(66446008)(6486002)(6512007)(83380400001)(6506007)(4326008)(53546011)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2VWWU14N0VvemkwVTJMK3NiamEwNHJKQXViMlNLeEg5M20rdlhISzA4b0ZV?=
 =?utf-8?B?STFOTDRrYzRSd1JSL25QR2NNZHJIWnovSGZHcDg5ZU5rOVkwUUgrWCsySzdu?=
 =?utf-8?B?bCtETUVZcm1UblAybkZ0Qlp0T2JIcmUyWVdqOW03NGJ3UzBBVnA4SzYyRVdp?=
 =?utf-8?B?VC9TM0Q1TlIwVGxrK3Q3bzRSUnFub0E5NXREaDVodXdub0hBSXdWK3dmbVVV?=
 =?utf-8?B?NFV2Yk1aOFFybVR4MEllakgzVmZnUHpIVkx6Y1d0dnVJRWFuOFg2TmxLMkx6?=
 =?utf-8?B?YlN3OGM0Y2oxcmRaNGU4VkRxTHVSemhPWWwyQW41M3VsTnIrZGROd1paOXg4?=
 =?utf-8?B?UDdCclliSWw2OThsazNlWjBicVhRWkxiUDZ5T1Vpb1o1YzZvV2phSWwydURK?=
 =?utf-8?B?UE1hMlQrWUh2QWJTRFhoV0oxRVN6YXNmMDVHMzJmR3d5NzdneWpOVXFEOUNq?=
 =?utf-8?B?UitRLzFyMkdpaDNwTTJEZmhuaTNLY1lTSWtDQVh2THh1a2RYaFNEWVpURGJX?=
 =?utf-8?B?aEpvMWlDaTdDSUJ1T2pPM0F5VVE3S3hPUjc5cDhTMzJwMDJzK1FIdm5SWXlR?=
 =?utf-8?B?Q1c0L0JaS2dsTk5UNXlCMFpSbExsUHNrblBjUW5oZlJGSlhqNkhJNG1ySGhy?=
 =?utf-8?B?Qk5la2w2NU1pc2xhTjNJREdkUlNZbE1IMlZ6OUhUNUpzSUNJdVc4RUx0OGdP?=
 =?utf-8?B?UDRubVZlWFRxOVdoL2QyaDJjOU1Kdy9HMlFBYThWWC91ZnIrTHpRbDB5cm9K?=
 =?utf-8?B?NGo5Nm5iWm05aTRXZnVlVEN1Z1o2K3JnVFZyYVJ6d0xKZFV5QTdwbG5tQTFk?=
 =?utf-8?B?UUNZUVRNY2QyRVBNVHJOay9TMmRuZnZKY0Rja1YxenVuUVUxRm9wMW0zcmFM?=
 =?utf-8?B?SjJOeHBpcWliYlVNazdsRHVRcTNiUFZCcW1HckNDWWZsSWNlOFJsaUxzVEh4?=
 =?utf-8?B?L241Q3h3SWE4YWFkRHpTUUZrWnVzeEhrcTZNY0dhMTBhbkE5aHpTdlJia0ZS?=
 =?utf-8?B?b0laUzIyb0ZnT3FnMHdxTWxqaCtDMFQvNFMxMmRqVHNROURvN3ZJK2lsUENh?=
 =?utf-8?B?aE94UU14WFFGUEphQ1BHTFphbDVwSUZEYjZCWXVVZXEyYWxPRzdKN1FLUmxh?=
 =?utf-8?B?VnhSMGxBd3dzc08rRGZqdmc5MzRxTkc2ZnRVdFJZOXdFaUZxamZ2elhLbndh?=
 =?utf-8?B?QzFMQmtNR1JqRDc3ZUFNUDQxQzhXNjcybjBISkpPWitlbGc4a1laOXBEM0w2?=
 =?utf-8?B?U1dHMzBoTHdCRENyYm9kZXZpck1hZ3hzcVVxTmtMVitKUENaMkQ1YXZSQ2M1?=
 =?utf-8?B?VFBieHhjWkdWeWxtRCs0L0w3K3ZFSk5XSEYvNnUxTW15aWloWDNJNmRtWW1O?=
 =?utf-8?B?eWYydTVsY3dJMm1WVVgyakdHWStiQ3hsY3pPQVYxYUpxVCt0d0FaZzZyNmNl?=
 =?utf-8?B?RjcwNDFMQjRGaEZIRzMwUTJKd0dEYmpSRWdKQ0JVdjc3ditmdHhSTmo3aklN?=
 =?utf-8?B?M3BLb3QrUWtBTlh3a0IyOHMvQVZZR1pGWnQyN0ZaT0N2Z2w0UkNVNlRDSStD?=
 =?utf-8?B?S0szb1NQYytnb2llYWVIR04vaDVtNklVbEMxeGpuNVVTWnRDOWtzcTdwMmpk?=
 =?utf-8?B?VXVVWXJjeUpwbzBtUmY1cTc3bjZpRVovSzNVZmlUV0RBTnFCZiszRG96djhw?=
 =?utf-8?B?SFppNmgzVDJlZThTa1ZKK2RkN3FzdzhMS0hUcHdyZ2Y5bkZ0SzhlUnVCSExv?=
 =?utf-8?B?VElRS29oZXBydmtWS1hDMXU2R1c3YkZqdVpLcE80NVVxL0xwdGZ0OWttZnNh?=
 =?utf-8?B?cU5IOUEzQjBiemc3Ty9HcElvN0RiejBlNzJNN2dmU0g2VmtJVnZWNWRzazlC?=
 =?utf-8?B?NWlrNVpGZGYyZzNjSGZzTnFHODZVSmNIa3k4VVRYTjdHT3J6U1NjN3BQMjF1?=
 =?utf-8?B?dFRMSmhIeG1mYTFpSnB6YWNlbVljdEpqNFVDbFVlUzVBeE9tRlJMWEIzVEpB?=
 =?utf-8?B?aFZwaGNhU0E4czgzQmtxbkZkN2cxdEl6cEgranZldTF1NzkzbmdpNmtkVDVu?=
 =?utf-8?B?dDI5dTVQWWhwQUFsL1pTS0xzSTByTkhqSmxKWnJMQ1Fub2tCdzl6TG9ueXp4?=
 =?utf-8?B?RnRvWE8zeUMyb3dkdlI1SDVDbTAyMjkxQm5GVDZUR3VOTHd2akswaG5yTHNs?=
 =?utf-8?B?QktPc0NpVk5zanRvVUJLdkVPTU1EdWVzWkl3YXhnUjhJTUg2cUF3VU8rL0Fj?=
 =?utf-8?B?aGM3VlpXWGRPV0o4am1PWVdkdDV3PT0=?=
Content-ID: <841AB97DC378164F8DDCCFE954439012@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2651532-ea57-4597-88f6-08d9ec463d78
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:34:27.2030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dynUGT48UoXEe0iDbxGSSnjaqjBUoyxGFTvEHRFzsUqUB6IIYQiATIYw6BrAPGBIo+g4JGO68NXvdpzslcOrdYkbTRX+9Nj7ELNOy4zMh7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_193431_092879_A92C581A 
X-CRM114-Status: GOOD (  23.31  )
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
> Now that all functions using that flag are local to the spanion module,
> we can convert the flag to a manufacturer one.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/core.c     |  3 --
>  drivers/mtd/spi-nor/core.h     |  3 --
>  drivers/mtd/spi-nor/spansion.c | 54 +++++++++++++++++++++-------------
>  3 files changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 5b00dfab77a6..2d5517b3db96 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2448,9 +2448,6 @@ static void spi_nor_init_flags(struct spi_nor *nor)
> 
>         if (flags & NO_CHIP_ERASE)
>                 nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> -
> -       if (flags & USE_CLSR)
> -               nor->flags |= SNOR_F_USE_CLSR;
>  }
> 
>  /**
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index a02bf54289fb..2130a96e2044 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -14,7 +14,6 @@
>  enum spi_nor_option_flags {
>         SNOR_F_HAS_SR_TB        = BIT(1),
>         SNOR_F_NO_OP_CHIP_ERASE = BIT(2),
> -       SNOR_F_USE_CLSR         = BIT(4),
>         SNOR_F_BROKEN_RESET     = BIT(5),
>         SNOR_F_4B_OPCODES       = BIT(6),
>         SNOR_F_HAS_4BAIT        = BIT(7),
> @@ -347,7 +346,6 @@ struct spi_nor_fixups {
>   *   SPI_NOR_NO_ERASE:        no erase command needed.
>   *   NO_CHIP_ERASE:           chip does not support chip erase.
>   *   SPI_NOR_NO_FR:           can't do fastread.
> - *   USE_CLSR:                use CLSR command.
>   *
>   * @no_sfdp_flags:  flags that indicate support that can be discovered via SFDP.
>   *                  Used when SFDP tables are not defined in the flash. These
> @@ -398,7 +396,6 @@ struct flash_info {
>  #define SPI_NOR_NO_ERASE               BIT(6)
>  #define NO_CHIP_ERASE                  BIT(7)
>  #define SPI_NOR_NO_FR                  BIT(8)
> -#define USE_CLSR                       BIT(9)
> 
>         u8 no_sfdp_flags;
>  #define SPI_NOR_SKIP_SFDP              BIT(0)
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 4756fb88eab2..c31ea11f71f2 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -8,6 +8,8 @@
> 
>  #include "core.h"
> 
> +#define USE_CLSR       BIT(0)

add a description, tell the reader this is a manufacturer specific flag.
excellent work:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> +
>  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> @@ -212,43 +214,53 @@ static const struct flash_info spansion_parts[] = {
>         { "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128)
>                 NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64)
> -               FLAGS(USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256)
> -               FLAGS(USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fl256s0", INFO6(0x010219, 0x4d0080, 256 * 1024, 128)
> -               FLAGS(USE_CLSR)
>                 NO_SFDP_FLAGS(SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ |
> -                             SPI_NOR_QUAD_READ) },
> +                             SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fl256s1", INFO6(0x010219, 0x4d0180, 64 * 1024, 512)
> -               FLAGS(USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256)
> -               FLAGS(SPI_NOR_HAS_LOCK | USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               FLAGS(SPI_NOR_HAS_LOCK)
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fs128s1", INFO6(0x012018, 0x4d0181, 64 * 1024, 256)
> -               FLAGS(USE_CLSR)
>                 NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
>                 .fixups = &s25fs_s_fixups, },
>         { "s25fs256s0", INFO6(0x010219, 0x4d0081, 256 * 1024, 128)
> -               FLAGS(USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fs256s1", INFO6(0x010219, 0x4d0181, 64 * 1024, 512)
> -               FLAGS(USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256)
> -               FLAGS(USE_CLSR)
>                 NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
>                 .fixups = &s25fs_s_fixups, },
>         { "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64) },
>         { "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256) },
>         { "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64)
> -               FLAGS(USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256)
> -               FLAGS(USE_CLSR)
> -               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +               NO_SFDP_FLAGS(SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> +               MFR_FLAGS(USE_CLSR)
> +       },
>         { "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8) },
>         { "s25sl008a",  INFO(0x010213,      0,  64 * 1024,  16) },
>         { "s25sl016a",  INFO(0x010214,      0,  64 * 1024,  32) },
> @@ -370,7 +382,7 @@ static void spansion_late_init(struct spi_nor *nor)
>                 nor->mtd.erasesize = nor->info->sector_size;
>         }
> 
> -       if (nor->flags & SNOR_F_USE_CLSR)
> +       if (nor->info->mfr_flags & USE_CLSR)
>                 nor->params->ready = spi_nor_sr_ready_and_clear;
>  }
> 
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
