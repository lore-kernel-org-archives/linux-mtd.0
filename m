Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67E7C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3koZ5k/Eyk5MctGVMG0Pkzj0jYrPdxYuJnlLV5Ksfk=; b=WUnOQXyx2gLTg3
	kXR6bTQ7b4bpDX+JwAd37RPfcYDY+eZug6k9bNKlhs5SCkDH/cHF2E1x1aaYM9pauLaOeGD0+303v
	7vI595BkElVithJQYDcGGcBm7GA44phbnyaOjOZS+l8vD/ETlwF4yyzycmyIeJpSVAeKrHG4CyHdq
	C3LFbg8ZMJ0ZgJLGhJKmUav6xcYi5tSF2qZUdm34qPZW0aBZ2CWWXZMLnMO+LB++aSLHZTQdGK2RL
	xB+6+oTEXaqK0lF+vb6NrG6ghtuWgr2ztK7rF9rmV6s2xmvUUpXpKl3Q0no0qTGOqUbmQXbpuUqOi
	IbVRmzLYtJFt17sS0bVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nginS-002CMX-HF; Tue, 19 Apr 2022 08:01:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nginP-002CM9-1A
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 08:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650355270; x=1681891270;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7iso06RZ2WABzA9HR2zRFBPXiQmMYn2bmzdsOKHSYcM=;
 b=BGWr3Paif1G1K/94ugQGr4Rmc0hsfZfPbprYL8bkYCYgtxhJZworXRsZ
 7XeWh3pyNm29EE2e0ZTcMd/l8Vs5Br9xHfQx7l7wy8VbpzWKoWMKZTG9c
 ostuCL0m0b0C/pfaL2tItW0wyGLeJWYNFJahSoHRhd6ND7ACh5g1NWjty
 O9oKwYP74NEd34r/qOUA19IWn1rEEc38wQKLRbo4MiDHavPwvnlp4lUJS
 QdL/g2NSFtiMpepcf5wUBVWqtAIS09RyNcmOZycarX59tkK5bdfoQjlCW
 g81xdCDpfEYmUszd3xrDMSxmpQQtm8oZxk5udMdH7Xlprc3GxN1XGDKBJ A==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="92767801"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 01:01:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 01:01:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 19 Apr 2022 01:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDrdH5z5V1TRXpouN/+SiS/ESb5nzV5wIhIA0SbH2luJVf836SPqgjOzhgCS/v85NUUpgKtWCta4Vl3dFqaBuwcw6EzS2bsjhA5ww3xOBhSiipBW5PTz6Y2+IfQhR2uHMNqFQjrVwsasZqkXrMgLHcRZe1Qz4dlKlcs2KHsuBVOCnFdUudTDac1OLNJ0NxZLPC5cD4ds6h2dQhV19bJFHZjU5wMrlCA2tZSsw8GwTpIMksb6k4VsJetgRZe7LC+77DSjFMldNY+XbikpXB76M6l6FbBkXuIZGjn39OiVlRcEkisvFmTgRicDWLejNi84Tm/PEc/HdtymaUZRnuEdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iso06RZ2WABzA9HR2zRFBPXiQmMYn2bmzdsOKHSYcM=;
 b=jHJWrGzoi0S2CqLC5lorWXtoNnbeWyRfVtpACepj76sdwCAz0L7GoGJJycGAGJaGaSXJGDIxUbR/dG/hMQOyRKB/Rw1V5JKKUeKK2rEIv6XLN+xCJV7sbe/w3XgXixplbknkvPkvLCOeFbkqeGa30dsz97fA4rOz1bycUg/xCrdOr9ydgpyraQX9eviWAKifhug5hQF0ruNJpyv+eL9hW/UKZOtc5YJ67ZIr0ec7k1kc3yOA7puEh6dh3oyiriOdtYm1Sxrt5lSx+MSk2uqElB2Hb931X753VyN7hbPbZnHEAoV6ij/OE2KCer4y61ltKXfY955crEkkuqtr64fSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iso06RZ2WABzA9HR2zRFBPXiQmMYn2bmzdsOKHSYcM=;
 b=Fbi7xT8zLSdYN4jDLysR/B4ktR7YSIGFyNU6t6VU/SIRTJulKNRkH5D5iLNdE6AZophxe6CwJP1JEBEXRtB6CsnLk7urOMiPzPm6kptxzMfbxUlyeiFH4z0PsAk9Of8uLbGo99h2nGIIAcqAhQIzAr4+uLPOae2T8ltHJZyBLGY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MWHPR11MB0048.namprd11.prod.outlook.com (2603:10b6:301:6a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 08:01:04 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 08:01:04 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 1/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Topic: [PATCH v11 1/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Index: AQHYU8Odqm1NfS6g6kq83AJmAOVTJQ==
Date: Tue, 19 Apr 2022 08:01:04 +0000
Message-ID: <37da8217-da36-1649-f764-cd9e6dd7ed8c@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <92241a7f523474d477a17437c8b6c926b29da4ab.1650259501.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <92241a7f523474d477a17437c8b6c926b29da4ab.1650259501.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5e94f7c-7495-4d8e-62b8-08da21dac0cb
x-ms-traffictypediagnostic: MWHPR11MB0048:EE_
x-microsoft-antispam-prvs: <MWHPR11MB0048D43898D4CE4C656DAB03F0F29@MWHPR11MB0048.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1LSkV70VTMRikElpl4hj9AHy9Yg7O/eD21bMCTxH3inkLf4sADrO+Oc4zzUNbVc9ydxufvUxHeqAkWCo8H2LWdt9chwQakBwqOujmFEho5HdTfFsOOlhJN7jkx6r9VYDJtlUUWpAWoERZhr2fscSeTHA2ESenkKDApEoNYPvZNzW6KKYhQaotgl+51BvvGr/tUXdDdBtYpkBqhyLI9f5/k4v288clTXeXrHsKbxaPObOIDVA4BOz7j6vfE0Oj8H4/dYJBjk+H6qBUDSEy1Vrb03NgY66Mnv0P5IORiGMohgCmXKmPpZ7jCzMBvvLYw6GhE96IDKFrBOw4M1xLo+PdVdZoz/qR29OYZhEiLk5qYs2H7OJQ7qCHJvNqHJp5m0+l05O2dGGbRtl9fxCnzSbrthRzpOSvKPFTACGXFepZm1h+XSm/fT7YDBevnzy8Rzb0KxdQWkVSCtBJZViPaFK+XQojgEoeZVxfz9Z8gHtVnEDbVlFt1K1ia1I8k8rAf3I9JYfmxG5C5OXFc3u11tI/87CorotXA70sTw56Kn9g42EexZZV/yiib/drhlCN5SqxwWoLZ1olXvbyC3+kUnS+Ny0nDv5/uwox6S/a++Xdr3ysaLIwqkeG7rbOs7L7yVpjDlu1oie8SFV+/AACR2doaBZRHFMkC7g7zI0ttU7oic4JY8lXIfeG76buof+7BXxg2cBhH6THDZvanUtwfmdbPD6LjCjCA5pUvYvkv9QTJWOv2bpbOg7dzwv+uavmrQJ3dy73AzIUhADm3AP0T/rNYwRGLAtDmprXRHm5wX3mMRo65Zs8zBG9I+ZR/Oc1C3CRqjbqf5oFGiRR3KBIPD/OyqRjtWnzFIxsJvAB68j2rw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(86362001)(66446008)(66946007)(31696002)(5660300002)(8936002)(54906003)(66476007)(66556008)(31686004)(38100700002)(316002)(122000001)(91956017)(4326008)(8676002)(26005)(186003)(110136005)(71200400001)(76116006)(508600001)(2616005)(38070700005)(2906002)(83380400001)(966005)(36756003)(6486002)(53546011)(6506007)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDRlUDlMUVNuVDVVQU9Na0ZpS09kYm4zVFYvNy9wcmlEcUtmZXhnVUZyUXFm?=
 =?utf-8?B?NTVhamt2QTRKOUVLeU5kRmU0UUZBbmFZUWc3c3VOLy8yWnhtQUN3anB3ck5Y?=
 =?utf-8?B?ditoV05idm1ubGZseW1pT2JXNWxIVmwxMlRiR3JPWHNIcVNrbEVLb3N0SUVm?=
 =?utf-8?B?OEJaVGlmTTEyeG5qdmtBM3grOU1PcDhCYjlGaHhEenovVGdrZS93Nzl0QnZt?=
 =?utf-8?B?SzFYblNGeTNydGtRK2tIZmgybExGVy83eFpjZFhLK0Q1K004bmZiZjFIaTZ6?=
 =?utf-8?B?Rm1Ra2JObUVDRkh5M2dZMUkwck1VS3l3MVhuWjlxSzFzZjJ3a0tUK0MrS3ZR?=
 =?utf-8?B?d2JacmpVZ29CaU02RXp2MEQ5ekpuNnZnRzZjdXhUM2dTN1BMZkRHTlhzaWpz?=
 =?utf-8?B?ZUg5SHd6ZElpMDlwZXRVWVpXM3c1RFNobjhtVmNYRVVFZUc2aENtd2ZQUEdk?=
 =?utf-8?B?ZXp5MUd3NW1LR2h5K2ZEVW80cTFGNUozK3VyT1hNV3o4akNFa0hYbmkwT202?=
 =?utf-8?B?OEpxN3BTZ1RjTXN1Y3VheThUQnVqeStuZjZSTGhPOXBEa3pKNVMzK0MvY1dX?=
 =?utf-8?B?NVNpN2FsVnhpQ3prOU5SSTVZamNTOVczQ3JUWGtMVjZUNlpMZnBoakpPek5h?=
 =?utf-8?B?NHpCc21TWWRJZU93b2lTaDVySmh3Vkc5SWVvWUhqR1FBNlluZ1paTUtIT3Ev?=
 =?utf-8?B?VFM2ZGVRYy9LVEMzaityN05TWCtlc0ZVb3E5ZTRsMU9adVNvRGVWdi8yV1lk?=
 =?utf-8?B?SjNmcVdmT2gwdTZ1NWtEOW5HZlZTckhEa00yRVE4SzQ4cG1IbW51UnZDZ3RW?=
 =?utf-8?B?bkNuZ1JRVDJLYXJacDFwMG96NU1PZC9Jc3NVc0pVQXZOb3RBdW9ib1lnMjZH?=
 =?utf-8?B?aHhxOCtlcCtKTnFuVWJNWFNUcXEyNDZkTkJtK0ZubzYwOUtSb2tYcHZTRGNk?=
 =?utf-8?B?NjJMc2VPcVltRGo2ZGJXTHBXOTlwQ2ZEMktDc2QxK0xRSWpOUGFVQ1FyVUYw?=
 =?utf-8?B?bGNteUtIakV6VjFNSGR6MEJLb3J4TS9reDBQNFJXeFg5TDNPUDU2OERlckVi?=
 =?utf-8?B?cG1oY3hMekhidU9EUkxCL3h2NFJWNXYrZTNSeG1lVnRvVzBLOTJKUUM4VFBR?=
 =?utf-8?B?NzZtK0hlVnp4Y3hxYmhUMUdYekZQMkRKeHgvQXB3dnFmeUswMHFHM3ByOEZI?=
 =?utf-8?B?Z3BuMGtWZldLek95SGo4UDVKSEZlVXdXYUJ3a09pSi9FbmVnRWZRditOSmw4?=
 =?utf-8?B?MjRjSzlocW0wZS9IRmM5RXdoUFg4clZMNUhzTG9IV3kzeDdRajM2ZmhtWnVI?=
 =?utf-8?B?bXJtclVUZXkvZXVUMzg1U3UwdW1tdW9NNU01ZVFNaE9sWlJJYWNMcXVPd2h3?=
 =?utf-8?B?STZ0dE9YRmZpOFdGUlhxUHYzT2dTYU8zeFZ1TEZSdzlSdHZZWlB5bzRDQjB1?=
 =?utf-8?B?YVhhWEpLSmRDVFFWVnV6cjRhSGU0MFB0UkJERC95Sk9zeEp5S0ttQ21GQkZo?=
 =?utf-8?B?dG5KNjlVWGNZbXo2VkJYRmpZaTJJNk5iNXhYUFYyQUN1VE1XcEJ6WDVmRkdR?=
 =?utf-8?B?ZE5PQnlmdmM4UmZSTTNyNUFQMmJ6ZnlkUHkxb1RVWFVVenZUWExhbXY0Qkcv?=
 =?utf-8?B?dXB2aDlGL2VhcWw3dVRFb3V5MEdLZURvbUFsM1dZT3ZwQWFpNUhGa2taTlNq?=
 =?utf-8?B?R2tyQzViN3Q2ZWVHOUszcXEvVkUrRHdIQmp0NkF0NmNDSE9uTDR6by95eFBh?=
 =?utf-8?B?bXZ3bVEyelhsd2pxWjFXQ2I0OGN2UDBOeWp4OE1ES0tnK0ZodUxRKzVkaDMx?=
 =?utf-8?B?Y2FpUXZlSkRLWktrVDJ4b1NxZVJOZmFKOU9iNWpCb3E2T1VGUEdydUNVVnV3?=
 =?utf-8?B?WHg5SkhjWTFueDVoNzJObnc0Q05nakdNb0ZaS2JaRzJ1ZldTdUhZYmJ2Wk0y?=
 =?utf-8?B?Vk9QTnc2MFNrMlVFN2J5NnYvUyt6R01ueGdPSFcySDZkVmFiTUlkRktiWGRj?=
 =?utf-8?B?TENQMzJqVXk2S1p1UTdObndlenlVNkF0OUFNMWVNUkZBUTM0NEVTWi9GSmM1?=
 =?utf-8?B?emJSejJUdVhZYlJNTnFRTFY2ZlUvSGRpb1RHaTluc2pDQkdFSXFkYmdCcUN1?=
 =?utf-8?B?RTdVcE5uN1NVNC9TQU92ai8vWnpZRmNTY1Vhd3U2TmtxeE1COUFTVlduMStx?=
 =?utf-8?B?d2dQWlRsYWc2ZnA1R1Rkc0Q1U1dZbXZrRkFuMXhXZlJnaUpyZTV5SlFmb25a?=
 =?utf-8?B?NE5LVTdySTIxVWRQMGZ0Vkp6Y2tTUEJacDhtR2FZKzFhK3I0T1F6b0JEdW8r?=
 =?utf-8?B?NHJGb1dwbEt3cXVvdmljMHIvQzRZNDZBLzkwN1owMFVFMmdJdGtXVm1jTVpJ?=
 =?utf-8?Q?znGEqyPeFTwkxtr4=3D?=
Content-ID: <FAB3A44014F8D9448EE6C3597618DABF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e94f7c-7495-4d8e-62b8-08da21dac0cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 08:01:04.6862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sw9jdYlJIsxpIYsIZ4zty5MukECFPZhaHY7AiRW4bTd+/Mc+omDrR0HYyWaj6+0MqEWG18MgyOe/vfZ2iPdAnwkCke2hL8kjipKv5VU3S9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_010111_210558_1F72D802 
X-CRM114-Status: GOOD (  28.26  )
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

On 4/18/22 08:41, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Infineon chips support volatile version of configuration registers
> and it is recommended to update volatile registers in the field application
> due to a risk of the non-volatile registers corruption by power interrupt.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v11:
>   - Rebase on top of Tudor's series
>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
> 
> Changes in v10:
>   - Remove dependencies on other series
> 
> Changes in v9:
>   - Rename function per mwalle's series
> 
> Changes in v8:
>   - Use spi_nor_read/write_reg() functions
>   - Use nor->bouncebuf instead of a variable on stack
> 
> Changes in v7:
>   - Add missing macro definitions in v6
> 
> Changes in v6:
>   - Remove multi die package support
> 
> Changes in v5:
>   - No change
> 
> Changes in v4:
>   - No change
> 
> Changes in v3:
>   - Add multi-die package parts support
> 
>  drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 952db7af6932..6bcd25180af4 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,8 @@
>  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V               0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
> @@ -117,6 +119,64 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/**
> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
> + *                                      register.
> + * @nor:       pointer to a 'struct spi_nor'
> + *
> + * It is recommended to update volatile registers in the field application due
> + * to a risk of the non-volatile registers corruption by power interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> + * also set during Flash power-up.
> + *

cool

> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
> +{
> +       struct spi_mem_op op;
> +       u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;

no need for this local variable, use the define directly

> +       u8 cfr1v_written;
> +       int ret;
> +
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
> +                                         nor->bouncebuf);
> +       ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);

can we use nor->reg_proto instead of SNOR_PROTO_1_1_1?

> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +               return 0;
> +
> +       /* Update the Quad Enable bit. */
> +       nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_width, reg_addr, 1,
> +                                         nor->bouncebuf);
> +       ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_1_1_1);

same

With these addressed:
Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> +       if (ret)
> +               return ret;
> +
> +       cfr1v_written = nor->bouncebuf[0];
> +
> +       /* Read back and check it. */
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
> +                                         nor->bouncebuf);
> +       ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] != cfr1v_written) {
> +               dev_err(nor->dev, "CFR1: Read back test failed\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
