Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmVxX-0005a5-Qd
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 16:28:24 +0000
Message-ID: <49CA5B8F.7040502@users.sourceforge.net>
Date: Wed, 25 Mar 2009 17:27:59 +0100
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Andrew Klossner <andrew@cesa.opbu.xerox.com>
Subject: Re: [PATCH] drivers/mtd/chips/cfi_cmdset_0001.c: correct block lock
	timeout
References: <200903241814.n2OIEdBZ026558@pogo.cesa.opbu.xerox.com>
In-Reply-To: <200903241814.n2OIEdBZ026558@pogo.cesa.opbu.xerox.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Klossner wrote:
> The time parameters to WAIT_TIMEOUT are in units of microseconds, so
> one second must be expressed as 1000000 not 1000000/HZ.
> 
> The Intel Strataflash part with which this patch was tested takes 0.7
> seconds to lock/unlock, so one second does indeed seem to be a good
> timeout value.
> 
> Signed-off-by: Andrew Klossner <andrew@cesa.opbu.xerox.com>
> ---
> diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
> index f5ab6fa..97f3c71 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c
> @@ -2041,7 +2041,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
>  	 * If Instant Individual Block Locking supported then no need
>  	 * to delay.
>  	 */
> -	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;
> +	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000 : 0;
>  
>  	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
>  	if (ret) {

If I'm not mistaken, this will change the minimum sleep time to half a second
for set lock-bit operations as well (for !XIP). Aren't those in the usec range?

The last argument to WAIT_TIMEOUT(), udelay_max, is the actual timeout.
It should have been 'udelay * HZ', i.e. it would have worked for HZ=100 but not for HZ=1000.
(The J5 datasheet says 7 seconds max clear lock-bit time, so times 10 might even be in place.)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b234ab9..d2e4fdf 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2069,7 +2069,7 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 	 */
 	udelay = (!extp || !(extp->FeatureSupport & (1 << 5))) ? 1000000/HZ : 0;

-	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * 100);
+	ret = WAIT_TIMEOUT(map, chip, adr, udelay, udelay * HZ * 10);
 	if (ret) {
 		map_write(map, CMD(0x70), adr);
 		chip->state = FL_STATUS;
