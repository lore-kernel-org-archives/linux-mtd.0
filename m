Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E46CED249
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 22:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fdtvcN2oMeGFvI6/1B9Ig3UBC+HhIy1QqcwRk8uRKE=; b=C9w2RspcuPWWnr
	lSL2yCMHzlDiV4i/rmB7+MlevDZEujpz+wvobC3Hd/lpePK//iOOdzSIjxL9ltZjHmjdjpHPS0hXO
	Wm+vFzZiQVCNR1Mm0JIEYTQX5keCLSuOR61tRywdL3+bNmaL0/AuS61R4gM7Jl8dygXYPzP039fLs
	OOuJ+dhUxvFxqhVQowrvkhezeW/2MMqz+PKvxWW+UJp2lcS7hCQLR9knlc5kQtpZPQ8uLLDsmzN+3
	FevjJHmGCpayZeOHk97B48mG2CYa73FwjSjwE3l9hVTTiNtZza4zZbQwRcgaL8enQQFvNi2WFNJTy
	yLXi8vo1PAZo6QPXbkKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxwBV-00000003v3A-0No9;
	Mon, 07 Oct 2024 22:26:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxwAA-00000003usp-2rXK;
	Mon, 07 Oct 2024 22:25:12 +0000
Received: from pendragon.ideasonboard.com (unknown [132.205.230.14])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BF2C2E0;
	Tue,  8 Oct 2024 00:23:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728339812;
	bh=dP+7pB+yKyOf0NQhF4Ey5QlbknqrHAfw9DP+SkAi1ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vt/jQpsJvHUxjmrGDOx6XdDb5/eYcmNOZ+fqGvfgmsCX/Gb8xh5L8MF7/XiaHHs5d
	 yKwoK1M07KNVU8k6VzBH5mlVNl0fsdfcm8rX4+3gQCvlKP9vNnMhm8hVpFB58jMlbq
	 3JlQ6yo4ObX+z3BTaIVDayxCEaIiiFVwmh4Cxqis=
Date: Tue, 8 Oct 2024 01:25:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-gpio@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, patches@opensource.cirrus.com,
	iommu@lists.linux.dev, imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org,
	asahi@lists.linux.dev, rafael@kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 00/51] treewide: Switch to __pm_runtime_put_autosuspend()
Message-ID: <20241007222502.GG30699@pendragon.ideasonboard.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <CAPDyKFp0N6UJhnHS164Tdf=xkWB0jzq65L9TdvYazeBQ-6WjeQ@mail.gmail.com>
 <20241007184924.GH14766@pendragon.ideasonboard.com>
 <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFpQVnF7eQv3dup8k-3EijnMjuveCG9sZ=Rpey1Y6MBJEg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_152511_217180_E66D27D7 
X-CRM114-Status: GOOD (  29.30  )
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

Hi Ulf,

On Tue, Oct 08, 2024 at 12:08:24AM +0200, Ulf Hansson wrote:
> On Mon, 7 Oct 2024 at 20:49, Laurent Pinchart wrote:
> > On Fri, Oct 04, 2024 at 04:38:36PM +0200, Ulf Hansson wrote:
> > > On Fri, 4 Oct 2024 at 11:41, Sakari Ailus wrote:
> > > >
> > > > Hello everyone,
> > > >
> > > > This set will switch the users of pm_runtime_put_autosuspend() to
> > > > __pm_runtime_put_autosuspend() while the former will soon be re-purposed
> > > > to include a call to pm_runtime_mark_last_busy(). The two are almost
> > > > always used together, apart from bugs which are likely common. Going
> > > > forward, most new users should be using pm_runtime_put_autosuspend().
> > > >
> > > > Once this conversion is done and pm_runtime_put_autosuspend() re-purposed,
> > > > I'll post another set to merge the calls to __pm_runtime_put_autosuspend()
> > > > and pm_runtime_mark_last_busy().
> > >
> > > That sounds like it could cause a lot of churns.
> > >
> > > Why not add a new helper function that does the
> > > pm_runtime_put_autosuspend() and the pm_runtime_mark_last_busy()
> > > things? Then we can start moving users over to this new interface,
> > > rather than having this intermediate step?
> >
> > I think the API would be nicer if we used the shortest and simplest
> > function names for the most common use cases. Following
> > pm_runtime_put_autosuspend() with pm_runtime_mark_last_busy() is that
> > most common use case. That's why I like Sakari's approach of repurposing
> > pm_runtime_put_autosuspend(), and introducing
> > __pm_runtime_put_autosuspend() for the odd cases where
> > pm_runtime_mark_last_busy() shouldn't be called.
> 
> Okay, so the reason for this approach is because we couldn't find a
> short and descriptive name that could be used in favor of
> pm_runtime_put_autosuspend(). Let me throw some ideas at it and maybe
> you like it - or not. :-)

I like the idea at least :-)

> I don't know what options you guys discussed, but to me the entire
> "autosuspend"-suffix isn't really that necessary in my opinion. There
> are more ways than calling pm_runtime_put_autosuspend() that triggers
> us to use the RPM_AUTO flag for rpm_suspend(). For example, just
> calling pm_runtime_put() has the similar effect.

To be honest, I'm lost there. pm_runtime_put() calls
__pm_runtime_idle(RPM_GET_PUT | RPM_ASYNC), while
pm_runtime_put_autosuspend() calls __pm_runtime_suspend(RPM_GET_PUT |
RPM_ASYNC | RPM_AUTO).

> 
> Moreover, it's similar for pm_runtime_mark_last_busy(), it's called
> during rpm_resume() too, for example. So why bother about having
> "mark_last_busy" in the new name too.
> 
> That said, my suggestion is simply "pm_runtime_put_suspend".

Can we do even better, and make pm_runtime_put() to handle autosuspend
automatically when autosuspend is enabled ?

> If you don't like it, I will certainly not object to your current
> approach, even if I think it leads to unnecessary churns.
> 
> [...]
> 
> Kind regards
> Uffe

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
