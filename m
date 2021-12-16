Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C415EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CfNuX/j8dSJG9B4xa7ggcaW4UqqhUEIIIHQNwUPf7fc=; b=o6JmV0sD1lyb3g
	Y1xkApYOL5Vt6EdZfWZ5O/SYunyyhU4xWj7fGCaGFj9sNmTg7eZrN5VSWq5eene6YpPMbjVLVYgK2
	Rd1v7V9hkhIA43Zk5Z/xcrYvif9tf76KZPV/R89m4j6cqfCKax+M9SlGlk1PTHFfjp9r0th2x2Jhg
	0znImegsC75J9weG0BYbVCSx8FLYhKagya55kqCwV+ZvtXocK40UaF5x7yzGDl6W0lCNJ6gpYLgoO
	PGTve75l1e9CJ6MtCcd0nC+ASIhQdXcDQIdgxO9cMzTewzSDFdp5iHY3SPV1sOvnS162BnYP1vrHf
	+E/pxHZ4VQzXS6GoWrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxn2t-004SC5-F0; Thu, 16 Dec 2021 09:27:27 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmpZ-004Lpv-Oy
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 09:13:44 +0000
Received: by mail-ua1-f49.google.com with SMTP id o1so45987252uap.4
 for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2021 01:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jHKD8Jau3VMC0v0mHq/8AnvUbUd2JPek/udI8yP5e94=;
 b=5gV4BaYix+M+BKW6PuETxB4M0ncKY/BJWnYhQ3aw2DMYCHv4qHX6Xr8cKb0CK9lnLS
 Ef8bQRi5atIZwDml0g8FMatEcOXgVr8+UdKhXQZueHp3332PIjfFEib67iDCYoe72qTS
 j3M9AM+mGNPZSK/7dE28bUiPvq2h16Lu3IboqWfgv2TtZlRcn7qRkKKbRDGmlQdTpkky
 joGy7Y69grznoDqNAtKRkXvAjf4MD8PmX4/rOLf8Suriv/7hB3AKKaqPW5ug9K6yp2Jj
 XijAfHajbsoRVKSaKyEFNnusoqGz6GrDUG6/TCyZ5xkl0v7Vcf33ZG6de9Fa6TEtx9ga
 fykA==
X-Gm-Message-State: AOAM5315Noh57mDagi5XTMzz6jSLxikzXE0SnLrzXaFKntRg7H9mnlXC
 S1HMFt/n7BjzzCcJ+nVVbBL1NR5RGxdu9Q==
X-Google-Smtp-Source: ABdhPJzOJXsLd2vlXkSrXtdKii6nvDq/q3H/f7bLS25P94FNOIv8KWQUI2aCzcA4Fz0ku68xdP6ysw==
X-Received: by 2002:ab0:2b8d:: with SMTP id q13mr11870015uar.139.1639646019106; 
 Thu, 16 Dec 2021 01:13:39 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51])
 by smtp.gmail.com with ESMTPSA id v17sm1011139uar.15.2021.12.16.01.13.37
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:13:38 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id u40so12796890uad.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 Dec 2021 01:13:37 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr4863423vsj.77.1639646017480;
 Thu, 16 Dec 2021 01:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20211215154619.166360-1-miquel.raynal@bootlin.com>
 <20211215154619.166360-5-miquel.raynal@bootlin.com>
In-Reply-To: <20211215154619.166360-5-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 10:13:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+a7ASjzvmFzOrAGZPcMF=muzC_b=fjddef_oMKGGrpA@mail.gmail.com>
Message-ID: <CAMuHMdX+a7ASjzvmFzOrAGZPcMF=muzC_b=fjddef_oMKGGrpA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] ARM: dts: r9a06g032: Describe NAND controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>, Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_011341_856846_20E30D86 
X-CRM114-Status: GOOD (  16.28  )
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

On Wed, Dec 15, 2021 at 4:46 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> Describe the NAND controller contained in r9a06g032 SoCs.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel once the bindings have been
accepted in linux-next.

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
