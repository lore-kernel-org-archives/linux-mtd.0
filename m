Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSqs8-0004Y6-6V
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 16:40:19 +0000
Received: by mail-wi0-f173.google.com with SMTP id f8so4883982wiw.0
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 09:39:53 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/15] mtd: st_spi_fsm: Update Macronix 32-bit addressing
 support
Date: Wed, 26 Mar 2014 16:39:16 +0000
Message-Id: <1395851969-13520-3-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
References: <1395851969-13520-1-git-send-email-lee.jones@linaro.org>
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

From: Angus Clark <angus.clark@st.com>

Support for the Macronix 32-bit addressing scheme was originally developed using
the MX25L25635E device.  As is often the case, it was found that the presence of
a "WAIT" instruction was required for the "EN4B/EX4B" FSM Sequence to complete.
(It is known that the SPI FSM Controller makes certain undocumented assumptions
regarding what constitutes a valid sequence.)  However, further testing
suggested that a small delay was required after issuing the "EX4B" command;
without this delay, data corruptions were observed, consistent with the device
not being ready to retrieve data.  Although the issue was not fully understood,
the workaround of adding a small delay was implemented, while awaiting
clarification from Macronix.

The same behaviour has now been found with a second Macronix device, the
MX25L25655E.  However, with this device, it seems that the delay is also
required after the 'EN4B' commands.  This discovery has prompted us to revisit
the issue.

Although still not conclusive, further tests have suggested that the issue is
down to the SPI FSM Controller, rather than the Macronix devices.  Furthermore,
an alternative workaround has emerged which is to set the WAIT time to
0x00000001, rather then 0x00000000.  (Note, the WAIT instruction is used purely
for the purpose of achieving "sequence validity", rather than actually
implementing a delay!)

The issue is now being investigated by the Design and Validation teams.  In the
meantime, we implement the alternative workaround, which reduces the effective
delay from 1us to 1ns.

Signed-off-by: Angus Clark <angus.clark@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 2471061..31bbf28 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -270,7 +270,6 @@
  */
 #define CFG_READ_TOGGLE_32BIT_ADDR     0x00000001
 #define CFG_WRITE_TOGGLE_32BIT_ADDR    0x00000002
-#define CFG_WRITE_EX_32BIT_ADDR_DELAY  0x00000004
 #define CFG_ERASESEC_TOGGLE_32BIT_ADDR 0x00000008
 #define CFG_S25FL_CHECK_ERROR_FLAGS    0x00000010
 
@@ -1151,23 +1150,17 @@ static int stfsm_mx25_config(struct stfsm *fsm)
 		stfsm_mx25_en_32bit_addr_seq(&fsm->stfsm_seq_en_32bit_addr);
 
 		soc_reset = stfsm_can_handle_soc_reset(fsm);
-		if (soc_reset || !fsm->booted_from_spi) {
+		if (soc_reset || !fsm->booted_from_spi)
 			/* If we can handle SoC resets, we enable 32-bit address
 			 * mode pervasively */
 			stfsm_enter_32bit_addr(fsm, 1);
 
-		} else {
+		else
 			/* Else, enable/disable 32-bit addressing before/after
 			 * each operation */
 			fsm->configuration = (CFG_READ_TOGGLE_32BIT_ADDR |
 					      CFG_WRITE_TOGGLE_32BIT_ADDR |
 					      CFG_ERASESEC_TOGGLE_32BIT_ADDR);
-			/* It seems a small delay is required after exiting
-			 * 32-bit mode following a write operation.  The issue
-			 * is under investigation.
-			 */
-			fsm->configuration |= CFG_WRITE_EX_32BIT_ADDR_DELAY;
-		}
 	}
 
 	/* For QUAD mode, set 'QE' STATUS bit */
@@ -1630,11 +1623,8 @@ static int stfsm_write(struct stfsm *fsm, const uint8_t *buf,
 		stfsm_s25fl_clear_status_reg(fsm);
 
 	/* Exit 32-bit address mode, if required */
-	if (fsm->configuration & CFG_WRITE_TOGGLE_32BIT_ADDR) {
+	if (fsm->configuration & CFG_WRITE_TOGGLE_32BIT_ADDR)
 		stfsm_enter_32bit_addr(fsm, 0);
-		if (fsm->configuration & CFG_WRITE_EX_32BIT_ADDR_DELAY)
-			udelay(1);
-	}
 
 	return 0;
 }
@@ -1937,6 +1927,13 @@ static int stfsm_init(struct stfsm *fsm)
 	       fsm->base + SPI_CONFIGDATA);
 	writel(STFSM_DEFAULT_WR_TIME, fsm->base + SPI_STATUS_WR_TIME_REG);
 
+	/*
+	 * Set the FSM 'WAIT' delay to the minimum workable value.  Note, for
+	 * our purposes, the WAIT instruction is used purely to achieve
+	 * "sequence validity" rather than actually implement a delay.
+	 */
+	writel(0x00000001, fsm->base + SPI_PROGRAM_ERASE_TIME);
+
 	/* Clear FIFO, just in case */
 	stfsm_clear_fifo(fsm);
 
-- 
1.8.3.2
