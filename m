Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCD5C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UP+LPr4hyfeGgawgZLQjQY6C+K+6tcIX0Crdw+Iptgs=; b=KhzqtQMAVgjieN
	CIfCBDfK1hOoF1+ut9H8WfStwYRBDQXMrE6GrqYjGXFxNRyRK7v/EkZpWl2wD3dUvaOOJlyZBpAT3
	t7QViG4B96mColxXOSqhgmYC+pU4gyTj1T10FV/cekisFPg7dLKnHyBGwBMsdQ5xxARI/Dxe3bTLP
	sV6fCR4Gwkjp3T/Q03bOs67OsJGPZm0tOPa6C0yNt651QofQ2s1E43/Jvy2voinfEWmXuAS5ARJ4U
	MzE0ryCLtDeaWck+UJ+LRD1I7Ve1OD2errTttRq5FEocbZ2tBPxGeNU0x7+6vONJJcJbNPLTYybS3
	4ko7Pa0hpoNpNoXSitDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI06s-002QUF-Md; Thu, 10 Feb 2022 03:27:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI06m-002QSV-IQ
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644463620; x=1675999620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YBkOBzHHjdL6Aju8thF46Ln1HMvxAfOfU+/detA1Uxw=;
 b=map04NaIi5dFQDCBEcA1byyOcEQrMuJp5s2BRSODu1Enq7ogiGfI6zs9
 wOUstYrXvFjSww6M1XZQ+GxA8joQol/sZTQCEdBxN9vPzTfC/3TcNwW78
 9jRCH0gDF9TSOhQugUCmsb/I7wfDUm9J63NLnGZbp8DPccW5BgeLymfIl
 rv+KpQzVYrxYiuM0iResMzz3tcIWW9GBycZ3Nk7AtFBQC0dfZqI3VSCbC
 mpdCMbUFpHe2BAcdyHRWjweMHQDxySCfaYXnfUzqdwEAHw5rLpZhbUdLS
 ZQ7QODWYubSjClR71hvOwuDNajCA3TyEd1atQElVMJbNHOLBdZh4lVdJg g==;
IronPort-SDR: 6PFezoEeHtCQNnK1PLV6+OsjErX5O+mEFWPhWNu3OomWcp8BUaoHzXRBdnDVovuPtvRd5qzEoQ
 yIXQGiRnopxSBGEpwepoew6su6x9OVK6238dKtPeYE81frW//tvxpzLXZN/OR1mGRZ+gLMWCMx
 rx15K/if22cx4wk2TQmNTzEXv9Z5vjq7pka2Vq5nzI59Ow7D/XAQgGvKKfyYf2Pv339Yg7uNVA
 TLSPZ+lKyDr4QrZuGuOpS/J72N3wTOhvVEw1fk9En16UnAtY8ti8r8hMpT1RZpx6F1AjL/nqf5
 N0ozTJYiZWiTZw8uQK2g6U59
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="161730212"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:27:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:26:59 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 9 Feb 2022 20:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9szWv9PmADrn9N3D4f/ozNNlWsnZQuxQYRLNcLiGUlHEnKcmebZNNiFfgHgv+KTYxCivkmRveu32mN3NrjIAfCST4IHu7a3otuApJy6FoC+9j5okNv7HLFZN97VJ4kECKjrqij9M5yQh5XI+tJZI69JKxSnxX83vjQAsQ14k5Cw7elB4z4U9sChjn2kPtcXrpH55SqWxngivDTVrP478rerI8dxomRL/iq8JkGvDj6/h/Of4oOh6AdWbKgdtnkAY8a1WExT+cImly0A4RVTkGS8ghFS57rLFRXiig3iafvK+R671b/jK4Ukx29pNtC5P054Pep/2D2TOoeiYPFo/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBkOBzHHjdL6Aju8thF46Ln1HMvxAfOfU+/detA1Uxw=;
 b=iwbe0h2eYyqdFjCxxutA3DTTD4w6lVUVNvO+hkx5g4kj+a98LdajhHYZVsX+8KURohgpH2tyKXMrVWHurJt4sLxj+NVr4fgShP7xcbxR2Gw3j/UVRj2nfvSrlvyz37PQDpD0X6PEp5v00nQmv5d1YJw7V5r3Qv8rDsov/kBbXK3oM/X8gvOTbHaOSR0je2Zrfcb0AK5kn1sISUsQwcHxRckpLuMM6tg89sBc9O6CeVhjS0ZhiJ2zPuxsp+3orKzaoiClGtZ+GiWgk0ReaGh9WBzPRlNQfjixOoC5up5Pwflcaa9AIrJ6CEAPjxWZo09ffwsYhzPZlaUWHZ4T8UPisg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBkOBzHHjdL6Aju8thF46Ln1HMvxAfOfU+/detA1Uxw=;
 b=iOwobr30TiRHEXiIkx2nbtDW5iP38bkntp4PETjlPMKvLBq8yBDrwDBZL7jsJWGfZ4SY+58jVAuYk7VpFZf5QFqdC0chzMImjON1ZxSzss37PhPplYXuahwAwNVUU75c232+WuxBRZpuEbb15zH/A5w3EC8RZ1O+/698WbuFRkA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM6PR11MB4315.namprd11.prod.outlook.com (2603:10b6:5:201::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 03:26:58 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:26:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 11/14] mtd: spi-nor: spansion: slightly rework control
 flow in late_init()
Thread-Topic: [PATCH v1 11/14] mtd: spi-nor: spansion: slightly rework control
 flow in late_init()
Thread-Index: AQHYHi4PW04boVsuWkWWgPyXciUsWw==
Date: Thu, 10 Feb 2022 03:26:58 +0000
Message-ID: <f004399f-36b0-2099-b2a0-8ab0ecd114b7@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-12-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-12-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79bea0cd-c9a2-4a17-bd98-08d9ec4531e0
x-ms-traffictypediagnostic: DM6PR11MB4315:EE_
x-microsoft-antispam-prvs: <DM6PR11MB431528DA90413BBE5DB98D51F02F9@DM6PR11MB4315.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 96rYJNeUmiUpaD2A9Q2VXH3tV9bzXM7ZE685OIcMmFCCdL4zAmd0dCutOfbidXWYJeiQ1Scnjx5xplYAe5gdvvtMCqT+Wgqya4tZaQSqxSebGDFPn0HbJR9L8QLxC9v15gsHLJL+RibAsX5zUpLByjfgDlcwa7qKdRPBmUjG5RRBdC5JC2cDaJhQfHfDv+0Sv8m3/pt3asO6Hab9qhytcN9LpqXzH3goP0ZtvbMl5bTd8gqBwRkzCOiWDiS1pZk9NN2i1P7BMPtrMQ8+DHR1mbY+7X3AkwKLugfsSmDL7hMcZl/QAp5fFYljl/pgO3bXKi7uVUvscx6tCciiJDjT0o7uYXOLCjqDPY8OiQBu1vGtZfeyaljRiEmHiwQ/uG9LPHdkZiHuPHYxqy+1DSOA/+lCSW5P230YYMIJiNFhRmlO996SYSKgHpklDr5L8AScOnamxVUdJqvLl62FpzcBtYv621cxck+wWZuYc2m9YPBFr7obw8cALdFMw1pSrIg/gmWvd0z0/6UEzA0yzYRCACsdBYkqTgt0zzgzvSRuUyTXX1Vl7zqL9bC7K52+YETwv4kGk4VsTtmndye/YEnFrrGbRJa/NeAf2lM5jY4+/1mr78mwLSuh8qUBvxNtDSP6YLdxK0iTgEH7oJ6iOONUXgS1g2Eu0LtxkG2bpCt4V5ooFA8Nd15vUVpQ8oGlpx8TTYratmwuxRtZ8ZZiTB9Yc/5GW0+XDJ41EcJ7TDUDeLhspfnXtyJxGfTRdYTcaRaadgTaiMG8W7gTaY7QqWahwg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(5660300002)(110136005)(66946007)(6506007)(6486002)(76116006)(86362001)(31686004)(53546011)(83380400001)(316002)(122000001)(91956017)(6512007)(8936002)(66556008)(2906002)(508600001)(31696002)(8676002)(38100700002)(36756003)(71200400001)(4326008)(38070700005)(64756008)(186003)(2616005)(26005)(66476007)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2ljamFGL3YwS0RDS0ZlMm9JaUtkMWprYmpPZXgvZFBBSkF4dzcrMlFmOWh2?=
 =?utf-8?B?eTE1TUovYVRiV3pCTE56dXNQeWU4L3hWZTYzT3h5RkpDQXF3SWh6WE0yTE0r?=
 =?utf-8?B?aGp5a3liTmg2U0plV1dVOTVVTzlhYk9aVXI3UGxDVEo3MDdoMnZlZTg2ZC92?=
 =?utf-8?B?YlJCTGNoTCtNNHNGVUZwemN3eWtYRzdoKzNJVmVKZzFsMlVCQXIxOCsvYXB0?=
 =?utf-8?B?QTlOSGVibGFtVXBGSEZYdUpiSmlGM2tqUExRR0NhYmdxVlcrY0k5bkN4L2cz?=
 =?utf-8?B?RTVNM2RWT0gyVVgxZ242Ty9haHNQcFUyNzY1M1lnTi9vSk1rWldMNDkrMVov?=
 =?utf-8?B?S3BHeUkvQ0pLdTBMMGt4RjVZSzlXOHJIaWNBcXZDeno1WHR5NFkxOXoxUmVl?=
 =?utf-8?B?RUVPbm5MMTN5dzhVRHR3R1BBRUdobVpONlMxdTdsa0lCZ3JKcVBYOVlOMVQv?=
 =?utf-8?B?ZTFGVGYwUFo1dDF2MGdzZ3hLeTVGTU5KLzd0UjFTUUxsNnZCaXJvWjBnRG1j?=
 =?utf-8?B?dEV2Q2xGWkp5VzYwckdlK3FNLzY2dHY5c1NQUVZSSFJROTVQV00yMmdqNU1q?=
 =?utf-8?B?TU9XeVA5Nmxsd0hYeUhuUDUvUUtnU1YwdDQ2WFdaWlUycXptQTV3VGJBMFE4?=
 =?utf-8?B?MjRXMy9pUmN2Y1RUa1Q3d3p5azJ1M0tvT1FRV1hLSTh3OHlDaUJOT2NqSWlS?=
 =?utf-8?B?eFhGaGZMVE83d0I3UEhjTnJuOE5yaWZnSE15bTBZSzMyeHVicklOM25HZERL?=
 =?utf-8?B?UHBZWDhhM0dVT2E4TFhoWmplQnlZVTlhd3NYektueXhha0Ewa3lvZyszZC9i?=
 =?utf-8?B?T0dFMkoxakxjZTZqRVdrZnFwK0d5U3BRV1lZcjJoVGJEd0tIVWFrU0IvWEUz?=
 =?utf-8?B?MGVBaExpOVg5bS9XVE1oc3RpV3piNW10N1dvOE16bC8vNm03YXdsc05VMkxG?=
 =?utf-8?B?RkhxOUp2dGM0WFBTMkp3cE1ZcWNBdWV4RUdiTDVMSG1nRjBUWDh2SzNGRDRt?=
 =?utf-8?B?UzlXNUM4TUtVSHowNXdxcjdhUW5URjZRMEI2bVRja2J0ZDNyM2U1QWtscmJh?=
 =?utf-8?B?T21MYzM4RzFreUtNWURlRDhKM2NWRWdTeGFTQTNuSFRMNWRENno4cHIvWFdz?=
 =?utf-8?B?Mm1VYnBPNFZGRXJvdGRiOGlTWkRZR21ETTEwRWdmRzVwZWpVWWVxUEk2RGVV?=
 =?utf-8?B?YW95UXFLd2gxQWNtWWYySmlVak8zTDBKaHBPYXE2YXlNeVVwTlBwODNsVS93?=
 =?utf-8?B?Q0VFNUh6YkxjNzNnWFlkNHVPb00wQ3JybVMvS0NUalJoY29TYUpTSlhCVllw?=
 =?utf-8?B?R0ZnM0tLc1FqTC8zS1BvemxjeFZPL3lzQVVBa0x5LzRmS3lhaXNaZFZ3Z3c0?=
 =?utf-8?B?WC9hMkZ1cEpuaU5McGU5SzQzZTFsZ0V2dDBjTmhNMG1IM0cwNGFEeVFibFF1?=
 =?utf-8?B?SUJleDVQSGRib3FXMlJUY0lBSG8reGN0c2pGbTh5Qzg5eWE2WW5pZXVwMFRX?=
 =?utf-8?B?UTJRU2h4WDlPWFFRUkd3M1FIVWsvejFYRWIxazhYcUgvTmg5MEd2UUJCc0Iv?=
 =?utf-8?B?U1krRU9yMEtXN3dnaCtYTW1sa1o2Mk1YTXVYTjZxOGRINmxnYi8vd24rSFZw?=
 =?utf-8?B?YU9MbnUxVjM3ZUFLaGJxQXljckphZnZyb1pacjlkSjZFNkRQdmw3WndZZDNo?=
 =?utf-8?B?MVkzRjMxMzJBZkpnc1dxVWp5d09jNlFFQmNvZDd2bW1BWGQ1MjEzZXkwSWYw?=
 =?utf-8?B?L0tMTW56RlhJSHNwaTRjdjl3WW52dTRrTDZqZ243YzBmUkM2aWU4RDdoS2hE?=
 =?utf-8?B?dFQ1YWNabDRINHJmTkRwMjNGMmtqYityVFUrTDBaMG9rdWwwY3RYK0tuNzZo?=
 =?utf-8?B?UHZGeGJ3UG9zUWRoWUhiWDhNWUNVNmJxaU9rbU9PTlY5L0pXbXJkTDFsZjUr?=
 =?utf-8?B?bHpUb3hTcWZYazlNdURwRFdjMFhldzMyWkxnMTBtQTJDdzRHV0Z5bWhiVjM3?=
 =?utf-8?B?WnJ6T3d3c0tTOWl2V1VaZEYxcUpBdTRRWGMvZnlmT004RGw3alNsVXdlU2Q4?=
 =?utf-8?B?aXlZdUpVOWRPbGtFd29NUVRsTVlZZ1FkK09QQlY4U1ArU1Y1T1FYckVzWUtS?=
 =?utf-8?B?MGZyN1E2TU5rZmRoUWhVd2U0SitNcVF4SU5WYWdGNUtvOVpLTXpkZmFhN2lk?=
 =?utf-8?B?VitPOFM2aUY2WCtaNVdOcFNuZVh6QzZxV1BTVnhPSU1Xb1lsNlhZZmU4ek40?=
 =?utf-8?B?dWhZRmJFb01Kb1RQdW5CeENFUjBRPT0=?=
Content-ID: <E6ECE5C9193D57458F216BDB8131F646@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79bea0cd-c9a2-4a17-bd98-08d9ec4531e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:26:58.2721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wpLTk8fO5tmT8+cMOXGHtwpEuJEChl7otDkC7bi/wTV3Qi1fufc9fIJlcYmMea9qeKcJt9QDCFECQ49+QNC2YxIL055rmJnTrxfJOmaZPNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_192700_662106_B65055F4 
X-CRM114-Status: GOOD (  19.53  )
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
> Increase readability of the code. Instead of returning early if the
> flash size is smaller or equal than 16MiB and then do the fixups for
> larger flashes, do it within the condition.
> 

mm, no, I'm not sure this improves readability, I see the two equivalent.
The original version has the benefit of no indentation. Pratyush?

> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/spansion.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 534196b1d3e7..dedc2de90cb8 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -296,13 +296,12 @@ static const struct flash_info spansion_parts[] = {
> 
>  static void spansion_late_init(struct spi_nor *nor)
>  {
> -       if (nor->params->size <= SZ_16M)
> -               return;
> -
> -       nor->flags |= SNOR_F_4B_OPCODES;
> -       /* No small sector erase for 4-byte command set */
> -       nor->erase_opcode = SPINOR_OP_SE;
> -       nor->mtd.erasesize = nor->info->sector_size;
> +       if (nor->params->size > SZ_16M) {
> +               nor->flags |= SNOR_F_4B_OPCODES;
> +               /* No small sector erase for 4-byte command set */
> +               nor->erase_opcode = SPINOR_OP_SE;
> +               nor->mtd.erasesize = nor->info->sector_size;
> +       }
>  }
> 
>  static const struct spi_nor_fixups spansion_fixups = {
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
