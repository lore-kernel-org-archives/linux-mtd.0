Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EXYI-0004GT-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 14:09:06 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14EXYH-0004GN-00
	for mtd@infradead.org; Fri, 05 Jan 2001 14:09:05 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A55D27F.C1E734C2@inn.ericsson.se> 
References: <3A55D27F.C1E734C2@inn.ericsson.se>  <978636488.3a54cec86af09@webmail2.asu.edu> <2842.978696346@redhat.com> 
To: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
Cc: Russ.Dill@asu.edu, mtd@infradead.org
Subject: Re: Supported flash memory 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 Jan 2001 14:09:01 +0000
Message-ID: <18366.978703741@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


kenneth.johansson@inn.ericsson.se said:
>  The module can have up to 16 chips. (AMD) 
>  Every chip has a to be in 8 bit mode.
> The address range is divided into 8 chip select, giving a 16
> bit data bus. Thus I can't do any other access than 16 bit and always
> activate two chip's. 

OK, if it's CFI flash that should work.


>  Also, we make them with a version that has a boot block (different
> block size) but I think MTD can handle that or ?

We support that on AMD chips as of a couple of weeks ago. The logic is the 
same for Intel chips and the merge will happen soon. 

>  Why do the boot code need to support flash? Flash looks like a
> ordinary ROM for everything not knowing the magic sequence. 

For booting, it doesn't. For downloading a new kernel over CF Ethernet or 
xmodem and putting it into the flash, it does.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
