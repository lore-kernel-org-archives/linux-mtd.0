Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6oxJ-0001Hv-L3
 for linux-mtd@lists.infradead.org; Fri, 24 Jan 2014 22:10:30 +0000
Date: Fri, 24 Jan 2014 19:10:11 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 1/4] mtd: block2mtd: char mtd major check
Message-ID: <20140124214836.GA14088@localhost>
References: <20140123204947.fc1c03dc0a1624d3347b3837@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140123204947.fc1c03dc0a1624d3347b3837@skynet.be>
Cc: joern@lazybastard.org, akpm@linux-foundation.org, rdunlap@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 23, 2014 at 08:49:47PM +0100, Fabian Frederick wrote:
> Deny use of a char mtd device to map as a block device.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---
>  drivers/mtd/devices/block2mtd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
> index d9fd87a..0efee5b 100644
> --- a/drivers/mtd/devices/block2mtd.c
> +++ b/drivers/mtd/devices/block2mtd.c
> @@ -244,7 +244,8 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
>  	}
>  	dev->blkdev = bdev;
>  
> -	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
> +	if ((MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) ||
> +	    (MAJOR(bdev->bd_dev) == MTD_CHAR_MAJOR)) {
>  		pr_err("attempting to use an MTD device as a block device\n");
>  		goto devinit_err;
>  	}
> -- 
> 1.8.1.4

Now that the changes are separated on a per-patch basis they're much
much easier to review. Thanks!

Regarding this changes, it seems to me it's not needed. Are you sure
you can attach "block2mtd" to a char MTD device?

That would be odd, given this function calls blkdev_get_by_{path/dev};
which will check the device is of block type in the first place.

What's your motivation for this change?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
