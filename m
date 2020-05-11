Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A0AC38A2A
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 02:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2D0A206A3
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 02:48:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y4IJqw4s";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="QCV5gAFo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2D0A206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6+SEEUXf6iCQ0vnTaiLW8IScQZfWRoKXJzozNakMY8=; b=Y4IJqw4sGDdQSW
	0RGZup8EUOfeHlq7/6iLQvnq2Yz8LtAa+ItzHBgCPiaVHbivVqeiSPRCOwP7ob+KraiJTDW6nhLK+
	GOJFqoavLcwdUYs59VVI+smeh+j4jJVFtWSev4vQ9xE5dQDNDxyxHsIwVD2XyhtQ4apulcOpbC8aC
	AOtawOmZ4VfdK9i3cPAoDoWEEaxoTZOZSscI5Y8Soxm928wehZjiSRHgqRCr67vzp1GtuhYi3SREo
	jnxrm8EdY9EzISoH7QkPKGN5KPICf7Dz/jX4LBSao03ZlcUSjRTjRUkvUfdkjhI3ISWN6hs+vrIkB
	Vrx0crQ1PmD7c4mWGOWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXyUc-0002gm-1v; Mon, 11 May 2020 02:48:34 +0000
Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXyUY-0002gN-EJ
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 02:48:32 +0000
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 04B2mFgm006962
 for <linux-mtd@lists.infradead.org>; Mon, 11 May 2020 11:48:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 04B2mFgm006962
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1589165296;
 bh=s4WcdRUoDVEBBVdxD1z2gQbVosh8PoK2xV7bCWiAM7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QCV5gAFonfHLpJj0GG91TtG+3GvNb6HsygqXuX6OKp3O9RChfacW3wrtOy0pOh+KC
 QGjXgTHUExM4n8scMp6WXBhFAfTfLMoRoqDKE98tW12cAauKy7DOjyies9qLVXTAI5
 TPmxARX6LlpjxuPPnJN6Ieh/pAyeLVxCMKJyTB6YVO76dMK1uQMS80l0Ycwt7tg8u6
 DvVawR5bn2HH8389sBbJm5mec91nyJddq/YJIx9XdV6mVJF8ef0ukK/kJjp6+r3WzA
 LB6Id/Y4tPOniXv79PVVrhasaWd+bZQJXNSQH+nvgg6Z4hMroAVHnyuTuVvwiFgNcK
 9PzcX5lHe4+MQ==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id e10so4639903vsp.12
 for <linux-mtd@lists.infradead.org>; Sun, 10 May 2020 19:48:15 -0700 (PDT)
X-Gm-Message-State: AGi0Puaj9VFrmZO+yTY7222Mdw5h1rqmVc8oFMlvLR1qAYBj9PY8XA9W
 rpBq7nZQUfypbousEoM4zAprb+UI5Qvyo9mo5Q8=
X-Google-Smtp-Source: APiQypJ1tyvjB1fwixLvvucJu/KhUBtNeWoc2W7/guPUqpg0egiwc8ZP7ntlxGec/L1/rtDn12jSyz8YqXKUCTx4Rug=
X-Received: by 2002:a67:3293:: with SMTP id y141mr9670788vsy.54.1589165294681; 
 Sun, 10 May 2020 19:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
 <20200510121220.18042-11-miquel.raynal@bootlin.com>
In-Reply-To: <20200510121220.18042-11-miquel.raynal@bootlin.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 11 May 2020 11:47:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1Cd389GtOmBKCj6fXy67DBALnetzL2TcsD9H70y6HBg@mail.gmail.com>
Message-ID: <CAK7LNAQ1Cd389GtOmBKCj6fXy67DBALnetzL2TcsD9H70y6HBg@mail.gmail.com>
Subject: Re: [PATCH 10/62] mtd: rawnand: denali: Delete items from the list in
 the _remove() path
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200510_194830_733822_CF806C16 
X-CRM114-Status: GOOD (  13.83  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, May 10, 2020 at 9:15 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Denali driver keeps track of devices with a list. Delete items of this
> list as long as they are not in use anymore.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>



> ---
>  drivers/mtd/nand/raw/denali.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index d40f9c8e2241..227474ca7743 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -1336,10 +1336,12 @@ EXPORT_SYMBOL(denali_init);
>
>  void denali_remove(struct denali_controller *denali)
>  {
> -       struct denali_chip *dchip;
> +       struct denali_chip *dchip, *tmp;
>
> -       list_for_each_entry(dchip, &denali->chips, node)
> +       list_for_each_entry_safe(dchip, tmp, &denali->chips, node) {
>                 nand_release(&dchip->chip);
> +               list_del(&dchip->node);
> +       }
>
>         denali_disable_irq(denali);
>  }
> --
> 2.20.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
