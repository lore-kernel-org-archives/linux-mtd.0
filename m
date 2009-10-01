Subject: Re: [PATCH] [OneNAND] Standardising prints in onenand_base.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Amul Kumar Saha <amul.saha@samsung.com>
In-Reply-To: <6F989B9D46154BEAAC2255BA790F089B@sisodomain.com>
References: <6F989B9D46154BEAAC2255BA790F089B@sisodomain.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Oct 2009 10:22:02 +0300
Message-Id: <1254381722.32310.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kyungmin Park <kmpark@infradead.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, adrian.hunter@nokia.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-10-01 at 12:18 +0530, Amul Kumar Saha wrote:
> This patch resolves all the prints present in onenand_base.c
> Primarily, it replaces the hard-coded function names in the prints,
> and makes use of __func__.
> 
> Signed-off-by: Amul Kumar Saha <amul.saha at samsung.com>

Your patch is line-wrapped and not applicable:

[dedekind@eru l2-mtd-2.6.git]$ git am amul
Applying: Standardising prints in onenand_base.c
fatal: corrupt patch at line 69
Patch failed at 0001 Standardising prints in onenand_base.c
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".

[dedekind@eru l2-mtd-2.6.git]$ patch -p1 < .git/rebase-apply/patch
patching file drivers/mtd/onenand/onenand_base.c
patch: **** malformed patch at line 69: (int) len);

Please, refer:
Documentation/SubmittingPatches
Documentation/email-clients.txt

An tiny nit-pick below:

> ---
>  onenand_base.c |  172 +++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 106 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
> index ff66e43..ba760a2 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c

... snip ...

>  	} else if (state == FL_READING) {
> -		printk(KERN_ERR "onenand_wait: read timeout! ctrl=0x%04x intr=0x%04x\n", ctrl, interrupt);
> +		printk(KERN_ERR "%s: read timeout! ctrl=0x%04x intr=0x%04x\n",
> +			__func__, ctrl, interrupt);

You use one tab here, ok.

> @@ -1015,7 +1018,8 @@ static int onenand_recover_lsb(struct mtd_info *mtd, loff_t addr, int status)
>  	/* We are attempting to reread, so decrement stats.failed
>  	 * which was incremented by onenand_wait due to read failure
>  	 */
> -	printk(KERN_INFO "onenand_recover_lsb: Attempting to recover from uncorrectable read\n");
> +	printk(KERN_INFO "%s: Attempting to recover from uncorrectable read\n",
> +			__func__);

But you use 2 tabs here, which is inconsistent.

Also, you missed one place:

DEBUG(MTD_DEBUG_LEVEL3, "onenand_mlc_read_ops_nolock: from = 0x%08x, len
= %i\n", (unsigned int) from, (int) len)

... snip ...

> @@ -3214,7 +3249,8 @@ int flexonenand_set_boundary(struct mtd_info *mtd, int die,
>  	new = boundary + (die * this->density_mask);
>  	ret = flexonenand_check_blocks_erased(mtd, min(old, new) + 1, max(old, new));
>  	if (ret) {
> -		printk(KERN_ERR "flexonenand_set_boundary: Please erase blocks before boundary change\n");
> +		printk(KERN_ERR "%s: Please erase blocks"
> +				"before boundary change\n", __func__);

This will be printed as "Please erase blocksbefore boundary change",
i.e., not space.

... snip ...

> @@ -3408,8 +3446,8 @@ static void onenand_resume(struct mtd_info *mtd)
>  	if (this->state == FL_PM_SUSPENDED)
>  		onenand_release_device(mtd);
>  	else
> -		printk(KERN_ERR "resume() called for the chip which is not"
> -				"in suspended state\n");
> +		printk(KERN_ERR "%s: resume() called for the chip which is not"
> +				"in suspended state\n", __func__);

Ditto.

... snip ...

Otherwise looks ok.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
