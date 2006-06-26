Date: Mon, 26 Jun 2006 16:37:43 +0100 (BST)
From: Alexey Korolev <akorolev@pentafluge.infradead.org>
To: linux-mtd@lists.infradead.org, nico@cam.org, davide.cascone@st.com
Subject: [PATCH] MTD performance issues on XIP configuration.
Message-ID: <Pine.LNX.4.56.0606261628560.8547@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Alexey Korolev <akorolev@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

Current implementation of cfi_cmdset_0001 driver has serious performance issues in case of enabled MTD XIP configuration.
Performance tests showed RAW write performance on XIP configuration ~60Kb/sec on Sibley (It should be over 400Kb/s)
I investigated this problem:
When we perform write or lock/unlock operation we call WAIT_TIMEOUT which passes chip_op_time = 0 to function xip_wait_for_operation. When zero timeout is passed to xip_wait_for_operation it automatically sets the usec = 500000 - and we send cpu to idle when it is unnecessary.
To fix the issue I corrected the condition for sending CPU to idle.

If you don't have any concerns regarding the following code could you please put it into the repository?

Thanks,
Alexey
-----------------------
diff -aur a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
--- a/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-26 13:20:00.000000000 +0400
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2006-06-26 13:35:01.904969256 +0400
@@ -1001,7 +1001,7 @@
 			map_write(map, CMD(0x70), adr);
 			chip->state = oldstate;
 			start = xip_currtime();
-		} else if (usec >= 1000000/HZ) {
+		} else if (*chip_op_time >= 1000000/HZ) {
 			/*
 			 * Try to save on CPU power when waiting delay
 			 * is at least a system timer tick period.
