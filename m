Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53872C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 05:52:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC83761165
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 05:52:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC83761165
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kStFm/QHeSkJS32HCKINj/Dp4bD3mZWIaysgH8wFwN4=; b=T6kLazswqb/xrMDJkj0Mzr9c3
	DAjqJoPztQHrUICA6seerDM7sLPbaa1tB0kC1gnutjv0A7clycfWV79+dyDpnlinkFhLm9ZTWcj5Z
	cPfekbmxHCvYFngYz4hWHqhOIEH5Xg5ia0B/O2rqIkTelDJ3XmsKgknBPauBJw8iFsd55LTEEK+EN
	w/LzuriMaW2abeTww8X2gutPmrm1HVzWihGLdVg+8jjKDROMq3Xr6PF/jyycLLqzS1VrTdh99MLwB
	PvEkHXbPpWn56wJ+Hxvs29H2ebFwHx4NSJSXZ7Mz3lPlnNFNjej94XNgR1QwRGaY+SoxkqtmOuhQV
	PcE/dWWVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUNaJ-0071In-LW; Thu, 08 Apr 2021 05:52:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUNaA-0071H0-US
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 05:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617861118; x=1649397118;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Oqy45qo/ydE60hzOQCjIJVyJy4Pme17GNiEuhCs7NWo=;
 b=AlUOkrAGo/MF2rTnTj9TOlRoq6yW7yC6eXbCWXWZVBywP1EzYHP16S5T
 CZ1Oyjt/ryYkXIWgrRMv/saokOjb5iI/Fib2QvHazOGz+7BPvazf/MBsK
 mJ1MKzAq+1NhvZjbwFRsKE0fNzah6cb3l4VKCJtgsR3JrMCdWfDliG8O5
 6dwPVUIJb11Td1cvsApTOtj0RNts46zkONYI2PrtBzb7BC5XimLugmuGs
 RmBGStJkQ4GB9Iwng+KVNNTIw0I8VRvzGBwZKDg0WkKbPXOQsWJ/8ADJW
 VJ5UvLJ3mncaK4Z4WwdKyXPYneUT4dLk7vDWBLBL5iXj6iN7dnKb/AJiB w==;
IronPort-SDR: UHlVnh5JSmiJ0zGc/poEFKnIw9striAt6Kula3+DYP0iewoYOG0kCvkQsTAMab4LoQAT5Nudqu
 6JWKpI0NzvLwLroUJnM7BS2Wr4v1udzgK6iYpXsURFoTUk5rNvdrTR78kLO7E8JjVc5vGYgxmX
 Xx3e7ETyU9f9iaebcgUJ/Eu0Gtw+BIi1QfHssHDyDG+F5ZkmscHnfNcZdtznFE46emfmAErViC
 HI5ERJ/AGNqyE1fZouDx2oapA0/fOOt1UXpkbkBl/3+4AUKPKDoYcWzIGKGzIALG+8x/d8QNuh
 CFo=
X-IronPort-AV: E=Sophos;i="5.82,205,1613458800"; d="scan'208";a="122227415"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Apr 2021 22:51:56 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Apr 2021 22:51:56 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Wed, 7 Apr 2021 22:51:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WVkZkmFlgNArm46nxOIzMb3P/kUZKmvGVNheajk0QmCS1Y+0qIXL8QRLWmnANKm1R4MI4SnnEbA7/ExUtTVin+uPFLO0wCnYG9iu6gF78VQew/tQn7mvoQbsYc9AhN6TZfuDGec450JvwRDVpGkhT6QcsSRVtgo7oc39nJEd6VpDG7a6dDkuf8+Mn5g30l+sq+5yYZaJhb5z3HVD4gsOSUdc3Mo1hmG4qGPFGnMqraiCOzPYeQPzOxQPv3k/65EhqMadlyrG2dPj/O6FYlvNwLmfM4wJ1LE1Hg8o7zji2wfxMHP6MUSwTon+iHlQiaoTS8NYRtBQS94aX8xMtkfMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oqy45qo/ydE60hzOQCjIJVyJy4Pme17GNiEuhCs7NWo=;
 b=k7PBVIb1B+u6xsiXX0Osw/r/TMps3hXPHlbdkAtYC98mepBHnf7+G7zT+7A2Ny0rYELKGmZ/lMhNQvnTy4UMMuwdkzb8DIuUbJFFh5/lDHb7tHkoBPs10GjNj0Hha6DS5wdLvWEuWLw7m1uCqFMuAWUj2EoN/15Lz9yhC43KQboLdiqRS9zXjNNVO3KXvnLd4cN/Eig8Pa8A9si2YUtmPECXozO4nixYd8R2Ny5FNGANh/89S+u4buYg/za9V1la8DeLFjaFBAhpkW5wEHStVAmWw0KVcTesTwhEKkD9QpevWdmLvmDh32Ut8kaBAGwQe62Rg+NCipc4OZik87Gdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oqy45qo/ydE60hzOQCjIJVyJy4Pme17GNiEuhCs7NWo=;
 b=aQUt+dXZlBnHwvrFDW63+pee/5xDuUiIzlmsntPcJ7P3OoCNwcd6wbNEXv+nadnQ5Jzcft1B9Gym/sd3+0uXryV+BruNL3lAIGuUXhATGGwy/Ls7DDikuXM9K4KdKxeIjCc+mDi25Q6Xgw5fYUBGcsqMjHxMnnJ/oRyL28GAyng=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3296.namprd11.prod.outlook.com (2603:10b6:805:c3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 05:51:54 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 05:51:54 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-api@vger.kernel.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: add OTP (one-time-programmable) erase ioctl
Thread-Topic: [PATCH] mtd: add OTP (one-time-programmable) erase ioctl
Thread-Index: AQHXLDtHYGElZwFMaEKBlG4Kv5ieqw==
Date: Thu, 8 Apr 2021 05:51:54 +0000
Message-ID: <c8f6bd61-528e-0353-aa23-aaec2be2b3ff@microchip.com>
References: <20210303201819.2752-1-michael@walle.cc>
In-Reply-To: <20210303201819.2752-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: walle.cc; dkim=none (message not signed)
 header.d=none;walle.cc; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 194c192b-6c29-4ca0-5086-08d8fa526a1e
x-ms-traffictypediagnostic: SN6PR11MB3296:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB3296139E04C1B6E9F58A9266F0749@SN6PR11MB3296.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vLmPKrL4wSKKn78rEMPM9mHVeO+otcY64y2Ag/OBXZnUiA0jwvRi7V9WJgc1l/WwZdLMpEA2OZiXazyOFqV3TO7qAuxSF0SF3lVz+zgcvDfsSZCMNmxwro5ibImXjOObcL5YckXTVg8nx0VV781ZfEm10IWwxGkmbNBFjObiUAPZ//0xn2QhbCkr8Si4XN7aSgUJyIHQVbaylBteBzw+pJ5s+rOwzTrNogn4epf8EiaZIFjUhHFGt5cGHyXqXgIyEfHcgZ9PZ6DJ8+U4szVz8dpLlCkUUrNcbjzBw1L9LFeb2gwV7mVyrRUDJSbFIQaIpYAbvpVUB3RPTtDdF+26k0y9858KShFdf1CKZU6vMj5P1BhlqCd2rKfWNxd1O+VNg5awZkJzMYggNNBulOD7nL/puzYTm2FUJePpIr/vXVG2pYfU/nesTyAo/8SoFLEiDIppVVgvaXDkQ5KKEoFQBnB5Yj5Y5MIczZE0NDipSgWpT2cvYPOtZJa35oFuNVyOg6F2XSyAOEtWDw48kmXKhlRKw69Gg1EpTeAo2DJlXVCjTPGU5F8KtOLw1Dtp9Mq6Hh/a7USHfUaEd6n5VCpDhNCDt2meM2cHO4rAHZ7mAtp+HrdjPmNrL0toiqEKLrl8OgP6MO6PK56z61/4p+RqZUGo4nFvsF+C5hkyKuMGdgV/vIc5fIkg4KNaHdRMJpftsj06LLgMkM1C+xmBJ8D6IDTtCK527U3hWcZ3468ymXw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(136003)(39860400002)(86362001)(31696002)(478600001)(186003)(6486002)(38100700001)(2616005)(26005)(110136005)(4326008)(8936002)(316002)(6506007)(54906003)(8676002)(6512007)(64756008)(66946007)(66446008)(558084003)(2906002)(91956017)(36756003)(31686004)(66556008)(66476007)(5660300002)(76116006)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SVhTQlViaTFLSlRkdlJrNEtiTm5Zd0pBRkNib0hvUFBuNlZsbWNCcUNuZFBH?=
 =?utf-8?B?Q0piMWRuTEdFaWh3b2tWQ2UwUGFTS1JjSU1QZjBnRFJEZG9rYlJnR3FiSndW?=
 =?utf-8?B?VkpLaGRsbEd6S3Q1dGhiM3hvU1JuTWErZjQzY2k3UUZPcUJ2aDk4YnpTd2xH?=
 =?utf-8?B?WHNIdjQrRjZ1NDhxdnhHVUJRTThheUFFS1BDekQrRVVHK21md21DUThDdmRZ?=
 =?utf-8?B?ZmdwQmk3TnhOT05XM0lGY0xOOGFKaUNZbk53eCtjRUVNa1BTc2MxLy8wU1hT?=
 =?utf-8?B?VEhHRXVvT1BEcjc2SFh3TXhwV1d5c0NFdCtGelJHekFiTFdzWFBzWW5iKzY4?=
 =?utf-8?B?dWgxZ29raEJjUkFlWTlDWFFWRHc1cDVEdU1VeFczOGFwdTE5MitLYUZhOVBw?=
 =?utf-8?B?RWtFZEhXMEZiWEppNloxeUdpU2dxaFpOMW16NjJ3R1Ztd1lzVHNsTXF4cU1S?=
 =?utf-8?B?L1dkb20xWDBpbVlCczh6N05DS1VDOHBLUjNhNVBYaXdwemxtVU5OYVUrV1FT?=
 =?utf-8?B?NEtKR0FxeDVTR21lSmdHTElwMGVCVFJXa0ZPempodE1tcUt6dlhFRmJwSXdH?=
 =?utf-8?B?Wkh2eU5jM0RxRWlZakEvTE05QmFLVVlxODBZNmpybzE5dGtYRHRlSk1Jc0lZ?=
 =?utf-8?B?SzA5eEI2ZVR3dXZleXRZbG94NXZMQ2VlQ2hlVDg1cko1QldZS1ZiUk9RUnBy?=
 =?utf-8?B?WWkvOGxLUkVwY1BRUGE4ODlhaGpiRkh3NVlKVDNKbzAxSEttTUhvNnp2aWtI?=
 =?utf-8?B?Ykd6Q3grcjVTaFp2cGdwbXhIYm5VaGYzTWt0LzRnZlJGVG91aXNRYnMwZVJU?=
 =?utf-8?B?anFzRUNJOWJJeTRWdUN3MnJ5Um1uVmwvUjlpc2Z3ZURSQTNHbVlDRGdPTWdk?=
 =?utf-8?B?Y2dkOG5YR2h5cjV3M3ErRzBMSmhLQ2U5YVdnNnV6YTllZ3MyT1FXN1lEdGQ0?=
 =?utf-8?B?eVhkVDJXODFzY1REcFd1Q0FsQjN4alNhTWpab1FDRVF0WEl5SmtoVXlwTkFl?=
 =?utf-8?B?VUJ4M0U5Umo0N3o1Rkh2bnJwUk1JTWF0R1hyblUzOXdaWnhFSTE5dkdXZmJM?=
 =?utf-8?B?d1R5dHhnM3FKMTdnaHdnQmtqS2I5NjlPajU4c0dYbjZhbmI0cXVUVHpXZnl2?=
 =?utf-8?B?ZS83OFppWjFMODY5SzVIZ1BLeW9JUmREbDFBTW9YYktsMkxDOFJXd2Jza3Ra?=
 =?utf-8?B?L2MxaEFNRU54OFk1WmRueVRxMGxHQy9mdjd5WGp4QVZUTmYzVHpqNWo1cTN5?=
 =?utf-8?B?bzB3MkIyUkE3OTdlNWZCN2o5RFNXTFBmbVNNUjBqWE1BV1RHcDVzdm15M3ox?=
 =?utf-8?B?aGNRUUQyTUtuZStkSzN1clVZelN6QnpVOTh4NzJCRDRBaS80Y0JMME9udE5x?=
 =?utf-8?B?M29BSDQ2ci9sUWxlVzRXcFY2aVJET3hZVDRrQjdhUlZmQ3Z2MDFZb2tnUEph?=
 =?utf-8?B?RkNpMU5kQzVoSjlRYlA0OHRuQ25LR1B2TXRzbzg2M3pjRkE0REpDTEdXSWdK?=
 =?utf-8?B?dHZzdjdQaDZnR3ViU2F0bEJwZVg4L29MQkFjbkFKUHZNR1ZkNjlhWXIwVDlG?=
 =?utf-8?B?ZUhBR1d4R2dWNnJjQlhCSFlCb29ubE5hNG1wK25RRTh4L0tuMmtLSUtOR0hq?=
 =?utf-8?B?Y2I5d3N2QVBUUzhaNkxuZ05QZkxSbWdpTlVSREQ2dktzeFludnlJdmR6MUQr?=
 =?utf-8?B?bmkzdjJwL2JBNTBCaE56ZEFTbm83My94Q2Y3L3B4ZFAzTi9NVjhMVHJ4Z2ds?=
 =?utf-8?Q?BWlr1aXndEa/DFxLQE=3D?=
Content-ID: <1B6339788A9BF54F8EEB32CEDE79062E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 194c192b-6c29-4ca0-5086-08d8fa526a1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 05:51:54.6882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VJb3WQNj8aFGqu/DXn7YZraQsfuujMUFcE8v11+ByqhTVfNcsz0J+Q78q9oPWe4fL0u1eA44jpu7N+lYnKwDrJrlm+cSZQEgKJ8c007DSdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3296
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_065159_428892_51E99BC8 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Michael,

Would you please resend this patch, together with the mtd-utils
and the SPI NOR patch in a single patch set? You'll help us all
having all in a single place.

For the new ioctl we'll need acks from all the mtd maintainers
and at least a tested-by tag.

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
