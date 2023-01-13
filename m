Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03590C61DB3
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZBAKu9coJ3/g2TTkNfv54evH2NRabcIHCcy6SlRzhc=; b=PRl5oL96tlRZke
	wK6xRCZQHXRipV/NOVoEf7Af66pbrVk7DKWjH67gL8/Mde7cnenefLW8sjfA/0Mtdko6ugU6VPHWg
	z5X6mdJwR7GNlLxZJ4gsXrQJxN7DV+bjZAtUUqEc2yknoPhm4oUTt9d9w12vKVrTTxImmFb96cID8
	T94mVUpmZ/c7PNEhxjhyQmWaqxYqCN65b9/WKgaz83SNGNrppSjt1irHkwFnscSPrNXHOnwx9lHdX
	UWPRD2m441wdIbbCydhtTTUPcAda4DBiS53p0U+m/plbCyfwman/UwF/tS8c/B/xqybTHu3ZR77ch
	QsvR6BNDBBdEeU/yMVeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEmA-0011on-El; Fri, 13 Jan 2023 07:46:58 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEm7-0011nZ-B7
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 07:46:56 +0000
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi [85.76.5.15])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CD9D4D4;
	Fri, 13 Jan 2023 08:46:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1673596008;
	bh=wltYQdcEAMz3UcFF0QVHXXUKY2mcn2dIbJ+Vsno/G9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPk9GDnJb8yIAG/qZw7j85ZzRhjxe0eUQN+NAsK+9uT/7opY3bx+SaNPEdtJt/mLy
	 7ehj3skE2f1g4W6IvOyNfZJFjCDi/ZIYJt389ghohYbhf6hpvDv0vqO0a1KKztGEE2
	 l1/4JdyjqER4jRCS7n87hgkuZ+xUKmlP2i0l0lNc=
Date: Fri, 13 Jan 2023 09:46:47 +0200
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
Message-ID: <Y8EMZ0GI5rtor9xr@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_234655_572721_2B844AD2 
X-CRM114-Status: GOOD (  14.27  )
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

Hi Christoph,

Thank you for the patch.

On Fri, Jan 13, 2023 at 07:23:18AM +0100, Christoph Hellwig wrote:
> This driver depends on ARM && ARCH_SHMOBILE, but ARCH_SHMOBILE can only be
> set for each/sh, making the driver dead code except for the COMPILE_TEST
> case.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

No objection from me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/Kconfig                       |   2 -
>  drivers/gpu/drm/Makefile                      |   1 -
>  drivers/gpu/drm/shmobile/Kconfig              |  12 -
>  drivers/gpu/drm/shmobile/Makefile             |   8 -
>  .../gpu/drm/shmobile/shmob_drm_backlight.c    |  82 ---
>  .../gpu/drm/shmobile/shmob_drm_backlight.h    |  19 -
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c     | 683 ------------------
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.h     |  55 --
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c      | 303 --------
>  drivers/gpu/drm/shmobile/shmob_drm_drv.h      |  42 --
>  drivers/gpu/drm/shmobile/shmob_drm_kms.c      | 150 ----
>  drivers/gpu/drm/shmobile/shmob_drm_kms.h      |  29 -
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c    | 261 -------
>  drivers/gpu/drm/shmobile/shmob_drm_plane.h    |  19 -
>  drivers/gpu/drm/shmobile/shmob_drm_regs.h     | 310 --------
>  15 files changed, 1976 deletions(-)
>  delete mode 100644 drivers/gpu/drm/shmobile/Kconfig
>  delete mode 100644 drivers/gpu/drm/shmobile/Makefile
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_backlight.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_crtc.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_drv.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_kms.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.c
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_plane.h
>  delete mode 100644 drivers/gpu/drm/shmobile/shmob_drm_regs.h

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
