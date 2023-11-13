Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F78C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnUH44HDWPOye6RnGm2RPJqNbX27BkJCjFY/M4BohUw=; b=zeh1Wf1Yz5noWT1GJSM4Io6eSZ
	BuKFiopE5ix9UNA4H1+PlNKoU/qVTVsJRCEjuekDiIcIfBAeSgSJGfpph2OoSyMQgepf//YZwM68G
	CP7kKSRKqo53cLEtY/laoj+9uC28VDSbsXWMI8pnkbcGPF5Wy42lELtlddqJGWp6a+f/qlyt4l745
	qkpVZ52SY3ckr/sxb7vWp7hs4VyBzM0RyizjoMIMjqrPbWChqyawun844oirMMuW2quUvmwBEkkJz
	jIiD7kbkha8E4o58DRkObTAMBz1iGdN8+rtHwJ7QXaP2lqdH+epxFLWnKcBtKxYC+0Tti9i29/I6o
	JyIHEyjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Y46-00E9f6-2z;
	Mon, 13 Nov 2023 14:37:26 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Y43-00E9eh-30
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 14:37:25 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1BCAAA55;
	Mon, 13 Nov 2023 15:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1699886242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+8dl/QTtQ3svpgsSwU7WeNt2SEPuxwkTeAcPXkuccg=;
	b=2Ukov6nd8HGwMPMSkZ2pGU8VAWULJuz40GSQn2tBjQgTUnKArc5+dobnHRcyyZY4pPgZo6
	Oea41jlnXakesU1ZbPLsPfSCWXpySKns497WbI8QQ+H9BsV05jkRk7jUD1D3MuEgGoDUDn
	Rni977D850DhaFhPlcv2BYfJBYps8DLIlLJOSk0DexcotxQ06A/TRImqRDgK1QvJyRovAM
	/gLvTG+kqzh+phBcK11kazHQiVXN61YBC6Syw0BIgNdYAW9VRCJKAzTgluP2ANTfx6opGS
	StwU9obDfWp5W34LjxmpJimRufldXJJY7pUCCeGlcbUG42GD+P99HRgrAMICeA==
MIME-Version: 1.0
Date: Mon, 13 Nov 2023 15:37:21 +0100
From: Michael Walle <michael@walle.cc>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "biju.das.au" <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
In-Reply-To: <TYCPR01MB1126990A40D40D8786CABFAAA86ACA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
 <TYCPR01MB1126990A40D40D8786CABFAAA86ACA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Message-ID: <4c6674a6717152fc1a244d123a2db896@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_063724_139942_0462E3B8 
X-CRM114-Status: GOOD (  35.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Biju,

>> >> >> Thus I was saying, that we probably wont support that and the
>> >> >> easiest fix should be to disable this behavior for the atmel flash
>> >> >> (there was nv setting).
>> >> >
>> >> > The fix up is invoked only for quad mode, I believe it is safe to
>> >> > add fixup for micron flash As it is the one deviating from normal
>> >> > according to you, rather than adding fixup for generic flash like
>> >> > ATMEL flash(Now Renesas flash)
>> >>
>> >> Could you please try setting bit 4 in the Nonvolatile Configuration
>> >> Register (Table 7) and see if the problem goes away?
>> >
>> > You mean, if it works, we need to disable reset for all the boards,
>> > maybe at bootloader level??
>> 
>> Not necessarily. First, just to confirm that it is actually the reset
>> circuit. You can also compare the part numbers of the flash. There is 
>> a
>> flash with IO3/RESET# and IO3/HOLD# (and a flash with a dedicated 
>> reset
>> pin).
>> 
>> If that's the case, it looks like a hardware bug on your board. You 
>> left
>> the reset pin floating. So you'd also not be able to boot from the NOR
>> flash, right?
>> 
>> > OK, I will check that. Currently I have read that register and it is
>> > showing a value Of 0xffbb. I need to do write operation. Before that
>> > how do we recover flash, if something goes wrong during writing for NV
>> > register?
>> 
>> You should always be able to write that register from the bootloader.
>> Maybe also through raw commands (like sspi in uboot).
> 
> Just an update, now clearing bit4 on Micron flash, I am able to test 
> erase/read/write
> Micron flash with IOFV state {3,3,3,3}. Not sure what went wrong 
> previously.
> only thing I changed is related to enabling the QUAD spi mode by 
> disabling bit 2 and 3 on NV register.

This enables QPI mode, that is the command is also expected to be
transferred over the four IO lines. That's not something linux supports.

We'll always send the command in single bit mode (the only exception is
octal DTR mode).

> This again result in boot failure as boot ROM expects extended SPI 
> mode.
> Then restored the extended SPI mode by sending the command FFh (Power 
> Loss and Interface Rescue)
> by booting from eMMC.
> 
> At least one board with micron flash is now working with IOFV state 
> {3,3,3,3}.
> I need to test more boards to confirm the behaviour.

I'm still trying to make sense of this (and trying to figure out
if we need something or not).

So you have a MT25QU512ABB8E12-0SIT, which according to to Figure 4 and
Figure 5 has a dedicated RESET# line and the IO3 is multiplexed with 
HOLD#.
Thus, it seems the flash will go into hold mode if IO3 is not high 
during
command phase. Wether this is a hardware bug? I'd tend to say yes. As 
with
the RESET# you depend on the software/bootROM whatever to set the state 
of
IO3 correctly. But it might depend on the SPI controller used etc. Maybe
it will already drive IO3 high by default?! (and esp. what the bootROM 
is doing
if that SoC is able to load the first stage bootloader from NOR).

I still see two possible fixes here:
(1) Disable HOLD#, either during board production, in your 
bootloader/TFA
     or by introducing a fixup for this flash in linux.
     (And configure your SPI controller to use IOFV state 3,3,3,3 as that
     should be the sane default).
(2) Introduce a mechanism to spi_mem_op to control the unused bits (as
     explained in an earlier reply). Then somehow integrate that into
     the spi-nor micron driver to set IO3 to this pariticular value for
     this operation.

Alternatively, fix your board to have a weak pull-up on IO3 so the IOFV
state 3,3,3,3 will work.

HTH,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
