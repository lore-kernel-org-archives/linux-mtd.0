Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D8FC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWIKczmNhEIxPa6g9W9BEDW0jLWC3/BtZXOeUFjrOnY=; b=OhnSvkRVbWnm92
	N+1jvByR7W69sVHHIMSVTvC7GrLmmzOqCpWiDCNtQPfXVfaoupKv/0o/AT0GjI73WcPPRt5S4MmrW
	oodIHlFx6xzhAkajGWD37dwJvngK78+rSVGbQT4psUA34AzgOP9dEvinrcHTfpe246uKvuuqe7h0Z
	21Zc1XEx0MEHP3p55qlyIp5BI4Tb3tF5vzg8b+8MO1h6n+WqrdDqPXGwKPwsk57rGM/WutgrfhDTK
	lvv96rHQKLHJ4wGmcZ11joHdlJYP1dcd5l6fe0zVUIVhJw+KtKZN1Vd3ss32WiyWvWg/OMI3PX8LB
	FlJPgNyEI7rxFxpJ6r8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neDNw-00D8tn-CR; Tue, 12 Apr 2022 10:04:32 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neDNt-00D8nn-6o
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 10:04:30 +0000
Received: by mail-qk1-f175.google.com with SMTP id b189so13295406qkf.11
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 03:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UkkpP++oa/oLxNyX5NfWKhI/0x3q2YFDCI0qRMj71FY=;
 b=HuCTlO++7SZRadxojPecjmBXVazBOOuhDVBls9aMe3YiQcrWnw1nP/wJghUD7l9OIC
 XFrFRKStzAofyW6iWeGANVd9ryydFHhm6Pl5iqlMYvQ+w/AS1HlKVSI8MdS6ffjONYXo
 UNlpbeVNnfUhsrwvqAeDlEUK6m6m8+ColQMBneolYtO5sfvoJsTlBI/Ra1KBfpbe/hfe
 7SfflfBp+/2+Uzd+Jj1MUYV9gFm2UlesloRvkAGb/pFMBLtUFgtXRgD6xTmaiM2AGYih
 9Oh5o/3bgJCjg+vnaUvQ5+90TJjEl3o1zQ61Fo4cPrFs7ECM//Bdnl4AGYY20pGOjV+9
 FXLQ==
X-Gm-Message-State: AOAM531ZrhKfyIfV6t5aLLCLcD2ylIyRPOp1WqpfnchctTWTHjXWXhsj
 YsHoQMNpa9hRUzVKqySejaTJpbP278qEbA==
X-Google-Smtp-Source: ABdhPJzzChDgKE5nZ+7A8gZtSQIdIAGEkNfsqwFE9mXvTrY7ScAEj/IrizSVBk2N2xcUpFp7Zbdmzw==
X-Received: by 2002:a05:620a:24ca:b0:69b:f23d:ae82 with SMTP id
 m10-20020a05620a24ca00b0069bf23dae82mr2447309qkn.313.1649757858622; 
 Tue, 12 Apr 2022 03:04:18 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05620a405100b0069c45deb548sm275108qko.130.2022.04.12.03.04.17
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 03:04:18 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id v77so14095210ybi.12
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 03:04:17 -0700 (PDT)
X-Received: by 2002:a5b:984:0:b0:63f:8c38:676c with SMTP id
 c4-20020a5b0984000000b0063f8c38676cmr15315650ybq.393.1649757857406; Tue, 12
 Apr 2022 03:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
 <YlVJc3z1xXT2emIc@ninjato>
 <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
 <YlVLEnRaARVmWZnZ@ninjato>
In-Reply-To: <YlVLEnRaARVmWZnZ@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 12:04:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWAQ08K6NCdBGrY+-vBrsTQHi6UHaER4eCON1t9JEG1RA@mail.gmail.com>
Message-ID: <CAMuHMdWAQ08K6NCdBGrY+-vBrsTQHi6UHaER4eCON1t9JEG1RA@mail.gmail.com>
Subject: Re: [PATCH] memory: renesas-rpc-if: Simplify single/double data
 register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Duc Nguyen <duc.nguyen.ub@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Gabbasov <andrew_gabbasov@mentor.com>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_030429_289727_57FE659F 
X-CRM114-Status: GOOD (  19.96  )
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

On Tue, Apr 12, 2022 at 11:49 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > > +                     regmap_write(rpc->regmap, RPCIF_SMWDR0, *p++);
> > >
> > > Last '++' can be omitted?
> >
> > I know. But I think it looks nicer this way ;-)
>
> I have to admit it looks a little like "I copy&pasted without thinking"
> to me :)

But that's not what happened. I even compared the assembler output of
various solutions.

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
