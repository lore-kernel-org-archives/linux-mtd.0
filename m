Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cb119-0003wD-Sm
 for linux-mtd@lists.infradead.org; Tue, 07 Feb 2017 08:20:55 +0000
Message-ID: <5899831D.2070005@huawei.com>
Date: Tue, 7 Feb 2017 16:19:41 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: return ENOSPC if running out of inode number
References: <20170207072808.17816-1-shengyong1@huawei.com>
 <59847b44-37b8-a2f4-b993-dc48710036fe@nod.at>
In-Reply-To: <59847b44-37b8-a2f4-b993-dc48710036fe@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2/7/2017 3:57 PM, Richard Weinberger wrote:
> Sheng Yong,
> 
> Am 07.02.2017 um 08:28 schrieb Sheng Yong:
>> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
>> ---
>>  fs/ubifs/dir.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
>> index 528369f..00517dc 100644
>> --- a/fs/ubifs/dir.c
>> +++ b/fs/ubifs/dir.c
>> @@ -164,7 +164,7 @@ struct inode *ubifs_new_inode(struct ubifs_info *c, struct inode *dir,
>>  			ubifs_err(c, "out of inode numbers");
>>  			make_bad_inode(inode);
>>  			iput(inode);
>> -			return ERR_PTR(-EINVAL);
>> +			return ERR_PTR(-ENOSPC);
> 
> Can you please explain *why* this has to be changed to -ENOSPC?
Hi, Richard,

This is a trivial change. I think if there is not enough inode number available,
it means the filesystem has no room for the new file. So ENOSPC may be appropriate,
and some others filesystems returns ENOSPC in such scenario :)

thanks,
Sheng
> 
> Thanks,
> //richard
> 
> .
> 
