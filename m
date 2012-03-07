Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5NRs-0001s9-Bi
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 20:27:01 +0000
Received: by wiwc10 with SMTP id c10so3978906wiw.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Mar 2012 12:26:58 -0800 (PST)
Date: Wed, 7 Mar 2012 22:26:53 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: ubi: suspicious calculation in 'ubi_wl_get_peb'
Message-ID: <20120307222653.7aeb7b9f@halley>
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

> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Date: Wed, 7 Mar 2012 18:56:29 +0200
> Subject: [PATCH 1/2] UBI: fix documentation and improve readability
> 
> The "max" parameter of 'find_wl_entry()' was documented incorrectly and
> it actually means the maximum possible difference, not the maximum absolute

maybe better:
it actually means the maximum possible difference from smallest erase counter

> value. Rename it to "diff" instead, and amend the documentation.
> 
> Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> ---
>  drivers/mtd/ubi/wl.c |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
> index 0696e36..10d7b98 100644
> --- a/drivers/mtd/ubi/wl.c
> +++ b/drivers/mtd/ubi/wl.c
> @@ -350,18 +350,19 @@ static void prot_queue_add(struct ubi_device *ubi, struct ubi_wl_entry *e)
>  /**
>   * find_wl_entry - find wear-leveling entry closest to certain erase counter.
>   * @root: the RB-tree where to look for
> - * @max: highest possible erase counter
> + * @diff: highest possible erase counter difference

again (add: "from smallest...") - unless you think its cumbersome

>   *
>   * This function looks for a wear leveling entry with erase counter closest to
> - * @max and less than @max.
> + * min + @diff, where min is the currently smallest erase counter.
>   */
> -static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
> +static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int diff)
>  {
>  	struct rb_node *p;
>  	struct ubi_wl_entry *e;
> +	int max;
>  
>  	e = rb_entry(rb_first(root), struct ubi_wl_entry, u.rb);
> -	max += e->ec;
> +	max = e->ec + diff;
>  
>  	p = root->rb_node;
>  	while (p) {

other than that,
Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
