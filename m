Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB10BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKOk+3+NYWsPkQvKqIiPkNGyHx4ypdftu+gXPIicpLc=; b=p9JB/BRMkp0BUp
	D80J2hFgVeNBkO2X/G4h8TmqyYEz1mDZe7LoeXCJs1kIfSmsfSvKGkv+jMeqFFq/Xa5Wm75XH9S5P
	HYTKVjFXg2tqvbjh7Eei6KFgTJ9EMyJ5BMEBpG01KI0gf5LCp/oAw2yZnZ741G992uBTF0LWvMbSP
	mYvk3HfKPSvFCLhSjkpWB+a3mv5jjV9EWUUbMMLXgn5JBBb/m2GBvPJn+IZN8UxBm+e2RS3/JnKIY
	QvzLGtn45tjHeLC4R8gC2caDk5hOChz2GLnxFOqCmzZYVC4Zoj7eaScdfWjTlR2qE9UOeQTjnHKbI
	UQKNnwZ2116NZN3Gr8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muA1F-0036wD-RA; Mon, 06 Dec 2021 09:10:45 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muA1C-0036uk-QW; Mon, 06 Dec 2021 09:10:44 +0000
Received: by mail-ua1-f52.google.com with SMTP id w23so18145309uao.5;
 Mon, 06 Dec 2021 01:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1NOvpdGnyz5HaO2Ggxr9H8istJm4mrRSxgHlh+Ba04=;
 b=loMsu8nbH2pfuBueEBK/CKsbt/6updFLXXZs9SUU21uKWTOFXIMUvsFfuRAmiB+7Po
 FNz0cxD+mFQNxwDHY3XRHRtflw86Ace7zkAHtZBYHCftMmAL0KezseG30hLr9O/7Sv7O
 hZClKjwFqsGjSEY1IAgzewhN6ddMFwwHBKQO3IedTmxnu+DiMuydxCTqCh6nj64hmI0n
 gjBEiTgA3nnnCdy6YnNGocLZMb3KgxUttPF5i/zGRpTJwXm25h6qW0CIgR9jYPOYhKtT
 TvsepZkteiaNCskojs8a9Iru/yAAhvA/VaLUCkSDnC8CSb5h3ILzfPV6HunYfIrmxD6Y
 BeWQ==
X-Gm-Message-State: AOAM533SCqzk/SV50OTXq2RJPiNvfB15QN2n4YMV8qBVf7tqGgWO0hyw
 aREXKM4M9Wlgy8s9u3zCRXgX8mrkqbhAoA==
X-Google-Smtp-Source: ABdhPJzoXd8K+9ofXwc7QjKt2+qlSWlHEhECSEVxTdXdtwxx8FO9QQSzwBEgkWRpvJMoKRxBijIztw==
X-Received: by 2002:ab0:7c7a:: with SMTP id h26mr38251509uax.103.1638781840501; 
 Mon, 06 Dec 2021 01:10:40 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id l190sm3589137vsc.26.2021.12.06.01.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 01:10:39 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id l24so18221661uak.2;
 Mon, 06 Dec 2021 01:10:39 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr34917644vsj.77.1638781839002; 
 Mon, 06 Dec 2021 01:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20211126140625.351697-1-miquel.raynal@bootlin.com>
 <20211126140625.351697-2-miquel.raynal@bootlin.com>
In-Reply-To: <20211126140625.351697-2-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Dec 2021 10:10:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcE49hCcoKYa1bAojNdQ5iXH6HOFgzSfD+Pg0SwaN1DA@mail.gmail.com>
Message-ID: <CAMuHMdVcE49hCcoKYa1bAojNdQ5iXH6HOFgzSfD+Pg0SwaN1DA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: rzn1: Describe Renesas RZ/N1
 NAND controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Jimmy Lalande <jimmy.lalande@se.com>,
 Milan Stevanovic <milan.stevanovic@se.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_011042_890379_6F15C3D5 
X-CRM114-Status: GOOD (  16.38  )
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

On Fri, Nov 26, 2021 at 3:06 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Add a Yaml description for this Renesas NAND controller bindings.
>
> Provide a family-specific "rzn1" compatible and a more specific
> "r9a06g032" one.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
