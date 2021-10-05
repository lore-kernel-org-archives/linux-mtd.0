Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68B2C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 15:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3E260EE4
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 15:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C3E260EE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nh4OXL8vnpnXlePbbrsOr4VuAG/0M2kIpxoTo9QPrms=; b=oukqR+6MYWpWIz
	i3+lFE1f3ckewuKfcb8TGf3VEj0QrHgD2b9Jxx3ORJMSOW0M0qHU9MsDuv/RF5lzWufRAqp0ob7NN
	yEEsM6TevWigpYJm5tp0w8JOxm1sAXdxYgWJdKVKexrCMh3TMn86vfSr8cmGKrL7VxunzFY8fOvlU
	1O739BRqKWkHwhkSd11okik4edYmiSHCPEsfhoKKpHYYiGW2HUk7+pTgoJsMAh6selbDrawt7+KsI
	MKFGD+fAlnQ+IfQB3b+wJ+qWYUHjgeABFrKokkOjEQXdhNUWjQooDRfTero3JMmNBJlnAoK3mLiND
	cqjLIOW6LWOXKt94lbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXmKY-00B452-Cc; Tue, 05 Oct 2021 15:26:10 +0000
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXmKS-00B418-CV
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 15:26:07 +0000
Received: by mail-vs1-f49.google.com with SMTP id y141so8472291vsy.5
 for <linux-mtd@lists.infradead.org>; Tue, 05 Oct 2021 08:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSfoUs1RyncvnmPC5NiMdbUYy+WE1in92GvUJZla4GY=;
 b=QzIdj1fM4HnAvMv3i11t5RWRb/VP/DZZFdcPydn2bAnI5zpH9Bzf481UU7BRfT+gRg
 uGR6OjBEv7oy/+HUfvzLidUflFYEDqFV48PlLzQ83vUP7RaDf50uIRZuvs4Zn+1EXCGd
 bayC9IJv4DonG9PpVSPX0IvVgut7nPUfRdZ+f2S3XT0KXNyhRkEal7wFNN8L6aITFtvN
 YJaS49tlWiIoAH9N0Wf8+Vuhf+aimyR1KlkVZHYVpfyk/wGM4CtPpX37UVQeX0jOmjMv
 l0gLo/xmJ1cRXshvUNDF/8qyPc8xB+E2HjQZL+Y2Vyzu3AQqg0+uClE0mFKIPyBHniHY
 RTFw==
X-Gm-Message-State: AOAM531BfNa9l8KG8PhJu09124Rn9Q7JcKt31eIUtfJFtrfvdOyPLInR
 WUW9QoB7dBGkc3DPYLEkbogD7hvGVRBNqUrSuHU=
X-Google-Smtp-Source: ABdhPJywGwfpRqbIeYpGX+HZ2UWKkSYVpZ/hXxSNrmGd7JFi4IsId+z/R5soZJYSH3hdG3qWIJpUMzGfVNXr0Jb1zLM=
X-Received: by 2002:a67:c295:: with SMTP id k21mr16616682vsj.37.1633447562966; 
 Tue, 05 Oct 2021 08:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210928140721.8805-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Oct 2021 17:25:51 +0200
Message-ID: <CAMuHMdXVxOtvXu_DM5FjFzNcPbLtrRJ9W2R6CHmCc0ZJg9JJYw@mail.gmail.com>
Subject: Re: [PATCH 3/6] spi: spi-rpc-if: Check return value of rpcif_sw_init()
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_082604_463376_FDD74B1D 
X-CRM114-Status: GOOD (  17.92  )
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

Hi Prabhakar,

Thanks for your patch!

On Tue, Sep 28, 2021 at 4:07 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> rpcif_sw_init() can fail so make sure we check the return value
> of it and on error exit rpcif_spi_probe() callback with error code.

Indeed, it will now fail earlier if CONFIG_RESET_CONTROLLER=n
Patch sent
https://lore.kernel.org/all/d4383bd1a97c0490c0bdc9dae5695f4230d4a420.1633447185.git.geert+renesas@glider.be

> Fixes: eb8d6d464a27 ("spi: add Renesas RPC-IF driver")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

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
