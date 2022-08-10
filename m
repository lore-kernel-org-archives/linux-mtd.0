Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C61C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hINv0nzc9Sg67DrCV6UUfBEaVVF7VUbPsVHoq2bPb5U=; b=SQLdQlSauJrGV3
	nRpF4JHR12wXl/xihbBehU32JNEgiGTeQMhxmKzQ00cyS/S01G4XUNva/DCnmN2a6H+6eTA1iusc+
	DA1UM77zZLWNFTIpXalm5tjTD3qH2iKWAQ3XmGHnAZ755fJIKduGZ+oX+CD+9MH0RgOHb2G3Kbd08
	FBcIPN5gyuL47brEJ8E6TmKt9oa0J0jT/Djg0de6QzAnT+I9F/hpl8tK1vXwcvZlJ5zpuLWdxZ8eP
	zqnp7Rjghh9buhpujcoWbWo2LAWH7BdsjGweM17H6VCSC2j2hJvOhtItWzDkyRP41vqpqB2BRWgVc
	PhMGHcxSCk0vXJors+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLnSo-00CW9P-KC; Wed, 10 Aug 2022 15:17:42 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLnSl-00CW7A-9A
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 15:17:41 +0000
Received: by mail-ej1-x630.google.com with SMTP id m4so28314645ejr.3
        for <linux-mtd@lists.infradead.org>; Wed, 10 Aug 2022 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=17Px2Q0XnRJSkgeDgK2Uc7SLf0lUYwKRriKLtd/OTEc=;
        b=ZUTMtDxdkka7efEt+gZA1raHqb9DkP/Lg4D5j1qxD1fYN7g9jdBex/U0K7uwm+S0qo
         uaIyaLY56a/OsYEm2hLsIhzkYYqGLH6I6neFSQP8w6D3oPjQxUIMBNYrsXvWYbhdrkkI
         R2nnDfbjJY0oVKV/0lLQLRzB7Byj55mIV2c3XJYJiHLa58Ji+kmfv2mJYSFZvC0bCWtK
         /FGxayOpGV8huVrXNUzMhj1u9cvXOmXACwbtG18l1QNlAkwtPd3pkY6WwfDo4x676h5Y
         EB28HD4V3LczIn3BY7N/pdTuoMuZtvs0x5Yx/QtI2ybf14VoykXzue7zvGFyK3FeY/+a
         +dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=17Px2Q0XnRJSkgeDgK2Uc7SLf0lUYwKRriKLtd/OTEc=;
        b=Ainbz9C2fD8YLyQYvNYgpjwIznQu+mt3wdngUP7rtVxXUwFik9+dkzRAcSi9PxznjC
         D6s0EN1mIn+rKrMpQzXW8mIzLRVbJQyRQPA8gDLtlk888eBExXZENPzBggaP+Tw7Gs2y
         sGgE2/mGvscn8lnPy5DEvhLXcAVWgZ2Knc9jXAV6sqUUJOC1UAVP6mrNAlDIUDBdqXlW
         AIBwC5fcN3UpuyEulyu7MWtx4V70trkfUuahXQIqkSl7XAkI60wzzw/axE7WOGkOdE9/
         l2zWIspDZmkQ1UdBJFUpcNWEQkA+P3araVeu3FyoRXRAfr8ufFsWtvatGeO6pXj1K8dk
         4DMg==
X-Gm-Message-State: ACgBeo0LZ0sr7PsIAmq/hvU/oN89PFQcCV3RX1I0Tgfz2MVCZZWu+K+1
	xqGXgoU9YbT3TPCUl1PoHWah6LG1K8DwvNwIEndarg==
X-Google-Smtp-Source: AA6agR7oVMUUXFe//QlOo+zHflIW7QAtuhApnXJl+A4r2Npaw5Vr5HKEjpabzylR8mRvvEvfsG7wpSeFR8oo557sIwo=
X-Received: by 2002:a17:907:a068:b0:731:366a:6005 with SMTP id
 ia8-20020a170907a06800b00731366a6005mr13932745ejc.344.1660144655892; Wed, 10
 Aug 2022 08:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
 <20220809201428.118523-3-sudip.mukherjee@sifive.com> <361fa56d-617c-ee92-151e-5d8fe0a29e53@microchip.com>
 <498c33a8-014f-e542-f143-cba5760fafdd@microchip.com>
In-Reply-To: <498c33a8-014f-e542-f143-cba5760fafdd@microchip.com>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Wed, 10 Aug 2022 16:17:24 +0100
Message-ID: <CAHyZL-cKJernGp93+H69zdNnn50Pj0LpYrgmUZuck0YfAZq+2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page Program
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Jude Onyenegecha <jude.onyenegecha@sifive.com>, William Salmon <william.salmon@sifive.com>, 
	Adnan Chowdhury <adnan.chowdhury@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_081739_479533_97A7FC19 
X-CRM114-Status: GOOD (  24.20  )
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

On Wed, Aug 10, 2022 at 9:25 AM <Tudor.Ambarus@microchip.com> wrote:
>
> On 8/10/22 11:06, Tudor.Ambarus@microchip.com wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > On 8/9/22 23:14, Sudip Mukherjee wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> SFDP table of some flash chips do not advertise support of Quad Input
> >> Page Program even though it has support. Use fixup flags and add hardware
> >> cap for these chips.
> >>
> >> Signed-off-by: Sudip Mukherjee <sudip.mukherjee@sifive.com>
> >> ---
> >>  drivers/mtd/spi-nor/core.c | 9 +++++++++
> >>  drivers/mtd/spi-nor/core.h | 2 ++
> >>  2 files changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index f2c64006f8d7..7542404332a5 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -1962,6 +1962,12 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
> >>         if (nor->flags & SNOR_F_BROKEN_RESET)
> >>                 *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);
> >>
> >> +       if (nor->flags & SNOR_F_HAS_QUAD_PP) {
> >> +               *hwcaps |= SNOR_HWCAPS_PP_1_1_4;
> >> +               spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
> >> +                                       SPINOR_OP_PP_1_1_4, SNOR_PROTO_1_1_4);
> >> +       }
> >
> > setting SPINOR_OP_PP_1_1_4 should be done in spi_nor_late_init_params().
> > spi_nor_late_init_params() is used to adjust the ops supported by the flash
>
> ^ s/spi_nor_late_init_params/spi_nor_spimem_adjust_hwcaps

So, do you mean something like this:

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index f2c64006f8d7..2f41937b826d 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1962,6 +1962,12 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor
*nor, u32 *hwcaps)
  if (nor->flags & SNOR_F_BROKEN_RESET)
  *hwcaps &= ~(SNOR_HWCAPS_X_X_X | SNOR_HWCAPS_X_X_X_DTR);

+ if (nor->info->flags & SPI_NOR_QUAD_PP) {
+ *hwcaps |= SNOR_HWCAPS_PP_1_1_4;
+ spi_nor_set_pp_settings(&params->page_programs[SNOR_CMD_PP_1_1_4],
+ SPINOR_OP_PP_1_1_4, SNOR_PROTO_1_1_4);
+ }
+
  for (cap = 0; cap < sizeof(*hwcaps) * BITS_PER_BYTE; cap++) {
  int rdidx, ppidx;

diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 85b0cf254e97..10aa1c72000f 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -507,6 +507,7 @@ struct flash_info {
 #define SPI_NOR_NO_ERASE BIT(6)
 #define NO_CHIP_ERASE BIT(7)
 #define SPI_NOR_NO_FR BIT(8)
+#define SPI_NOR_QUAD_PP BIT(9)

  u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP BIT(0)
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754..014cd9038bed 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -71,8 +71,9 @@ static const struct flash_info issi_nor_parts[] = {
  { "is25wp128",  INFO(0x9d7018, 0, 64 * 1024, 256)
  NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
  { "is25wp256", INFO(0x9d7019, 0, 64 * 1024, 512)
- NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
+ PARSE_SFDP
  FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
+ FLAGS(SPI_NOR_QUAD_PP)
  .fixups = &is25lp256_fixups },

  /* PMC */


--
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
