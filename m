Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EB8C63798
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:44:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F236821D91
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 23:44:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTb+X1+8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcwbyPC8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F236821D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZJy8iuRL+IWNoEImrEWSwy0esWj+IZf4PiMG8KEgcsY=; b=dTb+X1+8Vvr+i4pyljrCWOcDT
	j6rnAsM9rbN5lcMqzvjDdl2yE3qGDLQ/TqiykOVuBfztnDPNfvIPj33RUkDoLj9j2NLasZ6JKAzeC
	LkpnFi2PIbmFt4o6qdUTZPBFh4Hv7EkpZU5qr4E9hDVvdicb3CkhdcOS8GBUazWGRodFlsxi2NOCl
	DWADCJFuVGo26ys+TK7eBSDZz/X4S4TowYmu1F/I/YsuwTZ8vhRFodri2XETdn4ugXoub07pQdBYP
	jFs+dS3Bwni3lYvrfVy6plWhbNyaJwczdhCqMk47WqlpUftd+LNBPpVGNXWIdrQNkqk2HJqVjeZ4x
	chqgiCnbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiQvf-0003mb-LV; Thu, 26 Nov 2020 23:43:59 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiQvd-0003l6-Aa
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 23:43:58 +0000
Received: by mail-qk1-x743.google.com with SMTP id h20so2971971qkk.4
 for <linux-mtd@lists.infradead.org>; Thu, 26 Nov 2020 15:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zcqACUTI0xbgUeWnOF9hLet+M8EOrMf6mBt6g/iGrR0=;
 b=PcwbyPC8uOeQF89wZijyOyVo2okZPxNN6bcpOjq3I6UQSZESZGAYnPi1JroXP78MpH
 vChf5RbzsVUs57O7D7zo9wMkWejxEtGMN9pnuoa/nMH2IL4DaX1XGg8r+c0DlbHB1uOT
 11fFFCLD/NWvJaCbtu7q3eUWZo4+hVFiYRrIs6LDDmHMwDh81a3faybh/bFbheTXw9B3
 L4JfF32iJVDQhmDps5dsJ1pJtwxXpj2ozWcPzXvDG3fYcr+EIvw7hQe//KMItwQoNz2S
 OKLuKdnCOD0zEm1qy1E8cbrr/8T2Lltu2DUbzentO4Hc6Q79ULY5BmChTIXMt3CmPuhS
 bNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zcqACUTI0xbgUeWnOF9hLet+M8EOrMf6mBt6g/iGrR0=;
 b=Vb5D0QGsguIkSx+OUmKuke0Itk4Z+2MQvgk/pWL6ruv2iSk8mYlydOBDpEx1ycgPRy
 lPOfnxmjbDF5vcV/DpUhw3Jkyrk/mrnOVyaUtmWlVrGgP+aF4CJEnJER2MsoeI3OuGO4
 5/nrJH9UY5p+mXj4jE1Dj4Un5zW1yZ46/jRN5hu0cuXKI0l84dyq67xDRFtYlBQWWXCW
 UvLRQefNbW31jkBPk9YhL0faGBNWRsXKBXmn2uL+BRZP0FgVq8wtdce8A9I7WKQ0S0IK
 jd2I8gMFjjD3rSNQAScSEx8w//xYTYg8C1xar3RqRSWlZ1nzTBsfm2l8GkBhOJXEzeOu
 rlwg==
X-Gm-Message-State: AOAM531yn2unkUE0gULmJJBLRFiyXUDDfxZohy0YYrPPeTIf2AhUFuxl
 +qQL+xe/xvl4SQZYA8f68ZR3gDuDd4KYLDFi4E8F5WNz3zM=
X-Google-Smtp-Source: ABdhPJwmL/KWqBnGN6u4iSNEBoZioJIRxu4Pw/wZ8tCrXok1kvw8akIXMMxS1XI5ztH/96yt/rxF4jrGmmu0w7aFBdA=
X-Received: by 2002:a37:a8c9:: with SMTP id r192mr5777641qke.108.1606434233227; 
 Thu, 26 Nov 2020 15:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20201126224108.2325-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20201126224108.2325-1-chris.packham@alliedtelesis.co.nz>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 27 Nov 2020 00:43:41 +0100
Message-ID: <CAFLxGvxKtdi6m2pZEctJZAFLaJPRR57U8s_RJVY7uV9yc27W_w@mail.gmail.com>
Subject: Re: [PATCH] libmtd: avoid divide by zero
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_184357_444298_560DD46D 
X-CRM114-Status: GOOD (  16.97  )
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
 linux-mtd@lists.infradead.org,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 26, 2020 at 11:48 PM Chris Packham
<chris.packham@alliedtelesis.co.nz> wrote:
> Some mtd-ram devices report 0 for the erase block size. Avoid a divide
> by zero when calculating the erase block count for such devices.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  lib/libmtd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/libmtd.c b/lib/libmtd.c
> index 9d8d0e8..8aa1cb1 100644
> --- a/lib/libmtd.c
> +++ b/lib/libmtd.c
> @@ -791,7 +791,8 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
>                 return -1;
>         mtd->writable = !!(ret & MTD_WRITEABLE);
>
> -       mtd->eb_cnt = mtd->size / mtd->eb_size;
> +       if (mtd->eb_size)
> +               mtd->eb_cnt = mtd->size / mtd->eb_size;

I think it is better to check for MTD_NO_ERASE.
->eb_size is only allowed to be zero if MTD_NO_ERASE is set.
In that case we can configure mtd->eb_cnt to 1.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
