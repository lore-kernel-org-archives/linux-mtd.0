Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14gN50-0000aY-00
	for mtd-list@infradead.org; Fri, 23 Mar 2001 08:37:54 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14gN4y-0000aS-00
	for mtd@infradead.org; Fri, 23 Mar 2001 08:37:52 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200103230202.f2N22R612056@new-york.lcs.mit.edu> 
References: <200103230202.f2N22R612056@new-york.lcs.mit.edu> 
To: decouto@lcs.mit.edu
Cc: mtd@infradead.org, ipaq@handhelds.org
Subject: Re: jffs2 problem 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 23 Mar 2001 08:37:37 +0000
Message-ID: <11429.985336657@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


decouto@lcs.mit.edu said:
>  is this likely to happen if i forgot to erase the flash with eflash
> in the boat loader before loading the jffs2 image?  e.g. i had one
> jffs2 image, and then i loaded another without eflashing.

Yes.

>  the kernel i compiled is from the handhelds.org CVS, and the CVS
> version is... well ther are a lot of files, so if you want to know a
> specific thing i can tell you. 

A date should be sufficient.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
