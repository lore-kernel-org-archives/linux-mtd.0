Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ChIW-00086i-00
	for mtd-list@infradead.org; Mon, 24 Jan 2000 11:04:40 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ChIV-00086c-00
	for mtd@infradead.org; Mon, 24 Jan 2000 11:04:39 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002401bf63ed$e12ec180$5800a8c0@pita> 
References: <002401bf63ed$e12ec180$5800a8c0@pita>  <001601bf610b$7301de20$5800a8c0@pita> <004101bf6084$deebad00$5800a8c0@pita> <E12AF35-000707-00@devel2.axiom.internal> <E12AWHJ-0008NB-00@devel2.axiom.internal> 
To: "jyllyj" <jyllyj@263.net>
Cc: mtd@infradead.org
Subject: Re: about doc2000 bootstrap without M-system's firmware 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 24 Jan 2000 11:14:56 +0000
Message-Id: <E12ChSS-0003V2-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


jyllyj@263.net said:
> it load SPL (offset 0x400h sizeof 8k in doc121.exb) to 2000:0 and jmp
> there to execute.
>  then the SPL load other TTFS etc. i can fill the SPL with my
> bootloader like grub.

My copy of grub is 33K - does it fit?

> but i don't know where can the kernel put. how
> can i READ/WRITE doc2000 with a absoluteness address. 

If you can get grub loading from the SPL, that's excellent. 

To get grub to allow you to boot a kernel from the DiskOnChip, you have to 
build the DiskOnChip support into grub's disk drivers. For this you have to 
replace the rawread() routine in shared_src/disk_io.c

The code in my doc2000.c and nftl.c ought to be enough to help you add this 
support. 


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
