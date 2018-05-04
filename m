Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fEVkc-0004Kk-8K
 for linux-mtd@lists.infradead.org; Fri, 04 May 2018 08:07:36 +0000
Subject: Re: [PATCH] jffs2: safely remove obsolete dirent from the f->dents
 list
To: David Woodhouse <dwmw2@infradead.org>
CC: <Joakim.Tjernlund@infinera.com>, <viro@zeniv.linux.org.uk>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20180329120023.33169-1-yuyufen@huawei.com>
 <1524867762.18504.89.camel@infradead.org>
From: yuyufen <yuyufen@huawei.com>
Message-ID: <223f07c9-f07d-f434-6478-274990fbdf54@huawei.com>
Date: Fri, 4 May 2018 16:06:24 +0800
MIME-Version: 1.0
In-Reply-To: <1524867762.18504.89.camel@infradead.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 2018/4/28 6:22, David Woodhouse wrote:
> This looks a lot better than the first iteration; thank you for getting
> it to this point. One last thing, I hope...
> On Thu, 2018-03-29 at 20:00 +0800, Yufen Yu wrote:
>> --- a/fs/jffs2/jffs2_fs_i.h
>> +++ b/fs/jffs2/jffs2_fs_i.h
>> @@ -42,6 +42,12 @@ struct jffs2_inode_info {
>>          /* Directory entries */
>>          struct jffs2_full_dirent *dents;
>>   
>> +       /* Directory open refcount */
>> +       atomic_t nr_dir_opening;
>> +
>> +       /* obsolete dirent count in the list of 'dents' */
>> +       unsigned int obsolete_count;
>> +
>>          /* The target path if this is the inode of a symlink */
>>          unsigned char *target;
>>   
> You've made JFFS2_INVALID_LIMIT 64, which is reasonable enough
> (although it's a bit of a weird name and possibly wants to be more
> specific — invalid *what*?).
Thansk a lot for your suggestions.

Yes, it is really a bad name. How about JFFS2_OBS_DIRENT_LIMIT?  I am 
not sure.

>
> So the maximum interesting value of ->obsolete_count is 64. Which means
> it might as well be a uint8_t and sit in the padding after the
> 'usercompr' field.
>
> It might be useful to look at putting the mutually exclusive fields in
> struct jffs2_inode_info into a union, and then we don't need the
> additional space of the atomic_t either; we'll never need that *and*
> the fragtree at the same time... will we?
You are right, thanks. But, obsolete_count may be large. So, I apply to 
use uint16_t and
it also sits in the padding after the 'usercompr' field.

Thanks,
Yufen
