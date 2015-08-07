Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNYDj-0005n1-47
 for linux-mtd@lists.infradead.org; Fri, 07 Aug 2015 03:21:23 +0000
Message-ID: <55C422C0.4050206@cn.fujitsu.com>
Date: Fri, 7 Aug 2015 11:15:12 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <viro@ZenIV.linux.org.uk>,
 <jack@suse.cz>, <dedekind1@gmail.com>, <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 17/35] ubifs: export read_block() from file.c
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-18-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFD993.3000808@nod.at> <55BFDD4F.4060005@nod.at>
In-Reply-To: <55BFDD4F.4060005@nod.at>
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

On 08/04/2015 05:29 AM, Richard Weinberger wrote:
> Am 03.08.2015 um 23:13 schrieb Richard Weinberger:
>> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>>> We want to use read_block to read quota file bypass the page cache.
>>> So export it from file.c, then we can use it in somewhere else.
>>>
>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>> ---
>>>   fs/ubifs/file.c  | 4 ++--
>>>   fs/ubifs/ubifs.h | 2 ++
>>>   2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
>>> index 554d7b9..f307e86 100644
>>> --- a/fs/ubifs/file.c
>>> +++ b/fs/ubifs/file.c
>>> @@ -54,7 +54,7 @@
>>>   #include <linux/namei.h>
>>>   #include <linux/slab.h>
>>>
>>> -static int read_block(struct inode *inode, void *addr, unsigned int block,
>>> +int ubifs_read_block(struct inode *inode, void *addr, unsigned int block,
>>>   		      struct ubifs_data_node *dn)
>
> Forgot one minor comment, as the function is now public please document the
> parameters.

Thanx, will update it in next verison.

Yang
>
> Thanks,
> //richard
> .
>
