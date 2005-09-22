Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIOge-0002jR-Bp
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 06:52:27 -0400
Message-ID: <43328CBD.7050700@yandex.ru>
Date: Thu, 22 Sep 2005 14:51:41 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>		<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>		<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>		<43292F91.9010302@mw-itcon.de>
	<432FE1EF.9000807@yandex.ru>		<432FEF55.5090700@mw-itcon.de>
	<433006D8.4010502@yandex.ru>		<43300C08.80005@yandex.ru>
	<433010D8.7000209@mw-itcon.de>		<1127225899.20014.61.camel@sauron.oktetlabs.ru>		<43302456.4080601@mw-itcon.de>		<1127229060.17496.128.camel@fuzzie.sanpeople.com>		<1127233915.20014.76.camel@sauron.oktetlabs.ru>		<1127287279.25521.866.camel@fuzzie.sanpeople.com>		<433126F4.7060904@yandex.ru>
	<4331357A.2040501@mw-itcon.de>		<1127309771.20014.80.camel@sauron.oktetlabs.ru>		<43317FF6.1010507@mw-itcon.de>
	<43318348.7050401@yandex.ru>		<433185EC.1000509@mw-itcon.de>	<1127319592.20014.93.camel@sauron.oktetlabs.ru>
	<433193E8.7030501@mw-itcon.de> <433289B9.7070609@mw-itcon.de>
In-Reply-To: <433289B9.7070609@mw-itcon.de>
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
> Ok, so far one step again...
> but I don't find the place, where jeb->free_size and c->free_size is 
> adjusted for the *data* (wbuf_len). I find this only for the padding.
> Any ideas?

Hmm, at the very end of __jffs2_flush_wbuf() I suppose.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
