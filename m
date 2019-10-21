Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A84CA9EB5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 09:59:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E5C02070B
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 09:59:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AczmyykS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A+lOYOm+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E5C02070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Roo8kPBnt+fotKqgicTF/Nzr4KLvcVIramLJ6/qPZF8=; b=AczmyykSbvwnJl
	HN/gRPVoG90Y55ZQS6lAy+UThmi9zKtvZA37TI81Wzd34GdGb6sB3PfdBjV/kpWpOrKfTEhpJkZFV
	jrA5IDlR+gRfjJDN+mADawQCrac9RCld2wYocSy7QVZmYFk8TwQnufIKsZcgs0NeS+fggUJlBXfNF
	OYIV9UHFjNY5BcBAiZorEHGSlDQ7gn0S5m016oET1OAp78ckuVZ3/L8JN7exEHhnlXC7bGkxc5jii
	kPMIVm/7X7FNTuvVhpFhgQJE4RfbdcmpPcC7Cjry2S0cQahaQvTnf56IOtvB+RmTltY+REDyP/PwY
	rvFTtEUHxR76NEm3PH4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMUTF-0007Rk-20; Mon, 21 Oct 2019 09:59:25 +0000
Received: from mail-ua1-x941.google.com ([2607:f8b0:4864:20::941])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMUT5-0007HP-8S
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 09:59:17 +0000
Received: by mail-ua1-x941.google.com with SMTP id r25so3619584uam.3
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2019 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pdHS5iTjhH216W3OQmstavgIx2TJJX3EShTQ+j4ScZ4=;
 b=A+lOYOm+Xr9/QoAPbGmRqhJkdtF0Lqe8WUL4ACj5RU0nNNF8swHXxJ1znB4G8Os5Ny
 GFNaGZ/ejdu+ewHfdHOPCmruyouYE59ddCzoE/xVdTrwx+9jDUvHxy7BDp9wIDVdNxfI
 /6ZVUUwI4YOYuKQGiiojp4zvyT6amzLfph0exWZKznf04jiM3DxdRAExfvqYeyeqcqdD
 +jHYiIvYbVFtFjJ+6C1ZbvLjFHV0Oba7w+6LuMl93+fW5xmlBomtFj1iieYNFONPPx+n
 GuW5fPipC9llariB4WKqkEzYSA5LiCXyADKzbRoQItF2MbOokfHyNH6+nW64EQTg2+/Q
 SDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pdHS5iTjhH216W3OQmstavgIx2TJJX3EShTQ+j4ScZ4=;
 b=tqpEYiYwjvCN0k45bsQj++SwWIYt0N/urBidgS79/FKUbVvMz4+P6b3aFVfg+CS1vX
 bAmPVgXTt+u1DSid84x/KqRxKk3sX6n1QZibFTbpe+dc9ni2QtAOzFbxR3aH2l1+uEmq
 2gIoCR0x1ASQHi6lGFtwBjFif2qoxUYQszWZ0PIXdOurKwRv3d3VD+S2OBI4gtU5z1uq
 toLVSjNlAfg0kC7ESmekY8NpRUN31SrrxIsDWtngOGFyAgKWCBH5JKuS4A1a02bthAH6
 67hrigN20Xp89nSw8rZJI2ppX4jC7aYYfQajrm0aFeospP1dJK/S82fMlqzNm9FGZtc/
 cosQ==
X-Gm-Message-State: APjAAAVYibzqqgqqeKI1uDXrIbS9ukfw5gKk4X1qDoMrkAUWPdqxBmsX
 eQUY9j2crHXQ+bd8idXptmc2sE++OjIwtKiiuZC08A==
X-Google-Smtp-Source: APXvYqyX35z25w9uC+afBeqWkMX+7aKojU6riMDxod1s9TtFAaRTKL1Dky4gIujxC0cprlM32BbtJAeRhAkOs/Lhxl0=
X-Received: by 2002:ab0:5a97:: with SMTP id w23mr2075364uae.129.1571651953620; 
 Mon, 21 Oct 2019 02:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-5-arnd@arndb.de>
In-Reply-To: <20191018154201.1276638-5-arnd@arndb.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 21 Oct 2019 11:58:37 +0200
Message-ID: <CAPDyKFqHoPOPAA_0WpxQUjBTXJ-5BfMbcNXhFNr7rv3RObsgow@mail.gmail.com>
Subject: Re: [PATCH 05/46] ARM: pxa: split up mach/hardware.h
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_025915_329495_0B8F2977 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-mtd@lists.infradead.org,
 Pavel Machek <pavel@ucw.cz>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Oct 2019 at 17:43, Arnd Bergmann <arnd@arndb.de> wrote:
>
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

[...]

For the mmc part:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
