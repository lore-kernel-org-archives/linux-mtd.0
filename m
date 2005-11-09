Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZrFI-0006OB-UX
	for linux-mtd@lists.infradead.org; Wed, 09 Nov 2005 09:48:24 -0500
Message-ID: <43720C0C.2040905@yandex.ru>
Date: Wed, 09 Nov 2005 17:47:40 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Bernhard Priewasser <priewasser@gmail.com>
References: <436A3949.1000001@gmail.com> <436A3BBD.5040405@yandex.ru>
	<436F4CD5.6030909@gmail.com> <4370B6DC.4070203@yandex.ru>
	<4371F867.6060301@gmail.com>
In-Reply-To: <4371F867.6060301@gmail.com>
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

Bernhard Priewasser wrote:
>> Suppose we have an almost full partition. You write N bytes. There is 
>> only M free space, M < N. If there is N-M of dirty space, GC is 
>> started. Otherwise, -ENOSPC. GC will work until there is enough space 
>> to write. No need to GC the whole partition... Only if the dirty space 
>> is distributed over it, then yes. And yes, the more data is on the FS, 
>> the less is the GC performance and the greater is the average latency...
>>
>> Or, since blocks to GC are picked randomly, we may end up with GC of 
>> the whole partition, hypothetically, but unlikely.
> 
> OK. Things become more clearly. A write request to an almost full 
> partition always issues garbage collecting just as much space (nodes) 
> which is neccessary for writing the new data? And full GC is performed 
> only at mount? (And if c->resv_blocks_gctrigger is reached?)
Not almost full partition. Here are some statements:

1. GC starts if there are no *free eraseblocks*.
2. GC makes free space in units of an eraseblock.
3. No GC is needed on mount.

JFFS2 does *checking* on mount, i.e., checks all CRCs. It is done in the 
context of the GC thread, but does not actually relate to the Garbage 
Collection. This is just how it is implemented.

>>> jffs2_erase_pending_blocks(), am I right? When is it called? I can only
>>> find it in jffs2_write_super() with count=0 and jffs2_find_nextblock()
>>> with count=1.
>>
>> So, you've answered your question :-)
> 
> I meant the way it is called by kupdated (which I don't know at all).
Will just add to what Josh said.

jffs2_write_super() is called when the JFFS2 superblock is dirty 
(JFFS2's sb->s_dirt is set). JFFS2 marks its "struct superblock" 
structure as dirty when something is added to the erase_pending_list or 
written to the wbuf.

When sb->s_dirt, kupdated will call jffs2_write_super() in some 
configurable time and JFFS2 will erase pending eraseblocks and flush the 
wbuf.

I'm not sure why JFFS2 does not use its own timer for this. But it seems 
it used to.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
