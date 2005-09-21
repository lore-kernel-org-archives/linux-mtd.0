Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI0rJ-0000zg-Gt
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 05:25:54 -0400
Message-ID: <433126F4.7060904@yandex.ru>
Date: Wed, 21 Sep 2005 13:25:08 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Andrew Victor <andrew@sanpeople.com>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>	
	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>	
	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>	
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>	
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>	
	<43300C08.80005@yandex.ru> <433010D8.7000209@mw-itcon.de>	
	<1127225899.20014.61.camel@sauron.oktetlabs.ru>	
	<43302456.4080601@mw-itcon.de>	
	<1127229060.17496.128.camel@fuzzie.sanpeople.com>	
	<1127233915.20014.76.camel@sauron.oktetlabs.ru>
	<1127287279.25521.866.camel@fuzzie.sanpeople.com>
In-Reply-To: <1127287279.25521.866.camel@fuzzie.sanpeople.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	Peter Menzebach <pm-mtd@mw-itcon.de>
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

Andrew Victor wrote:
> I don't.  I set the wbuf_pagesize to the sector_size.
> (Which at that time was 1 or more eraseblocks.  And I think sector_size
> is/was the smallest unit of flash that JFFS2 would ever erase/write).
You used to think or still think :-) ?
eraseblock, which is of size = c->sector_size is the smallest JFFS2 
erase unit.
The smallest write unit is usually *smaller* then eraseblock and = 
c->wbuf_pagesize. Your DataFlash port has c->wbuf_pagesize = 
c->sector_size which is wasteful. This leads to much faster Flash wear. 
This makes unneeded loads to JFFS2. This should work, but not the best 
approach.

> Maybe there is some confusion here.  Dataflash has both 'pages' and
> 'blocks'.  With a 'page' being the smallest unit that can be
> erased/written.
Yes, but it is impossible to make JFFS2 eraseblock = DataFlash page 
size. Why? Because the page is too small. JFFS2's nodes cannot overlap 
eraseblock's borders. So, we cannot fit large 4K JFFS2 nodes to such 
small (1056 bytes) eraseblocks. Thus, the most logical approach is to 
make eraseblock size = DataFlash page size.

> 
> The MTD-device's erasesize is therefore set to the smallest unit - the
> Dataflash page size (528 or 1056, depending on device)
Well, may be this is right that *MTD* reports erasesize = DataFlash page 
size. But JFFS2 then must realize that it works on top of DataFlash and 
use blocks as erase units.

> Dataflash does not use Padding nodes.
I'm about JFFS2 - it pads wbuf. But well, it does not matter anyway. If 
your wbuf is 8K, you write there 100 byters then do sync, you wate (8K - 
100) bytes. It doen't matter whether you write padding or not. You waste 
the space, period. :-)

> Maybe it would be more optimal to set the wbuf_size to eraseblocksize? 
> I don't know.
Grrr. No! We don't understand each other at all :-)

> I do know that JFFS2-on-Dataflash was working fine when I committed the
> changes in February.
Now it doesn't :-) Sure, you don't have to fix it :-) We were just 
curious. I guess Peter should deal with this.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
