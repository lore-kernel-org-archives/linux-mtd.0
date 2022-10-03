Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF459C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Oct 2022 10:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5SjEYfjJpDKZm+FZ8MX/e5id1+faqcjDAoMnSmdJ30k=; b=yijsT2HEwB6iIW
	n/+9xqbATsUbtROFS5OpTkIokSYYHOXjXp/fy7C58ZgGNPBN1itebCZOGmamrvNn0uyo+5MwYOXZR
	Om2PG4jSq0k/o1QoERpZKdNeGMg9+VeyOulsehTmLJkKowO8xsRoJGE5eabBcDfuC0CGTy44/lK0h
	V5p+KuwHrz+8SaaiapVUKe6SFweLjP5T5DDbOQq4L4xrYJv6/HNMkim5PoN+f79cPZiGUMB7hoOu4
	2CvKdmB6VpF7SA42UIx7ieyCO5QScuD3ZAIrhUi1b3eGE6lgIHEWkhsBp6wtiGdPLFD+2pdUFp+xb
	dyNEtQdE2JLj4a02VPxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofILF-005Eae-Vr; Mon, 03 Oct 2022 10:06:30 +0000
Received: from mail-mw2nam12on2058.outbound.protection.outlook.com ([40.107.244.58] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofILD-005EYO-18
	for linux-mtd@lists.infradead.org; Mon, 03 Oct 2022 10:06:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ukj35v4rolU8sjQ/CugQT6cMMfhKJVLfs0SeprgYLAs/ugNdluhuQtpRUy06zzweJSt8+Zn3PLjfm1XDbVKLONSG+UF6cf0Dkkg/YohhmWEFU5tT4rB61Q1HvOWw1BmeGvscrTun7xLXIEQ14QnkAzjdCslwZtSIh0cDqhyZQXGky1NgL9cTy9bqlkjkF5rdShTa8+gyuVDTNQxvRuot3y3BXXE7l5yFJQZHOzWUjaIFWPI5raGlhEQjApUZHJFWooV8x8+OxcOwYmJboBo/GT2fhrezegNwzV+ISKXt+GKCOcj/mxB8PdQayZ9M5PZwZAiX1YdPjUG5ETvLDJXlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waeXO+UVaDSw3x34f/v0De4Ru/N1+gQUwIWG4Euai+w=;
 b=fGo8+4AypIji79WrtB+cyGcag7Os/J0l6yYLEMdqq9ynFu23CNRyjwwgmIeED/oppjPi1ivqgwSk3cibx7CYpE8aI5JV68Jz2Rfp5jqvcYCywzbZvWnB6eV3bqez29vApvOPI5QPh65ZJJw6u5hQwRSZf3lzXmtJwKwGWMHaOKonU9j0slbVwQmYa2Ek5nAhfAXIyIPH/ygrCHy1aYBTxgid6B/hnFfIFdoGvqOHHGAf1ab2KOXxB4Pu9mvxSGYa/sHmw85Aft78+Ma+msI6j+Oz+orPL2X7n55S6dichhuZyB2SpDw+v3pIfvFLAkgOzyd7L0OdSXk76OHzOrHkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waeXO+UVaDSw3x34f/v0De4Ru/N1+gQUwIWG4Euai+w=;
 b=i68Mx8xM3673IC4MrnjiY1mrYWQTiZKa8sukAupxpxjm3nfPo09Npq5nkKq4nttmMO/bUIY5VBFKXAYOyiyi4YttaGHa9ftRbF/PfHE0cqC7e9lmPSjqXesJMKJD3B+I+9I2XMmEzDc3mLIArhnCaKDQ24Rw8S06ilwQBluT8Yc=
Received: from BY5PR12MB4258.namprd12.prod.outlook.com (2603:10b6:a03:20d::10)
 by PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Mon, 3 Oct
 2022 10:06:18 +0000
Received: from BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::b9dc:4a95:7144:2b3c]) by BY5PR12MB4258.namprd12.prod.outlook.com
 ([fe80::b9dc:4a95:7144:2b3c%3]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 10:06:18 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "michael@walle.cc"
	<michael@walle.cc>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"saikrishna12468@gmail.com" <saikrishna12468@gmail.com>, "git (AMD-Xilinx)"
	<git@amd.com>
Subject: RE: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
Thread-Topic: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
Thread-Index: AQHYw07vjkMZ5QQzXUimaba/7AEwIa38kn8AgAAD7EA=
Date: Mon, 3 Oct 2022 10:06:18 +0000
Message-ID:  <BY5PR12MB4258E91B51E4F7836828744EDB5B9@BY5PR12MB4258.namprd12.prod.outlook.com>
References: <20220908064428.2962-1-sai.krishna.potthuri@amd.com>
 <20220908064428.2962-3-sai.krishna.potthuri@amd.com>
 <7777b2fc-8c22-22dd-1ffd-dfe8a21ea0d4@microchip.com>
In-Reply-To: <7777b2fc-8c22-22dd-1ffd-dfe8a21ea0d4@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4258:EE_|PH7PR12MB5926:EE_
x-ms-office365-filtering-correlation-id: cf44dd09-d972-4aa9-7821-08daa526ea67
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  keDcsp3D19ION763BhfBvUwnQSaZFjP5pJNqLQHCW7EprHRj6AilUP0xpfDFyHua5vjBzO9bLq2ACEnLqMZ6tmDQyBNWB1RVWv2RBsZXUIH9qOkpxh+Fai1B/ubIYhduCnWuRYkf2w+RziTUrcyGWZ8Zj2Pe7OGneI6L9h3oSfMw7MHVxqD+I1POAoMuzNEU0GqFCyfNdWwVHGKc14QE9zQ6t7Zv14y4jbUY+MOqpbisoMig7ApWb//9I3FaYXf+bF4fZH7iRNBvzhefsmyj3nYMYeMWkt74n6Xl+/ZWGPZ+8DAUq+KrK4EJceLLtAHzaFoNeZN3BcQcnzjZYMePtm2Qp0Mc3BpE9WX7q2Nuzs+YB+6sRxovSOWG+2lXwrHn048aMW1fzwmgUW66ITZZN+7XySZxfEbuo999EyIkcbIOXcffr53K1kryjSCqUkqD9kWntcOMTc/cDDkUuNMDAzw8AfIsEP89bahb9PNwTSC37uuhOknasbJkY8FXemnStxJAvZjwXZG5nW1eGJ5nUc9D6uCGfLyRBH++bv6TFUDh5Ql/OrvdwJHRv6PIzNphCWxZVYUlV1CVShu8jxmh5pfnDoLQ84MAv03LIsGMhdQumbRdg8ECDgygPhBRCDw3fX//aj5rgIWyabtLXeN/0S+5pBSFgM6Ec/+guUl5/YLlqS+IVI6rCNBFUtx0vZdDlrlLaozx5+bKlUo9u/Q1F44ms++T8xBnmR2OqHgabBw93OwSNf7C87Yn+ChxmWwWYdTNzrNh0k9zXmYw2iHZFw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4258.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199015)(33656002)(38070700005)(55016003)(122000001)(38100700002)(54906003)(86362001)(110136005)(316002)(8676002)(71200400001)(7416002)(5660300002)(52536014)(8936002)(66476007)(66446008)(64756008)(66946007)(478600001)(66556008)(76116006)(2906002)(41300700001)(83380400001)(4326008)(7696005)(6506007)(53546011)(186003)(9686003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aGtxdW56ZHpJQ3NOcFYvWW5tUUxoUkg5MHVqbTlGcFJLSE92dEI2MFVod2s0?=
 =?utf-8?B?c1lGRW9yZitZc1VXQ2FtTkNiaEl3NTE0bi9kbGlFb0h6WWdNWUdsMVhSc0Zn?=
 =?utf-8?B?NGxFUjRPREs5UmU1MUpZSjRHZHYrMEJPOVAwUXkvVy82cHNLQk9pNklqT0FV?=
 =?utf-8?B?czNUOWJkNG13NjN1NE5lQzk4ZDl5VDY5WmNCODVGUDBqSUhqUEJSaWdRZFpH?=
 =?utf-8?B?OGU5WGxsTXJEQVgrQUxCMW0xa2tpMDZUbFIrT1VQQno0dUxDMDNzU2tsR3dG?=
 =?utf-8?B?SHZ6dmR5VGRacjhCOHFBcWZ1c0ZocUFCVk55eFQxbWVGU3lNUjRPSVFpTCto?=
 =?utf-8?B?MFdYaVZ1alZGUVRnMGhHSW1jdDFCSHh1UzEwTlR6VWJMcUo4N0JlZWNzVE94?=
 =?utf-8?B?L1FHZk1CTEpMU0lXUHlZbGlDNHdualRhSnp4MjlIbllCNFdNN2tvL2RDK0Fl?=
 =?utf-8?B?YmpaWXJsWFJNb0Z2d3hYUXRXZzI5NjVCSkx3d1hlbTRWV2IvaVljbGxDTEJs?=
 =?utf-8?B?Q0xLR014REx6bGVZZlJqbk5JT2NwSUtNOUU3emNoZ3hENCtqeEZ5cndKcVhv?=
 =?utf-8?B?YW1DTGs5TTZ5OUYzN1NWVkdZNUQ5NGtZU0dlakdEbVlBVXErb2ZHZzkzMTFH?=
 =?utf-8?B?bEMxS0dWcjY1cm0rVzlCbUVSMUlkL3N2Ty92cTVVN0V3Q3ZhQ0VrSWhwNGVH?=
 =?utf-8?B?eGdXSllhY25BNXQzVk5BSWM0aTdaenY0NnQwM0RhLzk3dm5TVzhrdXdGaGtQ?=
 =?utf-8?B?SGtQd3pvOXRnWDU0UVhEemNhVWFqSHFWQ1VlaGVLbVdkNkRLUTNCVzAzbnJ6?=
 =?utf-8?B?RjVLWm0rcjJSUHd3b0tYSWxnZGEzSlI3WmdPeEpBRVV0SWpBb0l4bXpUYk1h?=
 =?utf-8?B?YUFFSHcvTlYwc1o4MGJXMlRZYVNKb0k2VFBkbFd1NVhISHp5K1hGNHpid3dh?=
 =?utf-8?B?eG9XYXJibnIrNlIrYlFDWWtDT1FKaHpuWXZKZHlmTU5Od0FaL084K1h2dUpv?=
 =?utf-8?B?aTRXWTJIWXRJKzRXTU9WZWFwZ3pMQ1krZitBaURLTHNUY2x2VGc0Mmo5MVhB?=
 =?utf-8?B?Y1FCdWc3TnF5ZVRYVFIwQlFpRHc4Sm1oQXBITVMyVmN1T0pZMlpsQkFHeUhI?=
 =?utf-8?B?MTcxNDJ0dXNpdnlzMFM2RWJDNk1xazBqdVdPeFU4Y1lhOCtjeU5JR2NhcWRw?=
 =?utf-8?B?eFJ0YU1LQUU5YnZzUkxoT21hWXZYbnZFUE5XUzRFTnd6RE8xalZub2JxQUt2?=
 =?utf-8?B?cjY5T28zb0dEYnhmcWZzMFIwM09nWFMxTndrTHc1Nnp5a1NnbVZPM2RmS3RR?=
 =?utf-8?B?ZERZVGJlQmNrUmV0ODF0M0xMOHFKc2YyTjVkQ1p6dHF0Ujhrc2drTzJ6Mlh3?=
 =?utf-8?B?Z2ZJK200bjdRYmx1Y0tRTW51Y0VBV01hc2dTb2I5c29WcVN2YTVxMDFpbUNH?=
 =?utf-8?B?QUNjemdJUU1NRURwQlBiRFdJRG90Nlh4VDVwWjNaMmFWdmF0bkJWbVF6RWkx?=
 =?utf-8?B?cE5Bb0Z6Y3ZHaHFldmRtTnVYc1UxWUkxZTFnRWh5TERGejZkaWswd3loY3F4?=
 =?utf-8?B?UGtRY04vankveDdXTGJxM2YzZU8zclpYbms1Y1U2VTZqYkdKeFEzUW9rWW42?=
 =?utf-8?B?MHRDYTNHV3F5VFh3bFoxdi95c2x4dytoaGlpVkFRV2tmdUh1bVoyUWdPSGMw?=
 =?utf-8?B?NUkwWmtzU2o0TzlSVTRBNUp3NlVXY2QrL2V6MmpKbWY5aWlETlF0L2Zud3dr?=
 =?utf-8?B?ZUtXcVdXNWdzZDdaYlhSeXVqM0JJR1dCMGNQL05aeldWZXVISGVnTUR0cmV6?=
 =?utf-8?B?Rml4VHoyZ2R3VC9BR2hmODQySC9kUjRkc3R5TDlUR2hJUVdrNXdiZXNkWENF?=
 =?utf-8?B?SU13STh0ZUs4S2lyTmtIbzk5V0ZnWUdlaFRGTSthQ1Q3Y295WmRqMDhIcDJw?=
 =?utf-8?B?eTlHdzdyMDNvN0o2bFlxYURsaG85Y1hndzNMWTBFOTlIb2hsS3BaZXdXQlhY?=
 =?utf-8?B?b0lrZ1c1ZzYyZkJPZUVYY3h6bUplTFJIYnZWS08ybjBHRUszaTVjSGFwNUhM?=
 =?utf-8?B?cTkrL1M5ZjRJTE9iZmhOQ0k1c2Q5UXFoZEUzTXRLbUh3SEI1WXpHU3J4Q1Zz?=
 =?utf-8?Q?Ohbo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4258.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf44dd09-d972-4aa9-7821-08daa526ea67
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2022 10:06:18.5711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsEEQvEtlZFI6pUa5pjH2FCIf5mM4erWQYypuYc5kGRBtMYoYbwRU1rFUI783rNY8Iy9Dl0WZ9+RCzJpbeYY9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_030627_118660_FDE0B35A 
X-CRM114-Status: GOOD (  25.91  )
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

Hi Tudor Ambarus,

> -----Original Message-----
> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
> Sent: Monday, October 3, 2022 3:13 PM
> To: Potthuri, Sai Krishna <sai.krishna.potthuri@amd.com>;
> pratyush@kernel.org; michael@walle.cc; miquel.raynal@bootlin.com;
> richard@nod.at; vigneshr@ti.com; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org
> Cc: devicetree@vger.kernel.org; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; saikrishna12468@gmail.com; git (AMD-Xilinx)
> <git@amd.com>
> Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Add support for flash reset
> 
> On 9/8/22 09:44, Sai Krishna Potthuri wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > the content is safe
> >
> > Add support for spi-nor flash reset via GPIO controller by reading the
> > reset-gpio property. If there is a valid GPIO specifier then reset
> > will be performed by asserting and deasserting the GPIO using gpiod
> > APIs otherwise it will not perform any operation.
> >
> > Signed-off-by: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
> > Reviewed-by: Michael Walle <michael@walle.cc>
> > ---
> >  drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index f2c64006f8d7..a78ab9bae2be 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2933,6 +2933,27 @@ static void spi_nor_set_mtd_info(struct spi_nor
> *nor)
> >         mtd->_put_device = spi_nor_put_device;  }
> >
> > +static int spi_nor_hw_reset(struct spi_nor *nor) {
> > +       struct gpio_desc *reset;
> > +
> > +       reset = devm_gpiod_get_optional(nor->dev, "reset",
> GPIOD_OUT_LOW);
> > +       if (IS_ERR_OR_NULL(reset))
> > +               return PTR_ERR_OR_ZERO(reset);
> > +
> > +       /*
> > +        * Experimental delay values by looking at different flash device
> > +        * vendors datasheets.
> > +        */
> > +       usleep_range(1, 5);
> > +       gpiod_set_value_cansleep(reset, 1);
> > +       usleep_range(100, 150);
> > +       gpiod_set_value_cansleep(reset, 0);
> > +       usleep_range(1000, 1200);
> > +
> > +       return 0;
> > +}
> > +
> >  int spi_nor_scan(struct spi_nor *nor, const char *name,
> >                  const struct spi_nor_hwcaps *hwcaps)  { @@ -2965,6
> > +2986,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
> >         if (!nor->bouncebuf)
> >                 return -ENOMEM;
> >
> > +       ret = spi_nor_hw_reset(nor);
> 
> Should we condition the calling of this method by the absence of the
> "broken-flash-reset"
> dt prop?
This is the suggestion from Michael on top of my initial series for which
i also agreed to have this call unconditionally. If device tree is having this
reset property then we can do the reset in any case.

Regards
Sai Krishna

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
