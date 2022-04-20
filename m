Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB22C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 08:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h3Sxyb+BUWx0XhGPAvh6udjrADpZfNPuTWa5AC2qkSw=; b=UeIAmANKgDOzsF
	UOS0SLxRDacMlTHN72ISX46xdJbBdq8CKWIbktmhPZRHx5ZDhdueK1DWGnvZk37AVgJdBaNbL31Je
	GUNUNuh7hUcMrqa2Tr/JUPOb+7yFzEJXwUZIOCdG7D2/esGT9p301mCPEn4l8mzpYIxKa2DlawmUw
	l/EM+eXurLfbvhRmWlPUfXlK3lSIkF3fFUnhPxWVES0MrBBsGt27dohEHtGwPRyuzWPZ+vg5AcU/E
	G3BICOMyA5pN35LdbavCqDesRGF2wR5gyDyXcebKqWJOER3Awl08OgYOT+dprIBMwhefZX4HvtlDK
	BZZ5k/5s7Ebb40UZ81ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh5yh-0088wX-Oj; Wed, 20 Apr 2022 08:46:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh5yc-0088vm-PU
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 08:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650444378; x=1681980378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=kHUR2AfSFhWUFO8jKXHNdHZ3/7C9Hd9Q/aDWG70WoaQ=;
 b=KcZnt+2r389LeMu1rQAX7eIERRVlF4lhDcN3WhqAakICMA2ACBP/c+Of
 cKwS2x6IdAwqEljPMKMzZgapR+EsFEsKvENGjfgk6Rzj6tqBsAOyx3dtO
 wLhjMBToduzWzt44ryDN43k80myeWE+WitX7EGY2z7ywYqpRDzLTG/QDB
 u6OyTbzRCD2/hrpF7VBpMQXoOgjeMT1af0OsI/aAk0s0QHg5/lQtOL/eC
 V4oPTjkRmqA+B3Me/7SZR2W28OKKOaJMMhTBzxpsqlH+ONQkPQb7LcS1g
 K3kP5iGhFRU4Ry7bYa2aUpJH4RVkQZwyKGcOk0gptMYGyAT5aWf1q6QrC g==;
X-IronPort-AV: E=Sophos;i="5.90,275,1643698800"; d="scan'208";a="92928202"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2022 01:46:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Apr 2022 01:46:15 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 20 Apr 2022 01:46:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8SdpLXA80OIJvWTAYbEe/x/8pvqQizv84QPoYT1UToNKFpyCWeSDy9Vwv6f7Hdl1oO7a6G56z/71uKqeMr1D9jWxH6UL8KXr0XAawFg1RKkMbEw8a2tom/dp6rO2P5UITm2UQ36JpoOWKFmGqivdpX/hVP8st8SaXWjOg2n5d1UFls87knpO07OfVyVZaZD9xd6khSRIGQ+5Ksf5TowzNW1D4NAPld5iThPGVdOrqGCdYW0AEZg29JrU/8nOdj9fzwKOQVa+gpzHUYXxn+vIG+IhYVcMPHdJRWxEwr67BN01mOWTwcdbNarY9UWOYm+DwTVxv14UN/Eq3E31/lNWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kHUR2AfSFhWUFO8jKXHNdHZ3/7C9Hd9Q/aDWG70WoaQ=;
 b=WwmoPBqnQgBbey6xihB6SJRM+d/Dq3JNT9u7bseUDpb59gNRMH4t85b4DTEnYsid2BSbLtrn+TG0JJkdw1IUPlFckH9Q1iU4xTHn6ciPtXUjP8NUZTefAiiCecGz7j77O7AGg/JbtxDs2NAkGrCQRH7rmMZ9w+/kmr57zo8mb8S0dU337UjUZ44Zppoh/gDzKyyNuep6HwugTwMBxadfydzz0m4Q4H9F8LpIKy6kb31H3nI3wr84d++k4fSL+u0NoTmbSg4COJijfPtmwgiUUPLIlVC0z+f/oMaMNXThQM7VljLni8+izGZCTzyUgNmalhwFzK4VN3dfVdiWLTegYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHUR2AfSFhWUFO8jKXHNdHZ3/7C9Hd9Q/aDWG70WoaQ=;
 b=JJLOWXr1DQxSmFTb6Gor7H0ulEkY2+EA3lI4VHADho4z/dOt6xqie0r+1xOysHqtQopIYxS9j+b03gOMI3Xui9N37LqWfOCUbnPm1iZvks9HYHtHF2yr1Bi1EHFkefCZ23ARHIETsMxiFZe9TRCiKwSE0qpcvlbGzAbu38gyla4=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BYAPR11MB3143.namprd11.prod.outlook.com (2603:10b6:a03:92::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 08:46:11 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 08:46:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v11 3/3] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHYU9BgAvSIp+mmK0m8aBEYNky38g==
Date: Wed, 20 Apr 2022 08:46:11 +0000
Message-ID: <3421477a-a3a5-3fec-6e4b-8c0c319aa671@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <ffd36e40c47dd74ac3a0cadf520f8fdd35add856.1650259501.git.Takahiro.Kuwano@infineon.com>
 <201f90e6-e03b-9469-f3bd-f1ae3b5737dd@microchip.com>
 <c8007288-00ef-bc3d-5337-8db710feee67@gmail.com>
 <9220410a-f3bc-b2cf-8324-604ad5b3953e@microchip.com>
 <02154c7d-225b-d3a9-df28-f257c3b7e9a7@gmail.com>
 <bdbde2cf-43c8-798f-9a75-de0bad91a1bc@microchip.com>
 <bb40711b-df58-a951-a5ed-9cb7a6732f6d@microchip.com>
 <c160f59c-1e60-d783-3793-4d91eeacc82d@gmail.com>
 <961eeb6c-9f4e-dbcf-1db7-7eae3c167214@microchip.com>
 <7c70ba65-5d25-8578-a8e7-258d9230df24@gmail.com>
In-Reply-To: <7c70ba65-5d25-8578-a8e7-258d9230df24@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87015a1a-6e78-4b5d-ad82-08da22aa38a4
x-ms-traffictypediagnostic: BYAPR11MB3143:EE_
x-microsoft-antispam-prvs: <BYAPR11MB314346697D45C6AEC8B11334F0F59@BYAPR11MB3143.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnUmffCohgEV27IWILpfK6luhQABeesy7T9OQuV494+GWc0Fcj/mu1PlQQEM6vDc3xIeCnSVF38vIaYLseb00Au26AO6ZkothJnRDiaJwl3vIjEjQp69yLPHXnUmsO5QEpXtogP5xwHBErH4vHneBjVhXwffScbCOUOifg26q7qdFq7QkJipazXWNdZs++dpr/eBzRHeTYSOi0A0j/Cex+rBEkyDIgetSKMA8QTMHOmbnOKphpAhL2lcBwLzaKPD7OoBJvQwDPojBb4wCA5mQ/aQYbx5LAc5hZvFrhEwNkkapn9VZC6hppwwV4jOUORTC4U1eT+VigDhDDFaSwDEcENGUlSrScrzQIB17Fx8irXvZZ8XY/vcNbggwfmkfQyszVykuKSeZbAb3yHkKRK2Uc+NhUNtPMDAsN+7rHAMA1HZDBfFvCWx6O3S5cy2ZAHdoqXnRTXO5oA18T0YbPHgszJI3EShEcWXnxmGliOucmM/YvWRozzidXAV4WlZmoOlxfigVpnY8tZIl+uQbYHbMG3o4DLbuEMoog8Ey5FqXT8qS6FsmQOesDGRxQ8crz5HtnG5YdeEcX4Uh/BHPqW8vAIAHx5cyiJzYve9VtOoHIQRJXo0ZYWW7MouPmD16CzHX9G6kaVzMoztjw208DelCglpIXcp6l2UJYvWwdrO64hyifU8Hmw80FvA04nM+kBbNuzQwuJ5EFY0zcmm1ubDzCUEB9ny8XtacmynufcT9BXfZqlKo3IVwr1oLTU9YAKx96/+joGvCtboHjEA2dsrzhX0IdYF2/3nZ+yDoKpVMxlI8SzO0jF402Sg4OlIrF3FngG7QQW2PCOcik6F+3fwAvcKDUgvx/t+mQ1gvePQxhA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(5660300002)(6486002)(966005)(2616005)(508600001)(186003)(31696002)(26005)(91956017)(66946007)(38070700005)(66556008)(86362001)(83380400001)(6512007)(4326008)(122000001)(36756003)(6506007)(71200400001)(53546011)(2906002)(76116006)(110136005)(54906003)(316002)(64756008)(31686004)(38100700002)(8676002)(66476007)(66446008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzhiR0gySkd3djNxM2xEdHpKMG9BVGwvaE1qMEpOYVUvUmNwSnNkOXQ0SXp1?=
 =?utf-8?B?NzZwOHB4WFlEUXlHQ1dsTG8vZEZpL0xFdDBZdzlVZW9Vei96aDNZMHRYc2FC?=
 =?utf-8?B?cHZFN0V3aDI1MlpUdVhUeWQwcU1iTkdWRTNRQUx2SnVjZmtqY3l5WWhmZFBQ?=
 =?utf-8?B?RFl3RXZHTVBZdzk1NEtVa3NhN3UvWVJ3Y1M2WGt5SkdJbnJ4Z3FZS0J0N0hl?=
 =?utf-8?B?N3Z2UkhQb2c2OHVUd3B0WnY0ZzB4QnM5amx2VnMwNnNRSTJQR05FSDR3RTRC?=
 =?utf-8?B?RThvdkNrelc1NHlxZzMxNkwxSCtLY3BXMDljQ0F5SDcwQWZYYy9HRVN5Ri9k?=
 =?utf-8?B?ajR5cnBpUVZ6anlkc3pHNklkekhTa0g0cTBrUHA2bXVNQTdTYS9vMVA4SHk5?=
 =?utf-8?B?VjBGditoWHlkcEl0MTZVQkFQc0FDaGxnRU1hcDZMbFlMZVA4UldlRnF5RHBR?=
 =?utf-8?B?Vmw2V3Byc1RabWpmbnJZTUJET1lSYkRpT1FjWi9QMTJNK3BCVmRmdVpuM1Rz?=
 =?utf-8?B?dVZoc2wvdTUxQXpsVWhyVHczU1dCVjEvRHFLRzRyNGNrdGNGRk9HK2lYZXMr?=
 =?utf-8?B?RzRsODIyVUlZWENtRy9MRWpWdnpyMk4yWnFYd2hQOFM2aTVqalAwUDJpaGhJ?=
 =?utf-8?B?RDNPZ2luMFlsa3QzaVo0V0U4Mm8zdnFkaW5pMVEwb0tKMVJkZEtPYTdKQzYx?=
 =?utf-8?B?V2lCQTFNOUlvSmVmTHZkM0hsTThoZmkwQnVuOEFmTGVnRDdqTUF0YnByS2pL?=
 =?utf-8?B?a09oeml2WUJoN2R1ek8ybkd1eTZhRjh1UkFBdkcxZEgxUVhBRWk0UnhPTytj?=
 =?utf-8?B?T3RwVTlJYWdXc1p4OTNsOURYa3djMmRRUVhsL1ZlQ1pKT3BXeUM4RDNTeVdI?=
 =?utf-8?B?VmxIMnZDR0psZTdEaUJEd0o3cERnQVFTSC9xRk5qNDAwSzhUekxFMFluZ3do?=
 =?utf-8?B?NFhLV3czWVFmbkJxUVZQSEhOUWMrcDhFTkhhaG9CbWhVMXBPcFFVeUFPd0hz?=
 =?utf-8?B?eU5rMXdlWFBoNU9WSGN3MENDT1R4OHZRbEJ2dHBxK0IwUVNRQ3U5QWNONFY0?=
 =?utf-8?B?MDFGM2pkNENnZUt6Q2QxZXF6RnVkaFA5a1VrN0hmNGpVb2hJL28rNThyNExX?=
 =?utf-8?B?SmFqVzR0NWJqWmcrVkEvRHJ2N2R4R1YrTnJiOS9mMkQ1QWFoZ0JhcXhOWEV6?=
 =?utf-8?B?WGtkbFpJeXg2NDBCWEFHaktNUTQ2UTlrSEhYZ2hocUFUK1dlVVdEbDQ2bFYr?=
 =?utf-8?B?anArcVpwbmpwbVBHenNicnQyY2RKUHJCVDNDOHEzaVBHdS9Cdk4wdVFZYjFF?=
 =?utf-8?B?NGs2VVVFZVV4M2d3TVJ1V0ozT1JwUGJEM3pKeDc0bFNBN0pMT2JiODU1Y2gw?=
 =?utf-8?B?MWE0QXZpUnp6YnlNVXlnbWo0dnZVbXBqa1E1dS8zZWxjTTViSU5ZVFlEWjJC?=
 =?utf-8?B?VkNrdFhUMGgyYVFJV3J2aE0wSi9GQkdlbzY5ckovRnVRdE4rVVlRQ1QxYXJl?=
 =?utf-8?B?OE9ScGR4L0FVc0ZMRWx1SElna3JZcHlDeHc2WnVkWUhTbWNaOTYyR1MyK3pv?=
 =?utf-8?B?RkRMenNscG5hVENNb2hDLzV5QUVkTzU4Y1FES2RzMXh4SWY3NFVnZFdZVVFG?=
 =?utf-8?B?RmI5K2JjVWhtRjYxZ0h4bVBTQkdiemxyRmd6eHkvVkwycEQ0N2UyVXRtazdJ?=
 =?utf-8?B?Q3IxczNBR3V6bTdYc0xUM2ZnZUlSbUNyUVhrZzlENEZiTTl3eDJZQlVxaHkr?=
 =?utf-8?B?S1BnaTdZaWROaFVFWm9McWg3RkRFRzJWZXo3TXY4OGxxZHo1eGpBeERuNFRD?=
 =?utf-8?B?aURBcTZSelJjWFRZSHlSMnF0cmo0STVTNEU5N0xUT1JaQ0xPREczMnBqTGlx?=
 =?utf-8?B?MkRjVm4xUEpXK0JFNC8xaE04L0pzb2FUeDNMYkI0dzZqM0F6TEE3Uklvd3Qx?=
 =?utf-8?B?ckUzby9RVHNJUE9WQnN2Y3l5YStxOVNpVGtSTktrZkFBZzR3V3ZydHZ3OUt2?=
 =?utf-8?B?UXhseW4wQUxYei9lbnp3L1lMU0UzZUpPYlhKREdmY09qTE4vR0gxZVY5cWtV?=
 =?utf-8?B?OEw3NWxpUytQeGYybVNNOHJHR1A1Si9GMVIrL0lwV3Ztc3VBWi9PU1gvSzg5?=
 =?utf-8?B?WC9tUVU2Q0I2Q3RZK3lGZThsQ2VYQUxRbTZZL3h6amduOTJ2c2JKVzlKREds?=
 =?utf-8?B?VkZoU0NVa2NwSHlHVzNSbnhyWVd5UldtVVZ2WGZkMUZYSmI2NHArM2pqT1Uy?=
 =?utf-8?B?cy9zVSs1cTQ3OXNZNTBZTUF4Z0VTLzZRL3EyZStBTkY0VXljN2tKSDdPbGZG?=
 =?utf-8?B?b1BzVEFGZWZpZFNiUWpTU2Y2MTNPcjJnLzducjBJQlcwaWdXN3pRNTI5NUZX?=
 =?utf-8?Q?2qqG6+jcc5YxLgV8=3D?=
Content-ID: <BECBF575C5D57A43BFDBEBA24E5B2F2F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87015a1a-6e78-4b5d-ad82-08da22aa38a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 08:46:11.5979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BtEwS6A2uMbRl5VmZh3pC551hl6UmQ5IGnRbJHeA5whEbFvOvwZFUs0AAwYjOdfmiVishNK6YTMlWq+536WatPFjqdU72cd8SUpSUSmzKYs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_014619_201273_EA882D23 
X-CRM114-Status: GOOD (  13.31  )
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

On 4/20/22 11:38, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/20/2022 5:11 PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/20/22 10:50, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 4/20/2022 4:47 PM, Tudor.Ambarus@microchip.com wrote:
>>>> On 4/20/22 10:35, Tudor Ambarus - M18064 wrote:
>>>>> On 4/20/22 09:58, Takahiro Kuwano wrote:
>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>
>>>>>> On 4/20/2022 3:11 PM, Tudor.Ambarus@microchip.com wrote:
>>>>>>> On 4/20/22 08:34, Takahiro Kuwano wrote:
>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>>
>>>>>>>> Hi Tudor,
>>>>>>>>
>>>>>>>> Thank you for your feedback.
>>>>>>>>
>>>>>>>> On 4/19/2022 6:32 PM, Tudor.Ambarus@microchip.com wrote:
>>>>>>>>> On 4/18/22 08:41, tkuw584924@gmail.com wrote:
>>>>>>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>>>>>>>
>>>>>>>>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>>
>>>>>>>>>> The S25HL-T/S25HS-T family is the Infineon SEMPER Flash with Quad SPI.
>>>>>>>>>>
>>>>>>>>>> For the single-die package parts (512Mb and 1Gb), only bottom 4KB and
>>>>>>>>>> uniform sector sizes are supported. This is due to missing or incorrect
>>>>>>>>>> entries in SMPT. Fixup for other sector sizes configurations will be
>>>>>>>>>> followed up as needed.
>>>>>>>>>>
>>>>>>>>>> Tested on Xilinx Zynq-7000 FPGA board.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>>>>>>>> ---
>>>>>>>>>> Changes in v11:
>>>>>>>>>>   - Cleanup fixups based on other patches in this series
>>>>>>>>>>
>>>>>>>>>> Changes in v10:
>>>>>>>>>>   - Cleanup fixups and ID table based on other patches in this series
>>>>>>>>>>
>>>>>>>>>> Changes in v9:
>>>>>>>>>>   - Use late_init() hook to fix mode clocks and writesize
>>>>>>>>>>   - Use PARSE_SFDP instead of NO_SFDP_FLAGS
>>>>>>>>>>   - Use MFR_FLAGS for USE_CLSR
>>>>>>>>>>   - Add comment block to explain about addr mode in post_bfpt_fixups()
>>>>>>>>>>
>>>>>>>>>> Changes in v8:
>>>>>>>>>>   - Call write_disable in error case only
>>>>>>>>>>   - Use spi_nor_read_reg() helper
>>>>>>>>>>   - Use nor->bouncebuf instead of variable on stack
>>>>>>>>>>   - Update ID table to use FLAGS macro
>>>>>>>>>>
>>>>>>>>>> Changes in v7:
>>>>>>>>>>   - Add missing device info table in v6
>>>>>>>>>>
>>>>>>>>>> Changes in v6:
>>>>>>>>>>   - Remove 2Gb multi die pacakge support
>>>>>>>>>>
>>>>>>>>>> Changes in v5:
>>>>>>>>>>   - Add NO_CHIP_ERASE flag to S25HL02GT and S25HS02GT
>>>>>>>>>>
>>>>>>>>>> Changes in v4:
>>>>>>>>>>   - Merge block comments about SMPT in s25hx_t_post_sfdp_fixups()
>>>>>>>>>>   - Remove USE_CLSR flags from S25HL02GT and S25HS02GT
>>>>>>>>>>
>>>>>>>>>> Changes in v3:
>>>>>>>>>>   - Remove S25HL256T and S25HS256T
>>>>>>>>>>   - Add S25HL02GT and S25HS02GT
>>>>>>>>>>   - Add support for multi-die package parts support
>>>>>>>>>>   - Remove erase_map fix for top/split sector layout
>>>>>>>>>>   - Set ECC data unit size (16B) to writesize
>>>>>>>>>>
>>>>>>>>>>  drivers/mtd/spi-nor/spansion.c | 54 ++++++++++++++++++++++++++++++++++
>>>>>>>>>>  1 file changed, 54 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>>>>>>>>>> index 493240ebfd70..dd37b829efbc 100644
>>>>>>>>>> --- a/drivers/mtd/spi-nor/spansion.c
>>>>>>>>>> +++ b/drivers/mtd/spi-nor/spansion.c
>>>>>>>>>> @@ -208,6 +208,44 @@ static int cypress_nor_set_page_size(struct spi_nor *nor, u8 addr_width)
>>>>>>>>>>         return 0;
>>>>>>>>>>  }
>>>>>>>>>>
>>>>>>>>>> +static int
>>>>>>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>>>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>>>>>>> +                        const struct sfdp_bfpt *bfpt)
>>>>>>>>>> +{
>>>>>>>>>> +       int ret;
>>>>>>>>>> +
>>>>>>>>>> +       /*
>>>>>>>>>> +        * From BFPT, the nor->addr_width is set to 3. In Read Any Reg op, the
>>>>>>>>>> +        * Flash takes 3-byte or 4-byte addr depending current addr mode. Since
>>>>>>>>>> +        * Read Any Reg op is called in this hook and SMPT parse, we would sync
>>>>>>>>>
>>>>>>>>> Hi, Takahiro,
>>>>>>>>>
>>>>>>>>> I would like some details, please.
>>>>>>>>> 1/ with "this hook" you refer to cypress_nor_set_page_size(). Why can't you use a
>>>>>>>>> addr_width of value 3 when reading SPINOR_REG_CYPRESS_CFR3V?
>>>>>>>>>
>>>>>>>> If we are sure that the Flash is in 3-byte address mode, we can use the value 3
>>>>>>>> for reading CFR3V. However, the Flash's address mode may be changed prior to
>>>>>>>> Linux MTD probe in some use cases. Actually, in u-boot, it is set to 4-byte
>>>>>>>> address mode. We need to set the Flash's address mode in known state and update
>>>>>>>
>>>>>>> addr_width is set via CFR2Volatile, can we reset the flash at probe instead? Then
>>>>>>> you'll be sure that the flash is in its default state.
>>>>>>>
>>>>>> Resetting the Flash to revert back to default state should work for this. However,
>>>>>
>>>>> good, let's do this.
>>>>>
>>>>>> we still have SMPT issue below.
>>>>>>
>>>>>>>> nor->addr_width accordingly. Due to SMPT issue below, value of 4 would be better
>>>>>>>> choice.
>>>>>>>>
>>>>>>>>> 2/ Where in SMPT parse? I looked through the code and couldn't find the Read Any
>>>>>>>>> Reg op used. Why do you need an addr_width of value 4 in SMPT parse?
>>>>>>>>>
>>>>>>>> In the spi_nor_get_map_in_use(), the nor->read_opcode is set to 0x65 (=Read Any Reg).
>>>>>>>> The spi_nor_smpt_addr_width() returns the value of the nor->addr_width due to
>>>>>>>
>>>>>>> ok
>>>>>>>
>>>>>>>> SMPT_CMD_ADDRESS_LEN_USE_CURRENT. The nor->addr_width is set to 4 in the
>>>>>>>> spi_nor_parse_4bait() before SMPT parse. Therefore, the host issues Read Any Reg
>>>>>>>
>>>>>>> if 4bait is parsed before SMPT and nor->addr_width is already set to 4 in parse_4bait,
>>>>>>> then you don't have to do anything for SMPT, right?
>>>>>>>
>>>>>> Currently 4bait is parsed before SMPT. So, if we are sure the Flash is in 4-byte address
>>>>>> mode (by u-boot, for example), we don't have to do anything. If the Flash is in 3-byte
>>>>>> address mode (default), SMPT parse does not work correctly.
>>>>>>
>>>>>> Please see this about 4BAIT and SMPT issue.
>>>>>> https://patchwork.ozlabs.org/project/linux-mtd/patch/20201212115817.5122-1-vigneshr@ti.com/
>>>>>>
>>>>>> I introduced another workaround for SMPT issue in my previous series.
>>>>>> https://patchwork.ozlabs.org/project/linux-mtd/patch/9a2d323b2c18485d13f271e3bb213b96fea0e7e1.1649641729.git.Takahiro.Kuwano@infineon.com/
>>>>>> I withdrew this because this does not work if Flash address mode is not default state.
>>>>>> But if we can reset the Flash at probe, this should work.
>>>>>
>>>>> Hmm. How about issuing spi_nor_set_4byte_addr_mode after parsing 4bait table,
>>>>> to solve this dependency?
>>>>
>>>> or maybe we can add a smpt hook where you interrogate the state of addr mode
>>>> from CR2V and use the add_width from CR2V instead of relying on what we get
>>>> from SMPT_CMD_ADDRESS_LEN_USE_CURRENT. This will avoid changing the state
>>>> of the flash at parse time.
>>>>
>>> Reading CR2V requires Read Any Reg op with correct address width.
>>> Chicken-and-egg...
>>
>> I agree with Pratyush that we shouldn't change the state of the flash at parsing
>> time. So to solve this we could introduce nor->params->addr_width to set it at
>> parsing time, and use the default nor->addr_width for ops at parsing time for
>> all the parsers.
>>
> The default nor->addr_width comes from BFPT parse (no change in BFPT parse).
> In 4bait parse, nor->params->addr_width is updated instead of nor->addr_width.
> Then,
> 
> static int spi_nor_set_addr_width(struct spi_nor *nor)
> {
> +       if (nor->params->addr_width)
> +               nor->addr_width = nor->params->addr_width;

remove the above and
> 
>         if (nor->addr_width) {
replace the if condition with:
	if (nor->params->addr_width)
		nor->addr_width = nor->params->addr_width;
	else if {

and the behavior should be kept as before

>                 /* already configured from SFDP */
>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
> 
> Is this something we are going to do?

sounds good on a first read, yes
> 
>>
>>>
>>>>>
>>>>>>
>>>>>>
>>>>>>>> with 4-byte address. We need to set the Flash into 4-byte address mode in advance.
>>>>>>>>
>>>>>>>>>
>>>>>>>>>> +        * Flash's addr mode and nor->addr_width here.
>>>>>>>>>> +        */
>>>>>>>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>>>>>>>> +       if (ret)
>>>>>>>>>> +               return ret;
>>>>>>>>>> +       nor->addr_width = 4;
>>>>>>>>>> +
>>>>>>>>>> +       /* Replace Quad Enable with volatile version */
>>>>>>>>>> +       nor->params->quad_enable = cypress_nor_quad_enable_volatile;
>>>>>>>>>> +
>>>>>>>>>> +       return cypress_nor_set_page_size(nor, nor->addr_width);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +void s25hx_t_late_init(struct spi_nor *nor)
>>>>>>>>>> +{
>>>>>>>>>> +       /* Fast Read 4B requires mode cycles */
>>>>>>>>>> +       nor->params->reads[SNOR_CMD_READ_FAST].num_mode_clocks = 8;
>>>>>>>>>
>>>>>>>>> Isn't this info already handled in BFPT? What value of num_mode_clocks
>>>>>>>>> do you obtain from BFPT for the non-4B opcode?
>>>>>>>>>
>>>>>>>> There is no parameter in BFPT that describes about Fast Read 1-1-1 op
>>>>>>>> (as we can see 'struct sfdp_bfpt_read' in sfdp.c).
>>>>>>>> The value of num_mode_clocks for Fast Read 1-1-1 is set to 0 in
>>>>>>>> spi_nor_init_default_params().
>>>>>>>>
>>>>>>>
>>>>>>> I see, thanks!
>>>>>>
>>>>>> Thanks,
>>>>>> Takahiro
>>>>>
>>>>
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
