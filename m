Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDDAAC33CA9
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 17:33:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C394D206DA
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 17:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u4UaBUDx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="le4pHz+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C394D206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v668Sfly3prXMvmeRk1jEZgmi87gJNewBqkbO74U70U=; b=u4UaBUDxYxg73z
	c5Eibcf4PTzdmSo1Tubzc2YKsndRzM/+EATXhDMEvWRHbp6plBdQR1usFGCBEnts2X1EtYKBNxQUc
	GQtDATv7yb57uFeGSDDTDxYW9YCf0QHs2j8Lc5bCpPh6iZ2UQjTvJWSKK7xsFDWMMoZEdpHzYEGsM
	r6gHi/VvCtdgudnsKwHqVK6xuMuu/Bw4b+jrkznlXV+RGwAw7O1RliWO2ytCojKe3RoON3qaMjBLK
	VLG9YMhPADOvvOk2fjnkK8ANnDASF4UKM+DK+F/eMXmW7AMtxhC/cSl1pdh8fV27hS855i6YpNH5M
	1QYhfG3wgUIzflg7G+lw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ir3aJ-00079k-G7; Mon, 13 Jan 2020 17:33:03 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ir3aF-000798-UI
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 17:33:01 +0000
Received: by mail-io1-xd43.google.com with SMTP id c16so10679696ioo.8
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Tcj+cLv1gLfxlwm99T/LjPOFklp7r7f/h7ophdm3v8=;
 b=le4pHz+fgLYMKaliNVm7VN6XIKTaddBc3dpl6nV1F+crO5M6riPdKWnz+qM14O3/Ly
 fnDomO4HlybWEguSWr7oNRs6dgwUzAAPq4bQ2larbvknxSQzh14Kke2psQvVC436NRkW
 JVLVCBPODYOplX+IDaIALmjGEJDl+OrK9VFAG1/niRjfaenlmY6fhHMKeNTYSQ9Ri3Gw
 t1xJ4n7OYJf0U4bymI7BogyxaYVKrCGN/oggHDfWwXSbwQtIj2wpJioIfR8O8s6jn/PQ
 nLOh1pbix6aal/W259XDeMHrYLFMsd+CTdQXW4Fwkp0aB56HorflX/+pmdKbJB/5OgT5
 7b1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Tcj+cLv1gLfxlwm99T/LjPOFklp7r7f/h7ophdm3v8=;
 b=D0E/NFuDMaDMpBKu3q+m9BWhBHkncv/vqjMB3SPvA/k30Qto5S1LX1AZxk+vENusk7
 7icbucv+WUxolYTCAPhFojVOngDrZyE00vyGwCzYJVGwY0hhDs+mqRtacOW5lotHiOQM
 Amxn1RJVh1x1/65S/+X9CvSiiFH1yH16MfxB5DdWVMwIrPOMsSK9stuUqc35qI6PquBX
 ea1cU1gShtYYpxXORCo9aqSqL0AnXvVRdQm26gHe4J85LEfLQf4cztx7PRkhyxmzaLnI
 si8VKvUKNxY5dLWGzsHPLdPN+OdvBp2zWwr4/BFhKDtfgGXl2zE3itjf59OjpofKr6oZ
 LhIQ==
X-Gm-Message-State: APjAAAVHs2L+D7nibs0qb09ApBhBbarX5M8PVvFY1FE1fqefP60NIhvh
 Ce4w8+yy9pwjv0bhXV1RhIvoK3Usq7u6GtF01AHy48ya
X-Google-Smtp-Source: APXvYqw4gHQSoQ4Z+o8WBhAGejfxQvNgsWrFeHu6sB+HZ+QNRhG6rjyPySK9p/tufxMtIQGakmMHDUTa57fLd1q0hUI=
X-Received: by 2002:a6b:8b15:: with SMTP id n21mr13433905iod.110.1578936778815; 
 Mon, 13 Jan 2020 09:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20200102130826.170647-1-esben@geanix.com>
In-Reply-To: <20200102130826.170647-1-esben@geanix.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Mon, 13 Jan 2020 11:32:47 -0600
Message-ID: <CA+EcR22AiTpMwfEPhVXLmQQjsKSha7ce82xDL-gZ8P=2guRgAA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix suspend/resume problem
To: Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_093259_977118_9D0043FA 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 Sascha Hauer <s.hauer@pengutronix.de>, sean@geanix.com, martin@geanix.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 2, 2020 at 7:09 AM Esben Haabendal <esben@geanix.com> wrote:
>
> On system resume, the gpmi clock must be enabled before accessing gpmi
> block.  Without this, resume causes something like
>
> [  661.348790] gpmi_reset_block(5cbb0f7e): module reset timeout
> [  661.348889] gpmi-nand 1806000.gpmi-nand: Error setting GPMI : -110
> [  661.348928] PM: dpm_run_callback(): platform_pm_resume+0x0/0x44 returns -110
> [  661.348961] PM: Device 1806000.gpmi-nand failed to resume: error -110
>
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> index 334fe3130285..7ac8c8b95afc 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -148,6 +148,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
>         struct resources *r = &this->resources;
>         int ret;
>
> +       ret = pm_runtime_get_sync(this->dev);
> +       if (ret < 0)
> +               return ret;
> +
>         ret = gpmi_reset_block(r->gpmi_regs, false);
>         if (ret)
>                 goto err_out;
> @@ -181,6 +185,8 @@ static int gpmi_init(struct gpmi_nand_data *this)
>
>         return 0;
>  err_out:
> +       pm_runtime_mark_last_busy(this->dev);
> +       pm_runtime_put_autosuspend(this->dev);
>         return ret;
>  }

Acked-by: Han Xu <han.xu@nxp.com>

>
> --
> 2.24.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
