Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHiYo-0006uT-W2
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 09:53:32 -0400
Message-ID: <43300C08.80005@yandex.ru>
Date: Tue, 20 Sep 2005 17:18:00 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Peter Menzebach <pm-mtd@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
In-Reply-To: <433006D8.4010502@yandex.ru>
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
> Peter Menzebach wrote:
> 
>> No, not at then moment. If I have some time, I can try to rewrite the 
>> chipset driver, that it reports a sector size of 1024.
> 
> 
> I glanced at the manual. Uhh, DataFlash is very specific beast. It 
> suppoers page program with built-in erase command... So DataFlash 
> effectively may be considered as a block device. Then you may use any FS 
> on it providing you have wrote proper driver? Why do you need JFFS2 then 
> :-) ?
> 
> JFFS2 orients to "classical" flashes. They have no "write page with 
> built-in erase" operation.
> 
> Didn't read the manual carefully, what do they refer by "Main memory 
> array"?
> 
> BTW, having 8*1056 write buffer is not perfect ides, better make it as 
> small as possible, i.e., 1056 bytes.
> 
Ups, I sent the mail to LKML instead of MTD ML by accident :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
