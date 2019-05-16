Return-Path: <SRS0=GzCT=TQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18BAC04AAF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 16:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A560C20815
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2019 16:15:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2jbSHlN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YGLG2XRT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A560C20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rwc0nQ154FXWC5WVTJOWcKVDGGkDivA+dwWITz8hQjQ=; b=J2jbSHlNTXze0P
	4NUKSAAynbvQzJ8zRdQEKpDmMlMTzM3naSjl46YyK+sRSt9zdN4dL39b7Tf8ny0BcoGk60l2Kcs4V
	j5osTlrER9xjhneoust0d+S0/h09WyDrjyKC+kty5udCz8LHVke+lIbBTIlLbO1cwBnWp5ukisstO
	ES3lf5xaIGU8leeTZT4v841j7PEyj3O77DRnZC7Vf2ukSLWepgmOy+PbDOLFYbt8w8TuyPgFzZ5/5
	q/X9kOONNpMTkVjufzV0i0GXUQA0c+ORxV8E4HznyqKWWwVjjZszh4LWa3n3527uW4mG7nHgxX0Z9
	6nLKhZPRCDpHdEgbJ4DA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hRJ2Y-0003P1-OY; Thu, 16 May 2019 16:15:30 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRJ2W-0003Of-Ec
 for linux-mtd@lists.infradead.org; Thu, 16 May 2019 16:15:29 +0000
Received: by mail-lf1-x143.google.com with SMTP id x132so3125359lfd.0
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2019 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LBNDRhhKywXBp2MSuZfngBTVHWR97SCmvRB6eI8uLbE=;
 b=YGLG2XRTx2rzAnfC7U7Pt27EAxYtRFVsHIL2F6MDo4Eb18nu45zjdjHrwS1A9kdPGe
 7AIr1yDi9FrkAOD910N+/Gftjemk6VQpdwLEb6WWejY5+Cn6CS2NDKVPjnz4IQ92cu0t
 0s8PelXOgvWB0aAfwdmg6nSu5jdC5BtNCXpg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LBNDRhhKywXBp2MSuZfngBTVHWR97SCmvRB6eI8uLbE=;
 b=MZCprCZq9MlQ5TjOBSqymA/IiiTx5Z++wCniVZ1pfc3+xDW+vJ/RohGcXclVF4YwvO
 tCv71o0SGlXhx3kKOqW1g54zPNyY6iHCSGCB8qFBgcQtWPBrGCBYhGrpEfCwtveXkmoB
 /ePvd6GPxKaOsVBdLayyxdZEmNWEJ2rFZh7n6A6oa+Zwxsuqu4YBoYRJkmvlPgsj4ST3
 s6vh65I7C2Q6DGzdW2dKezykrGEGxxeoukGhMFizqyBVaGmfM//AaeZakF3PUqqtb6pU
 s+iH6h8xCfEyvZng6GdvISKEo7cNhFOdz9mjFO15JnwQFEXpVDnk58IOEW7icLP4DkBX
 i4ig==
X-Gm-Message-State: APjAAAUzFkkWG9AQsaAtfqf7trY+WLd3t4qcjIUdd4tgH3reIHnQ9Kly
 kjP733LWCO4Ucptk2FmNp8fNzuCkQatrc+X8NOE4mA==
X-Google-Smtp-Source: APXvYqzDx21IaIaK95EwYZHZnuKZ60WB8qRKmhPS4eJD5UoIunNxJ5iVpBl+vhmkGydAw0xGLL0IfTX7yIdjwsn9BZs=
X-Received: by 2002:a19:2791:: with SMTP id n139mr16901324lfn.67.1558023326364; 
 Thu, 16 May 2019 09:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <1558022399-24863-1-git-send-email-kdasu.kdev@gmail.com>
 <1558022399-24863-2-git-send-email-kdasu.kdev@gmail.com>
In-Reply-To: <1558022399-24863-2-git-send-email-kdasu.kdev@gmail.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 16 May 2019 12:14:49 -0400
Message-ID: <CAKekbes5XOU81ANJGeSsn_Ww59Fx1kymBt8fscv-fsSJdvaVeA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: nand: raw: brcmnand: When oops in progress
 use pio and interrupt polling
To: Kamal Dasu <kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_091528_494869_2E0B2B47 
X-CRM114-Status: GOOD (  13.80  )
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
 open list <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Please ignore v2 patch 1/2 and 2/2. The commit ordering is not right.
v3 patch on the way



Kamal

On Thu, May 16, 2019 at 12:01 PM Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>
> If mtd_oops is in progress switch to polling for nand command completion
> interrupts and use PIO mode wihtout DMA so that the mtd_oops buffer can
> be completely written in the assinged nand partition.
>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> ---
>  drivers/mtd/nand/raw/brcmnand/brcmnand.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> index a30a7f0..dca8eb8 100644
> --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> @@ -835,7 +835,6 @@ static inline void disable_ctrl_irqs(struct brcmnand_controller *ctrl)
>         }
>
>         disable_irq(ctrl->irq);
> -
>         ctrl->pio_poll_mode = true;
>  }
>
> --
> 1.9.0.138.g2de3478
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
