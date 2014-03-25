Received: from mail-wg0-f48.google.com ([74.125.82.48])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbB-00025X-Dh
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:20:41 +0000
Received: by mail-wg0-f48.google.com with SMTP id l18so74457wgh.31
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 00/47] mtd: nand: Add new driver supporting ST's BCH h/w
Date: Tue, 25 Mar 2014 08:19:17 +0000
Message-Id: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

This patch-set was written against kernel version v3.4, but applies
cleanly to v3.13-rc7 which it is currently based. I understand that
the core has changed significantly since and that some of the
infrastructure this driver provides is now available either through
the framework or similar means. I'm looking for someone with inside
knowledge to draw attention to those areas so we can align with the
most recent API.

Any help would be gratefully received.

 drivers/mtd/nand/Kconfig         |   13 +
 drivers/mtd/nand/Makefile        |    2 +
 drivers/mtd/nand/nand_base.c     |   18 +-
 drivers/mtd/nand/nand_ids.c      |  165 ++++++++
 drivers/mtd/nand/stm_nand_bch.c  | 2769 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/stm_nand_dt.c   |  146 +++++++
 drivers/mtd/nand/stm_nand_dt.h   |   39 ++
 drivers/mtd/nand/stm_nand_regs.h |  302 ++++++++++++++
 include/linux/mtd/nand.h         |   40 ++
 include/linux/mtd/stm_nand.h     |  104 +++++
 10 files changed, 3591 insertions(+), 7 deletions(-)
