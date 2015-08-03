Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMMmg-0000UY-P2
 for linux-mtd@lists.infradead.org; Mon, 03 Aug 2015 20:56:35 +0000
Subject: Re: [PATCH v2 14/35] ubifs: extend budget for blocks
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-15-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55BFD56B.3070904@nod.at>
Date: Mon, 3 Aug 2015 22:56:11 +0200
MIME-Version: 1.0
In-Reply-To: <1438235311-23788-15-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> Currently, budget subsystem in ubifs are working on budgeting
> page-by-page. But sometimes we want to budget a space for one
> block, e.g for quota file writing. So this commit extend budget
> subsystem to support blocks budgeting and releasing.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  fs/ubifs/budget.c | 4 ++++
>  fs/ubifs/debug.c  | 2 ++
>  fs/ubifs/super.c  | 1 +
>  fs/ubifs/ubifs.h  | 5 +++++
>  4 files changed, 12 insertions(+)
> 
> diff --git a/fs/ubifs/budget.c b/fs/ubifs/budget.c
> index 11a11b3..ba4e530 100644
> --- a/fs/ubifs/budget.c
> +++ b/fs/ubifs/budget.c
> @@ -397,6 +397,8 @@ static int calc_data_growth(const struct ubifs_info *c,
>  		data_growth += c->bi.page_budget;
>  	if (req->new_dent)
>  		data_growth += c->bi.dent_budget;
> +	if (req->new_block_num)
> +		data_growth += c->bi.block_budget * req->new_block_num;
>  	data_growth += req->new_ino_d;
>  	return data_growth;
>  }
> @@ -418,6 +420,8 @@ static int calc_dd_growth(const struct ubifs_info *c,
>  		dd_growth += c->bi.inode_budget << (req->dirtied_ino - 1);
>  	if (req->mod_dent)
>  		dd_growth += c->bi.dent_budget;
> +	if (req->dirtied_block_num)
> +		dd_growth += c->bi.block_budget * req->dirtied_block_num;
>  	dd_growth += req->dirtied_ino_d;
>  	return dd_growth;
>  }
> diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
> index 4c46a98..cafd592 100644
> --- a/fs/ubifs/debug.c
> +++ b/fs/ubifs/debug.c
> @@ -556,6 +556,8 @@ void ubifs_dump_budget_req(const struct ubifs_budget_req *req)
>  	       req->new_page, req->dirtied_page);
>  	pr_err("\tnew_dent    %d, mod_dent     %d\n",
>  	       req->new_dent, req->mod_dent);
> +	pr_err("\tnew_block   %d, dirtied_block %d\n",
> +	       req->new_block_num, req->dirtied_block_num);
>  	pr_err("\tidx_growth  %d\n", req->idx_growth);
>  	pr_err("\tdata_growth %d dd_growth     %d\n",
>  	       req->data_growth, req->dd_growth);
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index c643261..eb04e42 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -698,6 +698,7 @@ static int init_constants_sb(struct ubifs_info *c)
>  	c->bi.page_budget = UBIFS_MAX_DATA_NODE_SZ * UBIFS_BLOCKS_PER_PAGE;
>  	c->bi.inode_budget = UBIFS_INO_NODE_SZ;
>  	c->bi.dent_budget = UBIFS_MAX_DENT_NODE_SZ;
> +	c->bi.block_budget = UBIFS_MAX_DATA_NODE_SZ;
>  
>  	/*
>  	 * When the amount of flash space used by buds becomes
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 3b5e932..71b79b5 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -861,6 +861,8 @@ struct ubifs_compressor {
>   * @new_ino_d: how much data newly created inode contains
>   * @dirtied_ino: how many inodes the operation makes dirty
>   * @dirtied_ino_d: how much data dirtied inode contains
> + * @new_block_num: how many new blocks
> + * @dirtied_block_num: how many dirtied blocks

What are the semantics of these new fields?
e.g. is it allowed to set both new_block_num and new_dent?

>   * @idx_growth: how much the index will supposedly grow
>   * @data_growth: how much new data the operation will supposedly add
>   * @dd_growth: how much data that makes other data dirty the operation will
> @@ -902,6 +904,8 @@ struct ubifs_budget_req {
>  	unsigned int dirtied_ino;
>  	unsigned int dirtied_ino_d;
>  #endif
> +	unsigned int new_block_num;
> +	unsigned int dirtied_block_num;

Why are these not under UBIFS_DEBUG?
I like the overflow checks.

Thanks,
//richard
