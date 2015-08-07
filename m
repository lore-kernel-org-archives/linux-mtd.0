Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNYGj-0006iD-Nw
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 03:24:30 +0000
Message-ID: <55C42384.7060404@cn.fujitsu.com>
Date: Fri, 7 Aug 2015 11:18:28 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 19/35] ubifs: budget for inode in ubifs_dirty_inode
 if necessary
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-20-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFD98B.6020408@nod.at>
In-Reply-To: <55BFD98B.6020408@nod.at>
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,
	Thanx for your review. I decide to drop it in next version. :)

Thanx
Yang

On 08/04/2015 05:13 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> In ubifs, we have to do a budget for inode before marking
>> it as dirty. But sometimes, we would call dirty_inode in vfs
>> which will not do a budget for inode. In this case, we have
>> to do a budget in ubifs_dirty_inode() by ourselvies.
>
> How is this commit related to quota support?
>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/super.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 2491fff..bc57685 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -383,15 +383,38 @@ done:
>>   	clear_inode(inode);
>>   }
>>
>> +/*
>> + * In theory, ubifs should take the full control of dirty<->clean
>> + * of an inode with ui->ui_mutex. But there are callers of
>> + * ubifs_dirty_inode in vfs without holding ui->ui_mutex and
>> + * budgeting. So when we found the ui_mutex is not locked, we have
>> + * to lock ui->ui_mutex by itself and do a budget by itself.
>> + */
>>   static void ubifs_dirty_inode(struct inode *inode, int flags)
>>   {
>>           struct ubifs_inode *ui = ubifs_inode(inode);
>> +	int locked = mutex_is_locked(&ui->ui_mutex);
>> +	struct ubifs_info *c = inode->i_sb->s_fs_info;
>> +	int ret = 0;
>> +
>> +	if (!locked)
>> +		mutex_lock(&ui->ui_mutex);
>>
>> -	ubifs_assert(mutex_is_locked(&ui->ui_mutex));
>
> So, currently this assert can be reached? How?
>
> Thanks,
> //richard
> .
>
