Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4A2E7D0CE
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Sep 2023 06:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pix/hrl7Gnyr8WLjWzRGY1IC68H8/gwiCC3bBKmDOcs=; b=IhhWuo3pKFlccn
	jG8NJJIS778EJEHkQyvHut7qKIwjoCy8BMVDKOqlejEbuaTol4xLUSlHGfgxb+fcVjCAq2LhikgXa
	BkeBufnmw/zeoVa1zpNlLXgdzFCbCyBTxtfeWkO6KC9Jc2D7UC2FhZZIZFBmVhlwv2bJlHvtbPxVi
	zL9k9IGftevWu96V8zkb6UXpmKoqsCq41SI0hN9f1iNGQNj5IG52GaEmQUWvDaHswIdAzKOzwNY4W
	LCKgBBr9K5+r2N1mk1BlCy7wCcbTr//EvZM3Ev498HyQ83Tmnbla4n+bC4ZjjVRMEG73n9e3G4ore
	1/ZpEHiXjenq4yz9/CuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZSG-0081dj-2y;
	Fri, 22 Sep 2023 06:15:56 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZSB-0081ah-1I
	for linux-mtd@lists.infradead.org;
	Fri, 22 Sep 2023 06:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=RMnnVl4Ql662w9
	OZiZW5LKuXonrd4+xLFQeCaWKnYkw=; b=Gp0ZeSxfOZ6uc1qoJJALavCNtjrzhf
	7Jk3hL22FXDCdzjM0KHFgEs8t4QZiYf/5p/Z4C+YLfffoFwHezrTQmxSEd9vP97n
	ad7+EvOuhu5Y7eAh4SnHGi9CS6UTIe5jL+sCqNSbmejEkpod8tjBn6sxA9I83Xsa
	rgfjZeNUNFtQ7JJGvBiO5eORynTrDWCRmwBnV5kyNa/9Pl3BQrFjHOf7tXZwkr4E
	pleJeU235eenle7hff/L3pobiF/bC8XdrEmjwA1cmxgge++XkT1j9MXv2irkFSpP
	PsKyBHAOV5XmBE3gjIepBn6AcLgiZZ8R7J2SgG4UUE/ysOJglb4Xp9Fg==
Received: (qmail 1268966 invoked from network); 22 Sep 2023 08:15:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Sep 2023 08:15:39 +0200
X-UD-Smtp-Session: l3s3148p1@OqhriewF5pkujntX
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mips@vger.kernel.org
Cc: Jonas Gorski <jonas.gorski@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 0/6] remove AR7 platform and associated drivers
Date: Fri, 22 Sep 2023 08:15:21 +0200
Message-Id: <20230922061530.3121-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_231551_733888_B32088AD 
X-CRM114-Status: GOOD (  13.21  )
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

Changes since v1:
* kept uapi define for for serial port type
* added acks

Still valid cover letter from v1:

When trying to get rid of the obsolete VLYNQ bus, Jonas and Florian
pointed out that its only user, the AR7 platform can probaly go entirely
[1]. This series does exactly that. Even OpenWRT has removed support
because these devices are "stuck with 3.18" [2].

It removes the drivers first, because watchdog and network include
platform specific headers. Once the drivers are gone, we remove the
platform. The patches are based on 6.6-rc2 and created with
"--irreversible-delete" to save some space.

My suggestion is that everything is merged via the MIPS tree in one go,
so we don't have broken drivers because of missing platform headers. But
maybe there are reasons for a two-cycle removal with the drivers first
and the platform later?

Looking forward to comments.

Happy hacking,

   Wolfram


[1] https://lore.kernel.org/r/3395161f-2543-46f0-83d9-b918800305e1@gmail.com
[2] https://openwrt.org/docs/techref/targets/ar7


Wolfram Sang (6):
  serial: 8250: remove AR7 support
  mtd: parsers: ar7: remove support
  vlynq: remove bus driver
  watchdog: ar7_wdt: remove driver to prepare for platform removal
  net: cpmac: remove driver to prepare for platform removal
  MIPS: AR7: remove platform

 MAINTAINERS                             |   13 -
 arch/arm/configs/pxa_defconfig          |    1 -
 arch/mips/Kbuild.platforms              |    1 -
 arch/mips/Kconfig                       |   22 -
 arch/mips/ar7/Makefile                  |   11 -
 arch/mips/ar7/Platform                  |    5 -
 arch/mips/ar7/clock.c                   |  439 --------
 arch/mips/ar7/gpio.c                    |  332 ------
 arch/mips/ar7/irq.c                     |  165 ---
 arch/mips/ar7/memory.c                  |   51 -
 arch/mips/ar7/platform.c                |  722 -------------
 arch/mips/ar7/prom.c                    |  256 -----
 arch/mips/ar7/setup.c                   |   93 --
 arch/mips/ar7/time.c                    |   31 -
 arch/mips/boot/compressed/uart-16550.c  |    5 -
 arch/mips/configs/ar7_defconfig         |  119 ---
 arch/mips/include/asm/mach-ar7/ar7.h    |  191 ----
 arch/mips/include/asm/mach-ar7/irq.h    |   16 -
 arch/mips/include/asm/mach-ar7/prom.h   |   12 -
 arch/mips/include/asm/mach-ar7/spaces.h |   22 -
 drivers/Kconfig                         |    2 -
 drivers/Makefile                        |    1 -
 drivers/mtd/parsers/Kconfig             |    5 -
 drivers/mtd/parsers/Makefile            |    1 -
 drivers/mtd/parsers/ar7part.c           |  129 ---
 drivers/net/ethernet/ti/Kconfig         |    9 +-
 drivers/net/ethernet/ti/Makefile        |    1 -
 drivers/net/ethernet/ti/cpmac.c         | 1251 -----------------------
 drivers/tty/serial/8250/8250_port.c     |    7 -
 drivers/vlynq/Kconfig                   |   21 -
 drivers/vlynq/Makefile                  |    6 -
 drivers/vlynq/vlynq.c                   |  799 ---------------
 drivers/watchdog/Kconfig                |    6 -
 drivers/watchdog/Makefile               |    1 -
 drivers/watchdog/ar7_wdt.c              |  315 ------
 include/linux/vlynq.h                   |  149 ---
 36 files changed, 1 insertion(+), 5209 deletions(-)
 delete mode 100644 arch/mips/ar7/Makefile
 delete mode 100644 arch/mips/ar7/Platform
 delete mode 100644 arch/mips/ar7/clock.c
 delete mode 100644 arch/mips/ar7/gpio.c
 delete mode 100644 arch/mips/ar7/irq.c
 delete mode 100644 arch/mips/ar7/memory.c
 delete mode 100644 arch/mips/ar7/platform.c
 delete mode 100644 arch/mips/ar7/prom.c
 delete mode 100644 arch/mips/ar7/setup.c
 delete mode 100644 arch/mips/ar7/time.c
 delete mode 100644 arch/mips/configs/ar7_defconfig
 delete mode 100644 arch/mips/include/asm/mach-ar7/ar7.h
 delete mode 100644 arch/mips/include/asm/mach-ar7/irq.h
 delete mode 100644 arch/mips/include/asm/mach-ar7/prom.h
 delete mode 100644 arch/mips/include/asm/mach-ar7/spaces.h
 delete mode 100644 drivers/mtd/parsers/ar7part.c
 delete mode 100644 drivers/net/ethernet/ti/cpmac.c
 delete mode 100644 drivers/vlynq/Kconfig
 delete mode 100644 drivers/vlynq/Makefile
 delete mode 100644 drivers/vlynq/vlynq.c
 delete mode 100644 drivers/watchdog/ar7_wdt.c
 delete mode 100644 include/linux/vlynq.h

-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
