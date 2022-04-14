Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5CFC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Apr 2022 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCQmQB4SvltzEy0NVZPAWPAiFE3ggdzBBnSF+TKsJ3A=; b=E7RBAKvSNma62A
	cgaSpoB+ew91XADpjzvKzta/ZHYcPUMGMZFGaO93DHrzve+z/hzlKR9+z4AiFoQOr9twYnHYtKF15
	Fyun9AVZu7T4cZiLN2nwFHy75F1KKsolj26CkU0BWIu/AgU5VN+gPqEF7ZmdVvmVeTep6b+B3Af21
	Y/5N0nYdRSvqxVuGttHD+P1bri1SU1cePJEfaRko5WIrFjsbXbeA5YvuCRlT5+8megpX72rfBCr6Q
	19Dj5InWV14tEy0FaKPQTSEdavmOsst8kxoK1pqqGEeQq1tjsgruQztJeBeD9wFohp7/W4KzCXUFM
	56AUgqEzSmX8mHxEu94A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neu76-004P2b-Qy; Thu, 14 Apr 2022 07:42:00 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neu73-004OxZ-UO
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2022 07:41:59 +0000
Received: by mail-qt1-f172.google.com with SMTP id s6so3040174qta.1
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 00:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHi37QgFrguKoFdX0YvnqEc8jgtMaeE9jDv0V4psTXQ=;
 b=h7YuGeGBi+Lv+3+c4WMA2xQ5N82RZIsw9phec1lGIFKPROcAQDFs6j6xcOVM01Ignk
 K69mze4Jg5M3F7b7/gu5ynvLbjnfQsgmqUN2yrEBLQMwbjCo+U4NWiIhf6Fskf/YFEda
 3fNmPEbmUQx47Bm0Dhwk9/j4qTvOliDj5MMTZrQuv325G5or4TZACqWsnEARjAnTp5CV
 wb7XKiZUbMFV31Bme2RQUyo4/IviJI7F0qA+RtRj4URwk2oV2Qf4//GHI8Hl3UKcHNUH
 +by52F9ykgrzNXVN+okb/Pcmx104H3fGitVexyUBx88NFTUFe11moaOlMq+9Mm2URGEa
 uE7A==
X-Gm-Message-State: AOAM531ThWD1vxtwvjr+nJGIvU2n9F0bGp9u8QEOspxnzfw9iBeOGv8v
 KXBUWk5dU56REeqd0OyMiRvmjejiB9XyEA==
X-Google-Smtp-Source: ABdhPJx2b+jedc30FoL50HiaWEA4CXsAZkg/u2jZoF7kSeHCGuav3w0MVp01Dy5Lyien5uiN2Jl01w==
X-Received: by 2002:ac8:4292:0:b0:2ed:7cf8:9bb5 with SMTP id
 o18-20020ac84292000000b002ed7cf89bb5mr811361qtl.417.1649922109560; 
 Thu, 14 Apr 2022 00:41:49 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 q71-20020a37a74a000000b0069c1625250fsm624921qke.79.2022.04.14.00.41.49
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 00:41:49 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id m132so7967829ybm.4
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 00:41:49 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr857786ybq.342.1649922108771; Thu, 14 Apr
 2022 00:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <c3b2a8d1a69f1b1e8d1a460148406cfb83e52eb4.1649857740.git.geert+renesas@glider.be>
 <50714f3e-7561-37fd-7a05-222fd6185c47@linaro.org>
In-Reply-To: <50714f3e-7561-37fd-7a05-222fd6185c47@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Apr 2022 09:41:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQjJYhtQ9k0ZhoOS0htvr+nM5+Z_SG=WNsg64ZHuytFw@mail.gmail.com>
Message-ID: <CAMuHMdWQjJYhtQ9k0ZhoOS0htvr+nM5+Z_SG=WNsg64ZHuytFw@mail.gmail.com>
Subject: Re: [PATCH v2] memory: renesas-rpc-if: Simplify single/double data
 register access
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Gabbasov <andrew_gabbasov@mentor.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_004158_035106_3A31EEC4 
X-CRM114-Status: GOOD (  20.56  )
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

Hi Krzysztof,

On Thu, Apr 14, 2022 at 9:28 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 13/04/2022 15:49, Geert Uytterhoeven wrote:
> > For manual write and read, factor out the common access to the first
> > data register by keeping track of the current data pointer.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> This does not apply on a next branch. Maybe because I put "memory:
> renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode" for fixes?
> Does this patch depend on that fix?

There is no functional dependency, but a slight contextual one.
It should apply with some fuzz:

$ git am --show-current-patch | patch -p1
patching file drivers/memory/renesas-rpc-if.c
Hunk #1 succeeded at 458 (offset -30 lines).
Hunk #2 succeeded at 471 with fuzz 1 (offset -31 lines).
Hunk #3 succeeded at 515 (offset -31 lines).
Hunk #4 succeeded at 531 (offset -32 lines).

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
