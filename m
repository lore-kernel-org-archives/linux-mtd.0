Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30311C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoVV91OmTqx7Haui/fbqc1PMs1t0H54blEIRZfqAtUk=; b=WBmkIjOVF3Zdum
	Kf8p437crdnhZ9DbGNg9m9jGWiYIMrRWU/sgFNufTu684/q/GYYZbkTK+7pbl3hqYBFQe97k6Qs/p
	Hh7xfjtrneJjY18yiutqRaQb52BIG71zjdioE2esUdTVqVfCsKfRgiCpuJdO6m91kLhtvFdq8Ts9u
	++K18bo/QhpAU6E3BkWX7lgWolqbnESclx7WTgfBt/EBOa5+gIV8zP+XAYyDnokzi4/v5D2lIYn6X
	UgSf6rdXCGOWTT4mjfZkDL/WoI314jS/6ii10iK5065+edQXhn5Pq8TfE5WBXNGOkqFuJR5QPXsUy
	KSs8Tg+HgJXN6UA55vYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhYkZ-00E0ni-5j; Thu, 21 Apr 2022 15:29:43 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhYkI-00E0fb-Tz; Thu, 21 Apr 2022 15:29:29 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M5xDJ-1noPZC36fj-007RXr; Thu, 21 Apr 2022 17:29:21 +0200
Received: by mail-wr1-f52.google.com with SMTP id t6so3776791wra.4;
 Thu, 21 Apr 2022 08:29:19 -0700 (PDT)
X-Gm-Message-State: AOAM533E+ta4mP/r3CWgP/5bpPzqZMA0fsQbRopujQgfhkWdYLMAyB1a
 CG4rriH3XqQ8qTTsDpMQl8OLoumkghSoOxiNjQE=
X-Google-Smtp-Source: ABdhPJxKpospiPlAgrLUewrHWmh0snRbQc7E1OFrJMr7NkFWoVWNdjC/+qxZuhyVxJOjyOGXkiqrvZW6ZgPa03gRamE=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr199757wrz.219.1650554959163; Thu, 21 Apr
 2022 08:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220419163810.2118169-1-arnd@kernel.org>
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Apr 2022 17:29:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1s_8_hfZdFN9-H_PoCMQSjhYcaS3peDqc7LWBUj_YqbA@mail.gmail.com>
Message-ID: <CAK8P3a1s_8_hfZdFN9-H_PoCMQSjhYcaS3peDqc7LWBUj_YqbA@mail.gmail.com>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
To: Robert Jarzmik <robert.jarzmik@free.fr>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>, 
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, 
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 linux-leds@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, linux-rtc@vger.kernel.org, 
 USB list <linux-usb@vger.kernel.org>, 
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-Provags-ID: V03:K1:fNCciJ7x4XH3kqV46MntJi1RjKnTonaM7HjEySsZUiKPSb6Y1qV
 oJKaGSH1W4OJdFuKn4pwkPrsvr1XkhcWPnWvvw2xuqv25zd/Q6eJGLC/WmnMYTe9VKT89qO
 iERRQwjsyHLHP9pjxOqZLO+qS6YQ7tHhKUnvaYkw7HSDw2Lahx00wmrcbkP1zcz0RSotKlh
 i9bsFYpUsZc26XHvNwUOA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bjf9onponS8=:LX649i1noBL3/bXn720TWr
 4c1DrDiKQnfolb81GZPZIfkbnECVm6jNAzh4btOWTC6nS2xCBO2c/bUAopbDh8xK4C1W1hUsB
 CkCr8awRA1fqmgGmgYAkxcu97x0ktA3Y4C4xINnzqvnj0ZOQUmeleLoUHZhBVGAVS3R1SFfZ5
 YFtReY/tKHfq6s7htL8cBuMeZMxc+cjzx+2cekjnwoXi2061Tx+mhY3S8Wvb+eS9WMisFbMNO
 mAcRJrIL9RzI8qdjSYHEYYB2fX4xH0w8r8CpFdU4teq5EMqFSHV2kCBju3UffVDP4R7jBo/ZI
 FUzDC8S5CvN9ntyHO3ZU1irOZFuMwe3YlyDsXSochFjkOo8WIEwTSb0xIkv6XR59Tj3yu48od
 Q0xHk0NKb/BuMuRY4s9xIbKBRvi64MVC7zG48Mk5ow2ci4Jbfb2dxvJ7aWoPARmzcuiXR6/yD
 BmrNo6TBNMYp6MaGP5nxe7HJP2cDl45Bb/oEnIxQH10jRRW13EV7oq/rVQDlLiIZG8BdpSzHi
 I+spMd4K6UTYXgn/AdWxNkvmmRCK7F2J2Qxon/VVIf+hGAnYQCFnnBe6/Bg91LSTFdvIlhjDZ
 yqhe9LFOO59bkrZSr6SYToTUTex34+48DrAa/0DhJLsJsCbQ1/f9pztueY+0IESSjJo6GzLUS
 R/Wte3qsrPikdI+uFcxu0c80kXqV0H8ImEAWlEs9Z6Ec105E2Kc1lPLDTDakLoMxZQLfbQdMr
 +NMsK4P2jTMik0ZsSFYXbImw5PccLUt0YkjkvfBbwQF4Q93G9IPSw/2weoS4sr3VhKvyFXiH/
 0M8k8+kleM38LaIWtkc1BUlJpVPcqgzyStu66PUuc5dENY5tiE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_082927_273999_3BF5D93D 
X-CRM114-Status: GOOD (  24.84  )
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

On Tue, Apr 19, 2022 at 6:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This revisits a series I sent a few years ago:
>
> https://lore.kernel.org/lkml/20191018154052.1276506-1-arnd@arndb.de/
>
> All the other ARMv5 conversions are under way now, with
> OMAP1 being the only one still not in linux-next yet,
> and PXA completing the set.
>
> Most of the patches are unchanged from before, furtunately
> the PXA code is fairly stable. I addressed Robert's comments,
> pulled in two patches from Dmitry, and added the last a the
> final four patches to finish off the multiplatform conversion.
>
> I hope someone is left to test these on PXA: if this works,
> I'd like to merge it for 5.19. A git tree with these is available
> for testing at
>
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=pxa-multiplatform-5.18

I have updated the branch based on the feedback I got, and
done a preliminary merge into the for-next branch, so this work
should show up in linux-next. I expect to rebase this particular
branch before the merge window, to add further Acks or
fix regressions in place. (I don't do this for the other branches).

Let me know if there are any show-stoppers or patches that need
more work. I realize that this is a lot to review and that there is
limited reviewer bandwidth as most of the original developers
have moved on from PXA a long time ago.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
