Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14LiEW-0000eA-00
	for mtd-list@infradead.org; Thu, 25 Jan 2001 08:58:20 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14LiEO-0000e4-00
	for mtd@infradead.org; Thu, 25 Jan 2001 08:58:17 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A6E7687.9070200@bigpond.com> 
References: <3A6E7687.9070200@bigpond.com> 
To: brendan.simon@bigpond.com
Cc: mtd <mtd@infradead.org>
Subject: Re: MTD: linux-2.4.0-test9 on a PowerPC board. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 25 Jan 2001 08:54:39 +0000
Message-ID: <8917.980412879@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


brendan.simon@bigpond.com said:
>  Trying to debug things we have noticed that some of the data returned
>  has the bytes swapped.  It seems the NUM ERASE UNITS is returning
> 0xFA03  where as it should be returning 0x03FA.  It looks like an
> endian  problem.  Is the DOC code endian neutral ??  Will the endian
> problems be  rampant throughout the code or will it be confined to a
> few places ??

We don't actually seem to use NumEraseUnits, although I have absolutely no 
recollection _why_ not. But that would explain why we never bother to 
byteswap it. The code is intended to be endian-aware, although 
I've personally only tested it on LE machines, so I wouldn't swear that 
I've caught all cases. 

> Has anyone used a DOC on a PowerPC processor or other big endian
> architecture ?? 

It's been known, but I can't remember whether the person who asked me about 
it ever admitted to it in public. 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
