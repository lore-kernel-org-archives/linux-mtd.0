Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNFjT-00022z-Me
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 07:36:56 +0000
Message-ID: <55C30D29.8020103@cn.fujitsu.com>
Date: Thu, 6 Aug 2015 15:30:49 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <viro@ZenIV.linux.org.uk>, <jack@suse.cz>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 19/35] ubifs: budget for inode in ubifs_dirty_inode
 if necessary
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>		
 <1438235311-23788-20-git-send-email-yangds.fnst@cn.fujitsu.com>	
 <1438762294.26877.14.camel@gmail.com> <55C302DA.6090709@cn.fujitsu.com>
 <1438846005.26877.45.camel@gmail.com>
In-Reply-To: <1438846005.26877.45.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/06/2015 03:26 PM, Artem Bityutskiy wrote:
> On Thu, 2015-08-06 at 14:46 +0800, Dongsheng Yang wrote:
>> On 08/05/2015 04:11 PM, Artem Bityutskiy wrote:
>>> On Thu, 2015-07-30 at 13:48 +0800, Dongsheng Yang wrote:
>>>> In ubifs, we have to do a budget for inode before marking
>>>> it as dirty. But sometimes, we would call dirty_inode in vfs
>>>> which will not do a budget for inode. In this case, we have
>>>> to do a budget in ubifs_dirty_inode() by ourselvies.
>>>>
>>>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>>>
>>> Could you please explain some more the problem you are trying to
>>> solve.
>>> Locking looks confusing and broken. It looks like what you are
>>> expressing is that the 'ui_mutex' is optional, and this smells
>>> fishy.
>>
>> Oh, yes, that's TRUE. This patch makes the locking broken. I am sorry
>> about it.
>>>
>> [...]
>>>
>>> Please, try to explain what you want to achieve some more. I am not
>>> sure I understand the end goal.
>>
>> Okey, what I want here is to doing a budget for the inode in
>> .dirty_inode called by vfs. Currently, the all work is under the full
>> control of ubifs as the comment of @ui_mutex said. But the
>> dquot_disable() is doing a dirty_inode() without asking ubifs is that
>> allowed. So I want to do the budget in ubifs_dirty_inode() itself
>> here.But, that's INCORRECT. Yes, my bad. Thanx for your comment.
>>
>> And I found another solution for it. To introduce a callback in quota
>> to allow filesystem to dirty inode in dquot_disable(). I believe that
>> works.
>
> Yes, the high-level picture is this.
>
> 1. Dirtying and inode implies liability - the system becomes liable to
> write it to the media.
>
> 2. Most file-systems have no problems with this, because there is
> always space allocated for the inode.
>
> 3. Some file-systems like UBIFS may have no space for writing dirty
> inodes. Often UBIFS can product this space, but it will involve forcing
> write-back, and there are locking issues when doing write-back from the
> write-back path.
>
> 4. So the approach UBIFS took is to allocate space in advance for every
> dirty inode.
>
> 5. To do that, UBIFS requires VFS avoid dirtying inodes directly, but
> instead, dirty them via the file-system. The file-system then has a
> chance to do all the necessary things related to dirtying the inode.
> The FS may even refuse to dirty the inode if in knows that it is
> impossible to do (the FS is 100% full, for example).

Hi Atem,
	Thanx for your detail. Yes, I figured this out by reading code
and comments in last days. Maybe I should have asked it to you earlier. :)
>
> So yes, if the generic quota code could dirty its inodes via the FS,
> not directly, that would be great.
>
> But please, check that the generic quota code can handle errors,
> because ubifs_dirty_inode() may return -ENOSPC or other errors.

Yes, of course. I will do that. And It would also be helpful to
other FS, such as btrfs which works in cow.

Thanx
Yang
>
> Artem.
> .
>
