Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA7CC54EBE
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 08:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NOldJXy+ebZn2GwOnf5PycKNSSGrkN/GlUuCfs3moAs=; b=D+JK4qCn8x9Qmq
	07u87gjuQ2sA1rrMqeljwkwv/q45ejKgXzmf5NixcgHMO85VfWMv3MrsWGMLJWVAY3Rp9RYX/qiuS
	ZBlGjRrU2k1HsYhVuiXUYo09Sh5plr8CLenbJlLG46AY/qA6WJXWK/7DfihMdmw5pMfS4HMRv76av
	FWeVF/Sj/MfBmTysNTQiCZ4B4F8NIcwCJHWYd/qx4/lsJkli/SvtJoDeQHdp0JITRJXEE7/SvWMT2
	cc4OXfBf2BKgd6pe66A4owFgHDYYZRdan7fBbUofgkC5YNCxj+en89nNW2JdlQGpPGwOs2HjYOAz2
	R0BqaQ7ItcA0StYGQn5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEzv-0014sf-Ov; Fri, 13 Jan 2023 08:01:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEzp-0014pI-QO
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 08:01:08 +0000
Received: from pendragon.ideasonboard.com (85-76-5-15-nat.elisa-mobile.fi [85.76.5.15])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64BE84D4;
	Fri, 13 Jan 2023 09:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1673596863;
	bh=cznkdyRGPN+MgO59A5w6zSqYoDDyC4/o8zwGoYFpT/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X3sDjCHvncH8nOCQqph3lRWmzA+o7ZBGUupBaWsIqvlyia+dSiapzD4cCl/9rmiPJ
	 B4jr8NUwZemj7FrJVUMSVm/jr/syT5jAqqHnHz/VIkiEeZojpijB4wyQF8mSckYAYI
	 I5Uhh6NRqZJYChzv/4ySxybQmm9DouIDL6rp5RZU=
Date: Fri, 13 Jan 2023 10:01:02 +0200
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
Subject: Re: [PATCH 20/22] media: remove sh_vou
Message-ID: <Y8EPvllOwhODRUiP@pendragon.ideasonboard.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <20230113062339.1909087-21-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-21-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_000107_227141_8820F99E 
X-CRM114-Status: GOOD (  12.41  )
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

On Fri, Jan 13, 2023 at 07:23:37AM +0100, Christoph Hellwig wrote:
> Now that arch/sh is removed this driver is dead code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/media/platform/renesas/Kconfig  |    9 -
>  drivers/media/platform/renesas/Makefile |    1 -
>  drivers/media/platform/renesas/sh_vou.c | 1375 -----------------------

You can also emove include/media/drv-intf/sh_vou.sh. With that, and the
corresponding MAINTAINERS entry dropped,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  3 files changed, 1385 deletions(-)
>  delete mode 100644 drivers/media/platform/renesas/sh_vou.c

-- 
Regards,

Laurent Pinchart

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
