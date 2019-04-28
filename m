Return-Path: <SRS0=50Qk=S6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A290C43219
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 11:39:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD658206E0
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Apr 2019 11:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q63lkMgw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtxRaaz9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD658206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GnB5uxd+nhCgQ2zTsPsKyf+RcxFeGl8E8OaXrts3BAA=; b=q63lkMgwOVYGU6ASNnR96hf2z1
	CInwEWt+6RvYgT9A9ROl9YI5O3HyN4X65qtxAE+gbdQfXKncMfM2Fs86R1Rm0I1eGtFy0gtfK3YiS
	VURhrSSLpDDHRFBSUEdbTwCxXSU5P8b8GV+0k+L7/KCGepS52Cxs+EeM5pvNgyGyFt81zDuZcpyCZ
	B7TY7cfFPS6SbSKPJZhly7MSip0VdaGCABhyUY/pwd8WFAg3S1Nrt+DUjqRGJ9e62FArkd4zeNNPY
	N9WsCKMn1w7V0eN6CAthOd1WHxM8DQvbsQlLJ1B8gh+4cY6IgQ9ga02hSop9N7goLR886u93DVWzp
	nLrUAlmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKi9C-0003Ti-CS; Sun, 28 Apr 2019 11:39:06 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKi99-0003T9-2F
 for linux-mtd@lists.infradead.org; Sun, 28 Apr 2019 11:39:04 +0000
Received: by mail-lj1-x242.google.com with SMTP id k2so6811104lje.10
 for <linux-mtd@lists.infradead.org>; Sun, 28 Apr 2019 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=22YuqtK9RtwERFLjsQEkDEKPFKX0Gh6j46PPVU6t9Ac=;
 b=WtxRaaz9Xz7Q9mzS3x69f/1zcO4S4qw7OmtXelLh8XiRbzOOi6x6n7m72+kWEnCBqR
 uf4M0pVAS5ocBH2wej1bDXd35/X/27uFmULPjqROdEf/klU31J7jilokOywc8yoGrgrL
 7aICLtjiOB85Qy9DiOZ4Zpv3zrPu7bHQWrarHwpTso6rmbFb2ObNfSsafdiiIerP2zUo
 uqZPgu7vRwFKmgi707mNRqYk5R5KMxMjItn96EuSv+u1W7zuu00jvKBjWxu/RmYr/HLG
 ypcefAKNrrnpMHHGv7bIJJPkuIja3KNAhsJVNxyNwiFzry/qd3yi2hvNzw1R83U48aR7
 CE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=22YuqtK9RtwERFLjsQEkDEKPFKX0Gh6j46PPVU6t9Ac=;
 b=BYH0N1KDtyzoFZS8Pbex6Vlzq3SLCrmAt8VTfPzuAj/EiUKVjgYTQZZJSZ2bxMLhoH
 2MJPpfiJfV9T3u0e3mUct6iBOH2+c2CNldBZwHKMcnFE81+lSi//yt7ONdIVJ7IL4ZhA
 ykThHrOsl+5Q0EZiYUz/XpMr89fYBV5qWmD1vPZ3hKiIgPrStnnCZUeqt4FghyC+BRmb
 aVgjlFSLf8aJ/DFVAYnpMy7TlPWTsst3sbc1yCQ5oGDuqt47FcmuTARlK1+bF0NCp2Ke
 UFca5G+fdt1drerbH7cG+fX1xmaS9FWcLdpv2zG8Fax6nyvm5NL0pa2iCWWUvQgdO2gx
 G+PQ==
X-Gm-Message-State: APjAAAUVetWYqXmNibK5PhxooatArqip9sCI6j3xOcoCHrcKjp93xnkO
 EA2u8NAmXRsKsfMMkYKY2Ql4H0ZqlQ5MBqZmt0Yi1w==
X-Google-Smtp-Source: APXvYqycDgmTDRQ8AX+ajIjkVRYm2QRZZWmKRImyZThqvLlfB8PvxLMXdVoWPlbhMpCDnEeF0osqQs4vagzAF8y90eg=
X-Received: by 2002:a2e:9547:: with SMTP id t7mr8620939ljh.153.1556451539173; 
 Sun, 28 Apr 2019 04:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190128135449.15555-1-linus.walleij@linaro.org>
In-Reply-To: <20190128135449.15555-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Apr 2019 13:38:46 +0200
Message-ID: <CACRpkdZpXVTYzaJgCYJN9Vw7NHtD=_KgpDeqYaeTam+sO6-UqQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] mtd: afs: Support AFSv2 parsing
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, 
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190428_043903_173064_AE39F22C 
X-CRM114-Status: GOOD (  15.13  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

On Mon, Jan 28, 2019 at 2:54 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The later versions of the ARM reference designs use
> AFSv2 with a new type of firmware header than in the
> v1 version found in earlier versions.
>
> Extend the AFS partition parser to suppoer AFSv2.

Ping on this patch set.

I recognize something must be holding application back
as I actually submitted this for v5.0, and then resent this
for v5.1 and it doesn't seem to be getting applied.

Is there anything I can do to help?

If I get an ACK from one of the maintainers I can
ask the ARM SoC people to pull it in instead.

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
