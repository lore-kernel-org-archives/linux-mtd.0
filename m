Return-Path: <SRS0=QXPY=3F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A14C33CB1
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 16:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56E602073A
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Jan 2020 16:37:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p/EGIvUA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJLTwp2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56E602073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NW+/vxjkP43ZCPr5oY/OLYYFzWlD+6XQEdxJ6ijwi8c=; b=p/EGIvUAd5hSC9
	AQA0enOo8HQvw6iylU7eAIDwYR2EnMOAfkUvdD1OBXBXsb7DF6TdCvjJimBepQYS1uoDYzE5rwqSH
	Yym0Wgd2lRWdlluWMKLjCsyLnmIsOgHJj7lBxLMWFv5dvpFQSzyruyqc10/9VEBg1HKBqbEEbtxRG
	OOw7snN6i5Oy1WdZlPDBPmiY6Ynj6I7ZwMkKjCrkrfEZNzwl59Rl3vNHZMh2XD2ZycAlCDnqaZwWQ
	k9nC37zzu0bUdKBaCxgAfrkzq4bXhRp/ojucJ8sz+9Q0LXNZJzts7G3/lf024BCi+dA8yEcDKj5pG
	K/HJIGnofoKMrm6tRQ2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is88a-0003sd-I4; Thu, 16 Jan 2020 16:36:52 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is88V-0003rn-2i; Thu, 16 Jan 2020 16:36:51 +0000
Received: by mail-il1-x141.google.com with SMTP id t8so18748478iln.4;
 Thu, 16 Jan 2020 08:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F5CUZisbEmcuPSU1emkEgklMu7uKE46FRb40awhcNNw=;
 b=EJLTwp2ZhMt6m8MIODOMxX8F0WUxZXnFllgPy0vjYRaP2a/uqLd7VgfSGrWmo8hpAJ
 NPHIjFIJGRLr4oNAz9tf5hOsdcfuVYMnqjiTf2J4RCADCuxQW+oGSsB83s4QcMRYpoPy
 vf1DpVdQTI/VdvN2YcvhWNwF4XaXJSfsa0NNO5bimCUjbA5cJJ6NJWxgsXS2WESS+fUM
 XotHwzWPyWBYZMI9ssGzm7k30A7uRYYqAYpyL23ouh5EW6o0lP2Rp5LvXf14sfItRsni
 tEMr9QVNKomtq9S+mvxD/frcA8S1mOvx2byWGDSjpzIyfdwenphPtbBOjb3rbGha0prQ
 SK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F5CUZisbEmcuPSU1emkEgklMu7uKE46FRb40awhcNNw=;
 b=l9qkSbgsM0VYhHsSgUFVk18q95MzBIU30ozE674B4CrHPCL0ZtfjxccU4y7eOZQ654
 ApgVnagnDVdp7fnp5j7yu/8pE/ZmRcMbTftLChuZz7G8RKLGW1r/qxKFVQ4whQAgjlI/
 zboxa2T8rpvkaxJcGEvHP8BOGJyPIQVo7iEa5pGhewVLb/aEN+zLsVipLZdNQCkXLkYT
 +4CfCnj7MJNicsd/O4RN+ygtd/4KqkfJ5uhMx1sNfT2ggxhA/04cuomqoNk8VBC+vF/e
 2qF4KnJsK69lB9d0v3XpJKMsGdXz8LdzZ5uXurOFUzkMMHsAn55MolumT/rvK++JtHcM
 nuuQ==
X-Gm-Message-State: APjAAAXXF6DtdiirjnCz8jPA8hDBUJiZG526gx7NJi+JB8Ph5de72aTs
 EILoiNXuB1jg1V6S/nEjSfGsnMt+zk/q1pr0Bak=
X-Google-Smtp-Source: APXvYqxwMlno7wjUoiFGxFWb2n/ehu6lv/LisVmo7tUhvmCPmOwoAt13VzXh6hngJWSHaeNKOw/agO1BB94B4lZ59eo=
X-Received: by 2002:a92:3d17:: with SMTP id k23mr4375754ila.110.1579192605275; 
 Thu, 16 Jan 2020 08:36:45 -0800 (PST)
MIME-Version: 1.0
References: <1579038243-28550-1-git-send-email-han.xu@nxp.com>
 <1579038243-28550-4-git-send-email-han.xu@nxp.com>
 <20200115080257.dtd4vss4uhopbvn2@pengutronix.de>
In-Reply-To: <20200115080257.dtd4vss4uhopbvn2@pengutronix.de>
From: Han Xu <xhnjupt@gmail.com>
Date: Thu, 16 Jan 2020 10:36:33 -0600
Message-ID: <CA+EcR23TCUU83Y7BYX5LCvGAj20+s67n+rWaGR5R9BSMHUH82A@mail.gmail.com>
Subject: Re: [PATCH 3/6] dmaengine: mxs: add the power management functions
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_083647_124550_3C09DF3A 
X-CRM114-Status: GOOD (  19.68  )
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
 Esben Haabendal <esben@geanix.com>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, vkoul@kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, linux-imx@nxp.com,
 Miquel Raynal <miquel.raynal@bootlin.com>, dmaengine@vger.kernel.org,
 Han Xu <han.xu@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 15, 2020 at 2:03 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> On Wed, Jan 15, 2020 at 05:44:00AM +0800, Han Xu wrote:
> > add the power management functions and leverage the runtime pm for
> > system suspend/resume
> >
> > Signed-off-by: Han Xu <han.xu@nxp.com>
> > ---
> >  drivers/dma/mxs-dma.c | 97 +++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 90 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
> > index b458f06f9067..251492c5ea58 100644
> > --- a/drivers/dma/mxs-dma.c
> > +++ b/drivers/dma/mxs-dma.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/of_dma.h>
> >  #include <linux/list.h>
> >  #include <linux/dma/mxs-dma.h>
> > +#include <linux/pm_runtime.h>
> >
> >  #include <asm/irq.h>
> >
> > @@ -39,6 +40,8 @@
> >  #define dma_is_apbh(mxs_dma) ((mxs_dma)->type == MXS_DMA_APBH)
> >  #define apbh_is_old(mxs_dma) ((mxs_dma)->dev_id == IMX23_DMA)
> >
> > +#define MXS_DMA_RPM_TIMEOUT 50 /* ms */
> > +
> >  #define HW_APBHX_CTRL0                               0x000
> >  #define BM_APBH_CTRL0_APB_BURST8_EN          (1 << 29)
> >  #define BM_APBH_CTRL0_APB_BURST_EN           (1 << 28)
> > @@ -416,6 +419,7 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
> >  {
> >       struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
> >       struct mxs_dma_engine *mxs_dma = mxs_chan->mxs_dma;
> > +     struct device *dev = &mxs_dma->pdev->dev;
> >       int ret;
> >
> >       mxs_chan->ccw = dma_alloc_coherent(mxs_dma->dma_device.dev,
> > @@ -431,9 +435,11 @@ static int mxs_dma_alloc_chan_resources(struct dma_chan *chan)
> >       if (ret)
> >               goto err_irq;
> >
> > -     ret = clk_prepare_enable(mxs_dma->clk);
> > -     if (ret)
> > +     ret = pm_runtime_get_sync(dev);
> > +     if (ret < 0) {
> > +             dev_err(dev, "Failed to enable clock\n");
> >               goto err_clk;
>
> From looking at other DMA drivers I know we are in good company here,
> but I think this is wrong. Doing pm_runtime_get_sync() in
> alloc_chan_resources() and going to autosuspend in free_chan_resources()
> effectively disables runtime_pm as clients normally acquire their
> channels during driver probe and release them only in driver remove.

Thanks for the comments.
That's why I moved acquire_dma_resource from the probe to
runtime_resume in the gpmi driver, this change won't disable the
runtime_pm function and the incremental counter always balanced.

>
> In the next patch you release the DMA channels in the GPMI nand drivers
> runtime_suspend hook just to somehow trigger the runtime_suspend of the
> DMA driver.
>
> What you should do instead is to make sure the hook runtime_pm to the
> DMA drivers activity phases, like for example the pl330 driver does.
> Then you wouldn't have to care about manually putting the DMA driver into
> suspend from the GPMI NAND driver.
>
> Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
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
