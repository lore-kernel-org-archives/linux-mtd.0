Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13929C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:12:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB86161056
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB86161056
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnpVUhdWNHTjwLQBZaI9fSN27zGpbQTrBnke0ducTf0=; b=l/qyNURavZwtFL
	gVWgtWjUPWvSTz5Xynif1FdZ+yE1WaBL8D2cP68DFiEQ9QafQfHBoF/mMhB3BKj5DP+Q3CgGKn+iw
	6s3q+yqRnHENV5+OeLEjx1qlitxRbFarsKQ46RVtJ6kaOB8rmXkp3e16MVDeUUtzwVSF+7/OjJqR/
	SXc6T1kA0lrSSOUzvkc8uIjjMl4EebI5COwnQk0tBhcFnruaobIFpxzzWwyNgfAJxeSrF4TMaPAnK
	CFXk9hKk0hGmWf0UpL3mXFGTW214SSpkH97ZtNR5naJWkk58tt6ueAHi3OglTIFYDvQuRwwFoVGC9
	gdELoClL9kGPcwliFaEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdpe3-00A8sl-0F; Fri, 22 Oct 2021 08:11:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdpTC-00A4ry-NL; Fri, 22 Oct 2021 08:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634889606; x=1666425606;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZVuFmT3V6WPWjQlTHlRq9yOUlj24C5QPTz3L7UZ7z04=;
 b=HSW4JxvUcaIHxATAPxW4LsP2XfO7q56fK4HHE3EHpR3U1hF0+cyNYAFL
 AHdZO0uBwSiqoPxlkeUf0ZnM457dfbPgwb6Tyd5s2GLn6nGliJRlyklv4
 TgqptAxcqqrCdBV5afNZ8tlr8TMEQUZTmarswxboTfr+QUbiIR6ZQV/6r
 EbeKwXgZO0RdT7mBD8ULuHq8cRGqEpkTmHjcJOmxVlU/3rnb2qJgRO4fJ
 s5qBCHfnmuDKtL3Yi29w9iT5/uVj5FRwaMI3g3TqLuFqVosngl0/iozMt
 +PlCjQ0ga1Yfg2f7+y/VBZsCIfjGYCuZPDuCbTh0SpcsZPxyQaOc2XVSX g==;
IronPort-SDR: OG6laZTePy03EVaYdjYwWHjaqEZKEOgnsWraRy6FjZB6FXDDqum3YzPhCLGzU2qUHaJA/FUoGr
 nZf6v+T6cdzUmHM8SiNa9k5IhvwbMuSAF4fsMDS4cDPOuiMR6NLU8JglaMeJN/So+uDspfzk+b
 u4fJRSkaPApDmEnD0A1qBK8A+8GIXOEIa0czUqqgzO0T4n1f4ECKKHYVMz8Gl9ALnyS0KTEBFz
 ZSJhKO+dcE428f+gKKdtkTcjq445buhmdQWsTyCnZitxRKWz4uxEWOZGxKVrDzwf+ocgBWs5om
 9JB3EEtw7koR/cevWaOHPYNc
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="73929512"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Oct 2021 01:00:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 22 Oct 2021 01:00:04 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 22 Oct 2021 01:00:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/GpgGSmn+OBuQgn2f5a9RnPGGX/FjYJqq++m/qDBko4n7ArpKLhxEI0ho3KPOi3aUbk/wUfqidWLIOLwZZnYtrDFw+eXw5bGY3tbnpwduL30oYL8xI9rj2Jab6nCd6zxud1OyZV8I16vj3l5Tn4WXrZpSB1qplv0wW2G0QNkGvXp1d4M3jw3IkhUEvvuXhCYt4mg+r/dxpo/IHjLkGjIUtmmgGC2LhfyLijCsLR/uSZ7i9atTkdk/Xdqon9qb87+HiARxa3wz0ynGj9UyznVWAg6VpH3vowXG4aKhHnJ7ZxNIxdA+r8H6GnEunohI+ZrH7tU2nrJd2qb1MShzyk8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43Z8TSDgzz9fBtET2+fQnOWBtnS90ELLLU/Q9Z54vEU=;
 b=YFvO69hoG94og1HBY+uBgfC+y+6lZa5Fal4SFSMgai9vez5YGiO+50QMtrC52MN22mjJfzSmpneOg2GYD3MhzZeq/0mrIseX2aul2Es78P1vkgb8DgGiDoPUwov/HkMJ3nFX3VuEJfAikJaFweGqzJ5X/h0unDo9YwAeCVlyH9lDySdlSLwNcxuW5KD4ubmKVSowfZRIK/tYBcK4WFjdm6x5vEfzus5k+oySnMJqw+wzYNlJ/8tVJ60zsSjQZj31ciK3h3EjU5WFGvEJazQXcRdRGYuPLV/LTcov+IQhpl11U7Z0HZGaqFWAJmVJiRWs0XDd/gcIivI0bCVg1Y0A9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=43Z8TSDgzz9fBtET2+fQnOWBtnS90ELLLU/Q9Z54vEU=;
 b=KzgI+VWK8bHhDLHMcgtCUaUF9mh/2jQW8m/SGyeK/MYUfN56btYN18a51txI/rIqdTZWx+qtEeC9IhwUDwCwD4v+t73YsciZV3WfeIFjk83AukINLB5fPG+BoOY78Zf63912AsvEJqalPSMVp9sWVjkYirnHF+BG/cvDucVaJyU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3533.namprd11.prod.outlook.com (2603:10b6:805:cc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Fri, 22 Oct
 2021 08:00:00 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::38e9:ee20:d712:2fd8%6]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 08:00:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux@rasmusvillemoes.dk>, <michael@walle.cc>, <vigneshr@ti.com>,
 <p.yadav@ti.com>
Subject: Re: [PATCH v2 20/35] mtd: spi-nor: core: Use container_of to get the
 pointer to struct spi_nor
Thread-Topic: [PATCH v2 20/35] mtd: spi-nor: core: Use container_of to get the
 pointer to struct spi_nor
Thread-Index: AQHXxxrPO6xJYVhYmUmSvEHzx1rHBw==
Date: Fri, 22 Oct 2021 08:00:00 +0000
Message-ID: <4295413c-e6ba-db8c-eda6-8b61293b1ec6@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-21-tudor.ambarus@microchip.com>
 <21e6d006-228e-7834-7a4e-afbfc65fec72@rasmusvillemoes.dk>
In-Reply-To: <21e6d006-228e-7834-7a4e-afbfc65fec72@rasmusvillemoes.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: rasmusvillemoes.dk; dkim=none (message not signed)
 header.d=none;rasmusvillemoes.dk; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 450919e2-c341-4f23-56d2-08d99531f26c
x-ms-traffictypediagnostic: SN6PR11MB3533:
x-microsoft-antispam-prvs: <SN6PR11MB3533314EB28BBA66D2ED9C03F0809@SN6PR11MB3533.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:332;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7W+A6dwLQLI0+sCzaOQrsuTiCvksAWH2VYAb4Yu2WdOA0cIcX6HohWUIkjxc6S7go/ZcaZoFOcR7qpjZLUgw0zYpFl47sfIRM16n2qG5H2TKAsCCfrw5DarobMF5l/1IPStFNK51K8F7eqNJGxSsr7fzH/MWsVPOZEqFQaXnc+LLjQ7QJFsXwxlFOUrLL1r9+eYI69EiGptxViBVAG5BLUb12FNpP8nXb7DYpK8reeJeXMG70MyoXtqNJW99H9xdWT61wavotqmEPIoXMhv+ymLPDvLHu2kjISSJsGEfGi4Q3v4YhcOvLtYsS6jqtrvXrmvX4lldEbGfYNHS3C1cCk9gvr+Vidw0QUylh4nzR4N120rWvI8Pzv5Zb2+NLG8Fkw+6zcWHWU0g/qsl2Hl/pva0eYMXrRPhov+hcSnSTzSGPnBY/yTZ5OHNfJ6xW0fAo/N8kIU3wLr7JJWEWiLfv87dSvwl6TofbvZ717qhUThzu8VVAST6dGzjneR6LO4QKO5IewXeF7sgFpTr8aavxS970fhcpO+W2sOHuuOlfxVyyHhZjKSB/pyQ7c+uZpkoE62RYB0UsBOkh1b6YVItHO877eFVTGeIIteDJdZHMN1MvjsRwRyAuERThtSTMV/ZwWOqF+3LU6kZVphkRNfAMU35UPvari/Snd9hppdmHfOvoY1QucVQLmsGh5dMiYBXT0rSoaFRj2DI0BTaezQGdhREqTW0rnKCR9/1fKqTwKzzWToUs5wUQQ2I4lGdNRlZQcy3duLyGziXn4DXlvYiDxkYaGNUzikhEFBtdFHEeVs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(110136005)(83380400001)(54906003)(4326008)(107886003)(91956017)(86362001)(76116006)(66946007)(6512007)(2616005)(66446008)(66476007)(64756008)(6486002)(316002)(122000001)(6506007)(508600001)(5660300002)(38070700005)(2906002)(66556008)(186003)(7416002)(26005)(38100700002)(71200400001)(31696002)(8676002)(8936002)(31686004)(36756003)(53546011)(15583001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?G+eFGtSFS5XZT9pxJ61/zqyxPaDYzh9jo+ykyC1yL+N/+b+RTq2Xo8W2?=
 =?Windows-1252?Q?OjtFtAgUgaeMJX3c068UZBtJkBWycIHxqIHQs5HPaE6DYG4hinGmLchL?=
 =?Windows-1252?Q?wYkvN37yeM/tCrbIlCmSyIAo3k69SyTXH1DX9A4u4gDCCEGdv8bazvCK?=
 =?Windows-1252?Q?LdgcRSu8YHjaU+TBzv9dv3tA/n2f/sVeoelLSOQhwYBCJMqU6d5nTtob?=
 =?Windows-1252?Q?fSDrGgyR3kRyoZ4vMGQOJzAh/2mlMoDCja7qgE6pAXUoBnlMkqackwjx?=
 =?Windows-1252?Q?T6CUno5SbexbLYeJ1vvsNmAfcIaP+yGJwezPXjUK0K0RfiqGam5JzZ+7?=
 =?Windows-1252?Q?HwQNfkEXuo0J/A/k8Z0VACQZVXi0+IYpD0BxcnaRWompEW3QnyVts8Xv?=
 =?Windows-1252?Q?4FaYGB8AJxSDrOgre25q1KsENXpDsRgX2gluEwa5Y3VanoK8VH7K+1QZ?=
 =?Windows-1252?Q?ZIqs0pK3P4v41cEIck2ajoKkt/v7Y20+rJEalBL9ooX6xEJ/codr1uxc?=
 =?Windows-1252?Q?uLv8PhLlJkPbcCwa+KjTsHawijh+OibR97H2CQG59MYS4OBWBKHQ3Dhs?=
 =?Windows-1252?Q?6nzlRLrgjMJrszflBYuw/OyL9y4gKzA0xv2m9McvB8Wza+zH6xigCzDk?=
 =?Windows-1252?Q?HrFYZgjy84gIn/UFNNOYWwsoaBGP1jGfFk3NzH3/dxazgofKgC9BIGqn?=
 =?Windows-1252?Q?t/V0sVq/18eA5FPLnYC/tegVjqgzudfQ+Wz2ouMBo/RLyivaNMvkRrWl?=
 =?Windows-1252?Q?VzvvXzgq+21jKzow+Wc0s1Hi+ZMAaQIri4wIbEEC28quy9YKdp0NWNPI?=
 =?Windows-1252?Q?9DSB6RJafROktUu/EKYGhM4XniF6qXT/JUUUG60KzvFEqSjjYDMroc5M?=
 =?Windows-1252?Q?PcweRnY4lOESsXWhPgPGY199NypaEaz8QhkY/Lqg2oiIscGDL3KxEeLj?=
 =?Windows-1252?Q?zLQ2VHrJ9kRQAV9oe4Cw83t3g1nT6j5y8XWodjR8v+0rbFl6UeYe25Pe?=
 =?Windows-1252?Q?G8joFvOqOzEpmiNwC/8SRTBh6SJd0zqoUN4TeK68t6SGoIMQeneYm9VD?=
 =?Windows-1252?Q?dtZzOWlNtt42MtEt9hzZDaFHuUyKBpd1AAyQHr/dNsd3NuRg5aFTuYNf?=
 =?Windows-1252?Q?0+QFnpt9gW16FyGpTFPZE+N1CJsk0hpEVJIuVyNTo7llsykBSFTnQm+P?=
 =?Windows-1252?Q?+RK3hRaQJXzD4zUpCFArSBnT8mjsA+AX10qDZGUW6nEPeBDsW58XEjkw?=
 =?Windows-1252?Q?entbF90clPuCwNCxxtszlH7iScYORlJ6g9FQrOihJZzkGNMam8iaDSEB?=
 =?Windows-1252?Q?/idReTeymyzHeeEKXpCeASxLBP08tErC7lAoqTBrJ2P5Zq0YDOC/4jhz?=
 =?Windows-1252?Q?SL8K7Tr8LArB4RgbdIEFP6/uEsRp/XFaXztCXXDH/VCQmroeFKX40JVO?=
 =?Windows-1252?Q?2tw+qhHZV7I7hyiIdHiyoMr7xgE3vHbcvQWmomTjxAt8KvNLpyqPKkmE?=
 =?Windows-1252?Q?vekz+DXXR25LhsHmKklorZvUsFMshyZ3sUQSjbu2x7rzphYxJtkqNUE8?=
 =?Windows-1252?Q?p0Ujhjci4oA+3it/?=
Content-ID: <AA6D1DFE3A4C7E4384F9AFB9F810A631@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 450919e2-c341-4f23-56d2-08d99531f26c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 08:00:00.2121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_010006_880264_5DE7B74D 
X-CRM114-Status: GOOD (  14.30  )
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
Cc: jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 macromorgan@hotmail.com, knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 7/27/21 10:08 AM, Rasmus Villemoes wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 27/07/2021 06.52, Tudor Ambarus wrote:
>> Get the pointer to the containing struct spi_nor by using container_of.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 1 -
>>  drivers/mtd/spi-nor/core.h | 2 +-
>>  2 files changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 9885d434ea83..5c8cffb5e6f2 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3175,7 +3175,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
>>
>>       if (!mtd->name)
>>               mtd->name = dev_name(dev);
>> -     mtd->priv = nor;
>>       mtd->type = MTD_NORFLASH;
>>       mtd->writesize = nor->params->writesize;
>>       mtd->flags = MTD_CAP_NORFLASH;
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 987797a789c8..8fddc685d2d3 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -557,7 +557,7 @@ void spi_nor_otp_init(struct spi_nor *nor);
>>
>>  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>>  {
> 
> Somewhat unrelated, but while you're here, why not get rid of that
> __maybe_unused and make this an ordinary "static inline"?
> 

Will do. Thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
