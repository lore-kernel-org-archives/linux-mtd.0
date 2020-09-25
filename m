Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCCAC4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 09:37:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546B4207C4
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 09:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JKYFEa5b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gQDqhM1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 546B4207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HXeY/nVQLKu7ZuEhcQfJsptx/Iz8qKgtIqY8WjPbxhs=; b=JKYFEa5bCvCCcxBptNuSEeZsm
	IsfFBJz0ehGIYjIKKillO3W92Wo+6AEekJDeQRbXWtJvowerWsZoxcN8RHkARUhJZjNWhmVMbaGwj
	K9oZVP1I4m4O30EgcVwDqYY9ToTz5Zvyheh1+oNFHRDHxJQAJQrHRxS+/CAWcMParzHcxWB5YssJd
	aOnGA0PGbwF4A8Rey5oaHG9BD/3xuM9bD+t1z8eUBzA1RL98fnPVMIl0TyMYCloiFLU2U/iDEueEV
	5W1NCGdKIYK52/H57+5GMmYDU5pI24Xrdx+Pw6yNwXKqKJSIfTTuPsg2ko6G5EblQ50lBNJlm6tF+
	rYCBu01Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLk9R-0006L3-55; Fri, 25 Sep 2020 09:36:25 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLk9N-0006Io-SZ
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 09:36:23 +0000
Received: by mail-vs1-xe41.google.com with SMTP id j185so1024954vsc.3
 for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2020 02:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CopwlfwvxR6TDA4NEpPReJrXwzQ2YdaVXCfZyj+KeI8=;
 b=gQDqhM1EBxhhdAdupXGC+mi8HP42zIBAb+/5WouwU0pwYgc43PjnSIDyqhNXoJBgwE
 nA9S7PMscej5cgQCrvf55Dp29QyMHvwUDUtmdsjDRjaEHcRFBhd7dmLwMWl9mvoH7sp/
 4lRasNIvYZAFCtIP9ZaogcqOJXzEYU/4iYpzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CopwlfwvxR6TDA4NEpPReJrXwzQ2YdaVXCfZyj+KeI8=;
 b=WqMDXOuM9LmEF3x0+VoDZYii9OxbtfGa5lOfgDza0tMXa84tt7ZQ4rj3dEua0DpN+c
 IvNWrXkP7FkEZuk02e2/1Zh6FqKoYRGy9rzk5Hyr5ERUEhJ6/XhR3lSlJ3EEOuWm7g8P
 f7PaUnGuS5sczSp/zv23InAHHZNcjgYjmQ9YUvTEe8/OkstzQSNugwUZ+wtFB7/jalF3
 MSDe0QfKVHmAbJNyh1LqrrH3z4AQI6t00bLApi6iGpe/nYkft7M7srdV7+Ez9fwSQIch
 KZh/r35yKXP7KUgyd9SI+8uqRB6ZGuMn5J2sZ642rdT0a6EIkIQ30Gb/zcWvdZdceK1S
 v+Fg==
X-Gm-Message-State: AOAM530x8LmUbvfqHxQl/CsN4itn+qft6HYZoZMTJ2kJhNq8/K1q7XUV
 +tCN9MU91ohBCvBduKQb9zfU8RPgL3Rhbqgxij3s0A==
X-Google-Smtp-Source: ABdhPJxdJedhGCUBzFfJjDuMt5UWKrHFjl71MnBQbIp5LNRnu+DHrChmvGin2RNOLR4c+TakRNBVwDRVvnRZRQt2lqc=
X-Received: by 2002:a67:b917:: with SMTP id q23mr2061999vsn.37.1601026578879; 
 Fri, 25 Sep 2020 02:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.2.I48d59ef5398f3633c6ebbab093da6b4b06495780@changeid>
In-Reply-To: <20200925145255.v3.2.I48d59ef5398f3633c6ebbab093da6b4b06495780@changeid>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 25 Sep 2020 17:36:08 +0800
Message-ID: <CAATdQgB4Z2msO_RuOuVMLaXYrR7WnGsSQbjOWMTFWT7PCjH+PA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] spi: spi-mtk-nor: fix mishandled logics in
 checking SPI memory operation
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-spi@vger.kernel.org, 
 linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_053621_958729_3D6CD66D 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 2:54 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> Fix a bug which limits its protocol availability in supports_op().
>
> Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---

This is also duplicated work of https://patchwork.kernel.org/patch/11797723/,
I'm going to drop this patch in v4.

>
> (no changes since v1)
>
>  drivers/spi/spi-mtk-nor.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 6e6ca2b8e6c8..0f7d4ec68730 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -211,28 +211,24 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
>         if (op->cmd.buswidth != 1)
>                 return false;
>
> +       if (!spi_mem_default_supports_op(mem, op))
> +               return false;
> +
>         if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
> -               switch(op->data.dir) {
> -               case SPI_MEM_DATA_IN:
> -                       if (!mtk_nor_match_read(op))
> -                               return false;
> -                       break;
> -               case SPI_MEM_DATA_OUT:
> -                       if ((op->addr.buswidth != 1) ||
> -                           (op->dummy.nbytes != 0) ||
> -                           (op->data.buswidth != 1))
> -                               return false;
> -                       break;
> -               default:
> -                       break;
> -               }
> +               if ((op->data.dir == SPI_MEM_DATA_IN) && mtk_nor_match_read(op))
> +                       return true;
> +               else if (op->data.dir == SPI_MEM_DATA_OUT)
> +                       return (op->addr.buswidth == 1) &&
> +                              (op->dummy.nbytes == 0) &&
> +                              (op->data.buswidth == 1);
>         }
> +
>         len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
>         if ((len > MTK_NOR_PRG_MAX_SIZE) ||
>             ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
>                 return false;
>
> -       return spi_mem_default_supports_op(mem, op);
> +       return true;
>  }
>
>  static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
> --
> 2.28.0.681.g6f77f65b4e-goog
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
