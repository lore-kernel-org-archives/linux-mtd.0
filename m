Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A0C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 12:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gtvhbNLJdSgU7btJqaz+wEFBgbI9ojxmCLehK1WoP4=; b=LZlT1T3piAeE4L
	RHowfEftPsy0qCZY+XukKn1VLKBvlB6GyhpxdrjWFH1uAmCL9q+77zB2Pi8kO9SKR7GATNqe1B2UH
	Yabo0eQxHQBCoKh4qSVYE8eW7UXmRDqlYNfGfN7mWmr1IGlM4Z5DmGAuPV+UDA08Av25MCnol0+6D
	+wAYYWLzEaoBggItv2JtTT08k2yhdSgFURRhK34/uYo4QLZKvdb+BMMEn1hDb4kw8j07usPBEJ+3P
	OmMj1hgXeMgVSh5DuB7J9D5jqpGq/3gDcqqf8YHavUFSi3/uaqG1fXsQixoJ+7ZPtVd8Lkfn0z73v
	xvjxDR9kimjD6zWAVFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3T5-00FbPI-1D; Thu, 27 Jan 2022 12:01:35 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3T1-00FbON-5R
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 12:01:32 +0000
Received: by mail-ua1-f48.google.com with SMTP id m90so4309778uam.2
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 04:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=og7pDYudXwVK35kacScn1luiwSZYh15yLuZfAJvuYvo=;
 b=zu9mfbstdJjLk0M21KEwBz9qop2SQWstxfRi6y762T3Ac7Nt8PtEPf/xZPwBAB5ZnO
 90RJ+jbO+blwqh5Ne73Qksz2gqwL6h7AEl4k0mV4+bcHk8nGu3IHtaNpYxVvZjEdJv3F
 0Q3NDHcHBOMBgClG/i7bOCt1+QEHXDdL1pjYgwaU51psMAKUTSRXhiiZ4KLHN3f/WhM7
 X38XmSSfcEuKnONvyVuR8QBNgOk+i8pARRCA4U9ghoC+LSEZ9bgzK5uYTICduLE/ThCh
 Iq1qbm+7x2pwv6Bq+ZJxybz+KStLAj8YLVxgF9SPSNVrcIGeU5bkJuwCll6agtHz6XUw
 psfg==
X-Gm-Message-State: AOAM533l6vNBd0rTtEieUjpvES+LFdFQOj9dYpHE8d+UZNChHMbx20lr
 6GTYeSygAiJP7qjP+OHofrWDVIvf+yEaUA==
X-Google-Smtp-Source: ABdhPJygwU09koUwba+rx+odOVQeZT/sFV3ZsFKNErWXN/G4O5N2s9uLgX9LcwBeebxmbpbhKtCvIw==
X-Received: by 2002:a67:fe12:: with SMTP id l18mr1340923vsr.48.1643284890170; 
 Thu, 27 Jan 2022 04:01:30 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175])
 by smtp.gmail.com with ESMTPSA id g25sm514815vsj.6.2022.01.27.04.01.29
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 04:01:29 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id b77so1660626vka.11
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 04:01:29 -0800 (PST)
X-Received: by 2002:a1f:b287:: with SMTP id b129mr1329853vkf.20.1643284889411; 
 Thu, 27 Jan 2022 04:01:29 -0800 (PST)
MIME-Version: 1.0
References: <20220127110828.1065099-1-miquel.raynal@bootlin.com>
In-Reply-To: <20220127110828.1065099-1-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Jan 2022 13:01:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkr8FFC3KKWY6A1Csz9Jz6MB7EmsTgs2miRfntwVoeoA@mail.gmail.com>
Message-ID: <CAMuHMdWkr8FFC3KKWY6A1Csz9Jz6MB7EmsTgs2miRfntwVoeoA@mail.gmail.com>
Subject: Re: [PATCH] mtd: Replace the expert mode symbols with a single helper
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_040131_236867_320DC239 
X-CRM114-Status: GOOD (  26.79  )
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

Hi Miquel,

On Thu, Jan 27, 2022 at 12:08 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Reduce the number of exported symbols by replacing:
> - mtd_expert_analysis_warning (the error string)
> - mtd_expert_analysis_mode (the boolean)
> with a single helper:
> - mtd_check_expert_analysis_mode
>
> Calling this helper will both check/return the content of the internal
> boolean -which is not exported anymore- and as well WARN_ONCE() the
> user.
>
> While on this function, make the error string local to the helper and
> set it const.
>
> Update all the consumers.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -358,6 +358,19 @@ static int mtd_partname_debug_show(struct seq_file *s, void *p)
>
>  DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
>
> +static bool mtd_expert_analysis_mode;
> +
> +bool mtd_check_expert_analysis_mode(void)
> +{
> +       const char *mtd_expert_analysis_warning =
> +               "Bad block checks have been entirely disabled.\n"
> +               "This is only reserved for post-mortem forensics and debug purposes.\n"
> +               "Never enable this mode if you do not know what you are doing!\n";
> +
> +       return WARN_ONCE(mtd_expert_analysis_mode, mtd_expert_analysis_warning);
> +}
> +EXPORT_SYMBOL_GPL(mtd_check_expert_analysis_mode);

Please put this inside #ifndef CONFIG_DEBUG_FS, as it wastes
176 bytes for the message, and probably the same for the WARN_ONCE(),
for production kernels.

> +
>  static struct dentry *dfs_dir_mtd;
>
>  static void mtd_debugfs_populate(struct mtd_info *mtd)

> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -711,7 +711,6 @@ static inline int mtd_is_bitflip_or_eccerr(int err) {
>
>  unsigned mtd_mmap_capabilities(struct mtd_info *mtd);
>
> -extern char *mtd_expert_analysis_warning;
> -extern bool mtd_expert_analysis_mode;
> +bool mtd_check_expert_analysis_mode(void);

#ifdef CONFIG_DEBUG_FS
bool mtd_check_expert_analysis_mode(void);
#else
static inline bool mtd_check_expert_analysis_mode(void) { return false; }
#endif

>
>  #endif /* __MTD_MTD_H__ */

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
