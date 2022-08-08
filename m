Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB86C00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 06:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ebOUb05rAfxkxA35/eSz+Zq58SzPAwYz7JDiJIcbHk=; b=eH2DYXenl1fCca
	sM814DmcBEU/EZBovOdQSm3viDgJgvnESlnCn9B/kzo8jKYYxmn1oNRfk5IwLI2dKx7dodtrWIvgT
	Z5gL9fS40LpOSNqIAZ8R8LDtFCPZNe+Hr0obOxfdh/2BkzKI2HU0elW9Wg9PQFbQrzelr9ZZ9BsOE
	XnS3wFVSZyLIUmW7LzdbSMQW1dD3DAup8ZDHJoP8bhm0pbhgiMBGkrAnX29Z1wT/Py7U9CK8a3KeQ
	AUHIPITIk5qUHt+Hx0HjXuLXeRzzsi0NntpLfAuR6FQzqM4OpZ6OLB/sR5MfpufBC/Uia6WwTwFq3
	0cgZu/kEcCTanpSRNFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvwh-00BURd-2U; Mon, 08 Aug 2022 06:08:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKvwc-00BUH8-Ge
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 06:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659938934; x=1691474934;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ryMEoBq5uwskd8Z4uv67y7bYSYFNbg+c7IUNCaHjPxY=;
  b=VMcI11fHCXV0jdQbYjtW6T2ovVoR3e028Y+2ckQBOBuORFwM6/CCMA8e
   AVNdhcjBgiPv+KJI5+ZqxcjivavE9+PrMW844nHUqo/7zJVBaWXyzVSRs
   /kjTI9Y4TuhmYgHDm8R1Cr4fEn2R4RUrj0aRuenb0kow56Pfzwo5he5qR
   6QAmug0lGrt1WazUMdYawVen3urARxhbXonMfvLT+hODlThNU8VcmvUyR
   0PgKty4FDqOixLIqVhNN+g+Vaf99qP9ScV9WTQqlngmld1nD9YaCrWnKA
   7ARhvhqQGPtOCrfWQIs9ZKoAnpaUqjhUS8PWEHUkB0ZySL4JVpkDL7Aqb
   w==;
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="171379189"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Aug 2022 23:08:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 7 Aug 2022 23:08:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Sun, 7 Aug 2022 23:08:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuS1Ye0z0kIHmFPCLVhBgyZV+t9QLKll9B2+bjMbxuhklQBccWBOi+e5Ye2NIx7E5EqljxuNz4idMlJKZWstvDpcvMRVpxdEi5Nq4g+sJz3A46OFBHViH0JdMzQus45IhJmtISebct2y9UPvgwDQOFbRn+qqEE5osavSrpLhV41j+Xohyqg462hqqWeg2SXBJgX5HRSbp/zsN0ZwRCxDv89fnhqiR3w30y7PDhxMoIIBxnUthF4MDI8cWI6RBKBRf8jfijscH3IY2Zw0LCR8HgClBR6ogxZGKAGAc9cCXULSbDYZPiNjcfy61y4AA/mJ0oB8RGNpAu5BRcegfr3ZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ryMEoBq5uwskd8Z4uv67y7bYSYFNbg+c7IUNCaHjPxY=;
 b=NNp8HKndOO7fkSi7H6GMgdMRFiaIG3V8Cq2pHSLq03sZrB5GJ5aPcqJGrjfCsQCiGZyZhhNvUKOyX8rmJLILcD4X7RMyYViMiwFHKhgEpVX82U6IlLuQ4jFLrNj95lmpqywefhsJTaj4sj6Xl+TiTSf5F9EnSwDuGbUYr67MJ7YF415uk51RMhQqzz5xU6Dn8fFVDpfUQwFrW1YPmF8v3cnurANisAQ1arnYpK59mB/6S8A8T2AZs+n6nAAhFPhxQVORwk+Uuo+cKxq9WQHvTLpAVVjQLlfGyD8P2aLPAJHPIEnYOQGISKVDq7AP5cXyhr7vFuOjSkpZUK4S7JthXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ryMEoBq5uwskd8Z4uv67y7bYSYFNbg+c7IUNCaHjPxY=;
 b=UtkpbJsRH7uFhbDAD0inOwoIq3cI674p8Iy0CVfDG+CsQ+J5PO5x/oTeoFchgB1HlIUqzHerebhV7idX5R7kb4GbaQLlupYOkWFo2GX7RFIW/oTwBR60hzgTfz86ROLavECee8DjUf35NNvRJtioMyHTbJogei7I+JUfEnO7tuE=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SN6PR11MB2701.namprd11.prod.outlook.com (2603:10b6:805:54::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.18; Mon, 8 Aug 2022 06:08:45 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::1cf7:6d4b:5e26:3f56%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 06:08:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Topic: [PATCH 8/8] mtd: spi-nor: spansion: Add support for Infineon
Thread-Index: AQHYquH3IGrZFUfrHU+ZRSwPyGM66g==
Date: Mon, 8 Aug 2022 06:08:44 +0000
Message-ID: <80b5e707-23b3-e357-c7ae-f78b6c75f2f6@microchip.com>
References: <cover.1659764848.git.Takahiro.Kuwano@infineon.com>
 <e47ed0aa3e1a6fdca7689434ce7dea99ff4826e7.1659764848.git.Takahiro.Kuwano@infineon.com>
 <d470b67d-00bb-7065-ec18-ee00616c5b7e@microchip.com>
 <ecf3906e-a3c4-328e-09b8-1e801896ce81@gmail.com>
In-Reply-To: <ecf3906e-a3c4-328e-09b8-1e801896ce81@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3c39948-29af-4b8b-b8e5-08da79047370
x-ms-traffictypediagnostic: SN6PR11MB2701:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LHXBAOd0Sg9IzimaCm4viZrdN74dBblyrc11anTHgO9lH/Cv4+s8bJO+DX5AioNsfspgj7dz8ZHEMmRUiMiTus33TSLUUyIo64CZ5kibCpS6I4cUUcUzoqWqLQi1pVt1rkN2LzP58rL22bOXw20BsHryXgioK17vJHpgBdpDl8+Ac00yJp4MtpZoe1rr1VcWK3nh8c9ziLybayIcyZGC/FG6b8Ve2yhqezDQNwQbDVWyZX3PzFgz30qdoc9eFkYPHTvu5XR9RkQk8Wt0H1TXxya6JKMpBm1w1k25ofFaGSC0rk6eJrFAKo5xcL/SDvyCtXHyPceCnzLAcvjCHhLvSoZeWMw9cIR0bPAM9BSQCQfntc6+9ghB50BHpa1qar01OBWqx8tzfWpHKiHQ16QoaiOzxgtqQVlbH0vARX3soG5FNykWfCHU0OoYEkIEwMnP6PbzYplzpQZu2rZrelneupbETc9VlC29bjHLl9ESQExuME9mBQjmcAig/LBRzPEFzwBVrQvafRT90qA5TQwCPDyqwQx1RJOSOmirbfeghx4B2w0w8HrAfmc+5U/alUd4GPy5UlhRzo9Vscsv6nsLpv2YsXsLXcxBne6SxJ7ytXXYTPHT8otb5tSi6pUlFeHhGAafCjgOMWU18oW/VkLxV+JMgRjY34aisyFowzD1hJKpecISNESbOLpRgXgO5jc2dfkYvp6ZwSR4L0TMTiIBQ+aDw6wddX5eqjbS2OWunfUdF4jONZqWAfrw+4XYyBTneiBaKvHxsmt23FtWbPJvJIQVeatYeWbxYQWzwyqUUnSaYjnNOhVjTc4DjnwLZPzbsODQkfVdsdKbzpbNTo/6a6PZtc6exk+sNLrHPtHOqkU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(76116006)(66946007)(66556008)(66476007)(5660300002)(64756008)(8676002)(4326008)(66446008)(316002)(54906003)(110136005)(91956017)(31696002)(36756003)(86362001)(8936002)(2906002)(122000001)(83380400001)(31686004)(38070700005)(38100700002)(41300700001)(71200400001)(53546011)(6506007)(26005)(6512007)(478600001)(6486002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkQ0QnlQdExzclUyYXRxR1VMZzdGaVZtM2w0QmZLL2VJNkpkUTR5L1JFcncy?=
 =?utf-8?B?d3pPYjlIWjhJNWlMd1k5YzZLR2VLS2x1eHlvbTl4K0duSWNOclJiOXVULzFy?=
 =?utf-8?B?RCtZaVFJbVFtVDRZU0dWcm1oanJLNGNncHFJVlJURnJsSCtvbXkyNU1hcVlj?=
 =?utf-8?B?TUFoMFRteU9ZMEE1akZIcENBeVRWTEtqemNlSXpBQ2tjcHZUVTQxbTA1VG1D?=
 =?utf-8?B?aXRrRUZXM2FMN1A1SWJCMEx0US9hSUdvSWI1cUF0SDBqT2tiNjBtTVBZWmZz?=
 =?utf-8?B?ckxxdzhCd3pHV0gzQ0ozUWJqelV5SGJhNUQxVU51NldKcUh4OVVrN0RFNjB2?=
 =?utf-8?B?YVlRZjBucDQ3R09zMGpUU2pjMGpTU1ZkWURWTksrSitqZW1nektySGU3Nmtp?=
 =?utf-8?B?V3N4dDIwWnFPUVpWMGlhZW5GUUEwcDIzVk82UnF6N0ZVL1krZWkvMm1MUFVn?=
 =?utf-8?B?Yms2Y3IrUDZrcTNFNGJTc2ZIYmsvak1tWWpoRkRuRVdJelZXbkwrSHE3bENL?=
 =?utf-8?B?SXdVV085Tk9oUXMvSDRsd1k4TUFkWjU5UElQQVBuZDFNNnppREdJdWxQWW1n?=
 =?utf-8?B?c3pFVGcwUXk3OEdqcnd0bkpGWHBodUk3MmZtaVNXT2xJdkZjR1Q5c1B6cThW?=
 =?utf-8?B?OTZLU0NST05oVXNZbUdNTWdidDIzcVJxSHpiSmE3LytYOE83bEN4UklsTEU2?=
 =?utf-8?B?b1lJWkFIQUZKR1JvcDMrTDd5dVNDTnF3R0Roamw5aERLMEZCc29VYUMxSFJI?=
 =?utf-8?B?L2JlRFQvTVY0cXl2Y2dnOFo5NTZYU24rcU0rWFFSVm1jZDR4TnBVdXR5akZ2?=
 =?utf-8?B?MXFPU2JlR1ZHazY3dW9UWE50SXBnMlVNRTVnVVBJa3NKZFIxeERrcXd5WG9R?=
 =?utf-8?B?azc1SWVsOFl2Y0t0Q05BeEFQM0tqMFl1clh5VUk1Y2EvOFNkajIvSGxsTTQ0?=
 =?utf-8?B?Q3A4b08rU1lGWWtPZStZMVg5d1UvM1NVaVgrUi8wc0dzNERGbjl5dWw1YkVV?=
 =?utf-8?B?SWJBK2hwZ1dGL2NBYTNkc1k2T3pSSkpOaG1tV2RVcWVOR0pHYVNIMmlHMTFV?=
 =?utf-8?B?MCtZaWIrMW5Jc2txQ3o3WERCUFhWWWhjTkUzTWt3SFEvNU5PTUZleUFRbHY3?=
 =?utf-8?B?Vjc3WHRhTGxlN3VIS2l6K0pWdEREQ2RaVGp1OTUyQkRxbWx1OEk1ZGhGczlK?=
 =?utf-8?B?bm9sQlUxOGFwRGtFakErQ213U2FGNnBiMVJScURXeTZwaGpXZjRtcnVjdzJ5?=
 =?utf-8?B?U2xJNGoxRzZwT3MzQjFNSzY2UFNXRFdMN0RQRktLZ3B1WUhCcFFXdENzRExD?=
 =?utf-8?B?eXI0ZWJYOTdOamhZWHlLeW9KNXlkTWU4cUdnTDlraSsrT3BUWHNoN1pkSmxT?=
 =?utf-8?B?czVPTjVGNDFyb2dkMUFCT3gyek1mNTNuRWk1MlowYVI0NW1ySE9uQW9pS1hv?=
 =?utf-8?B?RnNPa1NuS21EUDVTVUtkeGlROXJmcFp0aXpadSttUnJKaXJoZGtVR241dXgz?=
 =?utf-8?B?OUo3eVZGRFduOW5LNWJURlllMmtkK2VRalRybHhNbFdtQW9IbkhOd0RYV3Vn?=
 =?utf-8?B?cTQ5ZExhYVdVdm9rNW5rOEJXdFpDY3daVjFseGRsenlCSmdOVk81YUhwamFB?=
 =?utf-8?B?cmZRQ1RUTjRVU2txZHRLZ1lLbHhzYTVXOWNOWS9ycmdvQ0JtbnZtU21Fc3B3?=
 =?utf-8?B?eVdRd290ZUk3S2dTQXgvNlNGQzVISzh4OUt0cG0vQnVwdHNsMTJVMmFiQnNw?=
 =?utf-8?B?SFRxSXhpMmpVR2lYNTlQVFVmT2h6RFNGamJXTEp6Sm5ud0I5bDBLTlQ0ZXUv?=
 =?utf-8?B?K2ozdTAxanNrMEFxNHdJb2x6VkFyWFRETWF2cHhEeUFSK2EzWGZqdEdMQ29F?=
 =?utf-8?B?a3d2ZFA5b0Y1WjRBYng5NzNzekpIcGkwai9WeDcxODFTdFNTSW4zYWZDNUxO?=
 =?utf-8?B?SjVCdnpuUHhQNVN5ZTAvWkovcjkzSHBLdHdQRjZXVzREdlJBK3ZaZSs4VVdt?=
 =?utf-8?B?ODdNMEdpcnpYdFhBSTVkSEliWGZFUFRKbTdIbHVqZmVrNWV2RG9MMDVIdUl6?=
 =?utf-8?B?aFdBZTdWOHdKRUQwMEpXWm0vbmw1dUFnUk1NenYvMTFOQmJ4V0RUK3QwcDFa?=
 =?utf-8?B?b1krV2JBeDFFV0JrR04wSXpNU1RWVSs2ejMydld4VVVEYkszaGo0RDU0VVFK?=
 =?utf-8?B?TXc9PQ==?=
Content-ID: <D29EE2EDCBBD504B9B58AD7579BAB432@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c39948-29af-4b8b-b8e5-08da79047370
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 06:08:44.9475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+DiX+3/bKXlgS8E4hWJzwo/4oHrkDzIquKY5POnAfecWSEedF1MsOus1EiiQXY6/ClDhsmYV4yz4sEluyjOvNyZEwHOM6P/91tonYngaDQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_230854_918219_DF44CD34 
X-CRM114-Status: GOOD (  21.31  )
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

On 8/8/22 08:42, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 8/8/2022 1:47 PM, Tudor.Ambarus@microchip.com wrote:
>> On 8/6/22 09:34, tkuw584924@gmail.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> Hi!
>>
>>>
>>> s25hl02gt and s25hs02gt
>>>
>>> Add ID, flags, and fixup for s25hl02gt and s25hs02gt.
>>> These parts are
>>>   - Dual-die package parts
>>>   - Not support chip erase
>>>   - 4-byte addressing mode by default
>>
>> CFR2N[7] CFR2V[7] says that: "For the DDP or QDP devices, if ADRBYT = 0
>> only the first 128 Mb of die 1 can be accessed."
>> So there are flashes of the same family that are by default in 3 byte address
>> mode. You added support just for a subset of them and used a generic name,
>> which is not accurate, right?
>>
> We added model #15 (3-byte address mode by default) to address special
> requirement from a customer who needs to use bootrom with 3-byte addressing.
> Anyway, I overlooked model # difference. Thanks for pointing out this.
> 
>> Can we instead make an algorithm to determine the current address mode?
>>
> I have just found that we can distinguish model # via BFPT DWORD16.
> If Hardware reset, Software reset, or Power cycle can exit 4-byte address
> mode, that means the device is 3-byte address mode by default.

I don't think this will help us. It doesn't matter the default mode if you
have a non volatile register that can be updated and changes the default
mode.

Are there any registers/data that can be read successively in 3 byte addr mode
and then in 4 byte addr mode? We'll then compare what we receive from the flash
with a known value and determine the mode.

> The questions is can we implement in spi_nor_parse_bfpt() in sfdp.c or
> post_bfpt_fixup() in manufacturer code?
> 


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
