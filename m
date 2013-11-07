Date: Thu, 7 Nov 2013 13:12:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH bugfix] mtd: gpmi: serialize all the dma operations
Message-ID: <20131107211229.GY20061@ld-irv-0074.broadcom.com>
References: <1383728007-15564-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1383728007-15564-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Wed, Nov 06, 2013 at 04:53:27PM +0800, Huang Shijie wrote:
> [1] The gpmi uses the nand_command_lp to issue the commands to NAND chips.
>     It will issue a DMA operation when it handles a NAND_CMD_NONE control
>     command. So when we read a page(NAND_CMD_READ0) from the NAND, we may send
>     two DMA operations back-to-back.
> 
>     If we do not serialize the two DMA operations, we will meet a bug when
> 
>     1.1) we enable CONFIG_DMA_API_DEBUG, CONFIG_DMADEVICES_DEBUG,
>          and CONFIG_DEBUG_SG.
> 
>     1.2) Use the following commands in an UART console and a SSH console:
>          cmd 1: while true;do dd if=/dev/mtd0 of=/dev/null;done
>          cmd 1: while true;do dd if=/dev/mmcblk0 of=/dev/null;done

How does mmcblk0 have anything to do with the GPMI NAND DMA?

>     The kernel log shows below:
>     -----------------------------------------------------------------
>     kernel BUG at lib/scatterlist.c:28!
>     Unable to handle kernel NULL pointer dereference at virtual address 00000000
>       .........................
>     [<80044a0c>] (__bug+0x18/0x24) from [<80249b74>] (sg_next+0x48/0x4c)
>     [<80249b74>] (sg_next+0x48/0x4c) from [<80255398>] (debug_dma_unmap_sg+0x170/0x1a4)
>     [<80255398>] (debug_dma_unmap_sg+0x170/0x1a4) from [<8004af58>] (dma_unmap_sg+0x14/0x6c)
>     [<8004af58>] (dma_unmap_sg+0x14/0x6c) from [<8027e594>] (mxs_dma_tasklet+0x18/0x1c)
>     [<8027e594>] (mxs_dma_tasklet+0x18/0x1c) from [<8007d444>] (tasklet_action+0x114/0x164)
>     -----------------------------------------------------------------
> 
>     1.3) Assume the two DMA operations is X (first) and Y (second).
>          The root cause of the bug:
>          X's tasklet mxs_dma_tasklet trid to unmap the scatterlist, while Y is
>          trying to set up a new DMA operation with the _SAME_ scatterlist in
>          another ARM core.

How are X and Y occurring concurrently? MTD/NAND has locking such that
only one I/O operation is working on the chip at one time, right?

> [2] This patch adds a wait queue and two helpers gpmi_enter_dma/gpmi_exit_dma to
>     serialize all the DMA operations.

If you really need this serialization, wouldn't a spinlock or mutex
suffice?

> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Cc: stable@vger.kernel.org

Perhaps I'm missing some things, but I don't feel like the problem is
sufficiently well described, and I'm not sure this is the right
solution. But please, educate me.

Brian
