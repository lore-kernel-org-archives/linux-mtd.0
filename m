Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIYkL-000274-Rz
 for linux-mtd@lists.infradead.org; Tue, 15 May 2018 12:08:08 +0000
Date: Tue, 15 May 2018 14:07:40 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jagdish Gediya <jagdish.gediya@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
Subject: Re: Issue while oops and panic message logging to MTD partition
Message-ID: <20180515140740.4f58911b@bbrezillon>
In-Reply-To: <HE1PR0402MB2778B83183DA25027369540A90930@HE1PR0402MB2778.eurprd04.prod.outlook.com>
References: <HE1PR0402MB2778B83183DA25027369540A90930@HE1PR0402MB2778.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, 15 May 2018 10:49:15 +0000
Jagdish Gediya <jagdish.gediya@nxp.com> wrote:

> Hi,
> 
> Setup details:
> Board - Freescale ls1046ardb(ARM64)
> MTD device - nand(IFC)
> 
> CONFIG_MTD_OOPS is enabled to collect oops and panic logs. 
> Added bootargs to collect logs : mtdoops.mtddev=3 mtdoops.record_size=16384
> 
> Issue:
> Kernel hangs during oops log collection in function :fsl_ifc_run_command".
> Below is the code location where it hangs exactly,
> 
> /*
>  * execute IFC NAND command and wait for it to complete
>  */
> static void fsl_ifc_run_command(struct mtd_info *mtd)
> {		.
> 		.
> 		.
> 		.
> 		.
> 
>         /* wait for command complete flag or timeout */
>         wait_event_timeout(ctrl->nand_wait, ctrl->nand_stat,
>                            msecs_to_jiffies(IFC_TIMEOUT_MSECS));
> 
> 		.
> 		.
> 		.
> 		.
> }
> 
> "wait_event_timeout" is the exact culrit where kernel hangs. As panic(...) disables the local interrupt by calling local_irq_disable(),
> It looks like behavior is expected because timer interrupts are disabled and because of that "wait_event_timeout" hangs forever.
> 
> The odd behaviour is sometimes "wait_event_timeout" does not hang. The reason could be being a multicore processor, some other core would receive the
> timer interrupt and as a result "wait_event_timeout" gets unblocked.
> 
> How the other driver accomplish the timer replated work if any during the panic path or in general when local interrupts are disabled?

MTD_OOPS is just a mess, and I'm sure most driver simply don't support
it properly. If you still want to use the feature, you'll probably have
to fallback to status polling instead of using wait_event_timeout().
See what the core does here [1].

Still, I'd recommend not using MTD_OOPS if possible, because I fear
that's not the only problem you'll face. One problem I see is that the
locking is completely bypassed when ->panic_write() is called, and your
->cmdfunc() might be called while another operation is still in
progress (PROGRAM, ERASE, READ...) in order to get the NAND status.
Looking at the ifc code, it seems the driver is not ready to cope with
that.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v4.17-rc5/source/drivers/mtd/nand/raw/nand_base.c#L648
