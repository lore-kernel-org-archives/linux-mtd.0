Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A03BC54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YopXDZX3nU4ZpVAJGsCaudWD9P77CbLuwdrJDMLR+6s=; b=PnWwfAWPmF+n3q
	JEGsQFlRuGs49wyTCJisNv94jpAbFz/d2ricLvTKvB2VCZSdFBW/lfYEyDWH52uaR+PwpPA3MW+F3
	44sD3aqfEzAC/VXgOIGcolBkm7wimMkBZsRwnO2VM9LhP1vx3xvgCGUKYMLAyhuOg4QeZyaCa7SSI
	hDBXPe3T5LocgEvBfBcUO1MKO0HyTIg3QMt0l8dkU72njncxHw1dlNqRaoGfNuUdCFy4rl0sX0UoM
	Lvbt/u44BEg2BvCLG17/3nVsLRQyKDQUt1dX9ugkPyMhS/scVQKu5ez1Wdv6WChoUGYv+l3t9+jG0
	VitG3oqItYvBFrP+w27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFOb-001DnH-Th; Fri, 13 Jan 2023 08:26:42 +0000
Received: from mail-qt1-f181.google.com ([209.85.160.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFOW-001Dki-T8
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:26:39 +0000
Received: by mail-qt1-f181.google.com with SMTP id a25so11387577qto.10
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGwwX1FWc34aVprY9nV8lSjSaarIXrtB/QPl3dMA44o=;
        b=N79uNMtFu/VeDENo6HTg1j6Yo2CrruVZUeTKbUXE2RmUKVfCKnusK/RFn52mYNFgov
         csltoG3tC8TnkpeRez5EInlIYvih7hhcH9i+fsPlmqjK94MquYdB82bdFn4LNQwl7aiq
         O+246nM5SMl30pQOR3cb4gvixfkdFhh9lYkMV4JECjo11WWm9Wirpq+doeLITAlyduze
         rcndJrTyGG52yq1QQ1w8KNOLELVHLZC87hwq4hcsOSy/iY/hGavDfW/UgZvUBZE9V5cY
         fIBbHCb9bWqz7HVwvBa6ie1kN38LtZvjl17O5ulFmrFWm0AAjZGkLEnSMh0xlmTV7k0E
         CvsQ==
X-Gm-Message-State: AFqh2kqVBZokauBR6QVev2erW43uoGtHmQNX57izhVIkqZm+96DAQZP7
	qO3z5T5UM6pRBXMpPWh+ab4lY6D0W3a5gQ==
X-Google-Smtp-Source: AMrXdXsY3CxUdJrGMirDKiNkU27+pnve4KlhBU0AdjkCiRF3J5oIcz94SVsDNY+pvdA9P1yEUzvASg==
X-Received: by 2002:ac8:45c8:0:b0:3a8:5d1:aaca with SMTP id e8-20020ac845c8000000b003a805d1aacamr19422201qto.11.1673598395637;
        Fri, 13 Jan 2023 00:26:35 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id a22-20020a05620a103600b006fbaf9c1b70sm12104641qkk.133.2023.01.13.00.26.35
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:26:35 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id e76so21520201ybh.11
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 00:26:35 -0800 (PST)
X-Received: by 2002:a25:7:0:b0:7c1:b2e9:7e71 with SMTP id 7-20020a250007000000b007c1b2e97e71mr830819yba.604.1673598394939;
 Fri, 13 Jan 2023 00:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
In-Reply-To: <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jan 2023 09:26:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
Message-ID: <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
Subject: Re: remove arch/sh
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Christoph Hellwig <hch@lst.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
X-CRM114-CacheID: sfid-20230113_002637_905441_CE23F0C6 
X-CRM114-Status: GOOD (  23.61  )
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

On Fri, Jan 13, 2023 at 9:10 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/13/23 07:23, Christoph Hellwig wrote:
> > arch/sh has been a long drag because it supports a lot of SOCs, and most
> > of them haven't even been converted to device tree infrastructure.  These
> > SOCs are generally obsolete as well, and all of the support has been barely
> > maintained for almost 10 years, and not at all for more than 1 year.
> >
> > Drop arch/sh and everything that depends on it.
>
> I'm still maintaining and using this port in Debian.
>
> It's a bit disappointing that people keep hammering on it. It works fine for me.

Indeed.  The main issue is not the lack of people sending patches and
fixes, but those patches never being applied by the maintainers.
Perhaps someone is willing to stand up to take over maintainership?

Thanks!

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
