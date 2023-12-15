Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B051C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 07:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iyopU5E77OEX7wUI4EsLGIjnBctKnJhSyudTpBgvpo=; b=JpiAekIs/5Y1ey
	2AQGEsg6o62oi4R94PNRkVtvi6tw6qSy/2RDu/kMvcigy5yCOP41M14MnIc0SxRkhiZWT8wg27sQw
	j+ikDvs9fxQl2hv2EyaC7+HFkwtyZKoyQJf21kp7ZKuEP93dPUrLe8mtayd9ImNrYG8yOGxBK185q
	1hVyU9nrromSIa1Uv0eiM05tQCJFp0HO3A8mNBHAdNJlvo0YIUfWvGfaQfw1vX9zdism8cgrRIoTK
	zcty5KM7oYI1SR2GSWrOpOgYTj8Dwoufx5RzSCsSUztPf3/ej1auZ7vZV1mfCWo1gzS2GUWkYbRIo
	cDZzWwNp8V10zrkbGWFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2c9-002Hgs-0x;
	Fri, 15 Dec 2023 07:28:05 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2c5-002Hem-0z
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 07:28:03 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3ba2dc0f6b7so342980b6e.2
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 23:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702625278; x=1703230078; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b9GVk8V/9tW1AJGBo6+Re7iPX4wo/87gyZtA/Cx8RSg=;
        b=VoEK1o/e260/5+32wXmCnfcs4O+fU20GFofGDkfqwDEiyAr2N5Cbkk3p5sbv7IJNrX
         tmz9Dbvd0EmM7qA9L050PDE4ryVD5iF3IsHGMWEdxjyBB3biui2h5oXHMNiJQai7xgam
         qHKF98MTMshpQ7T834RbAcmnAWUELY1mtLbuSTa7IwEq1hLPlhxj+HApX/yJkN/6nM2H
         XiysSfGmjFTwzod2xBE0sj9gdQT5TR7/1gvxy7589uAr3PupquDCNShLsYwAZJT/7kgV
         ThqatIZpC7t+xL8aS1epOs/GhaQPjyKNak7ueluJEKQREWg44Jm+pjB2eWdQknFipDST
         6vSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702625278; x=1703230078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b9GVk8V/9tW1AJGBo6+Re7iPX4wo/87gyZtA/Cx8RSg=;
        b=A0QFpT6IBVnL6EW9oP3a38ltGMoPq/QZ4jVhSpOVrpG/8KYqSa5e2ErtBA6kyPKi+e
         GJjLTixq+GTu4vhJ8PkVOh9Ifzz38Ak+VesYx6wII5Ouo7rWHeFPd+R/I+uJvZ06LMw7
         IqIQSv6+CCcYKiq/XJ9yxKGwOdq5ea0vYRatCHIGwDA96kQ7xIk8e+zCoZiUv4X7xizr
         2dkHxTC4JBNrB9lT63udoMEtvNUTZyjroxjON1T72TigQ1LxmdHhH3M7t61TbsZEjlvZ
         3snB0KqHX/StRF9QwgZM2ZEnnXlcaRsy36Ca7fqdKQhpI2tbrofA2r1HU8GI+hWNWmMt
         wU2A==
X-Gm-Message-State: AOJu0YwxVlHwZPs6zoAtcb4IwnimmL0r0WjNbKulJLVWnRH2DOJKUMI+
	1qE7c5xAlpjIYZDNecXCJ1Z5qFbnqD2v/mG8YG4=
X-Google-Smtp-Source: AGHT+IG79XWcqCJk3ENEw0cxopMW8lP1tyTc0iWS+S+ahwZH28YQYoGE6gQyAHIcwZ3HtzjTORB/N6xrNg6djeb+e/I=
X-Received: by 2002:a05:6808:2f05:b0:3ba:f7:ce3a with SMTP id
 gu5-20020a0568082f0500b003ba00f7ce3amr14942946oib.107.1702625278001; Thu, 14
 Dec 2023 23:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com> <a55b1338-d15c-4d1c-8b81-0d7a3913ec0a@linaro.org>
 <CAAQoYRmCpYJNSZrriM1SbJvXGUjz=e8k8pRnB2cb-y4C=pHe8Q@mail.gmail.com> <4ee2ec06-f582-4cfa-aad4-d25e95c2ac23@linaro.org>
In-Reply-To: <4ee2ec06-f582-4cfa-aad4-d25e95c2ac23@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 15 Dec 2023 15:27:37 +0800
Message-ID: <CAAQoYRntxOEpMqME6Hq-rFdiwSXXKMe0P4XEW-Od5E5vtKqHpw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_232801_341688_7F951AC2 
X-CRM114-Status: GOOD (  27.58  )
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

Hi Tudor

>
>
>
> On 15.12.2023 08:59, liao jaime wrote:
> > Hi Tudor
> >
>
> Hi!
> >
> >>
> >> Hi, Jaime,
> >>
> >> Please update the commit subject to indicate that you parse 4BAIT as well.
> > Got it.
> >
> >>
> >> On 14.12.2023 09:33, Jaime Liao wrote:
> >>> From: JaimeLiao <jaimeliao@mxic.com.tw>
> >>>
> >>> BFPT 17th DWORD contains the informations about 1-1-8,
> >>
> >> Please run checkpatch on further submissions:
> >> ./scripts/checkpatch.pl --strict 000*
> >> WARNING: 'informations' may be misspelled - perhaps 'information'?
> >> #6:
> >> BFPT 17th DWORD contains the informations about 1-1-8,
> >>                              ^^^^^^^^^^^^
> >>
> >> total: 0 errors, 1 warnings, 0 checks, 46 lines checked
> >>
> >>
> >>> Parse BFPT 17 DWORD instruction to determine
> >>> whether flash support 1-1-8, and set its dummy cycle
> >>> accordingly.
> >>>
> >>> Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> >>> ---
> >>>  drivers/mtd/spi-nor/sfdp.c | 13 ++++++++++++-
> >>>  drivers/mtd/spi-nor/sfdp.h |  3 +++
> >>>  2 files changed, 15 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> >>> index b3b11dfed789..c55f39978762 100644
> >>> --- a/drivers/mtd/spi-nor/sfdp.c
> >>> +++ b/drivers/mtd/spi-nor/sfdp.c
> >>> @@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >>>       u32 dword;
> >>>       u16 half;
> >>>       u8 erase_mask;
> >>> +     u8 dummy, opcode;
> >>>
> >>>       /* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
> >>>       if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> >>> @@ -525,7 +526,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >>>       for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
> >>>               const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
> >>>               u32 erasesize;
> >>> -             u8 opcode;
> >>>
> >>>               half = bfpt.dwords[er->dword] >> er->shift;
> >>>               erasesize = half & 0xff;
> >>> @@ -631,6 +631,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >>>       if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
> >>>               return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
> >>>
> >>> +     /* Parse 1-1-8 read instruction */
> >>> +     opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
> >>> +     if (opcode) {
> >>> +             dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, bfpt.dwords[SFDP_DWORD(17)]);
> >>> +             nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> >>> +             spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
> >>> +                                       0, dummy, opcode,
> >>> +                                       SNOR_PROTO_1_1_8);
> >>> +     }
> >>
> >> You missed the mode clocks. You missed to parse 1-8-8. Please check how
> >> the read settings are parsed and set in parse_bfpt() and do the same
> >> here. See:
> >> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/drivers/mtd/spi-nor/sfdp.c?h=spi-nor/next#n502
> > Macronix Flash didn't support 1-8-8 feature.
> > So that I have no sample for validate it.
>
> don't worry, add it anyway. Specify in the commit message that you
> validated just 1-1-8.
Got it.

>
> > About read setting in parse_bfpt(), that is a good way for scan and
> > set for each protocol.
> > But 1-1-8 support judgement is not a single bit.
>
> oh the horror. And then it becomes a single bit judgement in bfpt dword
> 21. Nice consistency :).
As I know JESD216F BFPT 21th dowrd includes information about 1s-4d-4d and etc.
I didn't get it.

>
> > 1-1-8 read instruction could determine wether 1-1-8 support or not.
>
> Right. Then introduce a dedicated logic for these 2.
OK.

>
> >
> >>
> >>> +
> >>>       /* 8D-8D-8D command extension. */
> >>>       switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
> >>>       case BFPT_DWORD18_CMD_EXT_REP:
> >>> @@ -968,6 +978,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
> >>>               { SNOR_HWCAPS_READ_1_1_1_DTR,   BIT(13) },
> >>>               { SNOR_HWCAPS_READ_1_2_2_DTR,   BIT(14) },
> >>>               { SNOR_HWCAPS_READ_1_4_4_DTR,   BIT(15) },
> >>> +             { SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
> >>
> >> let's set 1-8-8 as well please
> >>
> >>>       };
> >>>       static const struct sfdp_4bait programs[] = {
> >>>               { SNOR_HWCAPS_PP,               BIT(6) },
> >>> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> >>> index 6eb99e1cdd61..584a05f9931d 100644
> >>> --- a/drivers/mtd/spi-nor/sfdp.h
> >>> +++ b/drivers/mtd/spi-nor/sfdp.h
> >>> @@ -118,6 +118,9 @@ struct sfdp_bfpt {
> >>>       (BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
> >>>  #define BFPT_DWORD16_SWRST_EN_RST            BIT(12)
> >>>
> >>> +#define BFPT_DWORD17_RD_1_1_8_CMD            GENMASK(31, 24)
> >>> +#define BFPT_DWORD17_RD_1_1_8_DUMMY          GENMASK(20, 16)
> >>> +
> >>>  #define BFPT_DWORD18_CMD_EXT_MASK            GENMASK(30, 29)
> >>>  #define BFPT_DWORD18_CMD_EXT_REP             (0x0UL << 29) /* Repeat */
> >>>  #define BFPT_DWORD18_CMD_EXT_INV             (0x1UL << 29) /* Invert */
> >
> >
> > Thanks
> > Jaime

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
