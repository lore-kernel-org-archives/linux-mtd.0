Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F686C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 25 May 2022 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MB2KwOCi6gXfrEsynOsp+joKCHoWOi27v03PeH4jq5o=; b=RWSf4S0AWmJbn8
	oEZ13CPD4k+WXEtL6xhC4hDBOmQpELazVIdWDcIf2K8RLU3P5/ZtvY2mzJv9nQ96yLR8pfp+oCL0/
	WXHdXoNp+rNJ8mhg4tG54rjJWzuyt4a/KrSozdLTC2KJdlLBDPU//X2xGxGWh0lmbhyI5pUgQ4qfX
	YJiYyYbCgqZPXdVOSl7AX9LTZnW/lNMKO7iQyXPzaUFgy+++O/DDKrHfC5XO+l/y139MTNNaTffOK
	ozrY85gOYvvfWN8YWgieyqhPtHb9eJ2p9gnOz4JzO5CjEFNC0OQ45+ATpfJPWs152kMBEDMaqkOSN
	YmaQQJPMA1zY0nzH30YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntmTT-00ARUe-7a; Wed, 25 May 2022 08:34:35 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntmTG-00ARRF-PZ; Wed, 25 May 2022 08:34:24 +0000
Received: by mail-qt1-f180.google.com with SMTP id hh4so16442353qtb.10;
 Wed, 25 May 2022 01:34:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0kND5Wa+9pOerRMBCYU4fSimE0yKktYBrnLP5AV+p8=;
 b=zAJWyaofAw+PuVbPWc9lXD/78E7Ycmj4BR+m7up9IfWjjkZlupsKTKF3nf3KML0KlK
 eWDZuxRuiXocSBd9+Sbu18Kip0/kZcQLx9fv+vxiP1+A29r2/Yhic4Ks9aTawjXWYr6A
 i4B6ViWlr7oaorCoRB8sRcHBG22AKFcqR5PQp/QTmHTXNqddSUzPe0v66U4GQBnZH8KJ
 q78DV2oCKTYvC9QrA05Sbl+yg2vrM4C++dqcxw9Vt+uMTiqJ2ipcwlRV5oEOT/DWQfSk
 uvpAnFmt0fqDC46dr2TKfNwpdmn8eCtNiDnSAlki05BuP3OjIewYR9syMiWhYKw4QVbX
 ySQQ==
X-Gm-Message-State: AOAM531MGE3/gJJsIMHDv4eXMyidbAyrSWjZLn/0DkXAKWCxO1auTcgY
 Yktx1fw8alsVk+6xA5tOEqQwrYfBixxtrw==
X-Google-Smtp-Source: ABdhPJw2Qv2mtg97Kd9on7SYMafTgWfYeuoB0AbOwlQZ0Alj2waFcZnnFQgE1DOhRhGCMC+eKAEoUA==
X-Received: by 2002:a05:622a:1d2:b0:2f3:f4d4:4c63 with SMTP id
 t18-20020a05622a01d200b002f3f4d44c63mr23425321qtw.678.1653467660340; 
 Wed, 25 May 2022 01:34:20 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com.
 [209.85.128.178]) by smtp.gmail.com with ESMTPSA id
 bs5-20020ac86f05000000b002f91849bf20sm1041585qtb.36.2022.05.25.01.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 01:34:20 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2ff155c239bso207463667b3.2; 
 Wed, 25 May 2022 01:34:19 -0700 (PDT)
X-Received: by 2002:a0d:d493:0:b0:300:43da:57f0 with SMTP id
 w141-20020a0dd493000000b0030043da57f0mr4494354ywd.502.1653467659521; Wed, 25
 May 2022 01:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <b36280be-9993-9a78-0960-4094efeed1aa@linaro.org>
In-Reply-To: <b36280be-9993-9a78-0960-4094efeed1aa@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 May 2022 10:34:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL93+r0cofwHKj1k-gUo9nk3OzUf6gtY68sK4JNibyNg@mail.gmail.com>
Message-ID: <CAMuHMdWL93+r0cofwHKj1k-gUo9nk3OzUf6gtY68sK4JNibyNg@mail.gmail.com>
Subject: Re: Getting rid of infradead.org - corrupted subjects
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: workflows@vger.kernel.org, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 David Woodhouse <dwmw2@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_013422_871845_FBE178FB 
X-CRM114-Status: GOOD (  16.12  )
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

CC dwmw2

On Wed, May 25, 2022 at 10:07 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> The address list is semi-random as I don't know whom to approach.
>
> Problem: infradead.org corrupts email subjects by changing:
> s/,/, /
>
> Examples:
> 1. Previous discussion with Uwe about linux-arm-kernel:
> https://lore.kernel.org/all/20220215125856.es2euyoqo6mp4y2t@pengutronix.de/
>
> 2. My last email for MTD
> Modified email:
> https://lore.kernel.org/linux-mtd/20220408063720.12826-1-krzysztof.kozlowski@linaro.org/
> Proper email:
> https://lore.kernel.org/all/3e550deb-7c27-894b-a0b5-62609a60f17f@microchip.com/
>
> When people use Patchwork or b4, the email from the list is being used,
> thus the one with a changed subject. Example:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9547c4e74f6b4b56c2f9e4e7a286ce126fd333fa
> The subject should be "dt-bindings: mtd: jedec,spi-nor: remove unneeded
> properties" (no space after coma)
>
> This leads to real commits with a bit odd subject. At least not the
> original subject.
>
> Can we do something about infradead? Get rid of it and move the mailing
> lists to vger.kernel.org? Or fix it?
>
> Best regards,
> Krzysztof

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
