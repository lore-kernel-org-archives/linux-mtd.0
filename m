Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9A7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 13 May 2022 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IJf0qmwHTypwU62QZcFdYcFufsCJ649go2hAtnXf/U=; b=07f3NqzMBptC7g
	M3hmVYkMEQF3UTXhhTh40mntYgEjwRgU/dF6/VDDqomumDHh31ju1gVQCnSMlxfh950FagBSURby5
	h46hYAJfuEG+WDyvp6Rjf4qhX8FedUm6oaMxzR8anRW1vNAOOYQaggsSUbXFbI2xyyTT6Gn9SlFyd
	+w9Q/3B9IJJZVt++KA5S/Qik/cIy9SobPO6jTwkQqOTzkI+8j7ZE9Z1pg1QaEuIdnvHSm0orQ6D6K
	tTg1Lqq/MiBcMlo41AvaHfWF0exwlfeMCElz6Glsf8mw99we+zIRmz9ueYhVgSpM5GhlGC8JiVP07
	PgzVqMowV46WbkJlK4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYtv-00H0sl-4N; Fri, 13 May 2022 17:16:27 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYtr-00H0rD-Iz
 for linux-mtd@lists.infradead.org; Fri, 13 May 2022 17:16:25 +0000
Received: by mail-qt1-f176.google.com with SMTP id x22so7323690qto.2
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2022 10:16:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=raRyjvi/nNYnyN2p2YoiBhtLtPa6DvP11Zh+f/IjRsk=;
 b=R6oG9fC4dMpyg3MxLK/tbrgZhRjAJTnLgZfvaCnpqR1yHE2IZfdThoPPx05OQ3AodH
 wnIniZp8cE4avRsY9x+3z3LaBaH77O/RlExO8ZrIJ3WCefeb4D/uCelMPUTQHMfvmEjF
 pq01YPQ5DNYDvM7URw4i4bQW6JLw3qYVzbKoTIk9Zt0ndb7iy9sIHXE/yACs4rG3+Pvg
 Ks7aX2ZJqG74Cf7u5Zh74DCmNcjU9IhX2AaH5TOLVXdcZEhoJIC/r+betIKA1i97cxDq
 KpW4LaRvvO19p8QLo2QUa17Xl3Rdac+U1lCrJgBtx6Pipx9Fp1RUlk+7EL3QUpqfcjPZ
 vjrQ==
X-Gm-Message-State: AOAM533PaFzuNnseUfCXaT8UTCsJFI2aos9EYtqS4A/4A+QIjlim/A6Z
 a7RMEEyXjkSHs1J5fDQGGnNSlR392H3Gzw==
X-Google-Smtp-Source: ABdhPJyyVqkEsRz5g7e5pV3XOnit4wLWd5XbXLRtamXthlAhDLQRpc+GHJXsxdAbbHLRmdRs3Rv/4Q==
X-Received: by 2002:ac8:4e86:0:b0:2f3:f4dd:82b5 with SMTP id
 6-20020ac84e86000000b002f3f4dd82b5mr5483832qtp.444.1652462180617; 
 Fri, 13 May 2022 10:16:20 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 i21-20020ac871d5000000b002f3fb488d6bsm1773240qtp.41.2022.05.13.10.16.19
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 10:16:20 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-2f16645872fso97062247b3.4
 for <linux-mtd@lists.infradead.org>; Fri, 13 May 2022 10:16:19 -0700 (PDT)
X-Received: by 2002:a81:2143:0:b0:2fb:1274:247e with SMTP id
 h64-20020a812143000000b002fb1274247emr6840940ywh.384.1652462179266; Fri, 13
 May 2022 10:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220513104957.257721-1-miquel.raynal@bootlin.com>
 <20220513104957.257721-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220513104957.257721-3-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 May 2022 19:16:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFV0PcvEYJht__pTDTq3jj-CW2KegwGMyDgfeJhtpSRw@mail.gmail.com>
Message-ID: <CAMuHMdWFV0PcvEYJht__pTDTq3jj-CW2KegwGMyDgfeJhtpSRw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: rawnand: renesas: Use runtime PM instead of
 the raw clock API
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Gareth Williams <gareth.williams.jx@renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Milan Stevanovic <milan.stevanovic@se.com>, 
 Jimmy Lalande <jimmy.lalande@se.com>, Pascal Eberhard <pascal.eberhard@se.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>, 
 Clement Leger <clement.leger@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_101623_661433_A8FF4809 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, May 13, 2022 at 12:50 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> This NAND controller is part of a well defined power domain handled by
> the runtime PM core. Let's keep the harmony with the other RZ/N1 drivers
> and exclusively use the runtime PM API to enable/disable the clocks.
>
> We still need to retrieve the external clock rate in order to derive the
> NAND timings, but that is not a big deal, we can still do that in the
> probe and just save this value to reuse it later.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

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
