Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYqZ7-0004S8-Oo
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 09:51:31 +0000
Date: Tue, 9 Jan 2018 10:51:08 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, kernel@pengutronix.de
Subject: Re: [PATCH v2] mtd: tests: nandbiterrs: Fix read_page return value
Message-ID: <20180109105108.4ece18cf@bbrezillon>
In-Reply-To: <20180109094702.21488-1-s.hauer@pengutronix.de>
References: <20180109094702.21488-1-s.hauer@pengutronix.de>
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

On Tue,  9 Jan 2018 10:47:02 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> The number of corrected bitflips is not correctly reported by
> the test until the bitflip threshold is reached.
> 
> read_page() shall return the number of corrected bitflips, but
> mtd_read() returns 0 or a negative error, so we can't forward
> its return value. In the absence of an error we always have
> calculate the number of bitflips ourselves.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

I'll apply this patch, but you should really start using the userspace
tests provided by mtd-utils, because I still plan to remove the
in-kernel test modules at some point ;-).

> ---
>  drivers/mtd/tests/nandbiterrs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
> index 5f03b8c885a9..cde19c99e77b 100644
> --- a/drivers/mtd/tests/nandbiterrs.c
> +++ b/drivers/mtd/tests/nandbiterrs.c
> @@ -151,7 +151,7 @@ static int read_page(int log)
>  	memcpy(&oldstats, &mtd->ecc_stats, sizeof(oldstats));
>  
>  	err = mtd_read(mtd, offset, mtd->writesize, &read, rbuffer);
> -	if (err == -EUCLEAN)
> +	if (!err || err == -EUCLEAN)
>  		err = mtd->ecc_stats.corrected - oldstats.corrected;
>  
>  	if (err < 0 || read != mtd->writesize) {
