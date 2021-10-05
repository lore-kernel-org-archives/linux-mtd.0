Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C08C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 15:13:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBC986115A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 15:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBC986115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8ZNDL5hByxoP+zAfF+erV2jQFQwm+lzfMMIACJTmQM=; b=A9s3k5NUVflQYD
	JZEXKsfDfhOXzZtkBoZWJZMu8Z1C47WS7HJDXWiE/+x+iXdrNrgAqD0DVY31x55nSJ4kHzc3qUahg
	hfxLSIUm1Pw7mLWd07+vQlmI9goiZFzisvuXojfX7zHWZ2gb3eCZL3KAEDpSmk3J+PGU/Z5nUxDLy
	iig6Axt0Bb5R12tHKwc/WSmJsphPghxIhW+vB5kpGSDcFvjG318soFb16Ljqy62WX0gyUFxP9/QFK
	SiAwObUTNAxTX+/g7xc3nepH3t42jzweLWlgSWSlwrX3XnhSw9lwDGk0xfDF8BdPuavHh7tBa7R25
	iRycSh2HS9IVlziDRDfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXm7k-00B0VE-I6; Tue, 05 Oct 2021 15:12:56 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXm6w-00Azwp-7A
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 15:12:08 +0000
Received: by mail-vs1-f47.google.com with SMTP id p2so1631506vst.10
 for <linux-mtd@lists.infradead.org>; Tue, 05 Oct 2021 08:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gf17DwZloYrFgqlw64n/3dkqUKbD656uIR22G5R4yNA=;
 b=mWs5fzh7kQKhw2tkYA1bn7ljJiaUBaPgTCdLVi3He1Nqt4J3UH5ttOxInj4MpCaovG
 xeTwzNTtr+y1gfeNYb1HHLqxJGJJJ9q6uZSmPHhSxfi9VaTJoYEhsgmQjfcW5W7s8vc/
 +bnMqcWhgu5Kx4LtQQeJTKH+A7qFDGsPTuPYOhpBLP67DR6W6EE3s/5RYe1eCDRzI5Ek
 wkJX/cu46JAcpE/VQ8QmvtXtvzlCZmfapynk3drzfyCcShd7BIwhkYF0NCBjlk70Frkg
 2n9p4eNb3ikgDmu9UjMZD/Yvq+YO3WgaTC6y84i8hIFEYQDMmWI2rGA5/VVZCswMvQl0
 21kQ==
X-Gm-Message-State: AOAM533H6V6q36x4ai8EcZVKpaA/lGV04XT1gyILvLLiq9Zxzr2wSNbI
 UAbx7ZNYEd12YEm++Iz1pvD8cinjk3LgEvgQFq8=
X-Google-Smtp-Source: ABdhPJyixGIKxdVKLR+jX0yGSnIsxa6UT2MwKmvFfDtbnIxso2yONZOkM11x61wzCO95nrP8oCxmehr97uuO6qk3ado=
X-Received: by 2002:a67:f147:: with SMTP id t7mr18978451vsm.41.1633446724666; 
 Tue, 05 Oct 2021 08:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210928140721.8805-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Oct 2021 17:11:53 +0200
Message-ID: <CAMuHMdWSsrV-9Kxz=zS3CVKSbo2OkwyaVK2Jx-+X68W-cqAdvQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: memory: renesas,rpc-if: Add optional
 interrupts property
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
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
X-CRM114-CacheID: sfid-20211005_081206_324237_3E46C74C 
X-CRM114-Status: GOOD (  16.26  )
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

On Tue, Sep 28, 2021 at 4:07 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> For completeness add optional interrupts property.
>
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
