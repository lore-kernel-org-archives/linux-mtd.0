Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Szy9d-00050A-DD
 for linux-mtd@lists.infradead.org; Fri, 10 Aug 2012 22:58:07 +0000
From: Marek Vasut <marex@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: gpmi-nand: Fix kernel crash due to missing verify_buf
Date: Sat, 11 Aug 2012 00:57:54 +0200
References: <1344638914-5268-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1344638914-5268-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201208110057.55112.marex@denx.de>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 shijie8@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Fabio Estevam,

> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> When selecting CONFIG_MTD_NAND_VERIFY_WRITE=y and doing simple write tests
> the following kernel crash happens:
> 
> root@freescale /$ dd if=/dev/zero of=/dev/mtd0 bs=128k count=1
> [   41.070000] Unable to handle kernel NULL pointer dereference at virtual
> addr0 [   41.080000] pgd = c77ac000
> [   41.080000] [00000000] *pgd=4773c831, *pte=00000000, *ppte=00000000
> [   41.090000] Internal error: Oops: 17 [#1] ARM
> [   41.090000] Modules linked in:
> [   41.090000] CPU: 0    Not tainted 
> (3.6.0-rc1-next-20120809-00002-ga25d017-d) [   41.090000] PC is at
> nand_verify_buf+0x18/0x5c
> [   41.090000] LR is at nand_write_page+0xc0/0x140
> [   41.090000] pc : [<c023e7d4>]    lr : [<c023fcfc>]    psr: 20000013
> [   41.090000] sp : c7779de4  ip : 00000000  fp : c6e60000
> [   41.090000] r10: 00000000  r9 : 00020000  r8 : 00000000
> [   41.090000] r7 : 00000000  r6 : c6e60000  r5 : c762cb10  r4 : 00000000
> [   41.090000] r3 : c762c8a8  r2 : 00000800  r1 : c6e60000  r0 : 00000000
> [   41.090000] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment
> user [   41.090000] Control: 0005317f  Table: 477ac000  DAC: 00000015
> [   41.090000] Process dd (pid: 427, stack limit = 0xc7778270)
> [   41.090000] Stack: (0xc7779de4 to 0xc777a000)
> ...
> 
> The NULL pointer dereference that happens in nand_verify_buf() is due to
> the missing gpmi_verify_buf implementation in the gpmi-nand driver.
> 
> Implement gpmi_verify_buf() to prevent this crash.
[...]

Acked-by: Marek Vasut <marex@denx.de>

Definitelly should go for stable too.

Best regards,
Marek Vasut
