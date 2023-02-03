Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93110C61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6FWNEf9aG/gPgLRwkWG0FZ5LrspfesO87dLZrrVNY0=; b=DadzuvPHQdVNfv
	x7SXk1BYplySKgHz6I9jFX3zrepEhAlN6pArbadT0gTjtvu6iZWSmQjRmvYopOyPYiemqBPLQxWnB
	K+K4jPu/reivBs+tKm5rceqx1dI5/Npys74MZ+fvYNcvBaTKeKRlY/EQa52gpL9bVt0SYyqyQxLsl
	wse5eyCJTXHO2ZaLUN6XcYqkHFDJDfNtuIKRYDdxy09holdyGiW++A21gP8/5uSUtLOlzq0mtB5bN
	HWtbORiPOwAXIprs0Vfa1tNO1MaIoy2v4fPOQJfKxGUfdK+U4tt0vnSzGSX+WBkl7HsIfSnWKdqTI
	jhNoFyV/ZED10b66ukHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtNu-001PEB-9Z; Fri, 03 Feb 2023 10:33:34 +0000
Received: from mail-qt1-f169.google.com ([209.85.160.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtNp-001PCN-Po
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 10:33:32 +0000
Received: by mail-qt1-f169.google.com with SMTP id z5so4915819qtn.8
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 02:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7A9k4QSf8av6qzMk9PJKNV90s0Q4PXBSAXyaJlyJVU8=;
        b=cGCb/bTtLURkf/T5xzu9aMyMAuZbI4uWidU/vjL8YqG2MZTKJ6/jwRKadenLGpLZqi
         UrkHgXAZ4tkH+Nxy6d2bQcXSFTjFNtW8h8+TkGj+2KvIUd2pl/+/TMW0fOaS+bNGAxI2
         pfq5pVPvY8PZxT9zcLFFr+m24RZeyTku0xhDudAaikdKPIsMqPxFNXq1AnOJs+8GkgBx
         W/9pzogUJWMkdKPDJKRThZ6IcE6ixqzQRzTY7HKqIujVMgCm/b3Y0pQDxrGJBT/SopRH
         9H/h06OKyFJZ+smrphsyTbLCucRItf4+OhYdFMULbTbDoWIR9mm5LEMaQa4BzWVMS3gB
         iHeA==
X-Gm-Message-State: AO0yUKUQOdWrMhslpdvsWsNppBmXjOUoy6ZuQ2iSp7KGrMCBNBJ9VedH
	HHkp9Smbghvvoja4ASbkW0mbpUZsw9fprw==
X-Google-Smtp-Source: AK7set8vtqHbn3uORbRyYa7AO79/NWUYczP2TO/9ELdJl1uM3qzrHWNCCQA1O0M8vjXTN7gOVkH+RQ==
X-Received: by 2002:a05:622a:611:b0:3b8:6aa1:9398 with SMTP id z17-20020a05622a061100b003b86aa19398mr19072664qta.60.1675420407140;
        Fri, 03 Feb 2023 02:33:27 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 133-20020a37038b000000b0071dc769d5e7sm1563790qkd.56.2023.02.03.02.33.25
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:33:26 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id cf30so337048ybb.11
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 02:33:25 -0800 (PST)
X-Received: by 2002:a25:9c83:0:b0:7bf:d201:60cb with SMTP id
 y3-20020a259c83000000b007bfd20160cbmr900933ybo.365.1675420405273; Fri, 03 Feb
 2023 02:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230113062339.1909087-1-hch@lst.de> <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de> <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de> <afd056a95d21944db1dc0c9708f692dd1f7bb757.camel@physik.fu-berlin.de>
 <20230203083037.GA30738@lst.de> <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
In-Reply-To: <d10fe31b2af6cf4e03618f38ca9d3ca5c72601ed.camel@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Feb 2023 11:33:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
Message-ID: <CAMuHMdUitVfW088YOmqYm4kwbKwkwb22fAakHcu6boxv7dXDfQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230203_023329_853807_AC400600 
X-CRM114-Status: GOOD (  36.55  )
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

Hi Adrian,

On Fri, Feb 3, 2023 at 11:29 AM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On Fri, 2023-02-03 at 09:30 +0100, Christoph Hellwig wrote:
> > On Fri, Feb 03, 2023 at 09:24:46AM +0100, John Paul Adrian Glaubitz wrote:
> > > Since this is my very first time stepping up as a kernel maintainer, I was hoping
> > > to get some pointers on what to do to make this happen.
> > >
> > > So far, we have set up a new kernel tree and I have set up a local development and
> > > test environment for SH kernels using my SH7785LCR board as the target platform.
> > >
> > > Do I just need to send a patch asking to change the corresponding entry in the
> > > MAINTAINERS file?
> >
> > I'm not sure a there is a document, but:
> >
> >  - add the MAINTAINERS change to your tree
> >  - ask Stephen to get your tree included in linux-next
> >
> > then eventually send a pull request to Linus with all of that.  Make
> > sure it's been in linux-next for a while.
>
> OK, thanks for the pointers! Will try to get this done by next week.
>
> We're still discussing among SuperH developer community whether there will be a second
> maintainer, so please bear with us a few more days. I will collect patches in the
> meantime.

Thanks a lot!

If you need any help with process, setup, ... don't hesitate to ask
(on e.g. #renesas-soc on Libera).

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
