Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZZGL-0000R2-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 14:08:57 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZZGK-0000Qw-00
	for mtd@infradead.org; Mon, 27 Mar 2000 14:08:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <38DF5BE8.1700BEE8@zentropix.com> 
References: <38DF5BE8.1700BEE8@zentropix.com> 
To: Trevor Woolven <trevw@zentropix.com>
Cc: MTD <mtd@infradead.org>
Subject: Re: GRUB vs LILO 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 27 Mar 2000 14:08:55 +0100
Message-ID: <1389.954162535@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


trevw@zentropix.com said:
> 
>   [Linux-bzImage, setup=0x800, size=0x88440]
> Selected item cannot fit into memory 

This is because the M-Systems firmware takes up a large chunk of your system 
RAM for caching block attributes - this is proportional to the size of the 
DiskOnChip, naturally.

The code I'm currently hacking into Grub will drive the DiskOnChip directly, so
you can remove the M-Systems firmware. My Grub code doesn't do any caching - so
it'll be a tad slower, but it'll work on bigger devices. 



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
