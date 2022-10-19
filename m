Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E71C43217
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 21:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HyQs15SdTp4XTwqqX+B1tirAEeR/rzo33LgIfMfNMM8=; b=R5e/L5w9h6s5pG
	cDUMP1jNigRjX/wFNaJmqOQx1SBjPA1lBBvJPGFa+zWdJQi3iUCv3coLBO25vtm5hGZRqlMUSOkap
	8BzrX902xP69K/F7O2iLLvAzJPvTWKjVuETURbUBaVSGBb30uVcnRx5DV13s25r5rWQcsUAcj+cy7
	ybTJh3/6xQSIMUrK0/bKEJNmY+N2GGC9z+2XIqD29y+WAgrZtgXPwZbCevcGRL7YqRdOEaSBPSO4n
	X9zwng8aYjdA92ze9DQBzwSlOTPiTmB+XGfL0HBTiU8W5BasNa/FT8tgYyzxZ9CJ77rRrDftldIls
	dhOadNMTghRFnJZA8JcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olGNp-005DTC-Vz; Wed, 19 Oct 2022 21:13:50 +0000
Received: from smtp-26.smtpout.orange.fr ([80.12.242.26] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olGNk-005DQr-4q
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 21:13:46 +0000
Received: from sopl295.home ([109.220.248.156])
	by smtp.orange.fr with ESMTPA
	id lGNMo1N0Kg7y2lGNMocFLS; Wed, 19 Oct 2022 23:13:31 +0200
X-ME-Helo: sopl295.home
X-ME-Auth: amFyem1pay5yb2JlcnRAb3JhbmdlLmZy
X-ME-Date: Wed, 19 Oct 2022 23:13:31 +0200
X-ME-IP: 109.220.248.156
From: Robert Jarzmik <jarzmik.robert@orange.fr>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,  Daniel Mack <daniel@zonque.org>,
  Haojian Zhuang <haojian.zhuang@gmail.com>,  linux-kernel@vger.kernel.org,
  Arnd Bergmann <arnd@arndb.de>,  stern@rowland.harvard.edu,
  alexandre.belloni@bootlin.com,  brgl@bgdev.pl,
  damien.lemoal@opensource.wdc.com,  dmitry.torokhov@gmail.com,
  linux@dominikbrodowski.net,  balbi@kernel.org,
  gregkh@linuxfoundation.org,  deller@gmx.de,  perex@perex.cz,
  jingoohan1@gmail.com,  lee@kernel.org,  kernel@wantstofly.org,
  lgirdwood@gmail.com,  linus.walleij@linaro.org,  marek.vasut@gmail.com,
  broonie@kernel.org,  mkpetch@internode.on.net,
  miquel.raynal@bootlin.com,  lost.distance@yahoo.com,
  philipp.zabel@gmail.com,  linux@armlinux.org.uk,  sre@kernel.org,
  slapin@ossfans.org,  s.shtylyov@omp.ru,  sudipm.mukherjee@gmail.com,
  tiwai@suse.com,  ulf.hansson@linaro.org,  vigneshr@ti.com,
  viresh.kumar@linaro.org,  wsa+renesas@sang-engineering.com,
  linux-pm@vger.kernel.org,  linux-ide@vger.kernel.org,
  linux-gpio@vger.kernel.org,  linux-input@vger.kernel.org,
  patches@opensource.cirrus.com,  linux-leds@vger.kernel.org,
  linux-mmc@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-rtc@vger.kernel.org,
  linux-usb@vger.kernel.org,  dri-devel@lists.freedesktop.org,
  linux-fbdev@vger.kernel.org,  alsa-devel@alsa-project.org
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
References: <20221019161831.3864786-1-arnd@kernel.org>
X-URL: http://belgarath.falguerolles.org/
Date: Wed, 19 Oct 2022 23:13:20 +0200
In-Reply-To: <20221019161831.3864786-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Wed, 19 Oct 2022 18:17:53 +0200")
Message-ID: <m2sfjjh5zj.fsf@sopl295.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (darwin)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_141344_331022_598D354E 
X-CRM114-Status: GOOD (  16.97  )
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

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
...zip...

> A good number of drivers become impossible to select after this, so
> each of these also get dropped. I'm including the driver patches in the
> series here and can either merge them through the soc tree, or they
> can get picked up by the individual subsystem maintainers. Since both
> the platform and the drivers get removed, the order should not matter.
This part is a bit ... bothering.
I at least identified these :
>  delete mode 100644 drivers/input/touchscreen/wm9705.c
>  delete mode 100644 drivers/input/touchscreen/wm9712.c
>  delete mode 100644 drivers/input/touchscreen/wm9713.c
>  delete mode 100644 drivers/input/touchscreen/wm97xx-core.c
>  delete mode 100644 drivers/mfd/wm97xx-core.c
>  delete mode 100644 sound/ac97/bus.c
>  delete mode 100644 sound/ac97/codec.c
>  delete mode 100644 sound/ac97/snd_ac97_compat.c

For the existing platforms working with devicetree support (mioa701 for
example), the wm9713 was properly used, providing both sound support and input
touchscreen.
So was the a97 part, providing a framework to make the wm9713 work.

So I'm wondering how the choice to chop these drivers was done, and it is
necessary to remove them. If so, maybe pxa support in the kernel should be
removed all together, as people playing with it loose part of the working DT
platforms they had.

As for the removal of defconfigs and arch-pxa, sure, this was PXA's destiny.

Cheers.

--
Robert

PS: If this mail is sent twice, sorry in advance, my mailer is a bad mood
lately.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
