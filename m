Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI86W-0003Os-Ss
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 13:10:07 -0400
Message-ID: <433193E8.7030501@mw-itcon.de>
Date: Wed, 21 Sep 2005 19:10:00 +0200
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
	<43317FF6.1010507@mw-itcon.de> <43318348.7050401@yandex.ru>	
	<433185EC.1000509@mw-itcon.de>
	<1127319592.20014.93.camel@sauron.oktetlabs.ru>
In-Reply-To: <1127319592.20014.93.camel@sauron.oktetlabs.ru>
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
> On Wed, 2005-09-21 at 18:10 +0200, Peter Menzebach wrote:
> 
>>Artem B. Bityutskiy wrote:
>>
>>>But.. Argh! Look at line 488: if (pad && !jffs2_dataflash(c))
>>>
>>>Why !jffs2_dataflash(c)??? I bet this is the bug.
>>>
>>
>>Nope, it's OK there, only when padding.
> 
> OK, its late here and my head is working only on 2%. But anyway, today I
> insist this is a bug. :-)
> 
> I don't understand what is the pad parameter at all. AFAICS, it is just
> an old rudiment. What is padding? If the write buffer is not full, we
> fill the rest of it by padding and flush it. Why we may not want this? I
> have no idea. This is something odd. Why DataFlash is something
> special??? May be I'm too stupid today to understand this? Later.
> 
You are right (both):
It's late, and it was the bug....
Tomorrow is another day....

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
