Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EHixQ-0007La-HS
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 10:19:00 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Peter Menzebach <pm-mtd@mw-itcon.de>
In-Reply-To: <433010D8.7000209@mw-itcon.de>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>
	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
	<43300C08.80005@yandex.ru>  <433010D8.7000209@mw-itcon.de>
Content-Type: text/plain
Date: Tue, 20 Sep 2005 18:18:19 +0400
Message-Id: <1127225899.20014.61.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: data  loss on jffs2 filesystem on dataflash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-20 at 15:38 +0200, Peter Menzebach wrote:
> I do need some wear leveling (and a filesystem which supports block 
> sizes of 1056 bytes ;) )
Ok.

> The main memory array is the flash itself with pages of 1056 bytes
Ok, just strange name. On the picture they call it "Flash memory array".

> my reasons for setting erase block size to 8(16)*1056:
> 1. my lazyness -> I have to patch the mkfs.jff2 every time, since it 
> makes a guess, that -e 1056 is not a very good idea (at lest the 
> versions some times ago)
-e specifies the *erasesize*. In your case, make it = DataFlash block
size = 8*1056. So, all is OK. Although you may make it 1056 (DataFlash
allows this?), it is bad idea.

But In your logs, I saw that you have *write buffer* size = 8*1056!
Write buffer size is another thing. It is the minimal flash IO unit.
JFFS2 assumes that it cannot write 1 byte or 100 bytes, it assumes that
it can only write 'write buffer size' bytes. And the goal of the write
buffer is to accumulate many small JFFS2 writes in RAM, and when the
write buffer becomes full, it is flushed to flash. 

So, in your case, make write buffer = Data Flash page size = 1056.


> 2. It seemed to me, that jffs2 boots faster, if the number of blocks is 
> smaller.
I guess we have got confused with terminology. Please, let use this:

eraseblock - the minimal erase unit
IO block - the minimal IO unit = write buffer size

eraseblocks are usually larger then IO blocks.

The larger is the IO block, the more data you loose due to unclean
reboots in case of JFFS2. So, don't make it larger then 1056.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
