Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C44C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FpjJEbAELWksr/qsMVD1h9shrL4YcXB9hZnk2aiJ6ek=; b=tEHKTARsGkjdKw
	zHvpdBIznDZMRpS41eZmN3ltN8Kb6uCUmv5RFe9oGIpU086wXTTr0yFzB5pjI+ry3X5unDHPkh+up
	NIYesJuwpGreJj/QY1af/LihWgyxy4xYJkNj1Kx86TRsVGQcvrZDq9M8/GPDx8aO3M2PZtbUJTypj
	60BfRVWH0AYYDAc6WbKicCIbIRI8n/bHyIhU/Agx7EP3PyMogZLFEylTLiJgf67hB3h8rUPLLfjnr
	hRQBnO2lvU5buzyT/0aEBJttcHv5hqenIaySNlEu08zUAidi9yFua14zjvN64FTz94wWMyM2OrPu+
	RqUtWsUa/R8KICYn8fxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNyYn-002rOa-4j; Fri, 03 Feb 2023 16:05:09 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNyYj-002rLX-2n
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 16:05:06 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-4ff1fa82bbbso74000337b3.10
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 08:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wIYdPVdo9w8wJeFawgcWpGlCHgpXqP0aU2proD/z4A=;
        b=7Zyh3Mc0zGwZCrqMfFMUlMoRzCYlz6wiZ9WKXtOB6STHJcm+mG4ry2XYhxHml1wtF9
         FOmCnj1pumwpbUrzScqbBvidnF3tinCj0KCxz9uFS37gcXMMQJCzgeJTJFX63ZNAsxAC
         WcuhPvyNN/o0DMM3XltAsqST0N97PaAVMKJoE3rPTOSYRlvxdJiWzBRfRLcAzu5OVQ5x
         cPdZMAlZ7KP/fErVaVwOvE6jFFvddKYDFjBgO8A6/pp7QngCW5IoVtjiX/2tRDlNjeep
         A2/sOV+pSHOgp2kBRYLFQxY2orDOOhKW4HRp3ALA+yAsrbOYALW2FPgpEt+MzK2ZaHWK
         4aUg==
X-Gm-Message-State: AO0yUKVJOAeq3K+xz9c1t5E84BNEsgzHyO2rznHSYe05ii+XsszgZWdE
	ogFXiogqWcPtSd3tb/VRY73U/r98Ekxz2w==
X-Google-Smtp-Source: AK7set+C4a0N7Lcf7I6pW9lnWVbyJ0Bh7IcPZ6/SVEeb9FWtwoX4FwGx1KnabKqB67nE5ziy7NoC9w==
X-Received: by 2002:a81:af0e:0:b0:526:7b97:2359 with SMTP id n14-20020a81af0e000000b005267b972359mr877717ywh.46.1675440302740;
        Fri, 03 Feb 2023 08:05:02 -0800 (PST)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id dz5-20020a05620a2b8500b006fc3fa1f589sm1988748qkb.114.2023.02.03.08.05.01
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 08:05:02 -0800 (PST)
Received: by mail-yb1-f181.google.com with SMTP id 123so6784978ybv.6
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 08:05:01 -0800 (PST)
X-Received: by 2002:a5b:941:0:b0:865:e214:f4e3 with SMTP id
 x1-20020a5b0941000000b00865e214f4e3mr352487ybq.604.1675440301482; Fri, 03 Feb
 2023 08:05:01 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de> <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de> <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de> <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
 <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com> <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
In-Reply-To: <f6a60193-a5d1-c42c-158a-4b0bfe9c7538@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 17:04:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJ3XOBewDoU8umAHc6b83hJQge5xjY3Cxx03AvoiR7iQ@mail.gmail.com>
Message-ID: <CAMuHMdWJ3XOBewDoU8umAHc6b83hJQge5xjY3Cxx03AvoiR7iQ@mail.gmail.com>
Subject: Re: remove arch/sh
To: Randy Dunlap <rdunlap@infradead.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Christoph Hellwig <hch@lst.de>, 
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
X-CRM114-CacheID: sfid-20230203_080505_146439_F0B55C90 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Randy,

On Fri, Feb 3, 2023 at 4:57 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> Is this "sh64" still accurate and applicable? from Documentation/kbuild/kbuild.rst:
>
> But some architectures such as x86 and sparc have aliases.
>
> - x86: i386 for 32 bit, x86_64 for 64 bit
> - sh: sh for 32 bit, sh64 for 64 bit <<<<<<<<<<<<<<<
> - sparc: sparc32 for 32 bit, sparc64 for 64 bit

No, support for sh64 was removed in commit 37744feebc086908
("sh: remove sh5 support") in v5.8.

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
