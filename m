Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CF4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 08:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwy2ke6VFvu/kcncJQuZh83FiC8wuw94jUJkRmuD26Q=; b=Zi7gFZciY+oQCA
	9A579arwJPOfm1soOsz95pvcH50sORgt+9SSKbY7qx+Kv9956Gc/VlSBu9r6BDk+NL+UFciQCASB+
	2u2GzGF/EtVw95xwJNevs9E36MgDNbEpjYGXQ6y8AKYUfFL1m78ROy7aIq4xzh02cWqo/2S2NpAOr
	BrhvhKT1OLhr0cclqltwwBvue0feRwE2GdYQI+aqfNdlUjs78wvlXjQb5T3A3isSuQCLlrm4ys174
	O6074sf8eFEQ5u1AjuIb8V+cLAjK1tC8mPHpZ6IpU2suguMMD8l5Gw/Z4QhbeYJKegdazPDacm6kr
	I5dXvzM/wZ2cg1xozr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh5RF-0080P1-8K; Wed, 20 Apr 2022 08:11:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh5RA-0080OA-EU
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 08:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650442305; x=1681978305;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AIgUieqVsZfmHBG4S3F8soJHm55nzn4t6pKIDqe6A6U=;
 b=VWpguyZVhH7y1rqfa00rkn1jB/yz+9aI7I0QGDOgrz4lHAFcpyz89Ut9
 Ei99ty4zqb8lSPrxDOiMejI2Sz3wJMwAW5KNHz4GvYY+e9RrpTF1mqXdZ
 0PK7GC9Tuv+/9mRAXB433vvzFFqBocShdm8QT43/EW4zLskhrict/INAV
 8SjJrpZwsiD2hKFG9lmdOxuMidjDv4a5Ta/tU/j7b4hWklhfDNlelDpUA
 WvWixjJRSbGdcc9ncPVWJ3dHkxp9JY5s7eXahCTe9dIWTqhYAAwOjALnM
 nu3iaHldVaApxch5DD6BdJx6l59QEYV3wJ7CVpKkadHrTfKOCSIUeh9gU Q==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="160661160"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 01:11:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 01:11:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 20 Apr 2022 01:11:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T008m1DOfN+/H5nUmAbRJmu6flaCyO2KjyUCTRi7GeHnBGiDwu0GLF4diY1dLvBHmdCgyVP0afezQGgZfcUmvQPVj0ki2FNFibwxFACpSQx3mW44XdWs+k+eZK8Y+oGfr7tVlA/DX/hj7wXFCPtw9GlyH8kcYH20bWv3XjY78EwN+r1Psp6LsqGu8EwLS+M5iA4EsxFUS3trME4IoMUnnOkJeA+V7UQ6+qJlBNOCi6qcX9KmKJGQtKuBgya9GFz+2WqO6NgfL4FqgcfW8BdX5vtb62FGNVg1DX9T3NtCzAPqL3JoO04DN0nrGu9gYg+SdSXGmPe0uLCGyOFAnt6SDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIgUieqVsZfmHBG4S3F8soJHm55nzn4t6pKIDqe6A6U=;
 b=asmYgQgrxyNRl8wXEgQm8uNV9z8brx5v9gU0LmLKuzgb5CUbAQczuz3WCVrjtxcH3GyEW46K0uS324PYPArv68jUthTqYF/Zo7o6/98YDnldBWR4OhfJZnOzRjg/bdY/c6Os4u3eMZ1eUnG+hBBlIkYADA8Asm9PdZH1+WzxjSKq/gQZNLgRhPBexZk38ws9BilffPw/pqQsHDgvJ2klN5Q4rrRGdng8CvDjA7dzl0NvndUpUfBEicQfYV4vEPUB4U9b4114KDIYJu8xBjq5QUX2TCYTDQvLVRqEjRxlSFEoBZq9JiJTWYndmN8WWhdT2ZqCqjPzx5W12ba/5SgC2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIgUieqVsZfmHBG4S3F8soJHm55nzn4t6pKIDqe6A6U=;
 b=OMx4bcTsTsueEl55ZPk9csyxEtVCirv1Szv5gPea53mOl+03aZ/5rCdluHqYqyCeTM+/rQNygFvdfEoek3qt73cYQ7ybO4i26xyTvF1zvkUeMxq9E4pmxkR+SX5P5x8fAoCcovYYUMDmUR6dC+Wll9od9eK6UIcCgtfa900/IvE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB4577.namprd11.prod.outlook.com (2603:10b6:5:2a1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 08:11:39 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 08:11:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYU9BgAvSIp+mmK0m8aBEYNky38g==
Date: Wed, 20 Apr 2022 08:11:39 +0000
Message-ID: <961eeb6c-9f4e-dbcf-1db7-7eae3c167214@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
 <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
 <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
 <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
 <bb40711b-df58-a951-a5ed-9cb7a6732f6d@microchip.com>
 <c160f59c-1e60-d783-3793-4d91eeacc82d@gmail.com>
In-Reply-To: <c160f59c-1e60-d783-3793-4d91eeacc82d@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8841949e-3ea1-46bb-f558-08da22a5655b
x-ms-traffictypediagnostic: DM6PR11MB4577:EE_
x-microsoft-antispam-prvs: <DM6PR11MB4577E83A6EC47E11ECBC3A02F0F59@DM6PR11MB4577.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F5LUvqnAk7sGY2mKUN0AMrppKoN4E0MEBvpgg6iUSsffRxhN2s1epMx3+b8Tbsqa2Nz9Ovr0eeCHueEdkvfe1gUweaKIDJ5wPVwriShKy18tb6VROp7CuaNwX30Vw9UItq/a3Gbdf0gHffDPnPt8afBSM53Ks7qaXQpxpKQLf9C8UrZ33ZnWkt91cELP/73LGKqFt/UDoJf6qyn1JgbVMU/vHUeor1D4Kr67KH6MxolHVAMez01uTPCNZlbAEsZ+bxWxyVT6C6uP/ZG1ilc/CanNb+0xV3Frzs3pHVqmopaavlwho3r5S+cQWX30DlEkOurP9nLLtKpsPS9z7kO5/1kMp16tjfsWSJJbmz4IP7FsCxVi90socsAwQalGAmo7hFzhGs+penE9+VdVO2wYA3NeNPFDlLVQYUPLUeoCGV+F/M7Q7pxhbQ9ybuZhW5tGwPmtfj23iH4K8wMUN1mJT7yWLS49IFk9PHs+uNXOz7d06u672WlMC0nMJk/ooPPIWeRQVIycOCl27GblTXxskGYq+c7+xZPpZIzbKOmcs9mst7S1DGo5Tw3gWSZaXz9IPyy3c/EKefN+CawymXAXFpITe+w5G0OrbaXLkAdpeNku5jHLTvG9h6wA4TQFGPyT1imZ/HIURMCV5bhS8iXSIYMc+SMimSrA7b4Vc8V8F5rJuHWrnDuaDROeA6pKws0+TvnPIL8NyvXyvACeLwFf8XU8TORtkQE/rM1XScHiiWNEsXcGX+tfmitQ0sOMi5T7Yw8S9d6c6BuUA2Zw1ASAfQUmtXWcInP1ysSCrY1QrcX3WOqoLiY2RMQ9TVaBM3k5hWZaPIanmEKwuqrPq0Zwkm8dCu9DALrRF7cHYCrk/mM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(66476007)(64756008)(66556008)(66446008)(66946007)(91956017)(36756003)(31686004)(316002)(110136005)(122000001)(8676002)(4326008)(54906003)(38070700005)(38100700002)(508600001)(86362001)(26005)(71200400001)(966005)(6486002)(8936002)(2616005)(6512007)(186003)(53546011)(5660300002)(31696002)(6506007)(83380400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHpwOHY1akVzS3hGSDB3OGpvMVp0bjVOemNxQ1YzZlErM3cxK1I3d2psSW91?=
 =?utf-8?B?SjhhdkhuSUE0YXF4K21haDlJekxzbEF1Umd2SHNEL2hGaTVjNEt2eG5vZ1FE?=
 =?utf-8?B?OWNXNlVtaFhPdkI2bTdBTkxzaU92R3Vxcm5icUQ2YndnV0R5QUVQc29Iem1r?=
 =?utf-8?B?bGVWVXpVS1BLc0JEbnkyVDRNK3FGRVRzYnVTQjFZVm9EcjhhSGttVk1WRVV2?=
 =?utf-8?B?UU41RXlkNHAvR3B4TThpeEMwQmRod1laemVHMzlzN0FuNjdXbGU5ckxjV1Bs?=
 =?utf-8?B?VnZvRzNSbSsrMis4SVF4SFdrdURwOEEzNHVNT0VleFFkVm94NCtoMGl1cEVy?=
 =?utf-8?B?UGFQWHQyT0srd3pWY1grOVlVb0prZHpYSUhtb3Nnc1dpNkd0aTMwa2ltSzZZ?=
 =?utf-8?B?c3VnMVpaRnFaRzhHNms2N3poMUZqMGxUcGl6RlpYOFozY2swaTQ4eEFRNExI?=
 =?utf-8?B?OFVOamwyNjJNbGNTa1dwNUFzMmtLZUVRY2pGdDBEaXZxSlUvVm05ZFIzU01r?=
 =?utf-8?B?QXp4V0tNY1B0QitSNXFLNGx0ZlZrQllMZng4Qlp4VHRONGpxRVBmYi9SOXVC?=
 =?utf-8?B?bXBSNWhQQ2p3ejczZHpFRDZvN1lMV0craW40Q0ptNExCWmUzeUNaRmZxRzkr?=
 =?utf-8?B?U0prTjNNem1VVVVtU0xpeDFxWWM4aGhncE5iOUJhR1d0bEV0Ykl2MVRacFJw?=
 =?utf-8?B?R3NySUVJZE1HeDhFWmNneTVidXI5bkdvOEVmN2dPU1hzS0NsVnlGOGVrcFNi?=
 =?utf-8?B?RjA2WUtKZHg3OHA5ekdETllyS0V1WEtHYXR5MFJxTFl4eVNKdUowOXVtcEdm?=
 =?utf-8?B?eVVEblFBaEVmN0dOUStOT0RMSllLM2RmMDFuam0rT0NFVEhVc0JmTjhZbHlV?=
 =?utf-8?B?aTdpbkhnRlNZNW9OYmc2d0xXL2RWZ25RQ0M3R215TEJyQkpnN1oreDhmYVNW?=
 =?utf-8?B?M0FjOFhTdHJ2c1BUQkN2UkFMdUhtZWN2UXhqZGc4cU5vTk5EcEpPWVRySlV6?=
 =?utf-8?B?MkFYM3dFVjlBZ2NORDJWWUExNnhaVk5md2dabCtiL2RWSmdvRVpJQkJIdERp?=
 =?utf-8?B?bW92d1hFdjlJR1oxVGd5SmVMZWhzcS9nanJmODhDQW8wdUNuanBLc25Ga29B?=
 =?utf-8?B?bGREeVdTMVI1bURnK2RHY2VVVVEwWTRwRHVDdWVCUEgzVkhNSFRvQTcwSFRR?=
 =?utf-8?B?aTkrQWJCdFJ5aktidDBIRGQxWGFpWkdJQlNaaHVkOHNuY0hGYkhUR2VBOG8w?=
 =?utf-8?B?dVlJVnVPcnlJQzFUbDNPS3BhK05qL1JqaUhJQi91ZnNHS0R4Z1lEaTQxMzhN?=
 =?utf-8?B?MlUzYUJsdHhkNWxRS1F1VHZYQTdFeER0Y2w5eE5KVERrdm9sRXRJSk1MZllV?=
 =?utf-8?B?a3Y4d0Zkd2tLSFMrb0xpbGh6UmxYd2d1d2djSXc1WW9KSndMYW5VWXVFVno2?=
 =?utf-8?B?UUR6dWNLVEdhaFlJZFgxQ2VUQStVUitiRklMUnlzSUxjQ21XNlhwVkIxdGU4?=
 =?utf-8?B?WWRpMy9JSHNDbVEvRURTWXpGdjlBSURwNEk1SjBrSGtSY3MvY3V1dVZyQ3R3?=
 =?utf-8?B?QnBPU04yRXI4eHRqYkJMSmxQQUFtUW94L3M5Y2IyU09FQlR6MnR5bU1NZTkv?=
 =?utf-8?B?cExvVUsrb2tVdWNJSTNnRkYrdXAweXNCMFdhcE5zdE5ya2lTY3hyYnc5OVVC?=
 =?utf-8?B?TSs3Z1M2MzFkVUNwYUdMNG91cnhZa2FMMXlSSjhORm1TRTNwUkJjRkM4MFNv?=
 =?utf-8?B?RldFSXVZRUx4T0xrdUNhZHlzU2ZKMUk1SmwwVkxlUlZiYjZjQ1N6eVpQNHo0?=
 =?utf-8?B?bEVBa3c2aWlkY2FERUF0NWt0MkNVZTVtdi96TzJNZWswZnVwTzY1K0pGQWRy?=
 =?utf-8?B?SlZteVU0UmNza3BFR052WTVRMEptQkxFVzB3cG03T3g5dk1EUjlXaTZBaC82?=
 =?utf-8?B?U2xIQWRxRkR1bjl6R1BPS2lnNDFHRmh5R2VvTitUcHRuczNYNmt0a2lCaS9m?=
 =?utf-8?B?NG1NUklPV1ZaSWxMeERidGU5WmVuTGVMNnU1THBtbFh1SWlMZjdyVVc2bklt?=
 =?utf-8?B?REhpWk8vbEVuODdUQXpWMkk5UUpkZ0toc1pFck5tMXlONjhGa01EZHlZNHZG?=
 =?utf-8?B?Qm5xZWs3ZWhvM2FHalBQRGg0Wkt5RjQwSUZVQ3NEU3hVR09IdEJMMGFqRk9x?=
 =?utf-8?B?UG52ak5qd3ZKNXptMWJ4MGVIL0tHMjgxclZXblZ2azF1bGN2dDNHd1AwYlpi?=
 =?utf-8?B?Q0lweE9RbHJ2Z1JJNFd5Zll5cjFsQkYzWnNPZzg2K2NWUlNYUDBzenlrU1cw?=
 =?utf-8?B?ZW5ubGRpUHI3WVJMVzVUdTZJNVg2NURMM0F2M1d3dUZQSjFKanFnNWNFenow?=
 =?utf-8?Q?UYGfwICCHRtXa4Mw=3D?=
Content-ID: <FA2C75D47527A342948617F1B10AE14B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8841949e-3ea1-46bb-f558-08da22a5655b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 08:11:39.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CjjGncrgst5Gb7VYgBYftdi5igfC3POr2rpZLA3oWwy04htce9kIunhkH+jhFgSNSFh2pkRmmgA/Sh5RVztf7qvUcZ7NRhPPsK7Gke49Sjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4577
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_011144_540017_B1B88B32 
X-CRM114-Status: GOOD (  14.48  )
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

On 4/20/22 10:50, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/20/2022 4:47 PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/20/22 10:35, Tudor Ambarus - M18064 wrote:
>>> On 4/20/22 09:58, Takahiro Kuwano wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 4/20/2022 3:11 PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 4/20/22 08:34, Takahiro Kuwano wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> Hi Tudor,
>>>>>>
>>>>>> Thank you for your feedback.
>>>>>>
>>>>>> On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
>>>>>>> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>>
>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>
>>>>>>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>>>>>>
>>>>>>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>>>>>>> uniform sector sizes are supported. This is due to missing or incorrect
>>>>>>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>>>>>>> followed up as needed.
>>>>>>>>
>>>>>>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>>>>>>
>>>>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>> ---
>>>>>>>> Changes in v11:
>>>>>>>>   - Cleanup fixups based on other patches in this series
>>>>>>>>
>>>>>>>> Changes in v10:
>>>>>>>>   - Cleanup fixups and ID table based on other patches in this series
>>>>>>>>
>>>>>>>> Changes in v9:
>>>>>>>>   - Use late_init() hook to fix mode clocks and writesize
>>>>>>>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>>>>>>>   - Use MFR_FLAGS for USE_CLSR
>>>>>>>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>>>>>>>
>>>>>>>> Changes in v8:
>>>>>>>>   - Call write_disable in error case only
>>>>>>>>   - Use spi_nor_read_reg() helper
>>>>>>>>   - Use nor->bouncebuf instead of variable on stack
>>>>>>>>   - Update ID table to use FLAGS macro
>>>>>>>>
>>>>>>>> Changes in v7:
>>>>>>>>   - Add missing device info table in v6
>>>>>>>>
>>>>>>>> Changes in v6:
>>>>>>>>   - Remove 2Gb multi die pacakge support
>>>>>>>>
>>>>>>>> Changes in v5:
>>>>>>>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>>>>>>>
>>>>>>>> Changes in v4:
>>>>>>>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>>>>>>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>>>>>>>
>>>>>>>> Changes in v3:
>>>>>>>>   - Remove S25HL256T and S25HS256T
>>>>>>>>   - Add S25HL02GT and S25HS02GT
>>>>>>>>   - Add support for multi-die package parts support
>>>>>>>>   - Remove erase_map fix for top/split sector layout
>>>>>>>>   - Set ECC data unit size (16B) to writesize
>>>>>>>>
>>>>>>>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>>>>>>>  1 file changed, 54 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>>>> index 493240ebfd70..dd37b829efbc 100644
>>>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>>>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>>>>>>>         return 0;
>>>>>>>>  }
>>>>>>>>
>>>>>>>> +static int
>>>>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>>>>> +                        const struct sfdp_bfpt *bfpt)
>>>>>>>> +{
>>>>>>>> +       int ret;
>>>>>>>> +
>>>>>>>> +       /*
>>>>>>>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>>>>>>>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>>>>>>>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
>>>>>>>
>>>>>>> Hi, Takahiro,
>>>>>>>
>>>>>>> I would like some details, please.
>>>>>>> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
>>>>>>> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
>>>>>>>
>>>>>> If we are sure that the Flash is in 3-byte address mode, we can use the value 3
>>>>>> for reading CFR3V. However, the Flash's address mode may be changed prior to
>>>>>> Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
>>>>>> address mode. We need to set the Flash's address mode in known state and update
>>>>>
>>>>> addr_width is set via CFR2Volatile, can we reset the flash at probe instead? Then
>>>>> you'll be sure that the flash is in its default state.
>>>>>
>>>> Resetting the Flash to revert back to default state should work for this. However,
>>>
>>> good, let's do this.
>>>
>>>> we still have SMPT issue below.
>>>>
>>>>>> nor->addr_width accordingly. Due to SMPT issue below, value of 4 would be better
>>>>>> choice.
>>>>>>
>>>>>>> 2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
>>>>>>> Reg op used. Why do you need an addr_width of value 4 in SMPT parse?
>>>>>>>
>>>>>> In the spi_nor_get_map_in_use(), the nor->read_opcode is set to 0x65 (=Read Any Reg).
>>>>>> The spi_nor_smpt_addr_width() returns the value of the nor->addr_width due to
>>>>>
>>>>> ok
>>>>>
>>>>>> SMPT_CMD_ADDRESS_LEN_USE_CURRENT. The nor->addr_width is set to 4 in the
>>>>>> spi_nor_parse_4bait() before SMPT parse. Therefore, the host issues Read Any Reg
>>>>>
>>>>> if 4bait is parsed before SMPT and nor->addr_width is already set to 4 in parse_4bait,
>>>>> then you don't have to do anything for SMPT, right?
>>>>>
>>>> Currently 4bait is parsed before SMPT. So, if we are sure the Flash is in 4-byte address
>>>> mode (by u-boot, for example), we don't have to do anything. If the Flash is in 3-byte
>>>> address mode (default), SMPT parse does not work correctly.
>>>>
>>>> Please see this about 4BAIT and SMPT issue.
>>>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/
>>>>
>>>> I introduced another workaround for SMPT issue in my previous series.
>>>> https://patchwork.ozlabs.org/project/linux-mtd/patch/9a2d323b2c18485d13f271e3bb213b96fea0e7e1.1649641729.git.Takahiro.Kuwano@infineon.com/
>>>> I withdrew this because this does not work if Flash address mode is not default state.
>>>> But if we can reset the Flash at probe, this should work.
>>>
>>> Hmm. How about issuing spi_nor_set_4byte_addr_mode after parsing 4bait table,
>>> to solve this dependency?
>>
>> or maybe we can add a smpt hook where you interrogate the state of addr mode
>> from CR2V and use the add_width from CR2V instead of relying on what we get
>> from SMPT_CMD_ADDRESS_LEN_USE_CURRENT. This will avoid changing the state
>> of the flash at parse time.
>>
> Reading CR2V requires Read Any Reg op with correct address width.
> Chicken-and-egg...

I agree with Pratyush that we shouldn't change the state of the flash at parsing
time. So to solve this we could introduce nor->params->addr_width to set it at
parsing time, and use the default nor->addr_width for ops at parsing time for
all the parsers.


> 
>>>
>>>>
>>>>
>>>>>> with 4-byte address. We need to set the Flash into 4-byte address mode in advance.
>>>>>>
>>>>>>>
>>>>>>>> +        * Flash's addr mode and nor->addr_width here.
>>>>>>>> +        */
>>>>>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>>>>>> +       if (ret)
>>>>>>>> +               return ret;
>>>>>>>> +       nor->addr_width = 4;
>>>>>>>> +
>>>>>>>> +       /* Replace Quad Enable with volatile version */
>>>>>>>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>>>>>>>> +
>>>>>>>> +       return cypress_nor_set_page_size(nor, nor->addr_width);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +void s25hx_t_late_init(struct spi_nor *nor)
>>>>>>>> +{
>>>>>>>> +       /* Fast Read 4B requires mode cycles */
>>>>>>>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>>>>>>
>>>>>>> Isn't this info already handled in BFPT? What value of num_mode_clocks
>>>>>>> do you obtain from BFPT for the non-4B opcode?
>>>>>>>
>>>>>> There is no parameter in BFPT that describes about Fast Read 1-1-1 op
>>>>>> (as we can see 'struct sfdp_bfpt_read' in sfdp.c).
>>>>>> The value of num_mode_clocks for Fast Read 1-1-1 is set to 0 in
>>>>>> spi_nor_init_default_params().
>>>>>>
>>>>>
>>>>> I see, thanks!
>>>>
>>>> Thanks,
>>>> Takahiro
>>>
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
