Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNF2r-0004uE-Pb
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 06:52:54 +0000
Message-ID: <55C302DA.6090709@cn.fujitsu.com>
Date: Thu, 6 Aug 2015 14:46:50 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <viro@ZenIV.linux.org.uk>, <jack@suse.cz>,
 <richard.weinberger@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH v2 19/35] ubifs: budget for inode in ubifs_dirty_inode
 if necessary
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>	
 <1438235311-23788-20-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438762294.26877.14.camel@gmail.com>
In-Reply-To: <1438762294.26877.14.camel@gmail.com>
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

On 08/05/2015 04:11 PM, Artem Bityutskiy wrote:
> On Thu, 2015-07-30 at 13:48 +0800, Dongsheng Yang wrote:
>> In ubifs, we have to do a budget for inode before marking
>> it as dirty. But sometimes, we would call dirty_inode in vfs
>> which will not do a budget for inode. In this case, we have
>> to do a budget in ubifs_dirty_inode() by ourselvies.
>>
>> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
>
> Could you please explain some more the problem you are trying to solve.
> Locking looks confusing and broken. It looks like what you are
> expressing is that the 'ui_mutex' is optional, and this smells fishy.

Oh, yes, that's TRUE. This patch makes the locking broken. I am sorry
about it.
>
[...]
>
> Please, try to explain what you want to achieve some more. I am not
> sure I understand the end goal.

Okey, what I want here is to doing a budget for the inode in
.dirty_inode called by vfs. Currently, the all work is under the full
control of ubifs as the comment of @ui_mutex said. But the
dquot_disable() is doing a dirty_inode() without asking ubifs is that
allowed. So I want to do the budget in ubifs_dirty_inode() itself here.

But, that's INCORRECT. Yes, my bad. Thanx for your comment.

And I found another solution for it. To introduce a callback in quota
to allow filesystem to dirty inode in dquot_disable(). I believe that
works.

Anyway, I agree that this patch is a fishy one here. I will drop it
in next version and send a better solution for it. Of course, with
some more description for what I am doing. :)

Thanx a lot, Richard and Atem

Yang
>
> Artem.
> .
>
