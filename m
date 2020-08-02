Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AADCC433E0
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 20:19:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9C120738
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 20:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZnWvnRZZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPrxCDXx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B9C120738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pyu8UTieL8B3d2AiD3N69e87DReHEEj1GbXo7jiEP6c=; b=ZnWvnRZZO0UwY498jFVoftIj4
	7Mru6H7ht1JVsM3alyzX1qT+sda+vG/tV3i8L0sBsKRZOXA9rwxmWGO+rcv0BgPH7zLGf6XQ0C0S/
	V1oB3i5sg1Eh23gropMAKwASzeBheUcY1uaWCi4J3sVPL2syb/gbW5kCSNqGqMe5qhYto+xGHEcRt
	7Vb5gFs4NfU6u36cvsoe+ZKQa+6nlJQ0sZnAwG8NzSF1SEoBs3kD3IJ69l3rT9LWNmCt5m0eWxwnU
	ppamGYTAlN94xrEpCQcJRDRrrdvl5wr7/7jBrF9LGYa1Y7tj9hYtgyg2kH3mLjSDIbfAHBe7Czqsy
	8cWtJg9mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2KRd-0007hp-D3; Sun, 02 Aug 2020 20:18:57 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2KRa-0007hH-RT
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 20:18:55 +0000
Received: by mail-qt1-x844.google.com with SMTP id d27so26853680qtg.4
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2020 13:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X4el0gauSUjNsfXwiz026OMHpfpwY+zK0Rf376j3X2E=;
 b=oPrxCDXxF8+UTKdjo8Y2pj1vrKNPbd5hJt1iSjfSWt0wpQT8id+oSTMszbk3iMH0xl
 rZT4+zC8UqDUzG1GOqEiYdp8zhfu9XxXN9Ou694NKA9Mi76LaJv/0o7xtUu0jwEGxTAM
 oUyuG36o/YF9NZTsaOwP2GaoynLI86ecYS/1mxskLP04dG48w7C/xVver+P43vzK/cK8
 d/bTCsI/aajwsjiD6hJspFSPQg4CEeNs6x23jPKplIEva2tHQWJnNuFBW2I8v+ATAfEx
 yx/VWe5xNffckYOVzpVBlGI+H0/HNP/RotwjwTUpPzD/t301IjvMgk3aQHr1cjEEdBpA
 N+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X4el0gauSUjNsfXwiz026OMHpfpwY+zK0Rf376j3X2E=;
 b=Bf9HBYwg0Vm6QkJaYFZp0jE6vE/uVdCr8sOMUwTI86bj4CvDls1LddS/7MpttiDi9u
 mxIYUC7Xsf30W7L+WZuzkbwHn2Z/0ZsdOgriuo9KPNQs+/ubq+4rOxifs7s+8NaxztBt
 uVA46VmT3Qt2qcd0n2/GYu12hW41rp23thEQQ/V+FS72n82/WgwQK3N1c/KvRam7kXfM
 jD2QbrERVo04BwzeaKQp+IOkeNN1p5eTV4wzmAjVqwZNCMNH2gbgviAWrZl2sm/22sNO
 S+SqSl2bGWO/HZipz8pW4Q5kZarKcry4bUN7jizU2608owa5dttvUkT6Oigv7HIElmBV
 W6dg==
X-Gm-Message-State: AOAM531MwRBO4OaskNAOAm6iMFRkNuD74tnQC3Z7YO9akEnsG8KcddGa
 RAALfiNLEWk3okOBAUx9HtzxTnYBzZb40A1A+d8=
X-Google-Smtp-Source: ABdhPJxLswAM2iqijoI6Y6gAsJmFssQq5vci53Ywbt2DOYFE2LWn010VC6DRW5Z8P8CKREVmppFrGjsNMfkPrTJI7Ec=
X-Received: by 2002:ac8:72cb:: with SMTP id o11mr14123745qtp.13.1596399533145; 
 Sun, 02 Aug 2020 13:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200713165408.36229-1-grandmaster@al2klimov.de>
 <20200721015258.GA3362089@bogus>
In-Reply-To: <20200721015258.GA3362089@bogus>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 2 Aug 2020 22:18:42 +0200
Message-ID: <CAFLxGvyxFjy2cSWgokb8=d_FoGCX4QVbnoLYdLqybKCypoBWLA@mail.gmail.com>
Subject: Re: [PATCH] mtd: Replace HTTP links with HTTPS ones
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_161854_926782_5F8E1F6F 
X-CRM114-Status: GOOD (  23.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Arnd Bergmann <arnd@arndb.de>, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2020 at 3:54 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, 13 Jul 2020 18:54:08 +0200, Alexander A. Klimov wrote:
> > Rationale:
> > Reduces attack surface on kernel devs opening the links for MITM
> > as HTTPS traffic is much harder to manipulate.
> >
> > Deterministic algorithm:
> > For each file:
> >   If not .svg:
> >     For each line:
> >       If doesn't contain `\bxmlns\b`:
> >         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> >         If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
> >             If both the HTTP and HTTPS versions
> >             return 200 OK and serve the same content:
> >               Replace HTTP with HTTPS.
> >
> > Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> > ---
> >  Continuing my work started at 93431e0607e5.
> >  See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
> >  (Actually letting a shell for loop submit all this stuff for me.)
> >
> >  If there are any URLs to be removed completely or at least not just HTTPSified:
> >  Just clearly say so and I'll *undo my change*.
> >  See also: https://lkml.org/lkml/2020/6/27/64
> >
> >  If there are any valid, but yet not changed URLs:
> >  See: https://lkml.org/lkml/2020/6/26/837
> >
> >  If you apply the patch, please let me know.
> >
> >  Sorry again to all maintainers who complained about subject lines.
> >  Now I realized that you want an actually perfect prefixes,
> >  not just subsystem ones.
> >  I tried my best...
> >  And yes, *I could* (at least half-)automate it.
> >  Impossible is nothing! :)
> >
> >
> >  Documentation/devicetree/bindings/mtd/davinci-nand.txt | 4 ++--
> >  drivers/mtd/chips/Kconfig                              | 2 +-
> >  drivers/mtd/maps/Kconfig                               | 2 +-
> >  drivers/mtd/maps/sc520cdp.c                            | 2 +-
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> >
>
> Acked-by: Rob Herring <robh@kernel.org>

All three mtd related patches applied to mtd/next, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
