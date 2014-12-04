Received: from mail-yk0-f176.google.com ([209.85.160.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwTYH-0003th-9I
 for linux-mtd@lists.infradead.org; Thu, 04 Dec 2014 10:22:26 +0000
Received: by mail-yk0-f176.google.com with SMTP id q200so7759940ykb.21
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 02:22:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 00/11] mtd: st_spi_fsm: Align with ST's internal
 development
Date: Thu,  4 Dec 2014 10:21:41 +0000
Message-Id: <1417688512-7644-1-git-send-email-lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 lee.jones@linaro.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, all,

 [x] Bulid test
 [x] Bisectable
 [x] Smatch
 [x] Sparse

v2:
  These are the last remaining patches in the set, all rebased and
  with the DT documentation requested after the last submission.

v1:
  This patch-set updates ST's FSM SPI-NOR driver with all the internal
  goodness which has happened since the initial (now upstreamed) snapshot
  was taken. It covers just over 6 months worth of internal development
  and bug-fixes. A final whitespace clean-up is also appended to the set
  - to make it look pretty and stuff. :)

Angus Clark (4):
  mtd: st_spi_fsm: Add support for N25Q512 and N25Q00A devices
  mtd: st_spi_fsm: Update the JEDEC probe to handle extended READIDs
  mtd: st_spi_fsm: Update Spansion device entries
  mtd: st_spi_fsm: Improve busy wait handling

Christophe Kerello (1):
  mtd: st_spi_fsm: Provide mask to obtain correct boot device pins

Lee Jones (5):
  mtd: st_spi_fsm: Extend fsm_clear_fifo to handle unwanted bytes
  mtd: st_spi_fsm: Obtain and use EMI clock if provided
  mtd: st_spi_fsm: Fix [-Wsign-compare] build warning
  mtd: st_spi_fsm: Provide documentation for boot device mask property
  mtd: st_spi_fsm: General tidy-up

Nunzio Raciti (1):
  mtd: st_spi_fsm: Add support for Micron N25Q512A

 Documentation/devicetree/bindings/mtd/st-fsm.txt |   4 +
 drivers/mtd/devices/st_spi_fsm.c                 | 687 +++++++++++++++--------
 2 files changed, 470 insertions(+), 221 deletions(-)

-- 
1.9.1
