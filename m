Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253D8C4332F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gj4/xewl33NMxrobREpWsK7Mkk53prEDt2BwX8iZL2U=; b=hDgHBDDrCwsWbN
	qX3TJTlsJFcMucYsBUIAJgNDc17vliUKh4GA9TnxSObato4TFfFFPf8JtxlMVkdKErv9KplWWU4Mz
	NJ0aex1HfaWJGJPuOCtihGjPrvV4vuWxltpcnfi/tJE1NsynrgaAZkgVp3K+7x01JDUW4OWEP5J9+
	uVH/WqUmDtat9awK7jH9tjWgjtreCypiYwmrRTdWIACeA4aLwGbWPuASJMTNBZsr5weU+6+oOdqEU
	DqoH3y6FuTn357sxQgps5RA7TZS7boX+LtUxt5FkIUgmhwDt0FjM7u5EcBmhb1jYealdM/F4StzgJ
	r6lzoj9wov2xXyO1pcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2Ah-002FF4-0y;
	Fri, 15 Dec 2023 06:59:43 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE2Ae-002FEb-0b
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 06:59:41 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6ceba6c4b8dso282571b3a.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Dec 2023 22:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702623576; x=1703228376; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=btH6PFBcmld6bRTRbOMfMXQcD3tBM//mL+2epRiX41c=;
        b=Zq2llBhoO9iXb6oV/ORs7ry+9mJe+k42W0k8OR/p7OIYQ6NAAfJn5fhAe3u4GbGb0I
         LaynE2bWopi5favmtByG0FK2YL7KHGcA3NTEYWLts7pMpUXYdakUBhhiiPpB1hjyWfQf
         7VEL96yJtS/rpxpn9erKjLAF3ATtCXpb4jJbTUGM8fAztOUcETdpMWBvpcdpdMwI3csx
         U5nATrVsJvlzqu4cknB+L5HrqsLRbaLEVhlEWS3tzl3HXLv5DL9KoO2af0hwe0jQMPM2
         UqdZhFKmjZ+mhoP0nonbwKi6nARPjxzEUpYg6mHHyto42BCG0ozAI3t+IvxrcjwLIz1q
         23LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702623576; x=1703228376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=btH6PFBcmld6bRTRbOMfMXQcD3tBM//mL+2epRiX41c=;
        b=vXNdK/k8MkEaFBeWziCybFbDWJeX360kPDfIsLpGfdHtRvI96GzO6uGXrYdc7RWkT/
         iiylcMJKNeoVi3cZ98zusjY/Kyf5T4NnCDLeLSNFXKEAcMFFuNjcoIEVdbTxNkQXyiM+
         I3nV9PgBO4SrBFF3ReXP5I2BizbNZcboZv0EpZAF3C6/mATjVQAQ6DqbFHijYQx4Hupq
         DNIqM655oibWeIlCLQ287OrOykK6QLy4eEQht5qsc1YL0kwt5Ae2gjzTNGN11+E7NcQA
         a+iSz1ozhRQSTV1Rs1duyTRIwFihYMa1B3s9qfk1NZEv677/hn2pHXsf50FmAqv8gdI8
         HojA==
X-Gm-Message-State: AOJu0YzssgAlnMET3pPx2mUYAD3ureGbMkfLVTToyyFGwbOQ8H40zEiX
	ArLIS/A8IFmoJpoDTSFQb6dtBO30IHs9l1h3I4e3quzv
X-Google-Smtp-Source: AGHT+IEeQ6D4+jLNveHMtRTne4F1EAUXw13GTJDGbDdzsdMeIVnfMmqzklKdoHbpwsb9NIeccr8C0TjSVE9k/cNr9Yo=
X-Received: by 2002:a05:6a20:f397:b0:18f:e56b:9848 with SMTP id
 qr23-20020a056a20f39700b0018fe56b9848mr12009132pzb.13.1702623576318; Thu, 14
 Dec 2023 22:59:36 -0800 (PST)
MIME-Version: 1.0
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com> <a55b1338-d15c-4d1c-8b81-0d7a3913ec0a@linaro.org>
In-Reply-To: <a55b1338-d15c-4d1c-8b81-0d7a3913ec0a@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Fri, 15 Dec 2023 14:59:15 +0800
Message-ID: <CAAQoYRmCpYJNSZrriM1SbJvXGUjz=e8k8pRnB2cb-y4C=pHe8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from BFPT
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org, michael@walle.cc, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_225940_231236_12012A2D 
X-CRM114-Status: GOOD (  24.07  )
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
> Hi, Jaime,
>
> Please update the commit subject to indicate that you parse 4BAIT as well.
Got it.

>
> On 14.12.2023 09:33, Jaime Liao wrote:
> > From: JaimeLiao <jaimeliao@mxic.com.tw>
> >
> > BFPT 17th DWORD contains the informations about 1-1-8,
>
> Please run checkpatch on further submissions:
> ./scripts/checkpatch.pl --strict 000*
> WARNING: 'informations' may be misspelled - perhaps 'information'?
> #6:
> BFPT 17th DWORD contains the informations about 1-1-8,
>                              ^^^^^^^^^^^^
>
> total: 0 errors, 1 warnings, 0 checks, 46 lines checked
>
>
> > Parse BFPT 17 DWORD instruction to determine
> > whether flash support 1-1-8, and set its dummy cycle
> > accordingly.
> >
> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
> > ---
> >  drivers/mtd/spi-nor/sfdp.c | 13 ++++++++++++-
> >  drivers/mtd/spi-nor/sfdp.h |  3 +++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> > index b3b11dfed789..c55f39978762 100644
> > --- a/drivers/mtd/spi-nor/sfdp.c
> > +++ b/drivers/mtd/spi-nor/sfdp.c
> > @@ -446,6 +446,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >       u32 dword;
> >       u16 half;
> >       u8 erase_mask;
> > +     u8 dummy, opcode;
> >
> >       /* JESD216 Basic Flash Parameter Table length is at least 9 DWORDs. */
> >       if (bfpt_header->length < BFPT_DWORD_MAX_JESD216)
> > @@ -525,7 +526,6 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >       for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
> >               const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
> >               u32 erasesize;
> > -             u8 opcode;
> >
> >               half = bfpt.dwords[er->dword] >> er->shift;
> >               erasesize = half & 0xff;
> > @@ -631,6 +631,16 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >       if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
> >               return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt);
> >
> > +     /* Parse 1-1-8 read instruction */
> > +     opcode = FIELD_GET(BFPT_DWORD17_RD_1_1_8_CMD, bfpt.dwords[SFDP_DWORD(17)]);
> > +     if (opcode) {
> > +             dummy = FIELD_GET(BFPT_DWORD17_RD_1_1_8_DUMMY, bfpt.dwords[SFDP_DWORD(17)]);
> > +             nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_1_1_8;
> > +             spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_1_1_8],
> > +                                       0, dummy, opcode,
> > +                                       SNOR_PROTO_1_1_8);
> > +     }
>
> You missed the mode clocks. You missed to parse 1-8-8. Please check how
> the read settings are parsed and set in parse_bfpt() and do the same
> here. See:
> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/tree/drivers/mtd/spi-nor/sfdp.c?h=spi-nor/next#n502
Macronix Flash didn't support 1-8-8 feature.
So that I have no sample for validate it.
About read setting in parse_bfpt(), that is a good way for scan and
set for each protocol.
But 1-1-8 support judgement is not a single bit.
1-1-8 read instruction could determine wether 1-1-8 support or not.

>
> > +
> >       /* 8D-8D-8D command extension. */
> >       switch (bfpt.dwords[SFDP_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
> >       case BFPT_DWORD18_CMD_EXT_REP:
> > @@ -968,6 +978,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
> >               { SNOR_HWCAPS_READ_1_1_1_DTR,   BIT(13) },
> >               { SNOR_HWCAPS_READ_1_2_2_DTR,   BIT(14) },
> >               { SNOR_HWCAPS_READ_1_4_4_DTR,   BIT(15) },
> > +             { SNOR_HWCAPS_READ_1_1_8,       BIT(20) },
>
> let's set 1-8-8 as well please
>
> >       };
> >       static const struct sfdp_4bait programs[] = {
> >               { SNOR_HWCAPS_PP,               BIT(6) },
> > diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> > index 6eb99e1cdd61..584a05f9931d 100644
> > --- a/drivers/mtd/spi-nor/sfdp.h
> > +++ b/drivers/mtd/spi-nor/sfdp.h
> > @@ -118,6 +118,9 @@ struct sfdp_bfpt {
> >       (BFPT_DWORD16_EN4B_EN4B | BFPT_DWORD16_EX4B_EX4B)
> >  #define BFPT_DWORD16_SWRST_EN_RST            BIT(12)
> >
> > +#define BFPT_DWORD17_RD_1_1_8_CMD            GENMASK(31, 24)
> > +#define BFPT_DWORD17_RD_1_1_8_DUMMY          GENMASK(20, 16)
> > +
> >  #define BFPT_DWORD18_CMD_EXT_MASK            GENMASK(30, 29)
> >  #define BFPT_DWORD18_CMD_EXT_REP             (0x0UL << 29) /* Repeat */
> >  #define BFPT_DWORD18_CMD_EXT_INV             (0x1UL << 29) /* Invert */


Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
