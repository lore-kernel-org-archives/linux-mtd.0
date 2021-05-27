Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35080C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:02:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC2A861132
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC2A861132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OrFMiMgbgy5oPsR+UQTQUJwGw6SKCuEk8RM9QjQd64=; b=hobtP2HtO4pgek
	1VIsQCX4j2rlQPpUT2sFv6pLWbqaiY77LgQ7llACfu3vi9mt0zTHZ8zAFPywAurdJtcz4LDqgWVbK
	2BTlJZIAkUAvG+V+S5JIQR1Fvy3j+0n+ZPbKDMyBh3yMaSAeQnjLPaPLlwj0shd8O0RoNRFAWAKXz
	gdCnQLCNka0FAmHhn8CQOrqRZNta32NQ7ZhKjM4EEEudsPgJu3YGOM1p65V6gYcjW+fFYYv9To02t
	8FZgO5OPfq0QN2MYPW9fu4smOmbhTeGg7+HWoghCQAjvdjpycKy9Ee9iZEgrLlyJZAxDCnxfKUCAd
	LZsZN9kSi5Qw0fCShdCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmFdE-005yvS-5s; Thu, 27 May 2021 13:01:00 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmFcj-005ye0-Nf
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 13:00:31 +0000
Received: by mail-wr1-x432.google.com with SMTP id n2so4718613wrm.0
 for <linux-mtd@lists.infradead.org>; Thu, 27 May 2021 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TjqCwbCng4BjXEIHwnyVQf1iUW1kcxhloifFxwiPLg8=;
 b=ADyYWhMX2cKs1hfBEzE9Hz+6NBGszX0pWieIJHlSnZ7Gb3rVW8AiJZuZRzwQ+7Dnv/
 s3Oy1sLCFVe1B+E/aTy2JCfkcKI4VfaSrZBT5tdNYPmdBEQUMUA0kiKRWX8+FXtQ/Qrm
 ZuGyTazGwNrDbfyJqSGO4gM5IwOrIHvaZaKrabuajpDI8f/Zy24eUsP6wxElWyxn6OTj
 5vPukCsq5N4+oBUcmiZunvJkFmqHcDCYK92gtnLrjvwxpjZks7BjGWndF5tI5dGRE55T
 1leBKdwVphDbWEGoOyIu+umWXiBFHTk9A7+GfgTpxzsfgZrj5jXswYAPeFWuZNDKIcKb
 8wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TjqCwbCng4BjXEIHwnyVQf1iUW1kcxhloifFxwiPLg8=;
 b=uh0j70rDfdOHyCrjHAnzVQMApNtvi+iE7Xwmc2W7dnREMCrmXDfhec8X2JnkWNs92r
 olWTau9QhYA9PapyuTeDp8fe1d7Um3fEjRsil31aoTLY6/RQjzpofpUdR9bR9erWIC0b
 pfQoqYE0mZj3xpgMCrA424BE6uEi85YtGXqxR21YrAz08WVvcYkjBAgJOQEaOXAUDpPZ
 5OJhSATRNcjjU1nnsJottYzHBaaJcF7gMTIqU0aJALKYG1PGi8q3nyj/Ymz7/07vWd9s
 sSwWkE1hQBdXTIEKAHInTY2WHlgk6WOQYhNxQ756YS+hyiu9W5vI1K8OQ4pTjnPh6p4w
 JS9g==
X-Gm-Message-State: AOAM533gMEDCAH62Mox8nGe8lKPyx/RmKzz0zZgeTWYEa8y/u2MAMtz8
 REK/Z75XSUpZ9+2xfwqd9vZutUoWv0tKrYwT2fbUj2HQNnv7jNWA
X-Google-Smtp-Source: ABdhPJzSb9oL45zpWnB8l9ivXXNKad8DeBEuQDtzE2zfZSvYwrZlgpkmHhG2No9ghmGvBe7Xa5CsqaIIeJWBUBQrh80=
X-Received: by 2002:adf:f751:: with SMTP id z17mr3236441wrp.150.1622120427803; 
 Thu, 27 May 2021 06:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210527084548.208429-1-miquel.raynal@bootlin.com>
In-Reply-To: <20210527084548.208429-1-miquel.raynal@bootlin.com>
From: jorge courett <jorge.courett@gmail.com>
Date: Thu, 27 May 2021 10:00:16 -0300
Message-ID: <CAFh6nDCXu-Sc65X8XZRzLdB28iFQQWkiCvZaTtvB8PFyVWC5yg@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: arasan: Use the right DMA mask
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org, 
 Michal Simek <monstr@monstr.eu>, Naga Sureshkumar Relli <nagasure@xilinx.com>, 
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_060029_846551_E735AA09 
X-CRM114-Status: GOOD (  16.49  )
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

On Thu, May 27, 2021 at 5:45 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Xilinx ZynqMP SoC and the Arasan controller support 64-bit DMA
> addressing. Define the right mask otherwise the default is 32
> and some accesses may overflow the default mask.
>
> Reported-by: Jorge Courett <jorge.courett@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Tested-by: Jorge Courett <jorge.courett@gmail.com>
>
> ---
>  drivers/mtd/nand/raw/arasan-nand-controller.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
> index 97e5a336a760..6e8d33173c6b 100644
> --- a/drivers/mtd/nand/raw/arasan-nand-controller.c
> +++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
> @@ -1398,6 +1398,10 @@ static int anfc_probe(struct platform_device *pdev)
>         if (ret)
>                 goto disable_controller_clk;
>
> +       ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +       if (ret)
> +               return ret;
> +
>         ret = anfc_parse_cs(nfc);
>         if (ret)
>                 goto disable_bus_clk;
> --
> 2.27.0
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
