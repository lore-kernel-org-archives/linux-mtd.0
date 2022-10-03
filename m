Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1CCAC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 05:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPmO16lyxyAjzXkEBlqPvksLXktTdk480761svxRazo=; b=I8+fSECSjY+rg1
	7dRu5UMLgsKFazxHa7DScwnI/MRqIIavyvyMb9nrtHFLX1ZKcowhjLeDOKKFFtk5KIhu3ltVX3X78
	GtE6bHIXfJGq1hnCJeCwFOhFP8RjfVE+jY7j9vHRhc8JgCZknB2D+61u1f9ehfRaaIpRXoGZ4sSoU
	rHJv7hwtnm1E2f+0NpZhGu7q1zY9BLr5YLq1TWUC4pc3xfvdVqExAWHja0cA0HxL9b0BQtG51ZMXc
	sAopY9psUtPgIqBS8ZODxI0zgybWVoK5QozgffNzy734vpAGZFU+4KAo6TFgnTaxYz8oAKGoPK4t6
	/syFBeNdPuTNLBFdSGrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofE7b-0041ar-3V; Mon, 03 Oct 2022 05:36:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofE7S-0041Yp-FJ
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 05:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664775358; x=1696311358;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8mgmY1FOPlu4VDRkm5VGX447wLvF5OS3WgUQu7BmwlQ=;
  b=xkuFRbADmPZOlXrSp/mE4hZa3shaujbjOQzoZswBdcnX+Nyepwm1zrnG
   klf8MCnqEPXyDL7JVN54Q94sYgQeIP7WwVdPLl85ktzsFHtIAXVuUIz3M
   TnLGTGwURDiKggH/JSaFhqkbGRL3CtK5U6Gu5qK9M6gIftQUq5ye8NT5h
   d5WDHmu3750smiWWccJ4IveckKfpeCipJV5B2zqASo231DDM3J9G4JpKJ
   aD+6Hw6x9tnj7sYmBi8XGhhStRN/hFfXpQoHaC/dz/z4z2QB74T/xTfBg
   sV/uwdN6HV6yGISOG6NNfR226y4aW2DftuK7CCeap7lDepcubbH52sHVV
   w==;
X-IronPort-AV: E=Sophos;i="5.93,364,1654585200"; 
   d="scan'208";a="116515486"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Oct 2022 22:35:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 2 Oct 2022 22:35:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 2 Oct 2022 22:35:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oX0dxuDJfVAu5Rdox/INJPcGp0pRzD6ORftf1SEvuMwhbLjN7LNq9iM4AdmmAzrkB4vgarbEChhvE+RNVsegy8KuckzvuBwmTFGkfVe+BWm1Q8bLqbdUJegwcwK2yGnGnQJHP0pPvi1z/j0EzSOnzFgNZBOqflafB2Vh8ZrnLl439yToCd4G2/Z+43qsdCh71lr8Dt1kBKI8OIQDw6yq9XPzaPPMLeqrSOhKwkrYGkZjN0EaSgWcOFj1XfdpO2gmOgAx6a9OeOdVXB5MoIm4EB81QxjBFNIpJO8Ea/ekblicvwSg53J8p8ojf1DlGxbXhqnfDfXNH4UrFVo5vXhafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mgmY1FOPlu4VDRkm5VGX447wLvF5OS3WgUQu7BmwlQ=;
 b=RUAVVwSJCN8IeBJhxQyuloVn4RexTSLHMF4nOJ3RbPmcW6viOQAZmBUXxUsNnoRdyX/+Sg0UR36dXv3Gas2jP/CnZS5nPHTa49UhuSapBxI4IjQI3NfgXAM7/vRZVEGfSxs9nExE5kf97uqWXQr+2LIQkjGmthFieUUvxcFA5edCf1LLqDlvNibTpXnzdhaHcbjYgGS4Stnc0UkvWZC0yHCue1qTzTxV8Qm3WpnP5Ex2t9mh96zcGay+34sn4gVpZKZTM0Udb6Iw1eTE3ACn0ro2zT5lmsvnArXIlOQpZKwZWByXy7dx6fJ4LKH0uM2va2pPAIXDlBKONhgbXOZOBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mgmY1FOPlu4VDRkm5VGX447wLvF5OS3WgUQu7BmwlQ=;
 b=fn1/F9StQ7pMr0d3io/rDKi3TbJTZ/DXu0o0OGPp25gnypll5V3PE1xcrH5WGJQ41vWKSxoJvPoJaq6+iAeXD5AOwSpDj7klNzarUXDzG0ed3W33Bt7P1wGOd8WU6ml/doQmEpe8Am3Y7EO2RV6bnFqChJxS3nMbBvSvECaCuN8=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SN7PR11MB6994.namprd11.prod.outlook.com (2603:10b6:806:2ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 3 Oct
 2022 05:35:35 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::416e:c09:92d7:fd37%7]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 05:35:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yaliang.wang@windriver.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: gd25q256: replace
 gd25q256_default_init with gd25q256_post_bfpt
Thread-Topic: [PATCH] mtd: spi-nor: gigadevice: gd25q256: replace
 gd25q256_default_init with gd25q256_post_bfpt
Thread-Index: AQHY1un1B2QwCOqq/0GzsopZd2ehTw==
Date: Mon, 3 Oct 2022 05:35:34 +0000
Message-ID: <1dddc60f-44fd-df65-f491-be8379fe2380@microchip.com>
References: <20220913084023.2451929-1-yaliang.wang@windriver.com>
In-Reply-To: <20220913084023.2451929-1-yaliang.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|SN7PR11MB6994:EE_
x-ms-office365-filtering-correlation-id: 24376912-5035-4e89-80ab-08daa5011860
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EsKwea215dAGUyxFpRmXBCH1pJ2G8BcKnqfJn4gL6rh+HH1OZZ6/BLpw31J7x/bzdFRG8uZNhAVtjejlUaDG/zAh+7gEbjDOPiTKUO2S/UjHIqptZgaHrqU2FRBWh1STjf0iqTAIcgkV+i5LHfSKRgFdpq0BbmMxbxGxT5jTU6YQJjDRJO7J9JVjCKrjgf7N0JVH9ut9ly35SyPbPgZomAArlS8WATdF+QIAPHzePn30z1SVxhSPCjlsmsehPRXT9vILk0B4cqsQVVQQh0iGSPmkv3RNBE7SCIdG+eBzVaZcmC0bGbxG08GT3YvvqXIw4SzZN4SO8elDxx9jU4Z3CkRqAOokJ6pTHBF5J+kTYPnlj9omjzw1KZsxnGLLBDpVgDayYg+0Nogpo3gyT6h9q/9/Rg6slUy+yXkQNsz30MTWidJbgBXM2Mtsuir2hU6V18l6nwGlnobSyShqXqEDHD1gGhDVIQYQeZpSjoiSMs4JwL2Xfah17f2DKXHn/KU7NoQdXgC35EmaMLhb2hrZ01Um6O2t7Bv04JXM5lr2IuqNqFAN51sOkyRoJcPwvXmjm7qyk5PAASS6aSEep6M5thSofg3Wdfc+GPdjfH9d7SPYzLR406bUzcmYNo2H//nFksuEuPixf/2yQq6v6SOlV0W0QHDaGVd5Iv+bDHNUm/pyEMCk90uoXI82LQy6zv55GfnMmTmlE3JDFxrOQaxq7qxwmtpYC/5zWWNlhlsnqd9szS+zOFKQCHx1TMezGzJXrdQEHDi2dEZcATqFkxUaSqi7tbVZUTchLtlMgh2OLXzmDPP6AQUXOX0FXz0XMgmxc1hGxfZ5oTPMiQFAgO+R+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(36756003)(66946007)(122000001)(8676002)(4326008)(66556008)(66476007)(66446008)(64756008)(76116006)(41300700001)(54906003)(316002)(38100700002)(110136005)(91956017)(83380400001)(186003)(53546011)(86362001)(6486002)(6506007)(71200400001)(31696002)(478600001)(2616005)(6512007)(26005)(31686004)(2906002)(5660300002)(8936002)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXV2end6UjhsVjBPZ2c5cjNDSlVhR1NqTVU0cUhCS0hhS1NTbFpZQVJQNEZi?=
 =?utf-8?B?VE9oZEdPQXZKL01TenFRSTdmSVF5aWlTd3RKU3hvTlRYakQ2dlphTU92ZjhC?=
 =?utf-8?B?N0JTbkZVckw2UlhlRytDQ3FCRkU4V2pXNXJXU2lmRkRVT2pSWkxRZHZjVkFs?=
 =?utf-8?B?NlNqSFFRNkFmVWhtN1ZERlhaZGVRQ29iMy9SczY0U2hqSTQ2eDVzbnF2cHFC?=
 =?utf-8?B?YUpEdkNONHNTLzF4dVdJN1FWTVhxaFcrOEpWRzd2NThnbWRWWFNkWW5RR016?=
 =?utf-8?B?UFR4L0czbjJTSktxMSt5TzlKTFJPMGlabGJMOTV6UFVvN0VGbDZycy8wa3JT?=
 =?utf-8?B?U2dvV3NSTklGZVQ5SUkrQzFoNGRXZXlUTG1NTHRmYjVlclFkZUladWxzWDBs?=
 =?utf-8?B?MitsZDRycTQ5WmRqalk3S0FWRWIvREs3OC91U21ZcTFUV3Y4ZFBkNk9JZ0lE?=
 =?utf-8?B?RTNtSzQ0TGt2K09rNjl3eGtpdGcyaEtXRTUrNVJtY1o1bjBrOTI4dnJhWmk4?=
 =?utf-8?B?UVoxTHdWeVo0NE5JVnRXSnpzUUVLZHR3aTVDQUdpODJWSHRLMGRvekZlMTRo?=
 =?utf-8?B?aHd0ckFwSDRJRnFIMW9reFFSK2Z4MXBwU1pibHZIM09rVTZvWlVnQzVGUWRD?=
 =?utf-8?B?aVBkdUUyd2d5VWV3RWlyRU5pZVAzSWZLcUVNOW8xRmxFcHREUVJCQjdNcFBY?=
 =?utf-8?B?dFBLcXZTSmtKdisvdjQxTEZsTUEvNTdLSS9jcHJuWlRSZGIrdDFMQmFpa3Qr?=
 =?utf-8?B?aUYwUm5iT1NxOUJ2cXIrNzhPMWw3MGlFRGJaTERybzJpTWJPYkkrZnBLTGFo?=
 =?utf-8?B?WE9WZnJQS0RjbEFKZnB5L21XUTlXTXUybGNtaERoZ2pBL2dyUmJhN2dsWkc5?=
 =?utf-8?B?azgrZFhZOE1jYXZPUEZhblh0clh5OHN4Y2cySHFsZlJ3WkVmN2F1SDN2Zkd6?=
 =?utf-8?B?cTUyUVZDK2JDRWtWY2NvRUxrMFA4Lzh2S0YwbnJYNU56dWErMnV1TVl2OTVt?=
 =?utf-8?B?dTJrTDYxMzY5Rmh3YzhyK0Z3OXBIMUlnS094dkpCeUd3L2trelZhck9zYmxK?=
 =?utf-8?B?TjQxL3VnOW1ubktnQjB0a0ZwV0Nib2pZVTYzM1NFanFEZys1d1ZnbllXY0hq?=
 =?utf-8?B?Ynkwa0I2MFlxS1hsTTc0MjFrRWliVU1ocnRYeGJZVjRGVktwSDdYZ3NWS0FQ?=
 =?utf-8?B?YnR0Q1ZpNDl0c2MzRUNrd1ZoNEgzRlcwV1FISElERTI4bUdiK3R0S1NVYUxF?=
 =?utf-8?B?ZHhLdzdmQ2NOdzluRVpGTG9ZK05ZZkFXKy9oeVc5dWRtM3NXQjYwcGJ6cU01?=
 =?utf-8?B?Y2JVeU05MlFPTVVFdEdRUGMyV1FVcERJUFNYU1lsSXhSY21LMGw1cWFIS2dZ?=
 =?utf-8?B?S0hCR1FOSzBLVlMramlaMmxGV1BoWjZQcDV3Zkw2MTlGQWt5clpCKzlvVGZU?=
 =?utf-8?B?WVptUGhnWXBMRnlpaEN6WC9GUXUyVHRDeHlwcVBQbDFYRmZaeDlRZk03L25i?=
 =?utf-8?B?TDc4ZFRSaVdpWEc2NjZ1UDBkZXo3ai9BdjU0VmxLYUdlS3lhNWhabUp6bnRk?=
 =?utf-8?B?RU8wOFF2Qkl2UHN5bkprc2tYdk1SSWFuM014NmgwcWlEd3A1MXlpMllkWGJJ?=
 =?utf-8?B?Ly90QUl6QzNLUWRMejl0QW94ZTA3by9UcGlLWXJsOUw2ZXJIeE1RSGppZTJi?=
 =?utf-8?B?Nzh3M2JlcHhqMk44eXF0VlN3RFM0dEJldm80RTQyQXZWVThwWkdlanJ3cU9U?=
 =?utf-8?B?VzJGNEZaQ2tzU1I2d0piMmQwR3cyUTljRUVnejExZlovYWpzVWpsbWxWRzF2?=
 =?utf-8?B?Z0t6TGpQaGFzZkduZjU3b3EwN0FRc2tpVVZqc090WmF2aVJ3a3YreTdaL0l6?=
 =?utf-8?B?cnpOVS95Ti9FNlFTU0dZRWlsYWVLSzRwQnRUeDhEenlrT2Z0QitpZW90RUVm?=
 =?utf-8?B?VXlVVjJMTnQrcDZXVHlyazI3TzRiREtqNEp3bVNGME9OVUVMNVZ4WUdTQnJu?=
 =?utf-8?B?d1hDMmwvMTZoSk5IbTRTNXUzY1c1SERvc05RbkJYR2NTbkZsb1pVUkRYTHNB?=
 =?utf-8?B?aVRiMHJJSzdId1NTODU5eVJWRG92TE03eVM3TmhVSTdJYi9GQzYzT1JSQXBI?=
 =?utf-8?B?WE8vQm12VmFvdnJvRGNjU3BNZyt1OEkzU2RYbllaZ3FlZkFKWFEvZEZqV2Rn?=
 =?utf-8?B?Umc9PQ==?=
Content-ID: <82C9B4D95BC80445B49865B66F90AD5C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24376912-5035-4e89-80ab-08daa5011860
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 05:35:34.8248
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UtT6X6aBFFdVOTQSK4bobGzLjMgkoA603XVSMyzeI1ISkWpopqzM3azqiQvZfuH04wM8OL3kezjuhOKp1KTYFZJb1Rha9sC8PQvSPZPuB0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6994
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221002_223558_596443_0DA9653F 
X-CRM114-Status: GOOD (  27.02  )
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

On 9/13/22 11:40, yaliang.wang@windriver.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Yaliang Wang <Yaliang.Wang@windriver.com>
> 
> When utilizing PARSE_SFDP to initialize the flash parameter, the
> deprecated initializing method spi_nor_init_params_deprecated() and the
> function spi_nor_manufacturer_init_params() within it will never be
> executed, which results in the default_init hook function will also never
> be executed. As we do have quad enable function defined in BFPT, the
> post_bfpt hook will be the right place to tweak the function.
> 
> Cc: stable@vger.kernel.org
> Fixes: 047275f7de18 ("mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
> index 119b38e6fc2a..bdc4d73424af 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -8,19 +8,24 @@
> 
>  #include "core.h"
> 
> -static void gd25q256_default_init(struct spi_nor *nor)
> +static int
> +gd25q256_post_bfpt(struct spi_nor *nor,
> +                  const struct sfdp_parameter_header *bfpt_header,
> +                  const struct sfdp_bfpt *bfpt)
>  {
>         /*
>          * Some manufacturer like GigaDevice may use different
>          * bit to set QE on different memories, so the MFR can't
>          * indicate the quad_enable method for this case, we need
> -        * to set it in the default_init fixup hook.
> +        * to set it in the post_bfpt fixup hook.
>          */
>         nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
> +
> +       return 0;
>  }

Maybe we can get rid of this fixup hook entirely. If it was a default_init(), then it
was set before the SFDP was parsed, so the quad_enable method was overwritten anyway.
Would you please check why this method was introduced?

What Quad Enable method do you get from SFDP? I expect that spi_nor_sr1_bit6_quad_enable,
and the fixup hook to be in vain.

> 
>  static const struct spi_nor_fixups gd25q256_fixups = {
> -       .default_init = gd25q256_default_init,
> +       .post_bfpt = gd25q256_post_bfpt,
>  };
> 
>  static const struct flash_info gigadevice_nor_parts[] = {
> --
> 2.34.1
> 


-- 
Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
