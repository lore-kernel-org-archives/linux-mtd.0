Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mnTC-00031j-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 03:01:26 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14mnTB-00031b-00
	for mtd@infradead.org; Tue, 10 Apr 2001 03:01:25 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <9836.986867605@redhat.com> 
References: <9836.986867605@redhat.com>  <1072F1A27E99D3119747005004B9A380EB98B0@MAIL> 
To: Brett Carswell <BrettC@nulec.com.au>,
    "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 10 Apr 2001 03:01:15 +0100
Message-ID: <10575.986868075@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dwmw2@infradead.org said:
>  If we detect it's a 16-bit device in 8-bit mode, do...
>  cfi->device_type = 1;
>  cfi->addr_unlock1 = 0xaaa;
>  cfi->addr_unlock2 = 0x555; 

Actually, it's probably best not to override the device_type, but to change 
the code to always use DEVICE_TYPE_X8 instead of cfi->device_type when 
doing the unlock cycles, and set addr_unlock[12] to the pre-shifted value 
when cfi->device_type != 1.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
