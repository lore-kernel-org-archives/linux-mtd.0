Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSXpf-0000M6-TK
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 04:35:07 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id CF92822886
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2004 12:34:30 +0300 (MSK)
Message-ID: <419483A6.6070405@yandex.ru>
Date: Fri, 12 Nov 2004 12:34:30 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41921D97.7040300@oktetlabs.ru>	<1100171797.8191.1362.camel@hades.cambridge.redhat.com>
	<41934F66.2060907@oktetlabs.ru>
In-Reply-To: <41934F66.2060907@oktetlabs.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2 & the write buffer patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello guys.

Since nobody suggest something better than introducing new mutex, I 
think my patch is OK.

Just few thoughts.

There are the following semaphores in JFFS2 used:
1. c->alloc_sem
2. c->gc_thread_start
3. c->erase_free_sem

We may use only c->alloc_sem - but it is very inefficient since it is 
usually locked for a relatively long time by the GC and flash writers.

c->gc_thread_start - we may use this one - but we at least should rename 
it somehow.

c->erase_free_sem - very special semaphore which is used when the GC 
processes the deletion direntries.

So, I think the introduction of new RW semaphore is the best and most 
efficient solution. If nobody comment, I think we should commit by patch 
with new semaphore.

Artem Bityuckiy wrote:
> David Woodhouse wrote:
> 
>> On Wed, 2004-11-10 at 16:54 +0300, Artem Bityuckiy wrote:
>>
>>> Dear JFFS2 maintainers,
>>>
>>> I was recently fixed the problem with the JFFS2 write buffer races 
>>> and have posted it to the MTD list. Unfortunately, maintainers did 
>>> not comment the patch (only Estelle Hammache kindly responded).
>>
>>
>>
>> Sorry, I've been busy. Like you, I really don't like the extra locking.
>> I was trying to find time to stare really hard at it and find a way of
>> doing it without extra locks.
> 
> The best way that I see is:
> 1. Introduce additional functions like jffs2_flash_read_nolock(), 
> jffs2_flush_wbuf_pad_nolock(), etc. When the alloc_sem is locked, use 
> these functions (i.e., from the GC, etc).
> 
> We will need to accurately scan the JFFS2 code and substitute these new 
> calls instead of old ones.
> 
> 2. (optional). change the alloc_sem type and make it read/write. The 
> only possible problem is that there is no "down_interruptible" call for 
> rw semaphore, only uninterruptible.
> 
> This will require a little bit more work, but no additional mutex is 
> needed. I may do this.
> 
>> Mail me a SSH public key and you can have an account to commit it
>> yourself. But please let's convince ourself the new lock _really_ is
>> necessary before we do that. I really don't like it.
>>
> Thanks, I'll sent it to you.
> 

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
