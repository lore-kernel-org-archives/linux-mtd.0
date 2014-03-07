Date: Thu, 6 Mar 2014 23:12:54 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH RESEND] mtd: fix bug in partition size calculation
 related to MTDPART_OFS_RETAIN
Message-ID: <20140307071254.GB13420@norris-Latitude-E6410>
References: <1393261137-12088-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1393261137-12088-1-git-send-email-u.kleine-koenig@pengutronix.de>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 24, 2014 at 05:58:57PM +0100, Uwe Kleine-König wrote:
> If the remaining space is exactly what should still be available after
> the partition in question is added slave->mtd.size was set to zero
> instead of erroring out. In the next code block this was then
> interpreted as MTDPART_SIZ_FULL filling the rest of the partition
> instead of keeping it free for the next partition.
> 
> This problem existed since the MTDPART_OFS_RETAIN feature was introduced
> for 3.2-rc1.
> 
> Fixes: 1a31368bf92e ("mtd: add a flags for partitions which should just leave smth. after them")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> resending with the correct email address of Artem.
> 
> This MTDPART_OFS_RETAIN feature looks very special, and there is only a single
> user (arch/arm/mach-ep93xx/ts72xx.c). Moreover I didn't understand its purpose
> from reading the documentation in include/linux/mtd/partitions.h:
> 
> 	offset: absolute starting position within the master MTD device; [...]
> 	if [defined as] MTDPART_OFS_RETAIN, consume as much as possible,
> 	leaving size after the end of partition.
> 
> But maybe it's only me.

Yeah, it's kind of odd. Not sure what a better solution is, exactly.

> Anyhow I wonder if this feature is still considered valuable and if it's maybe
> better to just drop support for MTDPART_OFS_RETAIN. A more intuive replacement
> could be to specify start and end(+1) of partitions and interpret .start =
> -0x100000 as 1 MiB before the end of the device.

Well, we're already using negative numbers (embedded in an *unsigned*
field!) to represent a few special cases, so I'm not sure if we want to
overload "large" negative numbers to be offsets from the end...

> Best regards
> Uwe
> 
>  drivers/mtd/mtdpart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 6e732c3820c1..3ca9d7fbf126 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -442,16 +442,16 @@ static struct mtd_part *allocate_partition(struct mtd_info *master,
>  	}
>  	if (slave->offset == MTDPART_OFS_RETAIN) {
>  		slave->offset = cur_offset;
> -		if (master->size - slave->offset >= slave->mtd.size) {
> +		if (master->size - slave->offset > slave->mtd.size) {
>  			slave->mtd.size = master->size - slave->offset
>  							- slave->mtd.size;
>  		} else {
>  			printk(KERN_ERR "mtd partition \"%s\" doesn't have enough space: %#llx < %#llx, disabled\n",

Change the '<' in the message here, to '<='?

>  				part->name, master->size - slave->offset,
>  				slave->mtd.size);
>  			/* register to preserve ordering */
>  			goto out_register;

It seems like this has a bug too; shouldn't we be registering this
partition as 0-sized in this case? So:

	slave->mtd.size = 0;

>  		}
>  	}
>  	if (slave->mtd.size == MTDPART_SIZ_FULL)
>  		slave->mtd.size = master->size - slave->offset;

Brian
