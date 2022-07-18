Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76616C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Jul 2022 05:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRIORZnFczDpKb6KCEq45O6o1oXkb1tPFXiCao5CBRA=; b=OW/zTl40QWpdJE
	348Wg71FqRa4jw8aQo2ttZ5LMGi/MjXXqlw9CHSHCeneFvKKXLWGTzTQSMMgleQ0tJhaJTbRsDmWl
	D85NGonLvLEkLdburc3Lh1Hb57cI5u2h2ifRQRZsFW3VLJkqTj1grrymlpmfFBNwKfyrXYH1rpF2Y
	YLFMp3hZvUm/uc7y1iWm37uB8wOnHa+CM1CDz0Alqyxjyjil+ZSp7L3EPX7Y6QazYRhlwo0kNlR6R
	Etiti7oeBoqKPDCCHctU4uSIDW1E1gJd1IVUoihXNIQ2eGKw0cJmTWjLXa2FFFO7Bxi/iP9NcAMmd
	9SDXUH+f09ORv1pM+6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDJhb-00B7BR-6C; Mon, 18 Jul 2022 05:53:55 +0000
Received: from mail-tycjpn01on2090.outbound.protection.outlook.com ([40.107.114.90] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDJhX-00B79l-PZ
	for linux-mtd@lists.infradead.org; Mon, 18 Jul 2022 05:53:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GogFp172fxl+ugkS5Ui0O+QW2r468CaYgXHiZ/Evdg+KxYTOmE3gD24oGF/I+HHQMVjioa8Cr3RjBI9HB+JqAwqUKU59xt4KPtUvYVqzZG6UNJ+vEN3CXQ0hGjpIkqi9GP03lXUL32mLxFbMVsvEl70AcXOb0TZdizJfm/o4lCFMUWZfKER588rEgSTIvRz0jKaBF3Uq0ErPLP37dA8tzNTlVhaLw7eTz21sUUCtWzperTTTvHUEwOqmuUHjcLVHVZMMLMda6S+L+aVkyyPCjrlQUT8AkFA3CQpBCC/VG6RqwIjWN0dOlriDSEOgF+s7nA3+I6Fpc2/Wg9kNC+16ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OUlbQKkKhdekYWEZDWgB6guN7P7i+DQ1cYp3HnR4JW4=;
 b=AwGE1obnegn70d+m3c/vF3ifiQQ3YR+5LaYL7ZYg/1U50HHsQB2iVuHB8Vr+lBkwsjrV/yMlqYdUipNg4AzmRFf6WfExnenHkDYMTgowDr1WLnSRUUcXs1bHoTtRfYf1MwGx0M9phHL50yUKzWS3O+Yxn9eA+ptiq5hA2tVitRFuN1rENYyckYTyaZsz/g2QJQfqrGgxYkD5ZYlO7ORy2lHsFFwSDoiWtFxqq5lRiIRF1R7hLUZzvPO13S7i7vkE1b8ab36XPwc+VaDWQjFdGCb/pLvQvMFdF+zMVI7F9e1R1OdNu/BIaLi/wykcIyaKsyOSmeCEWhu6ZpYTmOmxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OUlbQKkKhdekYWEZDWgB6guN7P7i+DQ1cYp3HnR4JW4=;
 b=Mw7lrpBdat+3x7w+0q1U8WKicWoKGCU0UhF7LRaSCMf8dc72KusOCXI3n59M/EVyVxvbQaidNJ5+p3eguPC83ecoM3qc20cPaH/TVDPxDl9C+qDGGFjFa62M79dWn7nxNZXLSgi6yi6TYRa0qMbqcyV2impMm7z+QpAFa/vqQFo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB4721.jpnprd01.prod.outlook.com (2603:1096:604:6b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Mon, 18 Jul
 2022 05:53:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 05:53:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Chris Paterson
	<Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] mtd: spi-nor: Add support for SNOR_ID3 macro
Thread-Topic: [PATCH v2 1/2] mtd: spi-nor: Add support for SNOR_ID3 macro
Thread-Index: AQHYmDmteSy4RoHgrEGi0PUUjZ42fq1/U7OAgARQe3A=
Date: Mon, 18 Jul 2022 05:53:34 +0000
Message-ID:  <OS0PR01MB5922D95C2F4B5D282441490C868C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-2-biju.das.jz@bp.renesas.com>
 <90beaa944df3778a50278afd2ac4bb8f@walle.cc>
In-Reply-To: <90beaa944df3778a50278afd2ac4bb8f@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20e46d5e-d2c8-4c8f-0796-08da6881d9da
x-ms-traffictypediagnostic: OSAPR01MB4721:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7hVj+h+0rz6YFMivx+jDAfp37H/cJ6eVLCA18m5vaZrVgUFHZoX43lX6qMLBu/Xlw7Auz280hNoc0rqepTFqdw8rTJDQ/h7hMnso8So/NgDHhTR0dmhgkpEsBIqGl69RdwQ2V98bLvgjhp3VyLnOVvxYafXaJQdzvRZ4uHKuFe75HF3TRxfrKi0CGJJuTdGMotpdZqOUs4+Lly4O0auL1BTUAhMrw8CBUxZ8R5yV6HTs+Blofc5svpm+A4mzYQtR4uNIsnkA5hgsC/gEwAWF6l85hPt7qdKq1vpmqXPMd2e7uCAJr25ibr4a/8sB32W+nuMJoSwAlyUJ31HJWnKf6xCTj6f3GkUUJAHK4cJbVkgC7RXyBt/1O8QdFzU40lW9tbIT1F/O1iL+IKp2O6a/BV/BkvJCq/i12088pmxq7ICcWwRK+PZmS4141rtG4LNkGAqdeOserRnhotHBO1D0dyL403J3PH3bbLNs7HRihuOplLizrX5qW3E/eocm4UiHR566tQ/zuIxj5MRcyua0WVA5/Px3AJAqT0pgIrYUzUNVkFZF+nYPvfXXwuowUkVvlJ6yc7iZaq4fwTyhyXYd/hrObC/1OPQmBUKkJLIFPFAc9OeflMX1KxA2Hr/9WQnmZBT46GaZfYslNCI6EofwRWOKtJjhV/cssLeZhE/r+uLD3Svcwp32K//m5oJmBfbWFxmpezqfvGytknMPqg7wqD0bsPnAgic71Wy9iAMc8kXSS1M7vV0bOTsNODyI8G7u6fq87cUowKoJOipVq+aGava8+RdQHAj3OWzKfmhp9joyguB1KLk3NEQG/CZxkolz56XsjsASHIHsjWiCbhiRrQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(33656002)(52536014)(5660300002)(55016003)(4744005)(8936002)(2906002)(54906003)(86362001)(6916009)(4326008)(76116006)(66476007)(66446008)(66556008)(8676002)(316002)(478600001)(122000001)(966005)(7696005)(41300700001)(26005)(9686003)(6506007)(83380400001)(38100700002)(186003)(38070700005)(64756008)(66946007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?jd67h3giqPncg/QpGtZSXzjjKfZ4jHtV0ou+sCx9yUbZJbH5Pon+Dosi7H0j?=
 =?us-ascii?Q?k+Ns0AbA5RbyHmoOkpOfxOodtLdcPjhPdVm2E5xqIqKcMowh68mZKtHlbv99?=
 =?us-ascii?Q?JBzGrcbkPZ8VmSqob4qnG2b2r12M0w7zyFbt9E+h9dTDkAhYBaSdpWI7YOJS?=
 =?us-ascii?Q?mEsVUNrG2voZDpyzsLJz+AonMcrSbL+cp4+KbaIBd1OWihzL8XFlTkYvQHsp?=
 =?us-ascii?Q?T0YFUkakXGrre3oC4mfVuWeP5yR4UfSbc+kcNA89BC/U1v6EwsotP1jJJ6tU?=
 =?us-ascii?Q?exsKrBuAsm0fNpyCID5JJMXEugQcrGjdc28aMJQOAxphZ0ao6KxgTi0RyzuN?=
 =?us-ascii?Q?qcxLdTL55LQgdlXo3KskH8L+ui3fykOwJ4ZbkFyYgWK00fZAcXBMeM+OVo8X?=
 =?us-ascii?Q?h5SSW2G78wklBWeM8V+uUeCYblFsMRanfovqFiA6+BQ265TDP4mW5DoEVJ8O?=
 =?us-ascii?Q?1oeL53dJybS9jx2fK2EGgPFQj42nf7Pmj3tRaYmu5FPBFe/tp887tgrdtARs?=
 =?us-ascii?Q?jLz1tOwABdSYJLS1ndNGM4FpnmtujFn5wx1rXvWBUHlh0Pzvu8R9v4n8YdfL?=
 =?us-ascii?Q?NxZnGXK0LcGEgmH6asMklwmvbaQdrBwbjSNH5u0/wYCXsUxUR+kXtnu3LT0c?=
 =?us-ascii?Q?vYvvipItfdbbwejHeJh4lakvwmsWhRj7MnDP+pjUPpsVbw/MC/RYWAPGlThO?=
 =?us-ascii?Q?JzfVq01XChDe5wue2LatDWzFVw0YLL4tCvtmmfpoMsEfleBd7CQrh40M/3Qg?=
 =?us-ascii?Q?pxmjdN4hhTxbvD75MuT2OsAS6I2XWtd1Exn1u9DC/IHOYSfEybUsgSIOrCcr?=
 =?us-ascii?Q?C2hOTcatzJTanYVrsHyBc2cRUU9z6fxWGzmMLFhLWvwZXdH0OJOW2PPmTbN+?=
 =?us-ascii?Q?sgySEs8lUCrG63Y+mDoL2le/U1EscAA+A+KiHgWay9NH2zcbA8eXBLLBpLwG?=
 =?us-ascii?Q?qh+7NxpfuqmtZpCfMUEl0NkqzfSGhUQb4YKTlarFJ6QZxWp9StxoXKF5NlM+?=
 =?us-ascii?Q?NSYBqizR15JVcDO0aGWglEFNzcKeq7jt7dcmenD3GulUqZ+yR+da8GTr2uel?=
 =?us-ascii?Q?fIdClf8qOVZ4FfKk/gY8poszqUgrD8CywCZ5wmZar5niPs9238PbA2qsbfkC?=
 =?us-ascii?Q?XFwfhoeOvJF+1+0Qu3FxS8Ca++sWi11X1QTLUpoaM5uUYQTXTsTEdUQeKghq?=
 =?us-ascii?Q?688rGARDfoZIdYeDZcjIbW2Hhizp5TPwBGZWbcs4QPShWTRDL5jcMlM3WsZG?=
 =?us-ascii?Q?uuthXkauFf9VohiWDJvLNMqMLKcfp41Plq8As1SoixXB2nmeGC8/cb2MXwKA?=
 =?us-ascii?Q?n9ZW3F9rHC7VBSVwg6RY+t1gZyqwDEwh/z+Y4URPHSzxY5B0yqoN1c3t7UUM?=
 =?us-ascii?Q?AwYAZRvwlSPVHswN5NXxtoEE2b+C8sRIDAWCHuq528qVgq94hyGAyPfCXN1J?=
 =?us-ascii?Q?6rKYHdnxJpB8S68xzo3Vyv27PM5Ho/Y9drduGYx1YpzIjFUl11s0EI5149MW?=
 =?us-ascii?Q?zvT32kafj60mKPqpDWZnJ1vb1+7aiLWAsUOQbWJOo4fqTbT63SuwFu4wxTi+?=
 =?us-ascii?Q?mGeQS4eppwELE5pyIUPzPrXal8PjhfZL/NFnRWL0wP/M1mPcvyUMVuoaSuSX?=
 =?us-ascii?Q?Yg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e46d5e-d2c8-4c8f-0796-08da6881d9da
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 05:53:34.0736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vGD+PW1QeveWWmLROHYkIK2DXKfQEo4sGIrZhacymAhVJp2ReYYNinPmAGmoc5PNDZ43yMICYSuA0/0/8LvfCR7dsr97x35ChhNvPZMVCGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_225352_395790_C9CEF2B2 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Thanks for the feedback.

> Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add support for SNOR_ID3 macro
> 
> Am 2022-07-15 12:57, schrieb Biju Das:
> > Add SNOR_ID3 macro to get chip info by parsing sfdp.
> 
> This is the same as [1]. I'd expect that patch 2/2 will go in as soon as
> [1] is merged.

> [1] https://lore.kernel.org/linux-mtd/20220715121934.5ZgUHBT77rYsJx0CTx_IWZaI7IBPvFynsy-xSQS8fQY@z/

There are 2 users(siliconkaiser sk25lp128 chip and Renesas Renesas AT25QL128A)
already tested this macro. Hopefully, this macro will get merged to mainline
soon.

Cheers,
Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
