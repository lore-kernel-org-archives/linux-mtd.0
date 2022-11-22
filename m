Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EE7C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Nov 2022 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieMu7lwpNQ2y4AIGN8wOSy0dz/p5EvNDxVyFLkS42cw=; b=mSWL6n07f5gErz
	hDymz/eC0132FGIIO40hdVjfY0LzI04vpI4kNoFYIRYw5lI6/LYGY6Q0IlryKdDAVNIejt6/mFa5W
	lsjGkxFd7T1kj0poLzS9Ku+vuVKTKkb3js6IQZROQsSC/RXTPclztroQibHqJ+k9x3/7qUyvSf4eQ
	JeOsVoSrlrz1XRC2Hmnm8cFNZNXZOkiYornXfIJMIM3P9m2ch6hAewV2NCSTfS41Qm6b0DPEbFKJO
	od3f2tgJTjV+rFQGErTTr7Fsq61vJBFiceLWcuLT7xAwm+YFN1GCg42/EYSw/VT8iM+TLzU5Fb1r9
	2Lh0QjpLDfeBeWamuUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQW6-007ozh-Pa; Tue, 22 Nov 2022 10:28:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxQVw-007ouu-1y
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2022 10:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669112908; x=1700648908;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FuQWysRC8MLRuqxr+f96Hyi+27JM+H8Bf72rRM/U9eQ=;
  b=KNP6CA6g6OiKGsaefo2RPKorBRy55WTvaMfIZ4Or0FT6WHlKGWLfOd6q
   BhF8C0SHFLgpNKIHFrSGs+elxwzXoU0SwrZjilzGb3LtfUar4kgyFxNK9
   gkEr/gq+JJPiKf/gvzTPNATgcf1FyOow9vOPlgPaJdfb2qnfayNfLDYQi
   Blaj2/CF80aqqtsbxxLZhKEcs0Mlle5o2OUHHlO0l5RMHDwUm63nPo2MX
   7pteQQ0mc7F2JZ+yJU6Fvi024cdYgiJymcEeyegrApuxd+hJQW/9qFZaq
   cWRuratgvnskN3FFZQqJERiWLpu/4ziBF+0yDY18+u6D9MC64yBX3tpGa
   A==;
X-IronPort-AV: E=Sophos;i="5.96,183,1665471600"; 
   d="scan'208";a="124568265"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Nov 2022 03:28:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 22 Nov 2022 03:28:25 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 22 Nov 2022 03:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2icyxTNie5FG0lDi3FVM0CvfbqBEApFHrm5Eq1B99pN2UydvlixAk8Za3caZh2IzJiJ42nnoNZJ9pTO14tY5srWDIyhbLP9Rat45TgwMW0hRXHtQTpNm48r/M+u+d2a8VHUA0DIYuM+wZpGOH4jR39mnPBt913Resonk27exweykPi9WyYP2aiCXyPh9fBt3muG3muMQTW32Tx/pEDGqWmWXT+l9GZaVYtzoRQaz3Zkrkjud0Fp0XVPxKnxDJTcMb3yPgPTwzSUraDrjBdGK4+biksW3WMzxaUrzZLn4V050/m+III7v9voiLAC9V0EsYbgh+woqfsPVauFtrJgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuQWysRC8MLRuqxr+f96Hyi+27JM+H8Bf72rRM/U9eQ=;
 b=EGDFGkRcleajGMCH/ki/7j+BbhDB5lG0wRq2f5l1sDovja/0kUxgPoBqHLRR5UAl0FTPbd7ocYydWmDM1Z0Uh/LK0JLZaZPcueUgso5gvqmmw2NtZnikxncZzYHnX9a4Rt875cI2sINCHo9uyF6aIkK3WYPSBFJeOWeVqOHqvl5WHouJ4IGMB1rYUcTdspGxyiuxxvhOLYxtrOg+W4yAT1ElbkmPc0D6DcDSdePxRQFDsRVOCOGjOWUqksk9VuQnlvRQAjNe9zQBsjEu/bUwXgv9Y1aE5ds0Il3wdIupUk33YLEc+IUadVrGjmeqokTOREc3FXj1v5LqjKPbnp6O2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuQWysRC8MLRuqxr+f96Hyi+27JM+H8Bf72rRM/U9eQ=;
 b=j7r0IdPkR6egABmEMYQ1Zowj5I4RySwNosopy7PoHzClCF948qN9BSr+Af0QxFUk+0R6dat9K/VAyQ9/0IEtKFPVW+D7or3wnR23TkPbjr76rA4KnTF573iVnRIDtv8hNxYSS+AILovJdP0bl7cyeimjOXFKCd32mV3m+vF8XVw=
Received: from DM4PR11MB6479.namprd11.prod.outlook.com (2603:10b6:8:8c::19) by
 SA0PR11MB4639.namprd11.prod.outlook.com (2603:10b6:806:70::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 10:28:23 +0000
Received: from DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b]) by DM4PR11MB6479.namprd11.prod.outlook.com
 ([fe80::626d:ef37:c13f:1c4b%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 10:28:22 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yaliang.wang@windriver.com>, <pratyush@kernel.org>, <michael@walle.cc>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<Takahiro.Kuwano@infineon.com>, <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: add clear sr fixup for s25fl-l
 family
Thread-Topic: [PATCH] mtd: spi-nor: spansion: add clear sr fixup for s25fl-l
 family
Thread-Index: AQHY/l0l2Rc528h2FEykZ3n/FAzpTg==
Date: Tue, 22 Nov 2022 10:28:22 +0000
Message-ID: <58b39090-d26f-271f-4832-8fb41c624a9c@microchip.com>
References: <20221018095732.251299-1-yaliang.wang@windriver.com>
In-Reply-To: <20221018095732.251299-1-yaliang.wang@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6479:EE_|SA0PR11MB4639:EE_
x-ms-office365-filtering-correlation-id: b466dd71-72fc-499f-3b8f-08dacc744863
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zCw3QirRQNp12wekZivy00npAqJrtUP4HTGpsi6UNdFUdfFv+Vpl5P3HRXg/bGNT3W9Q0ePykskq0pnMglPlDtaK/JFG+LvTYrJcINEA6VebzVXJTreGn4FOrsn9VrhSHvcHPz7qQTWl2jlar8SAL7zbtDiwt7jqXEPcT79gCyFvMcKtxndDyIZFGmyjGiQBmy8I+GJpVnqVzcxhQpuRmWnGUR6LeX/22OwrOVjdlah4jC1DQElKnXpJh51qX4cLB+IMCtec/zHhm2fnBO8WqDjuC/Jw285+dzTsCSqutgJRtCfQOKxYybDKmOX3Sf7bKX3K9HLoUG0eDNxqkdjTiLPMiEDu9v0sP+xhHE+BRRbBnlKhihyD4q8etkAJkDzy/EibyxdLAy0+xXqvELhbjZR7k3JFi6xxwQ22eaKLXDxFyQwaJq9i4wgd5d5q5EAHSfstjh6+B0FJuWPjduRKHIBnzXyNG9TgoIe1Ah7K558P8gG00FDVj329r+WqViW6Ke7tiR+XFpBOwg5nfWNbhD1rDsnk5fxg+cYwUviVmOmGd5ZGfyyFcPeqNlpBBG4IFm1YKX7vlCQszrv3gA0rgMVcOpZk1cY+JU4LzuDeJCKs5HmkonGnpGuH1Ekf+oQM+fHy67I4Szqa34kbsrPKn+bUi62QmfguZ0rupgS7OEAVCMCOZxmTvXTCVIX1kS4Oc6o0FqAdVo92mHZCSg0A6nv8qvgqA9KJvkx5MmPJEXo1WdMd8Ji6a5TBeuSdcqHfaZskWC3F2ZKFnOQiu+6xiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6479.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199015)(83380400001)(31686004)(26005)(53546011)(6506007)(122000001)(110136005)(6486002)(478600001)(36756003)(6512007)(71200400001)(2906002)(41300700001)(76116006)(186003)(2616005)(38100700002)(91956017)(66556008)(66476007)(38070700005)(64756008)(4326008)(5660300002)(8676002)(7416002)(66446008)(8936002)(66946007)(31696002)(54906003)(316002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnZxcG9YdWhScXlhY0xod0E5aVRLTVUzYlRhQ3g0bGtsWVVPeHdtaU5OVUNK?=
 =?utf-8?B?eHNmdGRIdHpCdnNEdFlpZGhveFB5NG5UQTljdWpjWVg4eEhCSmRZVXNBRjZ6?=
 =?utf-8?B?UDk0bm9DWng2K1o2Ri9PdDJmcVZKdjBDbDdMM0Y2NkRyVjlKM3BpNGRLQkV2?=
 =?utf-8?B?T0JQek1WNVMra3JDYW1IN3haWGh1UzNyeXZmVFlkRU5LT0ZHUWYzODdoSkt6?=
 =?utf-8?B?TU05cHdnRjVmZ01wK0F4NE1yd1NESGlCeXhnM240TnVKbFNHS21ETThaV3o2?=
 =?utf-8?B?UUxFYTZITDFRb25FZWpOSEpNcHZuRFhtR0UxYU1ySURQNGZMcGJja0RNZ0sv?=
 =?utf-8?B?UGtiMlNrYkFvcURVRVhlTm5oUll4cFBzTmNsTlBteUhjb1NWcTBoNnVwOVA0?=
 =?utf-8?B?cXYxMGNhYVoxbzZNYjFYS3ZaejBvSEhOR2dGbkJma0tCMkNYb0dvYWpZM24r?=
 =?utf-8?B?a05HZ2lTeGgwc1VwMGV1blVMdDQzVGFodG9HSDRnRWlLelp1ZWJGMWx1TGF1?=
 =?utf-8?B?YVphL3pUTUFGekduRkpPblNHMUUzSnZkL3FZdWZSdkorczhqNVhBWjkyUVFj?=
 =?utf-8?B?WXlrRU9sd0h2bWlUWEFjZEVZcG5YV3phTEFTR2RYcWRXQ3pwTDBWVXVGQlUy?=
 =?utf-8?B?YjR3V3cvVDZ2S05UMTAxZkJtMm91d292RFRDN3JXR0ZJRkNDWWVTczRjTnE4?=
 =?utf-8?B?YVhsZFhHVWdZZUdiWXN3Mm9lZU5HV045VmRydG42TGwxS3dsc0VuUjFjZ3h6?=
 =?utf-8?B?M3JFNGNhWDh6ak9aTHNPLzltQTVqeDh2b21ha0EwYzdiQ2RIQUFzNklPRHRW?=
 =?utf-8?B?bXZmT2dDQm1BVS94VDZESjJPVzRXcGZ4QTdiVU5lcjhnbG83RHZGMmtySTV0?=
 =?utf-8?B?UFF5Qlptb2dyY2hhK25VVFVDM01BMWVuZ2hjQnJacFlpNVhKQm5COWxFYU52?=
 =?utf-8?B?VXZjdlBMY0x4OTRsQkpmbHgzbS8weDRHT29UR01OMFlzZlVwNjRjR0xrenBM?=
 =?utf-8?B?VS9vRUM3ZGpjcFU2RHcyQzdmeUZHbmZCek84cVBQb01JZmZvN015bWhRSXkx?=
 =?utf-8?B?d1JnNjNrak8yTE5DTGIzak1zLzN4N1hmU3owU09BS1dVUzhvQ05PZWR1NDZJ?=
 =?utf-8?B?N0drYnhRT3ZLWXpoL0dxK2xBek13WlBJNjhzZmQrZTVwRkZwdE91S3BGZk1n?=
 =?utf-8?B?bGlkTTRybHFYZWNyV0ZJelZLWnNFSkM2Q0JFOFZDcW9vR0Nway80VVdxWklY?=
 =?utf-8?B?SVZKeEUyWVkvVjIzaGF6c0FsUXB6eTl3eGZ0YWEwTVlXdmEvbFBZVFRRbWpn?=
 =?utf-8?B?cVU5Wng1QU1CR01GQ2dEcUhXNkpyajNzYyt6SkEwUk45YzlhVXVmNkpleG1x?=
 =?utf-8?B?Tk1rWHV6L2VrZVYyek5vY1NqWWpJOFJ0UzdVREpKa0wwckUrcnBwVkpoSnJl?=
 =?utf-8?B?TTBxbkZWTTY5V2lCeUJOQXFnRW54SWx3YjlUMzQ5eWptYjMvSXlkNWNsN2RV?=
 =?utf-8?B?a2tFSWVidi9SOEpYSk13WlJ5RkwrZVZDSVVuN2J2a0s5UGxad1lJaGNmV3Q3?=
 =?utf-8?B?WCsrYmp6S3NUa3NDM1NRb096U1NBckROUEcvb29TcnRtTU1jZFMxeEptTHBK?=
 =?utf-8?B?Z1hjeGtmL1ZwMmFzc0k2dVpYanRvWDJWUkJGRUkwUEloeU9kYkFDOTBaK01o?=
 =?utf-8?B?NzA3ZGV3VHUyTDE4MTZxQ2E2cmlEWVVCeVVtMkdHY1lpRGd1V2xUeTI2L29x?=
 =?utf-8?B?emFUVTZMVnRxWS95YjFQS0k4Z0xxWjRKaTFNdkZBQzNYbGVTQ1RQV2Q0ZENp?=
 =?utf-8?B?TTUzYndNOThIMjV5a0xZNmVNTTAxK1N4YkdPdHgzWEZYR1ZpZEt1bGxlMExS?=
 =?utf-8?B?V0ROdXpkT2k0bUVDakN2Y1lCcDh2Y0pOcjdBdTg2bzhwd0FNMjUxVVpVeEFC?=
 =?utf-8?B?ZHAwbWxmdEloN0ZpcmlQb2xzenVaUWNHWmFia25uaFpWTkVTU1pLWVJVWXl0?=
 =?utf-8?B?WWNwRi9nUlRxNjcvK2xRNUZLNkJhOTI5RGlsS3FUSWt6aittUnVwOXhuM0Rk?=
 =?utf-8?B?dGsxQ1RRZ0ZzNkZFYjhnTnN4Y2JmbUQ1cnJMZFNoQTBnUjNvY1MrUzU1UVh3?=
 =?utf-8?B?YVdPMEMwTGYrbUo2WFcxWnY4NlVuYWhXRWpvVHBqMEx2QjZnS1JTZGYwb3lz?=
 =?utf-8?B?N2c9PQ==?=
Content-ID: <34E8DFE8526D5848A1B36FC7491DEA28@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b466dd71-72fc-499f-3b8f-08dacc744863
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2022 10:28:22.8925
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPKgWx0kyXOaLzEFsJk4QlVq+1G+EW2nI4MasxKEIIDhlYA4pXIMn3FQIW5Sky3t1CY908sHoWmxjAB0Ax+uQ4beAfr20dB1UsiFv3d6g/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_022828_497748_35127985 
X-CRM114-Status: GOOD (  28.89  )
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

+ Takahiro

Hi, Takahiro,

Would you please review/test this spansion patch?

Thanks,
ta

On 10/18/22 12:57, yaliang.wang@windriver.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Yaliang Wang <Yaliang.Wang@windriver.com>
> 
> Spansion S25FL-L family flashes s25fl064l/s25fl128l/s25fl256l can't
> automatically recover from programming/erase errors, the Status Register
> error bits inflecting the errors will not change until a Clear Status
> Register command be executed.
> 
> Same thing also happens on other Spansion flash families, they've
> properly handled it, USE_CLSR manufacturer flag was introduced for this
> purpose, but S25FL-L cannot simply reuse their work, because S25FL-L has
> the different error bit settings. S25FL-L defines programming/erase
> error bits in Status Register 2, whereas the other families define the
> same error bits in Status Register 1, causing S25FL-L needs a different
> method to handle this problem.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0074a8f3b303 ("mtd: spi-nor: Add support for s25fl128l and s25fl256l")
> Fixes: d8b494a32889 ("mtd: spi-nor: Add support for Spansion S25FL064L")
> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
> ---
>  drivers/mtd/spi-nor/spansion.c | 119 ++++++++++++++++++++++++++-------
>  1 file changed, 93 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 0150049007be..8f353ddda5f5 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,7 @@
>  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> +#define SPINOR_REG_CYPRESS_SR2V                        0x00800001
>  #define SPINOR_REG_CYPRESS_CFR1V               0x00800002
>  #define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
> @@ -25,6 +26,10 @@
>  #define SPINOR_REG_CYPRESS_CFR5V_OCT_DTR_DS    0
>  #define SPINOR_OP_CYPRESS_RD_FAST              0xee
> 
> +/* s25fl-l family specific */
> +#define S25FL_L_SR2V_P_ERR                     BIT(5)  /* Programming Error Occurred */
> +#define S25FL_L_SR2V_E_ERR                     BIT(6)  /* Erase Error Occurred */
> +
>  /* Cypress SPI NOR flash operations. */
>  #define CYPRESS_NOR_WR_ANY_REG_OP(naddr, addr, ndata, buf)             \
>         SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WR_ANY_REG, 0),             \
> @@ -44,6 +49,29 @@
>                    SPI_MEM_OP_NO_DUMMY,                                 \
>                    SPI_MEM_OP_NO_DATA)
> 
> +/**
> + * spansion_nor_clear_sr() - Clear the Status Register.
> + * @nor:       pointer to 'struct spi_nor'.
> + */
> +static void spansion_nor_clear_sr(struct spi_nor *nor)
> +{
> +       int ret;
> +
> +       if (nor->spimem) {
> +               struct spi_mem_op op = SPANSION_CLSR_OP;
> +
> +               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> +
> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +       } else {
> +               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> +                                                      NULL, 0);
> +       }
> +
> +       if (ret)
> +               dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> +}
> +
>  static int cypress_nor_octal_dtr_en(struct spi_nor *nor)
>  {
>         struct spi_mem_op op;
> @@ -342,6 +370,65 @@ static const struct spi_nor_fixups s25fs_s_nor_fixups = {
>         .post_bfpt = s25fs_s_nor_post_bfpt_fixups,
>  };
> 
> +/**
> + * s25fl_l_sr_ready_and_clear() - S25FL_L family flashes need to query
> + * Status Register 1 to check if the flash is ready and clear it if
> + * there are Programming/Erase errors in Status Register 2.
> + * @nor:       pointer to 'struct spi_nor'.
> + *
> + * Return: 1 if ready, 0 if not ready, -errno on errors.
> + */
> +static int s25fl_l_sr_ready_and_clear(struct spi_nor *nor)
> +{
> +       int ret;
> +       u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
> +       struct spi_mem_op op =
> +               CYPRESS_NOR_RD_ANY_REG_OP(addr_mode_nbytes,
> +                                         SPINOR_REG_CYPRESS_SR2V,
> +                                         &nor->bouncebuf[1]);
> +
> +       /* Read Status Register 1 */
> +       ret = spi_nor_read_sr(nor, nor->bouncebuf);
> +       if (ret)
> +               return ret;
> +
> +       /* RDSR2 command isn't available in QPI mode, use RDAR instead  */
> +       ret = spi_nor_read_any_reg(nor, &op, nor->reg_proto);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[1] & (S25FL_L_SR2V_P_ERR | S25FL_L_SR2V_E_ERR)) {
> +               if (nor->bouncebuf[1] & S25FL_L_SR2V_E_ERR)
> +                       dev_err(nor->dev, "Erase Error occurred\n");
> +               else
> +                       dev_err(nor->dev, "Programming Error occurred\n");
> +
> +               spansion_nor_clear_sr(nor);
> +
> +               /*
> +                * WEL bit remains set to one when an erase or page program
> +                * error occurs. Issue a Write Disable command to protect
> +                * against inadvertent writes that can possibly corrupt the
> +                * contents of the memory.
> +                */
> +               ret = spi_nor_write_disable(nor);
> +               if (ret)
> +                       return ret;
> +
> +               return -EIO;
> +       }
> +
> +       return !(nor->bouncebuf[0] & SR_WIP);
> +}
> +
> +static void s25fl_l_late_init(struct spi_nor *nor)
> +{
> +       nor->params->ready = s25fl_l_sr_ready_and_clear;
> +}
> +
> +static const struct spi_nor_fixups s25fl_l_fixups = {
> +       .late_init = s25fl_l_late_init,
> +};
>  static const struct flash_info spansion_nor_parts[] = {
>         /* Spansion/Cypress -- single (large) sector size only, at least
>          * for the chips listed here (without boot sectors).
> @@ -428,13 +515,16 @@ static const struct flash_info spansion_nor_parts[] = {
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>         { "s25fl064l",  INFO(0x016017,      0,  64 * 1024, 128)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               .fixups = &s25fl_l_fixups },
>         { "s25fl128l",  INFO(0x016018,      0,  64 * 1024, 256)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               .fixups = &s25fl_l_fixups },
>         { "s25fl256l",  INFO(0x016019,      0,  64 * 1024, 512)
>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> -               FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
> +               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> +               .fixups = &s25fl_l_fixups },
>         { "s25hl512t",  INFO6(0x342a1a, 0x0f0390, 256 * 1024, 256)
>                 PARSE_SFDP
>                 MFR_FLAGS(USE_CLSR)
> @@ -460,29 +550,6 @@ static const struct flash_info spansion_nor_parts[] = {
>         },
>  };
> 
> -/**
> - * spansion_nor_clear_sr() - Clear the Status Register.
> - * @nor:       pointer to 'struct spi_nor'.
> - */
> -static void spansion_nor_clear_sr(struct spi_nor *nor)
> -{
> -       int ret;
> -
> -       if (nor->spimem) {
> -               struct spi_mem_op op = SPANSION_CLSR_OP;
> -
> -               spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> -
> -               ret = spi_mem_exec_op(nor->spimem, &op);
> -       } else {
> -               ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_CLSR,
> -                                                      NULL, 0);
> -       }
> -
> -       if (ret)
> -               dev_dbg(nor->dev, "error %d clearing SR\n", ret);
> -}
> -
>  /**
>   * spansion_nor_sr_ready_and_clear() - Query the Status Register to see if the
>   * flash is ready for new commands and clear it if there are any errors.
> --
> 2.34.1
> 

-- 
Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
