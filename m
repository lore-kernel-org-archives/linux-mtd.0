Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUKjR-0008Al-OU
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 06:41:26 -0400
Received: from esebh107.NOE.Nokia.com (esebh107.ntc.nokia.com [172.21.143.143])
	by mgw-ext13.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l2MAeo9X023542
	for <linux-mtd@lists.infradead.org>; Thu, 22 Mar 2007 12:41:14 +0200
Message-ID: <46025D07.6000204@nokia.com>
Date: Thu, 22 Mar 2007 12:40:07 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: bug in drivers/mtd/onenand/onenand_base.c?
References: <46024E33.10406@ru.mvista.com> <1174559669.17249.223.camel@sauron>
In-Reply-To: <1174559669.17249.223.camel@sauron>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Artem Bityutskiy wrote:
> On Thu, 2007-03-22 at 12:36 +0300, Vitaly Wool wrote:
>> The problem is, the entry of oobfree past the last valid 
>> one should have length 0.
>>
>> Here it's not the case: all the entries are occupied by 
>> OOB chunks. Therefore, once we get into a loop like
>>
>>         for (free = this->ecclayout->oobfree; free->length; ++free) {
>>
>> we might end up scanning past the real oobfree array.
> 
> We have this fixed in OneNAND.
> 

No we don't

I thought Kyungmin Park was going to fix it 
(see http://lists.infradead.org/pipermail/linux-mtd/2007-February/017479.html)
, then I forgot about it, sorry :-(
