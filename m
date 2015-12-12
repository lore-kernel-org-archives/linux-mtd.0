Received: from szxga01-in.huawei.com ([58.251.152.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a7e5d-0007cD-Qr
 for linux-mtd@lists.infradead.org; Sat, 12 Dec 2015 06:55:52 +0000
Subject: Re: [PATCH] jffs2: bug fix of creating node when gc or find space
To: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
References: <1449797815-29779-1-git-send-email-gaoyongliang@huawei.com>
 <20151211025820.GA497@localhost>
CC: <linux-mtd@lists.infradead.org>, <zhihui.gao@huawei.com>,
 <akpm@linux-foundation.org>, <stable@vger.kernel.org>,
 <chenjie6@huawei.com>, <James.Liu@windriver.com>,
 <Kuaikuai.Wu@windriver.com>, <panxuesong@huawei.com>
From: gaoyongliang <gaoyongliang@huawei.com>
Message-ID: <566BC492.3010507@huawei.com>
Date: Sat, 12 Dec 2015 14:54:10 +0800
MIME-Version: 1.0
In-Reply-To: <20151211025820.GA497@localhost>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Brian,

Thanks for your advises for this patch.

The reported bug is the same as Chen Jie in Huawei, but his fix patch has
some problem.
1. when gc find one block which created node but not finished, Chen Jie's
   patch only set 'c->gcblock = NULL', but not return this jeb to the block
   list. when delete jeb->list in jffs2_mark_node_obsolete(), it would make
   the kernel panic because of double list_del().

+	/*create but not finished so find next block*/
+	if (ic->state_new == INO_STATE_I_NEW) {
+		jffs2_dbg(1, "%s(): ino #%u in state new so find next block\n",
+			  __func__, ic->ino);
+		c->gcblock = NULL;
+		mutex_unlock(&c->alloc_sem);
+		spin_unlock(&c->inocache_lock);
+		return 0;
+	}

Unable to handle kernel paging request at virtual address 00100104
......
[<bf2bcd04>] (jffs2_mark_node_obsolete+0x298/0x344 [jffs2]) from [<bf2bb19c>] (jffs2_obsolete_node_frag+0x38/0x60 [jffs2])
[<bf2bb19c>] (jffs2_obsolete_node_frag+0x38/0x60 [jffs2]) from [<bf2bb9d8>] (jffs2_add_full_dnode_to_inode+0x2ac/0x3c0 [jffs2])
[<bf2bb9d8>] (jffs2_add_full_dnode_to_inode+0x2ac/0x3c0 [jffs2]) from [<bf2c3704>] (jffs2_garbage_collect_dnode.isra.3+0x408/0x47c [jffs2])
[<bf2c3704>] (jffs2_garbage_collect_dnode.isra.3+0x408/0x47c [jffs2]) from [<bf2c43e0>] (jffs2_garbage_collect_pass+0xb14/0xfbc [jffs2])
[<bf2c43e0>] (jffs2_garbage_collect_pass+0xb14/0xfbc [jffs2]) from [<bf2bd414>] (jffs2_reserve_space+0x154/0x3b4 [jffs2])
[<bf2bd414>] (jffs2_reserve_space+0x154/0x3b4 [jffs2]) from [<bf2c05f8>] (jffs2_write_inode_range+0x58/0x3ac [jffs2])
[<bf2c05f8>] (jffs2_write_inode_range+0x58/0x3ac [jffs2]) from [<bf2bac78>] (jffs2_write_end+0x11c/0x224 [jffs2])
[<bf2bac78>] (jffs2_write_end+0x11c/0x224 [jffs2]) from [<c00beb78>] (generic_file_buffered_write+0x160/0x23c)
[<c00beb78>] (generic_file_buffered_write+0x160/0x23c) from [<c00bfc80>] (__generic_file_aio_write+0x328/0x394)
[<c00bfc80>] (__generic_file_aio_write+0x328/0x394) from [<c00bfd40>] (generic_file_aio_write+0x54/0xb0)
[<c00bfd40>] (generic_file_aio_write+0x54/0xb0) from [<c00feca0>] (do_sync_write+0x74/0x98)
[<c00feca0>] (do_sync_write+0x74/0x98) from [<c00ff63c>] (vfs_write+0xcc/0x1a8)
[<c00ff63c>] (vfs_write+0xcc/0x1a8) from [<c00ffa30>] (SyS_write+0x38/0x64)
[<c00ffa30>] (SyS_write+0x38/0x64) from [<c00102c0>] (ret_fast_syscall+0x0/0x58)

   I think this jeb should be added to the dirty list.

2. when hundreds of processes are creating node but not finished(after finishing
   writing dnode, it will release the lock), a lot of jebs would be added to
   dirty_list, but this jebs can't be gc until finishing to create node. it
   would cause 'no free space left for GC', actually, there are some jebs in
   the dirty list.

jffs2: Argh. No free space left for GC. nr_erasing_blocks is 0. nr_free_blocks is 0. (erasableempty: yes, erasingempty: yes, erasependingempty: yes)
jffs2: Error garbage collecting node at 00c5ecf8!

   I add a new create_sem to protect creating dnode and dirent in order.

Gao Yongliang

On 2015/12/11 10:58, Brian Norris wrote:
> + David (JFFS2 "maintainer")
> 
> David,
> 
> Looks like there was a similar patch / bug report from Huawei about a
> year ago, though this one has some modifications:
> 
> http://patchwork.ozlabs.org/patch/416301/
> 
> It's among the outstanding jffs2 patches from the last 2 years, after I
> filtered out the noise:
> 
> http://patchwork.ozlabs.org/project/linux-mtd/list/?q=jffs2
> 
> They're mostly marked as delegated to you. What would you like to do
> with them?
> 
> On Fri, Dec 11, 2015 at 09:36:55AM +0800, gaoyongliang@huawei.com wrote:
>> From: gaoyongliang <gaoyongliang@huawei.com>
> 
> gayongliang,
> 
> It's standard practice to use your full name for patch submittions in
> the 'From:' and 'Signed-off-by:' portions. See
> Documentation/SubmittingPatches. While I can probably guess at the space
> and capitalization of your name, it's probably best if you can do this
> yourself.
> 
>>
>> 1. create inode by insert_inode_locked, and return inode with I_NEW.
>> 2. has writed the dnode successfully in the end of one block, then
>>    release the c->alloc_sem, but the dirent is not written yet.
>> 3. the gc or jffs2_reserve_space which has got the c->alloc_sem may
>>    find the block which the dnode we just writed in, the dnode can't
>>    be gc because the dirent is not written and the state of inode is
>>    still I_NEW, we can only wait on inode without release c->alloc_sem.
>> 4. we can't get the c->alloc_sem to write the dirent, so the inode
>>    state keep I_NEW forever.
>> 5. this will cause deadlock, like ABBA deadlock.
>>
>> lockf2.test     D c02dead8     0 11666      1 0x00000001
>> locked:
>> c90f9be8   &inode->i_mutex  0  [<c00bf158>] generic_file_aio_write+0x40/0xb0
>> c2c54c44   &c->alloc_sem    1  [<bf056f9c>] jffs2_garbage_collect_pass+0x1c/0xf08 [jffs2]
>> [<c02dead8>] (__schedule+0x458/0x604) from [<c0114090>] (inode_wait+0x8/0x10)
>> [<c0114090>] (inode_wait+0x8/0x10) from [<c02dd050>] (__wait_on_bit+0x54/0xa0)
>> [<c02dd050>] (__wait_on_bit+0x54/0xa0) from [<c02dd114>] (out_of_line_wait_on_bit+0x78/0x84)
>> [<c02dd114>] (out_of_line_wait_on_bit+0x78/0x84) from [<c01157a0>] (iget_locked+0x90/0x1b0)
>> [<c01157a0>] (iget_locked+0x90/0x1b0) from [<bf059fe8>] (jffs2_iget+0xc/0x344 [jffs2])
>> [<bf059fe8>] (jffs2_iget+0xc/0x344 [jffs2]) from [<bf05a6fc>] (jffs2_gc_fetch_inode+0x104/0x158 [jffs2])
>> [<bf05a6fc>] (jffs2_gc_fetch_inode+0x104/0x158 [jffs2]) from [<bf0577f0>] (jffs2_garbage_collect_pass+0x870/0xf08 [jffs2])
>> [<bf0577f0>] (jffs2_garbage_collect_pass+0x870/0xf08 [jffs2]) from [<bf051248>] (jffs2_reserve_space+0x154/0x3b4 [jffs2])
>> [<bf051248>] (jffs2_reserve_space+0x154/0x3b4 [jffs2]) from [<bf053eac>] (jffs2_write_inode_range+0x58/0x3ac [jffs2])
>> [<bf053eac>] (jffs2_write_inode_range+0x58/0x3ac [jffs2]) from [<bf04ec20>] (jffs2_write_end+0x11c/0x224 [jffs2])
>> [<bf04ec20>] (jffs2_write_end+0x11c/0x224 [jffs2]) from [<c00bdfa4>] (generic_file_buffered_write+0x160/0x23c)
>> [<c00bdfa4>] (generic_file_buffered_write+0x160/0x23c) from [<c00bf0ac>] (__generic_file_aio_write+0x328/0x394)
>> [<c00bf0ac>] (__generic_file_aio_write+0x328/0x394) from [<c00bf16c>] (generic_file_aio_write+0x54/0xb0)
>> [<c00bf16c>] (generic_file_aio_write+0x54/0xb0) from [<c00fdc24>] (do_sync_write+0x74/0x98)
>> [<c00fdc24>] (do_sync_write+0x74/0x98) from [<c00fe550>] (vfs_write+0xcc/0x174)
>> [<c00fe550>] (vfs_write+0xcc/0x174) from [<c00fe8a8>] (SyS_write+0x38/0x64)
>> [<c00fe8a8>] (SyS_write+0x38/0x64) from [<c000f0c0>] (ret_fast_syscall+0x0/0x58)
>>
>> Fixes: e72e6497e74811e01d72b4c1b7537b3aea3ee857
> 
> FWIW, this isn't the preferred style for 'Fixes:' lines. It's nice to
> include the commit subject too, like:
> 
> Fixes: commit ("e72e6497e748 jffs2: Fix NFS race by using insert_inode_locked()")
> 
>> Cc: <stable@vger.kernel.org> # 3.10.y+
>> Signed-off-by: gaoyongliang <gaoyongliang@huawei.com>
>> ---
>>  fs/jffs2/dir.c         |   25 +++++++++++++++++++++++++
>>  fs/jffs2/fs.c          |    1 +
>>  fs/jffs2/gc.c          |   11 +++++++++++
>>  fs/jffs2/jffs2_fs_sb.h |    1 +
>>  fs/jffs2/nodelist.h    |    4 ++++
>>  fs/jffs2/super.c       |    1 +
>>  fs/jffs2/write.c       |    1 +
>>  7 files changed, 44 insertions(+), 0 deletions(-)
> 
> This patch looks awfully similar to chenjie's patch, but it has a bit
> different diffstat. Presumably there were reasons for the changes. Can
> you include a changelog? (e.g., "changed foo becuase of bar")
> 
> No other comment from me on the patch.
> 
> Brian
> 
>>
>> diff --git a/fs/jffs2/dir.c b/fs/jffs2/dir.c
>> index d211b8e..808ec17 100644
>> --- a/fs/jffs2/dir.c
>> +++ b/fs/jffs2/dir.c
>> @@ -195,7 +195,9 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry,
>>  	   no chance of AB-BA deadlock involving its f->sem). */
>>  	mutex_unlock(&f->sem);
>>  
>> +	mutex_lock(&c->create_sem);
>>  	ret = jffs2_do_create(c, dir_f, f, ri, &dentry->d_name);
>> +	mutex_unlock(&c->create_sem);
>>  	if (ret)
>>  		goto fail;
>>  
>> @@ -208,12 +210,14 @@ static int jffs2_create(struct inode *dir_i, struct dentry *dentry,
>>  		  f->inocache->pino_nlink, inode->i_mapping->nrpages);
>>  
>>  	unlock_new_inode(inode);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>>  	d_instantiate(dentry, inode);
>>  	return 0;
>>  
>>   fail:
>>  	iget_failed(inode);
>>  	jffs2_free_raw_inode(ri);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>>  	return ret;
>>  }
>>  
>> @@ -304,11 +308,13 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
>>  	 * Just the node will do for now, though
>>  	 */
>>  	namelen = dentry->d_name.len;
>> +	mutex_lock(&c->create_sem);
>>  	ret = jffs2_reserve_space(c, sizeof(*ri) + targetlen, &alloclen,
>>  				  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>>  
>>  	if (ret) {
>>  		jffs2_free_raw_inode(ri);
>> +		mutex_unlock(&c->create_sem);
>>  		return ret;
>>  	}
>>  
>> @@ -317,6 +323,7 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
>>  	if (IS_ERR(inode)) {
>>  		jffs2_free_raw_inode(ri);
>>  		jffs2_complete_reservation(c);
>> +		mutex_unlock(&c->create_sem);
>>  		return PTR_ERR(inode);
>>  	}
>>  
>> @@ -429,11 +436,15 @@ static int jffs2_symlink (struct inode *dir_i, struct dentry *dentry, const char
>>  	jffs2_complete_reservation(c);
>>  
>>  	unlock_new_inode(inode);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>> +	mutex_unlock(&c->create_sem);
>>  	d_instantiate(dentry, inode);
>>  	return 0;
>>  
>>   fail:
>>  	iget_failed(inode);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>> +	mutex_unlock(&c->create_sem);
>>  	return ret;
>>  }
>>  
>> @@ -463,11 +474,13 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
>>  	 * Just the node will do for now, though
>>  	 */
>>  	namelen = dentry->d_name.len;
>> +	mutex_lock(&c->create_sem);
>>  	ret = jffs2_reserve_space(c, sizeof(*ri), &alloclen, ALLOC_NORMAL,
>>  				  JFFS2_SUMMARY_INODE_SIZE);
>>  
>>  	if (ret) {
>>  		jffs2_free_raw_inode(ri);
>> +		mutex_unlock(&c->create_sem);
>>  		return ret;
>>  	}
>>  
>> @@ -476,6 +489,7 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
>>  	if (IS_ERR(inode)) {
>>  		jffs2_free_raw_inode(ri);
>>  		jffs2_complete_reservation(c);
>> +		mutex_unlock(&c->create_sem);
>>  		return PTR_ERR(inode);
>>  	}
>>  
>> @@ -574,11 +588,15 @@ static int jffs2_mkdir (struct inode *dir_i, struct dentry *dentry, umode_t mode
>>  	jffs2_complete_reservation(c);
>>  
>>  	unlock_new_inode(inode);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>> +	mutex_unlock(&c->create_sem);
>>  	d_instantiate(dentry, inode);
>>  	return 0;
>>  
>>   fail:
>>  	iget_failed(inode);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>> +	mutex_unlock(&c->create_sem);
>>  	return ret;
>>  }
>>  
>> @@ -634,11 +652,13 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
>>  	 * Just the node will do for now, though
>>  	 */
>>  	namelen = dentry->d_name.len;
>> +	mutex_lock(&c->create_sem);
>>  	ret = jffs2_reserve_space(c, sizeof(*ri) + devlen, &alloclen,
>>  				  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
>>  
>>  	if (ret) {
>>  		jffs2_free_raw_inode(ri);
>> +		mutex_unlock(&c->create_sem);
>>  		return ret;
>>  	}
>>  
>> @@ -647,6 +667,7 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
>>  	if (IS_ERR(inode)) {
>>  		jffs2_free_raw_inode(ri);
>>  		jffs2_complete_reservation(c);
>> +		mutex_unlock(&c->create_sem);
>>  		return PTR_ERR(inode);
>>  	}
>>  	inode->i_op = &jffs2_file_inode_operations;
>> @@ -746,11 +767,15 @@ static int jffs2_mknod (struct inode *dir_i, struct dentry *dentry, umode_t mode
>>  	jffs2_complete_reservation(c);
>>  
>>  	unlock_new_inode(inode);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>> +	mutex_unlock(&c->create_sem);
>>  	d_instantiate(dentry, inode);
>>  	return 0;
>>  
>>   fail:
>>  	iget_failed(inode);
>> +	f->inocache->state_new = INO_STATE_N_NEW;
>> +	mutex_unlock(&c->create_sem);
>>  	return ret;
>>  }
>>  
>> diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
>> index 2caf168..c98fd3c 100644
>> --- a/fs/jffs2/fs.c
>> +++ b/fs/jffs2/fs.c
>> @@ -482,6 +482,7 @@ struct inode *jffs2_new_inode (struct inode *dir_i, umode_t mode, struct jffs2_r
>>  		mutex_unlock(&f->sem);
>>  		make_bad_inode(inode);
>>  		iput(inode);
>> +		f->inocache->state_new = INO_STATE_N_NEW;
>>  		return ERR_PTR(-EINVAL);
>>  	}
>>  
>> diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
>> index 5a2dec2..51f2a4b 100644
>> --- a/fs/jffs2/gc.c
>> +++ b/fs/jffs2/gc.c
>> @@ -333,6 +333,17 @@ int jffs2_garbage_collect_pass(struct jffs2_sb_info *c)
>>  		  __func__, jeb->offset, ref_offset(raw), ref_flags(raw),
>>  		  ic->ino);
>>  
>> +	/* create but not finished so find next block */
>> +	if (ic->state_new == INO_STATE_I_NEW) {
>> +		jffs2_dbg(1, "%s(): ino #%u in state new so find next block\n",
>> +			  __func__, ic->ino);
>> +		c->gcblock = NULL;
>> +		list_add_tail(&jeb->list, &c->dirty_list);
>> +		mutex_unlock(&c->alloc_sem);
>> +		spin_unlock(&c->inocache_lock);
>> +		return 0;
>> +	}
>> +
>>  	/* Three possibilities:
>>  	   1. Inode is already in-core. We must iget it and do proper
>>  	      updating to its fragtree, etc.
>> diff --git a/fs/jffs2/jffs2_fs_sb.h b/fs/jffs2/jffs2_fs_sb.h
>> index 046fee8..32193b7 100644
>> --- a/fs/jffs2/jffs2_fs_sb.h
>> +++ b/fs/jffs2/jffs2_fs_sb.h
>> @@ -57,6 +57,7 @@ struct jffs2_sb_info {
>>  	struct completion gc_thread_start; /* GC thread start completion */
>>  	struct completion gc_thread_exit; /* GC thread exit completion port */
>>  
>> +	struct mutex create_sem;	/* Used to protect write dnode and dirent in order */
>>  	struct mutex alloc_sem;		/* Used to protect all the following
>>  					   fields, and also to protect against
>>  					   out-of-order writing of nodes. And GC. */
>> diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
>> index fa35ff7..ec377e0 100644
>> --- a/fs/jffs2/nodelist.h
>> +++ b/fs/jffs2/nodelist.h
>> @@ -180,6 +180,7 @@ struct jffs2_inode_cache {
>>  				   here; other inodes store nlink.
>>  				   Zero always means that it's
>>  				   completely unlinked. */
>> +	uint32_t state_new;	/* create flag */
>>  };
>>  
>>  /* Inode states for 'state' above. We need the 'GC' state to prevent
>> @@ -193,6 +194,9 @@ struct jffs2_inode_cache {
>>  #define INO_STATE_READING	5	/* In read_inode() */
>>  #define INO_STATE_CLEARING	6	/* In clear_inode() */
>>  
>> +#define INO_STATE_N_NEW		0	/* Finish to create */
>> +#define INO_STATE_I_NEW		1	/* Just create but not finish */
>> +
>>  #define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
>>  
>>  #define RAWNODE_CLASS_INODE_CACHE	0
>> diff --git a/fs/jffs2/super.c b/fs/jffs2/super.c
>> index d86c5e3..99c5715 100644
>> --- a/fs/jffs2/super.c
>> +++ b/fs/jffs2/super.c
>> @@ -292,6 +292,7 @@ static int jffs2_fill_super(struct super_block *sb, void *data, int silent)
>>  
>>  	/* Initialize JFFS2 superblock locks, the further initialization will
>>  	 * be done later */
>> +	mutex_init(&c->create_sem);
>>  	mutex_init(&c->alloc_sem);
>>  	mutex_init(&c->erase_free_sem);
>>  	init_waitqueue_head(&c->erase_wait);
>> diff --git a/fs/jffs2/write.c b/fs/jffs2/write.c
>> index b634de4..dc8242d 100644
>> --- a/fs/jffs2/write.c
>> +++ b/fs/jffs2/write.c
>> @@ -36,6 +36,7 @@ int jffs2_do_new_inode(struct jffs2_sb_info *c, struct jffs2_inode_info *f,
>>  	f->inocache->pino_nlink = 1; /* Will be overwritten shortly for directories */
>>  	f->inocache->nodes = (struct jffs2_raw_node_ref *)f->inocache;
>>  	f->inocache->state = INO_STATE_PRESENT;
>> +	f->inocache->state_new = INO_STATE_I_NEW;
>>  
>>  	jffs2_add_ino_cache(c, f->inocache);
>>  	jffs2_dbg(1, "%s(): Assigned ino# %d\n", __func__, f->inocache->ino);
>> -- 
>> 1.7.6
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> .
> 
