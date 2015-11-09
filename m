Received: from 206-248-167-68.dsl.teksavvy.com ([206.248.167.68]
 helo=mail.isoar.ca)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZvrQM-0004Ht-AN
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2015 18:44:15 +0000
Message-ID: <5640E95D.5060405@isoar.ca>
Date: Mon, 09 Nov 2015 13:43:41 -0500
From: "Andrew E. Mileski" <andrewm@isoar.ca>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>
Subject: Re: Hang on reboot in nand_get_device()
References: <55958F4C.1020002@isoar.ca> <20151106180052.GE12143@google.com>
In-Reply-To: <20151106180052.GE12143@google.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015-11-06 13:00, Brian Norris wrote:
>
> On Thu, Jul 02, 2015 at 03:21:48PM -0400, Andrew E. Mileski wrote:
>> I'm experiencing a hang on reboot with a Freescale P1022 PowerPC system, with a
>> dual chip-select NAND part (specified in the device tree as two
>> separate devices), and kernel v4.0.6.
>
> Which driver?

Sorry, I wasn't specific enough:  fsl_elbc_nand.c

Currently using the 4.2.0 Linux kernel version, and the problem persists.

I've actually made a small hack to it to enable software ECC, but it isn't fit 
for distribution.

The stock driver is rather ugly in my opinion, and makes some overly broad 
assumptions about the hardware; the driver really is only intended to support 
hardware ECC.  I've taken a few stabs at cleaning-up the stock driver, but they 
all end-up being complete re-writes (for multi-die support), which is a bit more 
than I can chew.

The driver otherwise is usable as-is, albeit with only hardware ECC (that is 
insufficient for many modern NAND devices), and exhibits the same problem.

>> It appears to be a hang in mtd/nand/nand_base.c:nand_get_device() waiting on
>> chip->controller->active.
>
> And now that I begin describing the problem and grepping through the
> source logs... I see that this problem was already resolved back in
> 2009, except for the FL_PM_SUSPENDED mode:
>
> commit 6b0d9a84124937f048bcb8b21313152b23063978
> Author: Li Yang <leoli@freescale.com>
> Date:   Tue Nov 17 14:45:49 2009 -0800
>
>      mtd: nand: fix multi-chip suspend problem
>
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=6b0d9a84124937f048bcb8b21313152b23063978
>
> I actually don't see why we can't just use
> nand_get_device(FL_PM_SUSPENDED) for the shutdown/reboot case, like
> this:
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index cc74142938b0..ece544efccc3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3110,7 +3110,7 @@ static void nand_resume(struct mtd_info *mtd)
>    */
>   static void nand_shutdown(struct mtd_info *mtd)
>   {
> -	nand_get_device(mtd, FL_SHUTDOWN);
> +	nand_get_device(mtd, FL_PM_SUSPENDED);
>   }
>
>   /* Set default functions */
>
>
> It's also possible that this could be better solved in a proper
> refactor/rewrite of the NAND subsystem using a better controller/chip
> split, so there's only one reboot handler per NAND controller. Boris has
> been looking at that.
>
> Anyway, if the above looks OK, I can send a proper patch and get your
> 'Tested-by's.
>
> Brian

That seems to work too!  Thanks!

~~Andrew E. Mileski
