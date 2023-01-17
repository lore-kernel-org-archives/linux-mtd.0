Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C07C3DA78
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Jan 2023 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTLfzUHfzF0xDfASo6YNoohdgu808XDszR9y1oNPR30=; b=qDDp2fattjws9w
	XYerdK4GNaLXKXqVVIISZf/NTbVbIDc2UNod0HEABqOOXQ/Xxe1FpITs2at6FFK22YS62CQfQEK3R
	dp9SiS8DnzgFrAXbxeLaWkOGXZtjtrcrZY+AgRDiuU/xTe+P/dfXDKVwTGhFAgyg0AIvulvHxtBlT
	Oi022j1g6vBMQqTDzngvI/VdHbzEZwlrJ/rwG9oNoZB7fTmvLbs98w8c9P/DENri8lIWO31ko7GG/
	+JVabanxVYIC8ni71gH5guniazh5jo3ENeAwnRIZSkjhEwWoC3oJ21U8l/h5WaINOJyopvc0spYzj
	yWw+XJ595rQNzi7dLqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHsXe-00FlKw-LN; Tue, 17 Jan 2023 20:26:46 +0000
Received: from mail-qv1-f46.google.com ([209.85.219.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHsXb-00FlK4-6q
	for linux-mtd@lists.infradead.org; Tue, 17 Jan 2023 20:26:44 +0000
Received: by mail-qv1-f46.google.com with SMTP id i12so22398381qvs.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 12:26:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rC0mNjXax5vqLz2OAo+EH0y+cJfjyIAm7sm9u5PvgQ=;
        b=fAMAklJ4AMICevAFQHxj8aOvnfULzB9s4Pq/PTBT57PzyPmJtPS2xxOGnRZqTpSYop
         QshG8I+uOykl0yCCUDeigh6bXe8HI3iVDAjcKwZfSSlr3KKUEzAaSGQGdySH8MKUVoO1
         eEfnDL+IKom+TPGWiGIVz8D9uxhgHRTUH99AcNYr82nLewmscloxY7+vMD5j3otQpd/S
         1a9Y7WcunMjwtj+bcI7beapKZUl5b5FmhKXk/x8ONrKL1foEfGGWtC43aVGzAa1N6HNC
         Wt0r28ieYD/U6rOi4dQjkymm2bQXgdn44xiBKPoYCXnnjHo2xhbo3WAUFc9sknzIbweN
         tOFg==
X-Gm-Message-State: AFqh2kpf3bXRqfgRFB53+fc909FmpULfv+06+CmHKlA+nk/ux4isv69Z
	Fl+ufbtuGs9VcwOeSTlBv8FzSxdfeE6ryg==
X-Google-Smtp-Source: AMrXdXupdhDUTTrHvG5heRhGYiCXMj+0Bx3zl29SM6IbXXxKHx54UztWnpzB/19y3Zt/a5WLd7QlEA==
X-Received: by 2002:a05:6214:2622:b0:532:c1dc:61ff with SMTP id gv2-20020a056214262200b00532c1dc61ffmr9463786qvb.39.1673987200692;
        Tue, 17 Jan 2023 12:26:40 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id bs14-20020a05620a470e00b006b95b0a714esm234210qkb.17.2023.01.17.12.26.39
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:26:40 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id e130so6069844yba.7
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 12:26:39 -0800 (PST)
X-Received: by 2002:a25:9012:0:b0:7b8:a0b8:f7ec with SMTP id
 s18-20020a259012000000b007b8a0b8f7ecmr707665ybl.36.1673987199250; Tue, 17 Jan
 2023 12:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de> <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
In-Reply-To: <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 21:26:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
Message-ID: <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
Subject: Re: remove arch/sh
To: Rob Landley <rob@landley.net>
Cc: Christoph Hellwig <hch@lst.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-sh@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_122643_269343_1EF5D97B 
X-CRM114-Status: GOOD (  36.20  )
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

Hi Rob,

On Tue, Jan 17, 2023 at 8:01 PM Rob Landley <rob@landley.net> wrote:
> On 1/16/23 01:13, Christoph Hellwig wrote:
> > On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
> >> I'm still maintaining and using this port in Debian.
> >>
> >> It's a bit disappointing that people keep hammering on it. It works fine for me.
> >
> > What platforms do you (or your users) use it on?
>
> 3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
> sh4 emulator.
>
> I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
> different kinds of boards running it here). There's an existing mmu version of
> j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
> released yet, I have yet to get that to run Linux because the mmu code would
> need adapting, but the most recent customer projects were on the existing nommu
> SOC, as was last year's ASIC work via sky130.

J4 still vaporware?

> My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
> little blue one is... sh4a I think? (It can run the same userspace, I haven't
> replaced that board's kernel since I got it, I think it's the type Glaubitz is
> using? It's mostly in case he had an issue I couldn't reproduce on different
> hardware, or if I spill something on my N40.)
>
> I also have a physical sh2 board on the shelf which I haven't touched in years
> (used to comparison test during j2 development, and then the j2 boards replaced it).
>
> I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
> really convenient: neither of my physical boards boot from SD card so replacing
> the kernel requires reflashing soldered in flash. (They'll net mount userspace
> but I haven't gotten either bootloader to net-boot a kernel.)

On my landisk (with boots from CompactFLASH), I boot the original 2.6.22
kernel, and use kexec to boot-test each and every renesas-drivers
release.  Note that this requires both the original 2.6.22 kernel
and matching kexec-tools.  Apparently both upstreamed kernel and
kexec-tools support for SH are different, and incompatible with each
other, so you cannot kexec from a contemporary kernel.
I tried working my way up from 2.6.22, but gave up around 2.6.29.
Probably I should do this with r2d and qemu instead ;-)

Both r2d and landisk are SH7751.

Probably SH7722/'23'24 (e.g. Migo-R and Ecovec boards) are also
worth keeping.  Most on-SoC blocks have drivers with DT support,
as they are shared with ARM.  So the hardest part is clock and
interrupt-controller support.
Unfortunately I no longer have access to the (remote) Migo-R.

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
