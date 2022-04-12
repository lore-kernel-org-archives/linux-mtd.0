Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EF6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8nZzDGIv6eDIwVj96fnpMQWT3ZZaUNVtZM7AlXPW6k=; b=xjwp62Dt4s+DVC
	99+5KjgeokgR2gnuDdrZzn40Qi47GJctmvwQa39rK9VFtl7FTYIHgzcQxrOx/8/SD3pj8OIeQ3E5V
	nLQsbyz4Y+DUc9vLF5NEgQMzNWrSJswawKdJxoSCgjXyNK8pFEoYyT3l8NABpG+V7sUZaU9yaxYlz
	K6lpIkywHDk09JMeg1uqD9WSdLDSPeDd5Kl+jaEmLDDdFgiJJNLxE/IpEJzTB69Qp+Or7077Q5LpP
	XEGc3HBuq0cTOlVjr5x94eIc4yPC4RAyAb3Aga/edNTdEkz27A4EXMX+uq1SGaFmuNmQe2c112KgK
	BkUfJJADEcFiP3xNB55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neD5g-00D0t2-Lo; Tue, 12 Apr 2022 09:45:40 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neD5d-00D0rW-FL
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 09:45:38 +0000
Received: by mail-qt1-f178.google.com with SMTP id z14so4519584qto.5
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 02:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BYcXejDmOeWgzk9C0JmypYS2H5WpNhj4UivpuQIYqc4=;
 b=m0qub+pHwUVRjSVtzpSiLu8fZQ0J0sinSPFdX6gmUfre4/IBJzJmjdJR4wnNlTbUUC
 iFkKa7jPRiD7SGTsvWiYlCRSUEnEf+NCTGaAn9TG1aKJbNRymTql3VzPYStmgkp71JQC
 CsCQXoh26Zu701RLUJQrA5wvtTfkMwYsndOHyOh5jMHIiI9k0uZuWt04Qm/KYBATFAPL
 4Jidx/cDQhPlsFRR5Xl0u0AOMGideyvLVNJTkkOYS/zgxhFtcE7j9FCXBq+yfQqY4ojq
 an183w0eDudNSPO19pB7MAN59S1MV2SOLZYkBWK6xDcxoRtZZxzascJ7aLA/sbHLMSME
 oMLw==
X-Gm-Message-State: AOAM53227Ywbe6HcuNHT6cUewR6KzGzqsUNLpC8Um/qzNi9qOc7Bkn6B
 i1/gwPfvbA1Oh4HAilpcfzpVgIEGYyFpl7zy
X-Google-Smtp-Source: ABdhPJyvO+euVt+oo2sUGS0EKuKLsdaSKmaLd0UYeEaz6Ga9Nib1D9eysi4r53qdUiA1SFEL52coBg==
X-Received: by 2002:a05:622a:5c6:b0:2e0:68ec:3bb3 with SMTP id
 d6-20020a05622a05c600b002e068ec3bb3mr2558122qtb.207.1649756734395; 
 Tue, 12 Apr 2022 02:45:34 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 p66-20020a374245000000b0069c387c5449sm1565858qka.9.2022.04.12.02.45.33
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 02:45:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2ebebe631ccso110360577b3.4
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 02:45:33 -0700 (PDT)
X-Received: by 2002:a81:5210:0:b0:2ef:21e3:54dd with SMTP id
 g16-20020a815210000000b002ef21e354ddmr2967434ywb.438.1649756733392; Tue, 12
 Apr 2022 02:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <19358863deae03b1b26f473e878305a1c6e40d19.1649681638.git.geert+renesas@glider.be>
 <YlVJc3z1xXT2emIc@ninjato>
In-Reply-To: <YlVJc3z1xXT2emIc@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 12 Apr 2022 11:45:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
Message-ID: <CAMuHMdUGkba3hiRJPEw26oBdc6_MK_eBO==Z9QeinaoeZv8Qbw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220412_024537_552690_F8DC5334 
X-CRM114-Status: GOOD (  23.58  )
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

On Tue, Apr 12, 2022 at 11:42 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Mon, Apr 11, 2022 at 02:55:29PM +0200, Geert Uytterhoeven wrote:
> > For manual write and read, factor out the common access to the first
> > data register by keeping track of the current data pointer.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Works fine with reading/writing on a V3U, so:
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I agree the code is more concise. I am not sure, though, if it is really
> more readable. But I don't mind very much, so except for a small nit:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks!

> > +                     if (nbytes == 8)
> > +                             regmap_write(rpc->regmap, RPCIF_SMWDR1, *p++);
> > +                     regmap_write(rpc->regmap, RPCIF_SMWDR0, *p++);
>
> Last '++' can be omitted?

I know. But I think it looks nicer this way ;-)
The compiler doesn't care anyway.

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
