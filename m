Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14W14c-0007vT-00
	for mtd-list@infradead.org; Thu, 22 Feb 2001 19:06:42 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14W14b-0007vN-00
	for mtd@infradead.org; Thu, 22 Feb 2001 19:06:41 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A956709.18E409D@danielind.com> 
References: <3A956709.18E409D@danielind.com>  <30724FF712DFD2119E6200104B2448920119744C@mail1> <29886.982847889@redhat.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: Vipin Malik <Vipin.Malik@daniel.com>, mtd@infradead.org
Subject: Re: Unable to mount compressed root f/s because init_mtd() does n ot r egister block device! 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 22 Feb 2001 19:00:22 +0000
Message-ID: <7651.982868422@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
>  the ramdisk driver cannot find the mtdblock device registered when it
> tries to load the compressed f/s image from flash.

Hmmm. drivers/mtd is later than drivers/block in the link order. Try 
changing that in the toplevel Makefile.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
