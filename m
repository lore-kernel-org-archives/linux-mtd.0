Return-Path: <SRS0=qEsD=TR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0489C04AB4
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 08:08:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D0E20848
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2019 08:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oMaNh2XV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rpChBtU/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D0E20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJi9h0OqbDodgnK5YwpioFPThmAN1r+ROqaOpZCbA3A=; b=oMaNh2XVswxQaT
	LtPjhwH8K+xnMVrjVURfEgU3qLVnLS728Vr3iu8biB7e8pOQIaWE8DV1Vr8/SAPmAZJhrbi4TnG5M
	d4UnLyBVev3s7mj86HCbwHxLvEU2N/houHLaOnHllioycbMsD4ESCojV0Jt5GYxSUd0Kxut3fxP7g
	ZjzAtPNuECH+ZZ54rjIeHttJZnwIN0lsTW7Xe8F571luwfo90kVhPRcVCUdzNWJeCX/rOETduozGP
	zwn9laU92XNEOiGbMcP4ggbIYXWRQJh071xcJ3nlvJVmF3B3MnPFQAOyEXavLZfXtX16DtT8NHFBM
	VHI16rm/TuiuVoRMmSpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRXvC-00025X-5Q; Fri, 17 May 2019 08:08:54 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRXv8-00024z-8V
 for linux-mtd@lists.infradead.org; Fri, 17 May 2019 08:08:52 +0000
Received: by mail-wm1-x341.google.com with SMTP id j187so8727387wma.1
 for <linux-mtd@lists.infradead.org>; Fri, 17 May 2019 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JfYR82SrJwNVW06pJvRPW4k79pA13x1SVkcHvJx5clA=;
 b=rpChBtU/BLblhzIRB0YKed47JbgJMePYBfD45yam5dH3+203i3Rz0AIudOxQOKNoQK
 b3QzwfvqJeMQchb4iCTNTUR5Tyn+cMw+fKa+3PCfJSizLauF9TAunUE/cGE6NpE9FqjE
 zXS4hCm9OpkHg9uKNPppRzfk0T/EApeUcwjmJU+MCdzSNFVNbeDPvnb7t+04FNfyIKtN
 pyNqF/W+OQq/8Z8/07YJJ8MLquI0tUyh4bPIzR6c2qUmKgSgRRgDj5q8X3j+FV1wLOBH
 iCVSxsT2dyJZWNIcuzIWIF65mey4Sp/NS/I97gmcIdsSRtUioAQ+2CEScngaOMWxNdk3
 esyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JfYR82SrJwNVW06pJvRPW4k79pA13x1SVkcHvJx5clA=;
 b=r8aMp1D4vAjdFrXOC+ML9ZVfJ2HZ56MUZDyHFDjWga464D/xsWsU1vmsQUu9Voq+xh
 aQlCLq0Q0ptD6oCREHSJEkCJ7wFT5pooJolWvlvwGxGBeVq754Fe4CL1YzynT2hT5XN2
 dpN27L6EaQ4GXte2tGzgPKVoC6x7jV7KC3Gwiu5BjMc6rIYn7BTtDPPxGueoEvjZI8IO
 KrhSBgTQg/M205b0tKnUtJS0Vr4/t0mZy6fGavl7/3cQ8nlV0gZ/I7VzJgBBAuGC2IUj
 SrfUGWFEnGlHxWRFHDzt+D1q/mZNrrV00AFDlD3uFXm5/lFjVMJ63aiq1K7e/aTOtCAn
 seVw==
X-Gm-Message-State: APjAAAUsgZ5s24YFbM+5y6kyzCxuRV6uJgGiY+0ovRnrt22eDHiF+sG0
 y6qTl+g/7l/gfgV+4/i25TqdjxfAHibux/DjnjM=
X-Google-Smtp-Source: APXvYqwg2RzALCC9z6vUHJ9UiTDIM1iXYb5OAieioPqeEcdSlbhsUvyU17mYxRE6I875hxeldwXhsfyWu2yfttSuAEE=
X-Received: by 2002:a1c:4909:: with SMTP id w9mr1265084wma.17.1558080528334;
 Fri, 17 May 2019 01:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <1558024913-26502-1-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1558024913-26502-1-git-send-email-kdasu.kdev@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 17 May 2019 10:08:36 +0200
Message-ID: <CAFLxGvwjqo27VQ092WV9=6N5RJr-M7aL0HYVWkeaCYbY3XWa1w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] mtd: Add flag to indicate panic_write
To: Kamal Dasu <kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190517_010850_326133_8386B3A3 
X-CRM114-Status: GOOD (  17.78  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 16, 2019 at 6:42 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> Added a flag to indicate a panic_write so that low level drivers can
> use it to take required action where applicable, to ensure oops data
> gets written to assigned mtd device.
>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/mtdcore.c   | 3 +++
>  include/linux/mtd/mtd.h | 6 ++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 76b4264..a83decd 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -1138,6 +1138,9 @@ int mtd_panic_write(struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen,
>                 return -EROFS;
>         if (!len)
>                 return 0;
> +       if (!mtd->oops_panic_write)
> +               mtd->oops_panic_write = true;
> +

You can set the flag unconditionally.
If it is set, it will stay so, and setting it again, won't hurt.

>         return mtd->_panic_write(mtd, to, len, retlen, buf);
>  }
>  EXPORT_SYMBOL_GPL(mtd_panic_write);
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index 677768b..791c34d 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -330,6 +330,12 @@ struct mtd_info {
>         int (*_get_device) (struct mtd_info *mtd);
>         void (*_put_device) (struct mtd_info *mtd);
>
> +       /*
> +        * flag indicates a panic write, low level drivers can take appropriate
> +        * action if required to ensure writes go through
> +        */
> +       bool oops_panic_write;
> +

Maybe we find a better name for it.
panic_write_triggered?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
