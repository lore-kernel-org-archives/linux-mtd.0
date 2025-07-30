Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B37EC87FCB
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jul 2025 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kgMcKfqsS6AzYVhvAWbOivGtx7xHE+0Z+fUAz0Us61k=; b=oZH2p0ytqWfpOT
	8R4UTMk+SVJuUQhadB2Smm2Yj2vHXpKE6QJ0au6Q9Ws5XUXv9IMD0Ar2TkVB+2+EZgxJp2x3c6zZt
	bjuZr9wrxtenC4M/bsnkqbptR/Zer2diczK2E9/KWb4p97HiXDDH0I2v5x2NdFt8KGjtCdDzppr9s
	t5K1vlgShiEfC+9NTbMyNMGWlggxHa1frgvg9Gz2I2uBeyU3XXNrBwfn9SiTt7y0BO9u/K0cWzKhi
	E99U4K6HBZs62104gubEYaE5QoaLPqq64+g3u9oAaFusMMha5+pa20f0EWquHsuXY+RFmOUf+Yzj1
	efYMDnIVOFeK0kDZm4Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh5jZ-00000001QZe-3f17;
	Wed, 30 Jul 2025 12:16:37 +0000
Received: from mail-vs1-f42.google.com ([209.85.217.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh4fX-00000001JFV-0n5Z
	for linux-mtd@lists.infradead.org;
	Wed, 30 Jul 2025 11:08:24 +0000
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4fbf83972d4so118614137.1
        for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2025 04:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753873702; x=1754478502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahUCMop3bpKiOm+Wykn3VajG+gXKSw9MPNL+inB7AHI=;
        b=KHbmSh+4Ru4H43pnjj/3A0/b3C0xynkIwvm1GBZVTZObX0TB88wAoprJgZGDuY88lN
         7l/Mgz6TS1zJ3QRVtAPIHahdqJW4pj150WuWiyzdPBSev1exPSpznqWVp14Z02Bq3GJ2
         9wvlIAeXYO8Va3Gb38sTOcMw04QTQmvMMs0ohAay6aSLL9QjmI9kQhbItudsN8k3jlGM
         rlqvGcIFJ855U7lEFtkUnvpyqVU/XWEZ/pmDFmBcu8ynQLvyrc4a+Bo2FPQy9xzU+5pO
         yq4t1EsVkaQ8oynrA0m0oMmboldIoWyjKesgMIuGyqg4rpuqrpdeBV64gkTXN9FExAGi
         Lztg==
X-Forwarded-Encrypted: i=1; AJvYcCVBiMiv1TGvJRwXIavHdZ6UbwH1m/ineNaoRiDNMWIQL1X+4e+AS9dQc/wnAzHb9UxB4OzE0KcWdUs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yznv5QKl3PB/sUR+2zkoYDqjgKRy+BQcwSHUTn5Mi06QTBsuL7T
	yZK3kNNLkSDOvUml9xkhtQt04+4CXtnhqhdiLa49Zgjy3JPaeQgvk9Gei6cD1gG0
X-Gm-Gg: ASbGnct/078Nvq0MzUorK7djSv4ON6SnhY9gKhCHaTGHD3xXkZY7jgGYQU40QHID7AG
	idc5b+e4cRP8InoxomUXRu5bqusmY20NkOMASiF5qb03aD9u1n9z3og+G0lYxU551t1WUmaWhO4
	MZid79JLCApIU389Br1SB8h1pLA1ptGJEvC9fRJ1m2auAaJ1Gu6uj8fyj2aU9uATe/6UCWKkbO0
	xQ20IFlPnOMrukl2HvAnOo2Ip3pZ479amr3wAgWczrPPCqS/esxAdSVspdqnpPd502+HZGTg2bg
	rKxRl64lkCA3PiSUoXid2DJC97q6yDElq9CRB66L+PeTYH2avuVT+OZBtaMG4Z26GleDOn5cOyH
	2lyJ3iYvfyNEX3QEfDLhq3YwLIAmGDhk6DzoN/JIAnLH3BRxk5MMpxJMgHYJimQOv
X-Google-Smtp-Source: AGHT+IGN7nUKF+iYUHIZDYvdUgDaiEkx6aoJ54E4pcY9B4JmG0CcbgyPqnPWPttIrFtxw7H7a9xCig==
X-Received: by 2002:a05:6102:509f:b0:4dd:b037:d239 with SMTP id ada2fe7eead31-4fbe8779cbamr1528121137.14.1753873701534;
        Wed, 30 Jul 2025 04:08:21 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4fa46d0745fsm1986872137.5.2025.07.30.04.08.21
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 04:08:21 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-539207d70daso271122e0c.2
        for <linux-mtd@lists.infradead.org>; Wed, 30 Jul 2025 04:08:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzcPcTOe/lNJ97RepLoBzDgnMDFsqgjGRlRxOJMPpT8eM9FNwndLMHQGiEleIVtoUoa93TlI/cQr0=@lists.infradead.org
X-Received: by 2002:a05:6102:3c89:b0:4e9:92d3:d20 with SMTP id
 ada2fe7eead31-4fbe7f213d2mr1535475137.4.1753873700890; Wed, 30 Jul 2025
 04:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <07f67ab8ee78f6bf2559131e193381aafff7479a.1753870424.git.geert+renesas@glider.be>
 <d947168fd02d6f820159b456099e6aa8f465b633@intel.com>
In-Reply-To: <d947168fd02d6f820159b456099e6aa8f465b633@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 13:08:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJF6V4v1+zbKKG1A_UvHUXU-ySXe7Xj_ryZtRnk2B2nQ@mail.gmail.com>
X-Gm-Features: Ac12FXxXSRSoyCnpPN-TGOuCCRieREZmYvROY3pFS74W6252E9pQuxR7Z8LUGgU
Message-ID: <CAMuHMdUJF6V4v1+zbKKG1A_UvHUXU-ySXe7Xj_ryZtRnk2B2nQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: MTD_INTEL_DG should depend on DRM_I915 or DRM_XE
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tomas Winkler <tomasw@gmail.com>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Raag Jadav <raag.jadav@intel.com>, linux-mtd@lists.infradead.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_040823_223025_464A20BF 
X-CRM114-Status: GOOD (  30.19  )
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

Hi Jani,

On Wed, 30 Jul 2025 at 12:32, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 30 Jul 2025, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Intel Discrete Graphics non-volatile memory is onlt present on intel
> > discrete graphics devices, and its auxiliary device is instantiated by
> > the Intel i915 and Xe2 DRM drivers.  Hence add dependencies on DRM_I915
> > and DRM_XE, to prevent asking the user about this driver when
> > configuring a kernel without Intel graphics support.
> >
> > Fixes: ceb5ab3cb6463795 ("mtd: add driver for intel graphics non-volatile memory device")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  drivers/mtd/devices/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
> > index 46cebde79f34b0b7..f0ab74d695347117 100644
> > --- a/drivers/mtd/devices/Kconfig
> > +++ b/drivers/mtd/devices/Kconfig
> > @@ -185,8 +185,8 @@ config MTD_POWERNV_FLASH
> >
> >  config MTD_INTEL_DG
> >       tristate "Intel Discrete Graphics non-volatile memory driver"
> > -     depends on AUXILIARY_BUS
> > -     depends on MTD
> > +     depends on AUXILIARY_BUS && MTD
> > +     depends on DRM_I915 || DRM_XE || COMPILE_TEST
>
> I understand the intent, but IIUC auxiliary bus usage should not require
> a "depends on" relationship. Couldn't you have MTD_INTEL_DG=y and
> DRM_I915=m just fine?

That is indeed a good point!

What about

    depends on DRM_I915!=n || DRM_XE!=n || COMPILE_TEST

instead?

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
