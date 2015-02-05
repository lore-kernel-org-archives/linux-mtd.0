Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJMC9-0004kZ-HZ
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 13:10:10 +0000
Message-ID: <54D36B71.7070008@huawei.com>
Date: Thu, 5 Feb 2015 21:09:05 +0800
From: shengyong <shengyong1@huawei.com>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC] UBIFS recovery
References: <54D33C36.9060805@huawei.com>
In-Reply-To: <54D33C36.9060805@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



在 2015/2/5 17:47, hujianyang 写道:
> Current UBIFS is lack of recovery method, that means, once a UBIFS
> partition refuse to mount, all data on that partition may lose.
> The default recovery mechanism in UBIFS now can deal with corruption
> on master node or power cut cleanup. But it's not enough. UBIFS
> on flash may suffer different kinds of data corrupted, the most
> common case, ECC error.
> 
> I've scanned the archive of maillist and found the recovery method
> was once requested(Sorry, I can't find the link). Artem suggested
> we could introduce a new repairing mount option instead of working
> on a new userspace repairing tool. But seems no more efforts had
> been done so far.
> 
> There are two ways for UBIFS recovery. One is repairing UBIFS image
> in userspace via UBI interfaces, the other is repairing the corrupted
> data during mount by default or via a special mount option.
> 
> The userspace tool is the most effective way to repair a partition.
> It could have enough time and resource to whole scan the target and
> cleanup the corrupted while the file-system offline. But it's hard
> to program: many structures and functions in kernel need to be copied
> into this utility, current ubi-utils focus mostly on UBI device, not
> UBIFS, and the subsequent updating of file-system should consider the
> userspace tool. It's too complicated.
> 
> Another way is expanding the existing recovery methods in recovery.c.
> It's easy to add new recovery method in this way, few lines changes
> could improve reliability in some fields. But it's hard to give a
> global view to control these recovery features, they are dispersed
> in mounting path. Also, make it hard to add new features after
> importing lots of recovery methods.
No matter how fs is recovered, data is corrupted. For the default recovery
machanism, the recovery just drops the last node, and the lost data can be
limited in the mininum range. For other situations, like data corrupted in
the middle of log area, it may be hard to figure out which nodes should be
droped. So we'd prefer to roll the whole fs back to the last checkpoint,
rather than losing all data.

Here is a simple recovery procedure, something could be easily missed in the
procedure:
1. if the default recovery fails, we start to roll the whole filesystem
   back to the last checkpoint.
2. scan all buds already in replay_buds list, if last commit in the bud starts
   from the begining of the LEB, then all nodes in the bud are new, and we
   unmap it; if last commit starts in the middle of the bud, we leb_change the
   bud, keep old nodes and drop new nodes.
3. get the seqnum of last commit, this is the last checkpoint, where the fs
   stayed consistent.
3. scan all LEBs (skip superblock and 2 master LEBs), compare node's seqnum
   with checkpoint, find out the offset where new nodes start.
4. unmap or leb_change the corrupted LEBs, and do related cleanup.
5. create new log area.

BTW, the current ubifs will update master node when mounting, no matter whether
the mount succeeds or fails. So if need_recovery is detected, the master node
should not be updated.

thanks & best regards,
Sheng
> 
> I can't say which way is better. It depends on what we expect on
> UBIFS. Actually I'm working on a userspace tool ubidump, it can
> print on-flash format of a specified LEB now and add features like
> file-system repairing can be considered. On the other hand, I'm
> working on expanding UBIFS recovery method in kernel. e.g. cleanup
> all the logs if an error occur while replaying buds, revert file-
> system to last commit state instead of mounting fail.
> 
> Regardless of how to fix a corrupt partition, the first stuff should
> be done is adding a method that try to mount file-system R/O instead
> of breaking down to give users a chance to copy their valid data
> out from the corrupt image.
> 
> Thanks!
> Hu
> 
> 
> buds replay patch for linux 3.10 stable:
> 
> diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
> index 3187925..e2208a2 100644
> --- a/fs/ubifs/replay.c
> +++ b/fs/ubifs/replay.c
> @@ -706,14 +706,35 @@ static int replay_buds(struct ubifs_info *c)
> 
>  	list_for_each_entry(b, &c->replay_buds, list) {
>  		err = replay_bud(c, b);
> -		if (err)
> -			return err;
> +		if (err) {
> +			ubifs_err("error %d during buds replay, try to revert\n",
> +				  err);
> +			goto revert;
> +		}
> 
>  		ubifs_assert(b->sqnum > prev_sqnum);
>  		prev_sqnum = b->sqnum;
>  	}
> 
>  	return 0;
> +
> +revert:
> +	prev_sqnum = 0;
> +
> +	list_for_each_entry(b, &c->replay_buds, list) {
> +		/*
> +		 * Revert to last commit state, update lprops by setting
> +		 * the state of space used by buds to dirty.
> +		 */
> +		b->free = c->leb_size % c->min_io_size;
> +		b->dirty = c->leb_size - b->bud->start - b->free;
> +
> +		ubifs_assert(b->sqnum > prev_sqnum);
> +		prev_sqnum = b->sqnum;
> +	}
> +	ubifs_warn("revert to last commit state with data lost\n");
> +
> +	return 1;
>  }
> 
>  /**
> @@ -1036,13 +1057,15 @@ int ubifs_replay_journal(struct ubifs_info *c)
>  		lnum = ubifs_next_log_lnum(c, lnum);
>  	} while (lnum != c->ltail_lnum);
> 
> -	err = replay_buds(c);
> -	if (err)
> -		goto out;
> -
> -	err = apply_replay_list(c);
> -	if (err)
> -		goto out;
> +	/*
> +	 * If an error occur during buds replay, try to revert filesystem
> +	 * to last commit state. Should not apply corrupt replay list.
> +	 */
> +	if (!replay_buds(c)) {
> +		err = apply_replay_list(c);
> +		if (err)
> +			goto out;
> +	}
> 
>  	err = set_buds_lprops(c);
>  	if (err)
> 
