Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14lASn-0004n3-00
	for mtd-list@infradead.org; Thu, 05 Apr 2001 15:10:17 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14lASl-0004mx-00
	for mtd@infradead.org; Thu, 05 Apr 2001 15:10:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1072F1A27E99D3119747005004B9A380EB98A4@MAIL> 
References: <1072F1A27E99D3119747005004B9A380EB98A4@MAIL> 
To: Brett Carswell <BrettC@nulec.com.au>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: Re: CFI with 4 x8/x16 devices on a 32-bit bus 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 05 Apr 2001 15:09:49 +0100
Message-ID: <4784.986479789@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



BrettC@nulec.com.au said:
>  The board has four AMD 29LV160 chips which are in x8 mode. These
> chips can also be in x16 mode but aren't in this case. 

> My first question is am I correct in expecting that I should see these
> chips detected as 4 x8 Devices in 32-bit mode? I can get them working
> in this mode only by shifting all the offset addresses in my mapping
> functions right by one.

Shouldn't that be 4 x16 devices in 8-bit mode? 

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
