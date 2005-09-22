Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIRjc-0007c5-TP
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 10:09:38 -0400
Message-ID: <4332BA7E.3060409@yandex.ru>
Date: Thu, 22 Sep 2005 18:06:54 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de> <4332A3E8.8020002@mw-itcon.de>
	<1127393059.20014.105.camel@sauron.oktetlabs.ru>
	<4332B24F.2050305@mw-itcon.de>
In-Reply-To: <4332B24F.2050305@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Peter Menzebach wrote:
> But in this case mtd_info structure has to be changed/extended. 
> Otherwise the information does not get to the jffs2 layer. How 
> should/could this be managed?
Yes. As a hacky solution you may use mtd->oobblock to inform about 
DataFlash page size.

>>> IMHO the cleanest solution would be, that the dataflash/mtd layer
>>> reports it's true erase_size = smallest write size = 528/1056 bytes, and
>>> should not make a further guess about later use.
>>
>>
> Problem is here, how does the user get the information about the erase 
> size used by jffs2?
He detects that the flash is DataFlash (mtd->type == MTD_DATAFLASH). 
Afterwards he knows, that
1. mtd->erasesize is the size of DataFlash block
2. mtd->oobblock is the size of DataFlash page

May be this is not the best solution. Consult tglx1.

> Are these two values typically existing? In the dataflash case, it's 
> only one value.
Sorry, didn't get it. I mean, MTD provide information about both 
DataFlash block size and DataFlash page size. That's obvious.

>>> -    if (SECTOR_ADDR(to) != SECTOR_ADDR(c->wbuf_ofs)) {
>>> +    if (PAGE_DIV(to) != PAGE_DIV(c->wbuf_ofs)) {
>>
>> Why this change ?
> 
> c->sector_size != c->wbuf_ofs
Of course.
c->sector_size = eraseblock size
c->wbuf_ofs - the absolute offset from the beginning of the partition 
where wbuf will be written.

The if() just check if JFFS2 switched to another eraseblock (because we 
are at the end of eraseblock and there is anyway too few space to write 
any node). So, SECTOR_ADDR() is absolutely correct. What's wrong?

> 
>>>      if (!c->mtd->block_markbad)
>>> -        return 1; // What else can we do?
>>> +        return 1;
>>
>>
>> Why this change ?
> 
> C++ comment
Well, it does not relate to the DataFlash stuff. It is generally good 
idea to send this as a distinct patch. But don't want to be an ass, so, 
let it be :-) Although dwmw2 is usually hit the celling when I edit his 
comments and I would prefer if you just change it to /* */ ... :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
