Return-Path: <SRS0=b6Ll=HI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74106C433DB
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Feb 2021 13:01:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2039264E5B
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Feb 2021 13:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2039264E5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4/1XxkpHkYQqPhBdw3a5hynkpcOwJPNps7qfjlregh0=; b=EY18S5rFST0kdI9wqFSiAyLqz
	eLWE21fB1WHV5hGdd+P7KQ4W9ZYAtWCd6sbC//4xI8LNFoMwgXVWDQ4wtlJ+rxGc9GCyyCnpB1Ed+
	NvRpM/ncjP0uIgRp7SthyalfI3G4f96uOnhVgY/XkTOpqF1rn7fsZTsLtUFYlUgQXZUUE6+eJRtQL
	I/5WG9YFTVfL41d3FYU9/WTC3FMGv55GTFnKH+XMmLvVrXq3QKspIWz3A++DR5Yyi2aQxT6PwCwIG
	swbOL89HE9GQxQHNyuVMwQaJQB7B0XjsL8mT8mpu3FOPugSBWUaNWJhu1J47Fk9zziycJn65t/dlA
	Hx1WRldTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8NBr-0000kb-87; Sat, 06 Feb 2021 12:59:55 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8NBj-0000jS-ML
 for linux-mtd@lists.infradead.org; Sat, 06 Feb 2021 12:59:49 +0000
Received: by mail-pf1-x429.google.com with SMTP id u143so19383pfc.7
 for <linux-mtd@lists.infradead.org>; Sat, 06 Feb 2021 04:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOxeAVI4ep960RsP7Dr+OvXNN2qzuJYLqyTuQNnmHD0=;
 b=WGVhkfZuHCoXMYXi/LqUTiTa3wE+9vMaT4ixdh9reiNfUz9bV1KoI/SvMOE2ktCWTH
 l8WA/K8NIzIcqEpq4rwAXExjPHh5y7ks+aFjFXkfkf7r4Pi0X9zIGQIGUj5w1anbog1v
 zixyas6hfUlEIFiSh8xPdn42lkRcbSLcycxyYju6bR8g9tIA8nwW7nA4Fbld7G+c3ajE
 UIN7l3qW03p72lC3c3sN3q844sEVzvPEhIrI+DmUnvT/1489Ed+0SIZM3pIGXTn+cT4a
 2vI40f4gJUAi8TrE13+/u4CzzaVy41VC5lInI0EtGQEQDjA2v6CQDSb/BqUFJZeBOrCh
 ezKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOxeAVI4ep960RsP7Dr+OvXNN2qzuJYLqyTuQNnmHD0=;
 b=izZfouSUdgVL0q8mjWd6FnFWHf5ONq20x2LAbu6kFmvO6+fuqatWTXGIpdSFHv39gt
 Tdn2fWu8nCwB+nilMt1szKvPcI15h/UDImaMfUJ+cnzxd5P+Azr9SJazwP7uyJaIZFFH
 hXGLIFIJk+fgfaIQex1kW+pBLCEJCzG74tgACqg1HzKP4yS8V2lrPvrDbd6OkkFcL+vv
 pmvZ8M6xGLcE/KCHL2bwprJnvATZ6YbtH7HdsNEpCS8YpyRdK31VLMle4IclUJD5KXfS
 Pfl7lF+W2ZB11YfS4/k0v1lwjuE30M9FyFl/90ytlVf5h1axigqOWRoXtW19BmVD+ooy
 R3gw==
X-Gm-Message-State: AOAM533XTu9Pao7Xp0uRnD0QQdExQhjgSdlSxSpclxkTcjXA4lF3O1Sf
 Mxqmt3UlZKW+m5qec5myfPF0qflu4JxVNgzsWk4FKR/FR2s=
X-Google-Smtp-Source: ABdhPJyAPoNl/jqtZYpuz4Gb8wZH/IDtiJxCl43Zkir32rq3M9jWC0rcD/Chw+vSSNvWKl9hptCsMA73+kXw/0icC5Y=
X-Received: by 2002:a63:f614:: with SMTP id m20mr786017pgh.200.1612616383448; 
 Sat, 06 Feb 2021 04:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20210127203020.9574-1-miquel.raynal@bootlin.com>
 <20210127203020.9574-2-miquel.raynal@bootlin.com>
In-Reply-To: <20210127203020.9574-2-miquel.raynal@bootlin.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 6 Feb 2021 06:59:32 -0600
Message-ID: <CAHCN7xJsvHEUFRO9-DanEXX92LK8m4iMhHrOD3MLd3QXiKkNyg@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] mtd: nand: Let ECC engines advertize the exact
 number of steps
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_075947_776716_E0CD5C39 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, ladis@triops.cz,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 27, 2021 at 2:30 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> This is an information that might be useful for specific uses, so
> export it, which might avoid having to guess the number of steps when
> necessary.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

For the series,
Tested-by: Adam Ford <aford173@gmail.com> #logicpd Torpedo

> ---
>  include/linux/mtd/nand.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 414f8a4d2853..632becb13b46 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -231,12 +231,14 @@ struct nand_ops {
>  /**
>   * struct nand_ecc_context - Context for the ECC engine
>   * @conf: basic ECC engine parameters
> + * @nsteps: number of ECC steps
>   * @total: total number of bytes used for storing ECC codes, this is used by
>   *         generic OOB layouts
>   * @priv: ECC engine driver private data
>   */
>  struct nand_ecc_context {
>         struct nand_ecc_props conf;
> +       unsigned int nsteps;
>         unsigned int total;
>         void *priv;
>  };
> --
> 2.20.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
