Subject: Re: [PATCH] [MTD] Correct partition failed erase address
From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Hunter <ext-adrian.hunter@nokia.com>
In-Reply-To: <45EFE35C.70604@nokia.com>
References: <45EFE35C.70604@nokia.com>
Content-Type: text/plain
Date: Thu, 08 Mar 2007 10:27:50 +0000
Message-Id: <1173349670.3461.398.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-08 at 12:20 +0200, Adrian Hunter wrote:
> If an erase operation fails, the address at which the
> failure occurred is returned by the driver.  The MTD
> partition must adjust this address (by subtracting the
> partition offset) before returning to the caller.
> This was not happening, which caused JFFS2 to mark
> the wrong block bad!
> 
> Signed-off-by: Adrian Hunter <ext-adrian.hunter@nokia.com>
> ---
>  drivers/mtd/mtdpart.c |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 633def3..476fbb6 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -200,6 +200,11 @@ static int part_erase (struct mtd_info *
>  		return -EINVAL;
>  	instr->addr += part->offset;
>  	ret = part->master->erase(part->master, instr);
> +	if (ret) {
> +		if (instr->fail_addr != 0xffffffff)
> +			instr->fail_addr -= part->offset;
> +		instr->addr -= part->offset;
> +	}
>  	return ret;
>  }
 
Erase isn't always synchronous. It can return success (i.e. erase queued
successfully) and later call the callback with an indication of failure.

-- 
dwmw2
