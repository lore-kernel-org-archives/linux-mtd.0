Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EI7Ap-0001bH-Bt
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 12:10:33 -0400
Message-ID: <433185EC.1000509@mw-itcon.de>
Date: Wed, 21 Sep 2005 18:10:20 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>		<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>		<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>		<43292F91.9010302@mw-itcon.de>
	<432FE1EF.9000807@yandex.ru>		<432FEF55.5090700@mw-itcon.de>
	<433006D8.4010502@yandex.ru>		<43300C08.80005@yandex.ru>
	<433010D8.7000209@mw-itcon.de>		<1127225899.20014.61.camel@sauron.oktetlabs.ru>		<43302456.4080601@mw-itcon.de>		<1127229060.17496.128.camel@fuzzie.sanpeople.com>		<1127233915.20014.76.camel@sauron.oktetlabs.ru>		<1127287279.25521.866.camel@fuzzie.sanpeople.com>		<433126F4.7060904@yandex.ru>
	<4331357A.2040501@mw-itcon.de>	<1127309771.20014.80.camel@sauron.oktetlabs.ru>	<43317FF6.1010507@mw-itcon.de>
	<43318348.7050401@yandex.ru>
In-Reply-To: <43318348.7050401@yandex.ru>
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
>
> But.. Argh! Look at line 488: if (pad && !jffs2_dataflash(c))
> 
> Why !jffs2_dataflash(c)??? I bet this is the bug.
> 
Nope, it's OK there, only when padding.

In my logs, wbuf_len is always 0.

Then when I write the flash,
free_size, wasted_size, used_size is adjusted with 0.

How is the intention of the write buffer?
- I write 10 bytes at the beginning
- Then after 2 seconds, the buffer is flushed
- I it correct, to adjust with wbuf_len, or must it be wbuf_size?

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
