Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB170C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uesNCB5Ck8TdDnf8ZBZuKBSrbzNV2aF1CEgGkCHgH1g=; b=xVZzgxSd8/m3Q8
	+mDrmttzwRTpDLM9H2YJrSfNIeRZSGqD4RapcERRYWWd/WK6llD6CcSD8AuKIgbEmvDAoRR1Go5MN
	n0oHfP4dBmjkC7+aEQIzA6oKAe47oranxQxL+S2gH+br+EzsuDtZj4rfL0nFx6hvxYo+42jGaTB2b
	TmKn7yNtWempNTNpbRXVm6Z+XKk8W7fks0U+vOV5qj+z4Sc0gs409bEWfosUSawuaraAViaDnV1D7
	yvMrI02HhOuEmiEnHlrF/NKNCRQpOkWQ4erI6MFc808USlASCWVbkvewL+VSFRCSo1/yMNXpu8JiW
	zBBa0IcspA5Cscz45JpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAtk-009cmd-5k; Fri, 17 Dec 2021 10:55:36 +0000
Received: from mail-ua1-f41.google.com ([209.85.222.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAtf-009ckt-Ub
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 10:55:33 +0000
Received: by mail-ua1-f41.google.com with SMTP id p37so3535468uae.8
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 02:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CzRODjcJJkmc7LYh+2mnvUIKs4AKBEWasXQMzh6C4sI=;
 b=hk2I7lpR3BC+3TzURBApyz0AzUwRHVBZJxkZlUCeAdSIkGRhcp5RR+rNUTQKOaVlZR
 tppJKO401LEPWeyHJuuD23tHKPaFXtsN0yawS3j5keoNbSngMbaEL9XalWNQBwmQr8qO
 BLNw0WfbgH/LpsLHBY9jRM5AxaC6ndqnPevGJt/NdcAw4Tb5uehPXxs9s9D2h1jMDbs0
 cuapwoT++etHSpCWe5TCLDDtFL9XWbfVe9PmEQXCnVI2xHaSn8ngrfNM+e4uC395KEzy
 84xmffPv1j8D/UQmA+fWTCX3Wk2bRG3vEBAae5o+/JOCc9getNUx+7DLa+tjBdvNcG/B
 fGnA==
X-Gm-Message-State: AOAM5326LKoE/GUVQSU+lz6TgnGZ83KVSgfZ7/9ko04wMf73z0g0TQOq
 ZdhCkUy/fIyyiZHFd52BCnDt6h3hlyvmbw==
X-Google-Smtp-Source: ABdhPJy9uG8yGr6syVBMUMj+3+HkWetfN2CiP17t0QHI9zpHH3w6aJgKaD1zVyBrxnvoziqXuT2aZw==
X-Received: by 2002:a9f:25f8:: with SMTP id 111mr683784uaf.44.1639738530273;
 Fri, 17 Dec 2021 02:55:30 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
 [209.85.221.180])
 by smtp.gmail.com with ESMTPSA id 29sm22627vkl.6.2021.12.17.02.55.29
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 02:55:29 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id m185so1246462vkm.5
 for <linux-mtd@lists.infradead.org>; Fri, 17 Dec 2021 02:55:29 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id
 z15mr855694vkn.39.1639738529014; 
 Fri, 17 Dec 2021 02:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20211217090248.259122-1-miquel.raynal@bootlin.com>
 <20211217090248.259122-3-miquel.raynal@bootlin.com> <YbxjXgIIj6yma+Ch@shikoro>
In-Reply-To: <YbxjXgIIj6yma+Ch@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Dec 2021 11:55:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUdRb1VuTgw5-dMkMa_1=YBnODpv1Ja2KRpkNsPWaDeQ@mail.gmail.com>
Message-ID: <CAMuHMdXUdRb1VuTgw5-dMkMa_1=YBnODpv1Ja2KRpkNsPWaDeQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] mtd: rawnand: rzn1: Add new NAND controller driver
To: Wolfram Sang <wsa@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Ralph Siemsen <ralph.siemsen@linaro.org>,
 Chris Brandt <Chris.Brandt@renesas.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_025532_026447_457544C4 
X-CRM114-Status: GOOD (  25.00  )
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

Hi Wolfram,

CC Chris Brandt

On Fri, Dec 17, 2021 at 11:16 AM Wolfram Sang <wsa@kernel.org> wrote:
> On Fri, Dec 17, 2021 at 10:02:46AM +0100, Miquel Raynal wrote:
> > Introduce Renesas RZ/N1x NAND controller driver which supports:
> > - All ONFI timing modes
> > - Different configurations of its internal ECC controller
> > - On-die (not tested) and software ECC support
> > - Several chips (not tested)
> > - Subpage accesses
> > - DMA and PIO
> >
> > This controller was originally provided by Evatronix before being bought
> > by Cadence.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>
>
> This IP core is also available on some Renesas R-Car Gen3 SoCs. I don't
> have a board with NAND equipped, so I sadly cannot test your patch and
> can only say that the code looks like it is in a really good shape and
> can only suggest some renaming.

Also on RZ/A2M.
RZ/A1 seems to use a different one.

Note that RZ/N1 NANDC claims to support up to ONFI2.2, while
R-Car Gen3 and RZ/A2M do ONFI1.x only?

Chris: usually you are good at IP history ;-) Do you have anything to add?
Thanks!

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
