Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSbRX-0001Iu-Ky
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 08:26:27 -0500
Message-ID: <4194B4DC.4070909@oktetlabs.ru>
Date: Fri, 12 Nov 2004 16:04:28 +0300
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4193B304.1010009@yandex.ru>
	<1100262876.21273.115.camel@baythorne.infradead.org>
In-Reply-To: <1100262876.21273.115.camel@baythorne.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: spin_lock() needed ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I think you're right -- if the first node in the per-inode list is
> obsolete, then this can happen. README.Locking agrees with this
> assessment. 
> 
> But I'm not sure the first node _can_ be obsolete. After all, nodes
> become obsolete because we do something to make them so, and we can only
> do that by writing a _new_ node... which ends up at the head of the
> list.
Hmm, true.
> 
> But it certainly wants a bloody great comment to that effect, at the
> very least -- I suppose we might as well just take the lock.
> 
> In fact I suspect it may be possible to get an obsolete node at the head
> of the list, immediately after booting. There's no real ordering on the
> list at that point. 
Yes, and it seems not only "immediately after booting", but as long as a 
file wasn't changed after booting...

So, it seems the lock would be good.

Thanks for comment. I'll try to fix this.


-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
