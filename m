Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371B1C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 13:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GoLn/oHM04Yi/2kOR/CrLA0dsjLSd3uYZAygPXO4cNg=; b=18/B53xgRFUQsz
	4QC4itcjES0uZdCxWsidv120sxlDW6m/fKZr1YpFr1DagRSxxxqPGkrtECD1A3dLGFFqapPxm2q/A
	wtb23svfnOkOMXkV85ZEryVnltgZUXvEFFCZAoj4KKt3+oMKQVeTRGG7rptezfr2JY58OxUFfIxuJ
	FKvTca+pgk4TeVdxMoicaE39ScgehVC2WixHaJbG38vZrbGxcIf6W3qXL1yueonXD+0NNA7vP0Xdd
	FczsN7U649i5DATMe9CvsBwN4Bv9fCP6485cXy0p7Z3EkLqe7YYa1GzETWHzoJPZo2QtSCT9c5qou
	qJrUswJFPHkOphe9EmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxrEG-005yyZ-2U; Thu, 16 Dec 2021 13:55:28 +0000
Received: from mail-ua1-f51.google.com ([209.85.222.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxr7G-005vxX-1D; Thu, 16 Dec 2021 13:48:18 +0000
Received: by mail-ua1-f51.google.com with SMTP id t13so47191030uad.9;
 Thu, 16 Dec 2021 05:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kAMZft4AdGNLv17wUp1UcmNLs0KmYNmoKddbnianRp8=;
 b=6PwUFw8tzvYMT7m69Jfb2R2havSMTTUotE3H2ii2DfDz9PMGbLCaih3WyzuTa40SWg
 mv7TsIrn224M952YDuQ5Oz6bpwQzTdV4MOged1t1TTs7LE1fQpvvp0XoIfb36Xq3mFeB
 vFPXSAA9x9c4oGZ+s2RixhcyBJ2qNNahPIsoDgSz3Wm8Hc/qZoEd6RMee/gSZ4TLxj+N
 G0S32I7+GYNKeMXD3m0qpOC9XrsTBxS8KcX23F8xKo4id0TusJhBtgqLmUmPaLVQMESz
 0VcF/wIWEENdUMUtOhh9yinF85W7jyxfKr/5rYvGoYwGrp3VdHrRomUXhNTAvFKP4lXp
 02Ag==
X-Gm-Message-State: AOAM531lWIupWX7W4E27TREhgnXQLNoFy1kgajfsS5IRPO/nPRLYZkDI
 tXFKzP2dtqsz4KqjSjzRy564RQfog1w6wg==
X-Google-Smtp-Source: ABdhPJwVGBb8scAwrLoolalYm+0IvvJmFt0/WyU01MUYqUFVgb66hcWT7DZhoS0i69h6YnbL6hBS/A==
X-Received: by 2002:a67:f1d8:: with SMTP id v24mr5776548vsm.8.1639662492139;
 Thu, 16 Dec 2021 05:48:12 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com.
 [209.85.221.181])
 by smtp.gmail.com with ESMTPSA id c21sm1095858vso.21.2021.12.16.05.48.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 05:48:11 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id s144so607283vkb.8;
 Thu, 16 Dec 2021 05:48:11 -0800 (PST)
X-Received: by 2002:a1f:4641:: with SMTP id t62mr6424797vka.0.1639662490890;
 Thu, 16 Dec 2021 05:48:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1639660956.git.geert@linux-m68k.org>
 <20211215154619.166360-1-miquel.raynal@bootlin.com>
In-Reply-To: <20211215154619.166360-1-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Dec 2021 14:47:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJ-KCZfYtcXGW_t0Z5ab+wbuKxxR5zTs46zsOU5hzVDw@mail.gmail.com>
Message-ID: <CAMuHMdVJ-KCZfYtcXGW_t0Z5ab+wbuKxxR5zTs46zsOU5hzVDw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Renesas RZ/N1 NAND controller support
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>, 
 MTD Maling List <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Lewis Hanly <lewis.hanly@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_054814_129934_3F6D8280 
X-CRM114-Status: GOOD (  18.13  )
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

On Thu, Dec 16, 2021 at 2:37 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> From: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Hello,
>
> Here is a short series bringing support for Renesas RZ/N1 NAND
> controller.

Oops, please ignore this email. Sorry for the noise.

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
