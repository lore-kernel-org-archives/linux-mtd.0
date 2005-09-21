Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI1of-0002Vv-B0
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 06:27:42 -0400
Message-ID: <4331357A.2040501@mw-itcon.de>
Date: Wed, 21 Sep 2005 12:27:06 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>		<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>		<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>		<43292F91.9010302@mw-itcon.de>
	<432FE1EF.9000807@yandex.ru>		<432FEF55.5090700@mw-itcon.de>
	<433006D8.4010502@yandex.ru>		<43300C08.80005@yandex.ru>
	<433010D8.7000209@mw-itcon.de>		<1127225899.20014.61.camel@sauron.oktetlabs.ru>		<43302456.4080601@mw-itcon.de>		<1127229060.17496.128.camel@fuzzie.sanpeople.com>		<1127233915.20014.76.camel@sauron.oktetlabs.ru>	<1127287279.25521.866.camel@fuzzie.sanpeople.com>
	<433126F4.7060904@yandex.ru>
In-Reply-To: <433126F4.7060904@yandex.ru>
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
> Andrew,
> 
> Andrew Victor wrote:
> 
>> I do know that JFFS2-on-Dataflash was working fine when I committed the
>> changes in February.
> 
> Now it doesn't :-) Sure, you don't have to fix it :-) We were just 
> curious. I guess Peter should deal with this.
> 
Ok guys,
I will try, to get it to work, but at the moment I'm a little bit lost.

So here, what I saw in the data sheet, code and your answers:

Dataflash:

The dataflash has a smallest unit = dataflash page, which can be written 
and erased (528/1056 bytes)

The dataflash has blocks, which are 8 * pagesize. This units may be used 
for programming/erasing, but is not used in the driver

The dataflash has sectors, which are 256 pages (sector0+1 are special). 
These sectors are only relevant in terms of wear leveling, since each 
page of a sector must be reprogrammed at least once each 10.000 writes.

jffs2:
jffs2 nodes are 4 K
the wbuf_size should be the smallest size, which you can re-program

My assumptions now:

We have to set the jffs2->sector_size to 8 * dataflash pagesize
We have to set the jffs2->wbuf_size to dataflash pagesize (528/1056)
We have to set the mtd->erasesize to 8 * dataflash pagesize


And still I didn't get the point, why it isn't working today....

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
