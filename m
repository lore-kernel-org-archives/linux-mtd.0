Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E27C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 11:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4/u0TQ6Vdtmx/fw/VoHKlK6wtq51YyDxeYJkTB2Sbg4=; b=H4AuFKO+karTQu
	ODruPjUUY657pHDuZiN5/Zs+QIjCUY1rqpKIIeLPfCVVx53kJ4z6hmkSUf5bIZwNou6mdS4a9S3oQ
	8UCfMcgqWY1VNqznfQtwva6Hu2+2UtVrZR0PLRTUmr6dGRFyHK1xjZbFi6P/kAxHFuqrVTSaeQWTP
	hNRB0lGg9EPu6lW9SfBv+faRnkQgdvXCVUWKd/pzARTKT4wi9T8ANZidm4+/16x0tucdfsze4Wy0m
	5qh5IhcWySJK90MQGRrlVYJ8jCQO6sxhbxHqMX7tmTpMLr5areEKgjKCW1msG3XDcCDzENqsQyNk3
	ymw1F/jB6nO4ln/JEhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nds9d-008fCi-RX; Mon, 11 Apr 2022 11:24:22 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nds8f-008eaq-Oq
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 11:23:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id p8so14315238pfh.8
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2022 04:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jLhdyx9SwFrbnM2p4JRIefCX4L9OXfhTOuUBWrvzHFY=;
 b=PMDpL7NeORJqEjVqbuLPqkMKb3G1lCabNtIimOppXj/xL0yehJks172PsFaJ933VCK
 usmqhMzGSewyE+XH0DUxZOLLkauDpL7S2Q1/HDPHcqSVQGDBMGqHzUJq1nNxxqv8XlDX
 5CzX6fNgbr0KPB/Vq5T3+8M3mSDk+S0o4IqO7y0Aa4ePxvojqI/gk4ZzhrhILHH8xj0U
 NQvhlMKyGszX9OnlouDpkb+pSO+148cSqUfNSvLOC2hTYtFkn5sIB8KrkbYrEeUZb0OM
 VkrUgp/n6aiPgGz0wyWQDOdwtczTyQH8VdIfkjQFNSqdz2pT2dSg/AUqS25MIN6jQKmZ
 hyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jLhdyx9SwFrbnM2p4JRIefCX4L9OXfhTOuUBWrvzHFY=;
 b=Lkgvr/Fs9pIbPtdd5ag0o0IYZDt0+nE7AQH9LrsM2AkbZXxIAPwhcx4gXc+tvHddLD
 uvOiCHWmuadbOYpn71KMx+BL0Z6YoqeXxk7rAcFYXf4IevFNvC41w4fLE+ccSfxQ8I+0
 vnlANNXcMa9TCRgEFP32p7XEtgTYUQ2JDLlDO6PS9G6u2dJYwCnX3APjexZy8uJm8urU
 xE5K5VJUyLecwZ3UgpOZm/Bw57Cy1QTH+yLqmRKTIs1tt3356Y9zlR3u9R6OFpCKqIUh
 Z60/gmy583zoojv0t5CBrH4DyZLFJI1fJUXNwXs0OXVQ1XvA/ySAT0v3fwc8pB/i5enY
 aqNw==
X-Gm-Message-State: AOAM532D3BMZLxb1HPnzg8+fHcB539TyQJz/7yUIKnBfCqKs8KCBDFFs
 mXfxhCLXAQTr8bUjcDxoua1+Vuj/NWG/UlEKfA==
X-Google-Smtp-Source: ABdhPJz7ply/vDvBKcwd3G2CJe3l8EYagqvloodWDAgbrda+wNFc971QiTJszHRFh6DxWRkxsVXlwQdifg7ah2Sg8xs=
X-Received: by 2002:a05:6a02:182:b0:374:5a57:cbf9 with SMTP id
 bj2-20020a056a02018200b003745a57cbf9mr25492959pgb.616.1649676198343; Mon, 11
 Apr 2022 04:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMhUBjn40pO7A=icudFKOoiMrckcH_o7mdi-uCmgCFHi6Ueuzw@mail.gmail.com>
 <20220411093715.4cecc280@xps13>
In-Reply-To: <20220411093715.4cecc280@xps13>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Mon, 11 Apr 2022 19:23:07 +0800
Message-ID: <CAMhUBj=HxPBg1GWF1z3E4zikZ-v9na_8_jCgtJ4d00rL-v8LfA@mail.gmail.com>
Subject: Re: [BUG] mtd: rawnand: denali_pci: page fault when probing fails
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_042321_851153_A289A53B 
X-CRM114-Status: GOOD (  16.97  )
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

On Mon, Apr 11, 2022 at 3:37 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Zheyu,
>
> zheyuma97@gmail.com wrote on Sun, 10 Apr 2022 22:17:35 +0800:
>
> > Hello,
> >
> > I found a bug in the denali_pci module.
> > When the driver fails to probe, we will get the following splat:
> >
> > [    4.472703] denali-nand-pci 0000:00:05.0: timeout while waiting for
> > irq 0x1000
> > [    4.474071] denali-nand-pci: probe of 0000:00:05.0 failed with error -5
> > [    4.473538] nand: No NAND device found
> > [    4.474068] BUG: unable to handle page fault for address:
> > ffffc90005000410
> > [    4.475169] #PF: supervisor write access in kernel mode
> > [    4.475579] #PF: error_code(0x0002) - not-present page
> > [    4.478362] RIP: 0010:iowrite32+0x9/0x50
> > [    4.486068] Call Trace:
> > [    4.486269]  <IRQ>
> > [    4.486443]  denali_isr+0x15b/0x300 [denali]
> > [    4.486788]  ? denali_direct_write+0x50/0x50 [denali]
> > [    4.487189]  __handle_irq_event_percpu+0x161/0x3b0
> > [    4.487571]  handle_irq_event+0x7d/0x1b0
> > [    4.487884]  handle_fasteoi_irq+0x2b0/0x770
> > [    4.488219]  __common_interrupt+0xc8/0x1b0
> > [    4.488549]  common_interrupt+0x9a/0xc0
> >
> > It seems that the driver unmap the memory region before disabling the irq.
>
> Thanks for the report! The mapping is done with devm_ helpers and so is
> the IRQ registration, so it's slightly more complicated that just
> moving a function call in the remove path, apparently. Would you mind
> investigating and proposing a patch?

I have proposed a patch for this issue, please correct me if I am wrong.

Thanks,
Zheyu Ma

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
