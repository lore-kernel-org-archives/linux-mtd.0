Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11rGgX-0008KC-00
	for mtd@imladris.mvhi.com; Fri, 26 Nov 1999 08:24:53 +0000
In-Reply-To: <E11r6qH-000895-00@imladris.mvhi.com> 
References: <E11r6qH-000895-00@imladris.mvhi.com> 
To: "Dvir Oren" <dviro@hotpop.com>
Cc: MTD <mtd@imladris.mvhi.com>
Subject: Re: (Fwd) DoC2000 Kernel problems 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 26 Nov 1999 08:24:52 +0000
From: David Woodhouse <David.Woodhouse@mvhi.com>
Message-Id: <E11rGgW-0005gB-00@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dviro@hotpop.com said:
> 1.  I'm not able to compile the files into the kernel.  For some
> reason, when I compile the drivers into the kernel, I can't reach  /
> dev/nftla with fdisk, and I can't mount /dev/nftla1.  I applied the
> patch from this mailing list, and still the same thing.  Anybody got
> any ideas?


Which patch? I've been sent a patch to get it to work when it's compiled into 
the 2.2 kernel, but I didn't think that was sent to the list.

> 2.  I'm trying to create a diskless system using DoC2000 flash.   My
> problem is initializing the flash with the root file system, and
> stuff that I need there, without connecting a disk to it.  I thought
> about using Etherboot, however it has the same problem that lilo  has
> with M-Systems' firmware, that does not allow it to boot.   Anybody
> has any ideas? 

I have mine in an ISA evaluation board, and can't get Linux to boot while it's 
enabled - I just pull the jumper out and then put it back in when Linux has 
booted. Guess why I only got it to work with modules :)

Can you do something similar? Overwriting the DoC built-in BIOS with 0xff 
would do the trick. That's what M-Systems recommend in their latest 
documentation, I believe - and they even give you a 'Linux firmware' file 
which is just 48Kb of 0xff :)



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
