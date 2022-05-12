Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F3EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=729d+hT/Vlb4mpSN0z7X45aptNu1F+IV0tyMpkvq1bE=; b=RPf+CYhhV6WQTc
	COu67FOp1zmapG0WvALSmHozJKdTNKmuZ+7KaxuJLoZJg4QiCekqPfnwiaV+1lW/N+I03g+a+x2bZ
	GAcDWsZg3O+JXXQve32neHXb2tKbQq6vR85VMgFppXm7rSbCdDPG7MrNLfE0pnxQOUL9GKXEFSIkI
	iMicmX5C2XNwYw/FKJtfFCCTD6EwC/BY2VQXiEbtAG5Q9QRXmlaMwFrhG/iY+lEJTOv2cpgZhuO59
	rrLEscOqGNLUb1dBd6o0xxxfIiqgW1kQ4PHS/7vkDQh/fIZpnS842uUH8t8q0xj6xCKtS6f3lmNvK
	ZXSGGDCmbm29coy7xkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAtI-00CgDn-8O; Thu, 12 May 2022 15:38:12 +0000
Received: from mail-qk1-f170.google.com ([209.85.222.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAtD-00CgC3-Gc
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 15:38:10 +0000
Received: by mail-qk1-f170.google.com with SMTP id c1so4983769qkf.13
 for <linux-mtd@lists.infradead.org>; Thu, 12 May 2022 08:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxkHE2Hs+zmilqS56DmMY1l1eFU9eDN7Sp7hefByF2g=;
 b=xEXeDyjLXhv6v/LXYu8xVEl9KJt/WEhtAf0Dz7g+UnqwKqEvSpBAp5Ui5S4aIjJxq1
 zVY0kVHg0+CIkboDNLl4mUtfJIvyM43pO3+JqWYN3nyGqkX9DiK6qEOdGbJDXQakhwZo
 xRBz7ZCkmPCM0CG0i8zsdIVFeySvTHSAp4avDhHzEx872HhbWKsqLXsJonslKCHtr4gc
 7CFQcSMqT4Z0hTiQNeWtb2M+Bt2luI7i80+RWwNeIWlccRJKt3PijPq8O0qonUxH4zWg
 kG06FHaHWe5POLLXxKy5xjFU36R9xxjas9tt/2kR2pD0TRh1kAfzn2ArEhokMOz4f+PF
 IJIg==
X-Gm-Message-State: AOAM533fBjJgtpvGv2AUkCDXYoC44RrGiN1xli2qRSx1vRSkE0xaBu1x
 7LZ2oTHk+Bp/T8VgP/X69tzAT6uDYmWm5A==
X-Google-Smtp-Source: ABdhPJw4P5ZHI1wLm7cTosuxBoHdkEZCOcMosUNA/FZrudZcyvM5UGbpe3o3QEwzNdCXRHRST6EO8w==
X-Received: by 2002:a05:620a:4048:b0:6a0:52ea:cdc8 with SMTP id
 i8-20020a05620a404800b006a052eacdc8mr310078qko.601.1652369885183; 
 Thu, 12 May 2022 08:38:05 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com.
 [209.85.128.169]) by smtp.gmail.com with ESMTPSA id
 u18-20020ac858d2000000b002f39b99f696sm3345053qta.48.2022.05.12.08.38.04
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 08:38:04 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2f7b815ac06so61348247b3.3
 for <linux-mtd@lists.infradead.org>; Thu, 12 May 2022 08:38:04 -0700 (PDT)
X-Received: by 2002:a81:913:0:b0:2f7:c833:f304 with SMTP id
 19-20020a810913000000b002f7c833f304mr642854ywj.283.1652369884406; Thu, 12 May
 2022 08:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220509154943.25422-3-miquel.raynal@bootlin.com>
 <20220512152729.244940-1-miquel.raynal@bootlin.com>
In-Reply-To: <20220512152729.244940-1-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 May 2022 17:37:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
Message-ID: <CAMuHMdX9sE5T_anQgerQNh6qKoR=P8uL4SbPjvFPXfCuHwVqEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>, Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, 
 Clement Leger <clement.leger@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_083807_593539_CEF8AA44 
X-CRM114-Status: GOOD (  22.69  )
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

Hi Miquel,

On Thu, May 12, 2022 at 5:27 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> On Mon, 2022-05-09 at 15:49:43 UTC, Miquel Raynal wrote:
> > This NAND controller is part of a well defined power domain handled by
> > the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> > and exclusively use the runtime PM API to enable/disable the clocks.
> >
> > We still need to retrieve the external clock rate in order to derive the
> > NAND timings, but that is not a big deal, we can still do that in the
> > probe and just save this value to reuse it later.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Without moving the pm_runtime_get_sync() call
(better: pm_runtime_resume_and_get()) before the first hardware register
access?

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
