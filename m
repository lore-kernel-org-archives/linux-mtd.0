Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71979C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 18:11:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6B321855
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 18:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dN5kNCoe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6B321855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MU4Dk145wnPA2D5auu+5j3GaUyOVktHua7Tuq8g55mU=; b=dN5kNCoejCRL3I
	6G7exl1lwrzin+kUtcI4HlWITkGXDe1kMhbGPaZHAT8dfbmuZu0CJafsMHQASVlJp+iWmhSg+kUlI
	Bzzw3ywEzv4n0CK5Gd+gbgZ1+knnm79QtC4DbMyEvSVsu0gfFbMLBgxG21wVTiQZAXtU22KiAPcYt
	bFRhYwyH9LlxwOkd9kYwofA20l6VI9nQ2EaZtQ7T2UUCuWd5PChrzRGgVM+oCiK76izz/qp2qbZJV
	JbKgjrBXg5f/cMQ6ohgE+KgakxjlHb36/SfHbPGRPhe6phgni7Tn3gOZPdXZEGtW6d/+xIQTGYkVa
	igBZ5tRYuzKJgTE1XzEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmMza-0005zb-Fq; Wed, 23 Jan 2019 18:11:14 +0000
Received: from mail-vs1-f68.google.com ([209.85.217.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmMzW-0005zA-UW
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 18:11:12 +0000
Received: by mail-vs1-f68.google.com with SMTP id t17so1864378vsc.8
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2019 10:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lar/7CirLLuwgN7QjrkipPVg9UnJ8H/ir6GU33xHxvc=;
 b=lAJUWsk3FJijoKzVf//+tuz0LG/FVBpeSWNdi/1wJrh527dG4xj+fxQ3EpiwI5jUB+
 w68JlkB878cFAveTH9hGclU6gCnpNJMkLM+dWtx3131mq4JYmWL5lADgao+Kecr1/koc
 jDwf7GaKIrYkcvRHlRmT6B/wySz/ahlP+bJsnTQg0b87YvaZ8JT8AjZOIZKVmNplEYuZ
 l1luZn8hoCeUzxBuy13jCQo8352koeaI4X5dR4DQ8vBrCp8idlmsgY918xOlLm12pI69
 McT3LWiuilCqkCzqZZR9ldRvlbfgSifiq8kXsU4yEMBrI4d88mEIbcTJlL1gZYbjLpdH
 7Jlg==
X-Gm-Message-State: AJcUukddyN0hFJAjYjZiWfpKHRH3uSqdC1giqweMJ8B+w+yFNQOtLCpu
 hSo/NF7/VyPdlXxBXK9uBXydyl1BmFuVSv1ok/0=
X-Google-Smtp-Source: ALg8bN5566f0rXYuWl8e+cbAWmCn2WrWy84SUq0jLilszABY0OIU5GtWW6UAvSB0/TmF3OC/VqRb1bqwrHUqG4Muya4=
X-Received: by 2002:a67:c202:: with SMTP id i2mr1277005vsj.11.1548267069275;
 Wed, 23 Jan 2019 10:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20190118140525.29189-1-geert+renesas@glider.be>
 <20190118230740.44239fcf@bbrezillon>
In-Reply-To: <20190118230740.44239fcf@bbrezillon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Jan 2019 19:10:56 +0100
Message-ID: <CAMuHMdUWqcB7cTOenASWt6HXZhGsr9cH9B55Sh-+rmWmAkm4Fg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] eeprom: at25: SPI transfer improvements
To: Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_101110_986830_23580FB0 
X-CRM114-Status: GOOD (  17.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Nguyen An Hoan <na-hoan@jinso.co.jp>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On Fri, Jan 18, 2019 at 11:07 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> On Fri, 18 Jan 2019 15:05:23 +0100
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > This patch series contains two improvements for the AT25 SPI EEPROM
> > driver, related to SPI transfers.
> >
> > Changes compared to v1:
> >   - Merge "off" and "offset" into a single variable instead of just
> >     killing the cast, as suggested by Arnd,
> >   - Add Acked-by,
> >   - Dropped "[PATCH 3/3] eeprom: at25: Split writes in two SPI transfers
> >     to optimize DMA", as this is better implemented in the SPI
> >     controller driver (cfr. e.g. "[v2 PATCH 2/2] spi: sh-msiof: Use DMA
> >     if possible",
> >     https://lore.kernel.org/linux-renesas-soc/1547803771-9564-2-git-send-email-na-hoan@jinso.co.jp/)
> >
> > Tested on a Renesas Ebisu development board with R-Car E3 using MSIOF
> > and a 25LC040 EEPROM.
>
> Did you consider converting this driver to spimem? Looks like the
> protocol used to communicate with the memory resembles the one used on
> SPI NANDs/NORs and fits pretty well in the spi_mem_op representation.

No, I hadn't considered doing that ;-)

> By doing this conversion you'd allow people to connect an AT25 EEPROM
> to an advanced SPI controller that does not support regular SPI
> transfers and you wouldn't have to forge SPI messages manually.
>
> Here is a patch (only compile tested) doing that. The diffstat is not in
> favor of this conversion, but I find the resulting code cleaner and more
> future proof.

Thanks, will give it a try, eventually...

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
