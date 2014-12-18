Received: from mail-pd0-f172.google.com ([209.85.192.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1Zdn-0007sv-DT
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 11:53:11 +0000
Received: by mail-pd0-f172.google.com with SMTP id y13so1275846pdi.31
 for <linux-mtd@lists.infradead.org>; Thu, 18 Dec 2014 03:52:48 -0800 (PST)
From: Chunyan Zhang <zhang.chunyan@linaro.org>
To: m.chehab@samsung.com, david@hardeman.nu, uli-lirc@uli-eckhardt.de,
 hans.verkuil@cisco.com, julia.lawall@lip6.fr, himangi774@gmail.com,
 khoroshilov@ispras.ru, joe@perches.com, dborkman@redhat.com,
 john.stultz@linaro.org, tglx@linutronix.de, davem@davemloft.net,
 dwmw2@infradead.org, computersforpeace@gmail.com, arnd@linaro.org
Subject: [PATCH 0/3] Changes the time type 'timeval' to 'Ktime'
Date: Thu, 18 Dec 2014 19:51:59 +0800
Message-Id: <1418903522-19137-1-git-send-email-zhang.chunyan@linaro.org>
In-Reply-To: <ktime-mtd-rc-v1>
References: <ktime-mtd-rc-v1>
Cc: zhang.lyra@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch-set changes the 32-bit time type (timeval) to the 64-bit one
(ktime_t) in imon.c, speedtest.c and torturetest.c, since 32-bit time
types will break in the year 2038.

This patch-set also introduces a reusable time difference function which
returns the difference in millisecond in ktime.h. The last two patches
of this patch-set will use this function, so they are dependent on the
first one. 

Chunyan Zhang (3):
  ktime.h: Introduce ktime_ms_delta
  mtd: test: Replace timeval with ktime_t in speedtest.c and torturetest.c
  media: rc: Replace timeval with ktime_t in imon.c

 drivers/media/rc/imon.c         |   49 +++++++++++----------------------------
 drivers/mtd/tests/speedtest.c   |   10 ++++----
 drivers/mtd/tests/torturetest.c |   10 ++++----
 include/linux/ktime.h           |    5 ++++
 4 files changed, 28 insertions(+), 46 deletions(-)

-- 
1.7.9.5
