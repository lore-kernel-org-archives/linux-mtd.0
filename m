Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyGjE-0004e1-4K
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 10:09:41 +0000
Date: Mon, 16 Nov 2015 11:09:17 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Ray Jui <rjui@broadcom.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Scott Branden <sbranden@broadcom.com>,
 "Andrew E . Mileski" <andrewm@isoar.ca>
Subject: Re: [PATCH] mtd: nand: fix shutdown/reboot for multi-chip systems
Message-ID: <20151116110917.4b80a5a0@bbrezillon>
In-Reply-To: <1447115848-92621-1-git-send-email-computersforpeace@gmail.com>
References: <1447115848-92621-1-git-send-email-computersforpeace@gmail.com>
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

On Mon,  9 Nov 2015 16:37:28 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

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

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
> I only compile-tested
> 
> If we get proper tests, this is probably 4.4 material
> 
>  drivers/mtd/nand/nand_base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index cc74142938b0..ece544efccc3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3110,7 +3110,7 @@ static void nand_resume(struct mtd_info *mtd)
>   */
>  static void nand_shutdown(struct mtd_info *mtd)
>  {
> -	nand_get_device(mtd, FL_SHUTDOWN);
> +	nand_get_device(mtd, FL_PM_SUSPENDED);
>  }
>  
>  /* Set default functions */



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
