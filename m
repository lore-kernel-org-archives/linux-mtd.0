Received: from www.mw-itcon.de ([213.146.115.73])
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHiKh-0006dK-5d
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 09:39:01 -0400
Message-ID: <433010D8.7000209@mw-itcon.de>
Date: Tue, 20 Sep 2005 15:38:32 +0200
From: Peter Menzebach <pm-mtd@mw-itcon.de>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <432812E8.2030807@mw-itcon.de>	<432817FF.10307@yandex.ru>	<4329251C.7050102@mw-itcon.de>	<4329288B.8050909@yandex.ru>
	<43292AC6.40809@mw-itcon.de>	<43292E16.70401@yandex.ru>
	<43292F91.9010302@mw-itcon.de> <432FE1EF.9000807@yandex.ru>
	<432FEF55.5090700@mw-itcon.de> <433006D8.4010502@yandex.ru>
	<43300C08.80005@yandex.ru>
In-Reply-To: <43300C08.80005@yandex.ru>
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
>> Artem B. Bityutskiy wrote:
>> I glanced at the manual. Uhh, DataFlash is very specific beast. It 
>> suppoers page program with built-in erase command... So DataFlash 
>> effectively may be considered as a block device. Then you may use any 
>> FS on it providing you have wrote proper driver? Why do you need JFFS2 
>> then :-) ?
I do need some wear leveling (and a filesystem which supports block 
sizes of 1056 bytes ;) )

>> JFFS2 orients to "classical" flashes. They have no "write page with 
>> built-in erase" operation.
>>
>> Didn't read the manual carefully, what do they refer by "Main memory 
>> array"?
The main memory array is the flash itself with pages of 1056 bytes

>> BTW, having 8*1056 write buffer is not perfect ides, better make it as 
>> small as possible, i.e., 1056 bytes.
At the moment, the write buffer = reported erase block size. Is this 
neccessary that this is equal?

my reasons for setting erase block size to 8(16)*1056:
1. my lazyness -> I have to patch the mkfs.jff2 every time, since it 
makes a guess, that -e 1056 is not a very good idea (at lest the 
versions some times ago)

2. It seemed to me, that jffs2 boots faster, if the number of blocks is 
smaller.

3. A guess without proof: jffs2 likes blocks which are not too small

Best regards
Peter

-- 
Peter Menzebach
Menzebach und Wolff IT-Consulting GbR
Phone +49 751 355 387 1
