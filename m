Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwhR6-00050u-5q
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2011 20:53:49 +0000
Received: by eyh6 with SMTP id 6so1679461eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Mar 2011 12:53:45 -0800 (PST)
Subject: Re: [PATCH] Handle high-order allocation failures in
	ubifs_jnl_write_data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <AANLkTim9F8R10hn2hSrAtXt5hsHZmTYNER5gOOy-dC9U@mail.gmail.com>
References: <AANLkTim9F8R10hn2hSrAtXt5hsHZmTYNER5gOOy-dC9U@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 07 Mar 2011 21:55:15 +0200
Message-ID: <1299527715.27552.4.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: t.stanislaws@samsung.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-03-04 at 17:55 -0500, Matthew L. Creech wrote:
> Running kernel 2.6.37, my PPC-based device occasionally gets an
> order-2 allocation failure in UBIFS, which causes the root FS to
> become unwritable:
> 
> kswapd0: page allocation failure. order:2, mode:0x4050
> Call Trace:
> [c787dc30] [c00085b8] show_stack+0x7c/0x194 (unreliable)
> [c787dc70] [c0061aec] __alloc_pages_nodemask+0x4f0/0x57c
> [c787dd00] [c0061b98] __get_free_pages+0x20/0x50
> [c787dd10] [c00e4f88] ubifs_jnl_write_data+0x54/0x200
> [c787dd50] [c00e82d4] do_writepage+0x94/0x198
> [c787dd90] [c00675e4] shrink_page_list+0x40c/0x77c
> [c787de40] [c0067de0] shrink_inactive_list+0x1e0/0x370
> [c787de90] [c0068224] shrink_zone+0x2b4/0x2b8
> [c787df00] [c0068854] kswapd+0x408/0x5d4
> [c787dfb0] [c0037bcc] kthread+0x80/0x84
> [c787dff0] [c000ef44] kernel_thread+0x4c/0x68
> 
> Similar problems were encountered last April by Tomasz Stanislawski:
> 
> http://patchwork.ozlabs.org/patch/50965/
> 
> This patch implements Artem's suggested fix: fall back to a
> mutex-protected static buffer, allocated at mount time.  I tested it
> by forcing execution down the failure path, and didn't see any ill
> effects.  Any feedback is appreciated, thanks!
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>
> ---
>  fs/ubifs/journal.c |   24 +++++++++++++++++-------
>  fs/ubifs/super.c   |    1 +
>  fs/ubifs/ubifs.h   |   16 ++++++++++++++++
>  3 files changed, 34 insertions(+), 7 deletions(-)
> 
> diff -purN orig/fs/ubifs/journal.c linux-2.6.37/fs/ubifs/journal.c
> --- orig/fs/ubifs/journal.c	2011-03-04 15:44:41.568667187 -0500
> +++ linux-2.6.37/fs/ubifs/journal.c	2011-03-04 17:28:01.878665040 -0500
> @@ -689,8 +689,8 @@ int ubifs_jnl_write_data(struct ubifs_in
>  			 const union ubifs_key *key, const void *buf, int len)
>  {
>  	struct ubifs_data_node *data;
> -	int err, lnum, offs, compr_type, out_len;
> -	int dlen = UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR;
> +	int err, lnum, offs, compr_type, out_len, allocated = 1;
> +	int dlen = UBIFS_JNL_DATA_NODE_SZ;
>  	struct ubifs_inode *ui = ubifs_inode(inode);
> 
>  	dbg_jnl("ino %lu, blk %u, len %d, key %s",
> @@ -698,9 +698,13 @@ int ubifs_jnl_write_data(struct ubifs_in
>  		DBGKEY(key));
>  	ubifs_assert(len <= UBIFS_BLOCK_SIZE);
> 
> -	data = kmalloc(dlen, GFP_NOFS);
> -	if (!data)
> -		return -ENOMEM;
> +	data = kmalloc(dlen, GFP_NOFS | __GFP_NOWARN);
> +	if (!data) {
> +		/* If kmalloc() fails, fall back to using a shared buffer */
> +		allocated = 0;
> +		mutex_lock(&c->write_reserve_mutex);
> +		data = &c->write_reserve.node;
> +	}
> 
>  	data->ch.node_type = UBIFS_DATA_NODE;
>  	key_write(c, key, &data->key);
> @@ -736,7 +740,10 @@ int ubifs_jnl_write_data(struct ubifs_in
>  		goto out_ro;
> 
>  	finish_reservation(c);
> -	kfree(data);
> +	if (!allocated)
> +		mutex_unlock(&c->write_reserve_mutex);
> +	else
> +		kfree(data);
>  	return 0;
> 
>  out_release:
> @@ -745,7 +752,10 @@ out_ro:
>  	ubifs_ro_mode(c, err);
>  	finish_reservation(c);
>  out_free:
> -	kfree(data);
> +	if (!allocated)
> +		mutex_unlock(&c->write_reserve_mutex);
> +	else
> +		kfree(data);
>  	return err;
>  }
> 
> diff -purN orig/fs/ubifs/super.c linux-2.6.37/fs/ubifs/super.c
> --- orig/fs/ubifs/super.c	2011-03-04 15:44:41.568667187 -0500
> +++ linux-2.6.37/fs/ubifs/super.c	2011-03-04 16:56:35.628665311 -0500
> @@ -1929,6 +1929,7 @@ static int ubifs_fill_super(struct super
>  	mutex_init(&c->mst_mutex);
>  	mutex_init(&c->umount_mutex);
>  	mutex_init(&c->bu_mutex);
> +	mutex_init(&c->write_reserve_mutex);
>  	init_waitqueue_head(&c->cmt_wq);
>  	c->buds = RB_ROOT;
>  	c->old_idx = RB_ROOT;
> diff -purN orig/fs/ubifs/ubifs.h linux-2.6.37/fs/ubifs/ubifs.h
> --- orig/fs/ubifs/ubifs.h	2011-03-04 15:44:41.568667187 -0500
> +++ linux-2.6.37/fs/ubifs/ubifs.h	2011-03-04 17:03:28.408664874 -0500
> @@ -158,6 +158,19 @@
>  #define UBIFS_MAX_BULK_READ 32
> 
>  /*
> + * How much space is needed for a single write buffer when writing out a
> + * journal data node.
> + */
> +#define UBIFS_JNL_DATA_NODE_SZ \
> +	(UBIFS_DATA_NODE_SZ + UBIFS_BLOCK_SIZE * WORST_COMPR_FACTOR)
> +
> +/* Used as a static buffer for journal writes, in case kmalloc() fails */
> +union ubifs_write_reserve_buf {
> +	struct ubifs_data_node node;
> +	__u8 buf[UBIFS_JNL_DATA_NODE_SZ];
> +};

Hi, I have not looked closely to this, but it generally looks ok, I
review better a bit later. However, one quick comment is that this union
is not needed. Please, just add a 'void *' buffer straight to 'struct
ubifs_info' instead, and allocate it dynamically.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
