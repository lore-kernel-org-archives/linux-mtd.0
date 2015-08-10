Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOdYr-0000rt-AG
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 03:15:41 +0000
Message-ID: <55C815ED.50707@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 11:09:33 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 26/35] ubifs: free quota inode information in
 ubifs_evict_inode
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-27-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55C679CB.3050605@nod.at>
In-Reply-To: <55C679CB.3050605@nod.at>
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

On 08/09/2015 05:51 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> In evict, we have to call dquot_free_inode() to tell quota
>> subsystem there is one inode to be free. Please update the
>> quota information.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/super.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
>> index 06dd7af..20500f0 100644
>> --- a/fs/ubifs/super.c
>> +++ b/fs/ubifs/super.c
>> @@ -361,6 +361,7 @@ static void ubifs_evict_inode(struct inode *inode)
>>   	if (is_bad_inode(inode))
>>   		goto out;
>>
>> +	dquot_initialize(inode);
>>   	ui->ui_size = inode->i_size = 0;
>>   	err = ubifs_jnl_delete_inode(c, inode);
>>   	if (err)
>> @@ -370,7 +371,7 @@ static void ubifs_evict_inode(struct inode *inode)
>>   		 */
>>   		ubifs_err(c, "can't delete inode %lu, error %d",
>>   			  inode->i_ino, err);
>> -
>> +	dquot_free_inode(inode);
>>   out:
>>   	if (ui->dirty)
>>   		ubifs_release_dirty_inode_budget(c, ui);
>> @@ -380,6 +381,7 @@ out:
>>   		smp_wmb();
>>   	}
>>   done:
>> +	dquot_drop(inode);
>
> Is it allowed to call this without a dquot_initialize()?
> The if (inode->i_nlink) branch will hit that condition.

Yes, that's intentional. If (inode->i_nlink), we should
just call dquot_drop(). else, we have to dquot_initialize()->
dquot_free_inode()->dquot_drop();

Thanx
Yang
>
> Thanks,
> //richard
> .
>
