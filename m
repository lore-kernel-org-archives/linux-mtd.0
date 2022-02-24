Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAECDC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 06:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9T5iyejRyVJjO/ZobbhV/zBCHi2RENz1/JBQjOtzCBA=; b=x6Fgl2h90NbMlq
	G8nqg2/OVIC1YZwrCMb/7aIOReAWz6IDI91lp8b9Tm2/rDGAIkbXeJzXnr0/H9YVtRVX7JppYuVOM
	+3Vg2vispLH8b8s+UI90Fdm3LF4isKMnU4APO69lwcg2Vlke//Bwb9RPaCKht+NJcLaC61+di2flP
	YWKH97jsqOtrQ86Mrms/ZsFG4/0TonuOmdOAdiDiG2b9ogEqSh0Q97pcOLgm5SkNvjjRO+b3psEGo
	X0bH6iRCdcA1nza139gOX76VAZ+TO3YU+UhTAfpKq9yXfTtTyPJNHjHygUNdvmvy6P/8pOTIlLg+f
	fJ0C1xZPUS7ktqjyxVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN7Jl-00Gyy5-MO; Thu, 24 Feb 2022 06:09:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN7JF-00Gyao-2L
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 06:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645682941; x=1677218941;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=F6LXD/xoDiyqPqc13J5eczBFYpJ9GFCTB5CPe3rlOgA=;
 b=Ng3ln+ky+ljeCiX5FAvi2BstMqDkMlJ0+xRPeCrDmR5nHI4qkWJtxmxk
 8bBbJLOkoGKvW5rLKSb3eKMHo7oTl0uv+y1EJHu/9mtfK5Pq3BGskSKDz
 uwK4SzTHmNy8zjdUoAl8F0SqsjwScjRjniVVvtDIE21Mfcap3XzaDctoA
 zDN15Z3oloKKRyFNq5R5TPKgPIwgnrpn2KzEnoNpHcnOFqr5SDhoJr5O3
 lyXYLW/S/3T7iCrfo3zJgsJF95psq4ZygY41y49qQiS0mzXyrUL4SZh0Q
 Vr7AMY3nG2YTv0Zb4GpDBLw+FMEZOwwIZR97FF3ByCQMk8hQHgDL+owi0 A==;
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="147108908"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Feb 2022 23:08:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 23 Feb 2022 23:08:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 23 Feb 2022 23:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPfR46Uh+ILupIJck7ERHHmAucmb73qg8+c0rgikMGuCJ711D7pAdzYLLL7wtsZ1VNhOmY2PC4gfPTtpChtznzBLQmbG9CRpnN7OnNN363LPaont2hPTHccuiVw+bRAJehAb4IhjV7AMLrW2Qqgsd9mEVIWtsOiAZ20/bYR6CK0eQ1eDwyjmnLk+529IRY6av2ee3RndA1penPM+krEAzGpk7CY63Pr0aQC1ZBDSFWDwqHoZJt7RH0WOWkfq7HfDpJLURIQnP0XD5Na5LdCOkU1LxpP7q/2YTltY46LH9bBsZ9aOfYIdoZHsHgqJuI8+59auY5jGLm4SWpQ9woUbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6LXD/xoDiyqPqc13J5eczBFYpJ9GFCTB5CPe3rlOgA=;
 b=ThFvo7DobBH7vKhT698zE2YiRhUliRue8sPatJmplk/C4qKLtmnaPYbj71uI8xTAlfgQhrTRaaSGVnvpm3P6jmUlICyGgdRZllwpcaTtvnRsX+iiduzm8HLjsSY32Ko8taCw9gH3Cz/Ns61U5BPrf9APtsLYh5k1DCRrpcIKMJ7J9S9RXxtfngzF3ZvcLzYOZKXnhRvXJKRZgHBCZLrN+w/eZioC7uwiDS/kdOY0CYAKAAnuPgpEtdq1U4FeCsT8mjQOgwjUinHD2GKauDX7DvWcKsD3MrB+Zp5vxWb/o1BhDJjNghE/IioxswQQ0Ii5Qt8kzc7jF1p/52b2/0fxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6LXD/xoDiyqPqc13J5eczBFYpJ9GFCTB5CPe3rlOgA=;
 b=IIR5N3bp69nqxh626xZ1LCFpvwVnepGjwxNy6vRI6otBnb6vEq/yUvyCZRiarsvBpRmO/RSGQb5cWXiMtxaCWq6vBIIH+HRPrIsJ+lCnfDoJT42+b7iKSdBtSoKitZIkDZE7qd4zn1kxDBY8larkSg4TpGa0CG5JUuHxZGbzuaQ=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CY4PR11MB1318.namprd11.prod.outlook.com (2603:10b6:903:27::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Thu, 24 Feb
 2022 06:08:44 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 06:08:44 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Topic: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Index: AQHYJ/PF9hATniilJUe3fAFeGB3/Dw==
Date: Thu, 24 Feb 2022 06:08:44 +0000
Message-ID: <6eb179ec-0b12-de30-829e-83ec6b964f21@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
 <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
 <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
 <3cd510ad-a6ab-d4a0-92e3-9156a0c7ddbf@microchip.com>
 <20220223183849.xcwciv2ybnkdnauk@ti.com>
In-Reply-To: <20220223183849.xcwciv2ybnkdnauk@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3c2bd705-dce0-4fab-4870-08d9f75c1cf0
x-ms-traffictypediagnostic: CY4PR11MB1318:EE_
x-microsoft-antispam-prvs: <CY4PR11MB131869844601870D566658CBF03D9@CY4PR11MB1318.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xp9FMS0urixYjwJ7lRwNnPGm3LntZgZWmEuohDUDi8YtAvAr7/POPuKlWfRwOme80UpOMutwkQ+mVnvrwwcGQxGNMleLudlyM/X8BxekxulMyWAv4y1rmOZv8EV9XmzNkzwWcazmkDDgotlHFALaCWblW6VN3kSTzzV2HJLSqKnvoKNFSUXhVd0FKan9Cwfc14Hhv41HvTiqb08RCZIDdWfby4XE0CxmfYf9SMenSjms04k63woeh0EAfhewRsZD8ueMNvesdN0RVhmGvJ449apvHoQG9C15ddwC2xIMo+OroDMqJ27jNndJ/amxdYio0du5dz8OkgJBu7zFUEfBA+zsAyfoUTatuYJH91qJV0SuUIoUnmia/alGfrEvUlzUPbZk5noGJcN1SlzxjkPCKRYI5Fess01Nz1rjMzSYgyTF5uNmNjek747Nm+1ohTzTPTBPQdLzFgyuJ2H07cnpAQJBg3OZPl9VV554FzcXC+xDei5OAlU+82UwpkwNhNntjuKr50gh7s60eWcqk3LFBXPSycFYHnqqddHL1GsqGfu2bomqlYO0ezDb4b0DHgo7QhJhLx9ATwF/cO05sZhSarwBTbg6M3X0y9IY4VZqyw/EVdNmNBShz8Wgx8x+MgALc3SaS+lNRZlCEMZttF9JFPkuy0bM4HU1DuwGL4q9t9/bFe5pdkSLMD6TKX7oBfUCAAm0KGHloeC9H7K2jYbbkubqOWsM3FZPl46He0UHLHOefQHiG4kxYOB7W6Sna9R5DxmPLzZ3tZFBVbOvEXbr0w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(38100700002)(86362001)(38070700005)(122000001)(31696002)(6916009)(53546011)(54906003)(6512007)(66476007)(6486002)(36756003)(508600001)(316002)(76116006)(66946007)(4326008)(71200400001)(8676002)(5660300002)(7416002)(66446008)(8936002)(186003)(26005)(91956017)(83380400001)(66556008)(2616005)(64756008)(6506007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWZhdFNpVVlWTHAydTRVaGhzTFVSd2pqaHJxSER0RUFMdE9EQzlCMTFqWFZs?=
 =?utf-8?B?V3A4UFhxanplQWVINEJPSEgvK2R4NXJWdEZlUWJsTmhIbHAwS205RDNqMUZT?=
 =?utf-8?B?cld0bVgvQjZTcUdoVndQZHp6Y1FzZjZqYThVbjlHeGc4V29uVTZtcEJnS2Q3?=
 =?utf-8?B?STM4cmdIQS9OREVVRTNIMkNEZTVBY0tIOGxhcUtaN1RyM05UYTU0a1hBbkcv?=
 =?utf-8?B?V1phaFc2ZmllTjdZN1VHTnkyRW9hdzFQMUJZajJxdjJDeDhxYTF6a0NNalU5?=
 =?utf-8?B?VmZVbjFqaExIZm80dFJOL1hYK2laRDBMSW90cERGaGN2YnhONExuMmh1WkUw?=
 =?utf-8?B?STRtQ2JPU0hOc1l2UkRnbXQ3YzRoT3lUYlZUd0g5a2kxZ3Ayb3ZlSm40amwr?=
 =?utf-8?B?cTVCejI0WGRFK2M5MTFNdnlwZUI0VmdyVS9xYk9xTWZubVN0YlFhQ2NFYVE5?=
 =?utf-8?B?RVI4ODNRSVFoV1B3dFpsUGdxUmpEdDVFSVFPaVI5dkxHQVZmbmxlQnRWWTlr?=
 =?utf-8?B?YnpHNjRHcjNJd0M3cFZ4SW1MSXVUTWFYbU5yV0RVRUhDN3gxdm1wV1NQZHlJ?=
 =?utf-8?B?dXpETFBBVy9HdG84bFFYdGFSckE5SzVuOHBjSHd3VjVvOW9kcEFzUlFybHB2?=
 =?utf-8?B?ZTFXZDlQWlJHcG1ZMUlwbk5NTGtBbnhBcm5tWXNCTFRJQUd6L3lPNWlUMGZj?=
 =?utf-8?B?TXdMc2tNYTlMUHBPYXhGQUs5ZnltYlJieDFVbC8yZWdKaEphUmVKS3RjbHNw?=
 =?utf-8?B?ZFFZdmo1RXhodTEzbHdYK0Z5bXBjUUxpYVdGTWgrZGxZSW92aUoyOEEvK2tN?=
 =?utf-8?B?SEo2KzEwbmxWaE90Nmw1S0xDN25iRVUxSXZZdklMVmV2NFdXZkp2RWRVZVk1?=
 =?utf-8?B?RjczaTVidURnelpsOVhldjFIcHFLTE1zODRLWG9IZjNHaTNOWUppKzE1Mitk?=
 =?utf-8?B?bzU1K2p2c1c0aU1UQUJwSE1oS0ZqSzB6MXRrYWszMENNOURXY1RtV3A5cVhq?=
 =?utf-8?B?UW8zQTRVOEhXSExISVpoZXVpbVQ3Smk4Y2dwQWl1UXc3TjhmUWl2QlQwamF5?=
 =?utf-8?B?VzRFWjF5RnRSazBDRGtNOUhLNktxVEprY3VjYlRobUREVU1TSVhFQ0NUcXpq?=
 =?utf-8?B?Yldsek1ybk1abzB6ajdxcHlSZTFhVlQ5TzhNaEtBdjRpS2NmaWxQKzM1akxL?=
 =?utf-8?B?VHRvTFgrNHdnVGtBTjNSRzQ3U0hjbUlNNmpITXF0VUpyN1ZJRW8zUlZ2SlYx?=
 =?utf-8?B?d1I4L1BCWkNRaUlrM2ZIZ3BjdDZBTkVGcXEvejNOMVkrTXd5UVdUbllTUjJs?=
 =?utf-8?B?MXBIb0d5K2l2ckx5T2lPRktzTDl1WmMyK0ZYZWZMbHFqd09ld1ZBd080aCty?=
 =?utf-8?B?eGtrUVZTck9UVFdJZ1cxK0VzaDlaZHhqTm5NQjZwLzkxZmNSMDlSNjdNYlJL?=
 =?utf-8?B?SG4rWWlsZmwzYVBSb0VEaUgyeDByaURVM1NoSGxzRSt1R1laTFdpaEloUGU2?=
 =?utf-8?B?eTFhK2lZZ1NnbWZJQ211eTR5Y3lRenBGTWJVblhMeEFWbnB2SzVqU2taUmRv?=
 =?utf-8?B?YUxTYTdHNmk1eXlqa3ZueUZiT0puaDhOMzd1YkNPYk9vZW5jY3c5Um82TWZs?=
 =?utf-8?B?V1NiblZhRGQwc2Z2WGtGbWVIbEg4bkczT2VFOGlvK1YrY1Uxa0RFbE13ZmZR?=
 =?utf-8?B?NUkzbXpUVCswQXlnMVpLNnJGTjFhT3RxWTNYMG15VkxDcXR4T3J1L1VFV09N?=
 =?utf-8?B?S3l0Y0tjNDFDb3JnNzhaa2VYeXRQakV3cHZ2RDQxR085T2Y5TEZDU2ZyZk9J?=
 =?utf-8?B?Y2JFWlAxVVFTNVhNdVg3S1UrUFZCYVhRbjR1cjVNb3lzTGZBL2wweTF4ckJK?=
 =?utf-8?B?TTRwWGtoZndPN1dMUzlwVkRtT3BLOWRlQmVYbTB0bXp1SnRnaWthczRlRWY1?=
 =?utf-8?B?UDdqVS9sUzM5REtzNTZsZDdURFQ4VkNjMG00bHJpaklreGRObUdVeHh6UjFv?=
 =?utf-8?B?bFd2cTlmcHBQVXgvRGk5Wkl3WU5SSDBuOThURUlGRkhWbmJhQW56ZUZPdFpr?=
 =?utf-8?B?VTZUQU9FeGJ4dWFzVkpDblp2VmN3bFo5K3BLeGgzblY3NEN1V2dPay9YZW95?=
 =?utf-8?B?eFJ0TE0venQ0SkJJOVVsdStSNGtINUlGTzRjMFE5a1RwZ2JPd0poK1dRZ0NX?=
 =?utf-8?B?ZHRJTEYzVTJFRGh2bjk0UndyTHA4RFQ1cmdYeUZuSUVXMk1paFM5Rm13VjJK?=
 =?utf-8?B?d3ZUTVd4MW5qcVlwQ2FhM0RrWnhRPT0=?=
Content-ID: <E9B329A78A02E04FA9A47BD0B0A43432@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c2bd705-dce0-4fab-4870-08d9f75c1cf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 06:08:44.2934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 79j9pgc5ng8eIto6dfixQiFsN96THq6+MM9R6PNId08AbbCFm8JWkfsb826q2gEiqwUws64I8e7fqcFpMIzDhz1+ac1TY3RBxvQV1Auttks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_220901_390864_96397C08 
X-CRM114-Status: GOOD (  26.78  )
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

On 2/23/22 20:38, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,
> 
> On 22/02/22 02:43PM, Tudor.Ambarus@microchip.com wrote:
>> On 2/22/22 16:27, Michael Walle wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Am 2022-02-22 15:23, schrieb Tudor.Ambarus@microchip.com:
>>>> On 2/22/22 16:13, Michael Walle wrote:
>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>>>> the content is safe
>>>>>
>>>>> Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
>>>>>> On 2/21/22 09:44, Michael Walle wrote:
>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>>>> know
>>>>>>> the content is safe
>>>>>>>
>>>>>>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>>>>>>> Fortunately there are controllers
>>>>>>>> that can swap back the bytes at runtime, fixing the endiannesses.
>>>>>>>> Provide
>>>>>>>> a way for the upper layers to specify the byte order in DTR mode.
>>>>>>>
>>>>>>> Are there any patches for the atmel-quadspi yet? What happens if
>>>>>>
>>>>>> not public, but will publish them these days.
>>>>>>
>>>>>>> the controller doesn't support it? Will there be a software
>>>>>>> fallback?
>>>>>>
>>>>>> no need for a fallback, the controller can ignore
>>>>>> op->data.dtr_bswap16
>>>>>> if
>>>>>> it can't swap bytes.
>>>>>
>>>>> I don't understand. If the controller doesn't swap the 16bit values,
>>>>> you will read the wrong content, no?
>>>>>
>>>>
>>>> In linux no, because macronix swaps bytes on a 2 byte boundary both on
>>>> reads and on page program. The problem is when you mix 8D-8D-8D mode
>>>> and
>>>> 1-1-1 mode along the boot stages. Let's assume you write all boot
>>>> binaries
>>>> in 1-1-1 mode. When reaching u-boot if you enable 8D-8D-8D mode, when
>>>> u-boot
>>>> will try to get the kernel it will fail, as the flash swaps the bytes
>>>> compared
>>>> to what was written with 1-1-1 mode. You write D0 D1 D2 D3 in 1-1-1
>>>> mode and
>>>> when reaching u-boot you will read D1 D0 D3 D2 and it will mess the
>>>> kernel image.
>>>
>>> But you have to consider also 3rd parties, like an external programmer
>>> or
>>
>> Why? If you use the same mode when reading and writing, everything is fine.
>> I'm not sure what's your suggestion here.
> 
> So our stance here is that we don't care about external programs?> 
> If that is the case then why bother with all this anyway? Since the swap
> happens at both page program and read, what you write is what you read
> back. Who cares the order stored in the actual flash memory as long as
> the data read is correct?
> 
> If we do care about external programs, then what would happen if the
> external program writes data in 8D-8D-8D mode _without_ swapping the
> bytes? This would also cause data corruption. You can't control what
> they mode they use, and you can't detect it later either.
> 
> I think there is no winning here. You just have to say that external
> programs should write in 8D-8D-8D mode or it won't boot.
> 

How about swapping the bytes just at user request? Maybe with a Kconfig
option.

>>
>>> another OS. So, there has to be *one correct* way of writing/reading
>>> these
>>> bytes.
>>>
>>
>>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
