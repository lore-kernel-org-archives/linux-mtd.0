Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHiBX-00031X-Kx
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2015 00:47:00 +0000
Message-ID: <55AEE6A8.4050604@cn.fujitsu.com>
Date: Wed, 22 Jul 2015 08:41:12 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <dedekind1@gmail.com>,
 <richard.weinberger@gmail.com>, <jack@suse.com>
CC: <linux-fsdevel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 11/25] ubifs: export read_block() from file.c
References: <1437467876-22106-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1437467876-22106-12-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55AEAD39.1070301@nod.at>
In-Reply-To: <55AEAD39.1070301@nod.at>
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

On 07/22/2015 04:36 AM, Richard Weinberger wrote:
> Am 21.07.2015 um 10:37 schrieb Dongsheng Yang:
>> We want to use read_block to read quota file bypass the page cache.
>> So export it from file.c, then we can use it in somewhere else.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>> ---
>>   fs/ubifs/file.c  | 2 +-
>>   fs/ubifs/ubifs.h | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>> index 27de484..dc8bf0b 100644
>> --- a/fs/ubifs/file.c
>> +++ b/fs/ubifs/file.c
>> @@ -54,7 +54,7 @@
>>   #include <linux/namei.h>
>>   #include <linux/slab.h>
>>
>> -static int read_block(struct inode *inode, void *addr, unsigned int block,
>> +int read_block(struct inode *inode, void *addr, unsigned int block,
>>   		      struct ubifs_data_node *dn)
>>   {
>>   	struct ubifs_info *c = inode->i_sb->s_fs_info;
>> diff --git a/fs/ubifs/ubifs.h b/fs/ubifs/ubifs.h
>> index ae6723e..a6ad955 100644
>> --- a/fs/ubifs/ubifs.h
>> +++ b/fs/ubifs/ubifs.h
>> @@ -1749,6 +1749,8 @@ const struct ubifs_lprops *ubifs_fast_find_frdi_idx(struct ubifs_info *c);
>>   int ubifs_calc_dark(const struct ubifs_info *c, int spc);
>>
>>   /* file.c */
>> +int read_block(struct inode *inode, void *addr, unsigned int block,
>> +		      struct ubifs_data_node *dn);
>
> Please prefix the function name with ubifs_ to avoid namespace pollution.

Good point, thanx
>
> Thanks,
> //richard
> .
>
