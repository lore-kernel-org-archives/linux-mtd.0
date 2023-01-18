Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE509C004D4
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jan 2023 07:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8A1UHvTfsenz5cKwANup4kAfuMfgA2up+BZGFTN7ac=; b=jAadnk63Su0JhI
	zBag+UgxQaeuaYhZydZHem40J4FlsuvUnSk7FVH47xjMJorvHfe5N5kQ5drwIRalTaGpRCsaWUusp
	/qmv0TmII6th3PcW0+ZGcUYFDXnaJ7Cj/gOgvzM0e4nCXNb2h9b9lOTustQv9XrVMXewhUadOKxw+
	Ch45s+slWiGzoodjJPfhMPy+q3mFxygqilYYMJwA6+wf0BU9uTXr9Rsz25R3PEzqRlmLTOriz3ldg
	3pPCzddeHvGJ53WsbKV1AtU9NK69aRKtQXKIFrvjzj60O/nt4EsS96JnI+9oFDKZMBvdXb4ENCkEO
	Yf6HZQDZ9EZuNmpgObbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3AG-00HKUM-Gb; Wed, 18 Jan 2023 07:47:20 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3AA-00HKRn-PY
	for linux-mtd@lists.infradead.org; Wed, 18 Jan 2023 07:47:17 +0000
Received: by mail-qt1-f179.google.com with SMTP id o5so8290832qtr.11
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 23:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckf5E8d0Cnw+micSJ5vxd9QO1KFnhxODfDAqVKF2Q0k=;
        b=rGDkIxKI+9vbW4ottx+h1c1kH5jZFWw/t9cyfRwFE5dRlZ7cBiXRUApi4PZyPZSR0Z
         qF88wKi7iClgaHQHsShcRkzbtwrwazDnsakfaVeZEygljJs3Bn8R/1w4TU3XXeNY4G5S
         RMfwF34UrrYAwLqkldSz+CjQ/pS/8XMu2B5YOFeUASAAcf95wpbrpGhiV9R2i278s0LP
         /EDLxL4uZJEG5cCtgXHyiCaJJbp02X8onIXQFaeArNLi1are655ALR42zcq9sgRYgMuO
         VOvXAp3Tt8Mpuk/Fm65421uv5IAeoHJpnVFuwSJDIPeknSz5pC5b0L8jpvns9sj3lFYp
         WHqQ==
X-Gm-Message-State: AFqh2kpkphHf3ZrZrfFZg5hxNlkZvrCy1PfS0BynMgW3+ORdIQQwtYRH
	ahqGjFunLHxFKgATtEQBsoxY5si+/hCGsA==
X-Google-Smtp-Source: AMrXdXvi8HndiafyCDx8olM7VjXageOy1IKw2j/FA1tayJ9ovZBywQhSHosCWtsODh1hYe6p6FK6Mw==
X-Received: by 2002:ac8:520e:0:b0:3b6:30b6:b894 with SMTP id r14-20020ac8520e000000b003b630b6b894mr7696169qtn.20.1674028032392;
        Tue, 17 Jan 2023 23:47:12 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id s18-20020a05620a255200b006eeb3165565sm21893332qko.80.2023.01.17.23.47.11
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 23:47:11 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-4d59d518505so287960227b3.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Jan 2023 23:47:11 -0800 (PST)
X-Received: by 2002:a81:bd6:0:b0:48d:1334:6e38 with SMTP id
 205-20020a810bd6000000b0048d13346e38mr726842ywl.316.1674028030903; Tue, 17
 Jan 2023 23:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de> <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com> <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
In-Reply-To: <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 08:46:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
Message-ID: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230117_234714_939363_F522116B 
X-CRM114-Status: GOOD (  33.20  )
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

On Wed, Jan 18, 2023 at 5:50 AM Rob Landley <rob@landley.net> wrote:
> On 1/17/23 14:26, Geert Uytterhoeven wrote:
> > On Tue, Jan 17, 2023 at 8:01 PM Rob Landley <rob@landley.net> wrote:
> >> I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
> >> really convenient: neither of my physical boards boot from SD card so replacing
> >> the kernel requires reflashing soldered in flash. (They'll net mount userspace
> >> but I haven't gotten either bootloader to net-boot a kernel.)
> >
> > On my landisk (with boots from CompactFLASH), I boot the original 2.6.22
> > kernel, and use kexec to boot-test each and every renesas-drivers
> > release.  Note that this requires both the original 2.6.22 kernel
> > and matching kexec-tools.
>
> I make it a point to run _current_ kernels in all my mkroot systems, including
> sh4. What I shipped was 6.1 is:
>
> # cat /proc/version
> Linux version 6.1.0 (landley@driftwood) (sh4-linux-musl-cc (GCC) 9.4.0, GNU ld
> (GNU Binutils) 2.33.1) #1 Tue Jan 10 16:32:07 CST 2023

I think you misunderstood: renesas-drivers releases[1] are current
kernels.

   Linux version 6.2.0-rc3-landisk-01864-g0c6453b3e5f6 (geert@rox)
(sh4-linux-gnu-gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0, GNU ld (GNU
Binutils for Ubuntu) 2.38) #125 Tue Jan 10 14:29:01 CET 2023

I use 2.6.22 and kexec as a boot loader for newer kernels, to avoid
juggling CF cards.  I cannot install a newer base kernel on the CF,
as kexec is broken upstream.

> > Apparently both upstreamed kernel and
> > kexec-tools support for SH are different, and incompatible with each
> > other, so you cannot kexec from a contemporary kernel.
>
> Sure you can. Using toybox's insmod and modprobe, anyway. (That's the target I
> tested those on... :)
>
> Haven't messed with signing or compression or anything yet, my insmod is just
> doing syscall(SYS_finit_module) and then falling back to SYS_init_module if that
> fails and either fd was 0 or errno was ENOSYS. (Don't ask me why
> SYS_finit_module doesn't work on stdin...)
>
> https://github.com/landley/toybox/blob/master/toys/other/insmod.c#L31
>
> https://landley.net/toybox/downloads/binaries/0.8.9/toybox-sh4

Again, I think you're talking about something different.
Does kexec work for you?

> > I tried working my way up from 2.6.22, but gave up around 2.6.29.
> > Probably I should do this with r2d and qemu instead ;-)
>
> I have current running there. I've had current running there for years. Config
> attached...
>
> > Both r2d and landisk are SH7751.
>
> Cool. Shouldn't be hard to get landisk running current then.

Current kernels work fine on landisk with an old Debian userspace
on CF.  The 8139cp driver is a bit flaky: last time I tried nfsroot,
that didn't work well.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git

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
