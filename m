Return-Path: <SRS0=sGI+=HU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4ABC433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 07:44:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE4F64E6F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Feb 2021 07:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE4F64E6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X9saVjhOahwqkcCte4+ZLBLzbWwuT46bA8a7rMNN/Q8=; b=eflHacFUxG8brus9izmPpw3v+
	4HjPmuYBpYTXem7rczDdqTdx4LCkc6/9spWTChkQwRjbOEjrQ5g5O7L8t2YBfV+B1Gt3fsqqLJFF2
	haO7sYgbc/Gclor/ve9Z5T96vqFWPt91BG9hZ+fXzm89aDG+GvYpMmaccHoIDSVwYRdhcjWMoEun4
	wOsRrIFX5uIDRvoNvtwFGzXvZb1h6FndcJcSpBxaer/5GE9gUTA1puLWiadjuDveJyOuVz2GGRTlv
	7FHJJUKZEw0az5kHaktHEXuMjVIee7MmOjBnIeCsRpXF7mDtzRX6HgqGPm21OrcJIQniSNS9gi5R5
	xknt/h0Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCdyf-0003Tn-Dz; Thu, 18 Feb 2021 07:43:57 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCdyc-0003RT-ME
 for linux-mtd@lists.infradead.org; Thu, 18 Feb 2021 07:43:55 +0000
Received: by mail-io1-xd31.google.com with SMTP id n14so1090543iog.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Feb 2021 23:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dwHM37yVnODcbFCIiV6fADuWHv0OOMHDxJ1I+P0OxT8=;
 b=pJzPxLkyTOxibtpfr4GQV3MMsntTZ+Jh1rueZ7JeoDvTScpOzhWXaED7oojcpJI83k
 ZblnPU3EJM7L3rK9QwZwxOPtMHFiEuX4QBVhaxCHMd3QHBxzv2TRumfm0PX/bZL/q9/h
 O+6W5MSnohAShC2vOkKbJjo1DtLoTAab7axJhYSi5x5aAQK8DuNEST6kj5qibaxnEJn7
 qVqR+2GeHj9P90P8YV91Br/fUO3aaX9UdZxtU25f/g6WjkEz79tUGi5phrtI9DycctHe
 HdkeMlR+GV9X+F9XGAnUsAjsor2gMLYbsbfJPE9wJojeACa19HGB5q0+FDi9pGgPZ/hZ
 lnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dwHM37yVnODcbFCIiV6fADuWHv0OOMHDxJ1I+P0OxT8=;
 b=afw8Z5JDvzgDMeKVdCbxZyjYPfvH2ZvqCrNOrCtltPCxMvLhDUlN58M7YTzYVfC8Ls
 vxviIdOTJ4ezHLBv+RbOFRSTlI+O72zu7mc7PsUESwcsyFWXCYsXfh9vlfzxXPWxO1cK
 30NfCzyeFYyr0mXXpVeF9FgrSxLQa08o48HSaNt7pmoFmR3sbNIvRT9PoXb+/3vnDsEq
 Rr7DvtacisyNon9K/JtquxSiatKXJmF4kpO1v+rho82Cw2VDlXOOJndzovqzPI8LWqR+
 AyJHarpzncnpVL5QNlQE8UlJadbX6XUtJMTEtDRcXn47FdhRbR/iKTCR70PSOWs6vz0h
 0Vmw==
X-Gm-Message-State: AOAM5339ud280+cSxwt3FO7sJRkaWFK4g23xsMzM5r/N0sP5nRYIbphI
 FzfYZXJnF++eJexShd/guxyJBTRNX6oK9d0t1L4=
X-Google-Smtp-Source: ABdhPJwlpvlEsnpqzpN2uYL4vneWBLr3fTxA8Xdpg9ZFGS0fijKvszbb0IYgzGNly0nGCf6aL+fsP3sr+Cx1zLmnFX8=
X-Received: by 2002:a5d:818b:: with SMTP id u11mr2508770ion.59.1613634232212; 
 Wed, 17 Feb 2021 23:43:52 -0800 (PST)
MIME-Version: 1.0
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
 <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
 <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
In-Reply-To: <92b5b932-a672-9fb6-c604-5263a0668eb3@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 18 Feb 2021 08:43:40 +0100
Message-ID: <CAEyMn7aMNjKHXhe_hN15XVczombrTnNqASmva_-MT92+qqV8xA@mail.gmail.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_024354_830069_1C2B076C 
X-CRM114-Status: GOOD (  34.91  )
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
Cc: juliensu@mxic.com.tw, ycllin@mxic.com.tw, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor and all,

Am Di., 16. Feb. 2021 um 12:15 Uhr schrieb <Tudor.Ambarus@microchip.com>:
>
> Hi, all,
>
> +zhengxunli, juliensu & ycllin
>
> On 2/16/21 11:48 AM, Michael Walle wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Am 2021-02-16 10:27, schrieb Pratyush Yadav:
> >> On 15/02/21 10:53PM, Heiko Thiery wrote:
> >>> Hi all,
> >>>
> >>> I faced an issue with a SPI flash on our board. We use a macronix
> >>> MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
> >>> the MX25L12805D [2].
> >>>
> >>> The newer MX25L12835F has support for dual/quad read mode and RDSFDP
> >>> while the older doesn't.
> >>>
> >>> I thought that I could do a fixup with a device specific
> >>> post_bfpt_fixups() call but by now this seems not possible. The older
> >>> MX25L12805D has no flags set that allows a call to
> >>> spi_nor_sfdp_init_params() and implements the fixup.
> >>>
> >>> Has anyone an idea how to solve this?
>
> Maybe macronix can help with some suggestions on how to differentiate
> between flashes at runtime.
>
> My first thought is to introduce a SPI_NOR_HAS_SFDP flag. For the flash
> that doesn't support SFDP tables, there should be no functional change,
> for the one that support SFDP it should fill the properties from the
> SFDP tables.
>
> >>
> >> The post_sfdp fixup is always run regardless of whether the flash has
> >> SFDP or not. You can try putting your flash-specific fixups there.
> >
> > Well the problem here is, that the SFDP setup is skipped though the
> > flash would support SFDP. If the jedec id wasn't already in the table,
> > there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
> > parsed. But because there is already the legacy device (which likely
> > doesn't support SFDP) it really doesn't fit.
> >
> > Its unclear to me, why the SFDP is only parsed if one of the
> > SPI_NOR_*_READ flags are set.
>
> My guess is that a new SFDP flag was not necessary. SFDP defines multiple
> tables, but there is just one that is mandatory, BFPT. BFPT defines DUAL
> and QUAD parameters. From the spi-nor code, a BFPT without DUAL or QUAD
> support doesn't make sense, even though DUAL or QUAD are not mandatory
> in BFPT as I see in the standard. So probably it was just a way to avoid
> adding a extra flag. We have to check the git history for a more accurate
> description, this was just a guess.
>
> Thinking loud, now we do a static initialization of flash params, that
> can be overwritten dynamically by SFDP. How about doing the params init
> the other way around. Try first to dynamically discover the params via
> SFDP, and if SFDP fails or if it is not defined, do the static init via
> flags. That would spare some code. And new flash IDs will have less flags
> declared, and we'll better track faulty SFDP flashes.

I am a newbie but it sounds reasonable. I made a first attempt and
reversed the order. But this is not enough. After a few debug cycles I
found a few settings that are probably not automatically set by the
SFDP detection and were set in spi_nor_info_init_params() before.


I was able to find the following lines as the cause.


---- 8< ----
 /**
  * spi_nor_info_init_params() - Initialize the flash's parameters and settings
@@ -3094,14 +3095,18 @@ static int spi_nor_init_params(struct spi_nor *nor)
        if (!nor->params)
                return -ENOMEM;

-       spi_nor_info_init_params(nor);
+       nor->params->setup = spi_nor_default_setup;
+       nor->params->writesize = 1;

-       spi_nor_manufacturer_init_params(nor);
+       /* Page Program settings. */
+       nor->params->hwcaps.mask |= SNOR_HWCAPS_PP;
+       spi_nor_set_pp_settings(&nor->params->page_programs[SNOR_CMD_PP],
+                               SPINOR_OP_PP, SNOR_PROTO_1_1_1);
+
+       if (spi_nor_parse_sfdp(nor, nor->params))
+               spi_nor_info_init_params(nor);

-       if ((nor->info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
-                                SPI_NOR_OCTAL_READ |
SPI_NOR_OCTAL_DTR_READ)) &&
-           !(nor->info->flags & SPI_NOR_SKIP_SFDP))
-               spi_nor_sfdp_init_params(nor);
+       spi_nor_manufacturer_init_params(nor);

        spi_nor_post_sfdp_fixups(nor);
---- 8< ----

Now I am trying to understand if this makes sense or what is going
wrong. Does anyone here have a hint at which point this would be
correct or if it should also be detected by the SFDP?


--
Heiko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
