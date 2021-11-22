Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37768C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8K7IZbyVFApYVp62NPbbYGp42KLWqUQ6P8c8aZG5JUc=; b=oJooM3haBmdXz+PVlL1jNg9HYv
	8bEKPzoTktVjgVr+ubfpmQtsRk4uJ5wSdqZcbp+TSyIzPSWrgDIM+Apt4PcDRadzia+NOy978UFgM
	3A2WtM30v+2R+jANC+N1lIzoD3tU4pw2t0kVzzsF/KjkFT1y0gWU9P6/Trd6OkdmPIqSXJ+h6oA34
	Wk2XwJ1OsYIRVctC/1c4K6KMwPA7bUEsanU1n8dg4yMSuMs05eJ+Bd4FfsabVCYjGerLMCZBsS5Wm
	ztEXhxZESBTV4fdGQlIwbP+8vw/VBEJoMtXcyRRgT0ZPmraNWh+1rUrYeZ8Og8+8NhHDn1nvirVAE
	fMakK88w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp9JA-00GdUS-8c; Mon, 22 Nov 2021 13:24:32 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp9J7-00GdTj-Aw; Mon, 22 Nov 2021 13:24:30 +0000
Received: by mail-ua1-f48.google.com with SMTP id p37so36403276uae.8;
 Mon, 22 Nov 2021 05:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=xarPnle33Vd1NAVNINArZXI9fdyD3SNGNTfacLEzKQo=;
 b=g3fZWC21Xc5ojpP0Tc9HmC1jyLHAMGEGRaLw7XmPx59nd1/z3rpIw8/PiyvOMVqgny
 WTY50+vYMO4T4WUCiCXSMTsCdIgTQjTYdrDoDpbseZ712HGXiO0UeWcepLYZEY6DqMTI
 /Hy5HCGnp5KyGPmAjId9YaXtWRpmLgsbmqkeA68tbu7nOGDM+xna2iAZPNFnHyRr1OBA
 MkRaRv72sFs3txbo1KD0NHDZaWDcLcC/8GYO3wAZH5iKsKP+j7MYfjGMmVIGVM8QoozZ
 6jLmI9Kumx3a35tfkcp6lWoo27+edNnHA0Vwfhh66Hz+pcyd7YttgulwIb/L4+GuEXwi
 JloQ==
X-Gm-Message-State: AOAM531jus9U/xSROf9o2eoWd+C029upw0C+c9FTZIQenCBx1hcdvwl5
 8OkZAmpVPKjsUCd8hcFQAU9tCgbfR53d/w==
X-Google-Smtp-Source: ABdhPJy6HG/HqGJ9fqE68REEnuwYl4inOANbMC3VlHw2SlzTZay/fqDHlueAVimDLxqSYRl6NNFXpg==
X-Received: by 2002:a67:7247:: with SMTP id n68mr124414378vsc.6.1637587463292; 
 Mon, 22 Nov 2021 05:24:23 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id r24sm1889628vsn.1.2021.11.22.05.24.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 05:24:22 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id i6so36419981uae.6;
 Mon, 22 Nov 2021 05:24:22 -0800 (PST)
X-Received: by 2002:a9f:248b:: with SMTP id 11mr85736008uar.14.1637587462423; 
 Mon, 22 Nov 2021 05:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20211122111214.3801534-1-geert@linux-m68k.org>
In-Reply-To: <20211122111214.3801534-1-geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Nov 2021 14:24:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7jcoNHyBomcbkkHU-m32uAureeHYj_PhaMC=O2b4wLA@mail.gmail.com>
Message-ID: <CAMuHMdW7jcoNHyBomcbkkHU-m32uAureeHYj_PhaMC=O2b4wLA@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.16-rc2
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-um@lists.infradead.org, sparclinux@vger.kernel.org, 
 linux-ntfs-dev@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_052429_402249_05A3F624 
X-CRM114-Status: GOOD (  17.59  )
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

On Mon, Nov 22, 2021 at 12:28 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.16-rc2[1] compared to v5.15[2].
>
> Summarized:
>   - build errors: +13/-12
>   - build warnings: +3/-26
>
> JFYI, when comparing v5.16-rc2[1] to v5.16-rc1[3], the summaries are:
>   - build errors: +6/-12

  + /kisskb/src/drivers/mtd/nand/raw/mpc5121_nfc.c: error: unused
variable 'mtd' [-Werror=unused-variable]:  => 294:19

ppc32_allmodconfig (patch sent)

  + /kisskb/src/drivers/video/fbdev/nvidia/nvidia.c: error: passing
argument 1 of 'iounmap' discards 'volatile' qualifier from pointer
target type [-Werror=discarded-qualifiers]:  => 1439:10, 1414:10
  + /kisskb/src/drivers/video/fbdev/riva/fbdev.c: error: passing
argument 1 of 'iounmap' discards 'volatile' qualifier from pointer
target type [-Werror=discarded-qualifiers]:  => 2095:11, 2062:11

um-all{mod,yes}config

  + /kisskb/src/fs/netfs/read_helper.c: error: implicit declaration of
function 'flush_dcache_folio' [-Werror=implicit-function-declaration]:
 => 435:4

sparc-allmodconfig
sparc64-allmodconfig

  + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2192 bytes is
larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1

ppc64le_allmodconfig

  + /kisskb/src/fs/ntfs/aops.c: error: the frame size of 2256 bytes is
larger than 2048 bytes [-Werror=frame-larger-than=]:  => 1311:1

powerpc-allyesconfig

> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/136057256686de39cc3a07c2e39ef6bc43003ff6/ (all 90 configs)
> [3] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf/ (all 90 configs)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
