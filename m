Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76ACC43217
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Mar 2022 07:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PD30qupN4cUSfeYiKPvgOtP+I14RmXu+Ax8RGeXP+8Q=; b=B7xv7SMNJ94yeU
	x+NSD2+5FKbwfEOb33SGuPMHDy0J1TTJivQYlkdt2N5/dja3hOhX7W2+fwAKO2vdLntnru3urqGHe
	Oxg66Sfv+/CVWHRNveUMXTUyFXaqHlWQ4lvH2QBToB3e47pfqaBK6zjPbYbh7tcadTO9zjGGNQO2S
	74U+QbBQS2OBCBpWKQhHkanBUVSxY4i0eEM8TSYNCgX3dYGmiLACt+QJbS7vIf+kA+GN3+A6Cw8vJ
	nEA12++HOjUvQs3nbwFbwnjJIusaWLsJPf5Sh0L9/t5YKBv1rCo8/NuBJ9S/3SX0bpBJcxH5xdclD
	0CCz8uS1L4/0wMV9FKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ22B-008idd-43; Fri, 04 Mar 2022 07:07:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ226-008iZn-FA; Fri, 04 Mar 2022 07:07:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646377642; x=1677913642;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=AH97CBKNnbTYuvLam/YvTvH4i9WyEebXiVX9cHWz9bQ=;
 b=EzbSgVfh2yl23f7Ezsi/mL0RQ//mPMhkYVOUk/bEjnoOk8BpFj1a6Ofv
 P53ENYJLm+aG+ywv5HSVGv7j4WXVvw9AuJJdgDMlR6LVw1s+r1kQ+fZio
 59L7tLeodstTV1MQ91M32+Oc/+xnvmQQ+Qen2Cd5U9wQjvBUN/eGyComX
 h5ZReMistsY2oLwGsyNi6/idZHz/HPNcj8+0enBlrX/j3lIg0+TZID97Y
 1T/T2h2sZrlyxCny6J5hHrbMFY8NGP2d8xu9mNKxpGiLfgW0Po8RfWMXW
 dN6UASd/UrfUvZlmZ5Ih2OCURHIbkUeDwmNpr8vMMdUbZOzqVWJbXEO1m Q==;
X-IronPort-AV: E=Sophos;i="5.90,154,1643698800"; d="scan'208";a="155694553"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Mar 2022 00:07:20 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 00:07:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 00:07:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JsfxEgh41hnQKkCCN2MX6Z9A0YUOdV/CSOJ3QyPV5TLmKCqpeElgQ+r42mtErQ3Mqha19yWly3yHLoA6Bho3SIcb0vu5lTJF0eLzMlDaOcVwKTaSljTPaCSukDTqEzuybkAV6wO3RHOfJMu61p+IYhpbFeHSVmSQBfzhT2ZBn5n04tsZdF+yUv6vj0TwH6Lnb9mAZJFX7zIDSGdsU+5Qln5pLe8Udvm4bq6FbX3JEevCZH5+c/GU1e6GDWkQlgYmxAceijpZWW3y4vIvYhMnD3tkpLqNLT0F8O0MnDpScQu7TM/VWQr+MbTuMDtkdnwfpti5gmN1DV0LuVPvUH0skw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AH97CBKNnbTYuvLam/YvTvH4i9WyEebXiVX9cHWz9bQ=;
 b=TiQ2bu1ZhcS3uHwY93ZK6DP/1ptopYRjkFueFW/blcQrOVLQTUxw9R9QckMvmu3ilGtMYTQ7XOKeGR377wwv52hBa1JL7nfCR47vjzpHMPdAfa1Z2SqDRRsIuInkXvrkljT9Ps5p/EGola7PSDr6kBgXXRAqHhRxvh+gYa0tn+7R4Fu8oD59abZ8hWZJ2XWhqYkDuSTTtKdBPaN6eP3wEhzOwA8hPYsMgpOAHd8Tfq5CHUNadsMdNt2ok3TU1Dqb6/gM/X+4NFHtZ484hYwINgMxxm7Wa7zeeJRiNLYnCLvRbJTNUFFVLWMzJVXzlwqALNWctqQ4dsfW5P0JSOk0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH97CBKNnbTYuvLam/YvTvH4i9WyEebXiVX9cHWz9bQ=;
 b=gOb0JAvubSavGNzoMr++rBDERXGB7iXFQVs9K5gRsG/cLkOL++d/0R9CwYnx2hksiA6lWX52WRx9qRvKKlW8HB78IG6otxKGrUj+eWRleQgxyESs7iSot4qWZKsddqwFV9V4nwyb58s0RyEYd3cFm/4m4E2U7uo47nJ0zcDwBEA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA1PR11MB5826.namprd11.prod.outlook.com (2603:10b6:806:235::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Fri, 4 Mar
 2022 07:07:05 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 07:07:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v4 5/6] mtd: spi-nor: Introduce Manufacturer ID collisions
 driver
Thread-Topic: [PATCH v4 5/6] mtd: spi-nor: Introduce Manufacturer ID
 collisions driver
Thread-Index: AQHYLxmFC38uZpmRskyb6mPIBOt4WA==
Date: Fri, 4 Mar 2022 07:07:04 +0000
Message-ID: <1f736b73-2b2c-f29f-b73f-41fb6ee2ad0f@microchip.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-6-tudor.ambarus@microchip.com>
 <0edfa6e267995a127181173496b471ea@walle.cc>
 <f1e8d9d1-04a3-fb8e-5f16-7121b4d368a1@microchip.com>
 <0e89e5f9e09bec1d0e9ff870610863df@walle.cc>
In-Reply-To: <0e89e5f9e09bec1d0e9ff870610863df@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30c409d0-2092-461a-a4a2-08d9fdad96bb
x-ms-traffictypediagnostic: SA1PR11MB5826:EE_
x-microsoft-antispam-prvs: <SA1PR11MB582618E22C5BE2A4F20EF71FF0059@SA1PR11MB5826.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9LfcjIjK/xF+0ey0E0fsV+xlGbDSW4CHD8OoVJoTD6bqwPGBRo8A8Y6xwF6HL54fncsgpUjXKwEvFxE2bbE5dGRyMHtaY02u6C0FWWRlUpu5KhSgiCOMRqwXz6QtCBdM7yWH5YpF7zsVU83G1IYeTs1401o6AKNVDlA87YqRKrT4ZJfK8KwEdqBpdRl+CoXpYZ2dcDT8P8TQYdr0AGv2CwLUPIAVUIaYGmniu8D/G3uvoZw+ZofWVHqW+S9umz4HFvRIV9S3J9XDcLBSaLBRh8kgbTsUmV8mQaixMKXOEneM5EW/+t6Aab9LuE1Q726mc7r8BeAGSA/HeyRZW84qjtgGAklnNGzNcS5OxmaRuOhVaQ5Z68jjgOmXZ2SlZFb6ThcWq4Sssh+d4FYmoFQw76piIftiCjQmok/2eU/lmgNo/L7YyOiH0oVfZYzbAGMrxU650cVbz/WfsKwlVihUocVD63zPe2ICew0gYsXQ92ztM4FZXdtOGALtrIHJw+IePj000+6qYUkoWnB6Xtt3ZR7yeOY53eUUWm410xOo+bWMfYeFIYOLOOGUGgO47DNEeV6mFXnWv3cgIUoS7VWjYOTVFwC3HI2Rm+8RJhuezWtDsEDyR6oXJFc/vZGCp0z6oZ8mbwiWKPXkV9yyM+wDhqqtHEgDv2FffJh7MF9BnnHG9sV/kTWFX8cFcorckDOHMx4DZaJl4tSr/s5XWvODPPXoWKX05+6+LNOr5GHoCwyEuX+T95QWEn70tO2BeSrhDz3W05V/p8yhwT6yaniiyw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(2906002)(86362001)(6512007)(508600001)(76116006)(91956017)(6486002)(8676002)(4326008)(64756008)(66446008)(66476007)(66556008)(66946007)(71200400001)(186003)(6506007)(53546011)(8936002)(5660300002)(7416002)(2616005)(36756003)(26005)(107886003)(38100700002)(122000001)(83380400001)(54906003)(31686004)(38070700005)(316002)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3dIYWcvNHBTZ2lacnhESkorNUhraCtkU0xDK2Y1b01NYkF4VGJURXJsQ1Ez?=
 =?utf-8?B?bTRxUThjS0NxcmZCOWl4ZzZNb05nRCtSS0M2aHhqb0FvK2Zwa3FZNG1Lb0RL?=
 =?utf-8?B?WEYzWmZSUCtxTi9iNnNScWJIKy91ZzlrcEpmbmtOajlzbGVPV0R2NkZUbXp6?=
 =?utf-8?B?VnJxclFzYW9HS1V5SW4rNG91bGhzQnlXQXNoVmxjYmdSK3psMjFjQXFNbnow?=
 =?utf-8?B?TlFud0hXMFVYdndxak1WS0tNREp0WXNmdUhyQng4V0lmRFloSFphUm5NWExx?=
 =?utf-8?B?cHd0YzJQVk9KR3B4anJacTdNVlp2cHA3T0JOY1liM3o5LzR3ZEJuMThpR1RU?=
 =?utf-8?B?Nk9PUHVOWk1vMVFFRFFwMlNrazdwdXZ4cWtHcFE4dFd6OVJjTG1FSm5YSFlK?=
 =?utf-8?B?QnYyaEgxdC9RYTFBRkZRMVZBTkJHeFBVR1ZQUW1yUmU4RXY4YzJDM3NFTm9J?=
 =?utf-8?B?ZmNYQjQyREMzL0tLYWdJcmV5S0FKQm5EOHV6RE55OCtxdUFiRDB4NnEwRVh5?=
 =?utf-8?B?TEpjc3QvNktRZWxPMEg3U0tjMnZCN09kdDBPNzFLNzFITW0wZDNNNjl4UzhL?=
 =?utf-8?B?c0M5TTMwS01YN1VpRDhzcDVhSW9rL1MwODVVM0VsMU00MFFlSXY1aWdzTHlr?=
 =?utf-8?B?WXlZa095UDRXaS9aVEVaRUtKNEcwK2h4Z1VncndtL0tMYklxRUsvOCszVEov?=
 =?utf-8?B?bncrRWtka3pyRUlCVXdrS0h4THJRdzdIZ1hUV0VESW1wZUFMSUoyNmc5WUo0?=
 =?utf-8?B?bHhwVlNiV1g5T2IzYVpzaE9WZzVBbXNNMC81Z3lZZFpCMXd1R2tHdjJxUjRH?=
 =?utf-8?B?NkNTNFkvTklwdHFURTh5WGZJbUZTdmV2YjFqaTUrYXhaN0l4SkdFWDBGampQ?=
 =?utf-8?B?VmJNZXBMeFhoTk5EbGwzNXd5VnhuOVp0Z2VGZ2dsMUhWZkd0WTh0UnNEZWNZ?=
 =?utf-8?B?SDBnVEVmWlVJaDhhWGVTV2JlaHV5NmpjS2d6bjh4SjV3bFppeDk1WGtsRDBJ?=
 =?utf-8?B?VC9NWW9SL2ZNRFU5K3NBdExsQ1hlWDA5anpiaUJBTEV5cllTbUh1MDlNQ3p6?=
 =?utf-8?B?eDNZWStBRjhXQk1URDBzNFJQZmhUZnRJeXYwc1JMQnppbmxrMFo2MjErK0V2?=
 =?utf-8?B?dFJuOVhCQkFMbEVtWnZHMGJoZEFQUmtxQ3FMVXh0QTZuRGZTbU8vaCsrTUcr?=
 =?utf-8?B?T0lTYnJhamZoT0M1TXlJckVUNmpoMkVJRlMyS0pRNkJ3OWFBUWlRVHhHTUE2?=
 =?utf-8?B?R3IyNi9mNmdHdGlRR01YRnJROWpyTXR2ek9OWDB6VDQvcWdqZUFNcSt1QS95?=
 =?utf-8?B?TmNJUnZwNFB0bFo0SVRhSXB4MlRxWnpvZ1lnSzNDMmswRm42bzhYcDVZRUdz?=
 =?utf-8?B?QUIzdzVvbXVPQytManFkQzl4ZkFFd2Y4YjFHV0o4RVhtYlBUbW5sT3p4YjA2?=
 =?utf-8?B?U3QvL3Exb0hsRkZkRys5S0M1OTdIRGFGTTFwQjA0MTd5QkM0cXp3QWtUVmow?=
 =?utf-8?B?cjJrSTV5dStheTFIMlZHbEN3OWJxL1dpd2FWR28vZURkdThrOE91TVRkU1Bk?=
 =?utf-8?B?T0dlRHRkczE0TE9VNE9wRWc2WGNBVDVqM2lGOElnU1N0U2R4amZ1RGFDNHV4?=
 =?utf-8?B?MFZrWFdxOENMTkR0Tnd0VHIrS2ZTZGlVSnM3Mk1tczNlN3lZeVIwVDVBeW9l?=
 =?utf-8?B?dDloWWU3dXFLOFJweHBneWZBMDl5RUtTSUxydkFBdlhkaEV2QkxZUmFFU1hn?=
 =?utf-8?B?M2ZDbnFmLzd0Kzl5VTlaRTRTbWhGRk9FOEY3VEcrLzI0QW1uQnR5RkozWEdS?=
 =?utf-8?B?djZlcUc4Z0psb2EzaTY3Wi92dE02SzZEbGNFaUdtQTRkckFxQTNXRmczaDAz?=
 =?utf-8?B?ZTU4cFVHK05NeHFpZlllTDk0ZUQ0bFRYWnJmcmFCVDhKTFBTKzUrN1NyWi92?=
 =?utf-8?B?Y2R5RXk1Y0JRYWx3ZFI2aGNxUEZsVWxJQ3ByNDJ6VVFZSVVia3FtZERjNGtm?=
 =?utf-8?B?YXUvUnlodkk5UkQzY3JrZXZsNFZwOS96Ky9jM0dlQkh4dm54QVB0SjdSL0xl?=
 =?utf-8?B?bDF1VVhwOTBjcDVQYkkvK1c2aVZYUmk5cU90Zm9OTUhsckZwdHdudVY5Z2ZW?=
 =?utf-8?B?ZlBKVkxIT2ZVRXZsN2MySCtoRmRnUXFsdHFVaThDTTFzanFuMVdsaWRlMHRW?=
 =?utf-8?B?ckZWVUVEeG1DWWpaQ1B5R3pyVTJmaktpRUN0YkhVVUhCU0I1VXltdzMxVXhm?=
 =?utf-8?B?N2t4TGhZeTI2VDZZUXJaZks3NWt3PT0=?=
Content-ID: <06FBBF527236A14E8DDA58BF43A80166@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c409d0-2092-461a-a4a2-08d9fdad96bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 07:07:04.8892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hpYyDxAknC+fl62yfZcZKLqlsk1Y/Pwb3izSXmEA70jdtRNto4xL75RK1OSoBuQb2VKffMvKG1HL5t5cOVr79ilDPJlYmC3a7wFXIGm3UKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5826
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_230722_637152_2C08599D 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 Nicolas.Ferre@microchip.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 p.yadav@ti.com, mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMy8zLzIyIDIzOjM4LCBNaWNoYWVsIFdhbGxlIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEFtIDIwMjItMDMtMDMgMTc6MTIsIHNjaHJpZWIgVHVk
b3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tOg0KPj4gT24gMy8yLzIyIDAwOjE5LCBNaWNoYWVsIFdh
bGxlIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cNCj4+PiB0aGUgY29udGVudCBpcyBzYWZlDQo+
Pj4NCj4+PiBBbSAyMDIyLTAyLTI4IDE0OjQ1LCBzY2hyaWViIFR1ZG9yIEFtYmFydXM6DQo+Pj4+
IFNvbWUgbWFudWZhY3R1cmVycyBjb21wbGV0ZWx5IGlnbm9yZSB0aGUgbWFudWZhY3R1cmVyJ3MN
Cj4+Pj4gaWRlbnRpZmljYXRpb24NCj4+Pj4gY29kZQ0KPj4+PiBzdGFuZGFyZCAoSkVQMTA2KSBh
bmQgZG8gbm90IGRlZmluZSB0aGUgbWFudWZhY3R1cmVyIElEIGNvbnRpbnVhdGlvbg0KPj4+PiBz
Y2hlbWUuIFRoaXMgd2lsbCByZXN1bHQgaW4gbWFudWZhY3R1cmVyIElEIGNvbGxpc2lvbnMuDQo+
Pj4+DQo+Pj4+IEFuIGFuIGV4YW1wbGUsIEpFUDEwNkJBIHJlcXVpcmVzIEJveWEgdGhhdCBpdCdz
IG1hbnVmYWN0dXJlciBJRCB0byBiZQ0KPj4+PiBwcmVjZWRlZCBieSA4IGNvbnRpbnVhdGlvbiBj
b2Rlcy4gQm95YSdzIGlkZW50aWZpY2F0aW9uIGNvZGUgbXVzdCBiZToNCj4+Pj4gMHg3ZiwgMHg3
ZiwgMHg3ZiwgMHg3ZiwgMHg3ZiwgMHg3ZiwgMHg3ZiwgMHg3ZiwgMHg2OC4gQnV0IEJveWENCj4+
Pj4gaWdub3Jlcw0KPj4+PiB0aGUNCj4+Pj4gY29udGludWF0aW9uIHNjaGVtZSBhbmQgaXRzIElE
IGNvbGxpZGVzIHdpdGggdGhlIG1hbnVmYWN0dXJlciBkZWZpbmVkDQo+Pj4+IGluDQo+Pj4+IGJh
bmsgb25lOiBDb252ZXggQ29tcHV0ZXIuDQo+Pj4+DQo+Pj4+IEludHJvZHVjZSB0aGUgbWFudWYt
aWQtY29sbGlzaW9ucyBkcml2ZXIgaW4gb3JkZXIgdG8gYWRkcmVzcyBJRA0KPj4+PiBjb2xsaXNp
b25zDQo+Pj4+IGJldHdlZW4gbWFudWZhY3R1cmVycy4gZmxhc2hfaW5mbyBlbnRyaWVzIHdpbGwg
YmUgYWRkZWQgaW4gYSBmaXJzdA0KPj4+PiBjb21lLA0KPj4+PiBmaXJzdCBzZXJ2ZWQgbWFubmVy
LiBEaWZmZXJlbnRpYXRpb24gYmV0d2VlbiBmbGFzaGVzIHdpbGwgYmUgZG9uZSBhdA0KPj4+PiBy
dW50aW1lIGlmIHBvc3NpYmxlLiBXaGVyZSBydW50aW1lIGRpZmZlcmVudGlhdGlvbiBpcyBub3Qg
cG9zc2libGUsDQo+Pj4+IG5ldw0KPj4+PiBjb21wYXRpYmxlcyB3aWxsIGJlIGludHJvZHVjZWQs
IGJ1dCB0aGlzIHdpbGwgYmUgZG9uZSBhcyBhIGxhc3QNCj4+Pj4gcmVzb3J0Lg0KPj4+PiBFdmVy
eSBuZXcgZmxhc2ggYWRkaXRpb24gdGhhdCBkZWZpbmUgdGhlIFNGRFAgdGFibGVzLCBzaG91bGQg
ZHVtcCBpdHMNCj4+Pj4gU0ZEUA0KPj4+PiB0YWJsZXMgaW4gdGhlIHBhdGNoJ3MgY29tbWVudCBz
ZWN0aW9uIGJlbG93IHRoZSAtLS0gbGluZSwgc28gdGhhdCB3ZQ0KPj4+PiBjYW4NCj4+Pj4gcmVm
ZXJlbmNlIGl0IGluIGNhc2Ugb2YgY29sbGlzaW9ucy4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1i
eTogVHVkb3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gwqBkcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDEgKw0KPj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrKw0KPj4+PiDCoGRyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsNCj4+Pj4gwqBk
cml2ZXJzL210ZC9zcGktbm9yL21hbnVmLWlkLWNvbGxpc2lvbnMuYyB8IDMyDQo+Pj4+ICsrKysr
KysrKysrKysrKysrKysrKysrDQo+Pj4+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9zeXNmcy5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPj4+PiDCoGluY2x1ZGUvbGludXgv
bXRkL3NwaS1ub3IuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKysrKy0NCj4+
Pj4gwqA2IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
Pj4+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL3NwaS1ub3IvbWFudWYtaWQtY29s
bGlzaW9ucy5jDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL01h
a2VmaWxlDQo+Pj4+IGIvZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZQ0KPj4+PiBpbmRleCA2
YjkwNGU0MzkzNzIuLjQ4NzYzZDEwZGFhZCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQv
c3BpLW5vci9NYWtlZmlsZQ0KPj4+PiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxl
DQo+Pj4+IEBAIC0xLDYgKzEsNyBAQA0KPj4+PiDCoCMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEdQTC0yLjANCj4+Pj4NCj4+Pj4gwqBzcGktbm9yLW9ianPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA6PSBjb3JlLm8gc2ZkcC5vIHN3cC5vIG90cC5vIHN5c2ZzLm8NCj4+Pj4gK3Nw
aS1ub3Itb2Jqc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICs9IG1hbnVmLWlkLWNv
bGxpc2lvbnMubw0KPj4+PiDCoHNwaS1ub3Itb2Jqc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICs9IGF0bWVsLm8NCj4+Pj4gwqBzcGktbm9yLW9ianPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCArPSBjYXRhbHlzdC5vDQo+Pj4+IMKgc3BpLW5vci1vYmpzwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gZW9uLm8NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4+Pj4g
aW5kZXggYWVmMDAxNTFjMTE2Li44MGQ2Y2U0MTEyMmEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jDQo+Pj4+IEBAIC0xNjEwLDYgKzE2MTAsNyBAQCBpbnQgc3BpX25vcl9zcjJfYml0N19xdWFk
X2VuYWJsZShzdHJ1Y3Qgc3BpX25vcg0KPj4+PiAqbm9yKQ0KPj4+PiDCoH0NCj4+Pj4NCj4+Pj4g
wqBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfbWFudWZhY3R1cmVyICptYW51ZmFjdHVyZXJz
W10gPSB7DQo+Pj4+ICvCoMKgwqDCoCAmc3BpX25vcl9tYW51Zl9pZF9jb2xsaXNpb25zLA0KPj4+
DQo+Pj4gSSdtIHN0aWxsIG5vdCBjb252aW5jZWQgaXQgc2hvdWxkIGJlIHRoZSBmaXJzdCBlbnRy
eSBoZXJlLiBXZSB3aWxsDQo+Pj4gcHV0IG90aGVyIHZlbmRvcnMgYXQgYSBkaXNhZHZhbnRhZ2Ug
d2hvIHBsYXkgZmFpci4gSSBkb3VidCB3ZSB3aWxsDQo+Pj4gYWx3YXlzIGNoZWNraW5nIGFueSBu
ZXcgSURzIGZvciBkdXBsaWNhdGlvbnMgLSBvciBzb21lIG1pZ2h0IHNsaXANCj4+PiB0aHJvdWdo
LiBQdXR0aW5nIGl0IGFzIHRoZSBsYXN0IGVudHJ5IHdpbGwgbWFrZSBzdXJlLCBsZWdpdGltYXRl
DQo+Pj4gdXNlcnMgd2lsbCBhbHdheXMgY29tZSBmaXJzdC4NCj4+Pg0KPj4+IEVzcC4gYmVjYXVz
ZSB4bWMgcmV1c2VzIHZlbmRvciBpZCB3aG9zZSBmbGFzaGVzIHdlIGFsc28gc3VwcG9ydA0KPj4+
IG1ha2luZyBhIGNvbGxpc2lvbiB2ZXJ5IGxpa2VseS4gVW5saWtlIGJveWEgd2hvIHJldXNlcyAi
Y29udmV4DQo+Pj4gY29tcHV0ZXJzIiB3aGVyZSB3ZSB3aWxsIHByb2JhYmx5IG5ldmVyIHNlZSBh
biBTUEkgZmxhc2ggZnJvbS4NCj4+DQo+PiBZZXMsIGJlaW5nIHRoZSBmaXJzdCB3YXMgaW50ZW50
aW9uYWwuIFRoZSByYXRpb25hbGUgaXMgdGhhdCBpZiBzb21lb25lDQo+PiBhZGRzIGEgbWljcm9u
IGFuZCBzZWVzIGFuIFhNQyBuYW1lIGl0J3MgY2xlYXIgdGhhdCBpdCdzIGEgY29sbGlzaW9uLA0K
Pj4gc28gd2UgZ2V0IHRoZSBjaGFuY2UgdG8gZml4IGl0IGZyb20gdGhlIGZpcnN0IGRheS4gQmV0
dGVyIHRlc3QNCj4+IGNvdmVyYWdlLA0KPj4gZWFzaWVyIHRvIGlkZW50aWZ5IHRoZSBjb2xsaXNp
b25zLCB0aHVzIGVhc2llciB3b3JrIGZvciBtYWludGFpbmVycy4NCj4+IEJ1dCBhdCB0aGUgc2Ft
ZSB0aW1lIElEIGNvbGxpc2lvbnMgZm9yIG5ldyBmbGFzaCBhZGRpdGlvbnMgY2FuIGJlDQo+PiBp
ZGVudGlmaWVkIGJ5IGEgc2ltcGxlIGdyZXAsIHNvIEkgd2lsbCBub3QgaW5zaXN0IGhlcmUgZ2l2
ZW4gdGhhdCBpdCBpcw0KPj4gdGhlIHNlY29uZCB0aW1lIHlvdSBtZW50aW9uIHB1dHRpbmcgdGhl
IGNvbGxpc2lvbnMgZHJpdmVyIHRoZSBsYXN0IGluDQo+PiB0aGUNCj4+IGFycmF5Lg0KPj4NCj4+
Pg0KPj4+IFRoYXQgYmVpbmcgc2FpZC4gSSdkIGFsc28gc3VnZ2VzdCB0byBvbmx5IGFsbG93IGZs
YXNoZXMgd2l0aA0KPj4+IFNGRFAgaGVyZSwgc28gd2UgaGF2ZSBhdCBsZWFzdCBzb21lIGNsdWUg
dG8gZGlmZmVyZW50aWF0ZQ0KPj4+IGJldHdlZW4gZmxhc2hlcy4gSWYgdGhlcmUgd2lsbCBldmVy
IGJlIGEgZmxhc2ggd2l0aG91dCBTRkRQDQo+Pj4gYW5kIHdoaWNoIGlzIHVzaW5nIGEgbm9uLWxl
Z2l0aW1hdGUgdmVuZG9yIGlkLCB0aGVuIHdlJ2xsDQo+Pj4gbmVlZCB0byBlaXRoZXIgZGVueSBz
dXBwb3J0IGZvciBpdCBvciBzcGVjaWZ5IGl0IGJ5IGEgbmFtZQ0KPj4NCj4+IHdlIGNhbid0IGRl
bnkgc3VwcG9ydCBmb3IgdGhpcyByZWFzb24sIHdlJ2xsIGJlIGZvcmNlZCB0byB1c2UgZHQgdG8g
Z2V0DQo+PiB0aGUgZmxhc2ggbmFtZS4NCj4+DQo+Pj4gKGkuZS4gZGV2aWNlIHRyZWUgY29tcGF0
aWJsZSBvciBzaW1pbGFyKS4gQnV0IHRoZXNlIHNob3VsZA0KPj4+IGdvIGludG8gYSBzZXBlcmF0
ZSBsaXN0IHRoZW4uDQo+Pj4NCj4+IEhvdyB5b3Ugd2lsbCBkaWZmZXJlbnRpYXRlIGJldHdlZW4g
dHdvIGZsYXNoZXMgb2YgZGlmZmVyZW50DQo+PiBtYW51ZmFjdHVyZXJzIHRoYXQNCj4+IGNvbGxp
ZGUsIG9uZSB0aGF0IHN1cHBvcnRzIFNGRFAgYW5kIG9uZSB0aGF0IGRvZXNuJ3Q/IFlvdSdsbCBo
YXZlIHRvDQo+PiBoYXZlIGENCj4+IHNpbmdsZSBmbGFzaCBlbnRyeSBpbiBvbmUgb2YgdGhlIGRy
aXZlcnMsIHdoZXJlIHdpbGwgeW91IHB1dCBpdD8NCj4gDQo+IEhtLCBJIHNlZS4gQnV0IGl0IGRv
ZXNuJ3QgZW5kIHRoZXJlLiBJbWFnaW5lIG9uZSB3b3VsZCBuZWVkDQo+IGZ1bmN0aW9uIGZyb20g
YSBkaWZmZXJlbnQgKHZlbmRvcikgbW9kdWxlLiBTbyB3ZSBoYXZlIHRvIGV4cG9ydCBpdA0KPiBh
Z2FpbiB3aGljaCBmb3JtZXJseSB3YXMganVzdCBwcml2YXRlIHRvIHRoaXMgbW9kdWxlLg0KPiAN
Cj4gQWxsIG9mIHRoaXMgbWFrZXMgbWUgd29uZGVyIGlmIHdlIGNhbid0IGp1c3QgYWRkIG9uZSBk
ZXZpY2UgaWQNCj4gbXVsdGlwbGUgdGltZXMgaW4gb3VyIGxpc3RzIGluIGRpZmZlcmVudCB2ZW5k
b3IgbW9kdWxlcy4gVG8NCj4gZGlzdGluZ3Vpc2ggYmV0d2VlbiBlbnRyaWVzIHdpdGggdGhlIHNh
bWUgaWQsIHdlIHByb3ZpZGUgYW5vdGhlcg0KPiBjYWxsYmFjazoNCj4gwqAgYm9vbCBpc19tYXRj
aChub3IsIHNmZHAsIC4uKQ0KPiANCj4gVGhhdCB3b3VsZCBzb2x2ZSB0aGUgZm9sbG93aW5nOg0K
PiAoMSkgd2UgY2FuIGhhdmUgdGhlIHByb3BlciBmbGFncyBwZXIgZmxhc2ggaW5zdGVhZCBvZiBo
YXZpbmcNCj4gwqDCoMKgIHRvIGNoYW5nZSB0aGVtIGluIGZpeHVwcyBsYXRlcg0KPiAoMikgdmVu
ZG9yIGZ1bmN0aW9ucyBjYW4gYmUgbGVmdCBwcml2YXRlIGluIHRoZSBjb3JyZXNwb25kaW5nDQo+
IMKgwqDCoCBtb2R1bGUsIGJlY2F1c2UgYWxsIGVudHJpZXMgd2lsbCBiZSBoZWxkIGluIGEgcGVy
IHZlbmRvciBsaXN0DQo+ICgzKSB3ZSBjYW4gcHJvdmlkZSBzb21lIHNhbml0eSBjaGVja3MgKGVu
YWJsZWQgYnkgYSBLY29uZmlnKQ0KPiDCoMKgwqAgdG8gd2FsayB0aGUgbGlzdCBhbmQgd2F0Y2gg
Zm9yIGludmFsaWQgZHVwbGljYXRlIGVudHJpZXMuDQo+IMKgwqDCoCBTZWUgbW9yZSBiZWxvdy4N
Cg0Kd2UgYWxyZWFkeSBoYXZlIHRvIGdvIHRocm91Z2ggdGhlIGVudGlyZSBsaXN0IG9mIGZsYXNo
IGluZm8gZW50cmllcw0KdG8gY2hlY2sgZm9yIGNvbGxpc2lvbnMsIHdlIGNhbiBqdXN0IGFkZCBh
IGRldl9pbmZvIG9yIGRldl93YXJuIGZvcg0KaW52YWxpZCBkdXBsaWNhdGUgZW50cmllcy4gTm8g
bmVlZCBmb3IgYSBrY29uZmlnLg0KDQo+ICg0KSBzYW5lIGZhbGxiYWNrLiBJLmUuIGlmIHRoZXJl
IGlzIGEgZHVwbGljYXRlIGluIHRoZSBmdXR1cmUsDQo+IMKgwqDCoCB3ZSBqdXN0IGhhdmUgdG8g
YWRkIGEgbmV3IGVudHJ5IHdpdGggYSBpc19tYXRjaCgpLiBJZiBpdA0KPiDCoMKgwqAgZG9lc24n
dCBtYXRjaCwgd2UganVzdCBjb250aW51ZSBhbmQgd2lsbCBmaW5hbGx5IGZhbGwgYmFjaw0KPiDC
oMKgwqAgdG8gdGhlIG9yaWdpbmFsIGVudHJ5Lg0KPiAoNSkgaWYgbmVjZXNzYXJ5LCBjb21wYXRp
YmxlIHN0cmluZ3MgbWF0Y2hlcyBzaG91bGQgYmUgZWFzeSB0bw0KPiDCoMKgwqAgYWRkLiBUaGlu
ayBvZiBzb21ldGhpbmcgbGlrZToNCj4gwqDCoMKgwqAgYm9vbCBpc19tYXRjaChub3IsIHNmZHAp
IHsNCj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5vciwg
Im1hY3Jvbml4LG14Li4iKTsNCj4gwqDCoMKgwqAgfQ0KPiANCj4gaXNfbWF0Y2goKSBpcyBvcHRp
b25hbCwgYnV0IGlmIGdpdmVuLCBib3RoIHRoZSBmbGFzaCBpZCBoYXMgdG8NCj4gbWF0Y2ggYXMg
d2VsbCBhcyBpc19tYXRjaCgpIGhhcyB0byByZXR1cm4gdHJ1ZS4NCj4gDQo+IEkuZS4gb25lIHNh
bml0eSBjb3VsZCBiZTogd2FsayB0aGUgbGlzdCBhbmQgc2VlIGlmIHRoZXJlIGFyZQ0KPiB0d28g
ZW50cmllcyB3aXRoIHRoZSBzYW1lIGlkLCBidXQgYm90aCB3aXRob3V0IGFuIGlzX21hdGNoKCkN
Cj4gZnVuY3Rpb24uIFRoaXMgd291bGQgbWVhbiBhbiBpbnZhbGlkIGR1cGxpY2F0ZSBlbnRyeS4N
Cj4gDQo+IFdoYXQgZG8geW91IHRoaW5rPw0KDQpJIGZpbmQgdGhlIGlkZWEgZ29vZCBhbmQgd291
bGQgbGlrZSB0byBnaXZlIGl0IGEgdHJ5LiBUaGUgZG93bnNpZGUgdGhhdA0KSSBzZWUgaXMgdGhh
dCB3ZSdsbCBhbHdheXMgaGF2ZSB0byBnbyB0aHJvdWdoIHRoZSBlbnRpcmUgbGlzdCBvZg0KZmxh
c2hfaW5mbyBlbnRyaWVzIHRvIGRldGVybWluZSB0aGUgY29sbGlzaW9ucyBhbmQgdG8gaGFuZGxl
IHRoZW0gYWxsLCBzbyBhDQpsaXR0bGUgZGVsYXkgaW4gZmluZGluZyB0aGUgZmxhc2gsIGJ1dCBJ
IHRoaW5rIHdlIGNhbiBsaXZlIHdpdGggdGhpcy4NCkNhbiBJIGltcGxlbWVudCB5b3VyIHN1Z2dl
c3Rpb24gYW5kIGFkZCBTdWdnZXN0aW9uLWJ5IHRhZ3MsIG9yIGRvIHlvdSB3YW50DQp0byBoYW5k
bGUgaXQgeW91cnNlbGY/DQoNCkNoZWVycywNCnRhDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
