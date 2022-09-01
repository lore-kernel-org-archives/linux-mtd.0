Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B50FECAAD5
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BiguhSiC/RnRS1d6X3XL1RuW9lFzNFlzkdRtW5OPB0=; b=M2/H0RxX/jYNsp
	SlvDR8U5JHVGT/DO+61d8OlV2w5MHtVd1i1UdXa+5hrnKED9B+FqBSA6Sz/aB7a0ZIcwxNRSpSAa+
	LK79otSXZi4uY7eLqgQnjPI5wACXFiaoGPe2s0SUXbAy1sgPQ1GieiMY4/b6rRwoltPIcehGU1k7t
	a7jtDKrQfTEgY1cGdUzojMF/OKmVtf1JtSus6xck43VIMTMawtzIMnG5waMoQ91Z8gIeNU5YixZ9D
	e0rSwhzzbPrga0/oiu29GOWm/pObYnOqWI3PgMTTm/T1/l1b5bVvYI/SYM5pYsDkm2UrVCrtb2HD9
	3Jc6OMLW8os/rcmH/Tig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThHI-00Azcy-DV; Thu, 01 Sep 2022 10:18:28 +0000
Received: from mail-sn1anam02on2068.outbound.protection.outlook.com ([40.107.96.68] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThHF-00Azc1-3w
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 10:18:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jzunwbs6frkoo99RRqIfZv0q7fQnfTauvQBkjNXTAsfw6tL2dSr4v2OxaOrrACXGJpO4G5PxnPRl5xIOyAeIpr+MMJOuTrxtnEiuzUF5Mac0ZJ8JnoBO6whb0u3eO97QdqhOHFvOruqhnv65xCrbkHl+xskCa0QSE7lLvV6dOSh5aVq7T2sX4JBpaY68qmz2Fr9ncj/zakzf4GVKQAG8bIxDBqY7RL9hpWdPHAwfUhbfPgKGWUVlDR1A924BWY3OFhhZ6Xpc8ljYS3OAKTeGunmxEFIHsFE2spsK1BpG28ly9g5TK6zhsNiRl+Uum7LF6Bz+dt7p7DtMpV62z3pkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RKMBKZ7KJFlnIVzYlzCbctORV09sU18Ig7OcHcmchM=;
 b=MQhVBEbfoQeZuNU8vSuQzC753SZfCW6bc+WtssTY9ChOiJY1+R21iNAXLdVGHa3NWtkTvcswgUv32CpQ3tEmwrowxvcUgc1uYKJznGwLbyTkIAE+UsTyJ4oYpjg6ccibfd6CkSNM4nJeo6KuEHUhNcPxasFA1SaXSq2lDnuc95cZAjCabEYXk5hDy9gkWDDTfLl0Fn5hXDn6XQtm2mCV1ANFlung1lISdNUaV0HqPx4tnPfcr44W4cEyc3dO/5AGeHhwQ+6cLpUiA/D6SZlCn6VOcWwYcG+rBwBuASgqhhU0NvPtY3dzi4cxpESmo7jqXahOP0A/yPCk2QA9D8mK0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RKMBKZ7KJFlnIVzYlzCbctORV09sU18Ig7OcHcmchM=;
 b=FBNV9+bKSA13oHUHAvOMLyp5Qi6g986XdEdPHNQFufdfFOvB17Iey8eSCjA/zvSDybgtPZrJbmen3xNS2e9JJ6rgpG2NOvMJYnGcQa8AtXeQzftD2LapTXdepXA85Yf+xBiAB2v+NgAkmSFIIu/lDpUyFGweM923VHHOdDu59uw=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 1 Sep
 2022 10:18:21 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::f5a1:c4e7:9c3e:3231]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::f5a1:c4e7:9c3e:3231%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 10:18:21 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Tudor Ambarus
	<tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"saikrishna12468@gmail.com" <saikrishna12468@gmail.com>, "git (AMD-Xilinx)"
	<git@amd.com>
Subject: RE: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
 property
Thread-Topic: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
 property
Thread-Index: AQHYvdS4ASUG0YLBMESpOo8Y2+hFjq3KNPqAgAAafiA=
Date: Thu, 1 Sep 2022 10:18:21 +0000
Message-ID:  <BY5PR12MB4258128603AA297DD8FAB168DB7B9@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20220901072914.30205-1-sai.krishna.potthuri@amd.com>
 <20220901072914.30205-2-sai.krishna.potthuri@amd.com>
 <6b06f88e-128d-7ce6-b97b-b5cacfc4834d@linaro.org>
In-Reply-To: <6b06f88e-128d-7ce6-b97b-b5cacfc4834d@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8268241-fc7a-437a-b09f-08da8c034bee
x-ms-traffictypediagnostic: SJ1PR12MB6049:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8Yfw2VjoP7cW3dc00QLD9yPeghc6o+T2QaLsKRd0ot6aotegbXFLW3uzBMYBjZPqxQycdtR9arYc7bjizc/dE88yUila/tuBaPX+z89MgLVV6AiNi2LBScFbVyVNgZgsRMd2X6geQ9gCyL7IkMvt2rrLasYijjf0u75ZvrA4RKzOyAmnjjOcs+dTTVkTQ5Ifh3V/9gQdhpGoUVNOw4v/8ZtCMvxoCfSJjEwM6zUSooUTjmj6zebb/eTSHh5PPl1t5PdRPZcoVIRjVbqRyrQVVMNZ3UzBmDzj1y++b1Ps2MZUgdjW7mWo/cj/ZLkDbIbaI/wp8ymfGIqVIecUIKC7WYxxslBFMHVsmA463naGn7rTMadD5fwDl6nODPKYiA63yT5tKNOobYstecoH4pAIfvE2hPj396KIGKNSHoTSYlRHUY5ShqaeGOt5FdwwoB7j3htnLSkE7lNzHVgPV0xOn6mgvBqbFDp65Yw9vlPTlNMrfSOTmu9yoy/OOWh3qNA1zdKLYTdjXXf+Whe5j1ZSJAPnK4XSIpOLGsFX8uWqsxTHcTT/tEfLyG3uh2RtNkhy+u0TN5NzjFmnZ7CkOeg81Vn0A/lr802D7ZxbsNZK/zArDWMYk9iGfb7yea4cc9nAoYwFAeVABbuA/DIBEIlxnYlUHLA/vT9mpxwXAaESdq5GhBmxv3haVpPXrX56eZ7jTVoU2yeiUNKjkMZOXPAnBTMY2OFnFivwiP/AI2zot3albtFKwD7zaqHms8bsA23O1eTjZbnMOJANeP7yNdCuZQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(53546011)(86362001)(71200400001)(9686003)(478600001)(7696005)(41300700001)(6506007)(83380400001)(186003)(122000001)(38100700002)(55016003)(38070700005)(54906003)(66476007)(66446008)(8936002)(110136005)(8676002)(52536014)(7416002)(76116006)(4326008)(5660300002)(66556008)(66946007)(64756008)(316002)(2906002)(26005)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UXpOMjROZjI5WTRicXF5Mis5V0VCaHZseXZxYUttcXpCc21NVEhmbW9NTjZI?=
 =?utf-8?B?cDlaRzVDTHZpSWJ5cXZsQmJUekpONU4rNVUxcHM4RU4vRHk0bHM1Z2szUmxm?=
 =?utf-8?B?NldmbG9mL0xkTVZiQ1B6QnVjL3dUa1hadnFva2pNNFo4RWVmZUgrOE95VElD?=
 =?utf-8?B?YXFsS1IrZ2d3b09nZXVTOG4wbjIzOXU2K0xQNUZBRE81NFF0TUxjUEFQNXdT?=
 =?utf-8?B?cUxxK0hRQ0NYNDl1RmF2MmdqSFpPdzN3bnY0dDRqKzBVVjNDb2ZLc3ZsVE5X?=
 =?utf-8?B?c1Z4Ujc0aHNLOE5WZHFhVlZlYVdSRHNvaDAxejN0T25LVHl1WE1OVVdyQks4?=
 =?utf-8?B?OXl5SFJHNjE5eDdEdnp3MzRjN2FHdWVKU3FuNGk3bmJwSkQweGFrdTQyemI2?=
 =?utf-8?B?TkZTRDdTdzZkZ0dOM3RySmZ3Rkd4TTBDbGhmUVpKN25jZlpZU2cwdThTLzln?=
 =?utf-8?B?TlRrNG1obElEbUpYc1JmSWFnQXk3c2pzNjU1ZEtVSE9RT3c0SXh4cERIYWpl?=
 =?utf-8?B?aDRXY0VWbmdiUkNiUzB5NkROZjZSSFM5KzFHZkF0Y0lNcmZuWEUxOVNWM01C?=
 =?utf-8?B?YUFGS3RlR2NpemxpNjlTWXRQT2J0ZGloYWhBanJveXQwMTd5VWVMcjdrSFdO?=
 =?utf-8?B?Wm5iNFpFeStZOFo5ZW1Ya0dUV2ZCUXFyeWZmdS9yWVNhQkN0TUl5cytWTlNn?=
 =?utf-8?B?S1ovdGFOSE82OHNDUG5BOHM0a3FZdWhuT09TYkZoQkkwbktXSWlJZ3lweEtn?=
 =?utf-8?B?eVEzZ1V0NkhmRk1pMGVuN3VVOGRyMWJlUHhOZjN1R0NBdlNrQmEzZy9obDYy?=
 =?utf-8?B?bUx5WmVXWjBVbVlsWHZ2SkpacGdtdm5nMmU2aGR3dzVZVDlJQldGV1FSRWx2?=
 =?utf-8?B?STRkamNYQ0t5MElNb0FKMVZiZUJPYnErbmJsMVNzelN0SVYwZjNuS2lpMUdy?=
 =?utf-8?B?VGlJdFd0NGFxU3MzWUt4RklhT2c3NFJUQUQ3NHFSWGdyWnNRK2FlK1lWQ2ZB?=
 =?utf-8?B?czA1S1RkQzBRWmRjNDJtY2pEYW16bUQ5dDVwbmk2aUhmem1qdHg0SW9KYjBl?=
 =?utf-8?B?Z2VhVng0ZTJyazFuNk1LZHN3ei84UWdYOFFQRW9FOVZhQkc0NnlnSG5xaFdV?=
 =?utf-8?B?RFo0V1N0QUJvMEV2UjlqeWJjREhya3Q0REsrc25COCtBcVR3WGxOdmVPV2RR?=
 =?utf-8?B?ZXloS01LeTZIMS9FdzVZaFQ5aHVvSlBCK3ZvaE12eUJhb2thMm5FV2duNGdU?=
 =?utf-8?B?L2R1dU05czBEZUo1YTdxTi9jTGV5Uk9pOWNLTDN4dDVkQ0kzMEJkNURpRVBU?=
 =?utf-8?B?emdPSkpnMFpxQ0UwYmE5aXExWW03ZzU1aVRMc0YycFM2cEpmM0VhTkdWdlZV?=
 =?utf-8?B?VGhlNkFvR3g4VWFlY1dSaVJZY0FTdFhOODg4ZGV6ZFBrT3Y4Sm9rYjJUckhy?=
 =?utf-8?B?d1c1QmpwWFFNQ1k2WFo3M1l5SFdCaDY5TnZraXE1bTBITGZINzFoM240cGxj?=
 =?utf-8?B?RnptWnduL0dSWXpjVVJoQ0dmcTBYRlVPNmdKc2xRYVFQelIxUFVseUYxN0ht?=
 =?utf-8?B?S3RjVDE5TC9JRXE5Z2gxMGk1cGNPenh0Z3dSd2pCWi9hSFFIWXJSR1RUN3BX?=
 =?utf-8?B?d1pIYU51Zko1c2lqZkwwa1ZWVnR4amJKelFJTWFxWXQ2VGVjWFQyRDZRTHlk?=
 =?utf-8?B?Q3ZHd3JRMkVxcUNvUmZBcWlKQzdONyt4STlRdm1zTDVVaVVYblZvVEZJYTNQ?=
 =?utf-8?B?WmlTK0VhTFFZdDA4aG9OK2dVdU9aaEVGTUQ5bXVGai8xSkk3TXhZUU1wWmYx?=
 =?utf-8?B?Y0pQclNwVEJMVDNBcUlOblllTndRT2hvRm84cWt2RCtFQ0J6Wlh4VjFpTkN4?=
 =?utf-8?B?V0JUYUlyQWpiYjFpMitnYVlneUdJUmI5VVM5dGVLcTRtaEl5Zm5IbEZhUzNQ?=
 =?utf-8?B?eENORGZTR3k3UHc0UVFIWHNzS0hYYVJSYVZHOEcvNDVRSDB0MnY5N0NkYU5V?=
 =?utf-8?B?cXpCeW5icldlbnJxL3VwWjlLS24zU2s2UlFOTVNxcW1SUWFIRU1IdWpFNlNZ?=
 =?utf-8?B?Z09FVldqd1FLUEl1VDRTOVVNTTV6eUV3NGVVQVF3NFQ0aUdZSTlsNW0zeEQ2?=
 =?utf-8?Q?ge24=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8268241-fc7a-437a-b09f-08da8c034bee
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 10:18:21.2758
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vb/q63bAialoIZEvUUkcPwF/aVUrjOz1/um5FXgjEwU3sSsNMn3yuFuXB+vXuZyzm5JQUOljLBhJxMWHydk0tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_031825_400242_B1DFB4D7 
X-CRM114-Status: GOOD (  16.22  )
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

Hi Krzysztof,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Thursday, September 1, 2022 1:26 PM
> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; Tudor Ambarus
> <tudor.ambarus@microchip.com>; Pratyush Yadav <pratyush@kernel.org>;
> Michael Walle <michael@walle.cc>; Miquel Raynal
> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>;
> Vignesh Raghavendra <vigneshr@ti.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: devicetree@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; saikrishna12468@gmail.com; git (AMD-Xilinx)
> <git@amd.com>
> Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: spi-nor: Add reset-gpios
> property
> 
> On 01/09/2022 10:29, Sai Krishna Potthuri wrote:
> > SPI-NOR flashes have RESET pin which can be toggled using GPIO
> > controller, for those platforms reset-gpios property can be used to
> > reset the flash device.
> >
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > ---
> 
> You still miss the user (DTS) of this change...
Do you mean to have this property in example DTS in this yaml?

> The JEDEC spec did not mention
> a reset pin. Can you provide the user?
Xilinx Octal SPI (cdns,qspi-nor.yaml) is using this reset pin to reset the
flash device on Versal platform.
Do you want me to update the example dts in cdns,qspi-nor.yaml file
to reflect this property in this patch?

Regards
Sai Krishna
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
