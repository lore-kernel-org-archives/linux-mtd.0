Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZOcgB-0004uH-3D
 for linux-mtd@lists.infradead.org; Mon, 10 Aug 2015 02:19:11 +0000
Message-ID: <55C808B0.6030009@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 10:13:04 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 25/35] ubifs: record quota information about inode
 in ubifs_new_inode
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-26-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55C677F7.1030600@nod.at>
In-Reply-To: <55C677F7.1030600@nod.at>
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

On 08/09/2015 05:43 AM, Richard Weinberger wrote:
> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>> Initialize quota and alloc a inode quota information in
>> ubifs_new_inode(). Then quota would be aware of a new
>> inode is allocated.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/dir.c | 20 +++++++++++++++++---
>>   1 file changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> index 8d93427..5bfce44 100644
>> --- a/fs/ubifs/dir.c
>> +++ b/fs/ubifs/dir.c
>> @@ -41,6 +41,7 @@
>>    */
>>
>>   #include "ubifs.h"
>> +#include <linux/quotaops.h>
>>
>>   /**
>>    * inherit_flags - inherit flags of the parent inode.
>> @@ -90,12 +91,13 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, const struct inode *dir,
>>   {
>>   	struct inode *inode;
>>   	struct ubifs_inode *ui;
>> +	int err = 0;
>>
>>   	inode = new_inode(c->vfs_sb);
>> -	ui = ubifs_inode(inode);
>>   	if (!inode)
>>   		return ERR_PTR(-ENOMEM);
>>
>> +	ui = ubifs_inode(inode);
>
> Seems like an unrelated change.
> All ubifs_inode() does is a container_of(), inode = NULL won't hurt.

My bad, I planed to split this patch, but forgot it.

Yes, as you said, inode = NULL won't hurt, but I think checking inode
following new_inode() directly before using it seems more reasonable.
Although it's obvious that's okey to experts like you, I
believe this change could make the logic more "correct" to others. :)

It's a trivial fix from my opinion, do you think that's worthy?

Yang
>
> Thanks,
> //richard
> .
>
