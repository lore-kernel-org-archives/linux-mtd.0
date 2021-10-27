Return-Path: <SRS0=tFGH=PP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FED3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D502160F9B
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Oct 2021 07:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D502160F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2X+xLLfQRLEQkYvVvJu8r2aq/eQZp3piLhFOtLi6iKQ=; b=jghp4n07hK7hMi
	TD/o1vTb+dTO1cilBgssQQ6EPVycI04VQx+vKtkD6lhKoPnAZvgrpN44CsYJpyF6lMOptwWXOpycq
	NWLYOKUzjffJAnk39yMRWwoptnGADEuaOTRHh2t39GaNoI6HQi5BAyq4WNpUQ+j+szevkgErKgrCB
	xSdKxD0Re0i4uVO+QUd4G+cGek8YFbou9F+E0RzZt0+nsu/YoItaJUZwYiJtQRPVbHv/ZgZmLevE5
	4iWwqPTaSDZvZqGNyqWMI05Qm/YWzwPMY8e7j4gtLA/Hm1tEDOXxUtAGplbxbkleGXi7bML4/nB52
	1plJrNOS+9kNszF0z4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdGX-0048v4-My; Wed, 27 Oct 2021 07:22:29 +0000
Received: from mail-ua1-f47.google.com ([209.85.222.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdGU-0048tC-F1
 for linux-mtd@lists.infradead.org; Wed, 27 Oct 2021 07:22:27 +0000
Received: by mail-ua1-f47.google.com with SMTP id h4so3186850uaw.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 00:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/iJZSwBfMB4rhQgp9Yn6aeYD+316WLPLDz4u9JiASsw=;
 b=6QNMJV2SMXVtTuSwHAH68kP55T/G0KiHM65rOuLFbWWSQnd6TfPg0hDHADojSgMZ4o
 nZTIE6T3FI+Ocpct20wl33DkPHRT2gHSsd9KgFMU07TGuC/MZKjq/9jNJYMCZcreBQzN
 jfPiwb6T+5RGstU3oLMDuxuptpo6y9CpT527WTn5ZlxEtjHm2DOhUAoI2KHT7k1B77xh
 BA2zCgLkdvMw5Zq/zWm35aYwKjdOXzLgZm0JjMZI1X/Z1C+cQ2jjbDFAaMNeNY2BxHzF
 Xc54uRQe9ym6IHzbU8INVdvftLx4sF8075joXa8i4mNliYDWceetG+ZEhg1HRb1xl03i
 8LcQ==
X-Gm-Message-State: AOAM533xHE58XCpxDcnbLcpAHMLqsVJJBz1Z8Se1t20R6tZCb6J9S9gO
 rlTttONReiWDTFBN5m8gJI4/ZkNyEW2PVA==
X-Google-Smtp-Source: ABdhPJwRvPZPvsMtyD2xywq855heJ78X+qsDHlVl6B/B/uBdPLwC7GPQSbQ50hazOVv5+gySN0bh5w==
X-Received: by 2002:a05:6102:ed5:: with SMTP id
 m21mr2783795vst.9.1635319344635; 
 Wed, 27 Oct 2021 00:22:24 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id w194sm492611vkh.53.2021.10.27.00.22.23
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:22:23 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id q13so3173972uaq.2
 for <linux-mtd@lists.infradead.org>; Wed, 27 Oct 2021 00:22:23 -0700 (PDT)
X-Received: by 2002:a67:f4c9:: with SMTP id s9mr18113716vsn.35.1635319343494; 
 Wed, 27 Oct 2021 00:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211025205631.21151-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Oct 2021 09:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVt0o++AiP=A0jsZPUAfvWgn1V8ZwtGT2ha-v1zw1cY_Q@mail.gmail.com>
Message-ID: <CAMuHMdVt0o++AiP=A0jsZPUAfvWgn1V8ZwtGT2ha-v1zw1cY_Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] memory: renesas-rpc-if: Drop usage of
 RPCIF_DIRMAP_SIZE macro
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Sergei Shtylyov <sergei.shtylyov@gmail.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_002226_532788_8AC6336C 
X-CRM114-Status: GOOD (  19.20  )
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

On Mon, Oct 25, 2021 at 10:57 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> RPCIF_DIRMAP_SIZE may differ on various SoC's. Instead of using
> RPCIF_DIRMAP_SIZE macro use resource size to get dirmap size
> which is already part of struct rpcif.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

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
