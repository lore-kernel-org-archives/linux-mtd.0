Return-Path: <SRS0=HSOd=TJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119DFC04AB1
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 09:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87F520675
	for <linux-mtd@archiver.kernel.org>; Thu,  9 May 2019 09:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KV9Mq09h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87F520675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hk/Q6UpDRa6zTJUvkpoFN7jtSSvoiRB9dI8k9W/9xeY=; b=KV9Mq09hHUv7B9
	Y1WU7v82k/00vygzgiGs/lDx8LSC3ggRIZaseIPjGq46BzO5DCyqE7eksC+XqIBwhpuCs9DYE/sah
	V6thfJYa9RVh/gnG05Pr4Rq+dJCSU3sxz215MPssEcWGLEoyuK+7uAvBVDa0d1fGOZwA+XgICJ3Dh
	xrqGzHg8+DGbl4ZWu2vT/Cnf+nu553pCiobLjYaA8B940LA2kb1pCY7GfncjM2CJ7w2m4ZbvuLa+q
	fNGN8OGujsNScc9onS5Eri/eJoNNF70SLDV1JmN0AlGlT1uDAyagqYC6YcDPDuQoUfCkGwodRnQcv
	aTsiieu4C6B4b+ubwA7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hOf5K-0007Ex-6x; Thu, 09 May 2019 09:11:26 +0000
Received: from mail-vs1-f66.google.com ([209.85.217.66])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hOf5G-0007EZ-Vc
 for linux-mtd@lists.infradead.org; Thu, 09 May 2019 09:11:24 +0000
Received: by mail-vs1-f66.google.com with SMTP id v9so956044vse.5
 for <linux-mtd@lists.infradead.org>; Thu, 09 May 2019 02:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gXkRO+XQYGy7/LWPQ5fKlNK8ZU/OfB3zQej18Hwz8ws=;
 b=RccKL+GwmoYv4UenIoLqIRl+Ssj4GM2Jbor7jmqHKDuZQh6AZLOuv8ILhZogASTkiL
 ffXZVqkmBcBwVBJcXx2bi9+6P9/oGddH1OtNayWJRHVuvS2MitsSLFDw2Y9OxbRDgeBN
 tjXxBZqk3ZLMvAydvgRu4XNId69TUjgFppDRGznAkLvl787u/53XrQYm0wa/S2YIRiHs
 ntR0OD+Xq3bdHFbqPQqystDEwkxAjxyvHSppAAYWKgE0IhWoDg2EQBZq4q30MsrxvLd2
 imHh2vPsOn12xnmeftDVZP4m9KxPTpqHsNPghEbQAsFpmnQwJiSemsa7ypd0MvBxxPu9
 XdxQ==
X-Gm-Message-State: APjAAAX9d7kpwiKLoe6+jLCriQnLeNnXq2cpOPzYnSdYqtl86lKn4nQP
 ceKWoXUep0Pei5+Fgl/2Q6OMkOx3Yb751FvZd6U=
X-Google-Smtp-Source: APXvYqyFtFQFzOBs1h2wojiIalCn9FY+WK9+fjvSepNFI+zbP6LZxRuSLRMlT+KN9dTtXapDj+Ze1KlPzPP6kTlsXoE=
X-Received: by 2002:a67:f956:: with SMTP id u22mr1550424vsq.11.1557393081736; 
 Thu, 09 May 2019 02:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
 <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
 <898831ba-b8bb-7c2b-e623-2e6c26da91b5@microchip.com>
 <CAMuHMdXFwFAPzYPKqj+FZgSq01VAD0izS3ELyOg1YBwTAQ_QkQ@mail.gmail.com>
 <8b004a57-0fd9-04fe-d031-1d98d890f826@microchip.com>
 <CAMuHMdXghAWmNJLUq_uOUVPrrNTAcFq=QqCGjLU51FchvOu3=g@mail.gmail.com>
 <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
In-Reply-To: <6a8d9a6c-5281-88d2-51ae-e2afad847a8f@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 May 2019 11:11:09 +0200
Message-ID: <CAMuHMdVBguF4ZQHTqwr6GAJKuUcvBGu-5p0GeYRmZ3dG8tXa2g@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190509_021123_019748_ADFEC869 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jonas Bonn <jonas@norrbonn.se>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On Thu, May 9, 2019 at 8:56 AM <Tudor.Ambarus@microchip.com> wrote:
> When the configuration register QUAD bit CR[1] is 1, only the WRR command format
> with 16 data bits may be used, WRR with 8 bits is not recognized and hence the
> FFs. You probably set quad bit in u-boot, while others don't. We can verify this
> assumption with the patch form below. Can you try it?

Thanks!

> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c

> +static int spi_nor_clear_block_protection(struct spi_nor *nor)
> +{
> +       int ret;
> +       u8 sr, cr, sr_cr[2] = {0};
> +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +       ret = read_cr(nor);
> +       dev_dbg(nor->dev, "CR = %08x\n", ret);
> +        if (ret < 0) {
> +                dev_err(nor->dev, "error while reading CR\n");
> +               return ret;
> +       }
> +       cr = ret;
> +
> +       if (cr & CR_QUAD_EN_SPAN) {
> +               /* disable quad if already set, must do it with 16-bit WRR */
> +               ret = write_sr_cr(nor, sr_cr);
> +               if (ret) {
> +                       dev_err(nor->dev, "error diasbling quad mode\n");

disabling

> +                       return ret;
> +               }

renesas_spi e6b10000.spi: DMA available
renesas_spi e6b10000.spi: registered master spi0
spi spi0.0: setup mode 3, 8 bits/w, 30000000 Hz max --> 0
m25p80 spi0.0: bfpt.dwords[1] = ffffffff
m25p80 spi0.0: bfpt.dwords[2] = ffffffff
m25p80 spi0.0: bfpt.dwords[3] = ffffffff
m25p80 spi0.0: bfpt.dwords[4] = ffffffff
m25p80 spi0.0: bfpt.dwords[5] = ffffffff
m25p80 spi0.0: bfpt.dwords[6] = ffffffff
m25p80 spi0.0: bfpt.dwords[7] = ffffffff
m25p80 spi0.0: bfpt.dwords[8] = ffffffff
m25p80 spi0.0: bfpt.dwords[9] = ffffffff
m25p80 spi0.0: bfpt.dwords[10] = 00000000
m25p80 spi0.0: bfpt.dwords[11] = 00000000
m25p80 spi0.0: bfpt.dwords[12] = 00000000
m25p80 spi0.0: bfpt.dwords[13] = 00000000
m25p80 spi0.0: bfpt.dwords[14] = 00000000
m25p80 spi0.0: bfpt.dwords[15] = 00000000
m25p80 spi0.0: bfpt.dwords[16] = 00000000
m25p80 spi0.0: failed to parse BFPT: err = -22
m25p80 spi0.0: spi_nor_init_params sfdp parse failed, ret =-22
m25p80 spi0.0: SR and CR before quad_enable:
m25p80 spi0.0: SR = 00000000
m25p80 spi0.0: CR = 00000002
m25p80 spi0.0: SR and CR after quad_enable:
m25p80 spi0.0: SR = 00000000
m25p80 spi0.0: CR = 00000002
m25p80 spi0.0: s25fl512s (65536 Kbytes)
m25p80 spi0.0: mtd .name = spi0.0, .size = 0x4000000 (64MiB),
.erasesize = 0x00040000 (256KiB) .numeraseregions = 0
3 fixed-partitions partitions found on MTD device spi0.0
Creating 3 MTD partitions on "spi0.0":
0x000000000000-0x000000080000 : "loader"
0x000000080000-0x000000600000 : "user"
0x000000600000-0x000004000000 : "flash"
renesas_spi e6b10000.spi: registered child spi0.0
renesas_spi e6b10000.spi: probed

And /dev/mtd0 reading works fine.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
