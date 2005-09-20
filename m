Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHjmr-0000R5-SL
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 11:12:13 -0400
Message-ID: <433026A1.20008@yandex.ru>
Date: Tue, 20 Sep 2005 19:11:29 +0400
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
In-Reply-To: <43302456.4080601@mw-itcon.de>
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
> Artem B. Bityutskiy wrote:
>> But In your logs, I saw that you have *write buffer* size = 8*1056!
>> Write buffer size is another thing. It is the minimal flash IO unit.
>> JFFS2 assumes that it cannot write 1 byte or 100 bytes, it assumes that
>> it can only write 'write buffer size' bytes. And the goal of the write
>> buffer is to accumulate many small JFFS2 writes in RAM, and when the
>> write buffer becomes full, it is flushed to flash.
>> So, in your case, make write buffer = Data Flash page size = 1056.
>>
> How can this reported from the flash device to the mtd layer and then to 
> jffs2?
> In the code, I see at the moment only, that in the device driver 
> mtd_info.erasesize is set, later on in jffs2 I see, that this has become 
> the sector_size, which becomes then the wbuf_pagesize.
I see, in jffs2_dataflash_setup(): c->wbuf_pagesize = c->sector_size;
I don't know why Andrew Victor set wbuf size to Sector Size. May be 
you'll ask him?

Ok, theoretically this should work as well. But having smaller wbuf size 
is better.

> Is here mtd_info.ooblock to be set?
Yes, I in case of NAND we use this, I guess you may use it as well ... 
May be it is time to introduce a 'writesize' field to mtd_info, instead 
of 'oobblock' ... ?


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
