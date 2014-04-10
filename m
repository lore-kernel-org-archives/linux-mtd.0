Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKXk-0005vY-3Y
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 19:21:48 +0000
Received: by mail-ig0-f175.google.com with SMTP id ur14so8210954igb.8
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 12:21:27 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 07/10] mtd: st_spi_fsm: kill duplicate CMD definitions
Date: Thu, 10 Apr 2014 12:21:01 -0700
Message-Id: <1397157664-24405-8-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
References: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

These are also in serial_flash_cmds.h. (FWIW, I didn't know the C
preprocessor allowed redefinitions without warning like this.)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/devices/st_spi_fsm.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
index 30082a09f68b..122a8a14ef84 100644
--- a/drivers/mtd/devices/st_spi_fsm.c
+++ b/drivers/mtd/devices/st_spi_fsm.c
@@ -201,42 +201,6 @@
 
 #define STFSM_MAX_WAIT_SEQ_MS  1000     /* FSM execution time */
 
-/* Flash Commands */
-#define FLASH_CMD_WREN         0x06
-#define FLASH_CMD_WRDI         0x04
-#define FLASH_CMD_RDID         0x9f
-#define FLASH_CMD_RDSR         0x05
-#define FLASH_CMD_RDSR2                0x35
-#define FLASH_CMD_WRSR         0x01
-#define FLASH_CMD_SE_4K                0x20
-#define FLASH_CMD_SE_32K       0x52
-#define FLASH_CMD_SE           0xd8
-#define FLASH_CMD_CHIPERASE    0xc7
-
-#define FLASH_CMD_READ         0x03    /* READ */
-#define FLASH_CMD_READ_FAST    0x0b    /* FAST READ */
-#define FLASH_CMD_READ_1_1_2   0x3b    /* DUAL OUTPUT READ */
-#define FLASH_CMD_READ_1_2_2   0xbb    /* DUAL I/O READ */
-#define FLASH_CMD_READ_1_1_4   0x6b    /* QUAD OUTPUT READ */
-#define FLASH_CMD_READ_1_4_4   0xeb    /* QUAD I/O READ */
-
-#define FLASH_CMD_WRITE                0x02    /* PAGE PROGRAM */
-#define FLASH_CMD_WRITE_1_1_2  0xa2    /* DUAL INPUT PROGRAM */
-#define FLASH_CMD_WRITE_1_2_2  0xd2    /* DUAL INPUT EXT PROGRAM */
-#define FLASH_CMD_WRITE_1_1_4  0x32    /* QUAD INPUT PROGRAM */
-#define FLASH_CMD_WRITE_1_4_4  0x12    /* QUAD INPUT EXT PROGRAM */
-
-#define FLASH_CMD_EN4B_ADDR    0xb7    /* Enter 4-byte address mode */
-#define FLASH_CMD_EX4B_ADDR    0xe9    /* Exit 4-byte address mode */
-
-/* READ commands with 32-bit addressing (N25Q256 and S25FLxxxS) */
-#define FLASH_CMD_READ4                0x13
-#define FLASH_CMD_READ4_FAST   0x0c
-#define FLASH_CMD_READ4_1_1_2  0x3c
-#define FLASH_CMD_READ4_1_2_2  0xbc
-#define FLASH_CMD_READ4_1_1_4  0x6c
-#define FLASH_CMD_READ4_1_4_4  0xec
-
 /* S25FLxxxS commands */
 #define S25FL_CMD_WRITE4_1_1_4 0x34
 #define S25FL_CMD_SE4          0xdc
-- 
1.8.3.2
