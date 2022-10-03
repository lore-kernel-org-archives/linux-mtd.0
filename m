Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2757C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 06:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNwzYv3vEXAqZvx9TYt2slPEC7GipnoqGorHoec82m0=; b=cj5GfklbJrw/iD
	GpXJIMivz2KamaIAPxUlwHJaLyA6P6L+L1wETCu8fYioc6iyh+PI6EMgOui/4LEx9UF4XRCBKuSP3
	P04I3l8BsV5DhwIr8YIcwYXBFuzz/GADMQov/esMCfePdq2QBXBYwKUD8BwkUqV+11FxWa8PPLUnW
	ezPrJnyPG35/yiJn8iV5629p1dRr7RAqZ2G0KklrdgsBn+n/g0CqgivF1n9TT6y4luJPIwHPzoiAr
	p4A7XLludlnnFJQZPxMCAV9Q7jlkwMAwdaxVAd3N+mTXg+EWCwVZ8+0nx/T6usua3toEBUMNXp6eV
	3fe9Ecyzz5RvdMSa914Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofEcQ-0049gC-EA; Mon, 03 Oct 2022 06:07:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofEcN-0049eu-86
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 06:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664777275; x=1696313275;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=aPVh7QAV/XzUCvvpblfBrNjmhqR0yAPMz3Opiwsz9AQ=;
  b=EnOMgp9Ren7qvIotJwqRP5BHBn75su47j85KH65XTzVL8Qk9klCCLtZV
   azSYKatuyGizsbn1ayQx6zW5XUfgxOqnHACeoslTCV0t0FX5F2a1o1zMc
   5FKOtESa6amGQbVUDouV1JFzg1cI3XceeRdS7tACZBq8aOQ40L4wSqdnp
   fuDj7/asLckTqRDSXO8CvdR5ODOKJtYe66KfqWbmK+Vl3/lCiO3p+VUkI
   F9Svrqx4OKQ3ywbig78MMYJX+Rcp6K+/5tY5smDksqj3sgZE3duaduIEG
   RlxnRcaoGWPovwRu3hS238urV9M9KLCqGHQju5LUCDG9oolWsf0kJ3OEx
   g==;
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="176711599"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2022 23:07:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 2 Oct 2022 23:07:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Sun, 2 Oct 2022 23:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQX91FXKnw8LuNkNK8xYRSDPgmcpuVD47o9lDN1RimMWi0CgavpDe2IKj8A3S1ZP7BL8zEGj4mb4zznzhjS8x9Hjmy80j025XCGgqZwNrv6QwoqmJRDyzcD6pXDWbrS2pbUokOc6phr7idhWeaqjbo/S+McOydSPzdmFtx9K+KIrSVkC0VLORfN8dZ5iIH0ul8roNHn3svC6zUodiRxcqDTgkLSbNiAbYWoTy6+hSodEm0P7sTa/bLh4oSXEEzHtlTNEJnTOd/Zh43oEvcttR74AC9pl6RE7q6ZRRKJefQ+FXgGxOGNHIOts++PNfNIChqjI1UWBnflMC8jEzcCDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPVh7QAV/XzUCvvpblfBrNjmhqR0yAPMz3Opiwsz9AQ=;
 b=Ql/8bAzJ33nop//GMeI+ubGOvPEmBQnFhCrvU2fMaUnSWpMomxri8eFfNDteu5SJt86biCpxSltGxGNItQgwO7qKXr55ukbHrUNezJLQvDpB0s9BWpmMB1LF2Uco0l27vH0xpKFBBhFv6O2u48SSKs19/GqnXDivD/Ys508Hnrc6ARCI0imkA2AxnJOCzGJdREUE9eS4J/0etVmCa1fggXliuoL5oCmMfUBhfKGnfLrX3xdJaDN5GFuTkZ5k/5npLLFaLkVzyMB2ocrexoI5nOWVdc+dd94vsOrR9J8/FEOISqlSLNDhorHUo4YeAAaJ531xMx1osdLTlow3s+AWtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aPVh7QAV/XzUCvvpblfBrNjmhqR0yAPMz3Opiwsz9AQ=;
 b=FVTX3u/FtcIYkv21wv2fdCGBtsAJ4s9Hc9nW1WZC22QOPVSh1ZD/KmFIOmF56xcH5yN+2JsxmV46rLGJnR+h+eY4gnTG9eFfsoexKaCVJr6NCWqHYV+vCszrBqp5vnDy55DEz3jyT9LuSRHuyi1TgSoxtrjOxlIwEbXOq0Ar2b8=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SA0PR11MB4767.namprd11.prod.outlook.com (2603:10b6:806:97::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.28; Mon, 3 Oct 2022 06:07:42 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 06:07:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <pratyush@kernel.org>, <michael@walle.cc>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <Bacem.Daassi@infineon.com>,
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v2] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Thread-Topic: [PATCH v2] mtd: spi-nor: sfdp: Fix index value for SCCR dwords
Thread-Index: AQHY1u5z0UMUx147eUyP0vTqr8JP4Q==
Date: Mon, 3 Oct 2022 06:07:42 +0000
Message-ID: <4576414b-af90-1ec3-ab38-9d59c915ec1a@microchip.com>
References: <20220912051317.2369-1-Takahiro.Kuwano@infineon.com>
In-Reply-To: <20220912051317.2369-1-Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|SA0PR11MB4767:EE_
x-ms-office365-filtering-correlation-id: 244f79fb-2de6-47eb-2faf-08daa5059561
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0hXQBk3TtKfoPZH1NnB31n/G7DDlQ1P3z37/Pn4bkfm10h3NoI7psQlT86mGIpDPt09DfXv7Va5htRxnyODnciOXgU3Jt74hfDmwQ3bF2/WPj7dM5MHZ9HY8xcr+e788hDJqjvHk7IN5pcwReJbOm+PPjtbiUzLgX+yhiYx0S8ZTMGlcMI9ECyeaz0XHKQ0pCnnxkSqaR2xaUPivbMC8+lbOeLL7JWtEHY7+BCMx+04sHX0GpvVHPl8/rymcBjESaDsAjl5LxXWE/NXfBt4WYnFjdirahVr8BCTnZiwo+UfboH37i7n0aAZYfA/SchdnoM50iIcn4F3EFxPHu8rjnmInCH7l4gvOahE6qfv5bGqwKkNOTau28txMJJXK7KJLN+EZ/MN/a/vuJrVImDgkxOUdvssnwY8dRvOeKv3RBlPNPagh0qh1wYKRZYsdqnYQRuw546+muv5mXR0gL8ZpAQ4Hiia67hYAMSP0GulAojjxmFNcnNISWB/Uyar/Xi9wWFXGw6XEbmc1Mhw4Yp2td0wbRrwxnnlTjBuzrB8GIwd3yS1oJe2EF2BWUYcxYhkXFXqT+HqOAg9FpIrhFAgLD7HNnPL92DMT9ybojzSsaJ6l/fwXrP8s+nyBGR3gPeACeaN2UemD0IbrwYUxfRhqkMB+FTULJh0keaH6NT3eHCpbAROykpbFHT+xgtu2lge76aycwo4Umb9HKB6FmbACnchjRtRApqrdD7fk64Siy9WmiKQ0DghglqbDKl6lx1mECQcMAnx70tlc6XqKzz2fe2Igh4+U4hbQnh75ZnGfWvCAsmQSYrK28Um1e8Mucz0DSw742GIBqetscCFrOS9fxg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199015)(6486002)(31686004)(71200400001)(478600001)(6512007)(91956017)(66556008)(66476007)(66446008)(64756008)(8676002)(186003)(26005)(4326008)(54906003)(66946007)(76116006)(8936002)(38070700005)(122000001)(5660300002)(2906002)(53546011)(36756003)(2616005)(316002)(6506007)(110136005)(38100700002)(86362001)(41300700001)(83380400001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTM4WkdacCs3VEY1MjAyQWZuMVhrTytVNmRXdHZFaWtxR2c4WmxOV0JyUmh4?=
 =?utf-8?B?c0lNN0xYNGlsbVRWckVrdEpyNEVPOGpDVkY1UVpUamdGM0FmT3BFOTNTWStn?=
 =?utf-8?B?THZjdmRwWmQwUGZVUHRjaloxT0RZZXhrTUtHc3lFdVZMY0w5ZmpIckNzcW1N?=
 =?utf-8?B?OWsrK1lGTDhJYVhCQjI2QjhpOVV5S3dnSTI4Yll4NW80K20wdm5Na1ladXN0?=
 =?utf-8?B?MEx0WEtNUVg1TEVUL3l5YU50YVM5NVZRbGx4VlIrSWpkQkNrZGRWQ2ludjMw?=
 =?utf-8?B?VW94eExvOXlUTmt3MC9RWDJvMjlHWkd1bHZ4ZlRKQXBVRGN2TUlZdGRuWE41?=
 =?utf-8?B?QXJicjhmQ0I4cFVlY3NvNlFUeFc3ZXJoWWZlYWszWDZBRlEwSW9hMVd1aDFQ?=
 =?utf-8?B?bmtVcngvcU43OHF2Ny9VMnNDdThjS01rZVlIRG0vbnNtcVZMcWllYnF5TnUr?=
 =?utf-8?B?N2Q0bS9sL1JFNUNjdlBTSHBtdytVcDN4ZSt2aU1mOXJicnd6MTV0OVpUMk44?=
 =?utf-8?B?VVFDYmtpbkFlbnZFQ2RQcFBhOERWdDl4QThCWkt1cEFTU1d0bzBKY2FLb2d1?=
 =?utf-8?B?STA3T2wvWXQzS1JTVjVpNS9pMWd5Ty9WeEQ2NkRLYUs1OS8wMEw0YTEvOWlo?=
 =?utf-8?B?Q3B3Wm1ZRG1WOXdvWDY2V3dYYitIZ1V3V2hIcll2R0RvdmNIQXJsSFBoR2Vu?=
 =?utf-8?B?L3FlU3luc2lDMTgxaUNoYkRSazJkQklzUzdNS3g2SVFRelRWRXhvem9uR2w1?=
 =?utf-8?B?Z0taSFZQZWM5QlQyN2R3LzNqR2tWRFowaG5HWEVJa240M2Rnb2hwWjE2ekJj?=
 =?utf-8?B?d1VCa1RKUFhkaStVVGcrdWUza1ZIU1EyL3JvZ2dVNkZBV2NWYVBoamxlaFRn?=
 =?utf-8?B?SzErQTlWZk9UT25OYkR1d0o2eDNha3FJUFI0ZXRBZExlNDVYWStBdmZlK3VG?=
 =?utf-8?B?OWZ2dCt6SWM4a0ExSnpTbkVtZVRKY21aQ3NlTHR0eU5uNDFaZzFBWXUxQ1R4?=
 =?utf-8?B?UytNZ096TzRBVXpyemJoZEM3SkhqTEJjKzY1UnFVeEN2ckU0d2U2TVVWTk8y?=
 =?utf-8?B?ZUhCbk9RTHp3RUU5a3cva0ZsRVJPZEswd0wzVEIycmlZNGNsdXhuNmFKYnJx?=
 =?utf-8?B?cWFoVjRDUHRqTTNSaEhTdlROMllqOWVmMDY5VC93SWU4MVpYVnNHU251ZDRS?=
 =?utf-8?B?S1dSY205NmNpQ2J0L3Bqd0JlN2NLVVFBWjJXK2twNUxROGxEanN5OWcxdThh?=
 =?utf-8?B?S0s4eGtLU0ZyVmdXVGp3TVdjeFNnWFYyMUJxeVJDSlV2Q1ZlNCthSHVIL0oy?=
 =?utf-8?B?NkR3dXNmZ0tNUWFCSGVzbjcrdGZ3ME1Ham9RVWt4dU9QNTVhSUlDL3A2OGtI?=
 =?utf-8?B?RDQvaUZUcmxhK1c2VnhacXdjRkdRbjFDWFV6OHA3eUVBbWxFdVlFTzJydWs5?=
 =?utf-8?B?WTlFUmFoM2paYUR3Vm5GMGMrcHlMK09CN0duN1JpK0JVcHIxR0V1ZWF2QlVo?=
 =?utf-8?B?VmxYb1A5Z2pkV2VVVG02Mkh4Q254TTFOaUl0Q3puRUlnRlAzYjBBMTh5VXpm?=
 =?utf-8?B?TWpCK2d5dnoyS0t0S0cvNG9HL243R1hweGFtT2d0YmNZVkZadDFRU2xpOGJm?=
 =?utf-8?B?OTlzNHh3Nnk0NXg1N1p6QU9JN21DcHVkT1ZxejAvSjgvMWl3clphT3RoU3B4?=
 =?utf-8?B?L0JLUGoxNkhzM2Rram5WOE0yc09vUUhTc3BOalhjTFpuNkFUSGpBeGpOVFR1?=
 =?utf-8?B?QXVmK0lVbzNvS1FTZUgvUUJwRlpSRklFVXp5QWt1bVZtSEJ1WlFZTnhVeTA4?=
 =?utf-8?B?TkRyNDdsOWNLRVY1Q2phcTIwR3d5aGVGY05LOThmUWtVdGFhQ3lpYlMzakpu?=
 =?utf-8?B?TGNlQzZadm5ZRXBYdFlZQXpUcTRKN25hVmZXWWN6WEhMazUvTkJiV0liSHk2?=
 =?utf-8?B?QS9VcnRjKzZSMzl5L2JzZ3hiYnpSUUY1a3hoQWFuR0xJd1JncVRGQ0pnR1pP?=
 =?utf-8?B?YU0wN2pnZTR4UnJyUldMTlBPL2pyS3BQL2cwNVpqQUV3QkZnZzd0djV2ZFQy?=
 =?utf-8?B?M1NLU25PT3lzSGpFWUw5R2t0WjcwR3dVUUliOG82OTFWdDkyZ1BuSnF6bW4w?=
 =?utf-8?B?SGl4TStobGpDVWhMaVM2ZTd4UDRLL2l3MjB0WEc0Wlp5ak5uY2FqTDFjOHhG?=
 =?utf-8?B?QWc9PQ==?=
Content-ID: <CE25A77E4A3B7E4EB857147B9A992794@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244f79fb-2de6-47eb-2faf-08daa5059561
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 06:07:42.5627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jf8AGHxc6ucywWA+6oh6XEVi6aTfinYe6g8Ki46EBQc1MLJPKRQ3TyLG7nh4/u8tMVSSsbTKdnOTm28D8dJqSH5WnDHL/Aeq+pN5NT1KgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_230755_640682_B26FB84D 
X-CRM114-Status: GOOD (  19.50  )
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

Hi, Takahiro,

On 9/12/22 08:13, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Array index for SCCR 22th DOWRD should be 21.
> 
> Fixes: 981a8d60e01f ("mtd: spi-nor: Parse SFDP SCCR Map")
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> v2: Add Fixes tag.
> 
>  drivers/mtd/spi-nor/sfdp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 2257f1b4c2e2..681e5e78724c 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1222,7 +1222,7 @@ static int spi_nor_parse_sccr(struct spi_nor *nor,
> 
>         le32_to_cpu_array(dwords, sccr_header->length);
> 
> -       if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
> +       if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[21]))

Would such a change work?
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index bbf80d2990ab..e83d9bd89066 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -19,7 +19,7 @@
  * JESD216 rev D defines a Basic Flash Parameter Table of 20 DWORDs.
  * They are indexed from 1 but C arrays are indexed from 0.
  */
-#define BFPT_DWORD(i)          ((i) - 1)
+#define SFDP_DWORD(i)          ((i) - 1)


and use:
+       if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[SFDP_DWORD(22)]))

and dwords may be renamed to sccrm, from "Status, Control and Configuration Register Map",
so:
+       if (FIELD_GET(SCCRM_DWORD22_OCTAL_DTR_EN_VOLATILE, sccrm[SFDP_DWORD(22)]))

But you'll have to check that all the tables from the latest jesd216 (e version I guess)
use the same kind of indexing. Let me know if you'd like to pursue my suggestion instead.

-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
