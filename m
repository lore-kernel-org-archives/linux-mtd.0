Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6244AC43217
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Feb 2022 10:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHB8E2AGuJyqBD5F/T4EgyXWS2Xl59G4FggAnAsB9mA=; b=i3SWtHs9VMDR6/
	YnGCU6NRrR+IcYRNuokZ5oUQopRHWM7iMrWxtgJ1maBkKYMeHxKnNC1VDQHWT11h3FxKW19IGsS3q
	cNtOjaw+a72vN0qL/bF/Ahs6rslVCQmM3qTsUO0f+MAyIkpcaBasH7bK2JieYd/CwaBljnsfic8Uo
	/33aUzjoUYwhm8Qhkf4Q4G9IrHEc8zS66zjScFtG8DqWzKMFIZhsh+bX3LGjPPw8Yzy/5AFgYu3pq
	ez7hyjx/NZ65EVhp6+AuDDtzGSdL5WoFqG3raEq4JdJ4z2gDgm7nloMBaXsNnFa2/IoHMECeIIwOa
	ckvlzDjFnT0SbXpXoaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNBM7-000KNP-RT; Thu, 24 Feb 2022 10:28:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNBM3-000KLc-NS
 for linux-mtd@lists.infradead.org; Thu, 24 Feb 2022 10:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645698492; x=1677234492;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oB6aD4logKgd8smP86L9cajChkgH3rgSDNRDovqdzFM=;
 b=Acd3XdvR79oQKJaIbLb60vAbdnBol7wT4dmdH3+bltPnBU6S2qXAOxRe
 b7F3s6pQtJGen90uD1/14Nl3IaUTllVGmPSOwMHdQDZTiyU0eeytxuckd
 Y6umU/KKcqS3GPI4trDWPrEHycCOfIjicz3REu9dcnyK6YiHhMjanxQCH
 rsxPebRniViAV4WYJAc7Hbr6a+gDqYD4lUCTkksLC7yZXoHHAQP7XxOOk
 3G9Npr9cwuqN38vAwm9YcmqorR9iptgWMyFfpqPkRHteW0boImzCzEuyY
 LChycdKbBD51keB27r+xlwzE47YLfzt7DoL+bScabkD6MUvo81WjxOL8i w==;
X-IronPort-AV: E=Sophos;i="5.88,393,1635231600"; d="scan'208";a="154241541"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Feb 2022 03:28:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 24 Feb 2022 03:28:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 24 Feb 2022 03:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obh8qdMU6W1ns5OS7W4S3kIlKvlMbCCLlXHxtwWSk/wNzYxVHevfntlWPLTVrYPBcVUGK5oQeUW2xDsBjToQr4jaZY3I3RCclDMTvssYLZMISkD6OEpZvPBEjsoSE3D83vfdrsdR8S008R1aKptREHl5MvJnaiEmq0x6hgjF6A6yu3++uxUAr07kPvgX+8Nky7tDfYwgFWzDRW9i/y2s6auR6vd9vLv0UAIJSUXC6ZiOwf1MFD1XXXLalHPECvVS1KCrhp1C43+TFz5gkhsQewo6UkAvFHJ3lUltu+N0fcXaubJ8MhgO4sfdXaEFyVM2jPEL3MFppWIqVUSFaRwsAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB6aD4logKgd8smP86L9cajChkgH3rgSDNRDovqdzFM=;
 b=DWgKq/4Sk6oQLOLDzOeXeczyxF9bX4pOa3Pkp1dnJPV8YwsuNX6RoAumnDI1Wc2Hvzh8fdM1W2HQ2+NF02R51ayCwYwpU96e4r54nYWIlrZhmLqKG/fqvWH8ZS5/4k+lCL/X+3Y7/3bRnX+skwrVgItBX9A3p/3FGcZ9TngEoe08YTBMV2e7Qh8HpV9axO3J2DHY2umSq6m4M9drcOpgYHoZJwVst104tJNdbvc7X8sgC3zOWfZCKtp/3mMlFW70dgU0aurngxwABhLYIQ/TE6OpVLeld0lbGfRUScspsHr6ENx7kXbQElBN1MD4Mk4XUK4dI/TEDM5XpJkAc89JfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB6aD4logKgd8smP86L9cajChkgH3rgSDNRDovqdzFM=;
 b=lqVahFq0w+BoKD+2Ex3SSW/9iJsQTfywN6KobwX0tsXhNyoIqXLJr3LI+xks0R0YVuefJf6+Tyb88dDQmc4QetGw+L2xwxwtEXukq53rteijulGLwRjt4h/SmWDEyJspQiX1m7EtOCKK1ejBbsKsXeezEe3z7VtGNIfzgIBN55s=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB2873.namprd11.prod.outlook.com (2603:10b6:5:bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 10:27:58 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.025; Thu, 24 Feb 2022
 10:27:57 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <p.yadav@ti.com>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Topic: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
Thread-Index: AQHYJ/PF9hATniilJUe3fAFeGB3/Dw==
Date: Thu, 24 Feb 2022 10:27:57 +0000
Message-ID: <12107fcd-eb74-4c71-25c9-1acaeaf45ea8@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
 <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
 <7cd74ef3-5a7d-4e65-3436-ee3399ca56a3@microchip.com>
 <e39d06684b8f3a63103f40f0e99e030e@walle.cc>
 <3cd510ad-a6ab-d4a0-92e3-9156a0c7ddbf@microchip.com>
 <20220223183849.xcwciv2ybnkdnauk@ti.com>
 <6eb179ec-0b12-de30-829e-83ec6b964f21@microchip.com>
 <779069a1-7389-ab70-9f03-81090d0600ba@microchip.com>
 <a85e2d1862cfff477e97c39509b2b74d@walle.cc>
In-Reply-To: <a85e2d1862cfff477e97c39509b2b74d@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ed1474d-0e31-4c04-8064-08d9f780538d
x-ms-traffictypediagnostic: DM6PR11MB2873:EE_
x-microsoft-antispam-prvs: <DM6PR11MB2873279DFCC9CF042F931DABF03D9@DM6PR11MB2873.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2hiucZyi2/CAH3fgfB2zLaFw5/zucQwVlbPrOVFhvl7WxfYhNdVPRJ/y7kJm6ZJwSqH2EgHKmfzM+izS854NhyzlvNu8RuR/yQBgRLY02MZkPoV6kWxinL4JGqjhEcrQcmXF6xNQqgqPM8aqWYxA9E2Bi/lUyXkF/gH3HLo2JC7WhQzYIesrnmA0zqvkCWn+P2JO5kTskQdl4wl0U4GkRq3QfryGbTnLGvsdsTTwr/aDQ/C21TFgvLnL7WnfaSkU9QpmqgYeeNq3LoMOm+q8rUMxOG8NxaVuwA7jqyQjuTdJli1n5ZXdqnSV0dx9mYARe0zBPxdo3gWThiAq8Jf8KXCsZOjOHjTsnUnDrQavqryDm6oMktgxZPpJmqhHPWI14UtqzKb8x3DbGENKzXs3utTH9uHtwXj4YlitJDozTHALYpFXlkVZUdoX7BU8v51uKd83hVBay2yqP3ViYKBzZutC451TvWHPzLhsgREqbN6ARlG8kfMSpvpTH7XMiHiMhPC0rC1QIrSGvOK4Eec57NAiZhi/GfgCDxMFAFub22dQXwHcXd4fq8rHHvIuqYs49DAiDBJZKiiW71X7Bo1a63jqzbz89oRQY8P0a4s3OAmSMRWxUfNv4+u2ppm6pKsa+w7ZBp/rrkhHMrsIc9+b7FJwMzRQGwhiwPNNHe0CydLg7MAp9Lu7BPuUamq6ZSd1wDUlFu1vbqvyJkiHIz8EBSHXa1/Vbfy11hI6m4YchPN5SXpWbdnZ3IJufnZksa5UtB4Of7KaAu8HXPqh8+8yBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(38070700005)(5660300002)(2906002)(26005)(7416002)(86362001)(186003)(6486002)(36756003)(31696002)(508600001)(83380400001)(38100700002)(4326008)(91956017)(66946007)(8676002)(76116006)(66556008)(31686004)(66476007)(66446008)(64756008)(6512007)(2616005)(8936002)(54906003)(53546011)(122000001)(316002)(6506007)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnFwZTNGMFMvTUd4TkIvK2lELzIvR2N3c1B4TExDdkFQZEJJT3RlZFNHMzhM?=
 =?utf-8?B?V1N5V1ByZjU1cGhzWWlRNFB4ZzVJNGpSYlRpUXhSMUk3Nm0xMFQ2THFHUi95?=
 =?utf-8?B?NkF2bkUyMmJ1c3B3a0ZoTFRrQjhzY3ROQ2RINGIrNWxPYnNzYm5wWnc3amd3?=
 =?utf-8?B?MW45a2NqODZOdzQybGZySTZBOCs4NnFFVk5NbEk2Y3gyZTR0Yzl0cmlOWjR4?=
 =?utf-8?B?UzBDUnN0bnI3ZWE1eWhDbVl5akhEMEpRdktlRkgyM1BXOFdqWmtKbVhWT1FT?=
 =?utf-8?B?WXZ5UEN2UlE5cU5pV2tTVG5UaE92cC9NRnR2MmROSWpKd0QxUlkydjBpeUFK?=
 =?utf-8?B?VktLVklLRXlWMGFDYnhJSSt0a2kxR0hvWTRJZUd2UmZqSnBhZGNFQ1hrMkNk?=
 =?utf-8?B?R01HTkV2QmQySTIwb2FlQTc4RkJyaGxQdlA1ZEhUbElXMmR6Umt0cXpoMHRV?=
 =?utf-8?B?L3pZcFhQZitsZ0RTV3JFQTlzUHRwMTFjR2hpM3ZDUkxLMUNJamVMeGRTZERX?=
 =?utf-8?B?VTFlMUlUallwZURJQ1Y3aFpYZnNZZWhhbzZQTVpVWjYzN3k3YUFtUUxhdW50?=
 =?utf-8?B?VFhNQWdHYTkzazJhTWx2d2FkdUIzV1lJK2UwUDZ1QnJ6Y2lRTy9salRqOUYw?=
 =?utf-8?B?MGZHSFpWRlZGNzJDaXhxRUtUTTBBd3VaV2V4MTZ3azVWYXVBYzNXdEJST0tM?=
 =?utf-8?B?dHE0dUJQUmJKZUc2R29JYUt2UGgzZkRGN0wzTWdobmV1cEl0U3ZybUxRclhl?=
 =?utf-8?B?Y0tBdlM0WFVJQVBLY0ZLKzRqa3FrS1BkYUkyRDNGV2dHNnppemhnVkpHRnZo?=
 =?utf-8?B?bkpqY0haR0NVOWxRQTY0OEE3RnVKVzFLVDhmK0thMkthNGJscnR6b0ZmQ0lF?=
 =?utf-8?B?M0NzSTV4QWdvUnlaMDhSVlhuMEFTb04ybVdXN0FJU0FpM2xWM0lDVU1UUjMy?=
 =?utf-8?B?S09yN0dQcnV2ZWlCWFFnQkgyam1EbFVxMys2M0ZYMkZJNU52SThKbmtZNkN2?=
 =?utf-8?B?dlAxZFBFMWdvQUpPM2dZOWU0VVE5c2JBZmtYdTZzd29CYVZSb3FzN2JRZlhH?=
 =?utf-8?B?RklPQ294OWFjWlBiS1I4eU1PMjdPS0xWUmpRWHFQUkpBdWhzdWw2YWZsY283?=
 =?utf-8?B?WnVMcTd4T0t4ZTJkYWtkK3RqbUtKS2JHNnV0MlJZaUtPekczRlJQNW5PNmxD?=
 =?utf-8?B?Zklha2JZWXRBVUZUYjVIcWRhZGhQU3NxWmdUNmZRbCtLb2NTMCtzUmw1ZmxV?=
 =?utf-8?B?OWJwdWFqeU5sS1FRd2xPb0g1bjFKQmU4eVl0c0k1TytqS0xzYnQ3aVBYb2J5?=
 =?utf-8?B?ekRFNjFmaE5seDEzSDNEQlVBdGNLbStBME9XbDZqaDFva0k0bkJXOVhyN1dt?=
 =?utf-8?B?a3h0emErY0FHTVhMM3FQMmVCbmJNWm9FdWJUdTl6RSt6TXQrZHVZVXVDV0s5?=
 =?utf-8?B?Rm9VdCtSRkVUVHExZFpMTlFVbXF5b2FmOUJjRm1QQ0lrdDVrTytJODZCVllT?=
 =?utf-8?B?VU5Tc0F5TitjaW04NG9SQUZHeTB1Z2pLUEJ5OUR1ZmdiWFFTU1ExdjVjdGww?=
 =?utf-8?B?N29sbEdrZ0dxbVV5YWRTekNOVzZRc2M1Nk13RWVXbmVHcG5pc2ZHS2tFd2x2?=
 =?utf-8?B?N2VrelZMa0RUNGtpZHcxVDY0KzdwaWhrVkViVExka1FndjlUV20yTzgxR3Ey?=
 =?utf-8?B?UXZMM0dndkVwYmcvbVUyNWpwTVNHc0tIZ2R0Z0VNeG4yc1VtckJaV1pPelVY?=
 =?utf-8?B?clRLbmg4V1NtL3FPYktlY2xSYVl6YmFwNmczb0ZTQUc4alY1WFNsL3lpaSt3?=
 =?utf-8?B?QW94R3A1Sk5YbGZoSFEyTjhFY0d0UTVhZ2NtZ2VLSkFkM0oxeEN2UlRqYUx3?=
 =?utf-8?B?SkZ6c3h6RnA0RHFsVmN5RlQwUGNOczZZV2VqSWdORDJqdUYvOTRjRWF2UFg5?=
 =?utf-8?B?S1VuWUI5bEh4dU9hVVFKVzNUOGQ0cUhKOUQwRnk4MU9VYmlaSUwyY0o2dXVx?=
 =?utf-8?B?VEFSdTVLVXhZT1pOZS9TM1htRHdCMEJHUTI2TTlVUC85d25ld2ZSUzZWMkhP?=
 =?utf-8?B?Tk5ici9HZ0FEMUQxYk5wSC9aSFIzaEVNL0duTk5OVUt2bjkzbGpVajBhK1VE?=
 =?utf-8?B?SmcvSk0rbnM0dm8wbmZrekNKcC9RWGZNZUkwRThRUkRTS0ZjSlBob2QwY0RW?=
 =?utf-8?B?a2x4eXFqeW5kQ1FQU3p0SGNKY3J1VEd3dUNMNDZ4ZUt4Y2pUYVk2akhzYTl6?=
 =?utf-8?B?dVdSZmo0T2k2dkdyc1d3S3ZZNWJBPT0=?=
Content-ID: <B68AC4464DBCDE42A8F61609897804C9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed1474d-0e31-4c04-8064-08d9f780538d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 10:27:57.8043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R5diOscLoqnBPmhYI8J4LhbIMCz9OEvDk+Xnb3ULmDcdmPxohUxBdVEu1sbvkxQUKSYLf94La9m6y88TTEcsLWidYC+4qFRKtrTGbKD4jWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2873
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_022811_895111_26277C0A 
X-CRM114-Status: GOOD (  16.78  )
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

On 2/24/22 11:37, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Am 2022-02-24 07:37, schrieb Tudor.Ambarus@microchip.com:
>> On 2/24/22 08:08, Tudor.Ambarus@microchip.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>> the content is safe
>>>
>>> On 2/23/22 20:38, Pratyush Yadav wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>> know the content is safe
>>>>
>>>> Hi Tudor,
>>>>
>>>> On 22/02/22 02:43PM, Tudor.Ambarus@microchip.com wrote:
>>>>> On 2/22/22 16:27, Michael Walle wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>>> know the content is safe
>>>>>>
>>>>>> Am 2022-02-22 15:23, schrieb Tudor.Ambarus@microchip.com:
>>>>>>> On 2/22/22 16:13, Michael Walle wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>>>>>> know
>>>>>>>> the content is safe
>>>>>>>>
>>>>>>>> Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
>>>>>>>>> On 2/21/22 09:44, Michael Walle wrote:
>>>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless
>>>>>>>>>> you
>>>>>>>>>> know
>>>>>>>>>> the content is safe
>>>>>>>>>>
>>>>>>>>>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>>>>>>>>>> Fortunately there are controllers
>>>>>>>>>>> that can swap back the bytes at runtime, fixing the
>>>>>>>>>>> endiannesses.
>>>>>>>>>>> Provide
>>>>>>>>>>> a way for the upper layers to specify the byte order in DTR
>>>>>>>>>>> mode.
>>>>>>>>>>
>>>>>>>>>> Are there any patches for the atmel-quadspi yet? What happens
>>>>>>>>>> if
>>>>>>>>>
>>>>>>>>> not public, but will publish them these days.
>>>>>>>>>
>>>>>>>>>> the controller doesn't support it? Will there be a software
>>>>>>>>>> fallback?
>>>>>>>>>
>>>>>>>>> no need for a fallback, the controller can ignore
>>>>>>>>> op->data.dtr_bswap16
>>>>>>>>> if
>>>>>>>>> it can't swap bytes.
>>>>>>>>
>>>>>>>> I don't understand. If the controller doesn't swap the 16bit
>>>>>>>> values,
>>>>>>>> you will read the wrong content, no?
>>>>>>>>
>>>>>>>
>>>>>>> In linux no, because macronix swaps bytes on a 2 byte boundary
>>>>>>> both on
>>>>>>> reads and on page program. The problem is when you mix 8D-8D-8D
>>>>>>> mode
>>>>>>> and
>>>>>>> 1-1-1 mode along the boot stages. Let's assume you write all boot
>>>>>>> binaries
>>>>>>> in 1-1-1 mode. When reaching u-boot if you enable 8D-8D-8D mode,
>>>>>>> when
>>>>>>> u-boot
>>>>>>> will try to get the kernel it will fail, as the flash swaps the
>>>>>>> bytes
>>>>>>> compared
>>>>>>> to what was written with 1-1-1 mode. You write D0 D1 D2 D3 in
>>>>>>> 1-1-1
>>>>>>> mode and
>>>>>>> when reaching u-boot you will read D1 D0 D3 D2 and it will mess
>>>>>>> the
>>>>>>> kernel image.
>>>>>>
>>>>>> But you have to consider also 3rd parties, like an external
>>>>>> programmer
>>>>>> or
>>>>>
>>>>> Why? If you use the same mode when reading and writing, everything
>>>>> is fine.
>>>>> I'm not sure what's your suggestion here.
>>>>
>>>> So our stance here is that we don't care about external programs?>
>>>> If that is the case then why bother with all this anyway? Since the
>>>> swap
>>>> happens at both page program and read, what you write is what you
>>>> read
>>>> back. Who cares the order stored in the actual flash memory as long
>>>> as
>>>> the data read is correct?
>>>>
>>>> If we do care about external programs, then what would happen if the
>>>> external program writes data in 8D-8D-8D mode _without_ swapping the
>>>> bytes? This would also cause data corruption. You can't control what
>>>> they mode they use, and you can't detect it later either.
>>>>
>>>> I think there is no winning here. You just have to say that external
>>>> programs should write in 8D-8D-8D mode or it won't boot.
> 
> IMHO it should just work that you can use 1S-1S-1S mode and 8D-8D-8D on
> the
> same flash. After all, that is Tudor's use case. The ROM access the
> flash
> in single bit mode and linux in 8D-8D-8D mode. Maybe u-boot will use
> quad
> mode in between. All of these accesses should return the same flash
> content.
> 
>>> How about swapping the bytes just at user request? Maybe with a
>>> Kconfig
>>> option.
>>
>> Michael has suggested on #irc to always swap the bytes: if the SPI
>> controller
>> can't do it, to do it in software at SPI NOR level. I don't know what
>> to say
>> about this, because JEDEC216 just informs the reader I guess:
>> "Byte order of 16-bit words is swapped when read in 8D-8D-8D mode
>> compared to
>> 1-1-1 mode.", this doesn't look like a hard request. The downside to
>> doing
>> the swapping in software is performance penalty which will make
>> macronix
>> users have second thoughts. I don't have a strong opinion, but I lean
>> towards
>> doing the swap just at user request, regardless if I do it via the SPI
>> controller
>> or in software.
> 
> Just having and opt-in will be a mess in the future with flashes
> containing
> byte swapped content and we can't even fix it and we will have to live
> with
> that forever. IMHO right now is the best time to circumvent that
> scenario.
> I don't have anything against make it user configurable, but it should
> be
> an opt-out.
> 

sounds good to me

> I haven't looked at any controllers who can do 8D-8D-8D accesses, maybe
> most
> of them can do the swapping on their own? So if you don't want to
> support a
> software fallback, then we should just say this mode isn't supported if
> the controller can't do the byte swapping and we fall back to a slower
> mode.

Software fallback or mode downgrade - both are good ideas.
Pratyush, can your Octal SPI controller swap bytes on a 16 bit boundary?

The only debate that we have is whether to always swap (or downgrade),
thus to have the same byte order as in 1-1-1, or to introduce a Kconfig option
that will opt-out the swap, isn't it? Kconfig is a bit uglier, but more flexible,
and we still don't know for sure if the swap is mandatory or not. Can someone from
macronix shed some light on this topic?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
