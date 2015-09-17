Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcSmi-0001xV-Dm
 for linux-mtd@lists.infradead.org; Thu, 17 Sep 2015 06:35:09 +0000
Message-ID: <55FA5D8A.9030108@cn.fujitsu.com>
Date: Thu, 17 Sep 2015 14:28:26 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Jan Kara <jack@suse.cz>
CC: <viro@ZenIV.linux.org.uk>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v3 11/39] fs: quota: replace opened calling of ->sync_fs
 with sync_filesystem
References: <1442307754-13233-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1442307754-13233-12-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20150916101402.GE13325@quack.suse.cz>
In-Reply-To: <20150916101402.GE13325@quack.suse.cz>
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

On 09/16/2015 06:14 PM, Jan Kara wrote:
> On Tue 15-09-15 17:02:06, Dongsheng Yang wrote:
>> There are only two places in whole kernel to call ->sync_fs directly. It
>> will sync fs even in read-only mode. It's not a good idea and some filesystem
>> would warn out if you are syncing in read-only mode. But sync_filesystem()
>> does filter this case out. Let's call sync_filesystem() here instead.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>
> So I'd prefer ubifs used hidden system inodes for quota files, set
> DQUOT_QUOTA_SYS_FILE flag and so this code calling sync_fs() could be
> completely avoided.

Hmmm, I think it's a good idea to make quota files SYS_FILEs. But how
about quota-tools? E.g, if quotacheck do some modification
on quota files, we would not read them without a sync_fs().

Could you help explain how quota works in this case?
>
> I don't like calling sync_filesystem() from quota code. Mainly, it does
> much more work than ->sync_fs() for most filesystems (it flushes all files
> to disk). Just adding a check for read-only filesystem would look better to
> me.

Okey, I will add a read-only check here.

Thanx
Yang
>
> 									Honza
>> ---
>>   fs/quota/dquot.c | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/quota/dquot.c b/fs/quota/dquot.c
>> index 140397a..0bda7fa 100644
>> --- a/fs/quota/dquot.c
>> +++ b/fs/quota/dquot.c
>> @@ -668,8 +668,7 @@ int dquot_quota_sync(struct super_block *sb, int type)
>>   	/* This is not very clever (and fast) but currently I don't know about
>>   	 * any other simple way of getting quota data to disk and we must get
>>   	 * them there for userspace to be visible... */
>> -	if (sb->s_op->sync_fs)
>> -		sb->s_op->sync_fs(sb, 1);
>> +	sync_filesystem(sb);
>>   	sync_blockdev(sb->s_bdev);
>>
>>   	/*
>> @@ -2043,7 +2042,7 @@ int dquot_disable(struct super_block *sb, int type, unsigned int flags)
>>   	/*
>>   	 * Skip everything if there's nothing to do. We have to do this because
>>   	 * sometimes we are called when fill_super() failed and calling
>> -	 * sync_fs() in such cases does no good.
>> +	 * sync_filesystem() in such cases does no good.
>>   	 */
>>   	if (!sb_any_quota_loaded(sb)) {
>>   		mutex_unlock(&dqopt->dqonoff_mutex);
>> @@ -2110,8 +2109,7 @@ int dquot_disable(struct super_block *sb, int type, unsigned int flags)
>>
>>   	/* Sync the superblock so that buffers with quota data are written to
>>   	 * disk (and so userspace sees correct data afterwards). */
>> -	if (sb->s_op->sync_fs)
>> -		sb->s_op->sync_fs(sb, 1);
>> +	sync_filesystem(sb);
>>   	sync_blockdev(sb->s_bdev);
>>   	/* Now the quota files are just ordinary files and we can set the
>>   	 * inode flags back. Moreover we discard the pagecache so that
>> --
>> 1.8.4.2
>>
