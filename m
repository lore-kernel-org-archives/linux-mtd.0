Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12neDq-0003bz-00
	for mtd-list@infradead.org; Fri, 05 May 2000 10:16:34 +0100
Received: from gate.mvhi.com
	([194.205.184.34] helo=server.axiom.internal ident=mail)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12neDp-0003bt-00
	for mtd@infradead.org; Fri, 05 May 2000 10:16:33 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3912853F.F5BC6281@zentropix.com> 
References: <3912853F.F5BC6281@zentropix.com>  <200005041741.NAA23266@home.welcomehome.org> 
To: Trevor Woolven <trevw@zentropix.com>
Cc: Paonia Ezrine <paonia@home.welcomehome.org>, mtd@infradead.org
Subject: Re: read only 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 05 May 2000 10:20:54 +0100
Message-ID: <32572.957518454@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


trevw@zentropix.com said:
> b)	Break the write support out into a kernel loadable module and load
> it as and when required.

This would be quite difficult to do, and is probably less secure than the 
'separate kernel' option - at least with a separate kernel, your attacker 
would have to reboot, which is far more likely to be noticed than loading a 
module.

> BTW: Should the TODO list contain 'develop the driver as a KLM'? 

I do all development as modules. Making it work compiled into the kernel is 
usually an afterthought. If anything, the TODO list should contain 'make it 
work when statically-linked'. Especially on 2.2 where the init procedure is 
far more complex than 2.3.

I've now got my original testbed machine back, which has an IDE controller 
supported by 2.2, so I'll be developing on 2.2 for a while.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
