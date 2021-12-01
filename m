Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E013C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 13:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxYXsSZV9AkI3Kb8hUWICb9bt8FTFj50a+URaMM6sTU=; b=fNTw0WGzyujgHL
	okzq90/+3e2Zc0idWpU8hbu/MyQbfxxmZNoydcP/HcGtjBr9TF0tLAlV4QW6R9nev1FaucnbgBCce
	ebkVa6n5iBjk0xqoQVF7zp+NMcTZSRTt6YetVD8emU4EUwosKMHxf6wc/CSZO2mSUgreR8HraYUJ1
	Wx9Oqzox/uSbIKttS67jmA8JGckGbWqaVIrz9uaJK1zyRpIzDqjhUVFGYqFsmA2N6T+uyM1LLmrxL
	C4rdhPwlteKjw4dtUEMQeiToSp+dBQQcrB1yat6WKcXm60JKN2Ooz3evQozZ6K8fWLzsX7fEq3a6c
	fCkcxhihlCZHiLchqMPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msPNp-008loc-Us; Wed, 01 Dec 2021 13:10:50 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msPII-008fLs-QX
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 13:05:08 +0000
Received: by mail-ua1-f49.google.com with SMTP id l24so48879243uak.2
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 05:05:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSCANc5akMVyARPAGU2DAriDgbQMxgmWTdFVSgsUOA4=;
 b=mr6AMaQXjEXnjRUTuHozFsyhuIWdy4pe6J90xHYOp7vbl9Wvo0iubxzQtwrzyVrwzY
 3wmodY9U3BBoC1tsrPwEAzPhjAUrRZ+aBVTaIcx7XMkXL+GQ6W344WC4FnhQZ2Co2pNP
 7D90ZLEr1M8KYhQH4MUiGHCXJHeTSVvvSTiTiqlmgJ2cRa6memTYn75PFWisLc0ZL041
 a4s9aAmC0lDU/MZPJ8o/GUQuDrbzw1sKyajMoC8+gTVy5uyNz7e5msAZajO84BtEj2xd
 MhRI6683jXr8/J+pNykA188bNImW9g3iT5xgVGbfNRKEXTWAV0gfhQZJ7+RV6IN/OVMY
 Mmng==
X-Gm-Message-State: AOAM532OJN1GxaanH5XJuf+5u2V2RaTUrUkbdbzbu9wOzSruQ9EuHyBC
 n60yPsPplCiEOEneTzph0Dl+hXjOx2Q/qw==
X-Google-Smtp-Source: ABdhPJzG6HJb6MmriLZj8IAORTNX5MKpkCSXj7NBxXEIm2Js46a+Jzdgj1aT4kAgMCapOwD+km1hSw==
X-Received: by 2002:a05:6102:5109:: with SMTP id
 bm9mr6954510vsb.10.1638363905253; 
 Wed, 01 Dec 2021 05:05:05 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48])
 by smtp.gmail.com with ESMTPSA id y2sm12233740vke.43.2021.12.01.05.05.04
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Dec 2021 05:05:05 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id az37so48753987uab.13
 for <linux-mtd@lists.infradead.org>; Wed, 01 Dec 2021 05:05:04 -0800 (PST)
X-Received: by 2002:a05:6102:e10:: with SMTP id
 o16mr6795674vst.5.1638363904281; 
 Wed, 01 Dec 2021 05:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20211130164558.85584-1-tsbogend@alpha.franken.de>
 <20211130164558.85584-2-tsbogend@alpha.franken.de>
In-Reply-To: <20211130164558.85584-2-tsbogend@alpha.franken.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 1 Dec 2021 14:04:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUO-99bQPdLoLSPzDZ1KzT1_rS6eXEejEH4tf+XAtCgvw@mail.gmail.com>
Message-ID: <CAMuHMdUO-99bQPdLoLSPzDZ1KzT1_rS6eXEejEH4tf+XAtCgvw@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: TXX9: Remove rbtx4939 board support
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 MTD Maling List <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_050506_920226_299ACC2A 
X-CRM114-Status: GOOD (  17.32  )
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

On Tue, Nov 30, 2021 at 5:46 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> No active MIPS user own this board, so let's remove it.
>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

My rbtx4927 still works fine afterwards, so
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
