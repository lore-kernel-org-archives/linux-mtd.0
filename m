Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mnLh-0002xh-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 02:53:41 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mnLg-0002xa-00
	for mtd@infradead.org; Tue, 10 Apr 2001 02:53:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1072F1A27E99D3119747005004B9A380EB98B0@MAIL> 
References: <1072F1A27E99D3119747005004B9A380EB98B0@MAIL> 
To: Brett Carswell <BrettC@nulec.com.au>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 10 Apr 2001 02:53:25 +0100
Message-ID: <9836.986867605@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


BrettC@nulec.com.au said:
> My take on the datasheet is that when in byte mode, A-1 becomes the
> LSB of the address.

OK,... looking at the (AM29LV320D) datasheet again, I see that. 

> The unlock 2 address in word mode is 0x2AA (8 bits set to 1) and byte mode
> is 0x555 (9 bits set to 1).

Ah, yes - I see that too. I find it very concerning that the datasheet is 
clearer to me at 2:30 in the morning than at any other time. 

OK.... how about fixing it up in the probe code to appear as an 8-bit 
device, and setting the unlock[12] addresses accordingly?

If we detect it's a 16-bit device in 8-bit mode, do...

 cfi->device_type = 1;
 cfi->addr_unlock1 = 0xaaa;
 cfi->addr_unlock2 = 0x555;

Does that work?

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
