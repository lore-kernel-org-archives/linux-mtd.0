Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC35CA9EA0
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 02:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A2E21928
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 02:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pTOZhcPm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBXUvt04"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A2E21928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1i+xe+dv19XPQItEl2TYylTwHXUTeg+Qx/ZjjSXJaBg=; b=pTOZhcPmomNPtZ
	wjGXv1IbdVotOitHsl167sJXrPiImp0vs/GDDet2blg4WsCOIsnUXS5e+J4wkbNTxBjWU6a6wfySd
	mrf30Bn5oWRDegsXX/uxfvBcv2jVo/49xWU2KpKsNNs2y/LBWLNHADyRcHuvI3t/oj5DXuW1dsPp1
	E3b9O3Drl7ta3lsuAKGrSuYa+op/Ndpo50l3BkGw7Sq7dvJDyw77XlaRGBcIqqwlBYJhVEliNpL5O
	QsQULlMsZwHg2SmnScoAuwr6dCQT20HtjqF3kGckfhekGBSwn776yper6e0/UdERN1CwwbX0Ebqi0
	ML+klYG1clrXfUnSryjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMNQP-0006LA-29; Mon, 21 Oct 2019 02:28:01 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMNQ4-00060N-8T
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 02:27:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id x127so7416038pfb.7
 for <linux-mtd@lists.infradead.org>; Sun, 20 Oct 2019 19:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
 b=HBXUvt040GMIEwLCNj0cv5hSZlRkL/uSj5D7wLWdq/dK4otL0nVEbSqZR/yA3O2Og9
 AGWR8nz33JcyPwt0cVzYqNq50Faf18+z3imXfVGexdoVV7YqaTAx1/VUr9tWFd1T5Cbb
 Tf3GaNcBURk5SkpU/x/jomYDDMhIfJxW71YTg5rvruJX3ueO8ezhfGPDpZ8h4aBGcFO7
 kumSOPEltTLr+L4+0n9vUg4CWg75RR45G4UAxyVxqOpn3JU7cI+2DI4kkwOVZWPX+nFt
 EIZgqQsA7otGwkMKpKWeRDE8Vka9aexA24uKnw1PmWmT0weSSgJHTEGbfcCA0RE8KN8b
 2ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+XgAS3p3ETrEIu1jjk49WnshOluu9ziyQFPp12n3bCU=;
 b=Pkq074OsODsipGZR7h7EnHEYBqCPqzWfdVeAQbWwqIYNsUNPyfxiyFXE6LclNT721V
 DdoFZ/gmYLeqXlYvlHaQORjTQsckPEsUO27extGO3iiBM5/sgdQIDanMVIljHs5V/cyb
 4kBz8yxHlV7OcGna96TV3XTmWtst/6AoR6b8vMAyUkEk82wIzbuf9fmqQ57Zo98Nbp5S
 1Jk4uFuctXw/jjtxXjJ0X3E/o9YF3+RSdbElgf7a7svktfpPfClZP+qRI4+vUUEPWUUi
 aYA8uwn5copr3JvGJGL4kuGCotBYSCpV8N3S2jaWiTQJjOnc4KoWpZyElVBHL7+hj1oS
 vRIQ==
X-Gm-Message-State: APjAAAX8fFr/GQ0hTIWJ0TGjwJVrQqQ2BIMHSfurAUp9qllFiUQ95Pio
 Ww1+zq0otZWfcwC1UIeNJFeP5Q==
X-Google-Smtp-Source: APXvYqwgXGc8U+6JV2azREgJVpwvucEYJlBr8fKvxMlwaeCP9tIcS23wt/WioWPY0VSEsf3wqmlSTg==
X-Received: by 2002:a63:4e52:: with SMTP id o18mr11185515pgl.153.1571624859157; 
 Sun, 20 Oct 2019 19:27:39 -0700 (PDT)
Received: from localhost ([122.172.151.112])
 by smtp.gmail.com with ESMTPSA id f17sm20835265pgd.8.2019.10.20.19.27.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 20 Oct 2019 19:27:38 -0700 (PDT)
Date: Mon, 21 Oct 2019 07:57:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 05/46] ARM: pxa: split up mach/hardware.h
Message-ID: <20191021022736.yu6unspozqf5634p@vireshk-i7>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-5-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_192740_747434_9063C15D 
X-CRM114-Status: GOOD (  16.41  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
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
 dri-devel@lists.freedesktop.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 18-10-19, 17:41, Arnd Bergmann wrote:
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
> ---
>  drivers/cpufreq/pxa2xx-cpufreq.c              |  1 +
>  drivers/cpufreq/pxa3xx-cpufreq.c              |  1 +

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
