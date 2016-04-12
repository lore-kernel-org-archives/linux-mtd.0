Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aq1Cm-0003f7-Pm
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2016 16:30:22 +0000
Received: by mail-qk0-x235.google.com with SMTP id o6so8440371qkc.2
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2016 09:29:58 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>,
	<linux-leds@vger.kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jacek Anaszewski <j.anaszewski@samsung.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: [PATCH 0/2]  LED trigger on MTD activity
Date: Tue, 12 Apr 2016 13:26:33 -0300
Message-Id: <1460478395-25925-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

After our recent discussion [1], here's a proper patchset.

The first patch is a minor cleanup which moves mtd_write_oob
out of mtd.h header.

The second patch implements the LED trigger. Unfortunately,
it depends on the first patch, so it might make sense to take
this two through the MTD tree with Jacked acknowledgement.

Feedback is welcome!

[1] http://www.spinics.net/lists/linux-leds/msg05906.html

Ezequiel Garcia (2):
  mtd: Uninline mtd_write_oob and move it to mtdcore.c
  leds: trigger: Introduce a MTD (NAND/NOR) trigger

 drivers/leds/trigger/Kconfig       |  8 +++++++
 drivers/leds/trigger/Makefile      |  1 +
 drivers/leds/trigger/ledtrig-mtd.c | 49 ++++++++++++++++++++++++++++++++++++++
 drivers/mtd/mtdcore.c              | 19 +++++++++++++++
 drivers/mtd/nand/nand_base.c       | 29 +---------------------
 include/linux/leds.h               |  6 +++++
 include/linux/mtd/mtd.h            | 12 +---------
 7 files changed, 85 insertions(+), 39 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-mtd.c

-- 
2.7.0
