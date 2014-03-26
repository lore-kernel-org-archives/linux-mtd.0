Received: from mail-wi0-f182.google.com ([209.85.212.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSqs7-0004Y2-MW
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 16:40:16 +0000
Received: by mail-wi0-f182.google.com with SMTP id d1so2043756wiv.15
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 09:39:48 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/15] mtd: st_spi_fsm: Align with ST's internal development
Date: Wed, 26 Mar 2014 16:39:14 +0000
Message-Id: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 lee.jones@linaro.org, kernel@stlinux.com, angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, all,

This patch-set updates ST's FSM SPI-NOR driver with all the internal
goodness which has happened since the initial (now upstreamed) snapshot
was taken. It covers just over 6 months worth of internal development
and bug-fixes. A final whitespace clean-up is also appended to the set
- to make it look pretty and stuff. :)

 drivers/mtd/devices/st_spi_fsm.c | 903 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------
 1 file changed, 579 insertions(+), 324 deletions(-)
