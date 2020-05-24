Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EFFC433E0
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 21:33:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB6820776
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 21:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JINJ48JT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwpqcrfc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EB6820776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IsfjsvjhBYCttr4XQt5eYNooVsyLEV//pJHTbjGYco4=; b=JINJ48JT5dNq4k
	rYaR6fUPt2Yc3hL+ZeiV6wnip9ucH3BePKpJ2vEWL34IRJpvS3fIrbo8cXbIjT2t100hPwcx5nHdq
	/OS8zo5hfzjZFJfpyKM2CtovmcD8xl7wjHm+wpc/zlHa6ENadi2oMTNxXc4u0aHlusc2IHSf2qG4q
	N0MA6DflDdjVr06Npa2ryd92gCtlJ6FPxvO1FTwNbtKgYIvzfPv6mMkuFDLy6sjIWCK+52vYNQm+3
	Ts+b3ROdYfY6NivQ5mXaigZLnD1JrErX7kqa7Uxno2qBjf3ai2XnGTJKyPLNs+ysINCRTIx6Fs/vs
	IFAUY+B0ExitSSZEBIRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcyFF-0002c0-Q2; Sun, 24 May 2020 21:33:21 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcyFC-0002bS-9Y
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 21:33:20 +0000
Received: by mail-qv1-xf44.google.com with SMTP id l3so7309195qvo.7
 for <linux-mtd@lists.infradead.org>; Sun, 24 May 2020 14:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AkOamqQ7kUBPdcfFdgOrhi47uTsKq0N5KA8fpnyaqtY=;
 b=Iwpqcrfcv8oabWiP4oxx4k2ukDxU8mOEUbLwKZtivH5QD8WN2/Xj9p4nsFaYCQF2Gv
 7TVaifttsQwrz2DQl5RmUfNc4wo7PsvCgWIrKQH9eoRvoibdXiq/1onq5Vq3RIIYVYpn
 ET27vUq3NypUG0pP6mVU2xcg9SVAAIjJhBtwGqVdJ81aO+4j0SGkAN9f8pkemd/FGqWw
 zlOLA4Fr7bb+BeJvAG6LNV7vgeMnHjcy6HA47/jf98H/4pGklQCUn/F/OQQDAmmONViQ
 qqkC6WvDNpTJiPJfrQXce67+11zQaP4vNXP0NZyTvzEk8nTXatKn+XDZ4G8zQ3ERZODo
 nlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AkOamqQ7kUBPdcfFdgOrhi47uTsKq0N5KA8fpnyaqtY=;
 b=Ub5xk3n8CcvTdePPnywBEEVA5NJVYYqVelPK7wYPTSHxgxVcypsnnRPveKE3xYYatM
 thzvjB6YCHNuxv8M6Y5WEx/MJ97FfVFpNXfR7qqVBbHRiM+t0z18CgXIDOuPY5KEoHEL
 Kc67JlSa2mDZHz8fq+owhjrrZDdUvdzENbfU539AX6KI7HVfpdgirc+dfdc3Fk/c1vdI
 e0vFJN95Jt4gP2pD5VscZI/7zhYPF84KzZFNHuL2IcwyUhLBMuQgfa202wNvqw8rLAnC
 rwWSB2jZ95KSCWOl2WkCsZx+IAYEFkf6TozQoJor+pe++Voa+m92DH21cE0+J9yQ20pk
 UPKQ==
X-Gm-Message-State: AOAM531TkcIwXJqiTH/5XKdmIVAbM1GdOByj82qBoUcoxmte4KPRoCtp
 5SkUzEVk0fhPNEyVhm3ZOo9Dui2JuLtZTQZRXMs=
X-Google-Smtp-Source: ABdhPJwlLJcBz52rzTjzT8xPX7c8iFEDAqF/h1fiKFtXiGMZSly6833hdArJJAK9j7V16B1beripB3C8Oul7pwy5mvE=
X-Received: by 2002:a05:6214:42f:: with SMTP id
 a15mr13143435qvy.212.1590355997030; 
 Sun, 24 May 2020 14:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-7-miquel.raynal@bootlin.com>
In-Reply-To: <20200509191431.15862-7-miquel.raynal@bootlin.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 24 May 2020 23:33:06 +0200
Message-ID: <CAFLxGvws0647PByEoBJwO6HCTjta4XiYrP6_pOfek5LLhbYe+w@mail.gmail.com>
Subject: Re: [PATCH 06/17] mtd: rawnand: nandsim: Remove debugfs entries at
 unload time
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_143318_333086_39297B84 
X-CRM114-Status: GOOD (  16.13  )
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
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, dedekind@infradead.org,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, May 9, 2020 at 9:16 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Create a ns_debugfs_remove() helper for that and call it in
> ns_cleanup_module().
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nandsim.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> index c8e9c70a6641..7862c65e32ad 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -520,6 +520,11 @@ static int ns_debugfs_create(struct nandsim *ns)
>         return 0;
>  }
>
> +static void ns_debugfs_remove(struct nandsim *ns)
> +{
> +       debugfs_remove(ns->dent);

BTW: For now it is perfectly fine, but later this can be a
debugfs_remove_recursive().

> +}
> +
>  /*
>   * Allocate array of page pointers, create slab allocation for an array
>   * and initialize the array by NULL pointers.
> @@ -2398,6 +2403,7 @@ static void __exit ns_cleanup_module(void)
>         struct nandsim *ns = nand_get_controller_data(chip);
>         int i;
>
> +       ns_debugfs_remove(ns);
>         ns_free(ns);    /* Free nandsim private resources */
>         nand_release(chip); /* Unregister driver */
>         for (i = 0;i < ARRAY_SIZE(ns->partitions); ++i)
> --
> 2.20.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
