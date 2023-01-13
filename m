Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCB0C678DE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0lwXLo5yDtzBNmq5EfkFrgjpE38BUXhfW9K7hXlCWc=; b=jZCge+RdMtuE2e
	nwmTyBNe5F+fcwJteJXHMFmt1Tb5FiixEKHb7dXNIVwOkdHh+6h7BqAloAGH3OdDharDKJUJZjDAK
	kIJoGf5Yy0/v8KX1tFnZMz2ry3++3Ms14yTyBYUCpeFjopHxP2b597hUXjRXSVwDxPSYJnPsHoNwP
	Zpq19tL8VDPQaPO8tdujN1zqYiMWgXxzCJlPaWf4VtbrA5JcSpSeYgqTsvzTLIURGVByIXottrjoI
	sE8x0cbEeTwSKUEY0O29ggStb96WXgp/i8MeZCyX6p4P6hhircwrzuJKY1U2fAoBIgMBaRVlnKkRt
	Rx45oeJQoJk3+AbvxZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEu6-0012un-O6; Fri, 13 Jan 2023 07:55:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEu3-0012tt-FQ
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 07:55:09 +0000
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi [85.76.5.15])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2DBD14D4;
	Fri, 13 Jan 2023 08:55:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1673596505;
	bh=vRdyiqF+PpWa7HcHfhCtuslDgXVXt8V4AOIdljF1BQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MplxUnHw8ErIF7LyxmuN/+OcdYTL+KHEXJob0ft2ezOhqAVYE3m8P/x5TGmDxunAX
	 hNGSu2Rfv8w4h3WiaTzkK6SyygY+7vdn0jtGh9flpoxnn8uBnWmrnoDsTJWb5wUuXu
	 ajDTUWUaMexyxBvmwaL7WwO3/s2maPmjOdQvt9qo=
Date: Fri, 13 Jan 2023 09:55:04 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: Re: [PATCH 01/22] gpu/drm: remove the shmobile drm driver
Message-ID: <Y8EOWGVmwEElKGE4@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
 <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_235507_724532_5D2F1955 
X-CRM114-Status: GOOD (  22.91  )
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

On Fri, Jan 13, 2023 at 09:46:49AM +0200, Laurent Pinchart wrote:
> Hi Christoph,
> 
> Thank you for the patch.
> 
> On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> > This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> > set for each/sh, making the driver dead code except for the COMPILE_TEST
> > case.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> No objection from me.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

To expand a little bit on this, ARCH_SHMOBILE used to be set for the
ARM-based shmobile SoCs too, until

commit 08e735233ea29b17bfec8e4cb302e799d9f920b8
Author: Geert Uytterhoeven <geert+renesas@glider.be>
Date:   Tue Aug 28 17:10:10 2018 +0200

    ARM: shmobile: Remove the ARCH_SHMOBILE Kconfig symbol

    All drivers for Renesas ARM SoCs have gained proper ARCH_RENESAS
    platform dependencies.  Hence finish the conversion from ARCH_SHMOBILE
    to ARCH_RENESAS for Renesas 32-bit ARM SoCs, as started by commit
    9b5ba0df4ea4f940 ("ARM: shmobile: Introduce ARCH_RENESAS").

    Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
    Acked-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

merged in v4.20. The DRM shmobile driver's Kconfig entry wasn't updated,
making it dead code indeed.

I haven't tested this driver in ages, hence my lack of objection, but
someone may want to keep it for the pre-R-Car ARM SoCs.

Also, I just noticed that you forgot to update the MAINTAINERS file in
this patch to drop the drivers/gpu/drm/shmobile/ entry.

> > ---
> >  drivers/gpu/drm/Kconfig                       |   2 -
> >  drivers/gpu/drm/Makefile                      |   1 -
> >  drivers/gpu/drm/shmobile/Kconfig              |  12 -
> >  drivers/gpu/drm/shmobile/Makefile             |   8 -
> >  .../gpu/drm/shmobile/shmob_drm_backlight.c    |  82 ---
> >  .../gpu/drm/shmobile/shmob_drm_backlight.h    |  19 -
> >  drivers/gpu/drm/shmobile/shmob_drm_crtc.c     | 683 ------------------
> >  drivers/gpu/drm/shmobile/shmob_drm_crtc.h     |  55 --
> >  drivers/gpu/drm/shmobile/shmob_drm_drv.c      | 303 --------
> >  drivers/gpu/drm/shmobile/shmob_drm_drv.h      |  42 --
> >  drivers/gpu/drm/shmobile/shmob_drm_kms.c      | 150 ----
> >  drivers/gpu/drm/shmobile/shmob_drm_kms.h      |  29 -
> >  drivers/gpu/drm/shmobile/shmob_drm_plane.c    | 261 -------
> >  drivers/gpu/drm/shmobile/shmob_drm_plane.h    |  19 -
> >  drivers/gpu/drm/shmobile/shmob_drm_regs.h     | 310 --------
> >  15 files changed, 1976 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/shmobile/Kconfig
> >  delete mode 100644 drivers/gpu/drm/shmobile/Makefile
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.c
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.h
> >  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_regs.h

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
