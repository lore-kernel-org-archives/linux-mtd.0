Received: from smtprelay04.ispgateway.de ([80.67.18.16])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EZpvj-0004x1-2d
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 08:24:04 -0500
Received: from unknown (HELO deepspace9.in2soft.meep) (547986@[84.153.73.11])
	(envelope-sender <priewasser@gmail.com>)
	by smtprelay04.ispgateway.de (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 9 Nov 2005 13:23:55 -0000
Message-ID: <4371F867.6060301@gmail.com>
Date: Wed, 09 Nov 2005 14:23:51 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <436A3949.1000001@gmail.com> <436A3BBD.5040405@yandex.ru>
	<436F4CD5.6030909@gmail.com> <4370B6DC.4070203@yandex.ru>
In-Reply-To: <4370B6DC.4070203@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi Artem,

> So, the problem is that you think the code is not understandable? Offer 
> your changes then.
No, the problem is that it's not always understandable for ME, that's a 
big difference :-)

> Suppose we have an almost full partition. You write N bytes. There is 
> only M free space, M < N. If there is N-M of dirty space, GC is started. 
> Otherwise, -ENOSPC. GC will work until there is enough space to write. 
> No need to GC the whole partition... Only if the dirty space is 
> distributed over it, then yes. And yes, the more data is on the FS, the 
> less is the GC performance and the greater is the average latency...
> 
> Or, since blocks to GC are picked randomly, we may end up with GC of the 
> whole partition, hypothetically, but unlikely.
OK. Things become more clearly. A write request to an almost full 
partition always issues garbage collecting just as much space (nodes) 
which is neccessary for writing the new data? And full GC is performed 
only at mount? (And if c->resv_blocks_gctrigger is reached?)

>> jffs2_erase_pending_blocks(), am I right? When is it called? I can only
>> find it in jffs2_write_super() with count=0 and jffs2_find_nextblock()
>> with count=1.
> So, you've answered your question :-)
I meant the way it is called by kupdated (which I don't know at all).

> HTH,
It did! Thank you for patience.

-- 
Bernhard
