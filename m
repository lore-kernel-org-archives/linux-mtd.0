Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gd11D-0002L6-8r
	for linux-mtd@lists.infradead.org; Thu, 26 Oct 2006 04:55:30 -0400
Message-ID: <454077F5.2030905@ru.mvista.com>
Date: Thu, 26 Oct 2006 12:55:17 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't work
	when flash-based bbt not enabled
References: <Pine.LNX.4.64.0610230928360.25906@lnxricardw.se.axis.com>	<1161597141.19446.276.camel@pmac.infradead.org>	<453DDE6C.2070304@ru.mvista.com>
	<Pine.LNX.4.64.0610250851290.25906@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.0610250851290.25906@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof wrote:
> On Tue, 24 Oct 2006, Vitaly Wool wrote:
>
>   
>>> Hm. That seems wrong to me. If we don't want to read or write the main
>>> area, we should set ops.len to zero. And if that doesn't work, it should
>>> probably be fixed.
>>>
>>> I'd rather see a patch which fixes that.
>>>
>>>
>>>       
>> We discussed that w/ tglx some time ago and we couldn't find a 5 minute
>> solution :)
>>     
>
> Was there a discussion on the mtd list? I scanned the archives back to 
> April and couldn't find anything.
>   
No, we did chat in #mtd channel.

Anyway, here's what I think of that. It looks like the idea was to use 
ops.len in order to read more than ooblen bytes, i. e. more than one OOB 
area basically, and preserve ooblen to signal how many bytes there is in 
one oob. However, that seems misleading/redundant since you can always 
figure out how many bytes there are in oob, so it looks like making that 
all work w/ ooblen is better.

Does that make sense?
I'm going to work on that as soon as load permits...

Vitaly
