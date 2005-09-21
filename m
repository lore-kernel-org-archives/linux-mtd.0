Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EI4rE-0006OA-Vk
	for linux-mtd@lists.infradead.org; Wed, 21 Sep 2005 09:42:32 -0400
Message-ID: <43316300.6060602@yandex.ru>
Date: Wed, 21 Sep 2005 17:41:20 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>	<43292F91.9010302@mw-itcon.de>
	<432FE1EF.9000807@yandex.ru>	<432FEF55.5090700@mw-itcon.de>
	<433006D8.4010502@yandex.ru>	<43300C08.80005@yandex.ru>
	<433010D8.7000209@mw-itcon.de>	<1127225899.20014.61.camel@sauron.oktetlabs.ru>	<43302456.4080601@mw-itcon.de>	<1127229060.17496.128.camel@fuzzie.sanpeople.com>	<1127233915.20014.76.camel@sauron.oktetlabs.ru>	<1127287279.25521.866.camel@fuzzie.sanpeople.com>	<433126F4.7060904@yandex.ru>
	<4331357A.2040501@mw-itcon.de>
	<1127309771.20014.80.camel@sauron.oktetlabs.ru>
In-Reply-To: <1127309771.20014.80.camel@sauron.oktetlabs.ru>
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

Artem B. Bityutskiy wrote:
>>We have to set the mtd->erasesize to 8 * dataflash pagesize
> 
> For JFFS2 it is OK. But for other purposes it may be not OK. So, that's
> up to you. MTD is NOR/NAND-centric at the moment. You may fix this.
> 
I mean, MTD probably must returm both - page and block sized. JFFS2 
should use block.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
