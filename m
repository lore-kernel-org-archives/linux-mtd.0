Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHi8U-0001hd-QE
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2015 00:43:51 +0000
Message-ID: <55AEE5E6.3090807@cn.fujitsu.com>
Date: Wed, 22 Jul 2015 08:37:58 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
CC: <dedekind1@gmail.com>, <richard.weinberger@gmail.com>, <jack@suse.com>,
 <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 04/25] fs: super: introduce the functions to get super
 by cdev reference
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1437467876-22106-5-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150721090457.GF6533@quack.suse.cz>
In-Reply-To: <20150721090457.GF6533@quack.suse.cz>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/21/2015 05:04 PM, Jan Kara wrote:
> On Tue 21-07-15 16:37:35, Dongsheng Yang wrote:
>> As we have cdev in super block now, we can provide get_super_cdev
>> to get super_block by a cdev reference, similar with get_super
>> which is working only for block_device.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>
> Instead of duplicating the superblock searching functions, can you please
> create common __get_super() function like:
>
> struct super_block *__get_super(
> 		int (*compare)(struct super_block *, void *), void *key)
>
> And it will use the compare function to check whether the sb is the right
> one or not. You will then have one comparion functions for searching by
> bdev used by get_super() and one comparison function for searching by cdev
> used by get_super_cdev().
>
> Similarly you can create __get_super_thawed() to avoid the duplication
> there.

Haha, that's what I wanted to do, but forgive my lazy, I will update it
in next version.

Yang
>
> 								Honza
>
>> ---
>>   fs/super.c         | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/fs.h |  2 ++
>>   2 files changed, 47 insertions(+)
>>
>> diff --git a/fs/super.c b/fs/super.c
>> index 928c20f..4a9031a 100644
>> --- a/fs/super.c
>> +++ b/fs/super.c
>> @@ -605,6 +605,37 @@ rescan:
>>
>>   EXPORT_SYMBOL(get_super);
>>
>> +struct super_block *get_super_cdev(struct cdev *cdev)
>> +{
>> +	struct super_block *sb;
>> +
>> +	if (!cdev)
>> +		return NULL;
>> +
>> +	spin_lock(&sb_lock);
>> +rescan:
>> +	list_for_each_entry(sb, &super_blocks, s_list) {
>> +		if (hlist_unhashed(&sb->s_instances))
>> +			continue;
>> +		if (sb->s_cdev == cdev) {
>> +			sb->s_count++;
>> +			spin_unlock(&sb_lock);
>> +			down_read(&sb->s_umount);
>> +			/* still alive? */
>> +			if (sb->s_root && (sb->s_flags & MS_BORN))
>> +				return sb;
>> +			up_read(&sb->s_umount);
>> +			/* nope, got unmounted */
>> +			spin_lock(&sb_lock);
>> +			__put_super(sb);
>> +			goto rescan;
>> +		}
>> +	}
>> +	spin_unlock(&sb_lock);
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL(get_super_cdev);
>> +
>>   /**
>>    *	get_super_thawed - get thawed superblock of a device
>>    *	@bdev: device to get the superblock for
>> @@ -628,6 +659,20 @@ struct super_block *get_super_thawed(struct block_device *bdev)
>>   }
>>   EXPORT_SYMBOL(get_super_thawed);
>>
>> +struct super_block *get_super_cdev_thawed(struct cdev *cdev)
>> +{
>> +	while (1) {
>> +		struct super_block *s = get_super_cdev(cdev);
>> +		if (!s || s->s_writers.frozen == SB_UNFROZEN)
>> +			return s;
>> +		up_read(&s->s_umount);
>> +		wait_event(s->s_writers.wait_unfrozen,
>> +			   s->s_writers.frozen == SB_UNFROZEN);
>> +		put_super(s);
>> +	}
>> +}
>> +EXPORT_SYMBOL(get_super_cdev_thawed);
>> +
>>   /**
>>    * get_active_super - get an active reference to the superblock of a device
>>    * @bdev: device to get the superblock for
>> diff --git a/include/linux/fs.h b/include/linux/fs.h
>> index 2f1d9499..5c7d789 100644
>> --- a/include/linux/fs.h
>> +++ b/include/linux/fs.h
>> @@ -2744,7 +2744,9 @@ extern void get_filesystem(struct file_system_type *fs);
>>   extern void put_filesystem(struct file_system_type *fs);
>>   extern struct file_system_type *get_fs_type(const char *name);
>>   extern struct super_block *get_super(struct block_device *);
>> +extern struct super_block *get_super_cdev(struct cdev *);
>>   extern struct super_block *get_super_thawed(struct block_device *);
>> +extern struct super_block *get_super_cdev_thawed(struct cdev *);
>>   extern struct super_block *get_active_super(struct block_device *bdev);
>>   extern void drop_super(struct super_block *sb);
>>   extern void iterate_supers(void (*)(struct super_block *, void *), void *);
>> --
>> 1.8.4.2
>>
>>
