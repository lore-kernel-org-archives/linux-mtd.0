Received: from mail-we0-f180.google.com ([74.125.82.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQatb-0003oj-0g
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 11:12:24 +0000
Received: by mail-we0-f180.google.com with SMTP id p61so458349wes.25
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 04:12:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com
Subject: [PATCH 0/5] mtd: st_spi_fsm: Sweep-up remaining blocking-issues
Date: Thu, 20 Mar 2014 11:11:42 +0000
Message-Id: <1395313907-25318-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, lee.jones@linaro.org,
 kernel@stlinux.com, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

Sincerest apologies for missing these before.

I hope this now covers all of points you raised.

 drivers/mtd/devices/st_spi_fsm.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)
