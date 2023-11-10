Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBD8C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Nov 2023 11:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCSwIcX9cJ1RjSfgHsLZHCehSv5/u47O2tgev25YuFI=; b=nfcKG4l/WAQc7p
	l09ywd5uXNbIjht74y7O5K9DCS6eJC8Kj1/ismld2GY/BLXYntyPseJQ9KTrtf4xqHPJ8XqVE/Mpw
	ZADV4s2l+Yw0RMX4PkzeTRFvHh9D2crjPs0iD3lYE7ggpzjloKdsjlFzfPmf91TeyG5KZIBFtDOYS
	T1FupWlstsRP2ZNFp6EkaSklfzNY7WqSwU33vfm7rMFZjLbmGXVupG6/MiU2Jnh0o9Z+toPyfkM/W
	01PcD3S/3WSVRMskAmAXZyXLdA7JrXstFqg6JuCEatMj1n3CGO+7kcfDsJlpU4o8VwgB32ksAnhCS
	QWcB8ehZboGJh1+RRszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Pnf-008PyX-0Z;
	Fri, 10 Nov 2023 11:35:47 +0000
Received: from mail-os0jpn01on20701.outbound.protection.outlook.com ([2a01:111:f403:201a::701] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1Pna-008Pwe-2J
	for linux-mtd@lists.infradead.org;
	Fri, 10 Nov 2023 11:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6JMWzggWMYoLi6hNwfRuHs1wDrhbAxyWdsMnsv8ooq7A3P34qDXgmbv/dvB5mtlqreqsr3P6pmDb8G2M3d+qzS7OuWERbDAsA+j+de4E0X/kkn4XK0mc625D2DlWt8aLHq2Q8X3VunpWYeAa8+oDI7crVc4k9FSB0mhDPFnOerbzja/gR7XAQXlrDoC+BSfFoI4AJi1G+S4Us29sMRqajIgctSZY9f/+MmjBNtE9YtyRhMxdlqAj22Ywsn3bs5W3fBHB7mvzFltDvqdKzStv0iPw9mKxIYw6Ke5ibmoO7Fj1SqvlI3C5rvxMdzPQ25m8A+MAesED3DCkqdOg4Pm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFWqC+qtPbqmi8MSgFYF4ZaxhL0iBJP380r72pyc1HY=;
 b=SLzZBus6S+BbzDq6h4ukBaR/qF2gBw3axBkrfKA5Ai2i/8CLlAau8KFV7479TU6IQ0vcg9yzkuV+Pig0Eot3dwyUXxu7bwsQvCtJ1ED5xc3NMI0BnN8qxBxiFoWq9w+hjbPrDN+32+bZ/zcOy2opbH+rd99b1ZbRPLWMkKHcSnp/hYV4iOnD0DkZmV4A+yIw+O/2SGWuKKXcWTkaQE+qAL0D+IgSS2NFR4lD2A9AiATsLl9TnFA2MQkNvj6wHfHB+ufxtASdfj6qRVztB6nMHKuM+EGzZcZRcaYSCPzHfD4OQqcqCdUwvzsoVG+IVmVMxUoUaAnEEfCsSQpjGfLA+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFWqC+qtPbqmi8MSgFYF4ZaxhL0iBJP380r72pyc1HY=;
 b=LTK6Qu/gIvNyL2Wd8mYp88LoTblvFVFKgYEgoFyfuHrXE7+k7gZTO5yOCRUAEhhqaSB5bACEXGVn5o5pjTHuJOwoOcH3k4GMHy8Yl8Aeij7opcZ4T6hmMvl/CPsbvN84LfIzhJkWGd0fWNojqk8eFj90GlbbdiYy1cg3EkX9hDM=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB9438.jpnprd01.prod.outlook.com
 (2603:1096:400:1a4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.21; Fri, 10 Nov
 2023 11:35:28 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8%7]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 11:35:25 +0000
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
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0IABZ+IAgAAPLfA=
Date: Fri, 10 Nov 2023 11:35:25 +0000
Message-ID: <TYCPR01MB11269C639CB7AA480E388360B86AEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
In-Reply-To: <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB9438:EE_
x-ms-office365-filtering-correlation-id: 249dedd7-d6e8-4650-d753-08dbe1e121a3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bicnzxL3Fd2pGBlevfW0Q/AFZVmCM0QQQnbFrxFmroUQDKYYvRaogJCK7fVimYf9uRoY6+Wb4bVaJYphWopniuj2NoXXh1eC73TlhMLHQ5jXsRHb8EXkRv6b1a8kHmRrrEc5Jt6z/2oNASft2AdFIBB8QyqweXdsdwveh+D4VHnGwNwMVSrmiyk74w7fUuy23QmjgYrgO9Gl99oH2ovmo68AGAXDvdhj+2FhuMeD5QZUvk5AV+Rfk1ymhBFxZDDEnGEUU73I+l9IkAV3M5KNpjqkjXJhp8M8Ipp5vNBj+dUkNAUGa5rCfohnk45SevLG5N8uIjMiTUHiY7KuBHEUzBSnUB1d8l+sg1tSWI9JTMDaJX3vngcdK02JAfy9RfFQUOnl5PLyVjERirSWCaQAPfotXpJGS4D3hjb/DVpFC4R2KsvNIUR3SeNSzIgzIemZepKOXUOwtEBneCy9kVEddam6vz0wJUAhi7SDl1Ex4DL6LRnNRQMIdBVCym0nVOU6+DKvjd4QSwiI0BTa8Lpe17IXy4bSLsyUm4KSfjdXQFVnAhafQ3x5u92WsqF7SP5OVumsm6oiDvpiUIUrr8vGOUW9xwBiM4NX38Ffxd7DB3864jQG7rzPMU34nV1GCze9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(2906002)(83380400001)(71200400001)(38070700009)(38100700002)(86362001)(122000001)(478600001)(316002)(6916009)(41300700001)(76116006)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(33656002)(4326008)(8936002)(8676002)(52536014)(55016003)(9686003)(7696005)(6506007)(5660300002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?78tc6jSm6JvTsk+LqFfhAlkY5OaFa7E/l/bPiJAH6A5yL1FL6yI0iM/tHSFO?=
 =?us-ascii?Q?VUcE0SCFbzxKJpI/SmPKGaPQlP9yJJRV8ErevAl99mn0z0oa8scgGsXYVmjk?=
 =?us-ascii?Q?Z2hYgBqUuTG+U8mxkMmObxAnJzJcmnN6iiltwVTMSS8/GB3HUOW/DWpp+qeO?=
 =?us-ascii?Q?UXvBKfghPAp65xPLYMiuTUwGLugkwE8l1laAtq9OWDqIC5ytVvqJq3ANhDmf?=
 =?us-ascii?Q?vvDrk0y9eCl5nSn4SjYHDW4Cuo3OUqzUc7Cx2VwH1kolH6JLVR+4CwYITxl9?=
 =?us-ascii?Q?HT1LxeT51MOE2LBDJjIDOhZ24IRH9FYSv4/rlYXr4rEcehwcUtO7YYPl4kde?=
 =?us-ascii?Q?+M3YSRVLLlbOZVZMLZ59zm84gjthCRN2J8b/SiDD7Roh3SKgd0YMvJz6gwBp?=
 =?us-ascii?Q?nxl4eV8x15lOT4i6MOnSaDrH/xc6tAAeblejZkPSmsvBIRl1j+6lnpLjOL0Q?=
 =?us-ascii?Q?NSHey35JDeSmo2r2g2cneQT4BPQG7wYc5cNgNx7ke4gys3IoSrYP0H1GMk+U?=
 =?us-ascii?Q?zPCotY/fwszZxkti6yin7cqyMm8YsyAx5aygrIRoog6ioIUp/yBWrbuNB3Us?=
 =?us-ascii?Q?T+GcDnjLbF2gC57my0DhrNR+kcUZvWz9WVnWGaQOuOAtGqQvGqczuK3aUHjf?=
 =?us-ascii?Q?D7Ea9x7hmHRolKM5ze8cxJDokXKrJTwWFXdPG73dNzehC+VIL8Fagd1/UK4i?=
 =?us-ascii?Q?cACkv7BCZU2AWjKFncLajVD3I+yz04oU1q0I83RAlAtNi8Fqf5151xAd57J/?=
 =?us-ascii?Q?qQTbOqOgTyJZgrTjv4NhO1I71P4UnqyMYV9UiwAvHWCmSreaDk98SEoTaycz?=
 =?us-ascii?Q?L5ue5qbJL6dajLDQWH6qTm1w6E3GnVOKirAYzEHJTCuEiIFDs2w/s+NxP+za?=
 =?us-ascii?Q?xuUyVtHIYEVLkZkCM26Lzol4jt3YMqjNxAZBejdjRnmteT5Cw0ZgcNP/CNSQ?=
 =?us-ascii?Q?uNDY23xjKfDTmJug3RIegGVhwHJxfHGDGmz2G4FhIElaAtD0SCgC3B2OzcMq?=
 =?us-ascii?Q?nbrtSS2vyCwY+JGpobCSYx35th7D6MUM39WMXOrG0nf6a6bJdPX/XHXUbizN?=
 =?us-ascii?Q?eojlWnT7mRxi8LDfGCmUe6Hjud9fdgb0yNxIAOTYNnTXoUTCxYQLZMYGLHoF?=
 =?us-ascii?Q?AS9ETBZhErlrOH3SJ9Lc67npQ9w1dRCd+zGu9Hf9zvDWllsZ7i3GJHoTIcEn?=
 =?us-ascii?Q?pPfxrngEL3a0pKTWaWbdk6quDf0nlv3Su3Z8vumCZshk/SPOr/Nzx9eNv7Q7?=
 =?us-ascii?Q?YvDzfrmV6kVZ0hv3JfHbyoAii7Btn3N/qNTO0ow23uTqhg3JuKNMn7QwD3TJ?=
 =?us-ascii?Q?VHV+UeA+nUgIIvlhCdopEUkCbJrKypDN3NEJKnPILkeKaRRRC/0BrU3d4OaT?=
 =?us-ascii?Q?/A4ApF7Fmmrcmj+cloHMIxW0R9CAqYFABv29d4oqF5d9MdKdH+e3BooIkTHq?=
 =?us-ascii?Q?7LBZEKz1NwM7l6IrLDRawnnO5iItNlcax+7w4SRhwyRXMvtleo0ZVaTNbY/9?=
 =?us-ascii?Q?Dw3sDMHB7WLGndp85QQiCbigccU33BUDleMtAPAm21nIaohPuxJZmKAR5vFV?=
 =?us-ascii?Q?F6eTRoEDjxgR9TtLWrHZgrOyZm9MdPjDnzik4mT53Y1JGScbHbwpVrtX5L72?=
 =?us-ascii?Q?FQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249dedd7-d6e8-4650-d753-08dbe1e121a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 11:35:25.1076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CJo6hfRJOHv/Ye1kWrfrl8BeWiwHphATNov/miIQSFd4zw/Ij11tSGcedHWHZmuxRM9M0Ntk0VqJzizcTatYKG4zQ5FVw6VHGuCIixJm9os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9438
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_033543_871801_8FEAA2A1 
X-CRM114-Status: GOOD (  38.90  )
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

Thanks for the feedback.


> Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> 
> Hi Biju,
> 
> >> >> Thus I was saying, that we probably wont support that and the
> >> >> easiest fix should be to disable this behavior for the atmel flash
> >> >> (there was nv setting).
> >> >
> >> > The fix up is invoked only for quad mode, I believe it is safe to
> >> > add fixup for micron flash As it is the one deviating from normal
> >> > according to you, rather than adding fixup for generic flash like
> >> > ATMEL flash(Now Renesas flash)
> >>
> >> Could you please try setting bit 4 in the Nonvolatile Configuration
> >> Register (Table 7) and see if the problem goes away?
> >
> > You mean, if it works, we need to disable reset for all the boards,
> > maybe at bootloader level??
> 
> Not necessarily. First, just to confirm that it is actually the reset
> circuit. You can also compare the part numbers of the flash. There is a
> flash with IO3/RESET# and IO3/HOLD# (and a flash with a dedicated reset
> pin).

Part is MT25QU512ABB8E12-0SIT, As per the schematic, flash has a dedicated RESET# with 10K pullup
connected to SoC QSPI_RESET pin.

DQ0, DQ1, W#/DQ2 and DQ3 lines on the flash are connected without any pullups to the SoC QSPI0_{0..3} pins.

> 
> If that's the case, it looks like a hardware bug on your board. You left
> the reset pin floating. So you'd also not be able to boot from the NOR
> flash, right?

I am booting from NOR flash. BootRom code reads SPI flash and executes BL2.
BL2 loads BL33 and U-boot from NOR flash. If this is the case, do you think it is a
Hw bug on the board?

> 
> > OK, I will check that. Currently I have read that register and it is
> > showing a value Of 0xffbb. I need to do write operation. Before that
> > how do we recover flash, if something goes wrong during writing for NV
> > register?
> 
> You should always be able to write that register from the bootloader.
> Maybe also through raw commands (like sspi in uboot).

Thanks for the pointer, I haven't explored the uboot path.

Currently I have added the code for reading and writing NV register in Linux. But looks like
Write is not working as expected. Looks like there is no API for non-volatile write in linux?


+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -12,6 +12,8 @@
 #define USE_FSR                BIT(0)
 
 #define SPINOR_OP_RDFSR                0x70    /* Read flag status register */
+#define SPINOR_OP_RDNV         0xB5    /* Read NV register */
+#define SPINOR_OP_WRNV         0xB1    /* Write NV register */
 #define SPINOR_OP_CLFSR                0x50    /* Clear flag status register */
 #define SPINOR_OP_MT_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
 #define SPINOR_OP_MT_RD_ANY_REG        0x85    /* Read volatile register */
@@ -41,6 +43,19 @@
                   SPI_MEM_OP_NO_DUMMY,                                 \
                   SPI_MEM_OP_DATA_IN(1, buf, 0))
 
+#define MICRON_ST_RD_NV_OP(buf)                                                \
+       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDNV, 0),                   \
+                  SPI_MEM_OP_NO_ADDR,                                  \
+                  SPI_MEM_OP_NO_DUMMY,                                 \
+                  SPI_MEM_OP_DATA_IN(2, buf, 0))
+
+#define MICRON_ST_WR_NV_OP(naddr, addr, ndata, buf)            \
+       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRNV, 0),           \
+                  SPI_MEM_OP_ADDR(naddr, addr, 0),                     \
+                  SPI_MEM_OP_NO_DUMMY,                                 \
+                  SPI_MEM_OP_DATA_OUT(2, buf, 0))
+
+
 #define MICRON_ST_CLFSR_OP                                             \
        SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_CLFSR, 0),                  \
                   SPI_MEM_OP_NO_ADDR,                                  \

static int mt25qu512a_post_sfdp_fixup(struct spi_nor *nor)
{
        if (nor->spimem) {
               struct spi_device *spi = nor->spimem->spi;
               u8 addr_mode_nbytes = nor->params->addr_mode_nbytes;
		   u8 *fsr = nor->bouncebuf;
               int ret;
               struct spi_mem_op op;

               op = (struct spi_mem_op) MICRON_ST_RD_NV_OP(fsr);
               spi_nor_read_any_reg(nor, &op, nor->reg_proto);
               pr_err("######%x/%x",*fsr,*(fsr+1));

		    fsr[0] = 0xef;
		    fsr[1] = 0xff;
                op = (struct spi_mem_op)
                       MICRON_ST_WR_NV_OP(addr_mode_nbytes,
                                                  SPINOR_OP_WRNV, 2, fsr);
              ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);

              pr_err("######%x/%x/%d",*fsr,*(fsr+1),ret);
 
               op = (struct spi_mem_op) MICRON_ST_RD_NV_OP(fsr);
               spi_nor_read_any_reg(nor, &op, nor->reg_proto);
               pr_err("######%x/%x",*fsr,*(fsr+1));
        }
 
        return 0;
}

Cheers,
Biju

> 
> >> Also could you have a look at the schematics, does the IO3/RESET#
> >> have a pull-up? If not, who is in control of driving the correct
> >> value here?
> >> If
> >> it has a pull-up, I'm puzzled why you need any other setting than HiZ.
> >
> > Unfortunately, there is no pullup on IO3 line and also there is no SoC
> > pullup.
> 
> See above.
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
