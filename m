Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27752C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Nov 2023 12:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C17YiAGAojx5nsA98iwClzXbCSHBOvxtKTAdHAqH414=; b=02bl4arblaVGsH
	8DKWSRVxbga3CN5dliDgf30jrp+FAFxXO+fOdiy1iJJ5F4tEpPIoh4xoUp1WofwMENTWurmtX3mZA
	356Fu88+zA9Yws4gthQkkyg4qDVK9mqAv1ROrp0hdMTE81HjHzneSKheWz3cFHRT7G/IR7Fc1VpTv
	9OBjPOi34SZGouFReaCIfTzweONF2DDIMg+UsjVKb98Xn9gvluOgDQOSmsC1yTi3tk2Jvu/XxvR/B
	dwBUiYJguJT6YIOSYHEvtY8NzxsRTSQiHsHPKNBYGzzpS4yQio0OK+DKc15XaENH2bGPQtt2Ewg8W
	Y+9l1GXde1CfHg+R2YIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1n4u-00AsO1-0F;
	Sat, 11 Nov 2023 12:27:08 +0000
Received: from mail-os0jpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:201a::700] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1n4m-00AsHs-08
	for linux-mtd@lists.infradead.org;
	Sat, 11 Nov 2023 12:27:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUYHxwQ3wY1y/unRCnulFb0SPNHucOF1/QKt+nmeh22vBEt3Vjkke0NQ+abiqbmwHzQTmJI13BDxJWgNuKJnZT9gxrg99yUqYrmYkHK4qjFEYEXwrYcUVPBFbxnR0ZR4q0DwcMiEsPtcpu6K0g0pZxx5nMZ7i1tGa3K3SdTKQ4W8yUuC55mPu4dXBGYRVvVBgHZTWJdlAZvHIT97AodsF0G8Cgr2tIcP44b3kijvd04Jj53PzgzEn0xmaCa9ef3Ii2/43hxHMoC9cX8VazqmiGZgSRny2TknCKZxag5BJFMX9LOSTyhUqPZpTBCz6Ls3mEwBw9ypKoQa0O3R6fJ1JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5IX/auqPMiQHWxRrg4aFxHrOngS0jPQyJgiTS2fSgM=;
 b=cu4SLHAUWzVyFyxLJ3LJxU2AcDvTWaNSrbH1ALavTjIQyrWmEHocFM+bqsdT1dpicOyjXLZw0CJTVZsO7ZAs98NjO7Kj+ojnrAPZt4c8NBwAaGEEx0JZbIvNLAHrwU252a8f+CzYD3Oj0Qxtbu2A9MWiKl+0rMLv8pY5HL0MVU8slKl9RLOWfDVVxjCMXvhkBu3I8pcJCk0JR2XxwUfNgQ0Q1jy2k5VGcD3suGhhPgZLyhcH5eM9yUTfFv0VzYB3sGfCXlhfIGcgx5AEyON2YRW57v9wO618z3u2ZjU/puGQLjghY1t2CW6SA7mqMRsODzmRqkM2iZ2pQXEh8SeQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5IX/auqPMiQHWxRrg4aFxHrOngS0jPQyJgiTS2fSgM=;
 b=a1c3kbpsax+E4CZU2gYprk1tSG7f27x+BFXNknvLgRFUW8Hqh4eg8d1bznmVZOalWbrWkYz2VrktC05fu2hxrj/Jbh2jtOlwJ8frUsKgGp4e4ezVuLB3pi9WQXxT3lAqagcrYKofnIfzbFOVlb6J23ns5cYxGMLzpI5ws6oHTJ4=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB8803.jpnprd01.prod.outlook.com
 (2603:1096:400:188::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18; Sat, 11 Nov
 2023 12:26:48 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8%7]) with mapi id 15.20.6977.022; Sat, 11 Nov 2023
 12:26:46 +0000
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
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0IABZ+IAgAAPLfCAAahN4A==
Date: Sat, 11 Nov 2023 12:26:46 +0000
Message-ID: <TYCPR01MB1126988E1A0741B99DB8DE59C86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
 <TYCPR01MB11269C639CB7AA480E388360B86AEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11269C639CB7AA480E388360B86AEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB8803:EE_
x-ms-office365-filtering-correlation-id: 0670daa8-89a3-4dc9-21a5-08dbe2b178d0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uw5skcknpP46WDHhkoa7Ef0qysJjtXsgec9H5xMJDPsx13u7KT2k/ucVup6JLrvSNdBjgs3oesk3oPjAodgn8/bdw40GNcQ4mbyDYmwbtPXVcNiiLVDu3jmurIqq9M0gUul6cWUVrdX0a118jtNXDnOnekAFloeTT6PhVxiBxmH5xd6Hr5af4g4SyjxRnDO0X7DZ0kANTcgLAfmueiuNlK/wN/ySvjRimJZlzDkRjbGYl6b7bIuZfw99OkKAUdm9F+SBGUBIc/3eKtqtWmEnK6TaU1KJ1UzBwOstf1O4P6CCp/ueEruX7PtUP8z3d8FKr5ygom+wKMfw/av7fO2nM30Xta1EPbKu2zCsdT1K2XZt8NvleFsRj7LbjOFzioAF0s/3OQuNDSjV2fKPSAc0Ys7M8LuoNU1RROaFbRlkkVV6uYPDFNRDnhHypMTvZ3qm7AWD8oTntvkeSJFcpshUjJyxre94TiVd/Yo5xptIdgtal1q3Zg0FXaZjW1d2r6UsnHhhekEjaCR27CyJes3aQOWVpeN4QR27nikt77DI53wRScCKEd4mxwHGdt0QS0T2LJxU9S8BT8KRVs4wFGhnFpUSj3aoSsTdmIYWM3yBRqT5I2/vMjHWDUCryOqxd4wd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(55016003)(9686003)(8936002)(52536014)(38070700009)(64756008)(66476007)(66556008)(8676002)(122000001)(66946007)(66446008)(76116006)(6916009)(316002)(54906003)(38100700002)(478600001)(4326008)(86362001)(33656002)(6506007)(7696005)(71200400001)(83380400001)(41300700001)(2906002)(26005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?80DyWKmUegjATZl5Jz/nhUSoywniHeZJUClomlbanpNV9DGyPMa6VqZSaKY1?=
 =?us-ascii?Q?uexex9Ld4y5JpA9e/VTG8sAmDIMBgxh2nx8Uvo2hcxTT9NzMiqeF98bjmImj?=
 =?us-ascii?Q?iyPj7UanYlyP9VnnxHOKadUnx6FEEFW/4lOWwmzwwFkgZCi1ShN0GfNDnUfW?=
 =?us-ascii?Q?NIV8jFFxpsf4p0zOG3BLwuVOdhvcjLFNvKtNuNDjcH0S8rDgwKJSkBcZk1M5?=
 =?us-ascii?Q?QnqaHceDQZnKa2pLZdd4fl1OANbGO1Mp7somkBa5yghCV11HmIW8dLrhck55?=
 =?us-ascii?Q?fTF5d0u7hEDEfrd3b0ac68iAs9OuSdyXYCjmndYWJCT3o4VpHjja6VoqaOg2?=
 =?us-ascii?Q?GsIAVDO/OTlB/m+QOA1vJ3jmnuTx80FdnuDw6NBCtj0tKTRuQj29nr4/Fjak?=
 =?us-ascii?Q?6H0oTaYOO7aXoxpy8uG+WCrYhdcPnoLRNoWxFYV6uGR7AxiS20l4O5/1ByF1?=
 =?us-ascii?Q?aVQQPlURJM79JyajVbdSmiBijjE6uXP/Q2l4Fk9gX7dnSIqeosfEoiuY6nDi?=
 =?us-ascii?Q?tdn82KbAJhNjPGNMkY/RAEoGsDcQQF/eBpfNbDxV29VidET0OJt8wcPPI96A?=
 =?us-ascii?Q?z4wSD2dpvfo4OxAnXwas4XnbFH8TuxCrdi6M1/P8xqkitKcJ/+96vU/DmgFC?=
 =?us-ascii?Q?1jImOYSGy/BpKNTmBBxu/sFKOiUiHKyhqRY0YPzsJFhQo78pvGc/os8DHQan?=
 =?us-ascii?Q?q3g1s7i2oRDpRG939q0B4UPtglEf9NW+AjwTjqZvxCt/nQaKwGlhZsRoKuP3?=
 =?us-ascii?Q?P4YYyQMtQEbilT4VEBeNmuocerBCJORnaovmPYO7l92FcFW+phzqyhSfSv3c?=
 =?us-ascii?Q?2DDS3Gz/05eZTjL7/4UM4WcBcUXx516WUIZr0exVxF1ZBBQXyTvrV+ittPGx?=
 =?us-ascii?Q?sQAm13V8tjGoUQIloDrwMpfpf3B5vQgsRBJ/CNFmk4dfDXFOAjuA4n/p0gWv?=
 =?us-ascii?Q?IpECAdVgnmSU9PfHI6iPE1RpmYz/Pyo1jJcs0dDmfHaNF4CSmc/omyrUCAtz?=
 =?us-ascii?Q?i2c2fdgr+foqvmXiXm+reedC2OmjJX1CjDqcO4UWoWcdwxGeNnL24XmsTHyf?=
 =?us-ascii?Q?fmlGBrWHcw//zxIYZaxdJ1UNwKdCxVRjUtAoQjNKgTK4StU4nde7rGPnvApk?=
 =?us-ascii?Q?A1F2cdjvw25oBVRNRSY+aYt2/lnVeDkX7CDkoqMwQN+ZA8rJu1YlcNIpMhS0?=
 =?us-ascii?Q?oqEF9H6p4yWEzWJCIWiRANS0KAZStHmRn/IZEbh7AKxcMIT2ko3UhLnhH4rh?=
 =?us-ascii?Q?zcuzKSfJT8MnYjxs6FK6Xy6i4NmhiUBdINqfBRmDSFpHenqLIoEjBTak/gym?=
 =?us-ascii?Q?CWMbPU12Ltg3tJ9LYZMQ8U00TMJ8DuNTiHIytmMvwYzuI0/Ekrw6oP54xmcy?=
 =?us-ascii?Q?SCvQQfE64HChxyUTPR4DsiQ9zKPW0DfPiy57qpXjkZEgC1HK4C33uwj2duv2?=
 =?us-ascii?Q?sKW9L+uumVM+cPzBrgzruPx7GgXEYejwykk3gGOBJ6Jx35aFS+pFmpUkxyBB?=
 =?us-ascii?Q?kDTTPa//DH5OymQ6HNLP3I/wwn0OvaLDa+/3+FWh/SIoB7tNbelDDCG03yc2?=
 =?us-ascii?Q?MXS9ZyrqjaWyoRMG5+s2SpohFSP+tXGLRWnfkImjCYsLWBF9ts4/AdjXxVzm?=
 =?us-ascii?Q?cA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0670daa8-89a3-4dc9-21a5-08dbe2b178d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2023 12:26:46.6550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /4IGUw7FKwskTS6f8+e0IyWhxhsK4GwEs1S8CmSEyHlyovurIVpkWKtzlN9Ye/POinkPbCUhXyFqTn6NPXNAL/RJfXiqIgbMAWCN6JvnBOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8803
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_042700_594127_B99A97DC 
X-CRM114-Status: GOOD (  35.53  )
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

> Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
> 
 
> 
> > Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> >
> > Hi Biju,
> >
> > >> >> Thus I was saying, that we probably wont support that and the
> > >> >> easiest fix should be to disable this behavior for the atmel
> > >> >> flash (there was nv setting).
> > >> >
> > >> > The fix up is invoked only for quad mode, I believe it is safe to
> > >> > add fixup for micron flash As it is the one deviating from normal
> > >> > according to you, rather than adding fixup for generic flash like
> > >> > ATMEL flash(Now Renesas flash)
> > >>
> > >> Could you please try setting bit 4 in the Nonvolatile Configuration
> > >> Register (Table 7) and see if the problem goes away?
> > >
> > > You mean, if it works, we need to disable reset for all the boards,
> > > maybe at bootloader level??
> >
> > Not necessarily. First, just to confirm that it is actually the reset
> > circuit. You can also compare the part numbers of the flash. There is
> > a flash with IO3/RESET# and IO3/HOLD# (and a flash with a dedicated
> > reset pin).
> 
> Part is MT25QU512ABB8E12-0SIT, As per the schematic, flash has a dedicated
> RESET# with 10K pullup connected to SoC QSPI_RESET pin.
> 
> DQ0, DQ1, W#/DQ2 and DQ3 lines on the flash are connected without any
> pullups to the SoC QSPI0_{0..3} pins.
> 
> >
> > If that's the case, it looks like a hardware bug on your board. You
> > left the reset pin floating. So you'd also not be able to boot from
> > the NOR flash, right?
> 
> I am booting from NOR flash. BootRom code reads SPI flash and executes
> BL2.
> BL2 loads BL33 and U-boot from NOR flash. If this is the case, do you
> think it is a Hw bug on the board?
> 
> >
> > > OK, I will check that. Currently I have read that register and it is
> > > showing a value Of 0xffbb. I need to do write operation. Before that
> > > how do we recover flash, if something goes wrong during writing for
> > > NV register?
> >
> > You should always be able to write that register from the bootloader.
> > Maybe also through raw commands (like sspi in uboot).
> 
> Thanks for the pointer, I haven't explored the uboot path.

I have disabled RESET# bit in the Nonvolatile Configuration
Register (Table 7) and borad doesn't boot any more.

By default that bit is set.

[    2.530291] ###### Before write Read cmd=b5 val=ff
[    2.530431] ###### write cmd=b1 val=ef
[    2.535518] ###### Read cmd=b5 val=ef


NOTICE:  BL2: Built : 14:59:28, Nov 10 2023
ERROR:   BL2: Failed to load image id 3 (-2)
NOTICE:  BL2: v2.9(release):v2.5/rzg2l-1.00-3883-gc314a391c
NOTICE:  BL2: Built : 14:59:28, Nov 10 2023
ERROR:   BL2: Failed to load image id 3 (-2)
NOTICE:  BL2: v2.9(release):v2.5/rzg2l-1.00-3883-gc314a391c

What is your thoughts on this? How do we proceed now?


Cheers,
Biju


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
