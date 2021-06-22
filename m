Return-Path: <SRS0=6QP0=LQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64606C2B9F4
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 15:32:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15F5F60FEB
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jun 2021 15:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15F5F60FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dbYKm2ffozF+QyjsG9TL0x6F/bB8qj/KJaJ5r429kZg=; b=Y15JvKUIFIdA5g
	Y1gh0rRbyzIoZAysHAyIebdR4A6eAMh2VtRpeaXUNsBr1VBdZKzts0gblQX8aKnPTpUJ2KycMBtvj
	qXO6ErqMwHVj2dJk3dSYG3N4IuSjyTbFqU1uwBDdJ7uXaHrpBdv0KuHmLsFdvyscNwCXLhS5Sbwk7
	fhO/luYPJxkvgaZskykvghEcVHqjNUF1JyMpexh/UJgFN+5lwUepD+Tqu2/WLVIS1nZ7ixF7d3otS
	6PfBpLuIPO4jnLtXwmRJaXCSYgUon7KIy83U97Ka2SU6CtcgcEKyKu3mce2gScNjliw/6ClD0Tyuz
	HUGpj6K6V4ChBhJyACbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lviNK-007iRw-JO; Tue, 22 Jun 2021 15:31:42 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lviNH-007iP0-Cf
 for linux-mtd@lists.infradead.org; Tue, 22 Jun 2021 15:31:40 +0000
Received: by mail-lf1-x12e.google.com with SMTP id r5so36688088lfr.5
 for <linux-mtd@lists.infradead.org>; Tue, 22 Jun 2021 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZQlvZ6Ddmcy7bc1M4PIfx6EtMyfuVpDT5bjWUayyRQ8=;
 b=SkgcrGPcOPWO42gz71Dr5UY5QvKXhzHQYvGQXi471A85RrqboPk+fKuQYkI1srDy1n
 4FX/ZwKhIMgnEes15ieq8N7A+sm87n7kDrYM4bhvSkcXcEHwx8fVYvALMeq7H1M5iN+U
 OPz7NYwj6MgIPL7ohOFynVL/hWbo+6f3XoSEmRGLsj/mfVkju7SdANx1dp60gEIJhxW/
 /Xk4/Bj81AzEiQyqe0ELutLopeFfZ6uBuTnUTY6KnuKrlPeSZaRpZ7tVpAGAxx/HkZ2a
 ynIYtUSx+HXoifTdAiUAjaDPZTWm2FKMXIguayIfo0YdeQU6/DYiy6qmHCV2TUr2d9xM
 ebvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZQlvZ6Ddmcy7bc1M4PIfx6EtMyfuVpDT5bjWUayyRQ8=;
 b=UCUjOgV/yrFdDyaLWMHb6HmvxuiUlUaWuwoDYXeHs2g2AIA2xSkXJd49cmp6NHhVzD
 X4AR2pjKcNxdlXSl0uk9jYzUP4ihIb9fRaEfh9wp9lzc6HkagMd3wAg0k4HjUjKVyoMj
 6mFQo05zum1ngld83KK1a/4m7+VOI8YB0EGjmi2jvDZNWnYEcWugCdlm4SgjSnd8WV0v
 mgtCkmm5F+Ork0UxIVC6X3Rq5Fv3SJNaXrzLgW1RmY5CwsIu0W3LmYEuHNaaijnR+YRD
 +PYNx1CjZ/pqGabdiVXHfhcOG/hM0vmitGYyJB3l2O6gRS1AkA4kNk5Mj17XK1bGL/qA
 fPfQ==
X-Gm-Message-State: AOAM5333F4r9OBotg6j8TY/GD6ielrEnd/W1AqTgWEFj4omEbo8V535e
 A+xGGoGr+Er8S6525NALYLb4DA9JUvJ0ChtuQ0A=
X-Google-Smtp-Source: ABdhPJx3S9WghncUujJP6EdjH4ueyeLBMfci/ggX3NpXvFHzVyz9gpEu1PdIGVLEI8/sJV8hFlJISH4aAZ1WHToVJ2I=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr3294348lfk.583.1624375895831; 
 Tue, 22 Jun 2021 08:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <YMyir961W28TX5dT@mwanda>
 <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
In-Reply-To: <67e49b8b-a80c-87a0-c5bb-8d5cf9239328@denx.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Jun 2021 12:31:24 -0300
Message-ID: <CAOMZO5DLxM5nU4HxLT2DzKvmG1Vv1LNSdUoB3m7iZ1mpgxBFxg@mail.gmail.com>
Subject: Re: [PATCH] mtd: mchp48l640: silence some uninitialized variable
 warnings
To: Heiko Schocher <hs@denx.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>, kernel-janitors@vger.kernel.org, 
 Colin King <colin.king@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_083139_474077_EE6DE697 
X-CRM114-Status: GOOD (  16.47  )
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

On Sat, Jun 19, 2021 at 3:23 AM Heiko Schocher <hs@denx.de> wrote:
>
> Hello Dan,
>
> On 18.06.21 15:42, Dan Carpenter wrote:
> > Smatch complains that zero length read/writes will lead to an
> > uninitalized return value.  I don't know if that's possible, but
> > it's nicer to return a zero literal anyway so let's do that.
> >
> > Fixes: 88d125026753 ("mtd: devices: add support for microchip 48l640 EERAM")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > People, when we add a new driver can we make sure the first commit uses
> > the new prefered subsystem prefix?  For example,
> >
> > "mtd: mchp48l640: add support for microchip 48l640 EERAM"
> >       ^^^^^^^^^^
> > Otherwise it's not clear to me what I should use as a patch prefix.
>
> Ok, sorry...
>
> Hmm... Colin already sent a fix for this, see:
>
> https://lists.infradead.org/pipermail/linux-mtd/2021-June/087140.html

Yes, both patches work, but I think Dan's solution is a bit clearer, so:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
