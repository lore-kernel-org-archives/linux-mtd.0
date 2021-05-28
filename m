Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77BEC47087
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 20:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80EC96108E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 20:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80EC96108E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UBQdZG2YcNwrQMPoWaWz5LPCsLrBVFuDQ++Db1gCSM=; b=Dgd6/aw2F3/7zX
	NXC0oxzJ4UE3lORPJPmshsrzRN/QoX0h5vWdHcw/uA2GE49ZiMwdMdxY4xYur316XF5QBqpgUsSoY
	J3NNtFfG3K59vv5p1d+J1eM5743CY0Xu6oSlemgmahUQgdgq3RWBQBBHmX+EnhtBxW/lmVtnjrAeK
	uTcyxcSlCN8lrojxz3i0U856yTtvsWMvRNfrZPFhTZYAy1M0BN/PcDomcMiWOTVHnrJ0gHVmn7q25
	4Xm06+xZKhIADt3HZHIO3pWIDVy4bLuSDPMK4mVwQNXVt+3S6ombywtBIpxfdrfKcb9XuFSTVyR5z
	HsnrsK4u2e6Qix/49HVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmihM-000mzI-VV; Fri, 28 May 2021 20:03:13 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmihK-000mxq-Dw; Fri, 28 May 2021 20:03:12 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 n3-20020a9d74030000b029035e65d0a0b8so4571031otk.9; 
 Fri, 28 May 2021 13:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Mv7WbTffrkJPZqEYhzypwYnrGkf93O/laGF/Wa2pYHA=;
 b=YG0y1h4ZeOILpAKAuhhfsge26ZA5do5oyN/u6EvYzZ9ABz21iz0Ket8vI3Bimjdzyc
 o5P+JuX6dCPfEDmJ7FoUwGbJkOxdLih6AlncNO5FEHzzBkItlgbnJkGoD82Jjgz1tyfb
 oTQql9VrFoiJ/giGN/oiYm0SPpmrmOsiSOyzYMmBkv0KudKs1OQ0G2kuyz9bQQD1kUVr
 /1eCTpKj9qUnPeMGE5yHruC+1PRtfS+sfeUQo65QI4u4tzedh9Ne6DRFUUIvQX/625Z2
 6x8nk/JjEDQZf00tw3leFUJDlfUIfuENuX4kL9wLU6zAiyoCUfYzhI472vXIaMwFYO+Q
 Fcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mv7WbTffrkJPZqEYhzypwYnrGkf93O/laGF/Wa2pYHA=;
 b=T34yNS1z/kfrm5D+dfNKn+Y4I2cZZCFS+9N6ppPwZcYxtG4mYEbOHrAUKpHDneAjZk
 1wMJp46f/ipEzBAtZFBLw7hYF4JXbx1IW8qy5tGPWrZE+ddbsyGaUU5kH81UueRZ2ITO
 963Qgs2S3crHjfJxK4mJC/PztF9WK4lRpP9uuc881xyYHevNFU2+jZqtR+fmXRDypt8d
 RoBAaylm7w+8bIG/wcOodqPGtg0tiXAJwwZfaosLj0mcyNtut12KdEoy4vwSb2yRV1rR
 ilrpRwvp/zNCaapqkAAlO5IwUN8H7yX7UoYbdxT+Y2NyOspbZBN5RAbUF1/9p5MvHzXd
 MzFw==
X-Gm-Message-State: AOAM530BS9sjspZnVr6YLW4W5KwjAoiA/3O6ZOThf+o/UAQAc0V/evh2
 e+T5OyBFxhUiG/oeJIwmycQ=
X-Google-Smtp-Source: ABdhPJxhE22NbyhkGq58gY4Z4/lB8Hz3VJ6dyWBeqE2B2PRWvgL5HFhc9m2Ce3x4To+8kwcVkIckFQ==
X-Received: by 2002:a05:6830:803:: with SMTP id
 r3mr8415670ots.237.1622232189479; 
 Fri, 28 May 2021 13:03:09 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id c19sm1314008oiw.7.2021.05.28.13.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 13:03:08 -0700 (PDT)
Date: Fri, 28 May 2021 15:03:06 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, linux-rockchip@lists.infradead.org,
 andy.yan@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, tudor.ambarus@microchip.com,
 p.yadav@ti.com, heiko@sntech.de, robh+dt@kernel.org,
 vigneshr@ti.com, richard@nod.at, miquel.raynal@bootlin.com,
 Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 0/4] Add Rockchip SFC(serial flash controller) support
Message-ID: <20210528200306.GB1598@wintermute.localdomain>
References: <20210528170020.26219-1-macroalpha82@gmail.com>
 <6d849f2fd9c6ca3389fa98f4ae8e8069@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d849f2fd9c6ca3389fa98f4ae8e8069@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_130310_518977_5DB3177A 
X-CRM114-Status: GOOD (  27.79  )
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

On Fri, May 28, 2021 at 08:49:53PM +0200, Michael Walle wrote:
> Am 2021-05-28 19:00, schrieb Chris Morgan:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > I'm trying to revive an abandoned patch series for the Rockchip serial
> > flash controller (SFC) found on the Rockchip PX30 SOC, as well as other
> > SOCs by Rockchip. I'm picking this up from version 8 of the patch
> > series located from here:
> > 
> > http://patchwork.ozlabs.org/project/linux-mtd/cover/1518091958-3672-1-git-send-email-andy.yan@rock-chips.com/
> > 
> > Changes made in v2:
> >  - Reimplemented driver using spi-mem subsystem.
> 
> Nice!
> 
> Oh and I forgot, the dt-bindings patch should go first.
> 

Understood, will do that in v3.

> -michael
> 
> >  - Removed power management code as I couldn't get it working properly.
> >  - Added device tree bindings for Odroid Go Advance.
> > 
> > Changes made in this new series versus the v8 of the old series:
> >  - Added function to read spi-rx-bus-width from device tree, in the
> >    event that the SPI chip supports 4x mode but only has 2 pins
> >    wired (such as the Odroid Go Advance).
> >  - Changed device tree documentation from txt to yaml format.
> >  - Made "reset" message a dev_dbg from a dev_info.
> >  - Changed read and write fifo functions to remove redundant checks.
> >  - Changed the write and read from relaxed to non-relaxed when
> >    starting the DMA transfer or reading the DMA IRQ.
> >  - Changed from dma_coerce_mask_and_coherent to just
> >    dma_set_mask_and_coherent.
> >  - Changed name of get_if_type to rockchip_sfc_get_if_type.
> > 
> > Chris Morgan (4):
> >   spi: rockchip-sfc: add rockchip serial flash controller driver
> >   spi: rockchip-sfc: Bindings for Rockchip serial flash controller
> >   arm64: dts: rockchip: Add SFC to PX30
> >   arm64: dts: rockchip: Enable SFC for Odroid Go Advance
> > 
> >  .../spi/rockchip,serialflash-controller.yaml  | 107 +++
> >  arch/arm64/boot/dts/rockchip/px30.dtsi        |  38 +
> >  .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  16 +
> >  drivers/spi/Kconfig                           |   9 +
> >  drivers/spi/Makefile                          |   1 +
> >  drivers/spi/spi-rockchip-sfc.c                | 856 ++++++++++++++++++
> >  6 files changed, 1027 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/spi/rockchip,serialflash-controller.yaml
> >  create mode 100644 drivers/spi/spi-rockchip-sfc.c
> 
> -- 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
