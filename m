Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742F4C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362EF611CC
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 15:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 362EF611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r3STMWsbJYUsNTjiHPayYOZVZudLm0XIYQcqxYTDcg=; b=YwYyS1PkPWh8HZ
	OzucIfgWcR9bEOwCeTs3QI88mkqV1gMNyFrLe3i1uSuXm3wta+bNDWo6K+lSB/HvZMrNSSpAHdL2e
	PvN9FsJ2nL8z7O7jowywEyzlQ871XSOMR7S1FBJf/sY7jbU4loa8cdCb3GQLIHCA7HIw+VVwz6RHp
	qIq3B6wwh5322BhDQyc7pijyo1657xw43ZpTx9KXbihBPiOiJZ8HkcJ684GpM4Xc8ra1PvUhVyGO2
	iY6SyorbJlH4bCwv6BYSpLpoXIHVC5owt86O5Wq4Sn16sNhOYx5n+vUxQoZrSPnM+aYg6vv3auXSX
	o7k8/Al9PdXOqGoioFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo5SJ-00AnXS-8O; Fri, 19 Nov 2021 15:05:35 +0000
Received: from mail-tycjpn01on20726.outbound.protection.outlook.com
 ([2a01:111:f403:7010::726]
 helo=JPN01-TYC-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo5Rv-00AnMG-Ez; Fri, 19 Nov 2021 15:05:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwHyKzgRwQYFTIWWZ/Blg7MSAvu2da31HmwsRvggAcPma0wr+ifYqZc9DI0bPiug1a1+zPZF1WDfrLynuR8H2mkBoRFJUvW5ozh63tPK6q79/fZ1OSOuI7B1vFL/obGlMdR9hD5krwaRHcdpZ4ti0eLBI4SIuuyhD93XE/9AFsS09NVd840PTYuL1SRrpXDRKJXCx4opU3CEv0hW16djSKy9jiRUofaGNkpXYkVetICVM5bFV1k6/rbH8bFbp/oQuRTHRf4/8kZfoYNp8JGmlZkOWbTPm36foSt75Ck9mh1lOac9n8LaQ3aAtXfzJId7Agx1nXM4iV5NO1NO0hrqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTVAQUaY3tZblCZv96gz995SQbGkEw30EXoaJswagyE=;
 b=TV/YwJW70Yrdle+VquRQyH/ezX79MNY8GGrwG8RsxDmwuv/bhhMPC0vUrrANdL10OAFzU40nNRNhUVgUB6Y1jQWmLFGHh+gaQIGvNWoxWl2O2UwKMuKTDj6R9SR6166FrjJrweZ5OpLaE+FssmFAjfi1Ix6puOANos92Rc20nGSC7gbDwf66X0ueI3AbbRuRm8pjsU9FaMdF+XbTxecwd6Z+0QxownWSWuF0aQb0L6C2u6ry14Ki9tLNmFHSaltZBC/QsGL9CNifdITzFYz87MejzLGR12lH/usc6mfLF7wteP3wdQJprXXfJUmNej39IW0414k4G8OtVeiEdbQ+cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aTVAQUaY3tZblCZv96gz995SQbGkEw30EXoaJswagyE=;
 b=QlEdYUylWrIVpRDGwE4/mv/aXfH3F9aaPQdgPxypqWfLD1/L9sQ5cJrg96jjiQ/pd9iaHqHDiPuBiGu/k5P+YzRHGBG/0PzsoJv1bI2eJWoU2C9aX8dERjSmlIuokgCcN77/kxZ1mQfImBtZbMkUQ5NxjCLDRf2M7ZOli8d88H8=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYAPR01MB5166.jpnprd01.prod.outlook.com (2603:1096:404:11f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Fri, 19 Nov
 2021 15:04:55 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e1e8:35f0:8843:b976]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e1e8:35f0:8843:b976%5]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 15:04:55 +0000
From: Phil Edworthy <phil.edworthy@renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Michael Walle
 <michael@walle.cc>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jimmy Lalande
 <jimmy.lalande@se.com>, Milan Stevanovic <milan.stevanovic@se.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Gareth Williams
 <gareth.williams.jx@renesas.com>
Subject: RE: [PATCH 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Thread-Topic: [PATCH 2/3] mtd: rawnand: rzn1: Add new NAND controller driver
Thread-Index: AQHX3HvpkQ/eoVtQfkG//uGbZ3EeT6wKpiwQ
Date: Fri, 19 Nov 2021 15:04:55 +0000
Message-ID: <TYYPR01MB7086AF009C6D6A4440B0CB21F59C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-3-miquel.raynal@bootlin.com>
In-Reply-To: <20211118111940.1275351-3-miquel.raynal@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9569d9aa-24b0-4830-1e5e-08d9ab6df229
x-ms-traffictypediagnostic: TYAPR01MB5166:
x-microsoft-antispam-prvs: <TYAPR01MB516670AC331A3986715ACB7AF59C9@TYAPR01MB5166.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FhH9AiMIVmC5ca7jlNxFgULylcu7CDdtwr66aMb+sQuh44cW9qxmIiL3IOuvX1gr9eIp6y93la0C23hV5ThG+STIXWD/1UtT+zm/svWkH1gs01QW+asyj+AOmU/JpBL91gMXM92qd1MUA5vEU4eHTyMDiF7085qRpSw6Yg4oInBa19CTrj0BKHsSSk33s5PKvKa/RnmZ8QONkfp5byy5/CyaKfAwFCIbk9hlAKrfPcwfBwOMCrU+PpKjGmRiJQ4jy3zAOVy/xfMSS1ksD6wRM5kiVzLeIpzjJfsz2zkbPSXnui7SoANgCNMlE2W3C5vUiFPpX/+TeaNjW0U493vT2FpsNgkaczCoNV4yoJazH3k+ADPBbzITeiU4bSjM4X5d/STC2VwO4TH9nUtFVVjFfPf2gN6vvHhXGJeuZIDa52Bp6ZYWHF33xnTF9iyMfrrHQWXBYPIUy0+81IEAwGrcZtd0XWPBWw9WiDvB33B0yd4hfslfuL0wdrbMwFDPlOhVOj3Iad7cwfBJ6sldqdF0fbBqT60VklVlTRm0SfpyWvyrE6QHStT7Q3B/+nkaqPdSyFgMPfauIs7dTH+1Z4ki5GANJpGUAmZYdP9/yv9CcW/3cpP4ad2hJ+muYi+qBoUcqL+IiawgBndYdgKXBwQOrq4fMgcOk32S6x95nuhFH+tOG6AaPaaormqTAoCxSzfizJURQ8ycYmot9JtdmdmEQS+OItNgLmlODlrb77a+e0t3yEi7rCGHWkyrCGakuIR9rOIyi0/hDh9IbeFQH1yzorkLnZD2Vio/OzpuEqAGtBk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYYPR01MB7086.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(966005)(122000001)(26005)(44832011)(33656002)(508600001)(9686003)(186003)(7696005)(316002)(8676002)(4326008)(110136005)(54906003)(38100700002)(66446008)(71200400001)(2906002)(5660300002)(76116006)(66476007)(38070700005)(66556008)(64756008)(66946007)(107886003)(55016002)(52536014)(6506007)(86362001)(83380400001)(55236004)(7416002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1hNUmxNclRhcG5TckExNjllWkx6UDFWQVVoNmZtdzZlcVlTNVV6TnlWeEdC?=
 =?utf-8?B?UHAzcjBwZXpYdU9TVTI1NEM0T2E5R3VFWnFQRHlzNXB1dDRiZ2F0RU11dFFD?=
 =?utf-8?B?K1VJbFJuMUQxSXZMTE8xRTlGZVhUSGM2NVVUdlJnSDUxYTYrM2lkYUpxUzBC?=
 =?utf-8?B?NzgxWHhrVEtPdGNIQlFVRk9pU3RFYWw0cHFjY3FaSFJ2R25jNGVuZ09CSmRl?=
 =?utf-8?B?T0FCNGxRbnhmdGNLcWZoTGZMa3lRV2VKR1BwVkR4QjU2dE8vbngxdkFBVW5P?=
 =?utf-8?B?U1FXOTE1MjU2MUNPRXNTMlJFQ3d5ZThjb3YzZG0wMGdRT0xvM3FmeFpPZVkv?=
 =?utf-8?B?MnQwTkN5V25MUkgvOW9PWnl0Y1JYbUdSMGlDcU9yYWl1M1RkL1ZXaGxmV3Ba?=
 =?utf-8?B?NEsyeHo4SXBPK09oUUc4cmF4ZFNFYnRsVzgrVmc2R0RHY3QzRXBPemFFTzlo?=
 =?utf-8?B?L0h4WWI2NVcyNmZDSnZzbEg4MHg4Z1ZKaTBNUFV1QUp4Y2Y0U21YWE1FYkQv?=
 =?utf-8?B?WHMyY2xGNFN3aFEySVI4VG9YMjBrbmRoWG1UTUZJYStUREJUM1ZpT05Xa292?=
 =?utf-8?B?bnJVamt5RVpRd29SamhuOUozQitiUWU3bHZuckwyODFPYk1iaUJiMmxBbTlx?=
 =?utf-8?B?amgwNGhkbUFoak9tUzBsRENkcm53WXlxbS9Demg2REVSUWRGMVJGMzBSTTdP?=
 =?utf-8?B?aS9kelBRajQ4OEVmV1I3QzYrOWpmWGVNVVJGMlBBQk9UV1MwWlVrR2lUQWtj?=
 =?utf-8?B?V01HTzJUeklzTzViYURwNjVpYk5ER3Y2WjhickF0cEMvOVF2Uld4b0dLMFcy?=
 =?utf-8?B?ekUzL0FPZXVVNXBkOFlrdUM4Rld4ejlOUFlYSVduc2RqdlRNOG01OTgxdk9N?=
 =?utf-8?B?NzZBcGFBNjR6c2w1Mi9UN0FrWnpoWE9UekNFdUZxNjk5aTJkQnR1S2NRb0dN?=
 =?utf-8?B?MnJDbnArUkx4ckpIRjFZeU1rSmFZdlU4UCtUb0lQU3NpRHY0anVkWHB1M1Zn?=
 =?utf-8?B?UFdVMHlXQTVHMURQc0UyMlVLNXRkaDljd1J3VGUwQUdSSXRSUjZjRENPVGhv?=
 =?utf-8?B?NHdlSzJLS3VFMWVjLzRJRWx4bmhFa1JjalNxZ0NpMDJVVFp1eUh3L3MyMytP?=
 =?utf-8?B?UE9vTFlaUVdaMW9sYjhTZS95V2VKVVZobVVwVkFjdnc1Yk1hcHdiU1IwOXNs?=
 =?utf-8?B?ZlNUL0V4SWlRZy9sRDgrN2FYTityWnQyTDl1SDljRFN6TDZTUG1XL2paalJ0?=
 =?utf-8?B?eEhzY2x1dXN1ZmdmdUxUbkU1MW0ralczU1JobHhLRXRudkRGQ00xd2ZaNm9X?=
 =?utf-8?B?c1hWN0FJSjdrY0RWc3dvUWFNRlRpamJBbEVwMVJsMGYzWnE2Zjh0cnNUN0Zt?=
 =?utf-8?B?ZWxhc3J5bmRMalljeUp2aDJCeUkzTno5WDVpTTBkcGM4aHpSK2RKL2cxbjQw?=
 =?utf-8?B?S0pwT0ZSRVA5T3NBZ01uWnlwVFZEOXRXTmQwVDV3NGpPL1M1WUtleWcyNFh4?=
 =?utf-8?B?Zit5M243cnB5aUJZTkJHQTg5QW82RThNUFAvTmtxZGVXNk8wMnU5bmlzYkM1?=
 =?utf-8?B?UmcrT2ZVZXJNcXVnQ2FUQnBrOEZFN0ZvVjYyQnBFNzc0dXB5RGdSYUNQQytE?=
 =?utf-8?B?WDFxTUk3WWNpL3UvM0RqWnRJbEp6QitqSmwvRDJ2cVFwOWRvakFFYjJJWU5v?=
 =?utf-8?B?NlE3SWdPS0VQWkwxUnlQU09TL00yRmxFNTQxc09YV3J0VUFaZVNaV08yalYv?=
 =?utf-8?B?eXpwWklSbEZpaEU1SWJIZ2lnd3pWSldpL0dIUzV1S2hnYlNBeEJWVEZ6VFZW?=
 =?utf-8?B?b3J5M0dKSUtwemJ0emZzVVEzUWFiRHg2R0ZpMklmZlhRNngzUUorejhScmF5?=
 =?utf-8?B?eC9GMzlyTlpQdVRET292UjlBT1dTTXF3YkF0dWp6UjRSeWtqdC9KUEFJODg0?=
 =?utf-8?B?UnRUcUJnM3h1b3Vpc3VNdDBTVlZjY3F0dndpUmd2bk1WRUVTRFkwVFh6OWJt?=
 =?utf-8?B?MjNnNlhRbnhaNU9hSnRUd1dWZmlwU042dFJrd01pZW5oeGdSTzRMRUowai8x?=
 =?utf-8?B?eUt5NjdjQUgrd0ZKM3JvZng1dUhjZkZ0M09QdkZGSnpBLzM3OXFCSFF3a0w0?=
 =?utf-8?B?THhpYm54S1BjQ29vMWp0RnJRL3Y1SFRhenlYS3c2dE1GNjFNTzNqRW4wTW9a?=
 =?utf-8?B?VW9Lcis1R0ZtU3ZQbEx3Y3Q4YVNnV24wMXRVb01NR0Npa3ozTEoyV25DSEJw?=
 =?utf-8?B?LzViUkJSWTF0SGt4MWtueHJJV29RPT0=?=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9569d9aa-24b0-4830-1e5e-08d9ab6df229
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 15:04:55.0857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTMKxAIjl2FitYsLjrbW/oxllC6VnF8eqfuJn12PfUCjdRNCLz6ZqSA2kArhSRr1MPc9Vub7fzuICfEaiSu+PujOwxa9Q6v+OuURSkKF/rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_070511_628465_35947994 
X-CRM114-Status: GOOD (  19.66  )
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

Hi Miquel,

Thanks for your patches.

> Introduce Renesas RZ/N1x NAND controller driver which supports:
> - All ONFI timing modes
> - Different configurations of its internal ECC controller
> - On-die (not tested) and software ECC support
> - Several chips (not tested)
> - Subpage accesses
> - DMA and PIO
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
It might be worth mentioning that this controller was originally provided
by Evatronix, then Cadence bought the Evatronix IP business.


> +	rzn1_nand->tim_gen_seq2 =
> +		TIM_GEN_SEQ2_D8(TO_CYCLES64(sdr->tRR_min + sdr->tREA_max,
> period_ns)) |
> +		TIM_GEN_SEQ2_D9(TO_CYCLES64(sdr->tRR_min, period_ns)) |
> +		TIM_GEN_SEQ2_D10(TO_CYCLES64(cle - cyc, period_ns)) |
> +		TIM_GEN_SEQ2_D11(TO_CYCLES64(bef_dly, period_ns));
In our out-of-tree driver for this controller [1], we allowed time for
the signal to propagate through the RZ/N1 io buffers; We just added 5ns
to all the timings. Don't you need to do something similar? I vaguely
recall that some values programmed to 0 caused issues.


> +static int rzn1_nand_chip_init(struct rzn1_nfc *nfc, struct device_node
...
> +	for (i = 0; i < nsels; i++) {
> +		ret = of_property_read_u32_index(np, "reg", i, &cs);
> +		if (ret) {
> +			dev_err(nfc->dev, "Incomplete reg property (%d)\n",
> +				ret);
> +			return ret;
> +		}
Check cs is <= nr of bits in assigned_cs.


> +static int rzn1_nfc_probe(struct platform_device *pdev) {
...
> +	nfc->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nfc->regs))
> +		return PTR_ERR(nfc->regs);
> +
> +	rzn1_nfc_dis_interrupts(nfc);
You need to enable the clock before writing to the registers.


> +static struct platform_driver rzn1_nfc_driver = {
> +	.driver = {
> +		.name   = "renesas-nfc",
nit: whitespace

btw, there was an attempt to upstream a driver for this IP a few years back, see [2]

Thanks
Phil

[1] https://github.com/renesas-rz/rzn1_linux/blob/rzn1-stable-v4.19/drivers/mtd/nand/raw/evatronix_nand.c
[2] https://patchwork.ozlabs.org/patch/629096/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
