Return-Path: <SRS0=gLK6=Q6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833E7C43381
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Feb 2019 00:34:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422FE205C9
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Feb 2019 00:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4V7AGLl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 422FE205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWymC2i62aDarcc/BNsaK6f8haUHGAX4YGAEdYiZq9Y=; b=s4V7AGLlnobu5F
	hdPnA//28CdsXA4r8X55+yOUGtgaUsUMhgEvaYCTUL+mKh6zuuujZBVVijUQYd1IxI6sNq2p3DFAU
	wXSzVln190uQhRkjCx+iGnuHLcHO5CrLb7ucozQSvf3DDsR0JvbYg5gPlQxHCaDTNBTZT6cm53H5i
	n+GaY+isMyLfR/H+phB1dzjZn/peZZif/Kz7zIyXtVVMopRVw1YIvsZSvChTgN2m5/TjSxKXFj7dG
	snlhCgKAJLw4OpM9w/W26T9EglUHSPYefr6MfdpynwKc+63okq1CFO1m0AKy/Ndw6LXGwiCeZ0BOj
	0mHSzR60vxtRg3XxskXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxLGv-0005nD-Gz; Sat, 23 Feb 2019 00:34:29 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxLGs-0005mj-C8
 for linux-mtd@lists.infradead.org; Sat, 23 Feb 2019 00:34:27 +0000
Received: by mail-oi1-f193.google.com with SMTP id q81so3164436oic.5
 for <linux-mtd@lists.infradead.org>; Fri, 22 Feb 2019 16:34:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jLiCHwnFhSopl57NMN+PdXudlXAWKQ9QplmasWpgk/k=;
 b=M3awOhFE3zO1NmefEVPeOoRmbe1NALn3x1Ue6vNtL3cXh/Hcgvt6UcqBz0XYy+ApcC
 nX06+zIGR4CqdLKSgnOwemem5Btxe+//kb4GzC406EvC2D2AJKMFyuAMWDWGfYDcna9m
 wkYcdmSr/uHYWMryBawiqjQ9nFsaQmlDxfs+yYOEq1Gos5iXJ1zweBA1cZMdnfLmlvLM
 lqTSTgbMfzW+TodQCyc6rbC9FJG2fUcyq9PbH70fnHKCh8RhGfDgA6+ZTOnFiq9c6Br7
 Jo6PZX3nxPUL1mjlzHfhGhaA0qtqUy/rRaR113P/DCbBoPv1EBje5WI9EploVfILpxAm
 HUaw==
X-Gm-Message-State: AHQUAubpEMwkbPryPslZiWf2fWzhKobuZlS0gemknWp2vQkl5aYCIOxC
 +GC2nCELnHQb+siMfCA02Q==
X-Google-Smtp-Source: AHgI3IZn8WSvQq4pUIBdNDpytgS/kOZ38ohCZzBxMDvFHNWf7NMolYG0rn42bt1J2/2czuHopxh1Nw==
X-Received: by 2002:aca:d493:: with SMTP id l141mr4251591oig.73.1550882064041; 
 Fri, 22 Feb 2019 16:34:24 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j21sm1198771otr.28.2019.02.22.16.34.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Feb 2019 16:34:23 -0800 (PST)
Date: Fri, 22 Feb 2019 18:34:22 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/3] mtd: partitions: Add AFS partitions DT bindings
Message-ID: <20190223003422.GA25691@bogus>
References: <20190123122910.19024-1-linus.walleij@linaro.org>
 <20190123122910.19024-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190123122910.19024-3-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_163426_414930_61AC2057 
X-CRM114-Status: GOOD (  14.16  )
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Jan 2019 13:29:09 +0100, Linus Walleij wrote:
> This adds device tree bindings for ARM Firmware Suite
> flash partitioning used in NOR flashes on ARM reference
> designs.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../mtd/partitions/arm,arm-firmware-suite.txt   | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/partitions/arm,arm-firmware-suite.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
