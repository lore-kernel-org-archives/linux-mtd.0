Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U1GXM-0007wB-6O
 for linux-mtd@lists.infradead.org; Fri, 01 Feb 2013 13:20:13 +0000
Message-ID: <510BC1DF.7010506@intel.com>
Date: Fri, 01 Feb 2013 15:23:43 +0200
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Adam Thomas <adamthomas1111@gmail.com>
Subject: Re: [PATCH 2/2] UBIFS: fix double free of ubifs_orphan objects
References: <1359336513-6259-1-git-send-email-adamthomas1111@gmail.com>
 <1359336513-6259-3-git-send-email-adamthomas1111@gmail.com>
In-Reply-To: <1359336513-6259-3-git-send-email-adamthomas1111@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28/01/13 03:28, Adam Thomas wrote:
> The last orphan in the dnext list has its dnext set to NULL. Because
> of that, ubifs_delete_orphan assumes that it is not on the dnext list
> and frees it immediately instead ignoring it as a second delete. The
> orphan is later freed again by erase_deleted.

In fact, unless something has gone wrong, an inode is only ever deleted once.

> 
> This change adds an explicit flag to ubifs_orphan indicating whether
> it is pending delete.

Needs an signed-off line.

Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  fs/ubifs/orphan.c |    5 ++++-
>  fs/ubifs/ubifs.h  |    2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
> index 8433f53..071d607 100644
> --- a/fs/ubifs/orphan.c
> +++ b/fs/ubifs/orphan.c
> @@ -126,13 +126,14 @@ void ubifs_delete_orphan(struct ubifs_info *c, ino_t inum)
>  		else if (inum > o->inum)
>  			p = p->rb_right;
>  		else {
> -			if (o->dnext) {
> +			if (o->del) {
>  				spin_unlock(&c->orphan_lock);
>  				dbg_gen("deleted twice ino %lu",
>  					(unsigned long)inum);
>  				return;
>  			}
>  			if (o->cmt) {
> +				o->del = 1;
>  				o->dnext = c->orph_dnext;
>  				c->orph_dnext = o;
>  				spin_unlock(&c->orphan_lock);
> @@ -446,6 +447,7 @@ static void erase_deleted(struct ubifs_info *c)
>  		orphan = dnext;
>  		dnext = orphan->dnext;
>  		ubifs_assert(!orphan->new);
> +		ubifs_assert(orphan->del);
>  		rb_erase(&orphan->rb, &c->orph_tree);
>  		list_del(&orphan->list);
>  		c->tot_orphans -= 1;
> @@ -535,6 +537,7 @@ static int insert_dead_orphan(struct ubifs_info *c, ino_t inum)
>  	rb_link_node(&orphan->rb, parent, p);
>  	rb_insert_color(&orphan->rb, &c->orph_tree);
>  	list_add_tail(&orphan->list, &c->orph_list);
> +	orphan->del = 1;
>  	orphan->dnext = c->orph_dnext;
>  	c->orph_dnext = orphan;
>  	dbg_mnt("ino %lu, new %d, tot %d", (unsigned long)inum,
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index c16fff7..b2babce 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -905,6 +905,7 @@ struct ubifs_budget_req {
>   * @inum: inode number
>   * @new: %1 => added since the last commit, otherwise %0
>   * @cmt: %1 => commit pending, otherwise %0
> + * @del: %1 => delete pending, otherwise %0
>   */
>  struct ubifs_orphan {
>  	struct rb_node rb;
> @@ -915,6 +916,7 @@ struct ubifs_orphan {
>  	ino_t inum;
>  	unsigned new:1;
>  	unsigned cmt:1;
> +	unsigned del:1;
>  };
>  
>  /**
> 
