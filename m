Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14JH1V-0006bP-00
	for mtd-list@infradead.org; Thu, 18 Jan 2001 15:30:49 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14JH1T-0006bJ-00
	for mtd@infradead.org; Thu, 18 Jan 2001 15:30:48 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01011810250701.08590@workbox.atlanta.itserve.com> 
References: <01011810250701.08590@workbox.atlanta.itserve.com> 
To: dhamm@itrepro.com
Cc: mtd@infradead.org
Subject: Re: doc-lilo and mtd devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 18 Jan 2001 15:30:33 +0000
Message-ID: <20213.979831833@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


dhamm@itrepro.com said:
>  Do I need to get another boot loader ( ie grub ) or can I use a newer
> version of lilo?

Last time I tried grub it wasn't working properly, although it was close. I
think you ought to be able to tell LILO that 0x5d01 is really BIOS drive
0x80. We support HDGETGEO and I think we match the geometry emulated by the
M-Systems drivers, so it ought to work.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
