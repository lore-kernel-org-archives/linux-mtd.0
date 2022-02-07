Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF231C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Feb 2022 16:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvutzZJBtctKDLVnFGq56MYIwziQ7D9126gw/Am6lbo=; b=Qw9AgvVC2ZGe/K
	HG3L0WOIFBHAcsWisqvmGrD4ulWAchbtrP5lz/syecRQMlJrOa32nZx2IWZAr9CTj+pPObnc+AdVa
	yXSPIF885HPSzd/uhoStzyyiaywhYU3Uo3rDE09Ps/1UwrlVdPPXKxKM3iskM77PxSDoBo3EdqALX
	HyVNuuOW+ApzrsQtjoOiGGftmG86CWGY/nl3s/Y58Ufgt9ZKLd5RrzihQuGuJyNbgmFlhYdulPGNW
	t/dYfGAg9NwRsgjrnx3CCoToY9GpPHheMC17ylF4Hy8JQ9R7RJY12RBusevMjAcsM4z8zuSeXsJ23
	UcJGbjhbD0Sz4FaqPbcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH6R5-00AvC5-Hz; Mon, 07 Feb 2022 16:00:15 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH5x6-00AiZ0-EN
 for linux-mtd@lists.infradead.org; Mon, 07 Feb 2022 15:29:22 +0000
Received: by mail-ua1-f49.google.com with SMTP id w18so19982331uar.8
 for <linux-mtd@lists.infradead.org>; Mon, 07 Feb 2022 07:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=33YJCaGg6K8QsHy3vQzYH9uC2zus+XP8SWOVk2ACz+M=;
 b=b8oEPvhBcT23Qco36zPXTlKFXL1LGKK5Y03DGA+tWBcmfCtYrqf/zxnXaxLUkCgy0h
 pRSk4H5VitAd48bE4dq2y/Aws2y9PqPvalxSuWX5uDqLQ/R+MSyNvq1rBzIKgRtosmQQ
 MxDA2CtPxvDDxPBJfzHIOx6Nk0DyOEkVPu2WxnNNaPj1/D9ARHqlvQfTuHGyPoaaMoe+
 bcbYlasp0BqS7nghi4H4Ne14uEJAcu2B4hHf3feL6sWfoT6GtVwgvBuMwkg7d4H2oaA5
 znbf5Oya7vxUluiemFzIDsgrynYC7u/AEZEN07Pm92pGl4WC5iJpGmRAt2ojSOBoBEyY
 P94A==
X-Gm-Message-State: AOAM5301GGbPP6cj8XOR+8FZCBGjpT9SkSLg9w8kAPJyuj4tpPG8JseJ
 Td8EAvq59c/J7Ol/VoL72SMHrmr2n5EDFg==
X-Google-Smtp-Source: ABdhPJxMCMl5uHayQIuz3m9SJShJHTjcQgVIGOkLTaBNit1l4XtnFZrbr6LpMRtceV0uzVZOpYGt5w==
X-Received: by 2002:a9f:2c0a:: with SMTP id r10mr45335uaj.89.1644247754634;
 Mon, 07 Feb 2022 07:29:14 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id k204sm2620693vkk.0.2022.02.07.07.29.13
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 07:29:14 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id c36so23238884uae.13
 for <linux-mtd@lists.infradead.org>; Mon, 07 Feb 2022 07:29:13 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr4265527vsa.77.1644247753737;
 Mon, 07 Feb 2022 07:29:13 -0800 (PST)
MIME-Version: 1.0
References: <20220128113414.1121924-1-miquel.raynal@bootlin.com>
In-Reply-To: <20220128113414.1121924-1-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Feb 2022 16:29:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPD96bL72GfJiuGs3R3gFkMp8t1KhXaz=2uESYMFumBw@mail.gmail.com>
Message-ID: <CAMuHMdWPD96bL72GfJiuGs3R3gFkMp8t1KhXaz=2uESYMFumBw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: Replace the expert mode symbols with a single
 helper
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_072916_523025_F74A597D 
X-CRM114-Status: GOOD (  22.79  )
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

On Fri, Jan 28, 2022 at 12:34 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Reduce the number of exported symbols by replacing:
> - mtd_expert_analysis_warning (the error string)
> - mtd_expert_analysis_mode (the boolean)
> with a single helper:
> - mtd_check_expert_analysis_mode
>
> Calling this helper will both check/return the content of the internal
> boolean -which is not exported anymore- and as well conditionally
> WARN_ONCE() the user, like it was done before.
>
> While on this function, make the error string local to the helper and
> set it const. Only export this helper when CONFIG_DEBUG_FS is defined to
> limit the growth of the Linux kernel size only for a debug feature on
> production kernels.
>
> Mechanically update all the consumers.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
