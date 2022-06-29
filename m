Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3320AC43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 17:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srSwotomp6RFuBHOlmV51x92JdhAWNpCmU1M4dxX67g=; b=mO7lyOFkBj4acG
	IOlhKPUJMTiEqTuTtzx/W155J6ujuMcnvPcY8I8DZxClthUp+0y8bocbCOsvSARd8B9NB61+446MO
	m2G/5kEMKIVojWk8n3kPbyQ26pNxIJl5XBgLJ28f+1YUWO1oVgLjfGRk67Re5f92xezkjRUK/8gD9
	omkz9eC7UktJfmlK1462S28lpZ64aXRrAepCGPeUx7c8/nqdxIL+9Q5OpyAiDfo8l7O+w6om6ZChe
	F/v08eMxkbqeL4wu3lMe2f0BjLTBBW6cwk4AwmitkXAgQV6yKvVnYbxl3W2OlyZwdbgKNz845Wsru
	TPeF5hqDgBL8KkgRKAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bup-00DIel-BJ; Wed, 29 Jun 2022 17:55:51 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6bum-00DIc8-2F
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 17:55:49 +0000
Received: by mail-qk1-f177.google.com with SMTP id c137so12618711qkg.5
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 10:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DzOAMNLdQF+lhggmTo9ureVMvFbgR7MbeRD6xA099wQ=;
        b=oUvEJ8e3uQ35e47fwJOTnczd1VR5BfvzwPXds5VnOTu+1UIhHcDCjV+Il5n9BpACUu
         uZcFf1+73GZsmjFX3uNnA6c6RUZXdaZAlcuKz0H+mG7wgN1OqAsZha6TKvYhFYlEx4PB
         tRDqNjUdPsWmqwgQTasb0ATiDzYlitsTlgedq2jXAq+PSu12bzvN1bzcAVwBLrdUJSQf
         gCmoM4cdtwOCk3J7MmGghXCQPTfJLzymFcg5Vqqx3F3ejmTlPHESATo57N6yH826g+tf
         pCxLYq7LKbxeV9PJckIARhkXPPSJExUPzxJEDTQ+fvAaEOfsiMK44wOjunS3c1HIcPKT
         4ZHw==
X-Gm-Message-State: AJIora92h+fFdTs8ePDi/6YI/QtucNG1iGRG6EZUXxHm/5ZKPF/h9h/D
	EyNouXgH/cV9XQsb3Pa5cNn5AbfHVYXfYA==
X-Google-Smtp-Source: AGRyM1s1iQ9neMziOFxmsqseLTLn8j/pTQzmVhD/HxSM2OroCCcf0X7kCGozvg81HJgw6jaXbnG2Pg==
X-Received: by 2002:ae9:f40b:0:b0:6ae:fdd7:1935 with SMTP id y11-20020ae9f40b000000b006aefdd71935mr3121541qkl.676.1656525344582;
        Wed, 29 Jun 2022 10:55:44 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id m15-20020a05620a290f00b006af51dcc65fsm4862561qkp.72.2022.06.29.10.55.43
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 10:55:43 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id d5so29324379yba.5
        for <linux-mtd@lists.infradead.org>; Wed, 29 Jun 2022 10:55:43 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr4890186ybb.202.1656525342858; Wed, 29
 Jun 2022 10:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656341824.git.geert+renesas@glider.be> <2fd9b9e3f60fe555d9dcad499c90e3ec869aa96e.1656341824.git.geert+renesas@glider.be>
 <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org>
In-Reply-To: <c65d6a94-b5c2-e2e4-6fdb-b7982d291e01@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Jun 2022 19:55:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
Message-ID: <CAMuHMdW=s42sfFwimizTsNjyKue+W9NasTOG0jgjkgkoKv3wfw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220629_105548_140081_D889A9A4 
X-CRM114-Status: GOOD (  25.46  )
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

On Wed, Jun 29, 2022 at 7:44 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 27/06/2022 17:31, Geert Uytterhoeven wrote:
> > While the acquired resources are tied to the lifetime of the RPC-IF core
> > device (through the use of managed resource functions), the actual
> > resource acquisition is triggered from the HyperBus and SPI child
> > drivers.  Due to this mismatch, unbinding and rebinding the child
> > drivers manually fails with -EBUSY:
> >
> >     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/unbind
> >     # echo rpc-if-hyperflash > /sys/bus/platform/drivers/rpc-if-hyperflash/bind
> >     rpc-if ee200000.spi: can't request region for resource [mem 0xee200000-0xee2001ff]
> >     rpc-if-hyperflash: probe of rpc-if-hyperflash failed with error -16
> >
> > Fix this by moving all resource acquisition to the core driver's probe
> > routine.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> This looks like a fix, so how about putting it as first in the series,
> so backporting is easy/automatic?

Unfortunately that is not as simple as it sounds, as this really
depends on patch 4.
I agree patches 1-3 could be moved later, if you think it is worthwhile.

> Plus a fixes tag?

It's been like that since forever.

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
