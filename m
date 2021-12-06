Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D621EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ml8xwv52JOi8NL/OZUV+FAtNOw0wminrRu7agFp06sg=; b=LvzyWP4nMtr2eF
	PwPiujuLc3adbLZc9v3I7QsxVsqE2b2j/w3zAbxn+Q1B1G3WsGnk1aGpDqMDKsYr1yiOizrU67xgW
	AQKNfDD5lH2qmp/tWMuWKQEKSG/0KlHVG5K8SDg1pUkqSsISjmrm7XT2G8+LPPRuURgiJTAvMHehw
	sM3fJ4D+mJIDMuueGIlfB/ursYo1KdYNN9MO6m9TlQ+24NLon/6l+7cREeVu3c5VjUViz9Q1G7Qak
	MP3O0kK/5m5FapEi0S2gDzcceiRMAky/NPjeDK7sNT6KBy5uGKAbStFjMsH9jfaFYjbR2XjqMD2NQ
	R74RZ5p5dmjS28wl7oKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFAg-004Fqc-Ux; Mon, 06 Dec 2021 14:40:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFAc-004FpI-W0; Mon, 06 Dec 2021 14:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638801646; x=1670337646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B/OgQtA01uTyaD9exguXjsP8oJgL99lbbZ21wtkqUX8=;
 b=JnfYX/yArn/6HQCPAEGHehH9RZYxowV82zF4ovR4XfuSgg5/QiPFmYG1
 FYJLCMZo91HLwDqwh8YXZO/JWLxx58EVknw4bnhT75dOLsVvDseQIMUCn
 rb7EF1zFA5sjVd9Z+xUBov6hh2mFlK0t6W/LdQ0FFuo7XWtzciy60w2op
 GMVhziEqOFsxBcIzU1uoYs8esVa81BniMsCGoHA9msBxr4uvHpgmB/KFC
 CBnFs1I1Z4BfOLqEL9uBXXqDXPv8YQBDrtInRzAFGP7NMVHQ2ZxbqxKTV
 A565DTFWFVjRDxyFOjMs48P5z5rZgDxWpc/TEntR4VceIklPb5JGPfisj Q==;
IronPort-SDR: 03jyNctMepyByHnV6bBx8+8iJ1DWc8Rb2PwZsDlbT4s2+Q/c/vT/5S6Lj/8F6wFWtuiIzb08i0
 IlgMIIjkrSJlfaIUBt172fyVhfS+vqGyB6K8TvUh59cdeoYk0ftwh9/en61acCoUYIBC4UxbaF
 YYF5XWvWjgiE0OiSge96y22o+Z5lN07N2wuG2SLGULXNjmolpdnmKUBw4bp3Q3aOPAY/f2Sfmm
 vr86lN4YgvCbSXy/a+9XsqSmqA3ADij36M1m17G9KjKFD04rrAf4xRYuvbLA8vdKM4VxjCeD3l
 1pad6ZoAUJjdGL2Ejop3iieu
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="154398943"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Dec 2021 07:40:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 6 Dec 2021 07:40:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 6 Dec 2021 07:40:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gvTSO7qWWHGRuiSTPjicv42pnBmOkozi9bOq8/EUeCNK4g4RYG249UZUEnLr3qeuT0GMwgctqerXJdpwxk8Y3YOdvZorwuyuTUwvjKqn9/3Yw3VN0b3PECf/KWmSmYv1T6n8OZ84BBLKBEA116EKE9+Vsri/66lfwSi5WdW57rQJCHS5l+K8LJWoLV6qdw1CqI74XHizZ7mxQIhk70wiTzl3plQtjH1Gxh0WDXV8nGROABnkuocLiqRKunjbBWmdPylmFDBdpSHG00ixzraf95iJoPON/OzPsMeVrb9mUJ7I/LGbq70GECaQ7Lu0HXipJ4JnYw8OJ354CV3MGHzWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/OgQtA01uTyaD9exguXjsP8oJgL99lbbZ21wtkqUX8=;
 b=YaREH+uAh8BqQB1LZHK8fEq6YjiCnnULHxH8979IB6k4E1XUqs8jrfVK+vd839ZyAqEiIOIm0Iygvp7dKZXYUqgU7mkSRBli/fcRL60vmiIZB4/EbzKNgPSnoWGJk6WnN9WThYHj98icF/cn7ZjJjebaxkVhcRVdj21+yjuB+Hf57BupXAwzTXC8YYVlzLwD0g2hndkRL/ZAp8JKa80BklxPpMyLYULxFMEd/djZPTstI1KCML8lrCFXKEt9GKwRZOFZW45D4nG+HkckOP7VjH7Ynmu4Rddb6vQ/D+aexAvMgGgkrb/61FuMh7pBxjYvwVZ3q+n5rfGw4GC7NLGIkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/OgQtA01uTyaD9exguXjsP8oJgL99lbbZ21wtkqUX8=;
 b=h9BGdmYR17FlTHZpQwJHZ2FadlRb8V/b9V7aGvoq05IMX5OA9LHy/Mbr+ZpLWY5/orazl+BkJRQKt5YYYxfybIlFPa6DjuNa9NOVKx2s6+M0Hjmqh5uQDI2zHZpkN9YaZSnZDr1BnQcSxHUyBkqrw98O5DM9rPySGBnuJ1f6Uso=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA1PR11MB5900.namprd11.prod.outlook.com (2603:10b6:806:238::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 6 Dec
 2021 14:40:41 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 14:40:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v5 01/14] mtd: spi-nor: Fix mtd size for s3an flashes
Thread-Topic: [PATCH v5 01/14] mtd: spi-nor: Fix mtd size for s3an flashes
Thread-Index: AQHX6q8+y4LnM1jl702f9qZIZWoE0g==
Date: Mon, 6 Dec 2021 14:40:41 +0000
Message-ID: <1b11dc3c-d321-c874-32b5-f982a3e19bf6@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
 <20211203142256.47370-2-tudor.ambarus@microchip.com>
 <20211206115434.t5yv53vfiapnribq@ti.com>
In-Reply-To: <20211206115434.t5yv53vfiapnribq@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b95e9669-bf0d-49ea-a60f-08d9b8c6609c
x-ms-traffictypediagnostic: SA1PR11MB5900:
x-microsoft-antispam-prvs: <SA1PR11MB5900F9A9F91AB0DE718446FCF06D9@SA1PR11MB5900.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /vhNiByHGtGF/tEUZ6l4fzs0ZPFE2N2LbqcrK3qoAgFANCxwU3mFhfFQJRr8qlH/nBFq/VSp+sxh8Mhp2F3c6TtC3yL7Ybf34QosM2lY2FQjmcdPeTHWrZZsSJUBJTOW5iowypFkwG216MlrwdrTbqm82nFryIOPs5Hsr6XCku2PUvcpK6/MiFXIw1I+nJNCVyEkPeUff9FESyAO6Lcz4T4lgWwKclmot+mikB8Np4/rYKN2qhl2fFFmeeVu9Ctb5YJ8xjcW6wym2CFLG/s2zdPkud8rdOiOsUBNdbettwo7E+MeFlBPaodMNxs54Wc4inScU+IzKQ/sQikGoCloXY2cg7yXnm2W1DqJ+Oi5sv/Fy2fxbiudwoJCWVh/pjyCGWLP2CL0mQuH+mD1DJnjisaQGDYdJsnbTWxcDUiUBSNCdD2k6yeb+RGziLukYv5iTRnhvk/ILtlYShGtuWoD8ZqL/3GiXi6sEBNRpBl07d50bFm5LZ/i7DEv8Ndt03SX2bkEVqd8oYo4WQFjhnbEcG/1gmZDyf2Bcnfm+i1M7e6AkeSmewhHIbqvul3FKSFIPGYkTEh2wIzwOyqbcDKk+JEXf7tlQkyy+qGdF/OYHFC+o+1LJALPNZmPlqBwEenJmvLRniOLQ1NR+hNouSfEfx7sbuXugvB+hPGGjdRN9iVZ6G+En92lbftKXsI24ImhZARAAOAOjUhykYMFy8HZsqZ7ehi1fLrNSeSbh26aHzgay++TUd8VdE+22/KLZMMho2yWCEgg8Beo/5f22edTiEbpKw7WLrvS1kbesQGJDQlZUyRi1znDuBst1ePC4e9L
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(91956017)(31696002)(8936002)(66556008)(6916009)(26005)(64756008)(66446008)(186003)(6486002)(7416002)(6512007)(36756003)(8676002)(4326008)(508600001)(5660300002)(66476007)(76116006)(66946007)(107886003)(38070700005)(53546011)(2906002)(38100700002)(86362001)(122000001)(31686004)(2616005)(71200400001)(316002)(83380400001)(54906003)(6506007)(42413004)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1JmT0U3QU5kOFVuNTVaM2NPbVY5WklOMmtDQ3doc01FZFg1UGdnSzFaa0FK?=
 =?utf-8?B?QSthOTBLcjF5R0lIVEZ0eUNQaEpPSUt3TzRzN1NxUEFuNUY4YTRjRFpOT3hK?=
 =?utf-8?B?d3NqbXJKbTdwOGl0d3ozU1ZKZ2tsN1BwdFFGUDNQMUJWWkQrRjN3cHE5QkNY?=
 =?utf-8?B?T3ljSUlZelhtNWJtYndjMUh0YmpDMC92Z3NFeXFwcmlYL2I0c1NnNlVSOG9s?=
 =?utf-8?B?S2dGcFh3SUR2YnNPbER4cnBUTThkcnZKT1YzR0dFMzh0LzNQaEFqSWJBeWpa?=
 =?utf-8?B?STE3WmcrK2QzRE53aVhqNjdTdVE3bTlSZnNnMVVPUVVMaE56MDhxendDbmZL?=
 =?utf-8?B?dlM0TXpYNEE4NDZ2bVlFb1k3V0pKQm94TnVvMHY5ZFdMaWlLZHB6VytvSmE0?=
 =?utf-8?B?VTJKV0YzTWZFN1U4bVBMUFNETGcxcUJoUlVSYWlOSVcvckI0RTFjalk5QVU4?=
 =?utf-8?B?eURHNFh5T2lwYjg1d0VEZThDL0JLRXgyNThEUCsxUWN2VGp1M2Z3QXVkRnFC?=
 =?utf-8?B?aTNqTVB1M3dSdlZGd2hFYXRRcWMvTFM1RzZOZC9qMXJySkZ1YmE3UjY0b3Jn?=
 =?utf-8?B?NGEwWGxQeGdEWmp4cGFTTlZqa3VSVWlSVFU4T1RuTTJEV2JPMW1SRlBIc1RQ?=
 =?utf-8?B?cHUrakY4aEJRSDNEMGRicGE1TVRXeHY3SmtJMyt4d3lzaUJoYXdZUVRjbndw?=
 =?utf-8?B?SytZRjFiNWRwSmU5WGdEUGdpNnk2RFdQUFNDTGRKZkpVOStUZWMxYkoyK0gw?=
 =?utf-8?B?TkpEamM1MExaUzBxMkpkYTFzMzZjZlpaY2RFVldnODFKR01XdDgxRVhEZ001?=
 =?utf-8?B?amZidWc3QzBFN3VTdUtQbi9qcVlIbWN4S09BMmNYbDFXUll4OWtjckw5RWVr?=
 =?utf-8?B?WW5kV09DUnhrRmVhQk1GM3gxRHNoVDJEbERpZFZEV2pyS3lBaGdMNDNScEo3?=
 =?utf-8?B?bVh6aU5peW9XcHBzTHpTcW1lSEJIcFZMWHNIVUtPYVFlb2VuVlJpN1ZYN3B5?=
 =?utf-8?B?WENFN2U1RFkzYnV3d1JsRkl0cThDZnU0Y2YxRlNEYU95U2hLMmI3b2pIcExu?=
 =?utf-8?B?b2VKVnpBa3FIeWt5U25qZng1K0FJb2VpcEZrQ2pBTnRSa0hSNEJ3amlxTjl4?=
 =?utf-8?B?WFNvUjB5dEVISUFGYi9IbXlOeEdWQnVzcUxyNEE1QVhuYVZQV0F6NmpOaHFx?=
 =?utf-8?B?M1NjZVBnUDlKUnlWaVJrcVZ3N3N5aWdjY3ZRZW5OT1ZzSjBKZC81REoyL0Zr?=
 =?utf-8?B?T256Tk9wN3pySUlrTEFNZno5VGc0VVdja09xVVhnV3ZEbUMyTnJ3N1FJWUoz?=
 =?utf-8?B?VkpienNlUGVHR0d6bVJwVTVaMFlzQXlGNGphUnRDWGNmVFJXZmxYNStieXo5?=
 =?utf-8?B?OVJKM25lVFFEblJCK2lmOWh2SEFRSE1MK2pObWFDS042SjFoem5qSkdsUHpo?=
 =?utf-8?B?d1hxUFFsdm9qRmNCR1YyMzdyVGRZRXFUNnNJSmszbUxMT0IxM1plOHZOTEs5?=
 =?utf-8?B?NGh6Sy82OW55a29wV3RNVWNLV0RlOGs3dlh6OHdlOUswMlRaVmNncFh0R1Av?=
 =?utf-8?B?dlNiWDA1UDY2S2RIaTE2UE5mNGtGK3lRNnhVUGNnckVMR0dCQWZVS0taY1No?=
 =?utf-8?B?djVNcGhDaHFKU1A2QTkyOG1YNjRVeGRoamlrS29ZUFltRTRQL3h4TGlKbkJs?=
 =?utf-8?B?RlZEQU1mdDF5WW1OL2V5R3hjdFpiOHRLdEpYanlRL1F2Vjl5RHpETmtaZENr?=
 =?utf-8?B?dmxvdDFPREN0UHZSdjRVL29laFRBM08xNHgraDZvMU1oUk9jV0N2YjV3Q0ZT?=
 =?utf-8?B?QVpkN1dLMVF0SzUzUTRDYlVZMlBOemZIaU1RZG1NalBXa2hqU1o3RjdHNGxj?=
 =?utf-8?B?Y01uZnFOOW9UMFhwSEpKRDR4WW0zbFZsaWV4eEd0aEFJSGZhN3h2WG1KbTdX?=
 =?utf-8?B?ZWpNNWdld2tOYmVkdm9qQ0EzYzBjQ09BMEtNNXhvemF5R3VoVVFMZEgwWGxa?=
 =?utf-8?B?YlFhU0I0bmljaTc3aEp6VDh2ajJTempJMTMyWHhGK0VxdEVWOXZXRWhJajJS?=
 =?utf-8?B?cTYrQ2N1ZzZjbTRJM0NiWXM5Rkp6N1FSZG1vZm9qQmlQRmRnZmEwQjdQajUv?=
 =?utf-8?B?WGZ5cDA4VGJ5d016bmR1WUtjaERRcW93djdEV1l0Wk5sbmFrSUR6endmazRV?=
 =?utf-8?B?UkxVVCtiZTd6ZDE3S1JFRUQ1YkJsNVBxeUZRblF2NUZWUDlKQmZpem12ZlRa?=
 =?utf-8?B?ZWU5cHJFc1RrUjNBQzVaeDVrY3FRPT0=?=
Content-ID: <A4B2AAE759958244B6B5633AD45B139C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95e9669-bf0d-49ea-a60f-08d9b8c6609c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 14:40:41.2444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54kaeN0pzQY3jNx8lmmfkh4wi438nno5zc9GIaS78MjNIP7JR5d2nUFml+ZrnJieFtHkgDKE7ZQsBOlSeM3SBAlJtgGwSWLmhSVWcSnfyaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5900
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_064047_070006_C6EC6215 
X-CRM114-Status: GOOD (  18.29  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/6/21 1:54 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 03/12/21 04:22PM, Tudor Ambarus wrote:
>> As it was before the blamed commit, s3an_nor_scan() was called
>> after mtd size was set with params->size, and it overwrote the mtd
>> size value with '8 * nor->page_size * nor->info->n_sectors' when
>> XSR_PAGESIZE was set. With the introduction of
>> s3an_post_sfdp_fixups(), we missed to update the mtd size for the
>> s3an flashes. Fix the mtd size by updating both nor->params->size,
>> (which will update the mtd_info size later on) and nor->mtd.size
>> (which is used in spi_nor_set_addr_width()).
>>
>> Fixes: 641edddb4f43 ("mtd: spi-nor: Add s3an_post_sfdp_fixups()")
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/xilinx.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/xilinx.c b/drivers/mtd/spi-nor/xilinx.c
>> index 7e970ccf7903..03d3b006a039 100644
>> --- a/drivers/mtd/spi-nor/xilinx.c
>> +++ b/drivers/mtd/spi-nor/xilinx.c
>> @@ -69,7 +69,8 @@ static int xilinx_nor_setup(struct spi_nor *nor,
>>               page_size = (nor->params->page_size == 264) ? 256 : 512;
>>               nor->params->page_size = page_size;
>>               nor->mtd.writebufsize = page_size;
>> -             nor->mtd.size = 8 * page_size * nor->info->n_sectors;
>> +             nor->params->size = 8 * page_size * nor->info->n_sectors;
>> +             nor->mtd.size = nor->params->size;
> 
> I supposed you could just have done this in patch 2 directly, but this
> is fine too.

I've done it in a separate patch because this can be backported as a fix.
I will drop the Fixes tag from patch 2/14, the tag is just a leftover.

> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 
> --
> Regards,
> Pratyush Yadav
> Texas Instruments Inc.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
