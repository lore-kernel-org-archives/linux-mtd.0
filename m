Received: from sonic308-10.consmr.mail.ne1.yahoo.com ([66.163.187.33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiKLh-0000tX-TQ
 for linux-mtd@lists.infradead.org; Wed, 25 Jul 2018 14:01:09 +0000
To: linux-mtd@lists.infradead.org
References: <20180629132256.4dtvrup4pwvbq4dd@nedap.local>
Subject: Re: [RFC PATCH] ubifs: add shrink capability
From: Martin Vuille <jpmv27@yahoo.com>
Cc: Ryan Meulenkamp <ryan.meulenkamp@nedap.com>
Message-ID: <f2ad9d18-f078-5173-0eb0-1b33e9f84018@yahoo.com>
Date: Wed, 25 Jul 2018 10:00:50 -0400
MIME-Version: 1.0
In-Reply-To: <20180629132256.4dtvrup4pwvbq4dd@nedap.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ryan,

> ubifs: Add shrink capability

I am very interested in this patch, as I need this capability and
was thinking of trying to implement myself.

If I can assist you in any way, let me know.

Meanwhile, I have a few questions/comments...

> diff --git a/fs/ubifs/resize.c b/fs/ubifs/resize.c
> new file mode 100644
> index 000000000000..772f0052b7dd
> --- /dev/null
> +++ b/fs/ubifs/resize.c
> @@ -0,0 +1,408 @@
> +/*
> + * This file is part of UBIFS.
> + *
> + * Copyright (C) 2006-2008 Nokia Corporation.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published by
> + * the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; if not, write to the Free Software Foundation, Inc., 51
> + * Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
> + *
> + * Authors: Ryan Meulenkamp
> + *          Jaap de Jong
> + */
> +
> +/*
> + * This file provides code that could be used to resize the filesystem
> + * so the surrounding volume could also be resized.
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/pagemap.h>
> +#include <linux/list_sort.h>
> +#include "ubifs.h"
> +
> +/**
> + * move_leb - Move an LEB to a new location.
> + * @c: UBIFS file-system description object
> + * @lnum: de leb number of the leb to move
> + *
> + * This function is a modification of the garbage collector.
> + */
> +int move_leb(struct ubifs_info *c, int lnum)
> +{
> +	int err, ret = 0;
> +	struct ubifs_lprops lp;
> +	struct ubifs_wbuf *wbuf = &c->jheads[GCHD].wbuf;
> +
> +	ubifs_assert(!c->ro_media && !c->ro_mount);
> +
> +	if (ubifs_gc_should_commit(c))
> +		return -EAGAIN;
> +
> +	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
> +
> +	if (c->ro_error) {
> +		ret = -EROFS;
> +		goto out_unlock;
> +	}
> +
> +	/* We expect the write-buffer to be empty on entry */
> +	ubifs_assert(!wbuf->used);
> +
> +	cond_resched();
> +
> +	/* Give the commit an opportunity to run */
> +	if (ubifs_gc_should_commit(c)) {
> +		ret = -EAGAIN;
> +		goto out_unlock;
> +	}
> +
> +	ret = ubifs_read_one_lp(c, lnum, &lp);
> +	if (ret)
> +		goto out;
> +
> +	dbg_resize("LEB %d flags: %d", lnum, lp.flags);
> +
> +	/*
> +	 * In the first part of the resize, it doesn't matter
> +	 * that not all leb's were garbage-collected. Before
> +	 * moving the second part, all journal-heads are moved
> +	 * so there won't be taken leb's in the second part.
> +	 */
> +	if (lp.flags & LPROPS_TAKEN) {
> +		ret = 0;
> +		goto out_unlock;
> +	}
> +
> +	ret = ubifs_change_one_lp(c, lnum, LPROPS_NC, LPROPS_NC,
> +			LPROPS_TAKEN, 0, 0);
> +
> +	if (ret)
> +		goto out;
> +
> +	dbg_resize("Moving LEB %d: free %d, dirty %d, sum %d",
> +			lnum, lp.free, lp.dirty, lp.free + lp.dirty);
> +
> +	ret = ubifs_garbage_collect_leb(c, &lp);
> +	if (ret < 0) {
> +		if (ret == -EAGAIN) {
> +			/*
> +			 * This is not an error, so we have to return the
> +			 * LEB to lprops. But if 'ubifs_return_leb()'
> +			 * fails, its failure code is propagated to the
> +			 * caller instead of the original '-EAGAIN'.
> +			 */
> +			err = ubifs_return_leb(c, lnum);
> +			if (err) {
> +				ret = err;
> +				goto out;
> +			}
> +		} else
> +			goto out;
> +	}
> +
> +	if (ret == LEB_FREED) {
> +		dbg_resize("LEB %d freed, return", lp.lnum);
> +		ret = ubifs_return_leb(c, lnum);
> +	}
> +
> +	if (ret == LEB_FREED_IDX) {
> +		dbg_resize("soft limit, some index LEBs GC'ed, -EAGAIN");
> +		ubifs_commit_required(c);
> +		ret = 0;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&wbuf->io_mutex);
> +	return ret;
> +
> +out:
> +	ubifs_assert(ret < 0);
> +	ubifs_assert(ret != -ENOSPC && ret != -EAGAIN);
> +	ubifs_wbuf_sync_nolock(wbuf);
> +	ubifs_ro_mode(c, ret);
> +	mutex_unlock(&wbuf->io_mutex);
> +	ubifs_return_leb(c, lp.lnum);
> +	return ret;
> +}
> +
> +/**
> + * move_lebs - Move lebs between start and end to a new location.

For consistency with existing comments, may want to change leb/lebs to LEB/LEBs

> + * @c: UBIFS file-system description object
> + * @start: de leb number of the first leb to move
> + * @end: de leb number of the last leb to move
> + *
> + * This function moves all lebs between start and end to a new
> + * location within the boundaries of c->min_leb and c->max_leb.
> + */
> +static int move_lebs(struct ubifs_info *c, int start, int end)
> +{
> +	int lnum, ret, tries;
> +
> +	for (lnum = end; lnum >= start; lnum--) {
> +retry:
> +		ret = ubifs_run_commit(c);
> +		if (ret)
> +			break;
> +
> +		down_read(&c->commit_sem);
> +		ret = move_leb(c, lnum);
> +		up_read(&c->commit_sem);
> +
> +		if (ret == -EAGAIN)
> +			goto retry;
> +		else if (ret)
> +			return ret;
> +
> +		tries = 0;

tries doesn't seem to be used for anything. Was the intent to use
it to prevent infinite number of retries?

> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * switch_head - Move the given jhead to a new leb.
> + * @c: UBIFS file-system description object
> + * @head: The head to be switched
> + *
> + * Function used to move the given journal head to another leb.
> + */
> +static int switch_head(struct ubifs_info *c, int head)
> +{
> +	int ret;
> +	struct ubifs_wbuf *wbuf = &c->jheads[head].wbuf;
> +
> +	mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);
> +	down_read(&c->commit_sem);
> +
> +	ret = ubifs_jnl_switch_head(c, head);
> +
> +	up_read(&c->commit_sem);
> +	mutex_unlock(&wbuf->io_mutex);
> +
> +	return ret;
> +}
> +
> +/**
> + * switch_gc_head - Move the gc jhead to a new leb.
> + * @c: UBIFS file-system description object
> + *
> + * Function used to move the garbage collection journal
> + * head to another leb.
> + */
> +static int switch_gc_head(struct ubifs_info *c)
> +{
> +	int offs = 0, ret, temp;
> +
> +	ret = ubifs_jnl_switch_head(c, GCHD);
> +	if (ret)
> +		return ret;
> +
> +	temp = c->gc_lnum;
> +
> +	ret = ubifs_find_free_space(c, c->leb_size, &offs, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ubifs_assert(ret >= c->min_lnum && ret <= c->max_lnum);
> +
> +	c->gc_lnum = ret;
> +
> +	return ubifs_return_leb(c, temp);
> +}
> +
> +/**
> + * shrink_to_size - Shrink the ubifs to a new size.
> + * @c: UBIFS file-system description object
> + * @leb_count: the size to fit the filesystem within.
> + *
> + * Function used to shrink ubifs, by making room and
> + * then moving all lebs outside of the new size.
> + */
> +static int shrink_to_size(struct ubifs_info *c, int leb_count)
> +{
> +	int ret;
> +
> +	c->jheads[GCHD].wbuf.lnum = -1;
> +
> +	ret = move_lebs(c, c->main_first, leb_count - 1);
> +	if (ret)
> +		return ret;
> +
> +	ret = switch_head(c, BASEHD);
> +	if (ret)
> +		return ret;
> +
> +	ret = switch_head(c, DATAHD);
> +	if (ret)
> +		return ret;
> +
> +	return move_lebs(c, leb_count, c->leb_cnt - 1);
> +}
> +
> +/**
> + * is_move_required - Check if it is even required to move anyting
> + * @c: UBIFS file-system description object
> + * @leb_count: the size to fit the filesystem within.
> + *
> + * Loop over all lebs that would be outside the new size and and check if

Typo: and and

> + * there are ones there that are used at all.
> + */
> +static int is_move_required(struct ubifs_info *c, int leb_count) {
> +	int lnum, ret;
> +	struct ubifs_lprops lp;
> +
> +	for (lnum = leb_count; lnum < c->leb_cnt; lnum++) {
> +		ret = ubifs_read_one_lp(c, lnum, &lp);
> +		if (ret)
> +			return ret;
> +
> +		if (lp.free != c->leb_size)
> +			return 1;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * fixup_lprops - Uncategorize the lprops outside the new boundaries.
> + * @c: UBIFS file-system description object
> + * @leb_count: a place to start fixing up
> + */
> +static int fixup_lprops(struct ubifs_info *c, int leb_count)
> +{
> +	int lnum, ret = 0;
> +	struct ubifs_lprops* lp;
> +
> +	for (lnum = leb_count; lnum < c->leb_cnt; lnum++) {
> +		lp = ubifs_lpt_lookup(c, lnum);
> +		if (IS_ERR(lp)) {
> +			ret = PTR_ERR(lp);
> +			ubifs_err(c, "cannot read properties of LEB %d, error %d",
> +				  lnum, ret);
> +			break;
> +		}
> +		ubifs_remove_from_cat(c, lp, lp->flags & LPROPS_CAT_MASK);
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * ubifs_resize - Shrink the ubifs to a new size.
> + * @c: UBIFS file-system description object
> + * @leb_count: the size to fit the filesystem within.
> + *
> + * Function used to shrink ubifs, by making room and
> + * then moving all lebs outside of the new size.
> + */
> +int ubifs_resize(struct ubifs_info *c, int leb_count)
> +{
> +	int ret = 0, delta;
> +	long long delta_bytes;
> +	struct ubifs_sb_node *sup;
> +
> +	if (c == NULL)
> +		return -EINVAL;
> +
> +	if (leb_count == c->leb_cnt)
> +		return 0;
> +
> +	if (leb_count > c->leb_cnt)
> +		return -EINVAL;
> +
> +	delta = c->leb_cnt - leb_count;
> +	delta_bytes = (long) delta * c->leb_size;

Should this cast be to (long long)?

> +
> +	ret = is_move_required(c, leb_count);
> +	if (ret < 0)
> +		return ret;
> +
> +	c->min_lnum = c->main_first;
> +	c->max_lnum = leb_count - 2;
> +
> +	if (ret) {
> +		ret = shrink_to_size(c, leb_count);
> +		if (ret)
> +			return ret;
> +	} else {
> +		ret = switch_head(c, BASEHD);
> +		if (ret)
> +			return ret;
> +
> +		ret = switch_head(c, DATAHD);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = switch_gc_head(c);
> +	if (ret)
> +		return ret;
> +
> +	ubifs_get_lprops(c);
> +
> +	ret = fixup_lprops(c, leb_count);
> +	if (ret)
> +		goto out_release;
> +
> +	c->lscan_lnum = c->main_first;
> +	c->leb_cnt = leb_count;
> +	c->main_lebs -= delta;
> +	c->main_bytes -= delta_bytes;
> +	c->lst.empty_lebs -= delta;
> +	c->lst.total_free -= delta_bytes;
> +	c->lst.total_dark -= delta * (long long)c->dark_wm;
> +
> +	c->min_lnum = 0;
> +	c->max_lnum = 0;
> +
> +	c->mst_node->lscan_lnum = cpu_to_le32(c->main_first);
> +	c->mst_node->gc_lnum = cpu_to_le32(c->gc_lnum);
> +	c->mst_node->leb_cnt = cpu_to_le32(leb_count);
> +	c->mst_node->empty_lebs = cpu_to_le32(c->lst.empty_lebs);
> +	c->mst_node->total_free = cpu_to_le64(c->lst.total_free);
> +	c->mst_node->total_dark = cpu_to_le64(c->lst.total_dark);
> +
> +	sup = ubifs_read_sb_node(c);
> +	if (IS_ERR(sup)) {
> +		ret = PTR_ERR(sup);
> +		goto out_release;
> +	}
> +
> +	sup->leb_cnt = cpu_to_le32(leb_count);
> +
> +	ret = ubifs_validate_master(c);
> +	if (ret)
> +		goto out;
> +
> +	ret = ubifs_validate_sb(c, sup);
> +	if (ret)
> +		goto out;
> +
> +	ret = ubifs_write_master(c);
> +	if (ret)
> +		goto out;
> +
> +	ret = ubifs_write_sb_node(c, sup);
> +
> +out:
> +
> +	kfree(sup);
> +
> +out_release:
> +
> +	c->min_lnum = 0;
> +	c->max_lnum = 0;
> +
> +	ubifs_release_lprops(c);
> +
> +	return ret;
> +}
> diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
> index 8c25081a5109..5e138fe88a38 100644
> --- a/fs/ubifs/sb.c
> +++ b/fs/ubifs/sb.c
> @@ -347,7 +347,7 @@ static int create_default_filesystem(struct ubifs_info *c)
>  }
>  
>  /**
> - * validate_sb - validate superblock node.
> + * ubifs_validate_sb - validate superblock node.
>   * @c: UBIFS file-system description object
>   * @sup: superblock node
>   *
> @@ -356,7 +356,7 @@ static int create_default_filesystem(struct ubifs_info *c)
>   * instead. Returns zero in case of success and %-EINVAL in case of validation
>   * failure.
>   */
> -static int validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
> +int ubifs_validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup)
>  {
>  	long long max_bytes;
>  	int err = 1, min_leb_cnt;
> @@ -684,7 +684,7 @@ int ubifs_read_superblock(struct ubifs_info *c)
>  	c->main_lebs -= c->log_lebs + c->lpt_lebs + c->orph_lebs;
>  	c->main_first = c->leb_cnt - c->main_lebs;
>  
> -	err = validate_sb(c, sup);
> +	err = ubifs_validate_sb(c, sup);
>  out:
>  	kfree(sup);
>  	return err;
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index b16ef162344a..dff668888c3f 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -931,6 +931,7 @@ enum {
>  	Opt_chk_data_crc,
>  	Opt_no_chk_data_crc,
>  	Opt_override_compr,
> +	Opt_resize_volume,
>  	Opt_ignore,
>  	Opt_err,
>  };
> @@ -943,6 +944,7 @@ static const match_table_t tokens = {
>  	{Opt_chk_data_crc, "chk_data_crc"},
>  	{Opt_no_chk_data_crc, "no_chk_data_crc"},
>  	{Opt_override_compr, "compr=%s"},
> +	{Opt_resize_volume, "leb_cnt=%d"},
>  	{Opt_ignore, "ubi=%s"},
>  	{Opt_ignore, "vol=%s"},
>  	{Opt_err, NULL},
> @@ -1045,6 +1047,18 @@ static int ubifs_parse_options(struct ubifs_info *c, char *options,
>  			c->default_compr = c->mount_opts.compr_type;
>  			break;
>  		}
> +		case Opt_resize_volume:
> +		{
> +			int leb_count;
> +
> +			if (match_int(&args[0], &leb_count)) {
> +				ubifs_err(c, "leb_cnt requires an argument\n");
> +				return -EINVAL;
> +			}
> +
> +			c->new_leb_cnt = leb_count;
> +			break;
> +		}
>  		case Opt_ignore:
>  			break;
>  		default:
> @@ -1880,6 +1894,15 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
>  		mutex_unlock(&c->bu_mutex);
>  	}
>  
> +	if (c->new_leb_cnt) {
> +		err = ubifs_resize(c, c->new_leb_cnt);
> +		c->new_leb_cnt = 0;
> +		if (err) {
> +			ubifs_err(c, "resize unsuccessful");
> +			return err;
> +		}
> +	}
> +
>  	ubifs_assert(c->lst.taken_empty_lebs > 0);
>  	return 0;
>  }
> @@ -2071,6 +2094,13 @@ static int ubifs_fill_super(struct super_block *sb, void *data, int silent)
>  		goto out_umount;
>  	}
>  
> +	if (c->new_leb_cnt) {
> +		err = ubifs_resize(c, c->new_leb_cnt);
> +		c->new_leb_cnt = 0;
> +		if (err)
> +			goto out_unlock;
> +	}
> +
>  	mutex_unlock(&c->umount_mutex);
>  	return 0;
>  
> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
> index 5ee7af879cc4..9bcbb3e93999 100644
> --- a/fs/ubifs/ubifs.h
> +++ b/fs/ubifs/ubifs.h
> @@ -1445,6 +1445,9 @@ struct ubifs_info {
>  	struct ubifs_mount_opts mount_opts;
>  
>  	struct ubifs_debug_info *dbg;
> +	int min_lnum;
> +	int max_lnum;
> +	int new_leb_cnt;
>  };
>  
>  extern struct list_head ubifs_infos;
> @@ -1516,6 +1519,7 @@ int ubifs_log_post_commit(struct ubifs_info *c, int old_ltail_lnum);
>  int ubifs_consolidate_log(struct ubifs_info *c);
>  
>  /* journal.c */
> +int ubifs_jnl_switch_head(struct ubifs_info *c, int jhead);
>  int ubifs_jnl_update(struct ubifs_info *c, const struct inode *dir,
>  		     const struct fscrypt_name *nm, const struct inode *inode,
>  		     int deletion, int xent);
> @@ -1646,6 +1650,7 @@ void ubifs_wait_for_commit(struct ubifs_info *c);
>  /* master.c */
>  int ubifs_read_master(struct ubifs_info *c);
>  int ubifs_write_master(struct ubifs_info *c);
> +int ubifs_validate_master(const struct ubifs_info *c);
>  
>  /* sb.c */
>  int ubifs_read_superblock(struct ubifs_info *c);
> @@ -1653,6 +1658,7 @@ struct ubifs_sb_node *ubifs_read_sb_node(struct ubifs_info *c);
>  int ubifs_write_sb_node(struct ubifs_info *c, struct ubifs_sb_node *sup);
>  int ubifs_fixup_free_space(struct ubifs_info *c);
>  int ubifs_enable_encryption(struct ubifs_info *c);
> +int ubifs_validate_sb(struct ubifs_info *c, struct ubifs_sb_node *sup);
>  
>  /* replay.c */
>  int ubifs_validate_entry(struct ubifs_info *c,
> @@ -1720,6 +1726,8 @@ const struct ubifs_lprops *ubifs_change_lp(struct ubifs_info *c,
>  void ubifs_get_lp_stats(struct ubifs_info *c, struct ubifs_lp_stats *lst);
>  void ubifs_add_to_cat(struct ubifs_info *c, struct ubifs_lprops *lprops,
>  		      int cat);
> +void ubifs_remove_from_cat(struct ubifs_info *c, struct ubifs_lprops *lprops,
> +			   int cat);
>  void ubifs_replace_cat(struct ubifs_info *c, struct ubifs_lprops *old_lprops,
>  		       struct ubifs_lprops *new_lprops);
>  void ubifs_ensure_cat(struct ubifs_info *c, struct ubifs_lprops *lprops);
> @@ -1789,6 +1797,9 @@ int ubifs_recover_size_accum(struct ubifs_info *c, union ubifs_key *key,
>  int ubifs_recover_size(struct ubifs_info *c);
>  void ubifs_destroy_size_tree(struct ubifs_info *c);
>  
> +/* resize.c */
> +int ubifs_resize(struct ubifs_info *c, int leb_count);
> +
>  /* ioctl.c */
>  long ubifs_ioctl(struct file *file, unsigned int cmd, unsigned long arg);
>  void ubifs_set_inode_flags(struct inode *inode);
> -- 
> 2.11.0

MV
