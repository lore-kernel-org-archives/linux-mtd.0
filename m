Return-Path: <SRS0=wFkH=YL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F19CA9EA0
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 18:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9AE21835
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2019 18:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PkEF73F8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDe9kDeK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA9AE21835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8aMI/muINDgsOBnIH+CR4IQzUiqo+yDGJXlbM8CsT7o=; b=PkEF73F8IJCEKy
	CN4l7hOyQ4D5LXIiiddkNa01hWwWRP/zZXMPYyOF2gkhsZuM0qWpRTvNE8Qv2X3r/b5zhMs7ByPv3
	A4I7f2yJi5+IMGPjOCXz+ghYzgHvTYbonOHQVXcsk/7wz1MCjIE5JXd3O8ehsqdRcBO6/1TF40nw1
	9Qx6hxEx/U+C/w1USr/jpNv34coNnjSpiK9RcfZPLYhGqxbHFlKJ6+ChPTWpZLvCK498rusu395mY
	0Itl8kkmCP83e1X6CcqdKQWa/boOCajk/WWXz/vF6yYV3TJ33ulSADG7ovbm9QvrvxfsomrEFybYp
	ll1PUaG16LmjGqHLTAAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLX8f-0002FT-PD; Fri, 18 Oct 2019 18:38:13 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLX8U-00025K-NI; Fri, 18 Oct 2019 18:38:04 +0000
Received: by mail-pg1-x541.google.com with SMTP id e10so3811065pgd.11;
 Fri, 18 Oct 2019 11:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IFDsqOMwc2ojaPSLkT8+wMYUXewN1acLP2lqR1XP15Q=;
 b=HDe9kDeKBahe9NjGm/ugr3PrO4D0Lw085ywSNSA095A6Y7b0bdnZjmqC82XIISIIdt
 HL1478hYPAIvWzZLWe743K+0Z4UKFrxK0/hQ9QagRbJbspKW/xQebobzv2mUFy3hRLKH
 //wSlMwz56Seed2I+e/Y5zi3HKTITkVYbYNZcR/r9Ty9L4OUJxGZQa8n7sooJF+d06MV
 U8c1Xqzj80SWkW1+fMzKDsGOIVt27mRFx9PdNgqZxq/nnXPUUxC1LvIFwI/iWySD+Mw9
 Y/fW+KH35SuT8tMvpzVKHsaJfOpxO5whSf8Fu101J4r54ddKqPMDRDSv0HSvbuy5Taxu
 2ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IFDsqOMwc2ojaPSLkT8+wMYUXewN1acLP2lqR1XP15Q=;
 b=XEMpCMweC+sUDepcIjqfyT+k3apa5IUg7HjfG3DGrJawl2kqaoqx8rC4rHUvZtp2/h
 mXoovesg0i1wKkSfAkcNNe+qENOeidKbp0AS70vYhhlfNZCH2OkP6+mvrc4kHEeYQIbq
 sdiId+A0qvn1HM6v/XfxsckAM4rOBJ49kN3iVSwZhwmRI8NA9fnhCdFDoDxGWLIyeGkd
 7ir+ffchxiowAjzB9LvbL8+ZOQFAKrdC6pieTAVqpghpaUSO8pLWJ365fgApUAgMPeGd
 hw+YU6e8Yykav+7BZYv2TAiwMWShZifcZdskHRvukKaqkN+hGxVvOsLVg7DKBlXqNAwG
 1uLA==
X-Gm-Message-State: APjAAAWOlwYIInAwGznsSC1EciknekzNMX7dVMCnH/w0u6//LrqxbSYx
 qCSZrasiUi3synJdV2bewP0=
X-Google-Smtp-Source: APXvYqxI3fG8J2/DXNrMqbp5He+LcRaizowKU8zXJc/NBeHP6e+1CmGad85VCcLrdR+rSgjhba5HPg==
X-Received: by 2002:a63:5762:: with SMTP id h34mr2723268pgm.235.1571423881363; 
 Fri, 18 Oct 2019 11:38:01 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id 69sm6908001pgh.47.2019.10.18.11.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 11:38:00 -0700 (PDT)
Date: Fri, 18 Oct 2019 11:37:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/46] ARM: pxa: split up mach/hardware.h
Message-ID: <20191018183757.GL35946@dtor-ws>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_113802_759807_8D9220EA 
X-CRM114-Status: GOOD (  15.00  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Oct 18, 2019 at 05:41:20PM +0200, Arnd Bergmann wrote:
> The mach/hardware.h is included in lots of places, and it provides
> three different things on pxa:
> 
> - the cpu_is_pxa* macros
> - an indirect inclusion of mach/addr-map.h
> - the __REG() and io_pv2() helper macros
> 
> Split it up into separate <linux/soc/pxa/cpu.h> and mach/pxa-regs.h
> headers, then change all the files that use mach/hardware.h to
> include the exact set of those three headers that they actually
> need, allowing for further more targeted cleanup.
> 
> linux/soc/pxa/cpu.h can remain permanently exported and is now in
> a global location along with similar headers. pxa-regs.h and
> addr-map.h are only used in a very small number of drivers now
> and can be moved to arch/arm/mach-pxa/ directly when those drivers
> are to pass the necessary data as resources.
> 
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-leds@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-fbdev@vger.kernel.org
> Cc: linux-watchdog@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

For input bits:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
