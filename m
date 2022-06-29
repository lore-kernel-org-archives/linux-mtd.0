Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977E5C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 19:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA57y0wB8CZ6lGbyKv8oE9m6caIquKayKYYMuxOBd+M=; b=Y68JmHJLtfcnop
	rGaXOSHg1tKmlRguAZhOHDfP43pOHyuJirqPcbatwBQhWpCvozARVqGbcKe1uab3QPBLV6AStFiJ7
	S4i+apUk4i7xdwe7aaxrxYzt11H5U/5C2TmaIb/RQXnxTOcN8L0z091E5bCDYTaH12ihgVvx/iliO
	1KuE2RyCNXNcKAjlRwEYGq8BngdyWzNku1vYeIaLDdSEcNrgUBlSbXD7y/KF03tQ3bjuuZtBX/BDW
	G1TCtvTnjY2WOzucuGBukp6ONn4OA0d+ekkhSmVAIgqoc8VOThK6cZk3yIzrxOtmqjvVl3g1qHeG8
	yXA4kzOAyCF2pyJZW/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6d64-00Dhy5-QS; Wed, 29 Jun 2022 19:11:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6d63-00Dhx8-Qp
	for linux-mtd@bombadil.infradead.org; Wed, 29 Jun 2022 19:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cXKqNI+/sqOYyJuUtCM7197IW3EKPfuEBZYWu6etnmg=; b=XxwyiDnklO/A6w3BiyC7wcSrB0
	X6cJeAXLOJkAQaU+f/i8UQN+wDTQvsvcSNf0l8Yb0sr4U0xIGLxlMIRGlnW4GnGSGJOxg5CpDlsK0
	8S1lKfLccMQFJspjz9Oqzj8mg4TMd4iajgW97AI+J4NDaQfIT1wwDgL98SLxxBMUY612dgVBXv9TV
	84MwxiRhJVjxoJYSOwffsrGwyN+Tni3u7IZLFnwT8DW0e7y3ZRmt8KWv4BjIo6O4d8YfSMzuIZkd/
	7EjBlhn0xnzzk25hT3SFqkMx7BQhSLIqrI/9kLQXkllMzsk7eWP2fAhHRXIIjAAjZ8o8U7VyFHkSe
	kqTTSgiA==;
Received: from mail-qk1-f170.google.com ([209.85.222.170])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ck4-00EoJo-Mk
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 18:49:03 +0000
Received: by mail-qk1-f170.google.com with SMTP id b133so12737783qkc.6
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 11:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cXKqNI+/sqOYyJuUtCM7197IW3EKPfuEBZYWu6etnmg=;
        b=gqJhTOOJrP2OEP7iP6pP8M6znGZk/jIya3XuG8HgavhIYVyveUYm51chqkc2A6BkXv
         PCGu23vP+7xy0YTRZZCYiSgTbecAVASF1jfJlDyN8Jw8BQ4w9pBgO5fLTfIS2VxqlGZ1
         dHyAFDxLADJfu8luN5PVgme1d+xU6CK94IZIzIHZG481lZ1XWCoNZAvNOb+edocEtaoV
         LRG7LgEB+pzGNn0lgNUPu9KBjv36F+ZZLhhRyES+Y/DsKGA621ft4FSjDSsIuGa3YEbH
         woHfjcSoJZQzTtmduehBgq9sVJkuRNW8jlveh0n/50+FsNnOoVqzkYL0J8iUINPjHKx5
         6Iew==
X-Gm-Message-State: AJIora9ooSgiOeUuXRcd9UrLFhC6NkOZPb0jXiTTDQeDpQKSluEUBdVi
	/IR8aOFWiPU3EXIY804yFyI6HQukQljyyA==
X-Google-Smtp-Source: AGRyM1tYv9n5MAk/x13MTw+JEtazZUteeYxkJDIUW3jT34VUV/j+cW3Xkc+t2swq1uPX0qSEPaW37Q==
X-Received: by 2002:a05:620a:2903:b0:6af:41a4:3f71 with SMTP id m3-20020a05620a290300b006af41a43f71mr3360003qkp.350.1656528522756;
        Wed, 29 Jun 2022 11:48:42 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id t18-20020ac86a12000000b00304bbcc1b8asm10911239qtr.28.2022.06.29.11.48.41
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:48:41 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id v185so20054221ybe.8
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 11:48:41 -0700 (PDT)
X-Received: by 2002:a05:6902:1246:b0:66d:5b0b:19b0 with SMTP id
 t6-20020a056902124600b0066d5b0b19b0mr4728646ybu.365.1656528520803; Wed, 29
 Jun 2022 11:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656341824.git.geert+renesas@glider.be> <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
 <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org> <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
 <bab4d845-330e-c7f0-5dac-a96caa93a39e@linaro.org>
In-Reply-To: <bab4d845-330e-c7f0-5dac-a96caa93a39e@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jun 2022 20:48:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUuU4qtfYh=hpY9bWMLKAnz83Oj8f=M9_iUxmR+Zetsow@mail.gmail.com>
Message-ID: <CAMuHMdUuU4qtfYh=hpY9bWMLKAnz83Oj8f=M9_iUxmR+Zetsow@mail.gmail.com>
Subject: Re: [PATCH 5/7] memory: renesas-rpc-if: Move resource acquisition to .probe()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Mark Brown <broonie@kernel.org>, MTD Maling List <linux-mtd@lists.infradead.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-spi <linux-spi@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_194859_134889_7E7809F9 
X-CRM114-Status: GOOD (  32.67  )
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

On Wed, Jun 29, 2022 at 8:26 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 29/06/2022 19:55, Geert Uytterhoeven wrote:
> > On Wed, Jun 29, 2022 at 7:44 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 27/06/2022 17:31, Geert Uytterhoeven wrote:
> >>> While the acquired resources are tied to the lifetime of the RPC-IF core
> >>> device (through the use of managed resource functions), the actual
> >>> resource acquisition is triggered from the HyperBus and SPI child
> >>> drivers.  Due to this mismatch, unbinding and rebinding the child
> >>> drivers manually fails with -EBUSY:
> >>>
> >>>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/unbind
> >>>     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/bind
> >>>     rpc-if ee200000.spi: can't request region for resource [mem 0xee200000-0xee2001ff]
> >>>     rpc-if-hyperflash: probe of rpc-if-hyperflash failed with error -16
> >>>
> >>> Fix this by moving all resource acquisition to the core driver's probe
> >>> routine.
> >>>
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >> This looks like a fix, so how about putting it as first in the series,
> >> so backporting is easy/automatic?
> >
> > Unfortunately that is not as simple as it sounds, as this really
> > depends on patch 4.
>
> You sure? Except rebasing I don't see that. rpcif_sw_init() received the
> rpcif so it had access to all fields.

Yes I am, don't be misguided by the name of the local variable.
The rpcif structure is allocated by the HF or SPI child driver,
and thus not available in the RPC core driver's .probe() function.
The rpc_priv structure (as of patch 4) is allocated by the RPC core driver.

> > I agree patches 1-3 could be moved later, if you think it is worthwhile.
>
> This would not be enough, it has to be first patch to be backportable.

I can make it second? ;-)
Note that that still precludes (easily) backporting s2ram support.

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
