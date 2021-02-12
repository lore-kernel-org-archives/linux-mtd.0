Return-Path: <SRS0=iZ7+=HO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4375DC433DB
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 21:01:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED6B64DF0
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Feb 2021 21:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED6B64DF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+C9RUUQDkQDN9edT+dsBkKfQUY7SzIr+PjW77Dk7eZ0=; b=qUHmM+I5+uj9kLfvxGoIB4DwP
	AbbJfEw/BDJl4P2XT78NXQ5Y+oP8EyrT+DyfWhISN4mibeXqIND536+1UqfxUCwLaa1WirFhmynlt
	OKLA/tx/mTUq6jsoAXn+yJbsRofKTpojO2Qbg0mXDpJ2ONtTbtbqOPRE3zelzi/YS/uQV5Ax+jxa1
	LV5O0Lwo7eRm6ftJbJPwPZ3CDpQcTAC5uphewb5gBPQCIXeD075J83N9RVtWLJpWvF3d0Byzq3YS1
	bL/Z1IG+QlzIf6LTwDFyOUjssPqWk2f9xIpejqim9FQHivMoDlU27Z/Ra1mEdFAxBI9FSRAX3xfjW
	5Ue+ILCRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAfXt-0001NU-1V; Fri, 12 Feb 2021 21:00:09 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAfXq-0001MX-IF
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2021 21:00:07 +0000
Received: by mail-qk1-x72a.google.com with SMTP id j3so924022qkk.9
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2021 13:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7dfJau1Z2/Z0C+aryaDQsBuNGqh/xpuz6IGzQTXpFDE=;
 b=ho4MgAkccq9A6xs2pboGPRayWLr3i1qFp20B9cvS0cs2FcJ2pX12SHB6BFfaJ7Mcnr
 3bs50en/QfINHzxw+JBaURVEmpKQJzWWBlTnLwfSKcYhheuGaM9wQbUHI66qhMwoeT/W
 Rc4fMnk4XtdMHQNZZSgUDy6mFMkKyjmcMGR5WYJvBO0044F0iXkJc1wnREySood9aLLy
 aUZc6bhqES6O/zN+iCS5zXfSIfg1xAI1wNXbgHQ2D6dyBMV8X3d9D4kTujrzNa5SAS0l
 CbNnvd7LnTc3hrSyS6nqLdkn+p/5EbKzoXr8AkKudTP1CTVbJez7nx5xyrlfxQJDoMfJ
 1naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7dfJau1Z2/Z0C+aryaDQsBuNGqh/xpuz6IGzQTXpFDE=;
 b=lg2QsssT6X8anQVEfljw5tJsUZxsWZEcOPg1+kpU2vPMO9es9DBqXO3dRvpXPShGBj
 CsJx7t0/fW5q/tgI8ONs7RseE8QsH4b2PWX50X9o+JjOYat8ZKbcY2DHLI3nGxczokS8
 hPkzBRyAmkkwzeVzS9+ia1DrXzv9ufTv6NRVO/ilofspenvUtU7PYpySdpF40qvHBhvb
 EkkUDHD3k6pWO17tZMquft+mWUJrbDrePFvbKZBOE0IhqMPctBADdZ1IfXyHH7PX1WRH
 K39k/jORiI/IwXg3kFM6oztI7ZTx8W5DGGusQ5ao4h7J+DlO/0hGiHS/GRgugUmKv9Gj
 UeZQ==
X-Gm-Message-State: AOAM533Fh86zVzCd+frD+Lf50fG97KBvBO+8xo0PtsV+PmX0/V7KjX5A
 atDxX4Ttvfo+lDWqhXLi6kkNeBxBzWq1S0Le8fc=
X-Google-Smtp-Source: ABdhPJy6Z0W4TyuKig4+Ca8RyGe2t1thus2KTVLAwJ8xpq6uicWcz6au/b4OKzrdNujYwPgFz/7vK2/TPBawsLn+Ass=
X-Received: by 2002:a37:83c3:: with SMTP id f186mr3910863qkd.185.1613163603085; 
 Fri, 12 Feb 2021 13:00:03 -0800 (PST)
MIME-Version: 1.0
References: <20210202124838.30805-1-jbe@pengutronix.de>
In-Reply-To: <20210202124838.30805-1-jbe@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 12 Feb 2021 21:59:52 +0100
Message-ID: <CAFLxGvw=5uK0AHmMq5vqOWiBzS68TBd-vU3G9mpWeTXeO5B47A@mail.gmail.com>
Subject: Re: [PATCH] fs: ubifs: set s_uuid in super block to support ima/evm
 uuid options
To: Juergen Borleis <jbe@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210212_160006_651494_0E7B2C56 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 1:55 PM Juergen Borleis <jbe@pengutronix.de> wrote:
>
> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>
> This is required to provide uuid based integrity functionality for:
> ima_policy (fsuuid option) and the 'evmctl' command ('--uuid' option).
>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Acked-by: Juergen Borleis <jbe@pengutronix.de>

I took this patch, thanks a lot for this but I have changed the sob-chain to:

    Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
    Co-developed-by: Juergen Borleis <jbe@pengutronix.de>
    Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>

Namely, "patch was created by Steffen Trumtrar, Oleksij Rempel and
Juergen Borleis.
Steffen Trumtrar committed it and Juergen Borleis later sent it to the
mailing list".

Is this right?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
