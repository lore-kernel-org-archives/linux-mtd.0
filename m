Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1anmJf-00089N-JA
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 12:12:14 +0000
Received: by mail-pf0-x243.google.com with SMTP id q129so4093903pfb.3
 for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2016 05:11:51 -0700 (PDT)
From: Keguang Zhang <keguang.zhang@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mtd@lists.infradead.org
Cc: Ralf Baechle <ralf@linux-mips.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH 7/7] MAINTAINERS: add Loongson1 architecture entry
Date: Wed,  6 Apr 2016 20:09:37 +0800
Message-Id: <1459944577-6423-8-git-send-email-keguang.zhang@gmail.com>
In-Reply-To: <1459944577-6423-1-git-send-email-keguang.zhang@gmail.com>
References: <1459944577-6423-1-git-send-email-keguang.zhang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Kelvin Cheung <keguang.zhang@gmail.com>

This patch adds Loongson1 architecture entry.
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 03e00c7..f6032a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7271,6 +7271,15 @@ S:	Supported
 F:	Documentation/mips/
 F:	arch/mips/
 
+MIPS/LOONGSON1 ARCHITECTURE
+M:	Keguang Zhang <keguang.zhang@gmail.com>
+L:	linux-mips@linux-mips.org
+S:	Maintained
+F:	arch/mips/loongson32/
+F:	arch/mips/include/asm/mach-loongson32/
+F:	drivers/*/*loongson1*
+F:	drivers/*/*/*loongson1*
+
 MIROSOUND PCM20 FM RADIO RECEIVER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
 L:	linux-media@vger.kernel.org
-- 
1.9.1
