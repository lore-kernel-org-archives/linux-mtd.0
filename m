Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtG5U-0007nc-27
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 08:33:04 +0000
Received: by fxm12 with SMTP id 12so4627599fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 01:32:57 -0700 (PDT)
Subject: Re: [PATCH] cmd line partitions: use 64 bit variables to detect
	partitions/offsets larger than 4G.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Saeed Bishara <saeed@marvell.com>
In-Reply-To: <1283852918-9141-1-git-send-email-saeed@marvell.com>
References: <1283849765.2979.22.camel@localhost>
	<1283852918-9141-1-git-send-email-saeed@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Sep 2010 11:31:26 +0300
Message-ID: <1283934686.2979.58.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-07 at 12:48 +0300, Saeed Bishara wrote:
> Signed-off-by: Saeed Bishara <saeed@marvell.com>
> ---
>  drivers/mtd/cmdlinepart.c |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
> index 1479da6..80036d1 100644
> --- a/drivers/mtd/cmdlinepart.c
> +++ b/drivers/mtd/cmdlinepart.c
> @@ -41,8 +41,8 @@
>  
> 
>  /* special size referring to all the remaining space in a partition */
> -#define SIZE_REMAINING UINT_MAX
> -#define OFFSET_CONTINUOUS UINT_MAX
> +#define SIZE_REMAINING LLONG_MAX
> +#define OFFSET_CONTINUOUS LLONG_MAX

Should be ULLONG_MAX since you use unsigned long long and also offsets
in 'struct mtd_partition' uses uint64_t.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
