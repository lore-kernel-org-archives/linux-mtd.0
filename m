Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lWyB-0003da-00
	for mtd-list@infradead.org; Fri, 06 Apr 2001 15:12:11 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14lWyA-0003dU-00
	for mtd@infradead.org; Fri, 06 Apr 2001 15:12:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <7657.986564737@redhat.com> 
References: <7657.986564737@redhat.com>  <1072F1A27E99D3119747005004B9A380EB98A6@MAIL> 
To: Brett Carswell <BrettC@nulec.com.au>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 06 Apr 2001 15:12:01 +0100
Message-ID: <10552.986566321@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  Ignoring the fact that you wrote '<<' when you meant '*', why do you
> think  we should be using the address 0x1554 (== 0x555 << 3)? What am
> I missing  this time? :) 

er... 0x1554 == 0x555 << 2. But don't let details like that bother you :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
