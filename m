Received: from mail-gw1-out.broadcom.com ([216.31.210.62])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZxO6G-0000q6-Qc
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2015 23:49:49 +0000
Subject: Re: [PATCH] mtd: nand: fix shutdown/reboot for multi-chip systems
To: Brian Norris <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
References: <1447115848-92621-1-git-send-email-computersforpeace@gmail.com>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, Ray Jui <rjui@broadcom.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, "Andrew E . Mileski" <andrewm@isoar.ca>
From: Scott Branden <sbranden@broadcom.com>
Message-ID: <564676F0.70404@broadcom.com>
Date: Fri, 13 Nov 2015 15:49:04 -0800
MIME-Version: 1.0
In-Reply-To: <1447115848-92621-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15-11-09 04:37 PM, Brian Norris wrote:
> If multiple NAND chips are registered to the same controller, then when
> rebooting the system, the first one will grab the controller lock, while
> the second will wait forever for the first one to release it. i.e., a
> classic deadlock.
>
> This problem was solved for a similar case (suspend/resume) back in
> commit 6b0d9a841249 ("mtd: nand: fix multi-chip suspend problem"), and
> the shutdown state really isn't much different for us, so rather than
> adding a new special case to nand_get_device(), we can just overload the
> FL_PM_SUSPENDED state.
>
> Now, multiple chips can "get" the same controller lock (preventing
> further I/O), while we still allow other chips to pass through
> nand_shutdown().
>
> Original report:
> http://thread.gmane.org/gmane.linux.drivers.mtd/59726
> http://lists.infradead.org/pipermail/linux-mtd/2015-July/059992.html
>
> Fixes: 72ea403669c7 ("mtd: nand: added nand_shutdown")
> Reported-by: Andrew E. Mileski <andrewm@isoar.ca>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Andrew E. Mileski <andrewm@isoar.ca>
> ---
> I only compile-tested
>
> If we get proper tests, this is probably 4.4 material

I reviewed the code in nand_get_device and it looks sane whether 
FL_SHUTDOWN or PL_PM_SUSPENDED is called.

Acked-by: Scott Branden <sbranden@broadcom.com>

>
>   drivers/mtd/nand/nand_base.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
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
