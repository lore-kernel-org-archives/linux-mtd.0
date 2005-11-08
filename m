Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZUWW-0003oP-C1
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 09:32:37 -0500
Message-ID: <4370B6DC.4070203@yandex.ru>
Date: Tue, 08 Nov 2005 17:31:56 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <436A3949.1000001@gmail.com> <436A3BBD.5040405@yandex.ru>
	<436F4CD5.6030909@gmail.com>
In-Reply-To: <436F4CD5.6030909@gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: GC operation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bernhard,

Bernhard Priewasser wrote:
>  > Brr, didn't get it.. GC may be ugly if what?
> If someone wants to understand how it works in detail :-)
So, the problem is that you think the code is not understandable? Offer 
your changes then.

> 
>  >> When and how is GC called?
>  > From the GC thread and when there is no (or few) free space to write.
>  > In the latter case the writing process is blocked and waits until GC
>  > has freed some space.
> E.g. if it is considered as neccessary either by jffs2_reserve_space()
> or jffs2_thread_should_wake().
> Something about the blocking topic... If there is almost no free space
> and a write command issued, can it be blocked until the whole partition
> is GC'd (worst case)?? What a latency time... Are there mechanisms to
> avoid/control this? What about the "erase suspend" thing?
Hmm.

Suppose we have an almost full partition. You write N bytes. There is 
only M free space, M < N. If there is N-M of dirty space, GC is started. 
Otherwise, -ENOSPC. GC will work until there is enough space to write. 
No need to GC the whole partition... Only if the dirty space is 
distributed over it, then yes. And yes, the more data is on the FS, the 
less is the GC performance and the greater is the average latency...

Or, since blocks to GC are picked randomly, we may end up with GC of the 
whole partition, hypothetically, but unlikely.

> jffs2_erase_pending_blocks(), am I right? When is it called? I can only
> find it in jffs2_write_super() with count=0 and jffs2_find_nextblock()
> with count=1.
So, you've answered your question :-)

HTH,
Artem.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
