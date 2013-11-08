Message-ID: <527C4EFC.8090701@freescale.com>
Date: Fri, 8 Nov 2013 10:39:56 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH bugfix] mtd: gpmi: serialize all the dma operations
References: <1383728007-15564-1-git-send-email-b32955@freescale.com>
 <20131107211229.GY20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131107211229.GY20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
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

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8808=E6=97=A5 05:12, Brian Norris =E5=86=99=
=E9=81=93:
> Hi Huang,
>
> On Wed, Nov 06, 2013 at 04:53:27PM +0800, Huang Shijie wrote:
>> [1] The gpmi uses the nand_command_lp to issue the commands to NAND ch=
ips.
>>      It will issue a DMA operation when it handles a NAND_CMD_NONE con=
trol
>>      command. So when we read a page(NAND_CMD_READ0) from the NAND, we=
 may send
>>      two DMA operations back-to-back.
>>
>>      If we do not serialize the two DMA operations, we will meet a bug=
 when
>>
>>      1.1) we enable CONFIG_DMA_API_DEBUG, CONFIG_DMADEVICES_DEBUG,
>>           and CONFIG_DEBUG_SG.
>>
>>      1.2) Use the following commands in an UART console and a SSH cons=
ole:
>>           cmd 1: while true;do dd if=3D/dev/mtd0 of=3D/dev/null;done
>>           cmd 1: while true;do dd if=3D/dev/mmcblk0 of=3D/dev/null;don=
e
> How does mmcblk0 have anything to do with the GPMI NAND DMA?
Reading the mmcblk0 is just to heavy the arm core loading. Reading the=20
mmcblk0 also revokes the
tasklets, and so make the tasklets of GPMI DMA not handled quickly enough=
.
>>      The kernel log shows below:
>>      -----------------------------------------------------------------
>>      kernel BUG at lib/scatterlist.c:28!
>>      Unable to handle kernel NULL pointer dereference at virtual addre=
ss 00000000
>>        .........................
>>      [<80044a0c>] (__bug+0x18/0x24) from [<80249b74>] (sg_next+0x48/0x=
4c)
>>      [<80249b74>] (sg_next+0x48/0x4c) from [<80255398>] (debug_dma_unm=
ap_sg+0x170/0x1a4)
>>      [<80255398>] (debug_dma_unmap_sg+0x170/0x1a4) from [<8004af58>] (=
dma_unmap_sg+0x14/0x6c)
>>      [<8004af58>] (dma_unmap_sg+0x14/0x6c) from [<8027e594>] (mxs_dma_=
tasklet+0x18/0x1c)
>>      [<8027e594>] (mxs_dma_tasklet+0x18/0x1c) from [<8007d444>] (taskl=
et_action+0x114/0x164)
>>      -----------------------------------------------------------------
>>
>>      1.3) Assume the two DMA operations is X (first) and Y (second).
>>           The root cause of the bug:
>>           X's tasklet mxs_dma_tasklet trid to unmap the scatterlist, w=
hile Y is
>>           trying to set up a new DMA operation with the _SAME_ scatter=
list in
>>           another ARM core.
> How are X and Y occurring concurrently? MTD/NAND has locking such that
> only one I/O operation is working on the chip at one time, right?
X and Y can not occur concurrently. X and Y is issue when the=20
nand_command_lp calls the:
chip->cmd_ctrl(mtd, NAND_CMD_NONE, ....);

When we read a page from the NAND, the X and Y is issued back to back.
>> [2] This patch adds a wait queue and two helpers gpmi_enter_dma/gpmi_e=
xit_dma to
>>      serialize all the DMA operations.
> If you really need this serialization, wouldn't a spinlock or mutex
> suffice?
>
spinlock is too short for this case.

mutex_unlock can not be call in the interrupt context, such as the in=20
the tasklet.
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> Cc: stable@vger.kernel.org
> Perhaps I'm missing some things, but I don't feel like the problem is
> sufficiently well described, and I'm not sure this is the right
> solution. But please, educate me.
>
should i add more description in the section of the root cause?

thanks
Huang Shijie
