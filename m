Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yb46y-0006PO-Tp
 for linux-mtd@lists.infradead.org; Thu, 26 Mar 2015 09:30:01 +0000
Message-ID: <5513D17F.2080309@nod.at>
Date: Thu, 26 Mar 2015 10:29:35 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 4/5] UBI: fix check for "too many bytes"
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
 <1425119009-28634-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-5-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.02.2015 um 11:23 schrieb Brian Norris:
> The comparison from the previous line seems to have been erroneously
> (partially) copied-and-pasted onto the next. The second line should be
> checking req.bytes, not req.lnum.
> 
> Coverity CID #139400
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/ubi/cdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
> index d647e504f9b1..7691a2a015cb 100644
> --- a/drivers/mtd/ubi/cdev.c
> +++ b/drivers/mtd/ubi/cdev.c
> @@ -455,7 +455,7 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
>  		/* Validate the request */
>  		err = -EINVAL;
>  		if (req.lnum < 0 || req.lnum >= vol->reserved_pebs ||
> -		    req.bytes < 0 || req.lnum >= vol->usable_leb_size)
> +		    req.bytes < 0 || req.bytes >= vol->usable_leb_size)
>  			break;

Testing uncovered an issue with that.
The comparison should be "req.bytes > vol->usable_leb_size" as
we're allowed to write with usable_leb_size.
There is no need to re-send, I'll fix the patch myself.

Thanks,
//richard
