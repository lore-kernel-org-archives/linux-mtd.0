Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZP0OM-0004Io-Ke
 for linux-mtd@lists.infradead.org; Tue, 11 Aug 2015 03:38:23 +0000
Message-ID: <55C96CBD.6070303@cn.fujitsu.com>
Date: Tue, 11 Aug 2015 11:32:13 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3] ubifs: make ubifs_[get|set]xattr atomic
References: <55C444EA.7090305@cn.fujitsu.com>	
 <1438927640-14931-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439193902.26877.96.camel@gmail.com>
In-Reply-To: <1439193902.26877.96.camel@gmail.com>
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

On 08/10/2015 04:05 PM, Artem Bityutskiy wrote:
> Right now, AFAICS, UBIFS uses the "host" inode mutex to serialize xattr
> operations. May be the terminology is not the best, but "host" is the
> non-xattr inode (say, a file inode) which "carries" the extended
> attributes. So one "host" may have many xattrs.
>
> Now, obviously, locking the entire "host" to change one xattr is very
> coarse, because operations on other xattrs get blocked by operations on
> other, unrelated xattrs.
>
> So the host inode has fields like "xattr_size" - this needs to be
> protected with the host mutex, but operations on individual xattrs may
> be protected by xattr mutexes. However, this would be a more complex
> locking scheme.

Hi Atem, thanx for your explanation. :)

But I am afraid the current locking scheme is what you want that:

(host inode) xattr_size, xattr_cnt, xattr_names ------- protected by 
host->ui_mutex
(xattr inode) data ------ protected by ui->ui_mutex (with my patch applied)

So, I think fields in host are all protected by host->ui_mutex and
fields in xattr inodes are all protected by individual ui_mutex.

Am I missing something?

BTW, I found I have to add ui_mutex in create_xattr() even if you
agree with it. :)

Yang
>
>
> So my point is - use the "host->ui_mutex", not the xattr's mutex,
> because this is how it is implemented now.
>
> Re-working and improving locking could be a separate piece of job.
>
> On Fri, 2015-08-07 at 14:07 +0800, Dongsheng Yang wrote:
>> This commit make the ubifs_[get|set]xattr protected by ui_mutex.
>>
>> Originally, there is a possibility that ubifs_getxattr to get
>> a wrong value.
>>
>>    P1                                  P2
>> ----------                  	----------
>> ubifs_getxattr                      ubifs_setxattr
>> 					- kfree()
>> - memcpy()
>> 					- kmemdup()
>>
>
> ...
>
>>
>> +	mutex_lock(&ui->ui_mutex);
>
> Or to put it differently, you need to use 'host->ui_mutex', not 'ui
> ->ui_mutex', because 'ui' is the xattr inode here.
>
> .
>
