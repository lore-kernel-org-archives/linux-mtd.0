Return-Path: <SRS0=1rsk=FB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74B2C3E8C5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 18:56:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F145321D7A
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2020 18:56:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q26jkTjQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPYHoK7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F145321D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0WZbfA6CWoV1GsKhgNzuzYms0Xw+l/Wa1rMfJ4HVsiQ=; b=q26jkTjQIvkkMzyq/6ZFNzOva
	+zwKbvAbK8+oOm7b6hPmlCNeVjdYUQFYtFIs48KlAkERSsyRq0KwYLr2727rcrcYC/c8+NOomVyzK
	FcuDAlSOk/rnifoXjRpzTnmxd302tL/XLHXRlyj4HqrO483R1ihUxxR8kyrs9bBRWJpL4wXhE7ElN
	CTX5mUAdbRdQduSwh6GW3himiQtOkwu3euH0c4a2h8S0AMa4z8ENoWN/7Gn3OHYq4aU2ptibZYhXR
	+32N/y+SZ2wxPTspDtJ+ElSGy5USq9v/NK54ysKlM9v4tBEE3z1lh9XZTYgHzBcuFS2JM5tX39Lb7
	DPd43/Z2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiitJ-0001MZ-S5; Fri, 27 Nov 2020 18:54:45 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiitH-0001Lx-Ai
 for linux-mtd@lists.infradead.org; Fri, 27 Nov 2020 18:54:44 +0000
Received: by mail-oi1-x241.google.com with SMTP id c80so6878482oib.2
 for <linux-mtd@lists.infradead.org>; Fri, 27 Nov 2020 10:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c3DOpGKcNuqaqLPfhIybZ4DKwkBEL6Fp9+iinumCxq0=;
 b=BPYHoK7WvONz5Wu61Z/bKc5Bhr3rGM9q5Jrq9ztWStaBRd0HCTZJLrMLcIszKg+cy/
 9FHdRpFB5C+PBidIIMmZkppgXVbhfAoAHZ2wAapO475ctjKcumPS4ocr2Ly9jJ/VRnD6
 15lI8JRnKAD7ujNzyOdUZr+9BFu8Kqonb5kaAqwnU6rDaQQx3duZUNtuP/4rJeogw5ND
 ZNX2MHtvujQGz8TSyTntnjgz/eidDVCYHJwB3IBBDO+rTa7XIoCnKSpKehv/G06N6RAr
 TmUg4+ozAsJr/nRWkfukP5YzBCpkpPXtCHYjvjTLXV8a4FlsfAoVdIfMpdr7hnmVu5o+
 aATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c3DOpGKcNuqaqLPfhIybZ4DKwkBEL6Fp9+iinumCxq0=;
 b=W+9DWYE/hLVX6hrzds+Z1nnTdKssI82vmVHtW/J3+VuZDzYV0QrSsMTDTTlOg6r5NS
 BlOJrPS+mV6ZZrZkYFJOJzDkDTfTjOy93dQvm27S6+N6IKsF0Mm3NRX2c5adSami/IWX
 hazGsTPXgu429JrMUBwVqQWofMx6QUAqz8mdrJez4eAI+BZOtAX8KvVeQgGuZMBKhP4U
 dMXiZt/exZOMwGxTXrB8lOcIAeCpjuCEJprwTNK44MxEA4pCr66mUQ6VxApE8d8Ty1HN
 HY1MIypbaco6H2XJoYQHyZqvZU7TS/2qnsV72Zesjt/b5AG/qbCldxJsfP0Xplj3yLQ5
 bp7g==
X-Gm-Message-State: AOAM532EB56l5IUNjC153MQKnGIXyh+k7UQ+X13OtDUyf20nk8oyYlQ2
 GhKTl6vZeZyJqxRr3k42RSRP3bNdhqjc1r3D+3A+TKN6tlg=
X-Google-Smtp-Source: ABdhPJxDTdz92QYgFKxhNOR2iBXHl8FwZTKA2U9M6iM+aK85NFetSAcJSq2aQejbK5dHboX9GvZdmnRycdcHtOhhpBc=
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr6619175oic.49.1606503281228; 
 Fri, 27 Nov 2020 10:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20200429165347.48909-1-rminnich@google.com>
 <2666350.AiC22s8V5E@sven-edge>
 <CAP6exY+hHrVvaMcF2tWUUJT=JS_J9NHx=92DzO=GAN==ACSh1Q@mail.gmail.com>
 <2124367.HovnAMPojK@sven-edge>
In-Reply-To: <2124367.HovnAMPojK@sven-edge>
From: ron minnich <rminnich@gmail.com>
Date: Fri, 27 Nov 2020 10:54:30 -0800
Message-ID: <CAP6exYJ7QR+Y7Vsumecx_3rUC4cNY4xJj4e6759S8US6FX7ADg@mail.gmail.com>
Subject: Re: [PATCH] mtd: parser: cmdline: Support MTD names containing one or
 more colons
To: Sven Eckelmann <sven@narfation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_135443_403726_77FAA41B 
X-CRM114-Status: GOOD (  24.56  )
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
Cc: Sasha Levin <sashal@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Ron Minnich <rminnich@google.com>,
 lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Schmutzler <freifunk@adrianschmutzler.de>, jstefek@datto.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 John Audia <graysky@archlinux.us>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks, Sven, for your patience, I will indeed try to test this next week.

On Fri, Nov 27, 2020 at 9:35 AM Sven Eckelmann <sven@narfation.org> wrote:
>
> On Friday, 27 November 2020 18:16:54 CET ron minnich wrote:
> > What none of the people involved in the original patch knew was that
> > there would be other ':' in use. Sorry!
> >
> > But you are right, my idea is a complete non-starter, don't know what
> > I was thinking.
>
> I am still not sure because I still didn't get what you actually wanted to
> change. I first thought that you wanted to change
>
>     mtdparts=spi0.0:256k(0:SBL1)
>
> to
>
>     mtdparts=spi0.0!256k(0:SBL1)
>
> which wouldn't work for me when ":" is not supported anymore. And it would
> break a lot of already working installations.
>
> But maybe I completely misread it. Maybe you wanted to introduce an
> optional(!!!) stop marker like !
>
>     mtdparts=spi0.0!:256k(0:SBL1)
>
> to inform the parser that it doesn't have to search for : before the !. While
> this could work for me, I am not qualified enough to say which character is
> not yet used and can be utilized.
>
> But the note about [ and ] at least makes sense to me (if it is optional):
>
>     mtdparts=[spi0.0]:256k(0:SBL1)
>
> But I am not sure if this will be a problem for people which already adopted
> PCI IDs inside the mtdparts without [ and ].
>
> > So it seems your patch, if it works, is the way to go?
>
> At least this is a workaround [1] which can be pushed to all the stable
> kernels which broke with the "Support MTD names containing one or more colons"
> patch. And the one which OpenWrt adopted now to get the devices booting again.
> It is only waiting for a Tested-by from you.
>
> > I can't think
> > of anything better that lets us preserve current behavior and support
> > PCI device specifiers?
>
> I am not that deep in this topic. So I am not sure what else could be done.
>
> Kind regards,
>         Sven
>
> [1] https://patchwork.ozlabs.org/project/linux-mtd/patch/20201124062506.185392-1-sven@narfation.org/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
