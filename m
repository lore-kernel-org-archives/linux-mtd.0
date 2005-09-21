Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI70Z-0001C0-1D
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 11:59:58 -0400
Message-ID: <43318348.7050401@yandex.ru>
Date: Wed, 21 Sep 2005 19:59:04 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
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
	<43317FF6.1010507@mw-itcon.de>
In-Reply-To: <43317FF6.1010507@mw-itcon.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Peter Menzebach wrote:
> Ok, Ok, now I am digging a bit....
> with some more printfs, I now looked a bit clearer, and have another 
> question:
> when jffs2_flush_wbuf is called, how is this area now markes as written.
> Sometimes later jffs2_do_reserve_space is called an returns the same 
> address, which was written to flash....
> 
The space is accounted by corresponding fields in jffs2_eraseblock 
structure: free_size, wasted_size, used_size.

Jffs2 always writes to c->sector_size - jeb->free_size.

The corresponding place in jffs2_flush_wbuf, where the parameters a 
adjusted is wbuf.c:506.

But.. Argh! Look at line 488: if (pad && !jffs2_dataflash(c))

Why !jffs2_dataflash(c)??? I bet this is the bug.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
