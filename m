Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F07C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Nov 2022 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ruzmhoqSNzuxgEHR+iWePniEPGyQPfSUNFP6z5bobNY=; b=Qbl60CVCsFLIsO
	Xf5icitzM0jWiXDVTj9OmN3Q4HU8TbSyLrtHhDPf+ZbxBBu4mEDIzrP66QcW4vsxTEOSid8Wgd/bm
	Sjz7cA6I4k5pI5GeszNbwwMI2fofCxxr9ikppPKeRcUZEYdbLTFDpceUF3IoClI7dkutjUHYWjB4j
	jM5Pz/XI4MPStc7Cvdr1oIrDHugb+RWS+/5N1eJcAAyAwHGYpictQhI9T8388+uI93DR/27zCnEcG
	EqbtKJxiDD9led2NIJwGT2LsiVe8E+yIcoc2+SI0j5Q6sajwkQ+64PctSTqLPRigLKioWTBLF6C5N
	r7uf/nS4G+nyip+w80Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0P6X-00HViN-3Z; Wed, 30 Nov 2022 15:34:33 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0P6S-00HVdw-ST
	for linux-mtd@lists.infradead.org; Wed, 30 Nov 2022 15:34:31 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id g137so2307963vke.10
        for <linux-mtd@lists.infradead.org>; Wed, 30 Nov 2022 07:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B6d/iWzYGAGrxbwbQu++ABvd3IEVdQtyiviqRk/znho=;
        b=CtcaW6dhXEO6z9CJteMLmpaIT8GyOTkM7xSJysoMf1I7UI+sparjWu5oAEsaOro3tE
         2Ts+x+tGnxnkzYcWz9AwY5rFmW/YCycVL/0QCjJDeTqo5ZR+1jZmnHBSPsNCQBTpbgAr
         g9oxAOmVLncvKvZmozVOPiUV/5+0bDvIbBVQwm5zdNduM4cE1reSXh3wYRricTzq303w
         UW1Bz4Wjkea/hLUSHatVzDcu4kCGnMqbXSOiY7wHIcSQKYgq+tLizrhMw875GGkICQn0
         rX2t5e15UPgtjb0WM0P5tXVFgyZE0Xudx81wLRwi/vlL0E9bsVumZLKBiJnUny+kbPsU
         G/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6d/iWzYGAGrxbwbQu++ABvd3IEVdQtyiviqRk/znho=;
        b=JxWdI1u+HbPtz0bdfiQVRoH3oCQrtqBnOPYxe2cNAH6VXrAQBxybWcvIlqRJiq1x3W
         IGjjQ+qH+iQxa4V6EN172fIJzrwiJQqYMdefr6d/TIS2hp/IBI8eJAlAPUhXmKYJ9/YD
         PdNi8fr4gJExl4nI29KR/JkPw6j/8a8hS0E2aKyFlQSGo2al2D08yk++A3/xKRtyNfvN
         xHqkg4mBfeboOA6Hr7PQw3MeAV9qN2KGNaKKrboK6H1p4PxiGYWBOvpKa3ELIIEN85Zg
         B+ciOn4efQsx5auff8CTXlT7i3LTwaLgoRsP+EIFdgihl4WiPTsLXTZT7kqM7lamZARc
         tDAg==
X-Gm-Message-State: ANoB5pkuS/OXtvpcHXZ12uLEp7uFf/7oOsa6oRgMbhHTkxRSJcf143CH
	gGunbfy1//r80XO2l9311i9c5uhSYLmXiUqc1bTfGw==
X-Google-Smtp-Source: AA0mqf6WWRdXupeKBJGnyxPXONok++GwDVrm0L7M+Npoui2ua8Tj3R8tYJM0Q+9pZux1ZD08mwY/05IqBHhu4K8AoPE=
X-Received: by 2002:a1f:a98c:0:b0:3b6:275f:34c6 with SMTP id
 s134-20020a1fa98c000000b003b6275f34c6mr25747193vke.5.1669822465726; Wed, 30
 Nov 2022 07:34:25 -0800 (PST)
MIME-Version: 1.0
References: <20221128172455.159787-1-nathan.morrison@timesys.com> <2acae3be377a5d8c3df66f860d944dbb@walle.cc>
In-Reply-To: <2acae3be377a5d8c3df66f860d944dbb@walle.cc>
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Date: Wed, 30 Nov 2022 10:34:15 -0500
Message-ID: <CAPE2wM0LZRX2SXmntNFo25zOwYtZ7NQS+G=5VgeeW-iON4UN2g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: issi: Add in support for IS25LX256 chip,
 operating in 1S-1S-8S mode.
To: Michael Walle <michael@walle.cc>
Cc: greg.malysa@timesys.com, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_073429_196723_99D8441C 
X-CRM114-Status: GOOD (  24.60  )
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

> Does this flash have SFDP data? If possible, this should be
> derived from that. Could you dump the SFDP table and
> post it here [1].

# hexdump sfdp
0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
0000010 0084 0201 0080 ff00 ffff ffff ffff ffff
0000020 ffff ffff ffff ffff ffff ffff ffff ffff
0000030 20e5 ff8a ffff 0fff 0000 0000 0000 0000
0000040 fffe ffff ffff ff00 ffff 0000 200c d811
0000050 520f ff00 2224 00a9 8e8b d103 01ac 3827
0000060 757a 757a bdfb 5cd5 0000 ff70 b081 2238
0000070 ffff ffff ffff ffff ffff ffff ffff ffff
0000080 0e43 ffff dc21 ff5c

Looking at the latest SFDP document from
https://www.jedec.org/standards-documents/docs/jesd216b, I see
1s-1s-8s would be in BFPT DWORD 17, which appears to be 0xffffffff if
I'm reading this hexdump correctly.

> why?

This was because ISSI's default_init was setting a quad_enable
function pointer which is not relevant to this part.  This probably
doesn't need to be done though, as SPI_NOR_QUAD_* isn't being set in
the flash_info table and therefore quad_enable will never be used?

Sincerely,
Nathan


On Wed, Nov 30, 2022 at 3:45 AM Michael Walle <michael@walle.cc> wrote:
>
> Am 2022-11-28 18:24, schrieb Nathan Barrett-Morrison:
> > Adds the is25lx256 entry to the nor_parts table along with the
> > additional
> > fixup logic to operate in 1S-1S-8S mode while programming.
> >
> > Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> > ---
> >  drivers/mtd/spi-nor/issi.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> > index 89a66a19d754..e9b32b726bf3 100644
> > --- a/drivers/mtd/spi-nor/issi.c
> > +++ b/drivers/mtd/spi-nor/issi.c
> > @@ -29,6 +29,21 @@ static const struct spi_nor_fixups is25lp256_fixups
> > = {
> >       .post_bfpt = is25lp256_post_bfpt_fixups,
> >  };
> >
> > +static void is25lx256_post_sfdp_fixup(struct spi_nor *nor)
> > +{
> > +     /* Fixup page program command to 1S-1S-8S */
> > +     nor->params->hwcaps.mask |= SNOR_HWCAPS_PP_1_1_8;
> > +     spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP_1_1_8],
> > +                             SPINOR_OP_PP_1_1_8, SNOR_PROTO_1_1_8);
>
> Does this flash have SFDP data? If possible, this should be
> derived from that. Could you dump the SFDP table and
> post it here [1].
>
> > +
> > +     /* Disable quad_enable */
> > +     nor->params->quad_enable = NULL;
>
> why?
>
> > +}
> > +
> > +static struct spi_nor_fixups is25lx256_fixups = {
> > +     .post_sfdp = is25lx256_post_sfdp_fixup,
> > +};
> > +
> >  static void pm25lv_nor_late_init(struct spi_nor *nor)
> >  {
> >       struct spi_nor_erase_map *map = &nor->params->erase_map;
> > @@ -74,6 +89,10 @@ static const struct flash_info issi_nor_parts[] = {
> >               NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
> >               FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> >               .fixups = &is25lp256_fixups },
> > +     { "is25lx256",  INFO(0x9d5a19, 0, 128 * 1024, 256)
> > +             NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ)
> > +             FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
> > +             .fixups = &is25lx256_fixups },
> >
> >       /* PMC */
> >       { "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
>
> -michael
>
> [1]
> https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
