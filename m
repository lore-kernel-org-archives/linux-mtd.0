Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ACEC4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 08:27:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FC920888
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 08:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zn0SmRHw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0fhmfBT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FC920888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7/eBuSV3kdbsxjrbZ50qKgMW9g56L/+9AVObxKdkN+M=; b=zn0SmRHwawYqbArEFzxLp/Um0
	B3bifEZkAADE4Y+2YjRvQVqbT+u/ZwAyd1pwfyFZHE0AuuwnNzzVwtB0wFyAkPzHiGsPejgHYnvwb
	sZSM1D+CffX2x8gkjllC8+OxFM9K5YvJB7hPJiXc+Gl0uKOC7P+lTCY+7ebcrgBBDkWFoiJKHbPxq
	bC7lGgBwt/uyZcOdEraxUSYVMrXVG/lU/d6P0Iwt1/XSW/R+ZW03p2rKcPDJhLy0Omirn9Ur6gUEf
	or/SzNfOesJuIJHvvDagrb9XSmZR64uxVErS/MOmeeesNkpp5Lx9R2EqdjQLK83t/yB9U0TtY29jh
	V3NSaJgzA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLj4W-0003at-IT; Fri, 25 Sep 2020 08:27:16 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLj4S-0003ZZ-IQ; Fri, 25 Sep 2020 08:27:13 +0000
Received: by mail-il1-x143.google.com with SMTP id x18so1565800ila.7;
 Fri, 25 Sep 2020 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SrY0n+Lxp4Ps0vKWrqg8qzPispapVC5K8BCl7226S1Y=;
 b=T0fhmfBTGttasq8Kei96OjnUWqoXnD1EhQm31QUfLpIDhsjWLMFk9PV2pa+s0Hdg4A
 fjPpdwt7ABi70fGaUKKmKv2bZFl1TX1+6zeJIsfMkkdroMBVgloDbus7BReFk/VnR6SK
 U3/FeQaNf+VwOjhpb7jEHXM9O0kdlPRDgdL57bNQPOItMru8HlJjVYwQ+N+2344BnMPn
 VLAi5RiU3HyfXVpuXxk7zerjlavpgg2bAlP3+3cJTt25Ft9WDn+uxWyPYbRLNm7Ai0Pc
 vXXXfPvNhZtFZkSVRsZBYd2w5ycRNts4T71gXQtVVij69COOyaOfL2kzw9iAAtRqdG7F
 mAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SrY0n+Lxp4Ps0vKWrqg8qzPispapVC5K8BCl7226S1Y=;
 b=qwgdvrMzmtp9wPNGvDEdh89nrSZ+/paGHTa1sIO+rRzV0xKOtmAX1rdOerl7SzOIVr
 kK/+s4a/sUh05rd2Gpx++/Dwg9HpvcRTM8DAXWysG/dPe63GWWE2Gt1/q0jbDuPUfpT4
 y5L0OCJU/Ma6PBvVn55VMYLmiFA+3x6yHENAXdPB4TmgRAIi4jwN63plcCyURAyH7320
 F0hgTmJZajDC8HYJUj4OvxVUoXcEmqJ95hMXqf25XTfI7OJgeHMuAdajDUqjLX2isM2P
 TpBkwiYruUnsMnLN3RpjtmUHkTxa1YJcvWHJE+Q8yIqf7phAYMd+BX/6YyyA2tRH1Ey9
 wBmQ==
X-Gm-Message-State: AOAM530jBwnzpxw0c6hg8doBFWWorOcsGJ/bxAfEIWuHIDLrhaj+z2Qg
 Uhq75n4UwPEAcwnjFN3hINdwP6eW8Ww1IbegM9Dt3MnFz8O7bg==
X-Google-Smtp-Source: ABdhPJzfUq4g2hUm0yylW2BZjBYzZffhnMg9JFRt8eQ2YfVzP7n3YGn8DdvLynY3V96ZCJFM7lK9ybFe7wDfCGFFvXY=
X-Received: by 2002:a92:910:: with SMTP id y16mr2375456ilg.22.1601022430617;
 Fri, 25 Sep 2020 01:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200925065418.1077472-1-ikjn@chromium.org>
 <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
In-Reply-To: <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 25 Sep 2020 16:26:59 +0800
Message-ID: <CAJsYDV+EifAeMKEGwi0oH6A5EvPN8tMZQ+oqY5JGe=+kqzjMLw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] spi: spi-mtk-nor: support 36bit dma addressing
To: Ikjoon Jang <ikjn@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_042712_613208_5BA6A1F9 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Fri, Sep 25, 2020 at 2:56 PM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> This patch enables 36bit dma address support to spi-mtk-nor.
> Currently this is enabled only for mt8192-nor.
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/spi/spi-mtk-nor.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
> index 8dbafee7f431..35205635ed42 100644
> --- a/drivers/spi/spi-mtk-nor.c
> +++ b/drivers/spi/spi-mtk-nor.c
> @@ -78,6 +78,8 @@
>  #define MTK_NOR_REG_DMA_FADR           0x71c
>  #define MTK_NOR_REG_DMA_DADR           0x720
>  #define MTK_NOR_REG_DMA_END_DADR       0x724
> +#define MTK_NOR_REG_DMA_DADR_HB                0x738
> +#define MTK_NOR_REG_DMA_END_DADR_HB    0x73c
>
>  /* maximum bytes of TX in PRG mode */
>  #define MTK_NOR_PRG_MAX_SIZE           6
> @@ -106,6 +108,7 @@ struct mtk_nor {
>         unsigned int spi_freq;
>         bool wbuf_en;
>         bool has_irq;
> +       bool high_dma;
>         struct completion op_done;
>  };
>
> @@ -305,6 +308,11 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
>         writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
>         writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
>
> +       if (sp->high_dma) {
> +               writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
> +               writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
> +       }

I remembered kbuild test robot reported a warning on this on 32-bit platforms
in your v1. [0]
I don't know what's the fix for this though :(

[0] https://marc.info/?l=linux-spi&m=159982425706940&w=2
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
