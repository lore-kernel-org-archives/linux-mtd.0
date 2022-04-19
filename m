Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FD2C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 17:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zeRhAR2XeDINtpBr5Ckh/E7K76NFExi+cP8Kyvz41s=; b=kBcxErs8jvoTNN
	HQINWxXHJn/4RHUFfHybIBp84zGA98N7XRE3zwF9fjJcgn7mePdH5Uj4tCDNwfTAiLUQwgUWTIy9I
	UMEddSCst1S1xfNxyacde9NfwU4YGxjyPJhmVExIqvg+YgKnH7WmF6I7PFFyFMpHtbASjNwqWBp+O
	wBFsUJD9QQhGenio/Zq2JQL6BzRQfXMjCa88qvDpbnTc7cpIibZQNmPHN5MZpOjo3f9w3kyTmU+0j
	+Nx7YMEaVkao260K9MO/hgsfh1vXSVvGOqwTGVUe2q9awhdOz6KGU3veX7K/gkwaYdaDYkELcQwzn
	jO7SWwI6Pod+LflneU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrLQ-005AMk-2I; Tue, 19 Apr 2022 17:08:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngqvi-004xVn-Ik; Tue, 19 Apr 2022 16:42:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 21AC3B81AC8;
 Tue, 19 Apr 2022 16:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2B5C385AB;
 Tue, 19 Apr 2022 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386535;
 bh=+H1+foy7TUNvzKw9IPZ9qQkuYfuC23E40xmiZHmyw8Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bgydP6yEicIIy/M8QwJCJbhglFA8foOzULMKyltFmXik239VsGUTgzFUAL5wLF9vR
 yMxOF9N17d8Gm13CkVHGOLvN9CkP3A9XaFnJ0xREaPP+arGnEFt4ixw3igMl35EqXV
 yxBPns0uK7j+Cic3VAPSr0NWnY/Kss2HLt0dOUCUdopKPuayIfSMRO8b8Yj/pflE6d
 OgZPFC3CPPvEmh9bxKnVBRiwj34m6rBrBxkiq/Ht4gtHbcdwAztw59OZASONXWI66Q
 OniZDp9F3QNfXA1+UztViTDb9rtV9YEMtE7mjC9f5RB2LhtOcy2aBCYHme+bCs4eAF
 KcmwBn+/vfrjA==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Philipp Zabel <philipp.zabel@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Paul Parsons <lost.distance@yahoo.com>, Tomas Cech <sleep_walker@suse.com>,
 Sergey Lapin <slapin@ossfans.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Helge Deller <deller@gmx.de>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, patches@opensource.cirrus.com,
 linux-leds@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org
Subject: [PATCH 26/48] input: touchscreen: mainstone: fix pxa2xx+pxa3xx
 configuration
Date: Tue, 19 Apr 2022 18:37:48 +0200
Message-Id: <20220419163810.2118169-27-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_094219_017951_F8DEA9A4 
X-CRM114-Status: GOOD (  15.16  )
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

From: Arnd Bergmann <arnd@arndb.de>

There are two different ways of flushing the ac97 queue
in this driver, selected by a compile time option.

Change this to a runtime selection to make it work when both
are enabled.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/touchscreen/mainstone-wm97xx.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index 87655105ef3a..618c80847d9f 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -98,25 +98,20 @@ MODULE_PARM_DESC(ac97_touch_slot, "Touch screen data slot AC97 number");
 
 
 /* flush AC97 slot 5 FIFO on pxa machines */
-#ifdef CONFIG_PXA27x
-static void wm97xx_acc_pen_up(struct wm97xx *wm)
-{
-	schedule_timeout_uninterruptible(1);
-
-	while (MISR & (1 << 2))
-		MODR;
-}
-#else
 static void wm97xx_acc_pen_up(struct wm97xx *wm)
 {
 	unsigned int count;
 
 	schedule_timeout_uninterruptible(1);
 
-	for (count = 0; count < 16; count++)
-		MODR;
+	if (cpu_is_pxa27x()) {
+		while (MISR & (1 << 2))
+			MODR;
+	} else if (cpu_is_pxa3xx()) {
+		for (count = 0; count < 16; count++)
+			MODR;
+	}
 }
-#endif
 
 static int wm97xx_acc_pen_down(struct wm97xx *wm)
 {
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
