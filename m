Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBF1C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:37:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A857664E68
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 10:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A857664E68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8p/Gdb4LwekKSTCsBoKjOsqepjuAoL4EozT/pnDU1qI=; b=qoF875BkR+i/dPYKRWN2htp4b
	C2vakEHC9ACsVXf3SskVi4QUv3Zf6HYbWtDu3NxTa/Tcb/3nvb/ix4Ld/Jk/8O39VEJyi6XMDf5UP
	p0Q0MJGcyJG5IxFtIts71+nmS1ownq+QlFrAwanxntrx5jtA+uzXiCu12b5Q/nLOBV90Ruc0tBgsh
	27eY8/9cGlFVkB150Be8g4HbKtQw6M7+QqalZsUiU8e+GCRzzRBzXm2qwvXdDv4ZzJRsonSnUVBEp
	VT6atciBWcquPqusxWXOcSKL6nyw7qx+es1hxSEY90LWkMnK44ejFz3ei/VtFn1T/Ljxx3pKag482
	R4umlxhZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCgff-0003ot-EZ; Thu, 18 Feb 2021 10:36:31 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCgfc-0003o6-Mi
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 10:36:29 +0000
Received: by mail-il1-x132.google.com with SMTP id m20so1003086ilj.13
 for <linux-mtd@lists.infradead.org>; Thu, 18 Feb 2021 02:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ee+my+7QLNBMNPiEUqgV+Q1yCHUV5l8QPBmpD7HiTzE=;
 b=YyrB1YegQ1kAjHorWijxJK5rpy65Bfg2ZAgyvPjS8EXpl3ZgHkuu816R+jcy+z8N2B
 Jd83cqPKY5/ELxW2HYlBa7kJCq/ljNSuPyyK7UXeHW1mVKKJv16pa77zJmQrnXSBBsCr
 VrUs384YQQsLFVCvM4WOjdcGJvGRTjWPMlNpMNJsULqxb4aAg8WD5nexv4WDtwwm5N81
 gE35WaxnRfJR5uWzVgWEhamfkj5udjNucKHSWFrRtJZk0ayCZnEHLMJr61mrXhlrw2Nh
 I31xcfy/dWG60SS9K1urRGW+lJ1whBehFBJwtYYqbKAEYgrbQtjBS26QrAHWXeRCqyF1
 3ZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ee+my+7QLNBMNPiEUqgV+Q1yCHUV5l8QPBmpD7HiTzE=;
 b=m9gYsyjL1fuHdioj16ZXL0QzJqLjnWdagaFvds6yyzkuRhkbCddUNtPMTuGyuy0qSR
 aQKImIuCLRFivps9YiuoMcsNENw7PjGZ+ub4GQpVNsBORjNQwHTcSz3OWBeuDuy0Hd7t
 WFpChdm3k6bZ6wO47fuM7HeCphzP+Acl4/VjSVd+rU8WFJbUR227ZuY4YVeyUwdCWdy/
 krAr/GmxtS0f0Hxj4ViesTjAK92JW4Lz8ItRdlIqM/HhNct6pHPs8euPQt7x6DiOYdOi
 WtcyWvwvUo3+DbWHVCp7xk2xhSFr3ZUSZNfFbDY0nbZhRxhYXx9VHYsm3VBlFdsqcZWa
 3ZWQ==
X-Gm-Message-State: AOAM533LiCaVy/8vFlYT1mbyZgXdKpk3iAvNiHG5kHS9ZfAiSINB7jtf
 rtZ4jC9/ZnJqK0do2MN36LOnz49HMyQ2Gp+4ohA=
X-Google-Smtp-Source: ABdhPJwWz1j/Dq8JskMZBf6Y9ex98aBDOHiZrq6+ae3UdhIOuWewdAeROfIE0BTlmTRFkS6avb8jLK670fsyatOrUT4=
X-Received: by 2002:a05:6e02:1bec:: with SMTP id
 y12mr3045096ilv.214.1613644586030; 
 Thu, 18 Feb 2021 02:36:26 -0800 (PST)
MIME-Version: 1.0
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
 <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
 <615749fe-52f5-9e07-db46-41e5e03b55cf@microchip.com>
 <CAEyMn7aXXOS3abS=n_8Y6GtN-xYRYyGT3H-AoavWqCqqM01V9A@mail.gmail.com>
 <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
In-Reply-To: <fb31d09c-d20a-9a42-6ed2-fd74c7699dfc@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 18 Feb 2021 11:36:14 +0100
Message-ID: <CAEyMn7ZeyjpddMG3QhRKOAy4quE+63J8xcysrJY3aS0Wa+wFsA@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_053628_782010_567A93A1 
X-CRM114-Status: GOOD (  26.06  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, juliensu@mxic.com.tw, ycllin@mxic.com.tw,
 Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Do., 18. Feb. 2021 um 11:26 Uhr schrieb <Tudor.Ambarus@microchip.com>:
>
> On 2/18/21 12:15 PM, Heiko Thiery wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Hi Tudor,
> >
> > [...]
> >
> >>>> Thinking loud, now we do a static initialization of flash params, that
> >>>> can be overwritten dynamically by SFDP. How about doing the params init
> >>>> the other way around. Try first to dynamically discover the params via
> >>>> SFDP, and if SFDP fails or if it is not defined, do the static init via
> >>>> flags. That would spare some code. And new flash IDs will have less flags
> >>>> declared, and we'll better track faulty SFDP flashes.
> >>>
> >>> I am a newbie but it sounds reasonable. I made a first attempt and
> >>
> >> Let's first see if all parties find the idea good (I'll have to double check
> >> it myself). Vignesh and others might help.
> >>
> >> Until then can you try the patch form below and see if you can do the
> >> reads in quad mode?
> >>
> >> Cheers,
> >> ta
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> >> index 0522304f52fa..718d0b75df91 100644
> >> --- a/drivers/mtd/spi-nor/core.c
> >> +++ b/drivers/mtd/spi-nor/core.c
> >> @@ -3099,7 +3099,8 @@ static int spi_nor_init_params(struct spi_nor *nor)
> >>         spi_nor_manufacturer_init_params(nor);
> >>
> >>         if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >> -                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ)) &&
> >> +                                SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ |
> >> +                                SPI_NOR_AIM_SFDP)) &&
> >>             !(nor->info->flags & SPI_NOR_SKIP_SFDP))
> >>                 spi_nor_sfdp_init_params(nor);
> >>
> >> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> >> index 4a3f7f150b5d..3495549815e6 100644
> >> --- a/drivers/mtd/spi-nor/core.h
> >> +++ b/drivers/mtd/spi-nor/core.h
> >> @@ -338,6 +338,11 @@ struct flash_info {
> >>                                          * protection bits. Usually these will
> >>                                          * power-up in a write-protected state.
> >>                                          */
> >> +#define SPI_NOR_AIM_SFDP       BIT(23) /* Try to parse SFDP. Used by flashes
> >> +                                        * that share the same JEDEC-ID, but
> >> +                                        * where a flash defines the SFDP tables
> >> +                                        * and the other doesn't.
> >> +                                        */
> >>
> >>         /* Part specific fixup hooks. */
> >>         const struct spi_nor_fixups *fixups;
> >> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> >> index 9203abaac229..1ebce775eae4 100644
> >> --- a/drivers/mtd/spi-nor/macronix.c
> >> +++ b/drivers/mtd/spi-nor/macronix.c
> >> @@ -50,7 +50,8 @@ static const struct flash_info macronix_parts[] = {
> >>         { "mx25u4035",   INFO(0xc22533, 0, 64 * 1024,   8, SECT_4K) },
> >>         { "mx25u8035",   INFO(0xc22534, 0, 64 * 1024,  16, SECT_4K) },
> >>         { "mx25u6435f",  INFO(0xc22537, 0, 64 * 1024, 128, SECT_4K) },
> >> -       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256, SECT_4K) },
> >> +       { "mx25l12805d", INFO(0xc22018, 0, 64 * 1024, 256,
> >> +                             SECT_4K | SPI_NOR_AIM_SFDP) },
> >>         { "mx25l12855e", INFO(0xc22618, 0, 64 * 1024, 256, 0) },
> >>         { "mx25r1635f",  INFO(0xc22815, 0, 64 * 1024,  32,
> >>                               SECT_4K | SPI_NOR_DUAL_READ |
> >
> > I tried your patch and it works like expected. I can now read the
> > whole flash in ~2sec while without that it was ~6sec.
> >
> > # time dd if=/dev/mtd0 of=dump.bin
> > 32768+0 records in
> > 32768+0 records out
> > real 0m 2.08s
> > user 0m 0.01s
> > sys 0m 2.06s
> >
> > vs.
> >
> > # time dd if=/dev/mtd0 of=dump.bin
> > 32768+0 records in
> > 32768+0 records out
> > real 0m 6.16s
> > user 0m 0.05s
> > sys 0m 6.09s
> >
> >
>
> Great, thanks!
>
> > Should I prepare a patch with that change or will you do?
>
> Let's wait for a few days, so others can intervene. I'd like to
> clarify what's happening on mx66l51235l too.

Sounds good. Thanks.

-- 
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
