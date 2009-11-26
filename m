Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NDYQI-0001zz-4s
	for linux-mtd@lists.infradead.org; Thu, 26 Nov 2009 07:05:54 +0000
Subject: Re: [PATCH] JFFS2: min/max confusion?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roel Kluin <roel.kluin@gmail.com>
In-Reply-To: <4B08088C.8050305@gmail.com>
References: <4B08088C.8050305@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Nov 2009 09:05:25 +0200
Message-Id: <1259219125.29118.41.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-11-21 at 16:34 +0100, Roel Kluin wrote:
> MAX_SUMMARY_SIZE was meant as a limit, not as a minimum
> 
> Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
> ---
>  fs/jffs2/summary.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> unless I am mistaken?
> 
> diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
> index 6caf1e1..800171d 100644
> --- a/fs/jffs2/summary.c
> +++ b/fs/jffs2/summary.c
> @@ -23,7 +23,7 @@
>  
>  int jffs2_sum_init(struct jffs2_sb_info *c)
>  {
> -	uint32_t sum_size = max_t(uint32_t, c->sector_size, MAX_SUMMARY_SIZE);
> +	uint32_t sum_size = min_t(uint32_t, c->sector_size, MAX_SUMMARY_SIZE);
>  
>  	c->summary = kzalloc(sizeof(struct jffs2_summary), GFP_KERNEL);

This looks right, I've pushed your patch to my l2-mtd tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
