Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI6mB-0000ou-Cc
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 11:44:59 -0400
Message-ID: <43317FF6.1010507@mw-itcon.de>
Date: Wed, 21 Sep 2005 17:44:54 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: dedekind@infradead.org
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
	<433126F4.7060904@yandex.ru> <4331357A.2040501@mw-itcon.de>
	<1127309771.20014.80.camel@sauron.oktetlabs.ru>
In-Reply-To: <1127309771.20014.80.camel@sauron.oktetlabs.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: data  loss on jffs2 filesystem on dataflash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> On Wed, 2005-09-21 at 12:27 +0200, Peter Menzebach wrote:
> 
>>My assumptions now:
>>
>>We have to set the jffs2->sector_size to 8 * dataflash pagesize
>>We have to set the jffs2->wbuf_size to dataflash pagesize (528/1056)
> 
> Yes, IMO.
> 
Ok, sector_size now 8*1056, wbuf_size = 1056 erase_size=8*1056
-> kernel oops
-> ok, found SECTOR_ADDR was defined wrong
-> after fixing stable and not working correctly as before ;)
...
>>And still I didn't get the point, why it isn't working today....
> 
> Me too so far :-) If you send me a DataFlash-ed board - I'll dig
> this :-)

Ok, Ok, now I am digging a bit....
with some more printfs, I now looked a bit clearer, and have another 
question:
when jffs2_flush_wbuf is called, how is this area now markes as written.
Sometimes later jffs2_do_reserve_space is called an returns the same 
address, which was written to flash....

Any hints?

Best regards
Peter


-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
