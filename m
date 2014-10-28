Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjFCq-00009g-0e
 for linux-mtd@lists.infradead.org; Tue, 28 Oct 2014 22:25:36 +0000
Received: by mail-pd0-f174.google.com with SMTP id p10so1624089pdj.33
 for <linux-mtd@lists.infradead.org>; Tue, 28 Oct 2014 15:25:14 -0700 (PDT)
Date: Tue, 28 Oct 2014 15:25:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Subject: Re: [PATCH] mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF chips
Message-ID: <20141028222511.GB23619@ld-irv-0074>
References: <1414020181-8855-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414020181-8855-1-git-send-email-andrea.adami@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Jingoo Han <jg1.han@samsung.com>,
 linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>,
 linux-mtd@lists.infradead.org, Christian Riesch <christian.riesch@omicron.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 23, 2014 at 01:23:01AM +0200, Andrea Adami wrote:
> After '#echo mem > /sys/power/state' some devices can not be properly resumed
> because apparently the MTD Partition Configuration Register has been reset
> to default thus the rootfs cannot be mounted cleanly on resume.
> An example of this can be found in the SA-1100 Developer's Manual at 9.5.3.3
> where the second step of the Sleep Shutdown Sequence is described:
> "An internal reset is applied to the SA-1100. All units are reset...".
> 
> As workaround we refresh the PCR value as done initially on chip setup.
> 
> This behavior and the fix are confirmed by our tests done on 2 different Zaurus
> collie units with kernel 3.17.
> 
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Who's the author? I have a 'From' header (which becomes the patch
author) of Andrea, but the sign-off is Dmitry. If you add a
'From: xxx <yyy@zzz.tld>' line to the beginning of the email, that can
clarify the author, even when the author is not emailing.

git-send-email will also handle that for you, if the original git commit
has the proper author.

> ---
>  drivers/mtd/chips/cfi_cmdset_0001.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index a7543ba..59e2355 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2590,6 +2590,8 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
>  
>  		/* Go to known state. Chip may have been power cycled */
>  		if (chip->state == FL_PM_SUSPENDED) {
> +			/* Refresh LH28F640BF Partition Config. Register */
> +			fixup_LH28F640BF(mtd);

OK, that looks fine.

But while we're at it, it seems like any chip which has a boot-time
fixup hook in cfi_fixup_table[] should be run at resume time, since
those chips may have lost power too. For instance, it looks like
fixup_unlock_powerup_lock() would need rerun.

I'm not sure if we should do a more invasive patch like that without any
testing, though.

>  			map_write(map, CMD(0xFF), cfi->chips[i].start);
>  			chip->oldstate = chip->state = FL_READY;
>  			wake_up(&chip->wq);

Brian
