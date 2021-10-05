Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE87C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 14:47:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3564A61251
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 14:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3564A61251
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XA5vKL7k+aO7Y9KGeEitlT6DNrSAEoqOWxVArtcUVOo=; b=mDqxBA9q96ol+7
	jeD0dHmf00W+F4GLAonABMQWpmjHiXA3WdQOBn11U9ek6jMP8HUryaErJ8aXzYx5yC/EMROqbsGVn
	+c1AJib82M5N0J69MajvB1PRQ08hiE1bBmT3CPTRtM6Q328Tmmtmvw3lCV+GaKrzS7gkLwh4qIgt9
	uzPPFaj5GRTp+IHkRxVFR1+SdesRq50Uh6Yrm+BVFfdP6u+UJRYAVeMufwnxFazFkwMGFsvnx+ZEl
	/tG9iK05XN5cU+XGBAhKfr3fEVADoFm1PLBNxFI9VmeOB+fXZWfylFlCUrxd1QtOa2alzfR74QOcD
	OOcmgyJpLaFFn8nrYCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXliV-00AuQn-Ub; Tue, 05 Oct 2021 14:46:51 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXliT-00AuQR-No
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 14:46:51 +0000
Received: by mail-vs1-f43.google.com with SMTP id p2so1531355vst.10
 for <linux-mtd@lists.infradead.org>; Tue, 05 Oct 2021 07:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Khxc7wZumOtpS5mwACBEuWfNWBNzntWbNHisFSzTh08=;
 b=2y2y5o1CbDzoBx/8MjVGTleXquQYL8j6nLwepEhubDxzxNwJLqQqWfZa884HDU7sZG
 gUUzO75DrEm7LIL3twz/XWWFeXVJfcqH9AZO6wXus0MkfzCs63qmjJdomwjXKhl5IGdB
 ifW9wYVLVjm+e1iJ33tcE8Q5oLljERM1b64HtceWEoLKX9Z9+bOtrvEV3RTFAlhd6Rgm
 OBnBR8Y22/nkv5E46DAhftRT9hotkUM6XwQhx07aKGkHCWZIyaVUc4NIPwRJZ1fVLxYe
 EWT62pMiztyKlpbcoLsFL1kcxL+MLVQvcEzq+79WXhH27WglTRwr6ekWW+CudJIwAcVm
 hl/w==
X-Gm-Message-State: AOAM531vR6UE9qqa8q7ZVRUZl00e7gZ3okKy0hNszAoXenwZUIcXy98Z
 qDZT0EcnD+E9Cip2/tR3JFiElfAJfubj1ZAZEK8=
X-Google-Smtp-Source: ABdhPJxIHGhZacfkPIP0QwC6n8pXB9a9H3QfA2yMDeJQ7gBJ7CYF5IWxa2O5+r8IhAP9kqfW3mmB/ggpMuuDqe6hnpk=
X-Received: by 2002:a67:c295:: with SMTP id k21mr16360605vsj.37.1633445208279; 
 Tue, 05 Oct 2021 07:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210928140721.8805-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210928140721.8805-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210928140721.8805-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Oct 2021 16:46:37 +0200
Message-ID: <CAMuHMdVy7RxUSWQOUDKB3-8igjYGBXO4ZYy=DamgQPqknXaUkw@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: memory: renesas, rpc-if: Add support for
 the R9A07G044
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
X-CRM114-CacheID: sfid-20211005_074649_798645_EE45698F 
X-CRM114-Status: GOOD (  20.61  )
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
> SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
> the RPC-IF interface found on R-Car Gen3 SoC's.
>
> This patch adds a new compatible string to identify the RZ/G2L family
> so that the timing values on RZ/G2L can be adjusted.
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
