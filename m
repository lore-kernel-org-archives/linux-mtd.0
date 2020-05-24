Return-Path: <SRS0=Oy4p=7G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCABC433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 21:40:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77D2A207FB
	for <linux-mtd@archiver.kernel.org>; Sun, 24 May 2020 21:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1XKGIgk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGVJ5PjZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77D2A207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDrX1pawAloArqTfhUlUFL7jNd+iwo2Ey0N0cO+NdRI=; b=r1XKGIgkeRNvET
	jsNaGCTZco2u92F6u4SVOdcEIW/oPtyPjQmlZ+VynXSfE8vN02fa6eY9MfC1QCVjGhh26Ss47Nx88
	25mZ0WFvxdRd4KFF4pVJgT7NpU5Py2jWMF1x/fMNjNS11OvO3Dv1CkqOb0MHo6EcJ8MZdFynannzE
	Z3lFU9Smp6qYGP8Zv6nVUl40l+rboipuz0KGcWNRo4xgTuiKAYoHTl6h5J8LD0oORxbfWaAnpTfsV
	xXlgFUDaSteHeO1ZorL9rAmiDOicubAe4OSa4RIQ7tG94WV6/iv6G52sotq+g3kKDf/AtXZW1d5yh
	IZ6EuupCbpbD3VYhI49w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcyLf-0005nk-2f; Sun, 24 May 2020 21:39:59 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcyLc-0005nI-25
 for linux-mtd@lists.infradead.org; Sun, 24 May 2020 21:39:57 +0000
Received: by mail-qt1-x842.google.com with SMTP id v4so12620519qte.3
 for <linux-mtd@lists.infradead.org>; Sun, 24 May 2020 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c6U8M3uiY3KxKv0abfkt8b3IstKJVE4yKExXzMtLcKI=;
 b=lGVJ5PjZ4f9edCe+CgK0H2qCy5NRMEaGHF0o9SbGxaWJWY26iqh5MZyb7SSBCj2a8R
 4T1v+AZaUZ8U25ETy2afx+uRpYPadY3WYAf1LU4DHL4hyVcJsPbaMfDhg57gLJO0Tkku
 M9HO2zfMPJGRw7MIoiLrKyz7nRYA+HZGUFKztpDWmmFsJkyfDeGR9jwa5/AABFxJIVjN
 qpjcYxG05VLdK9ONBq2TWZ5qDqgckaMRfSwCNW3/410GUL9wlkNzu9epoZJgIdBVJSXH
 3oYvN9esth7k0ory+OHwdQwW0CFmFnslW84fdqYg2SaZCzIZskU5PY7lZ36RKgl3B0T3
 ffpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c6U8M3uiY3KxKv0abfkt8b3IstKJVE4yKExXzMtLcKI=;
 b=Xyp6GKaIHKhIv9Dxg4zaDg5wm7W7dvVvMOhyLSs16/jWOj3uGZlYcNmsvuxi+2J/Wv
 aoX6C5SrT8mXMDwJGmh5RV1fa9xRikmtMrVjCUgzDMfpb8ES/2fG3aR1/oE3Oecxrucn
 ArgSvOJAX7Ud9mrdoYAr3sEpitoweTzqnaSZDsY+PuNabyapKwSUZnPq5/sh/fSa3Pd1
 rBJTUFGqIZ0FGmmv5+wo5Pqym5FTAtbmZtQUQBPFxIq7AIeQzWYMzZeyO7Dp5B16wrmN
 ri5BP0rNSDNFB0zpR2tgQ2untmwEs5RMuAk9xn0XX033dmxndDz2H5QtGSrORwXuqMT2
 AMsg==
X-Gm-Message-State: AOAM533E9bSw991k9psdv5s3MnNWu4v2e69+QbwN2PLQoYEPTUoMW08p
 o70uowoJE+cQFGqkHOfICEA9JAm9gHdUZR+CJuA=
X-Google-Smtp-Source: ABdhPJzBBPXxmteLywE/LHNgcE1DmRs00Pn27xvju63xWuN6ybjpFHPEOfV49p25jdL2ZrPNE5OofbnZtwzrTCeMq28=
X-Received: by 2002:ac8:3f88:: with SMTP id d8mr1648078qtk.164.1590356394852; 
 Sun, 24 May 2020 14:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200509191431.15862-1-miquel.raynal@bootlin.com>
 <20200509191431.15862-16-miquel.raynal@bootlin.com>
In-Reply-To: <20200509191431.15862-16-miquel.raynal@bootlin.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 24 May 2020 23:39:43 +0200
Message-ID: <CAFLxGvwPutAzkhWo=hT51F4+KDAS52O0AFgv+jiQUv+Z1Ct0Fw@mail.gmail.com>
Subject: Re: [PATCH 15/17] mtd: rawnand: nandsim: Manage lists on error in
 ns_init_module()
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_143956_100505_76111940 
X-CRM114-Status: GOOD (  17.49  )
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

On Sat, May 9, 2020 at 9:19 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Lists are filled with calls to ns_parse_weakblocks(),
> ns_parse_weakpages() and ns_parse_gravepages(). Handle them in the
> error path, all at the same time.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nandsim.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
> index e41866e49206..26d23ab5b794 100644
> --- a/drivers/mtd/nand/raw/nandsim.c
> +++ b/drivers/mtd/nand/raw/nandsim.c
> @@ -2273,6 +2273,7 @@ static const struct nand_controller_ops ns_controller_ops = {
>   */
>  static int __init ns_init_module(void)
>  {
> +       struct list_head *pos, *n;
>         struct nand_chip *chip;
>         struct nandsim *ns;
>         int ret;
> @@ -2340,11 +2341,11 @@ static int __init ns_init_module(void)
>
>         ret = ns_parse_weakpages();
>         if (ret)
> -               goto error;
> +               goto free_wb_list;
>
>         ret = ns_parse_gravepages();
>         if (ret)
> -               goto error;
> +               goto free_wp_list;
>
>         nand_controller_init(&ns->base);
>         ns->base.ops = &ns_controller_ops;
> @@ -2353,7 +2354,7 @@ static int __init ns_init_module(void)
>         ret = nand_scan(chip, 1);
>         if (ret) {
>                 NS_ERR("Could not scan NAND Simulator device\n");
> -               goto error;
> +               goto free_gp_list;
>         }
>
>         if (overridesize) {
> @@ -2412,9 +2413,23 @@ static int __init ns_init_module(void)
>         kfree(erase_block_wear);
>  cleanup_nand:
>         nand_cleanup(chip);
> +free_gp_list:
> +       list_for_each_safe(pos, n, &grave_pages) {
> +               kfree(list_entry(pos, struct grave_page, list));
> +               list_del(pos);

Like said before, this pattern looks odd.

> +       }
> +free_wp_list:
> +       list_for_each_safe(pos, n, &weak_pages) {
> +               kfree(list_entry(pos, struct weak_page, list));
> +               list_del(pos);
> +       }
> +free_wb_list:
> +       list_for_each_safe(pos, n, &weak_blocks) {
> +               kfree(list_entry(pos, struct weak_block, list));
> +               list_del(pos);
> +       }
>  error:
>         kfree(ns);
> -       ns_free_lists();
>
>         return ret;
>  }
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
