Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFAFC33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 21:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2DC224658
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 21:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3edDSKl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RitqRUb7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2DC224658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F+5CaU/KsvVT1bS7j2kEzBIa9AEyV9bkfDy75bVJOu4=; b=L3edDSKlfSxl0j
	kleum/MkuCYb2nFnT6onQmVyl0bFX2tWLjkBCiUR7LfcOXcFaD3v27Od4pTlRyCVefWrZnh73u+ne
	iNd1CMby62ZEECIukG7axv8qgqrd2eaalOnpvVFCOnKzrTUmvCIKuK3YVyOytTC02/AlnhouNDTJe
	XI1zAcL4OlQsL21epKYmOP2E072k1nvdoGkICpGr9ChBpwgCuRyCuAVLH2b14K5YJYoG9y/AiScCi
	fa12SCDCvmvQhYSmLAUa0+c+IiozTw2Sz4IeboCZs4IjR9LoG+aL6zFntjmUzpD4x+9b0hsM3GKn1
	VRmG77OXr67m9z/Tvbiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irU8e-0000rJ-0g; Tue, 14 Jan 2020 21:54:16 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irU8Z-0000qx-Tu
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 21:54:14 +0000
Received: by mail-io1-xd44.google.com with SMTP id t26so15589334ioi.13
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2020 13:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMhhs/W+1svvDWDR4NPNAPLAvpIZnSm55C+XNSAN5tQ=;
 b=RitqRUb7sGWpYadAwlnVIL7p3f3rKdH6BvilIwLqowXAiFrylQ7ZGCbr1AlJXikMiv
 5ELwly8YbyUCIuYRmfIdlFeus/Qpe+5enCWvBZ496JdIgf3GD7zdgtIKhlWf8LnWOcBT
 ekYhCFbHI/lFJGSnkpf2KlsyWtZkXXbVgpciAstXOH0yj9lw7QEq5GGYYG1daMwysr/o
 b0HqJj9VaMvH+5seFKbKWJ4i2SK6JZOZ/ubwk7Q4dHzO2SbXIdraGnj5hSeWveQBtsWB
 aStcyKhx8yuObaXJ0KP69ftI3c1tnrLiQJB3ZDkaqEkygmdixgxPCR00Jw1GBrzq4gyV
 LXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMhhs/W+1svvDWDR4NPNAPLAvpIZnSm55C+XNSAN5tQ=;
 b=syxTMH9zfL1anE6qWAv9JnjMQVQmgn7Rw03e+iaNjrqsr0jhaegCdco/FdVrOvqMdE
 wZpYiVJt8ii3tqwY1+3atxXIxzUjqyg9FsDNfmd2FNcKsxvrFB8yCs59+sicBDYJPMPB
 /rQEaxDJdMLiCSnGkQ4NZHTdjDQM2rquK26Wuyx37lD0+RoKw6URgNFX3hATzPOJW/iM
 D1KUk0eR2NBN/KgDdBJYebOnvHkBIV3naXYOHdAqSflXSx2SOU8Dv8nJ6NAH7OviflaF
 93yZWS8ylPnJbQciav3nUCCLEKUkPQPdXW9gX/+yUqMelGZOfD8OGKgtZ05j13bRTvzo
 1isQ==
X-Gm-Message-State: APjAAAVRAFbG/YAGzMzAL8jr7vyVTiI9VnnO7noeFbLBaAuASo/TUgrg
 aq5bpQ7iwL3/l4ImftUKfdXwKvGzAYBHfIqqQU0=
X-Google-Smtp-Source: APXvYqym5nXDteCe27httL7oBaR5YZGnO401x6bMrkRXidkpMWqX2QHA4vsSW3ApmmLskNT+VV1PHxF/OCnzM6dhWPM=
X-Received: by 2002:a02:c995:: with SMTP id b21mr21110397jap.112.1579038849152; 
 Tue, 14 Jan 2020 13:54:09 -0800 (PST)
MIME-Version: 1.0
References: <1578589556-683-1-git-send-email-han.xu@nxp.com>
 <87r208mk8p.fsf@geanix.com>
In-Reply-To: <87r208mk8p.fsf@geanix.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Tue, 14 Jan 2020 15:53:58 -0600
Message-ID: <CA+EcR2149W_x2gi8jUZ6sK=tmwo6tCAZ6jp37gG9fyxMFa43mA@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix the suspend/resume issue
To: Esben Haabendal <esben@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_135413_057320_6A0F9854 
X-CRM114-Status: GOOD (  26.97  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, martin@geanix.com,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, sean@geanix.com,
 Han Xu <han.xu@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 9, 2020 at 2:46 PM Esben Haabendal <esben@geanix.com> wrote:
>
> Hi Han
>
> See comments/questions below.
>
> If I understand the purpose of some of your changes correct, you are
> fixing the handling of pm usage counter, as it currently is incremented
> in gpmi_init() and decremented in gpmi_nand_remove().  I believe that
> would be nice to have in a separate patch with an explanation of the
> change.
>
> Han Xu <han.xu@nxp.com> writes:
>
> > fix several issues when system suspend/resume,
> >
> > - leverage the runtime pm for system suspend/resume
> > - enable the clock before register access
> > - re-apply timing settings
> > - set the proper pinctrl state
> >
> > Signed-off-by: Han Xu <han.xu@nxp.com>
> > ---
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 59 ++++++++++++++++------
> >  1 file changed, 44 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > index 334fe3130285..37437d47ab9a 100644
> > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/pinctrl/consumer.h>
> >  #include <linux/dma/mxs-dma.h>
> >  #include "gpmi-nand.h"
> >  #include "gpmi-regs.h"
> > @@ -146,7 +147,11 @@ static int __gpmi_enable_clk(struct gpmi_nand_data *this, bool v)
> >  static int gpmi_init(struct gpmi_nand_data *this)
> >  {
> >       struct resources *r = &this->resources;
> > -     int ret;
> > +     int ret = 0;
>
> I don't see why this is changed, given that ret is unconditionally
> assigned in the next line.

removed.

>
> > +
> > +     ret = pm_runtime_get_sync(this->dev);
> > +     if (ret < 0)
> > +             return ret;
> >
> >       ret = gpmi_reset_block(r->gpmi_regs, false);
> >       if (ret)
> > @@ -179,8 +184,10 @@ static int gpmi_init(struct gpmi_nand_data *this)
> >        */
> >       writel(BM_GPMI_CTRL1_DECOUPLE_CS, r->gpmi_regs + HW_GPMI_CTRL1_SET);
> >
> > -     return 0;
>
> Please provide an explanation of the reasoning of this change is.

I prefer to pair all runtime ops in same function, get_sync before
register access and put after that, in all cases.

>
> >  err_out:
> > +     pm_runtime_mark_last_busy(this->dev);
> > +     pm_runtime_put_autosuspend(this->dev);
> > +
> >       return ret;
> >  }
> >
> > @@ -528,7 +535,7 @@ static int common_nfc_set_geometry(struct gpmi_nand_data *this)
> >  static int bch_set_geometry(struct gpmi_nand_data *this)
> >  {
> >       struct resources *r = &this->resources;
> > -     int ret;
> > +     int ret = 0;
>
> I don't see any reason for this change.

removed

>
> >       ret = common_nfc_set_geometry(this);
> >       if (ret)
> > @@ -2676,7 +2682,7 @@ static int gpmi_nand_probe(struct platform_device *pdev)
> >       return 0;
> >
> >  exit_nfc_init:
> > -     pm_runtime_put(&pdev->dev);
>
> I guess this is because of the change above that causes usage counter
> not to be incremented in gpmi_init() when it is successful.
>
> > +     pm_runtime_dont_use_autosuspend(&pdev->dev);
>
> Is this required before pm_runtime_disable()?

If probe function failed before runtime timeout, for instance, the
NAND chip not mounted, the runtime suspend won't be called without
this change.

>
> >       pm_runtime_disable(&pdev->dev);
> >       release_resources(this);
> >  exit_acquire_resources:
> > @@ -2688,7 +2694,6 @@ static int gpmi_nand_remove(struct platform_device *pdev)
> >  {
> >       struct gpmi_nand_data *this = platform_get_drvdata(pdev);
> >
> > -     pm_runtime_put_sync(&pdev->dev);
>
> Should be covered by explanation of the change in gpmi_init().
>
> >       pm_runtime_disable(&pdev->dev);
> >
> >       nand_release(&this->nand);
> > @@ -2700,10 +2705,12 @@ static int gpmi_nand_remove(struct platform_device *pdev)
> >  #ifdef CONFIG_PM_SLEEP
> >  static int gpmi_pm_suspend(struct device *dev)
> >  {
> > -     struct gpmi_nand_data *this = dev_get_drvdata(dev);
> > +     int ret;
> >
> > -     release_dma_channels(this);
> > -     return 0;
> > +     pinctrl_pm_select_sleep_state(dev);
> > +     ret = pm_runtime_force_suspend(dev);
> > +
> > +     return ret;
> >  }
> >
> >  static int gpmi_pm_resume(struct device *dev)
> > @@ -2711,9 +2718,13 @@ static int gpmi_pm_resume(struct device *dev)
> >       struct gpmi_nand_data *this = dev_get_drvdata(dev);
> >       int ret;
> >
> > -     ret = acquire_dma_channels(this);
> > -     if (ret < 0)
> > +     ret = pm_runtime_force_resume(dev);
> > +     if (ret) {
> > +             dev_err(this->dev, "Error in resume %d\n", ret);
> >               return ret;
> > +     }
> > +
> > +     pinctrl_pm_select_default_state(dev);
> >
> >       /* re-init the GPMI registers */
> >       ret = gpmi_init(this);
> > @@ -2729,22 +2740,40 @@ static int gpmi_pm_resume(struct device *dev)
> >               return ret;
> >       }
> >
> > +     /* re-apply the timing setting */
> > +     this->hw.must_apply_timings = true;
> > +
> >       return 0;
> >  }
> >  #endif /* CONFIG_PM_SLEEP */
> >
> > -static int __maybe_unused gpmi_runtime_suspend(struct device *dev)
> > +#define gpmi_enable_clk(x)   __gpmi_enable_clk(x, true)
> > +#define gpmi_disable_clk(x)  __gpmi_enable_clk(x, false)
> > +
> > +static int gpmi_runtime_suspend(struct device *dev)
> >  {
> >       struct gpmi_nand_data *this = dev_get_drvdata(dev);
> >
> > -     return __gpmi_enable_clk(this, false);
> > +     gpmi_disable_clk(this);
> > +     release_dma_channels(this);
> > +
> > +     return 0;
> >  }
> >
> > -static int __maybe_unused gpmi_runtime_resume(struct device *dev)
> > +static int gpmi_runtime_resume(struct device *dev)
> >  {
> >       struct gpmi_nand_data *this = dev_get_drvdata(dev);
> > +     int ret;
> >
> > -     return __gpmi_enable_clk(this, true);
> > +     ret = gpmi_enable_clk(this);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret = acquire_dma_channels(this);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return 0;
> >  }
> >
> >  static const struct dev_pm_ops gpmi_pm_ops = {
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
