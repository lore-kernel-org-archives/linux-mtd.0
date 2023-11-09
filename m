Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0CD9C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 18:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDdmlkSRHjopZS7c0SQ1igzdqL4ZZUZFujjnvuNG6+I=; b=2hb2Wm6KXPFh9C
	4nqI52l5h9TxDTAs1J/cWIQAF3RKFb+QePSGV//gtiDeCVS8uWCSTWbLqm+OHGBscYDazRhn3+jRr
	KryotlSLeUzOeyAiGDhWDpUjI4WtEzRDyOraNluwcKoNbZdPuoHF8NB8O6nNS1lxUlfJ+WQUOBGJI
	uqcHIR9M4Hs+S1+RP9asl9ouTqNnbZ9I5hzHOVkBdAtsnk1fzKRdoUJa66gOYligOjwggRm2LYcEE
	90ck2sDnru5AU0A6j1no3FY1HsNA76uspfyXjGPAXEbG+77vpxN0Ipbkg4fgY+yxtklzaKY+q/OUV
	pS0BeNQIGtlsz05k55Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r19MH-006zqX-0x;
	Thu, 09 Nov 2023 18:02:25 +0000
Received: from mail-os0jpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:201a::700] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r19MD-006zpx-04
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 18:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eRXrp7zI4U+0mxDpOF7jpIml5ULegPmTG/ZsU6BmHZ69ev628rzTyPirS96b0WwxZw93r2Cp41uGEmmm2hYzr9f46ifUFRAHX85fULi4iDIlDeoZ4ptX7i2iZdJv9J9vc3XBKlixiwcHJ8RKHY0LKwZaMFxe+2e255ZgFcoxh5ISE09paeL/oof+G7x87vrfXVEogVQ7mYu8+v4v94l/mmCuj8IOTPsmjSaEZLR+OzXTBwxbLaBwIVoOP7hywhwIqgohBrmeN76FpS5R97HHm8IYk/DbJki+X9OiZAjWMP1JoIeseRBhkWzZUMy1aX1RcEjhrWCE73MyQ9kamzeg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CANw8+JPOG2VoBMwVt1JN0aV8CkeqSzfsE0NvfQC7dg=;
 b=U3UGVoLD9LUsUismAXv8eZBw+jPY/ZZJTSfoAFQmXm52SUGyC5zKC9BCI3M6RnAdqInvfMhACC1/hXADNqjgsqo9yNGXyOdkugK5CGhL+ntwSTRtVU8mhOK6RGWEUZ+xcgWWjhsht/Kk0EVlEG323qvjSFGU+g0ZNqfSFtmM+ehpMDs1+m79XCl1LmEbAu2oLtZugxoSjzivsYAiVq6XsetNlaQ7lgbXxW8FoX38ntdMD2mQYqfpIImuo77Lrpu1ON9Oev76zzZS1RM176HifpfoWkaKUqSnHUmr+fdNz93oMHkYuFHgoDOOclqkSXXaIlMePdbhZCdYHwYU2satiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CANw8+JPOG2VoBMwVt1JN0aV8CkeqSzfsE0NvfQC7dg=;
 b=gy5H6Lbn5HYTjeGLkDTTfV1WKpMWOLVhCDV5lM4CEA63quDtQ+pm6nXhXmQzjJLgXa5c10vw85ipwW8wgYJNBzb24SPM3OymbtJ23cNfafxSbQjYK8GWmTTSC4vjU4TMcQb3RyVimRHCgRUczDVEaH8SV03PrcQVmWYIHI1VMzw=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB8535.jpnprd01.prod.outlook.com
 (2603:1096:400:13a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Thu, 9 Nov
 2023 18:02:12 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8%7]) with mapi id 15.20.6977.019; Thu, 9 Nov 2023
 18:02:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Topic: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0A==
Date: Thu, 9 Nov 2023 18:02:08 +0000
Message-ID: <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
In-Reply-To: <f88759f98e865e68da5481fcbb969c47@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB8535:EE_
x-ms-office365-filtering-correlation-id: ccae51d6-a3cf-47a2-8cac-08dbe14dfd8a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I6GMIxUmG7qHI8yJ3ufVZPaq/BB4Pl3ZssOfhoXF/BAgkuz9TXldTBFYAo/lGSDRNv5BsLdMR4FGeGK7HrRyntcevMRmdRi5vHCJeOaoGLHwk9yBKQPjyXU8arddsiPo0F8L/C2wMxnGvlXryg7kQ1DpMa1wVtO5j4ckkPUW51kkfVH9CxdxJohGGcUiUHF5QB9nsY6+8l1bhFuC13gS/BTDU38CJCwCgq7+FSep0mrstFOJR1epfRzVI+vOG17VpQdgmdSWvLJvWYAY7ITbV9AWyngfLeWEUAVpapkriBsjkBnzWd+2kFtVCOMs2h4ks5ATPrz2fkhC/Cytgo4RObYpfPzCrsl4wJxURHQkMMLGj52YSkgy/pf4Fn7RnvavNMbBZlAR+VANe7jRlsuCABJOcFIkBeQSS/bIj3GOtyk40Qsfr9M9OB/8O1ibTSetMDuXqxdrrXGohoSvvtI7IUKI9tGrSPPMSgvwiocZxUCy1KIK3QcaYsd2rHkFHsV4zrtj+IaM8r4CfBKTnr9kPI6u7f4h/wlkdpQotiFRbSTJxeyk1+MdUwYj0Ib79PC4k5oy3kVAHWZPZ+Vua8vmECaaRSNpMVo0lPRfRDU3b8c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(346002)(39860400002)(366004)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(41300700001)(38100700002)(122000001)(38070700009)(86362001)(66946007)(76116006)(83380400001)(64756008)(54906003)(66476007)(66556008)(66446008)(6916009)(5660300002)(55016003)(316002)(7696005)(6506007)(52536014)(9686003)(8936002)(71200400001)(8676002)(4326008)(33656002)(26005)(2906002)(478600001)(966005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L/Az6h4L3r7TEZVZ6Fe3z54Hpj9xCRtCk87uqW20MAAOP3AgdnZShbiRtTto?=
 =?us-ascii?Q?RK2IO/M/V/Mauc08+6HbxiUDorRGesvzTGf581sXv2PwxlVIOAxQ7YW5oVFW?=
 =?us-ascii?Q?UoB8cSpS8SQ6nhtNDv4lta5pnPmdBb50DWd3Gr/uwIQVjFHHrpo5Q7mJWY7+?=
 =?us-ascii?Q?5w4jQaPGXFkTqZfKQqa3ICbKppMWAOSSWblS0IzJHqd88mVXxCb0tlOrcQYC?=
 =?us-ascii?Q?yDP/FiT680m4+W0ThSoVaqi6IA9APYTfPZ3i/AiojMTjKdxMX4DBIVxOi/U6?=
 =?us-ascii?Q?L5Y8rO2q/nUGB7hZJOwhOTfLlTSJbyYdgs1/OWu5VmXJ4x9F5uLL/qo7vNqu?=
 =?us-ascii?Q?W2xM2RxkVh0y19MkAWohM5pX8GJQtfUeONQZX/e9nsP0M6ASEDiywN+A3NZz?=
 =?us-ascii?Q?u+rT9+oIKyBGPSWxRxlSIZiqb/SmD00xb/bkjRSLdH4XtJZLKFPVmYNjcDj1?=
 =?us-ascii?Q?IRkP2oNfMf1vhLV4W2xg0yVYQyjBQQ4Ot62VdvXVJc3ypEpRZ+/trKk57Esj?=
 =?us-ascii?Q?4fybGYYyD1zDGkzfMAwEdp1wM5tc+EGPkxVeZ8dbKrjs6p8EFiEHTIgxaXd0?=
 =?us-ascii?Q?BKup5DxZrhVfNTl/hMilZ4eTVmFtIz7rxNWTln7Bh1xWFwvG7WLAcLRfVSMN?=
 =?us-ascii?Q?UzG6BtghJUEvTbo7fBvnmMsl4jMUHal+Id8jyAdhPCAwNwHyh4ztBTqaA9m+?=
 =?us-ascii?Q?/lSCtUSwM6PtPNXgd5mNwGAhlDb6BZC7Tbe+YlkjK8wPYLjevDYgbsQb0dDT?=
 =?us-ascii?Q?gUDL3ohIiX3a8Gu2giHTuCY+bFrdMrEIw+xGSUSo8xoavmJPDU5cCV3nVcG6?=
 =?us-ascii?Q?JO7AMBrdYd2LqhrF0gJtAoFdNh0z8brcLEj1JkJ02jyqWDxMDdKoyVxfvHSc?=
 =?us-ascii?Q?0tviYvN32GO3cYcYWZGsCDCKbeYOLdV2QhFLbBVcHuMMYjzOv7VUQL861WVk?=
 =?us-ascii?Q?HFK4SLL7GVZ3zhs63pcloRKp7+4ZDRKVmDAsa+ySmuLBnEkUMaHPV2gNk78C?=
 =?us-ascii?Q?Uft7mheKztGaD71P+bNiwbFK1iIycbEQbjQQKMbckbKwkTmb8cDNfJsd9uX6?=
 =?us-ascii?Q?1Z2ohUbIFUZw88x9SfM95RGr+xRLf6al4LJwhDktAy/uLO02+8FovsacW5VB?=
 =?us-ascii?Q?BQT9TRRlnbvdFRIztbIyaKKSxKCRr+aj+smTQPHONBIo2eKA/e35pUFNnILv?=
 =?us-ascii?Q?Y7JIEhlMECEx3t/dwxFyqySnt/IbmA6drmiIXNXZEtaQh+SnphBrw5ZtLQkM?=
 =?us-ascii?Q?VSVupsXYkbaU7DTj5BB6YR+4PNTiz3+RYPaOgiqhq15S7hNMUS+hpCps2mn0?=
 =?us-ascii?Q?V1uImEnRQZvgd9fxXbSXr/Q8OSx1KScPjiLNblDDLHDpNGa+7TYrWOMov+Fj?=
 =?us-ascii?Q?jYwoO0OPDvF6YFi6AMre3Q//aKMR93aNpoAYD+Fw2hPButdXCa78c/RlVk/X?=
 =?us-ascii?Q?pQheJu3Ks7NiaF/vAjRfd4zKjhDi6mMXoQ3v192JjOZ85X7Kg3UHFIqdQOEc?=
 =?us-ascii?Q?1rNoygSJIC6o6WcvDYi3WA5PXNqpSZFaQsyGPp4ZGvWvATzBvD6A5mb6mG49?=
 =?us-ascii?Q?qqYX6cbtJFOfDSJBh1JM+fGSKqrSIESjgvjxTkhZIYxN6kZmUD6V9pfC4wlK?=
 =?us-ascii?Q?3w=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccae51d6-a3cf-47a2-8cac-08dbe14dfd8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 18:02:08.5427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5DMRmpb7wDMz78preYSnJoF42URzT6l+OYjY1KOBj+cYWlCPMadY7254ZYA2W83s6/jYk8/jsYOz7sC9RVUXKau++y7sCbnFqV9rdGgLa4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_100222_039685_25C2262D 
X-CRM114-Status: GOOD (  55.53  )
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

Hi Michael Walle,

> Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> 
> Hi Biju,
> 
> >> >> > As per section 8.14 on the AT25QL128A hardware manual[1],
> >> >> > IO0..IO3 must be set to Hi-Z state for this flash for fast read
> >> >> > quad IO.
> >> >> > Snippet from HW manual section 8.14:
> >> >> > The upper nibble of the Mode(M7-4) controls the length of the
> >> >> > next FAST Read Quad IO instruction through the inclusion or
> >> >> > exclusion of the first byte instruction code. The lower nibble
> >> >> > bits of the
> >> >> > Mode(M3-0) are don't care. However, the IO pins must be
> >> >> > high-impedance before the falling edge of the first data out
> clock.
> >> >>
> >> >> I'm still not sure what you are trying to fix here. For any quad
> >> >> I/O mode, the pins of the controller must be in hiZ during the
> >> >> data phase on a read operation. Otherwise the flash couldn't send
> >> >> any data, there would be two drivers for one signal. So being in
> >> >> hiZ state should be the default and shouldn't depend on any
> connected flash.
> >> >
> >> > OK, I will make hiZ state as the default.
> >>
> >> I still think this iofv setting is the wrong approach, though. Do you
> >> have a link to the spi controller datasheet where I can look up what
> >> the controller is doing.
> >
> > Please find the below link.
> >
> > https://www.renesas.com/eu/en/products/microcontrollers-microprocessor
> > s/rz-mpus/rzg2l-general-purpose-microprocessors-dual-core-arm-cortex-a
> > 55-12-ghz-cpus-and-single-core-arm-cortex-m33#overview
> 
> Thanks.
> 
> >> This seem to be a general problem with what we are sending during the
> >> command phase and I'm curious why there wasn't more reports on non
> >> working micron flashes for now.
> >
> > 1-bit mode, we don't have any issue. Once we switch to 4-bit mode we
> > have this issue with micron MT25QU512A flash and we need to set the
> > correct IO fixed values.
> >
> > Maybe others are testing with 1-bit mode and not testing the full
> > capability of the flash.
> >
> >>
> >> >> You've mentioned the micron flash which needs a '1' on its
> >> >> hold/reset pin.
> >> >> I would have expected a fixup for this flash, not for the flash
> >> >> which behaves normal.
> >> >
> >> > I will drop fixup for Renesas AT25QL128A  and will add fixup for
> >> > micron flash.
> >>
> >> btw, what will happen if you always use the {3,3,3,1} setting? I
> >> guess the atmel flash will also work? because HiZ should mean "don't
> >> care"
> >> from
> >> the point of view of the flash.
> >
> > With atmel flash if use {3,3,3,1} setting, I get below error.
> >
> > root@smarc-rzg2ul:/cip-test-scripts# ./rpcif_t_001.sh [  144.078854]
> > spi-nor spi1.0: spi-nor-generic (16384 Kbytes) [  144.120468] 2
> > fixed-partitions partitions found on MTD device spi1.0 [  144.126982]
> > Creating 2 MTD partitions on "spi1.0":
> > [  144.133004] 0x000000000000-0x000000200000 : "boot"
> > [  144.141879] 0x000000200000-0x000001000000 : "user"
> > [  358.476963] jffs2: notice: (230) read_dnode: node CRC failed on
> > dnode at 0xdfe084: read 0x336ebbbc, calculated 0x961503c7 [
> > 358.488509] jffs2: notice: (230) read_dnode: node CRC failed on dnode
> > at 0xdfd118: read 0xff6a5df6, calculated 0x786a5df6 [  358.502963]
> > jffs2: notice: (230) read_dnode: node CRC failed on dnode at 0xdfa2d4:
> > read 0x1fc99948, calculated 0xbab22133 [  358.515357] jffs2: notice:
> > (230) read_dnode: node CRC failed on dnode at 0xdf9368: read
> > 0xffd184a7, calculated 0x3d184a7 [  358.528175] jffs2: notice: (230)
> > read_dnode: node CRC failed on dnode at 0xdf6524: read 0x5deb2462,
> > calculated 0xf8909c19
> 
> Strange. Can't make any sense of this at the moment.
> 
> >> > With iofv settings {3,3,3,3} (all pins on Hi-Z state) with Micron
> >> > flash
> >> > -------------------------------------------------------------------
> >> > ---
> >> > -
> >> >
> >> > ./rpcif_t_001.sh
> >> > [   37.950986] spi-nor spi1.0: unrecognized JEDEC id bytes: ff ff ff
> ff
> >> > ff ff
> >>
> >> As mentioned earlier, I suspect that HiZ on IO3 means low and the
> >> flash will be in reset. Could you perhaps verify that by probing IO3?
> >> I know that other flashes will *either* support RESET#/HOLD# or quad
> >> mode.


> >> Thus I was saying, that we probably wont support that and the easiest
> >> fix should be to disable this behavior for the atmel flash (there was
> >> nv setting).
> >
> > The fix up is invoked only for quad mode, I believe it is safe to add
> > fixup for micron flash As it is the one deviating from normal
> > according to you, rather than adding fixup for generic flash like
> > ATMEL flash(Now Renesas flash)
> 
> Could you please try setting bit 4 in the Nonvolatile Configuration
> Register (Table 7) and see if the problem goes away?

You mean, if it works, we need to disable reset for all the boards, maybe at bootloader level??

OK, I will check that. Currently I have read that register and it is showing a value
Of 0xffbb. I need to do write operation. Before that how do we recover flash, if
something goes wrong during writing for NV register?


> 
> Also could you have a look at the schematics, does the IO3/RESET# have a
> pull-up? If not, who is in control of driving the correct value here? If
> it has a pull-up, I'm puzzled why you need any other setting than HiZ.

Unfortunately, there is no pullup on IO3 line and also there is no SoC pullup.

> 
> The correct fix would be to the information about the missing IO state in
> the "struct spi_mem_op". That is, what should be the default values of all
> the IO lines which are unused. For example if we have a 1s1s4s
> transaction, what should be the state of IO0,
> IO2 and IO3 during the command and address phase. If we have a 1s2s2s,
> what should be the state of IO0 during the command phase etc.
> 
> That can then be used within your driver to set the corresponding IOFV
> values (for each spi-mem op).
> 
> But I'm not sure if other SPI controllers will support that, though.

Currently driving SoC IOFV register, it fixes the issue and it is just one time
operation during post sfdp. I take this as a SoC feature which other controllers
don't have.

Cheers,
Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
