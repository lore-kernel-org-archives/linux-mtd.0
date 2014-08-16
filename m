Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XISo1-0006uS-1Z
 for linux-mtd@lists.infradead.org; Sat, 16 Aug 2014 01:29:17 +0000
Received: by mail-pd0-f172.google.com with SMTP id y13so4188012pdi.31
 for <linux-mtd@lists.infradead.org>; Fri, 15 Aug 2014 18:28:55 -0700 (PDT)
Date: Fri, 15 Aug 2014 18:28:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Wu <Aaron.wu@analog.com>
Subject: Re: [PATCH] [mtd] gpio_flash: fix the bug in handling gpio flash
 read/write when offset + len from mtd exceeds the window size
Message-ID: <20140816012852.GI18411@ld-irv-0074>
References: <1407383029-24290-1-git-send-email-Aaron.wu@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407383029-24290-1-git-send-email-Aaron.wu@analog.com>
Cc: dwmw2@infradead.org, sonic.zhang@analog.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 07, 2014 at 11:43:49AM +0800, Aaron Wu wrote:
> Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
> 
> fix the bug in handling gpio flash read/write when offset + len
> from mtd exceeds the window size

Typically, you should have the commit message comments before the
'Signed-off-by'.

> ---
>  drivers/mtd/maps/gpio-addr-flash.c |   43 ++++++++++++++++++++++++------------
>  1 file changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
> index a4c477b..947631a 100644
> --- a/drivers/mtd/maps/gpio-addr-flash.c
> +++ b/drivers/mtd/maps/gpio-addr-flash.c
> @@ -99,22 +99,29 @@ static map_word gf_read(struct map_info *map, unsigned long ofs)
>   *	@from: flash offset to copy from
>   *	@len:  how much to copy
>   *
> - * We rely on the MTD layer to chunk up copies such that a single request here
> - * will not cross a window size.  This allows us to only wiggle the GPIOs once
> - * before falling back to a normal memcpy.  Reading the higher layer code shows
> - * that this is indeed the case, but add a BUG_ON() to future proof.
> + *Toggle the correct GPIO according to @from to enable the right flash bank,
> + *still the read offset plus len may execceds the actual Window size,when
> + *this happnes, reverts the value for multiple read until all data is read.
>   */

The spacing and wording is a little off, so I reworded this. Queued to
l2-mtd.git/next, with the following diff applied:

diff --git a/drivers/mtd/maps/gpio-addr-flash.c b/drivers/mtd/maps/gpio-addr-flash.c
index 947631a329f7..2fb346091af2 100644
--- a/drivers/mtd/maps/gpio-addr-flash.c
+++ b/drivers/mtd/maps/gpio-addr-flash.c
@@ -99,9 +99,8 @@ static map_word gf_read(struct map_info *map, unsigned long ofs)
  *	@from: flash offset to copy from
  *	@len:  how much to copy
  *
- *Toggle the correct GPIO according to @from to enable the right flash bank,
- *still the read offset plus len may execceds the actual Window size,when
- *this happnes, reverts the value for multiple read until all data is read.
+ * The "from" region may straddle more than one window, so toggle the GPIOs for
+ * each window region before reading its data.
  */
 static void gf_copy_from(struct map_info *map, void *to, unsigned long from, ssize_t len)
 {

Thanks,
Brian
