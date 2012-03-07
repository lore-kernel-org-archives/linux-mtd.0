Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5NiN-0003Pz-5k
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 20:44:03 +0000
Received: by wiwc10 with SMTP id c10so3990931wiw.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Mar 2012 12:44:01 -0800 (PST)
Date: Wed, 7 Mar 2012 22:43:55 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: ubi: suspicious calculation in 'ubi_wl_get_peb'
Message-ID: <20120307224355.0e53e418@halley>
In-Reply-To: <1331140808.3463.28.camel@sauron.fi.intel.com>
References: <20120217153828.71eba4e4@pixies.home.jungo.com>
 <1331140808.3463.28.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <rw@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 07 Mar 2012 19:20:08 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 7 Mar 2012 19:08:36 +0200
> Subject: [PATCH 2/2] UBI: fix eraseblock picking criteria
> 
> The 'find_wl_entry()' function expects the maximum difference as the second
> argument, not the maximum absolute value. So the "unknown" eraseblock picking
> was incorrect, as Shmulik Ladkani spotted. This patch fixes the issue.
> 
> Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: stable@kernel.org
> ---
>  drivers/mtd/ubi/wl.c |    8 +++-----
>  1 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 10d7b98..051cb3a 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -390,7 +390,7 @@ static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
>   */
>  int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
>  {
> -	int err, medium_ec;
> +	int err;
>  	struct ubi_wl_entry *e, *first, *last;
>  
>  	ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
> @@ -437,10 +437,8 @@ retry:
>  		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
>  			e = rb_entry(ubi->free.rb_node,
>  					struct ubi_wl_entry, u.rb);
> -		else {
> -			medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
> -			e = find_wl_entry(&ubi->free, medium_ec);
> -		}
> +		else
> +			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
>  		break;
>  	case UBI_SHORTTERM:
>  		/*

Unfortunately, currently unable to give it a runtime test, sorry.

Also, I suspect the remark:
		 * erase counter. But we by no means can pick a physical
		 * eraseblock with erase counter greater or equivalent than the
		 * lowest erase counter plus %WL_FREE_MAX_DIFF.

Should be fixed as well:
-		 * lowest erase counter plus %WL_FREE_MAX_DIFF.
+		 * lowest erase counter plus %WL_FREE_MAX_DIFF/2.

Other than that, looks correct.

Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
