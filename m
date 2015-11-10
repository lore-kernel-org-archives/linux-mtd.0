Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwHzI-0002Ea-H7
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 23:06:05 +0000
Received: by pabfh17 with SMTP id fh17so10822978pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 10 Nov 2015 15:05:43 -0800 (PST)
Date: Tue, 10 Nov 2015 15:05:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Abhilash Jindal <klock.android@gmail.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 Arnd Bergmann <arnd@arndb.de>, Shraddha Barke <shraddha.6596@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: tests: Use boottime
Message-ID: <20151110230540.GT12143@google.com>
References: <1439309774-12539-1-git-send-email-klock.android@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439309774-12539-1-git-send-email-klock.android@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ others

On Tue, Aug 11, 2015 at 12:16:14PM -0400, Abhilash Jindal wrote:
> Wall time obtained from do_gettimeofday is susceptible to sudden jumps due to
> user setting the time or due to NTP.  Boot time is constantly increasing time
> better suited for comparing two timestamps.
> 
> Signed-off-by: Abhilash Jindal <klock.android@gmail.com>

Sorry, didn't notice this one earlier. We've merged an alternative patch
that uses ktime_get():

commit af30c0a00aa0d086a820c2ec75544c07611834d7
Author: Shraddha Barke <shraddha.6596@gmail.com>
Date:   Thu Oct 22 20:29:54 2015 +0530

    mtd: tests: Replace timeval with ktime_t

>From reading the API description, it's not really clear to me if
ktime_get() includes NTP jumps or not.

In any case, if you still need this patch, please rebase on the latest
-next.

Regards,
Brian

> ---
>  drivers/mtd/tests/speedtest.c   |    9 ++++-----
>  drivers/mtd/tests/torturetest.c |    9 ++++-----
>  2 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
> index 5a6f31a..854b707 100644
> --- a/drivers/mtd/tests/speedtest.c
> +++ b/drivers/mtd/tests/speedtest.c
> @@ -49,7 +49,7 @@ static int pgsize;
>  static int ebcnt;
>  static int pgcnt;
>  static int goodebcnt;
> -static struct timeval start, finish;
> +static ktime_t start, finish;
>  
>  static int multiblock_erase(int ebnum, int blocks)
>  {
> @@ -168,12 +168,12 @@ static int read_eraseblock_by_2pages(int ebnum)
>  
>  static inline void start_timing(void)
>  {
> -	do_gettimeofday(&start);
> +	start = ktime_get_boottime();
>  }
>  
>  static inline void stop_timing(void)
>  {
> -	do_gettimeofday(&finish);
> +	finish = ktime_get_boottime();
>  }
>  
>  static long calc_speed(void)
> @@ -181,8 +181,7 @@ static long calc_speed(void)
>  	uint64_t k;
>  	long ms;
>  
> -	ms = (finish.tv_sec - start.tv_sec) * 1000 +
> -	     (finish.tv_usec - start.tv_usec) / 1000;
> +	ms = ktime_to_ms(ktime_sub(finish, start));
>  	if (ms == 0)
>  		return 0;
>  	k = (uint64_t)goodebcnt * (mtd->erasesize / 1024) * 1000;
> diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
> index e5d6e6d..228023a 100644
> --- a/drivers/mtd/tests/torturetest.c
> +++ b/drivers/mtd/tests/torturetest.c
> @@ -79,18 +79,18 @@ static unsigned char *check_buf;
>  static unsigned int erase_cycles;
>  
>  static int pgsize;
> -static struct timeval start, finish;
> +static ktime_t start, finish;
>  
>  static void report_corrupt(unsigned char *read, unsigned char *written);
>  
>  static inline void start_timing(void)
>  {
> -	do_gettimeofday(&start);
> +	start = ktime_get_boottime();
>  }
>  
>  static inline void stop_timing(void)
>  {
> -	do_gettimeofday(&finish);
> +	finish = ktime_get_boottime();
>  }
>  
>  /*
> @@ -333,8 +333,7 @@ static int __init tort_init(void)
>  			long ms;
>  
>  			stop_timing();
> -			ms = (finish.tv_sec - start.tv_sec) * 1000 +
> -			     (finish.tv_usec - start.tv_usec) / 1000;
> +			ms = ktime_to_ms(ktime_sub(finish, start));
>  			pr_info("%08u erase cycles done, took %lu "
>  			       "milliseconds (%lu seconds)\n",
>  			       erase_cycles, ms, ms / 1000);
> -- 
> 1.7.9.5
> 
