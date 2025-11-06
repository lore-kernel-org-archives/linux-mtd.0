Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B50ECCFA03
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Nov 2025 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hasLfFMlw13gLD0AsTLrtz7ZyW4TII4BWirqbKhj3ps=; b=aGst5pJkAGQGbj
	OVdmCJvse+t+DitbohgqJb+ZLUrT8fDGOQpnn4hQtdpDoRDHUiU+IFQJlzYN48rUcuIUEmz0MI94K
	P6hPJPF0tAkstaaqcmxUk0NbtddgbaWvATqC+Yr5j07Zmil+V5upthMoQSXbtm26BtWTaOBO8/W7b
	bUM8HuSy4aGwWj0djspIMmCo2kNCBUgLKcbcsDVJPWQHMmCVN9/4sij2oPCQvL2pvQejv7jMgnRPE
	tZHaoNcTw1LAq/Muug7jQBJW+m5z5eG4Tlh8nxX8+rxGvC28gyNXIUIwB+xmF7qgMB26fT6vl45Z8
	io9MAkPDWYkPoCA0gW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH08z-0000000FaM1-25w1;
	Thu, 06 Nov 2025 13:35:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH08x-0000000FaKn-18Zt;
	Thu, 06 Nov 2025 13:35:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F486601DA;
	Thu,  6 Nov 2025 13:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD19C4CEFB;
	Thu,  6 Nov 2025 13:35:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yury Norov <yury.norov@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org,
	qat-linux@intel.com,
	linux-gpio@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 04/26] gpio: aspeed: #undef field_{get,prep}() before local definition
Date: Thu,  6 Nov 2025 14:33:52 +0100
Message-ID: <d1442e895f689ed1872c3cccd04f01f2aa38c37b.1762435376.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762435376.git.geert+renesas@glider.be>
References: <cover.1762435376.git.geert+renesas@glider.be>
MIME-Version: 1.0
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

Prepare for the advent of globally available common field_get() and
field_prep() macros by undefining the symbols before defining local
variants.  This prevents redefinition warnings from the C preprocessor
when introducing the common macros later.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v6:
  - Add Acked-by,

v5:
  - New.
---
 drivers/gpio/gpio-aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 7953a9c4e36d7550..ef4ccaf74a5b379e 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -32,7 +32,9 @@
 #include "gpiolib.h"
 
 /* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#undef field_get
 #define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
+#undef field_prep
 #define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
 
 #define GPIO_G7_IRQ_STS_BASE 0x100
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
