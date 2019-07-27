Return-Path: <SRS0=FWvq=VY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942B7C7618F
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Jul 2019 03:20:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5959E217D9
	for <linux-mtd@archiver.kernel.org>; Sat, 27 Jul 2019 03:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Snvt/tYk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="ORUDr6Cu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5959E217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rCo3zB1MPrD9U6M2ttUCks/V+8vMwfdt8pt9tbnGBZA=; b=Snvt/tYkqb8A/ah9gRTq6JxIh
	48EVEbV+ID6tGdGZ95N/DrKPjCSQRrEdYO8fxkZeMYiW55qH0LJ6AeL4ZRXPbRFOw2LWjrBtYCA+H
	D6RfkmRYKnvseDBEXEH8cYM7ESctx2xEIEk8cistWnQlMMOlMRk4p/ts83YIok67yJsaI5efksSD0
	+sR3nVUEPm/7EN8ZJ5hfe9JZ4O6sfD3B0nM3ir9q3sAIMBs0T4soV0vyrMlhwXQ+uMIbm0lfa9ik5
	eyXGBrgpIL0uS3W3RuC1PYvGMNoqkdh4WOtPpMPAqJ/K6i/bJ6G0lve8HHmtRRcf15cAWviMw+LiM
	GhnrwDoIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrDFw-0003Ny-8P; Sat, 27 Jul 2019 03:20:24 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrDFs-0003NB-O6
 for linux-mtd@lists.infradead.org; Sat, 27 Jul 2019 03:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1564197613; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYjAC67ZYcDwtcnIBpp0BzLOMVIg3F/G58/tAsJimxs=;
 b=ORUDr6CuY7vpgmdik7Ldm16UXWRFBr6Ee4ABQbj6tTfLvxBPwmhKA6bLpfcQxX+exzomjP
 TDrZy1fzdFeQCmOXR6cIQOjxRV8Q06DX/kYE2jocswD/4JlyOxJP5kSuaV94FjAfM/JVnu
 CJlyiJfb7/kikgxqr4FsYUPCYzzFns0=
Date: Fri, 26 Jul 2019 23:19:45 -0400
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 00/11] JZ4740 SoC cleanup
To: Sam Ravnborg <sam@ravnborg.org>
Message-Id: <1564197585.6472.0@crapouillou.net>
In-Reply-To: <20190726184649.GC14981@ravnborg.org>
References: <20190725220215.460-1-paul@crapouillou.net>
 <20190726184649.GC14981@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_202021_239412_843189B1 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, od@zcrc.me,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lee Jones <lee.jones@linaro.org>, Richard Weinberger <richard@nod.at>,
 linux-pm@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 dmaengine@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



Le ven. 26 juil. 2019 =E0 14:46, Sam Ravnborg <sam@ravnborg.org> a =

=E9crit :
> Hi Paul.
> =

> On Thu, Jul 25, 2019 at 06:02:04PM -0400, Paul Cercueil wrote:
>>  Hi,
>> =

>>  This patchset converts the Qi LB60 MIPS board to devicetree and =

>> makes it
>>  use all the shiny new drivers that have been developed or updated
>>  recently.
>> =

>>  All the crappy old drivers and custom code can be dropped since they
>>  have been replaced by better alternatives.
> =

> The overall diffstat is missing.
> Just for curiosity it would be nice to see what was dropped with this
> patch.
> =

> 	Sam

Diffstat:

 arch/mips/boot/dts/ingenic/jz4740.dtsi         |  84 ++++++++++++
 arch/mips/boot/dts/ingenic/qi_lb60.dts         | 295 =

++++++++++++++++++++++++++++++++++++++++-
 arch/mips/configs/qi_lb60_defconfig            |  44 +++---
 arch/mips/include/asm/mach-jz4740/gpio.h       |  15 ---
 arch/mips/include/asm/mach-jz4740/jz4740_fb.h  |  58 --------
 arch/mips/include/asm/mach-jz4740/jz4740_mmc.h |  12 --
 arch/mips/include/asm/mach-jz4740/platform.h   |  26 ----
 arch/mips/jz4740/Makefile                      |   7 +-
 arch/mips/jz4740/board-qi_lb60.c               | 491 =

-------------------------------------------------------------------
 arch/mips/jz4740/platform.c                    | 250 =

-----------------------------------
 arch/mips/jz4740/prom.c                        |   5 -
 arch/mips/jz4740/setup.c                       |   3 +-
 drivers/dma/Kconfig                            |   6 -
 drivers/dma/Makefile                           |   1 -
 drivers/dma/dma-jz4740.c                       | 623 =

---------------------------------------------------------------------------=
----------
 drivers/hwmon/Kconfig                          |  10 --
 drivers/hwmon/Makefile                         |   1 -
 drivers/hwmon/jz4740-hwmon.c                   | 135 =

-------------------
 drivers/mfd/Kconfig                            |   9 --
 drivers/mfd/Makefile                           |   1 -
 drivers/mfd/jz4740-adc.c                       | 324 =

---------------------------------------------
 drivers/mtd/nand/raw/ingenic/Kconfig           |   7 -
 drivers/mtd/nand/raw/ingenic/Makefile          |   1 -
 drivers/mtd/nand/raw/ingenic/jz4740_nand.c     | 536 =

--------------------------------------------------------------------------
 drivers/power/supply/Kconfig                   |  11 --
 drivers/power/supply/Makefile                  |   1 -
 drivers/power/supply/jz4740-battery.c          | 421 =

----------------------------------------------------------
 drivers/video/fbdev/Kconfig                    |   9 --
 drivers/video/fbdev/Makefile                   |   1 -
 drivers/video/fbdev/jz4740_fb.c                | 690 =

---------------------------------------------------------------------------=
--------------------
 sound/soc/jz4740/Kconfig                       |  25 +---
 sound/soc/jz4740/Makefile                      |   5 -
 sound/soc/jz4740/qi_lb60.c                     | 106 ---------------
 33 files changed, 404 insertions(+), 3809 deletions(-)




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
