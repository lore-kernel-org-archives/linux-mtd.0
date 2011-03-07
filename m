Received: from mail-yx0-f177.google.com ([209.85.213.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwXP8-0008EF-NV
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 10:11:07 +0000
Received: by yxh35 with SMTP id 35so1694131yxh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 02:11:05 -0800 (PST)
Subject: Re: Bug in mtd_speedtest?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Lambert <dave@lambsys.com>
In-Reply-To: <4D71270E.9030204@lambsys.com>
References: <4D70280E.8030501@lambsys.com>
	<1299221982.2735.7.camel@localhost>  <4D71270E.9030204@lambsys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 12:09:40 +0200
Message-ID: <1299492580.2746.25.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-04 at 11:53 -0600, David Lambert wrote:
> Artem,
>      Please find attached patch.

Thank you, but you made pretty good job to prevent me from applying
it! :-)

> Index: mtd_speedtest.c
> ===================================================================
> RCS
> file: /home/cvsroot/ECMB/src/snapgear/linux-2.6.30.1.x/drivers/mtd/tests/mtd_speedtest.c,v
> retrieving revision 1.1.1.1
> diff -u -r1.1.1.1 mtd_speedtest.c

This means git am won't work... neither patch -p1 ...
Also, not author name (From:), not commit message, not Signed-off-by...

> --- mtd_speedtest.c     10 Aug 2009 19:42:00 -0000      1.1.1.1
> +++ mtd_speedtest.c     4 Mar 2011 17:51:23 -0000
> @@ -281,13 +281,14 @@
>  
>  static long calc_speed(void)
>  {
> -       long ms, k, speed;
> +       uint64_t k;
> +       long ms;
>  
> -       ms = (finish.tv_sec - start.tv_sec) * 1000 +
> -            (finish.tv_usec - start.tv_usec) / 1000;
> -       k = goodebcnt * mtd->erasesize / 1024;
> -       speed = (k * 1000) / ms;
> -       return speed;
> +       ms = (finish.tv_sec - start.tv_sec) * 1000 + /* Time in milli-seconds from start to ...*/
> +            (finish.tv_usec - start.tv_usec) / 1000;     /* finish */

This would not pass scripts/checkpatch.pl. Please, kill the comments.
Also, I you use spaces instead of tabs...

> +       k = (goodebcnt * (mtd->erasesize / 1024) * 1000); /* Number of kBytes transferred * 1000 */
> +       do_div(k, ms);    /* k now contains number of kBytes/second */

The old code had a check against ms == 0, you removed it, why?

> +       return k;

Anyway, since I anyway spent 20 minutes with this patch, here is what I
ended up. I've pushed it to my l2 tree. If I made a mistake or you are
unhappy about it, please, send your *properly formatted* version
instead.

Thanks!

>From 008cfa97a772a83407a7e2657c0c5bfe36c7fc7f Mon Sep 17 00:00:00 2001
From: David Lambert <dave@lambsys.com>
Date: Mon, 7 Mar 2011 12:00:46 +0200
Subject: [PATCH] mtd: speedtest: fix integer overflow

32-bit integers used in 'calc_speed()' may overflow and lead to
incorrect results. Use 64-bit integers instead.

Signed-off-by: David Lambert <dave@lambsys.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 drivers/mtd/tests/mtd_speedtest.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/tests/mtd_speedtest.c b/drivers/mtd/tests/mtd_speedtest.c
index 3ce6fce..22b51c1 100644
--- a/drivers/mtd/tests/mtd_speedtest.c
+++ b/drivers/mtd/tests/mtd_speedtest.c
@@ -314,16 +314,16 @@ static inline void stop_timing(void)
 
 static long calc_speed(void)
 {
-	long ms, k, speed;
+       uint64_t k;
+       long ms;
 
 	ms = (finish.tv_sec - start.tv_sec) * 1000 +
 	     (finish.tv_usec - start.tv_usec) / 1000;
-	k = goodebcnt * mtd->erasesize / 1024;
-	if (ms)
-		speed = (k * 1000) / ms;
-	else
-		speed = 0;
-	return speed;
+	if (ms == 0)
+		return 0;
+	k = goodebcnt * (mtd->erasesize / 1024) * 1000;
+	do_div(k, ms);
+	return k;
 }
 
 static int scan_for_bad_eraseblocks(void)
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
