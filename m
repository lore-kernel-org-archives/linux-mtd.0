Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ADAC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 03:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mk2/LJ67khYuL0LSrEKfEDICcNLwJN9UEgGSnUVXPs=; b=q6TEb/6ncNekjW
	BFUHG58t39XF51rjWy1soeUFCjButNPHMnJwoj+mYyhUnwbupBaPAq1/hB9EcDLt2LdXAqbI10VNk
	eGW+ojlNkNHp/RirjHyOR/J4uZVNtWPwuI4fWnHEzxxACBROjrBoIkvmo+IPtXq+a+n/DMX32v7Z6
	HKuO4hCKudATpP7pIeOJVYnFnc5BBHVbRCa1aCQIJhHcYq9PbEU2BWFz0aCUG14lw+yQImvDIOKio
	j2jW4eOkmC2agX/3Hd2VY/hJrRTaSQBYsOhVlzbwLm4tiHHJFi7G/eWsrhlz/HLXKhOFZvsbl92Ey
	MT0QwYy0xpb1nAOiKqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHzpJ-002Mvv-37; Thu, 10 Feb 2022 03:08:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHzpF-002Mv3-Kx
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 03:08:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1644462534; x=1675998534;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4zTKWLRyIK0f6cUmFREmXE8hoWO036KfYqS+7AylIaE=;
 b=WZU4WU0MnHHKxa73GEQua4sjXhTNEb7yi6QFpcMepDXZCWHInI+F0lka
 bmLlY+7sgJHwiZLhBtWLPHSfq4NNljffRZYuUkly2lN1avMK9ucgfoHrn
 pNdGkQXqnUbM7G7cnKxk9uVy84xYqQi9cbsjS8ZnRmgc1/4tQ74rKmFSz
 S6fSKj0NyweRaUVAUhBnwCQdOYV5SWM3aNfJk1yUipOF8ME/TskjxK4FE
 GQIY8XDKvvUdA5g2GxU0WnldZNt5Acu2tL3NIt+m2uOnACr0NYLB3Lg2N
 LE+o8SLlBEw9Hk7ZnYO0orRT/BEUDa7vU/O28PvtSxIWPG6p1ZcBIb/fg A==;
IronPort-SDR: 4Q4u/hodyJAhNyR/4XktrOZQADfpqWUcpIvThCFEZPzyx4oXvTRqLvOKDrUvbCAVLMQoDRKyia
 p1u+cwfXv6tFu5VrzZLX7SrTw5UuBGMSh1rZvH5OVJ7it2CQD/yPVfbkWlcqV77WedKhcJttB8
 C0Ej6J3g/iZIu3vojftJ21nfJUy8paWW7wIwedi+XQZxW/s0r6V3QFMdvjP+QgNJfc2cmHouFi
 EAYElUp3gbKgDmAV45Ko4kVWmOB4ij3FZZeBQSamHC8IB4GzwUMLkGVNYdzuqxh7pa/aSZOa1+
 R5xKK2rNSvaCmPwhFRG2C0QA
X-IronPort-AV: E=Sophos;i="5.88,357,1635231600"; d="scan'208";a="152556500"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 Feb 2022 20:08:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 9 Feb 2022 20:08:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 9 Feb 2022 20:08:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evlVp3wDmXiS/cUuFtYrahORPYe9BiqB9lrdiSht4del0P4NnLBiEHXjq/QNtXh3GfgDpX6bmvKKmHseK83ti/iYaF8MuLGqVcTtcG4/5+cGgXmX0QXrbQa3zyOwwMBPLwLXFMErlet6hA/Lxl+0uP/XHYVLhfUHMUeuGAfAs36+2kEdob5Z0rMyEUGEUnLh1OLAUM+KdtlWlYG04qwil1bpshEK/945YQHnbQRxFV5qZpAMQWChaF1mDBEINbaVBHeb4xi/SERiy4LmKasm8t/aGr7U5ahpC0CXmrde8WzQsoqyN1OPAsr0jZLxR5V2o/bs8/mn6Ho386Cq7Wl3/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zTKWLRyIK0f6cUmFREmXE8hoWO036KfYqS+7AylIaE=;
 b=kH8OlNfgd5dsxjMwnrsv7NigKv1Mm8QCKWtLJEnHdffhiUqrh7hn36eu15Gjis9ooZ1TqZmwrmotHPr2+NBdT1hBCpZqHOULAT8W/9YeM9Tund9BQrRj1XlyNPpoOLzcoYsVm6bi3z2ttvaAkH2DpJmlCkl2yln0aHoD3tgYMJQyTm7YbWUI20IxHDSC2QwhaMe6Aizjlgr+wpbhxm5g9sUl+xQrAF20YewCsxydVMz9nlzgmWcnawP4AK/ORBsYz+CastKcTOF48fEJOX5Rz1mQTy8kiONxfx8Njdxveg6mPK+wA806X9Bw1mAz4XJTw70OhHwRZ9eiCbTLyQi+Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zTKWLRyIK0f6cUmFREmXE8hoWO036KfYqS+7AylIaE=;
 b=Bf6jmwY7l0IevwMdanCjn4n6gVsqIDfFH4nXL8PDENMAawiAFDqwmmD5bezvmSj/5Z6FPsmlf5TGzYn/7WbP6wAwiene2LwKu33alSybpvB9v99ioBPNmayYNZ++5lA8dCCDX6MdDjUxVNV59eArIWaURR69o/hvm9iyFsGTcaY=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 03:08:47 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49cd:dd25:384:e918%5]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 03:08:47 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Thread-Topic: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
Thread-Index: AQHYHiuFz8+evF2o8USFiXwNjUvH0Q==
Date: Thu, 10 Feb 2022 03:08:47 +0000
Message-ID: <68aa414b-7a9d-1330-531c-37b2db2ab09d@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-6-michael@walle.cc>
In-Reply-To: <20220202145853.4187726-6-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 478ad986-fd04-4e28-bf5a-08d9ec42a7a0
x-ms-traffictypediagnostic: BL1PR11MB5255:EE_
x-microsoft-antispam-prvs: <BL1PR11MB5255AE80CFDE5ECFB32117E0F02F9@BL1PR11MB5255.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UjR+FX/+C0R4s+74R96g0w8/3r/oYF61A6UC5coX62JSTMZ9I8Ee9/cV+1OK5jkAaB3DQxB3UmYyq86vyXlV0ylmFrHYucTCxQdxu99mc4GfRiTmPgcBhbyjAsnL/ePessBHxHyQR1iMUXvF9OKDSoTZ594Ak/Y9ggzzF+RX/aZmPci9Tjiwvci6Er3PIl9KIfqwvGk5Y6fyy5wVg74C68xsNLbLHuvhrNNt7X500JrWBDQtMHVdfQMRR7tY0NzwC2oKo9MHRY9anL8wN9yAyI3Eh0rPIw0UTGSHJ+wRB8Bwf0Jmez9gr+YdIKxIzm0HNp+qdm+qrpJb3KGssVjez6Aw77dS6XsrocsfKU0iUAcrArU1ytv+le4qeeDcLXFBHceAB5UV0n798PL4x+UXspj16l7vYU69NduWuErDfcIugidjBYPaoDHguTNNAfgyFNxjipWesWm5eo7ousp9xk2K+e/rhB7VPK4aMmN0ylcYK/mr0JihrNpoz54cy0Nw8mdLeEq79L6lTQ1XgEH+j9vw+7I7RKJUSrynRp3rkMSCaLcaGTUALVtWXnAgFxMYkldJDThWfZTlvunBJ22AeDVefPMNTBA2Pia/ceSMThlfWUKIopakau3vUoPMS7jIrxSEnmuLt2g7xoJ2g1Y1GEZxBRX47ArUGJjlZGteyOp4MGP/DJrIKjaG1KAdbDU3yVxQZjEpiAdvzNveUKeWNyMXbgigcXnBcqyeIVDxk5OECSYwfc/Z4M4yGNgCd97D+6DXRQ/Qilf453GmqVTtsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(6486002)(54906003)(83380400001)(38070700005)(76116006)(316002)(26005)(2906002)(186003)(2616005)(110136005)(31686004)(122000001)(8676002)(6512007)(5660300002)(86362001)(508600001)(31696002)(66476007)(71200400001)(64756008)(38100700002)(36756003)(91956017)(53546011)(6506007)(8936002)(66446008)(66556008)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTVmWmFXejN1d0lUcHFlblZRT0R2eUd2aVNlaXV4azA4cjV5Z1IxbUdlWFBK?=
 =?utf-8?B?UkFSZnRFWCtLQWZ5SHVmZ2V5dTdnTkI4WTlXRk9YU0Y4ajR0dll4ZmRZRDl3?=
 =?utf-8?B?bGJRWGFnWDRxbk1pZDAzeXlSUzVtYW9Kb3R0R0dHdG05RHB5OHErdXpudFFi?=
 =?utf-8?B?R0RXQTh2d1MxeENnUGpTTWF0NjVoVW1LdlJvSVlpU0gwZkpVckJNMDd4MFh3?=
 =?utf-8?B?YURsSGNLQUkzVE9YTGM2djFxZUtwQ2ZUQnpKdnd6YkxEcUUxNXFucXR2QnZ5?=
 =?utf-8?B?dDliOHhLN0FId1ZTWHcrWUptMklLcmNKRWZ6U0dQVEQybXNZZmFkTjVvYm4x?=
 =?utf-8?B?MmpoR0huT2tXZDJpZC84OHBSbVF5UktHNW5XenpBc1RxaW1tK05tdG02VmU5?=
 =?utf-8?B?dEFBNkxZRFBMSUdIb1RNYm9nRzBlR2ZIYmhoc3RJMUdwMmtkb2JnRzNnSGxB?=
 =?utf-8?B?WCtwMVA5QVBBUXBkWjdtYTVtNEhOc2QwKzRHL29wZURMVXN6bll2NjAxVFhi?=
 =?utf-8?B?V3pDWlo0SmJYcHBTNlFndU9jRG9ScVM1T3BxZk9NalliYVF0d3Z6OW4wSmtZ?=
 =?utf-8?B?RjZUYkF4Y1hkdXVHckNZL29VcjFmSG03RlRQTUtZTEpRZWV5bkVDWHhSTDB2?=
 =?utf-8?B?MjBreTRGZFpIeTUvcjJxT3FodWl4eDlpVE0zdUpIbmpKNGVWR09zekxFMVFa?=
 =?utf-8?B?Ulk3ZXY4NUg3UTQzSk04YTUzZEdpNFdKWVZzOHdlZTBDQUdpb2VEVFc4azVy?=
 =?utf-8?B?aXNObUJ3U0g4QzQ4UVc2cTJGS1hWZ2JhOG5nWTFOcEIvRU9WbGlJWTJQdlFR?=
 =?utf-8?B?bWFsUTZUczlqVUFVb2JsdDY4eWtGbythTDlpWUcxOFRmQUQwaHUya3dCZWtt?=
 =?utf-8?B?TmF5QUg4Y2VGbExzQ0xrZWJvK3Qzc0pjMFE2TDNhODc5OE9iSnVqZlNXUjdy?=
 =?utf-8?B?cUxoaEtyT3I3NXp5RVNEZzUzMnBNWVM0Mm94RVR0N25IM1ZFQ3d3a3gvTHdx?=
 =?utf-8?B?Z3VqRk5weGdqT0drMlhNb0xrdlBYaHN4Znk4WndvNG5NODBIVGdISGNqNU9q?=
 =?utf-8?B?b1Y5VGdVZVg3UEMwTFA1U3JzWEplL2tnRWprNFRGVkIxcTFNR2ZOb2FUcnFT?=
 =?utf-8?B?Q0FqRUYyRnh5MFA1QlZaK3ZjTXRVL2xsN2t0bEFub3RmdTN1UmY2QXlYa2JN?=
 =?utf-8?B?N1JpSzNPUFZHa0JzZTh0RmRNWWQ5SjdhdFNvY3V3aTZYdnVzeXg3cHpIOFdE?=
 =?utf-8?B?SU9GQWFFK1JYZkkxTW1pRmlRZm84Y0padHpxY1d5Z0MvYXJGTDA1MytpeVcr?=
 =?utf-8?B?dTVVSGxtV3VaSXlWWVhuSDVabitSKzJFSmN3TUI4MjdLcDlIVjBXTlpnckZ4?=
 =?utf-8?B?VGt1bFNkaE9qTk1oa1U5cno1aSt3YlNFWFpWR3dDYVUreFNacVllbUc3QkI4?=
 =?utf-8?B?aHBaaFlDSm9UVU0vVlpsSExlaGVFODk0N2ZDZEJJeWpxRDhlNXl6SjFOVUpF?=
 =?utf-8?B?ZUJpNzJIR08wSjVBZy9LVndZY2Q4NDZlU01zeUVhYWxUWi9KTFpBS0R5OGNZ?=
 =?utf-8?B?N2U4bXd6Y3lsQ05JZE9SdU5vaHRsRmZ3YldsTG1vZzM0M3A0NzhmWjFiUy9E?=
 =?utf-8?B?QmEvblo4L3RGWjZxQ24xc1lJc24vZE1FNjF3M1RtcHBCZ3JyRXpFVTNtWDh1?=
 =?utf-8?B?a3BlRTZzUTZoN1FTSVhsaHhQak5SWUpuZXI2U3Y4WnJ4NWwyTEVDQXhIR09E?=
 =?utf-8?B?dWY1UjF4dWM1d0x2dTdUamFiZVo1UWFvK29oT1BsNC9ZSGNxVHk5M0Yxd29F?=
 =?utf-8?B?TGdsWE55SnpJdm8vZ0VrczNITkJXMUoybWNaL2lpTUVwMzU3U3pFOWRWUmVE?=
 =?utf-8?B?eCtTd051U1gyR3NYdW0yMGdaYnVVT2pmTmprSW4vajRzRWgrK0hhN0dhV2xo?=
 =?utf-8?B?bE9hVktBcjIxNEJSWVNmYU93VG03YS90N3RsaUxrTUpnTUF4ZEk5blZFYms0?=
 =?utf-8?B?SlFFRGU3YklPenBNQmNHUDNGSGEwUDU3TDVEaFVxcTQ4ckc1SXBLUkY0WUUz?=
 =?utf-8?B?MzNTQ2V1N1QxZFlBUUNyZVJNQ3VtVUV5YkN6L3NMZFBIcXErMkRwa21JVTNh?=
 =?utf-8?B?cmhrU3B3OHZ2Vkk4WTRIZU5nTVFQNWRqMWVCUEFBTGNVRGE4ZzBFVHNHR3hm?=
 =?utf-8?B?UzY1aWw3ZE9RbFZieTVOWUJ2RjlsVDRabFhSRjh0eG9VL1NlR0FRN1puK1JC?=
 =?utf-8?B?TUJhRjl4RnpIZnMwbmttR2tENGZ3PT0=?=
Content-ID: <5C6C0E67CEDCCB45808C98C3BE6B0178@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478ad986-fd04-4e28-bf5a-08d9ec42a7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 03:08:47.3493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZcBWb2Wr9egfE6y6hTQX3Vxyfr+wjtLIEBDvlk2gCBHe2zlwfJ2+1DPAKFt3AQ91+Il2+ao0CLOegzOLNo14Ai6/hQtgr5s5O9Vk2RAjhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_190853_755713_3F2ACED9 
X-CRM114-Status: GOOD (  20.26  )
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
> Drop the generic spi_nor prefix for all the xilinx functions.

mm, no, I would keep the spi_nor prefix because xilinx_sr_ready is too
generic and can conflict with methods from other subsystems.

> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/xilinx.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
> index a865dadc2e5d..3e85530df1e4 100644
> --- a/drivers/mtd/spi-nor/xilinx.c
> +++ b/drivers/mtd/spi-nor/xilinx.c
> @@ -8,9 +8,9 @@
> 
>  #include "core.h"
> 
> -#define SPINOR_OP_XSE          0x50    /* Sector erase */
> -#define SPINOR_OP_XPP          0x82    /* Page program */
> -#define SPINOR_OP_XRDSR                0xd7    /* Read status register */
> +#define XILINX_OP_SE           0x50    /* Sector erase */
> +#define XILINX_OP_PP           0x82    /* Page program */
> +#define XILINX_OP_RDSR         0xd7    /* Read status register */
> 
>  #define XSR_PAGESIZE           BIT(0)  /* Page size in Po2 or Linear */
>  #define XSR_RDY                        BIT(7)  /* Ready */
> @@ -60,20 +60,20 @@ static u32 s3an_convert_addr(struct spi_nor *nor, u32 addr)
>  }
> 
>  /**
> - * spi_nor_xread_sr() - Read the Status Register on S3AN flashes.
> + * xilinx_read_sr() - Read the Status Register on S3AN flashes.
>   * @nor:       pointer to 'struct spi_nor'.
>   * @sr:                pointer to a DMA-able buffer where the value of the
>   *              Status Register will be written.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> +static int xilinx_read_sr(struct spi_nor *nor, u8 *sr)
>  {
>         int ret;
> 
>         if (nor->spimem) {
>                 struct spi_mem_op op =
> -                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_XRDSR, 0),
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(XILINX_OP_RDSR, 0),
>                                    SPI_MEM_OP_NO_ADDR,
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_DATA_IN(1, sr, 0));
> @@ -82,7 +82,7 @@ static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
>         } else {
> -               ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_XRDSR, sr,
> +               ret = spi_nor_controller_ops_read_reg(nor, XILINX_OP_RDSR, sr,
>                                                       1);
>         }
> 
> @@ -99,11 +99,11 @@ static int spi_nor_xread_sr(struct spi_nor *nor, u8 *sr)
>   *
>   * Return: 1 if ready, 0 if not ready, -errno on errors.
>   */
> -static int spi_nor_xsr_ready(struct spi_nor *nor)
> +static int xilinx_sr_ready(struct spi_nor *nor)
>  {
>         int ret;
> 
> -       ret = spi_nor_xread_sr(nor, nor->bouncebuf);
> +       ret = xilinx_read_sr(nor, nor->bouncebuf);
>         if (ret)
>                 return ret;
> 
> @@ -116,12 +116,12 @@ static int xilinx_nor_setup(struct spi_nor *nor,
>         u32 page_size;
>         int ret;
> 
> -       ret = spi_nor_xread_sr(nor, nor->bouncebuf);
> +       ret = xilinx_read_sr(nor, nor->bouncebuf);
>         if (ret)
>                 return ret;
> 
> -       nor->erase_opcode = SPINOR_OP_XSE;
> -       nor->program_opcode = SPINOR_OP_XPP;
> +       nor->erase_opcode = XILINX_OP_SE;
> +       nor->program_opcode = XILINX_OP_PP;
>         nor->read_opcode = SPINOR_OP_READ;
>         nor->flags |= SNOR_F_NO_OP_CHIP_ERASE;
> 
> @@ -155,7 +155,7 @@ static int xilinx_nor_setup(struct spi_nor *nor,
>  static void xilinx_late_init(struct spi_nor *nor)
>  {
>         nor->params->setup = xilinx_nor_setup;
> -       nor->params->ready = spi_nor_xsr_ready;
> +       nor->params->ready = xilinx_sr_ready;
>  }
> 
>  static const struct spi_nor_fixups xilinx_fixups = {
> --
> 2.30.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
