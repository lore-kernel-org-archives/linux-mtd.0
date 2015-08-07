Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNaUj-0004mC-A9
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 05:47:06 +0000
Message-ID: <55C444EA.7090305@cn.fujitsu.com>
Date: Fri, 7 Aug 2015 13:40:58 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>
CC: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] ubifs: make ubifs_[get|set]xattr atomic
References: <55BABB80.9080406@cn.fujitsu.com>
 <1438305123-31675-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFCEA0.7080900@nod.at>
In-Reply-To: <55BFCEA0.7080900@nod.at>
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

On 08/04/2015 04:27 AM, Richard Weinberger wrote:
> Am 31.07.2015 um 03:12 schrieb Dongsheng Yang:
>> This commit make the ubifs_[get|set]xattr protected by ui_mutex.
>>
>> Originally, there is a possibility that ubifs_getxattr to get
>> a wrong value.
>>
>>      P1				    P2
>> ----------			----------
>> ubifs_getxattr			ubifs_setxattr
>> 				   - kfree()
>>     - memcpy()
>> 				   - kmemdup()
>>
>> Then ubifs_getxattr() would get a non-sense data. To solve this
>> problem, this commit make the xattr of ubifs_inode updated in
>> atomic.
>
> so, ui->data needs protection?
> The comment in fs/ubifs/ubifs.h does not mention ->data.
> I'm asking because I want to make sure that ui_mutex is the correct lock to take.

ui->data needs protection for sure, as I show above.
Without protection, there is a problem to get wrong value.

And yes, the comment does not mention the ->data. But
I think ui_mutex is a good choice for it. And not all fields
which is being protected by ui_mutex are listed in the comment,
such as xattr_names and xattr_cnt.
>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>> 	-v2:
>> 		Add more description in commit message
>>   fs/ubifs/xattr.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
>> index 96f3448..dec1afd 100644
>> --- a/fs/ubifs/xattr.c
>> +++ b/fs/ubifs/xattr.c
>> @@ -208,6 +208,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
>>   	if (err)
>>   		return err;
>>
>> +	mutex_lock(&ui->ui_mutex);
>>   	kfree(ui->data);
>>   	ui->data = kmemdup(value, size, GFP_NOFS);
>>   	if (!ui->data) {
>> @@ -216,6 +217,7 @@ static int change_xattr(struct ubifs_info *c, struct inode *host,
>>   	}
>>   	inode->i_size = ui->ui_size = size;
>>   	ui->data_len = size;
>> +	mutex_unlock(&ui->ui_mutex);
>
> You also need a mutex_unlock(&ui->ui_mutex) under out_free, otherwise
> the if (!ui->data) { branch will trigger a deadlock.

Wow, Great!!!!
Sorry for my careless.

Yang
>
> Thanks,
> //richard
> .
>
