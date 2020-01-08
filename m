Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486B9C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16AF62053B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dBc0QBz4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16AF62053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzyLUm9xdJ2UWfC8O/eW3OosWE+PeMbIkCdKmkaM/o0=; b=dBc0QBz4qghIsk
	6YniUKXkxrZqF0C+znFexJoelaHOrxZm8v3bDIeK3StQQxHAuMkCvbo3sW9JlHTicZxi3JfgWwXrK
	8mxfA6mUDXGStYSgYiOaZlAqY/wIn/ChEql53UX9Dt3i3dzU6XjVgmRraWyk/0dypDwhRSprHyaEN
	lpVvyLkKLTKmcdFCYyEXUnFUf41DiAn8moD9S9QFAfytNQW+IGqg07PIKy2dGi8Hso4EOWxdQRPA7
	UFSIe+lEMnBmYGVzbayQdBOHTDNoZGRLYlnpBXSx/RZhSHyTrvpfwKSPriNeiAr7MXvkNcE/iNC3y
	giAohrxS5ayalkWWeGoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipHmQ-0003qW-LD; Wed, 08 Jan 2020 20:18:14 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipHmH-0003hs-5u
 for linux-mtd@lists.infradead.org; Wed, 08 Jan 2020 20:18:06 +0000
Received: by mail-ot1-f68.google.com with SMTP id d7so4866972otf.5
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jan 2020 12:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UM9Yhyyn+nTPYkkQGog0oC/YJwVnBTJCjtlyMYqJ2Ow=;
 b=aXqTMk9dPzNQA8udSvnuvWGNjDS7X6zAV8ZTQmK0jqyJJQgFQmV1mJgVJC+08Hjgsf
 u4GuSPy7KCi+0bq2r8IWYi2WGc4CCf3GJ3PqS7eyAp8fHUPliKj97XkMUD2AiGchWEe+
 jtZO7OLZzDZiuAd7rQIGd3kTA0Q7u1WoDcPz6vBp9AKj0Nd5SRr2GbJBbIQFUktKzNp8
 DAn4RTREWBJ5lnP3ynz6W7Z74zsCsWmfjCVurv0A+nQTuGciunFhnd0CpUYRNQI8P7WQ
 D1fnk5+rZGf+1eWzd0NxB4wY8as5Jijfu0FL7+mx2bfWqSC5kjogWzqy3rBLUlMOBnTw
 wA6A==
X-Gm-Message-State: APjAAAWDnuHcAsyxZhrNUES/vo9LF45CbI+NhNQOFoy6J/gD38q85UGh
 h/x7cnira6Vvw1QdEJalUR5SmoI=
X-Google-Smtp-Source: APXvYqwdkNDtJ3x4hV3kONtt2h1kuD0z8lLmH8//AJi9KI3dZUJFqpvHpK5ABPQ3WIZ3EBB4NtlvkQ==
X-Received: by 2002:a9d:7342:: with SMTP id l2mr5548441otk.98.1578514681231;
 Wed, 08 Jan 2020 12:18:01 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e13sm1442998oie.0.2020.01.08.12.18.00
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 12:18:00 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2208fa
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 14:17:59 -0600
Date: Wed, 8 Jan 2020 14:17:59 -0600
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] treewide: remove redundent IS_ERR() before error code
 check
Message-ID: <20200108201759.GA28519@bogus>
References: <20200106045833.1725-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200106045833.1725-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_121805_217098_2352ABE8 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Julia Lawall <julia.lawall@lip6.fr>, linux-acpi@vger.kernel.org,
 netdev@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon,  6 Jan 2020 13:58:33 +0900, Masahiro Yamada wrote:
> 'PTR_ERR(p) == -E*' is a stronger condition than IS_ERR(p).
> Hence, IS_ERR(p) is unneeded.
> 
> The semantic patch that generates this commit is as follows:
> 
> // <smpl>
> @@
> expression ptr;
> constant error_code;
> @@
> -IS_ERR(ptr) && (PTR_ERR(ptr) == - error_code)
> +PTR_ERR(ptr) == - error_code
> // </smpl>
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  crypto/af_alg.c                      | 2 +-
>  drivers/acpi/scan.c                  | 2 +-
>  drivers/char/hw_random/bcm2835-rng.c | 2 +-
>  drivers/char/hw_random/omap-rng.c    | 4 ++--
>  drivers/clk/clk.c                    | 2 +-
>  drivers/dma/mv_xor_v2.c              | 2 +-
>  drivers/gpio/gpiolib-devres.c        | 2 +-
>  drivers/gpio/gpiolib-of.c            | 8 ++++----
>  drivers/gpio/gpiolib.c               | 2 +-
>  drivers/i2c/busses/i2c-mv64xxx.c     | 5 ++---
>  drivers/i2c/busses/i2c-synquacer.c   | 2 +-
>  drivers/mtd/ubi/build.c              | 2 +-
>  drivers/of/device.c                  | 2 +-
>  drivers/pci/controller/pci-tegra.c   | 2 +-
>  drivers/phy/phy-core.c               | 4 ++--
>  drivers/spi/spi-orion.c              | 3 +--
>  drivers/video/fbdev/imxfb.c          | 2 +-
>  fs/ext4/super.c                      | 2 +-
>  fs/f2fs/node.c                       | 2 +-
>  fs/ocfs2/suballoc.c                  | 2 +-
>  fs/sysfs/group.c                     | 2 +-
>  net/core/dev.c                       | 2 +-
>  net/core/filter.c                    | 2 +-
>  net/xfrm/xfrm_policy.c               | 2 +-
>  sound/soc/codecs/ak4104.c            | 3 +--
>  sound/soc/codecs/cs4270.c            | 3 +--
>  sound/soc/codecs/tlv320aic32x4.c     | 6 ++----
>  sound/soc/sunxi/sun4i-spdif.c        | 2 +-
>  28 files changed, 35 insertions(+), 41 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
