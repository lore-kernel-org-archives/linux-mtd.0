Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887ACC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:10:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2314064D9F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2314064D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P9vSeVE4OLIjVs3Hd8CLo0j0Scs8l41/W3rJqs5/mMo=; b=Iv7531mWOW64c4cPxGwCzEoNZ
	K0oB6xQ6zwyDz4o4k7sDkZLeEZRvFxsMdQyTrdc5IYLJfM+wAI8OQ0JK+h+YIPobMXCngqiT27aZ6
	pWTdm0w/Icnjd7PARGDi/jE/Tat7vWd1B/YNmlekTNS4M+AArj9xfJnTz4pPE5vplNyThTKsnDHWg
	xQUkyPfJzCuPW2+IuzdMDMWoYi/oJU5KclIdlvQCKb2x91I8xlDoqGwS41CvKSXtc/6oPkRfFsati
	NXPwdk9YMkFKrM8JXnCGMWDZEh6/RzfjoqggK6f8z9HM+U4+Ym1Smyt3AkkGrk3izwvl8FVwbIiuk
	Bk8TmNGlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBwMS-0008AH-KW; Tue, 16 Feb 2021 09:09:36 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBwMP-00089f-L7
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 09:09:34 +0000
Received: by mail-pg1-x533.google.com with SMTP id n10so5823132pgl.10
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 01:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JpjgJuNjtKtWA761imwPHlmI/2f8QxBoEjVaErSVOF4=;
 b=o0eQ1LM3Qv4IQRjWy6f2MWrt6Re8OIwZFunhQ8HjlkJfcs8mugA0E9sqKbDC0fHNei
 vanXa+gvBPqfKCKVRUHTGuOwPvXB/+2hawc3t1k+d24VLLhtz+xhFo/zSXfxDmgJIDNp
 n+wZbvBxnXLFBvpxsoAye3dSP+zUgQmEAexKRtUrtfalSIxGsCrg6nZk8vTWc0n1YPbc
 Ntjr0OJc6bYKqb7GgtKFjldjfZYUp7QQj5wg1KocQLXXYGzPwXOZBfpR4lLVGepNlHIh
 wyUQDEi2DM4CzSBCkQLWM/eyAh/wy/vIrDFZNH2qTUyiScsCPdN89RxTbeMfqfN+6UmV
 fxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JpjgJuNjtKtWA761imwPHlmI/2f8QxBoEjVaErSVOF4=;
 b=JeY4GKT+E99qqFYJbSRpN//o2fy78LRq1/IdUD1EnmQM/UVJHFiyL8chM8mOENfqhz
 chHj+oQYyo/joXarst5n3IcLhAAq0lW0GkDYPacCmRbohsTFKEKj/bU1fb1sZBdgKJ1q
 bMZVmaWKBn/dFEeG8DseAF66SdVL1vT4MdeIVu8SaCleQcBj9CQwo7Aldt/JnX1WVdkS
 UpRTPd+burriJpRbFxWWVPhNLlWujgq/pn9c30f06IbJV3E5N9pcQr/OIshV+Inx4P02
 9n2nYtvXaGtcsO0qj5J95HE+sYpHnkbpEkc95Z+85wBuR3VXpRBaRdXQfHIsZHaZAoUH
 T9LQ==
X-Gm-Message-State: AOAM532ou2ZeI1VIXbpaYihWZl2BIu1xafIyqHH6vzx8Bx4bM4haBE68
 CVB+f1zRA0mQ/jqIK8NYQN/1ELA/NUPdK+JytAc=
X-Google-Smtp-Source: ABdhPJwXrvmtXDcEVq1uSnFQgtJ7DognUvtEq53YOKvW7L0RrWC13XTeeNe8QuwyQdkgeEdWtMMSW3QQ6UwM8dfMP5c=
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr18258982pgt.74.1613466570006; 
 Tue, 16 Feb 2021 01:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20210216072334.7575-1-jbe@pengutronix.de>
 <20210216072334.7575-2-jbe@pengutronix.de>
In-Reply-To: <20210216072334.7575-2-jbe@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Feb 2021 11:09:13 +0200
Message-ID: <CAHp75Vcha++UUE6hw0n_pBnA24q_uJQekABSSktmjCoinfpSoA@mail.gmail.com>
Subject: Re: [PATCH v2] fs: ubifs: set s_uuid in super block to support
 ima/evm uuid options
To: Juergen Borleis <jbe@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_040933_768156_3786016F 
X-CRM114-Status: GOOD (  16.94  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 16, 2021 at 9:24 AM Juergen Borleis <jbe@pengutronix.de> wrote:
>
> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>
> This is required to provide uuid based integrity functionality for:
> ima_policy (fsuuid option) and the 'evmctl' command ('--uuid' option).

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
One issue below has to be addressed nevertheless.

> Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Co-developed-by: Juergen Borleis <jbe@pengutronix.de>

According to the documentation [1] above has two issues:
- all Co-developed-by *must* be accompanied with corresponding SoBs
- commiter must provide his SoB (but it will be implied by the
previous requirement in this case)

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  fs/ubifs/super.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 138b9426c6c1..a8383ca39a47 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -2230,6 +2230,8 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>                 goto out_umount;
>         }
>
> +       import_uuid(&sb->s_uuid, c->uuid);
> +
>         mutex_unlock(&c->umount_mutex);
>         return 0;
>
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
