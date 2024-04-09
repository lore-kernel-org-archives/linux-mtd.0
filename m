Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05306CD1296
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 12:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3F6Y9cAMuimt+XMmY01pu0OVPqTitlq4fNTZNGC942s=; b=4toLJA/o//BX3O
	cKQi6TABPY54HLUnWBqcfNKxnLR7H2I1yC9HviOXFyOgB7B+1okSfGFFstIst9bLbFxU31hH9IZDN
	jPM4ARr6wv5I9QBmLAHYuCO0hxwu6qSKEw149dJhhNz2flGCaIQAgGOLhm9Pf6rxDWbR1pjBNJjWh
	ce/tIk3utanLYAib3wpRqAB0Xzf0/AW91BWxpj9wnFWeC6YF31cRjmpkh6NZHUIII6TEXBrpj9dy2
	OSAGuNyBQW3XDzhTIvNmPW0CouEaAHzztOBk2dxfEDJwXgvO9ntOdfcJc5ZThORD5mVwis7ESguhl
	9vUloZFgGzHTHhpFuTbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAGE-00000001rG9-35lF;
	Tue, 09 Apr 2024 12:07:34 +0000
Received: from mail-dm6nam10on20721.outbound.protection.outlook.com ([2a01:111:f400:7e88::721] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruAG7-00000001rDs-3hTU
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 12:07:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KkhOyiaNhZ0pE6Rw10YfM8jOWCMualq1WkIl39hAvxLCDnBOOIeU95Yt6fyZ2nky2xUtnKcZwT/H8ZI31RIx08jv96tPx8d56jlcQ3JgxFndcWALQI2H1WLpdS+CIRlRzgK6soqMz9tjoZgq0Ox5dJfWo9R4TsuwKp7wEfOBy5vFcUDvzckTnvQpteFbk93czNa07FFSgracm4Md9PTI/VULoZXWCbQvUWTaueUHNF6gQa5Ynki7Sw5yhSSFA9wMWQLjCYj5fL7gsKwk7nfhCZhZfEaZGEQGX1/rzxGttyP41cNYASy+OjNCuQlPNlQm3hEt2VyXpIQ0prtTQ7IMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1Er3LI5xLPUuCf5+LDTPmExZ89HrYcF0O9GhE/PHY8=;
 b=m/Ax0jjNVCP/su2ALMfcM+WbSnNB69q7wtj4hReTTwL11OzXCZM4TY/CDcugOfgw+EieXIQwXdBFAqA/FUpi7NQujuZKVqJABV1E9ul71rzDEp/RiITQmLKizXhgMNxOteCJI+mJHUGe4XLPVb7xRa9bA/asnmkfo88ByxpQ5dazcwFJt+MpY2ZFF43eP7gOM4r6BrSaLjcuOzdQngStDQAWKsg9wAI404UPVlVsXTHBa5dWdIVpw2M+Hi4EithBxA3pNrg79NU0HYFX5ClzLSIbQMPFtlJSvT0GPD2U1WmzvXxn6TeqqJ0rokg6fErE4ur5J6wdp9rGE49EQe9vnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asem.it; dmarc=pass action=none header.from=asem.it; dkim=pass
 header.d=asem.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1Er3LI5xLPUuCf5+LDTPmExZ89HrYcF0O9GhE/PHY8=;
 b=GYQp9av2pdoL4SzxGpkimTKHwN+RrNoc8kvHbBUG9NPDAoVVOGI0SoaTWj2HyLoFxlGiHqnZjH1wafBdGwk0+vBIzvJeWrGuC5dw/8J/TU8BSLaWCE7tvjn/WKxj6I03xlF8FYB9dK664B37ROqDE6ouNUb/jMmA0LOnsnLIcVKateJ/zQcL7Np2xTtLaPFZgJ9R0WQTRRLXZPlxEukNjVdtWWdb4k1WbmVjbPMBDV1loyOFjkTc9iPsbYoWra6/B8n6P2Wmn/xo90M0Xu/ZGbSU/tCGycbhbz2JORDv/o3ajyc74t6tV+onHVFjEfmj0dxTeuOrQAU+8QjmNnItaQ==
Received: from PH0PR22MB3789.namprd22.prod.outlook.com (2603:10b6:510:29c::11)
 by DM4PR22MB3675.namprd22.prod.outlook.com (2603:10b6:8:66::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 12:07:14 +0000
Received: from PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7]) by PH0PR22MB3789.namprd22.prod.outlook.com
 ([fe80::35ce:ff48:fa8b:d4a7%7]) with mapi id 15.20.7409.042; Tue, 9 Apr 2024
 12:07:14 +0000
From: FLAVIO SULIGOI <f.suligoi@asem.it>
To: 'Michael Walle' <mwalle@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: EXTERNAL: Re: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb
 entry
Thread-Topic: EXTERNAL: Re: [PATCH 1/1] mtd: spi-nor: everspin: add em004lxb
 entry
Thread-Index: AQHah2eFH/UzLpYvwkmv+sCIpITisLFf3RJ1
Date: Tue, 9 Apr 2024 12:07:13 +0000
Message-ID: <PH0PR22MB3789719A62A1EE483C9FDF76F9072@PH0PR22MB3789.namprd22.prod.outlook.com>
References: <20240405100104.480779-1-f.suligoi@asem.it>
 <20240405100104.480779-2-f.suligoi@asem.it>
 <D0C9NCOMI27O.2VW2U3FNFTSPK@kernel.org>
In-Reply-To: <D0C9NCOMI27O.2VW2U3FNFTSPK@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3789:EE_|DM4PR22MB3675:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kQLW9//VrI533LIsCjcQGYFZT7VZticbvGAiiwCAWi2SirsLpy21LzVOIk1pNHVufoSDHZOcR3YaDOvJmWcfCGdQ/unfZpph2pHVMsQQHyjkkwtkbD+2DkQiEFqk9FP6x5I2GrebI8qRFuH+h26yXA8BP86mAujZecz2I260cbLJktQdPIXh9BU17IibN9Tzlg0f/OSpQeZqNd7QTvM4vVbwirXTKH8I1EGLVYfat03TWth5XWewjGK+QrbYyQx2gloCz9eio0pZlJ3384yNnxwvTfytSXS2jUZ91uu7aFy4AtpWOAajrGfb0/gt4DHQQ9wSSbx5AwNiyHSBPx3WuXnJ4At4XC8/8MBlC6s+Sfs5U48AzN08lSoKWaZ8sF8RYOAt4Eh8fuksUe4nT+TKL/7Zin+mTRi7yx/AZUCRg3tUXVnQUc2hCgGd36gtawtTU8Uh2dfSm5+LvgOE9dYyPXL9mMT0sNMDBosryPWGcNYJYZivP0rWZVJNmv7orUT4EoIWB8WZEdFmE3IjptFk+k+IZcvCWQxp0p4XlJVQRIFp00xOVTqsPxjUgtgJcUKYaJKMvx34AXxWlRLVrlXPnhGn/DsGbBm2XefB5+YXYSVX8d28MvA6ZMQhlPfEhOtpLmoa0fd5MmKCFZd+IdE9O6zprqqsUNtIm1TfzsqHv2E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR22MB3789.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0VFRGhWNm5VdTBMWVN1c3IreTRmQ3RaTzNMRjZseStwVDBJcHRpbXJ4VXR4?=
 =?utf-8?B?a0xWWVFFZWFOT1VHWXBLS0tBNjBZTGQ4N1JMVGpzK2xKc2lrSEh4U3pMdHp5?=
 =?utf-8?B?ZDl2aU9ZanBMS2p3VHMzOXNYek1PNVoydU02Z2YybUpiWFdUR1NpY0tZVEky?=
 =?utf-8?B?VkJQcXZpMUxieEdmOWsvK2F1YlJaUVNtbzZPbzY0eUgvMGZTVmNlM1pBNzJy?=
 =?utf-8?B?dkFjb1BBZklEdnIrZm12ek56cU5nQUxTekNHS1c2WlJqeWY1MllEc01xRVJ1?=
 =?utf-8?B?VG5CVXRmL2xuTDZENGVOaS84WkFNYTRCN1I2UlpBZzlvTFdOanpoSXN2QytK?=
 =?utf-8?B?NitlZk1UR1pOUVd0ZjZTbkdYQk9KYmJhMGxHWE1XQ28zellNVVg2c0JucWtv?=
 =?utf-8?B?WE84WnV5RjFIQ3NXKzh6alJNQkFQWWpZOFBHNWhiUkVkNzd3V3JTd2Q1c2Fn?=
 =?utf-8?B?ZDJGSEVZalQ4OFAyYVB6N0ptVDBPaEVZYnRKK09hYUFVM0lBVjdjVHM0R1oy?=
 =?utf-8?B?MWd5K1IxTG9VSVlVK1hnaWVMbWRFUGVkZkZ4czVzQmVhSXdSbzkwVEJDcmk4?=
 =?utf-8?B?UXExOFNiR0diWkRIWERxZHVpdzFzQi80enk0WGRrZ3h5VVc0UlBUdC9GRTBT?=
 =?utf-8?B?UzYvSFA4RWhnSTQ4b3Irb01YODA1cWhkbVg4MmZWVDUvRDA2amRkNWZ1YldU?=
 =?utf-8?B?R1hLcXFaZmZlNkQ5TkpBOE1VSXp5UVJtbUNweENMUFdWQjloTWxycXVtN0dm?=
 =?utf-8?B?UVcyOEJyR3lhaUpkZkN3Zlo1cEVFNHRNV0ZtckpqTnFmU2JoNDhURnIyUy83?=
 =?utf-8?B?c0FQaDJiU1crbDBUdWJOVWxWQ3hVOFk4VDM1MDNnanYzb1FuOGVkSit1QkM3?=
 =?utf-8?B?SWQxcTM1eUdiVjF1RXZpazJwaWEvUHdERnpISldLZE91VEdseW9kd3pZQ2lI?=
 =?utf-8?B?YjZmOEF0V0RPK3grS2ZhRXVBeHBQV2luZUYyV3QzZzY1RXhnbHBpcmQ3bjVX?=
 =?utf-8?B?KzlqV0ZNZG9rZTBuQ3JTa2dGSDFFNk9KWWZ5Z3pIR25aQ3FoN1hDdUxlb2Fi?=
 =?utf-8?B?S1NwVHp6MFMvMDF2MW8rcnBtZDlITGFJRFBTV3FacDExM2FrUWFmZ1hYRWxt?=
 =?utf-8?B?RHFBZFNJdGcvQ3MxQnBwMGRNQ0puVHRIWmo0UUdhVFVGZVhtekozYmpJNy9H?=
 =?utf-8?B?NWhiQzUyTzUweGJDZFgxZWU3SW5BMlRaaG4wL1pMZDF0akQwMTBxYUdBK0VH?=
 =?utf-8?B?SUx0K3kyUmplK3lpQjdyVDBuNjNOMVo3ZlNnQzM4aWZjYUNrOE93djBNQ3ZM?=
 =?utf-8?B?OWIvc0VtOVZKMHN1eVFCTStoV3NXak0veHc0VGhtVTZPQlVMWTUwbXF6bmZn?=
 =?utf-8?B?UzFGUnJINGdJdU8yV2Q4UEFBYmtqVUQ1eVBvbDlEcStlZ0V4bENDazBBbjAv?=
 =?utf-8?B?LzJhTmpMY3M5QitSU3JwcHJsYXlrQVN2TE9HcS9oTldBUmRqdTk4SCt3ck00?=
 =?utf-8?B?d1pQcGtCb0s5MDdCV2RMdkR1YUo1d1cxQnVQaWhrY21Gay9NQjgxNklHKzFY?=
 =?utf-8?B?c2JRd1RaNlZwaU5nbStZYjh6a2VFR0xJSWxNdHBHWWZCY3VQOGdTRE0xclJv?=
 =?utf-8?B?eS9wanFpQXQwZEFPTFh6QWMrZkFVT2FUSnlSVWdzWkJyYnlLeGlRckFHYTQz?=
 =?utf-8?B?c3VSaEdWU3QxQjhMR0lZek5YMm9SMWlmc1lTYjl4OUJsWlVENkE4WGtUSWlS?=
 =?utf-8?B?NXArcUQrR3cyTGtSTS8wdUkyUGk5VjM5b3RaU0hVeEg2VlMvSWtjVEJ6Ujll?=
 =?utf-8?B?MjdnMzBVb0d1alNrUzFOR0dXeWdsNTVINnFMQmVPSTF2ZHgvdStqcWExTC92?=
 =?utf-8?B?MTROTTIvUHBvZlYxNDNzSmErV2Zsa1M4R0RYQW0yK1R2NFZCMmNEQ09lcmlM?=
 =?utf-8?B?Z2E2QnVsSnk3SzJpby9UQUhlbk9zdnBwN29TMFRHbVFrUGZmdkprQ0NDSkZv?=
 =?utf-8?B?YnBVTUxERHFKb090K214amJKampqMXl4TTFyOUl3OXEybFZtT1RoUURqdWFh?=
 =?utf-8?B?OFhsRDZ5SjhxUnc5QUNjcm02aEZxUlFscFFkRXhuVFozK1FQamZxVEdJdEJr?=
 =?utf-8?B?TWNBUVUrWTNTRHNaTWVGSVc3WllyQURIL1E1NTVUa2JXQVh4QnJJOUx5RG93?=
 =?utf-8?Q?9lqVXEFW8J6vI4teQ14s7ak=3D?=
MIME-Version: 1.0
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3789.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b90847-c0a6-4b29-9c20-08dc588d97c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 12:07:13.9611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 855b093e-7340-45c7-9f0c-96150415893e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QG8uqFAn6/Zy6DQfmaT7PBcmvphzLQU/vl94q3H/Jecw/y3Dc9sL8Q6zHQkj36taLe6csyBGn9V6gmFhcIqAZc++P+ftvpeGMJJdG5He6K9wrmzdwwmjr+dKZGRUJF+K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR22MB3675
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_050728_290785_D4806824 
X-CRM114-Status: GOOD (  24.36  )
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

Hi Michael,

...
 
> Hi Flavio,
> 
> On Fri Apr 5, 2024 at 12:01 PM CEST, Flavio Suligoi wrote:
> > Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
> > Memory.
> > This device is JEDEC compatible (JESD251 and JESD251-1), but it is not
> > able to provide SFDP information.
> 
> Did you try the at25 driver if it will fit your usecase? Judging from
> your last response, it sounds like it will do.

Yes, you are right, it works with at25 driver!
Thanks!

At the moment I have to use a page size of 256 bytes, using "atmel,at25".
Since the Everspin EM0004LXB MRAM doesn't have problem with any page size
(theoretically I could use a single page size of 512KB), can I update the
at25.c driver with a support for the EM0004LXB MRAM, as already done for
the Cypress fm25 F-RAM?

> 
> >
> > Link: https://www.everspin.com/file/158244/download
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >  drivers/mtd/spi-nor/everspin.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/everspin.c
> > b/drivers/mtd/spi-nor/everspin.c index 5f321e24ae7d..4741930ce9a8
> > 100644
> > --- a/drivers/mtd/spi-nor/everspin.c
> > +++ b/drivers/mtd/spi-nor/everspin.c
> > @@ -31,6 +31,14 @@ static const struct flash_info everspin_nor_parts[]
> = {
> >  		.size = SZ_512K,
> >  		.sector_size = SZ_512K,
> >  		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> > +	}, {
> > +		.id = SNOR_ID(0x6b, 0xbb, 0x13),
> > +		.name = "em004lxb",
> > +		.size = SZ_512K,
> > +		.sector_size = SZ_512K,
> > +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR | SPI_NOR_HAS_LOCK
> |
> 
> Will it also work without SPI_NOR_NO_ERASE? Also, the flash supports
> fast read, so drop NO_FR. Also, please have a look at [1] for the
> testing requirements.
> 
> Thanks.
> -michael
> 
> > +			 SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6,
> > +		.no_sfdp_flags = SPI_NOR_SKIP_SFDP,
> >  	}
> >  };
> >
> 
> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

Thanks and best regards,
Flavio
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
