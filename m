Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSDIs-0005Dy-Qx
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 06:39:52 -0500
Message-ID: <41934F66.2060907@oktetlabs.ru>
Date: Thu, 11 Nov 2004 14:39:18 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <41921D97.7040300@oktetlabs.ru>
	<1100171797.8191.1362.camel@hades.cambridge.redhat.com>
In-Reply-To: <1100171797.8191.1362.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 & the write buffer patch
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Wed, 2004-11-10 at 16:54 +0300, Artem Bityuckiy wrote:
> 
>>Dear JFFS2 maintainers,
>>
>>I was recently fixed the problem with the JFFS2 write buffer races and 
>>have posted it to the MTD list. Unfortunately, maintainers did not 
>>comment the patch (only Estelle Hammache kindly responded).
> 
> 
> Sorry, I've been busy. Like you, I really don't like the extra locking.
> I was trying to find time to stare really hard at it and find a way of
> doing it without extra locks.
The best way that I see is:
1. Introduce additional functions like jffs2_flash_read_nolock(), 
jffs2_flush_wbuf_pad_nolock(), etc. When the alloc_sem is locked, use 
these functions (i.e., from the GC, etc).

We will need to accurately scan the JFFS2 code and substitute these new 
calls instead of old ones.

2. (optional). change the alloc_sem type and make it read/write. The 
only possible problem is that there is no "down_interruptible" call for 
rw semaphore, only uninterruptible.

This will require a little bit more work, but no additional mutex is 
needed. I may do this.

> Mail me a SSH public key and you can have an account to commit it
> yourself. But please let's convince ourself the new lock _really_ is
> necessary before we do that. I really don't like it.
> 
Thanks, I'll sent it to you.

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
