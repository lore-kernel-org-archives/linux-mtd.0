Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VfjDy-0004Nl-C6
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2013 04:35:43 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH fix] mtd: gpmi: wake up the process at the end of the DMA
 callback
Date: Mon, 11 Nov 2013 12:13:45 +0800
Message-ID: <1384143225-21633-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1384135418-19019-1-git-send-email-b32955@freescale.com>
References: <1384135418-19019-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[1] The gpmi uses the nand_command_lp to issue the commands to NAND chips.
    The gpmi issues a DMA operation with gpmi_cmd_ctrl when it handles
    a NAND_CMD_NONE control command. So when we read a page(NAND_CMD_READ0)
    from the NAND, we may send two DMA operations back-to-back.

    If we do not serialize the two DMA operations, we will meet a bug when

    1.1) we enable CONFIG_DMA_API_DEBUG, CONFIG_DMADEVICES_DEBUG,
         and CONFIG_DEBUG_SG.

    1.2) Use the following commands in an UART console and a SSH console:
         cmd 1: while true;do dd if=/dev/mtd0 of=/dev/null;done
         cmd 1: while true;do dd if=/dev/mmcblk0 of=/dev/null;done

    The kernel log shows below:
    -----------------------------------------------------------------
    kernel BUG at lib/scatterlist.c:28!
    Unable to handle kernel NULL pointer dereference at virtual address 00000000
      .........................
    [<80044a0c>] (__bug+0x18/0x24) from [<80249b74>] (sg_next+0x48/0x4c)
    [<80249b74>] (sg_next+0x48/0x4c) from [<80255398>] (debug_dma_unmap_sg+0x170/0x1a4)
    [<80255398>] (debug_dma_unmap_sg+0x170/0x1a4) from [<8004af58>] (dma_unmap_sg+0x14/0x6c)
    [<8004af58>] (dma_unmap_sg+0x14/0x6c) from [<8027e594>] (mxs_dma_tasklet+0x18/0x1c)
    [<8027e594>] (mxs_dma_tasklet+0x18/0x1c) from [<8007d444>] (tasklet_action+0x114/0x164)
    -----------------------------------------------------------------

    1.3) Assume the two DMA operations is X (first) and Y (second).

         The root cause of the bug:
	   Assume process P issues DMA X, and sleep on the completion
	 @this->dma_done. X's tasklet callback is dma_irq_callback. It firstly
	 wake up the process sleeping on the completion @this->dma_done,
	 and then trid to unmap the scatterlist S. The waked process P will
	 issue Y in another ARM core. Y initializes S->sg_magic to zero
	 with sg_init_one(), while dma_irq_callback is unmapping S at the same
	 time.

	 See the diagram:

                   ARM core 0              |         ARM core 1
	 -------------------------------------------------------------
         (P issues DMA X, then sleep)  --> |
                                           |
         (X's tasklet wakes P)         --> |
                                           |
                                           | <-- (P begin to issue DMA Y)
                                           |
         (X's tasklet unmap the            |
      scatterlist S with dma_unmap_sg) --> | <-- (Y calls sg_init_one() to init
                                           |      scatterlist S)
                                           |

[2] This patch serialize both the X and Y in the following way:
     Unmap the DMA scatterlist S firstly, and wake up the process at the end
     of the DMA callback, in such a way, Y will be executed after X.

     After this patch:

                   ARM core 0              |         ARM core 1
	 -------------------------------------------------------------
         (P issues DMA X, then sleep)  --> |
                                           |
         (X's tasklet unmap the            |
      scatterlist S with dma_unmap_sg) --> |
                                           |
         (X's tasklet wakes P)         --> |
                                           |
                                           | <-- (P begin to issue DMA Y)
                                           |
                                           | <-- (Y calls sg_init_one() to init
                                           |     scatterlist S)
                                           |

Cc: stable@vger.kernel.org
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 fix the wrong diagram.

 Resend this patch, CC to stable.

---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 7ac2280..f89b4fd 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -394,8 +394,6 @@ static void dma_irq_callback(void *param)
 	struct gpmi_nand_data *this = param;
 	struct completion *dma_c = &this->dma_done;
 
-	complete(dma_c);
-
 	switch (this->dma_type) {
 	case DMA_FOR_COMMAND:
 		dma_unmap_sg(this->dev, &this->cmd_sgl, 1, DMA_TO_DEVICE);
@@ -420,6 +418,8 @@ static void dma_irq_callback(void *param)
 	default:
 		pr_err("in wrong DMA operation.\n");
 	}
+
+	complete(dma_c);
 }
 
 int start_dma_without_bch_irq(struct gpmi_nand_data *this,
-- 
1.7.2.rc3
