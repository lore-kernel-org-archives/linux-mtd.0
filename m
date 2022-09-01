Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CFBECAAD1
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 05:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LMtXoZmFHYd3pyzgGNRIWb6PSz4WImVmAmpnPJXx7Ng=; b=dOrw17Lzxa4Djk
	qhu8/b9a90z1O6IUTVFnssmPEqPP9aUfis/hGO6U6v93bhJZMSprVaXjGYYowOpxHulRzywWPnbIz
	s8F2uBOdelUtvPQNisJVZbgFAsYqUy5gOCKqb8+RXHm+5tRSg8NHieHVJ3jBqN5MPx1aEeXbJiFCP
	bnFcbnFeHJw+woE/1e+EdaZKCI95Oz5iqckLqoGvJINqWrBRXUpowUScbLd5Vq5GHJRZ14nHEOzqF
	k81/u27L8FloPNzXWcIdI+TTOXyt29SnB3UMgPzcCe1d+8E+63LhYgt8iM2xS7Y1Uy0ZA7iWzaBgQ
	G8DELXrax+4Wb75WtF3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcYc-009lx2-5X; Thu, 01 Sep 2022 05:16:02 +0000
Received: from mail-sn1anam02on2046.outbound.protection.outlook.com ([40.107.96.46] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTcYX-009lvE-Rw
	for linux-mtd@lists.infradead.org; Thu, 01 Sep 2022 05:16:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiNgQolJWU9ILe6JJdAkHNLXNw0xRB8R+wheUxwUS23EQ6/3IIL+17L4nC0W8OVT3TMu6FvZNJBXzFfhi4RgSsJrKjhKUxNtJrZE7Rp53HwsI5xvbZacflWj4z6q0OWIg3C9HBX9Ibf4IwJCqBMhhhVnqTZGbHdwsKhubnPSOUbOtJhMetZCXJLERw7FdZx4++Hqv2qq8A06v3Z7x3xThI7anHjw+GGO90/AD3/MrS2n1GtC//ZkNZCme5WPZNZZHVf0CBIlAssOnzy2nrhTTd+9L2xXNqa66qsGmIVYVTVDgrP61/7i7PWWhfYW8ZMlb6b5cnoqCjYROlLLEcK0Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFgSYsXyXxP3L3YmvUumR30JnOvPSIT7Sfj/jo1GG5c=;
 b=PY/fAIZEWGT8lkjgScBc8466Ova4ytymPgdX7W35Ziqj337a6cMSJYAAsqPNQR17GVILPLy38Vgc64Ka82D9gE86yx7h/cwXWeJy5h+BSjKRDWZaFnmWSNG7J7u05IJmglGdMefR+ucMmjpxwZqFGwev6UIkZI/ETEPaKRI6yRINRFDShZjjOPA1alBM34zzJZhmPvPsxyBJRcQT5IGNjLAArkSpapa0XKA35bA0/uGkYt53SlANrtuUbJCPfHPl1U1REDAbJ4sdAjFJmW2tngOpdW8a1Tg0fNYiRgF4Z541IbdfNxx+kmM/ZIArJ3E2hKClhOcYOHGhsd0t3unriw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFgSYsXyXxP3L3YmvUumR30JnOvPSIT7Sfj/jo1GG5c=;
 b=2kbG8j8TMy1TF3BtuzKzXvoy2hJfPhhaSUrOeCo2qQWMuFZl91jHwFETIrU9aCsgNng/Q1elACrpqJp/UDL5OOLL7v9XIMbTwumREO6jenI6tO1OWp3GV7SIYflvLpy7BgX4DOfuZGEKECwYiiYeMcwC5TR7jukf4gzuzD429c0=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 05:15:51 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::f5a1:c4e7:9c3e:3231]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::f5a1:c4e7:9c3e:3231%4]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 05:15:51 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Takahiro Kuwano <tkuw584924@gmail.com>, Tudor Ambarus
	<tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Michael
 Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"saikrishna12468@gmail.com" <saikrishna12468@gmail.com>, "git (AMD-Xilinx)"
	<git@amd.com>, takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: RE: [PATCH 2/2] mtd: spi-nor: Add support for flash reset
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Add support for flash reset
Thread-Index: AQHYu4bSUGIrY8nYfU66nbvPu6SLyK3J1VwAgAA0oCA=
Date: Thu, 1 Sep 2022 05:15:51 +0000
Message-ID:  <BY5PR12MB425897185209EFB1CDFCBD3ADB7B9@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20220829090528.21613-1-sai.krishna.potthuri@amd.com>
 <20220829090528.21613-3-sai.krishna.potthuri@amd.com>
 <11077b0e-0a79-401e-5232-1dc1d1a04d83@gmail.com>
In-Reply-To: <11077b0e-0a79-401e-5232-1dc1d1a04d83@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56a288f8-235f-4415-b4a6-08da8bd909d3
x-ms-traffictypediagnostic: MW3PR12MB4345:EE_
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5Fkn36R9v+PCfmwnzJv1YoFlz2rf4n8dg2OnLvoJ0VHAGCubChM9HMb7at00xr3NK4PlsRB9CVtsz4bIYkMV8BlBON+9uZLyzb0LouEHa2g0EMgagYVjWOG2FJSJI5ctzzm32EJju2b9ibXSnbAAu2SegTTbxFQu4LPAst1DI23uABUf7W45rEhGqHUuE1gL0sPqXqf5uIw62nSleHGm8IDkEm9AUK1G7Vn2T5RB2YYWxGVzXHNZmCL8ZQD2cMUtfSWAoah3HYwkO3HAEArxlog3N+4nW0YI6oiyNCDPFIgeX6BbSuisA44CNtZtBnMgHmrRW5mdrimYlb5kdsdg/QEwma8ud4QVb9AaQiziFjVF8Mu0jPCMyz9jambAL04zeMrZ5YXrMLdAVkE8ypkahqU96uCwAwP0a7tK2Q86M5sQB0d7WNgyoldLjvJyV/E2gUF2dX4ZqgTqbGWpsmTKtDMj7pZwhKY9rZCVOQjhEwgPhhy4U177uXt+0JFDxT8Bvv6u66IekymoMXMaQqTpDKWD4VTOQoSlSx0fCrQh3KN4pp/RiBGFrrLfrtgr7aMTr/ZrNo5Wb09NoIxzLOt+pfjcrOdyzYAmkZfy+P2O3l6momPg9otG3alA8G5XZppHfPVdQ1NiIarJdxruZwa8BH5A/jxlfbnyFvPNOuJngNUBo8P+s+MCZytpT8mGXVuD0avWGKRtxSJi/rdbe2ctGecf3DHiNuO2ntR9KR0qmL1IHShX+dvZfH8UqQ6I5JhVwnXgmds7DisMjZHThnfQuWKTIZgqCK+e8WhQ5I2DIGs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(966005)(54906003)(316002)(186003)(66946007)(8676002)(71200400001)(110136005)(66556008)(4326008)(66476007)(76116006)(66446008)(64756008)(478600001)(5660300002)(8936002)(52536014)(7416002)(41300700001)(38070700005)(86362001)(122000001)(6506007)(26005)(2906002)(38100700002)(7696005)(53546011)(83380400001)(33656002)(55016003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UEJGQzVpRlF4KzhLYWVjTlVWUW05SE1qNG5pdFBzNVhHWFRqb3JtR3FEVFNB?=
 =?utf-8?B?WWJhRzI1MUNmUE1XV1FxeGlMOFBsQzJkMDBDbmFzWkkyZDlOTllBR2x4WWtJ?=
 =?utf-8?B?MlNSWWFKWGV5WnJTSU1LMDdlQThEQnlseE9SeUtvaHd0OFNHd3d0NGxCVEVX?=
 =?utf-8?B?cDRpOVB0dUhoRTlwSUZORGxtNzlDdzVObDRMVVVXcTFLbG9QQU1JbnpRTVJE?=
 =?utf-8?B?cXcwWUtDMVpueEptbnJZcnNaSkhDRGFIK1BBeTZJV3c4SHREeHFVVFlYK202?=
 =?utf-8?B?TndGeFZaOFp1SWNINDhPMHVWUFVOZDhRekJuS0VBeWVwK0RLYmo0cS8xT1FI?=
 =?utf-8?B?dzI5TVUvMVRwakd5b0hTWWJUOWtJUUUwM3MrQ2IxNlJabzJ0aXF0TnpRSERK?=
 =?utf-8?B?VGFGU1UyWVVLbExWMEtPQkFzUjR6ZjF6T054OWRjVUdTTlZlTWZoSnNCSUwz?=
 =?utf-8?B?eW9aZkhCTkh6T2d6UHE4S2pzNVRERWp2V1JNVldVZi91MW1MK05ZZlpDR1RG?=
 =?utf-8?B?QmE0WFVIMnFmbXJnRWhZU1RRMlNjNk90aWxpeE1uaHpiS2s4c1RZOFovTkpw?=
 =?utf-8?B?YUZmSWZHcWwxNlVNazl1SFc4dEVzYjM4M2t0YkJpc21TSmZCRlJlZUVVaE1P?=
 =?utf-8?B?TXpMR29xY3ZoRnNRUkp5clNUTjI2d3NpcTkzWnU1L004aHl1YnpQQWQvTmZw?=
 =?utf-8?B?NzlRdXFYZWMxYTFrb1BGRmFxcHoxdzE3M0FwS0JkeWpGS0xuczJmaXQ5dkUx?=
 =?utf-8?B?M0Q2aTZ4a3RLb25hMGZQL01JOHlKbi96eUFsUzVMNFlMYlBzMVJJdXM0Umh4?=
 =?utf-8?B?VURpQThiRjNYSWI1OXNBalJ2NmNWTlJKQ0dPTlBQVmlycFpBa3FwcHhjRUU5?=
 =?utf-8?B?bUg2ZFVTYkpaMW9zQ1dwTFA3eStJbS94TWhEQmRvRDhRRFlLRG9pM01XVmtS?=
 =?utf-8?B?cVNiL2txNEhIMCtONWxtYXQ5OEIrT0U4eGRxTG1BSFRRY0o1QW5qZ3N1WHJz?=
 =?utf-8?B?Q2lJamp6bTU1WVcwak00ZVB6THBTeEZuQ0RKbHRxNVJJMGdCelN0NVg5NEdC?=
 =?utf-8?B?THd4L3lQNUNlWDJvV0UxWGZMMWRxTHVmQjBRRnVkUkpHdEMyMm1Od2czbVU3?=
 =?utf-8?B?Q3Q4SGgyVzA2YUgzeE9jRXJPbHhnKzlBR1FJOU1vQm9CL0xscEh0RjRCTVpR?=
 =?utf-8?B?cDl4UWdGMGcyckIvZjhMcnBjQllTY1laSzdQSTRreFJDNEVaQ3dXODBGY1Rq?=
 =?utf-8?B?bThZem93MkdXNW9wc01qNkVWMUc4OHZOMWZ3NzVxcVovL2xKaDJDRklWSDRT?=
 =?utf-8?B?RnR5dFBzVW1yY3Q0VzFya1JaMHZZanhBcmgrdmRaQ0J0c2dyc1dmcDl4UGNk?=
 =?utf-8?B?Q3lLa2xpVmtKWFNIbnlIVzRQK0t4Ri9Zbm0rMXh3Z3dNZ1VuSndMRUhTYzJh?=
 =?utf-8?B?V1BaMVJ6M0xUUm5hcnp4ODBvZXJMT09CTWI5MWQ0cytlV3V1RzNSUmMzT0dF?=
 =?utf-8?B?VytGZ3p1OE1RMEQ1NFRrWGkxRU1qRDg4VFdFTUFQU01INXcySkNJVGgyR1g5?=
 =?utf-8?B?M3FGdmZBNGt6YXpHOG1wQkhkcUFTWlpmRzlGamVuVjVkTDJlc0xqN0lBWlNT?=
 =?utf-8?B?L1FMSFVnUUhxUDlUR09hUklIR1ZaQ2oxNHJFSGQ2c1d0OXJqUkd4RHpGcFVj?=
 =?utf-8?B?NSswaUgrNTFwL1R1S1oyUkFUc25NZGFrQitSc25acW40Z3Z5Q20ydW04M2pX?=
 =?utf-8?B?MEozeW1leUZ5OUtXL0ZFK1BkZ2ZUYjlENmZobHAvRTlBbElRNmk3RGhDOEdT?=
 =?utf-8?B?TWNZYVNnRzRXQWxPbjFsS29ZVElKS2hlcTJnSEFmamlFcWh1NlpmV3VFODJO?=
 =?utf-8?B?dExBdFlqOU1LcVYvQTZYYmJWNWUrenR2OUpxTXZma1hhVTZ5YjM3U0gzajNn?=
 =?utf-8?B?a1JhVjBpM3JEYTRyUnVMTnZ1K0t1cTVPYWd4b1lXTnFLdGtWbXlZM0ViMlNu?=
 =?utf-8?B?WTR5N2p5d1Iva0VscTZXemNEcDV4b09SMDh4aG9pdVkrK084ZzB6NFhZa29B?=
 =?utf-8?B?OTJZT2Vqd0hGREd5SDNNUndmS3BWOUpWS2xySFpmcjVyVzZxS3BHZUgrKzFq?=
 =?utf-8?Q?3C8w=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a288f8-235f-4415-b4a6-08da8bd909d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2022 05:15:51.4911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +GHcmjSyX0OuIk7pz2Y3RydUi1hPB+G0jWU4zBsrr/UOxxL3X1b5XGhdw10JZ1UUatulUEteVMN2i9GUXM5sAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_221558_736520_E79251B1 
X-CRM114-Status: GOOD (  28.00  )
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

Hi Takahiro Kuwano,

> -----Original Message-----
> From: Takahiro Kuwano <tkuw584924@gmail.com>
> Sent: Thursday, September 1, 2022 7:28 AM
> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>; Tudor Ambarus
> <tudor.ambarus@microchip.com>; Pratyush Yadav <pratyush@kernel.org>;
> Michael Walle <michael@walle.cc>; Miquel Raynal
> <miquel.raynal@bootlin.com>; Richard Weinberger <richard@nod.at>;
> Vignesh Raghavendra <vigneshr@ti.com>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: devicetree@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; saikrishna12468@gmail.com; git (AMD-Xilinx)
> <git@amd.com>; takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Subject: Re: [PATCH 2/2] mtd: spi-nor: Add support for flash reset
> 
> Hello,
> 
> On 8/29/2022 6:05 PM, Sai Krishna Potthuri wrote:
> > Add support for spi-nor flash reset via GPIO controller by reading the
> > reset-gpio property. If there is a valid GPIO specifier then reset
> > will be performed by asserting and deasserting the GPIO using gpiod
> > APIs otherwise it will not perform any operation.
> >
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 50
> > +++++++++++++++++++++++++++++++++++---
> >  1 file changed, 46 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index f2c64006f8d7..d4703ff69ad0 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2401,12 +2401,8 @@ static void spi_nor_no_sfdp_init_params(struct
> spi_nor *nor)
> >   */
> >  static void spi_nor_init_flags(struct spi_nor *nor)  {
> > -	struct device_node *np = spi_nor_get_flash_node(nor);
> >  	const u16 flags = nor->info->flags;
> >
> > -	if (of_property_read_bool(np, "broken-flash-reset"))
> > -		nor->flags |= SNOR_F_BROKEN_RESET;
> > -
> >  	if (flags & SPI_NOR_SWP_IS_VOLATILE)
> >  		nor->flags |= SNOR_F_SWP_IS_VOLATILE;
> >
> > @@ -2933,9 +2929,47 @@ static void spi_nor_set_mtd_info(struct spi_nor
> *nor)
> >  	mtd->_put_device = spi_nor_put_device;  }
> >
> > +static int spi_nor_hw_reset(struct spi_nor *nor) {
> > +	struct gpio_desc *reset;
> > +	int ret;
> > +
> > +	reset = devm_gpiod_get_optional(nor->dev, "reset", GPIOD_ASIS);
> > +	if (IS_ERR_OR_NULL(reset))
> > +		return PTR_ERR_OR_ZERO(reset);
> > +
> > +	/* Set the direction as output and enable the output */
> > +	ret = gpiod_direction_output(reset, 1);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Experimental Minimum Chip select high to Reset delay value
> > +	 * based on the flash device spec.
> > +	 */
> > +	usleep_range(1, 5);
> > +	gpiod_set_value(reset, 0);
> > +
> > +	/*
> > +	 * Experimental Minimum Reset pulse width value based on the
> > +	 * flash device spec.
> > +	 */
> > +	usleep_range(10, 15);
> > +	gpiod_set_value(reset, 1);
> > +
> > +	/*
> > +	 * Experimental Minimum Reset recovery delay value based on the
> > +	 * flash device spec.
> > +	 */
> > +	usleep_range(35, 40);
> Infineon (Spansion/Cypress) SEMPER flash (S25HL/HS, S28HL/HS) family
> specifies minimum tRH (Reset Pulse Hold - RESET# Low to CS# Low) as
> 450~600us. Please take care for this.
> 
> Please find datasheets at the following links.
> 
> https://www.infineon.com/dgdl/Infineon-
> S25HS256T_S25HS512T_S25HS01GT_S25HL256T_S25HL512T_S25HL01GT_256
> -Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-
> V)_Semper_Flash_with_Quad_SPI-DataSheet-v02_00-
> EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee674b86ee3&da=t
> 
> https://www.infineon.com/dgdl/Infineon-
> S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256
> -Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-
> V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-
> EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t
Thanks for sharing this information.
I will take care of this in v2.

Regards
Sai Krishna
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
