Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12lL40-0005tB-00
	for mtd-list@infradead.org; Sat, 29 Apr 2000 01:24:52 +0100
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12lL3z-0005t5-00
	for mtd@infradead.org; Sat, 29 Apr 2000 01:24:51 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <D1674834F25BD3118B3208002BB90CD4440250@yen.crl.dec.com> 
References: <D1674834F25BD3118B3208002BB90CD4440250@yen.crl.dec.com> 
To: Jamey Hicks <jamey@crl.dec.com>
Cc: "'Trevor Woolven'" <trevw@zentropix.com>, MTD <mtd@infradead.org>
Subject: Re: TODO List 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 29 Apr 2000 01:27:59 +0100
Message-ID: <26113.956968079@server.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



jamey@crl.dec.com said:
>  What's wrong with FTL?

Technically, there are two main problems.

Firstly, it's broken - it works for a while and then seems to corrupt the
 FTL. I can't see how I did that in porting David Hinds' code to use the MTD
flash access routines - so it could be an SMP issue (I'm testing on SMP) or it
could be because I'm testing on the RAM device, which calls the 'erase done'
callback directly from within the erase routine..

Secondly, it makes no attempt to handle byte-swapping - so if you run it on a 
BE machine, then your FTL is all BE, which doesn't conform to the spec, and 
obviously won't be portable to LE machines. We need to pepper it with 
cpu_to_le16() and le16_to_cpu() all over the place.

> What's the state of it wrt licensing M-Systems patents? 

M-Systems have a patent which covers FTL, but they've given a licence to use 
it on all PCMCIA devices. They have not granted a licence to use it with 
non-PCMCIA devices.

>  Can it be used for systems with onboard flash? 

I assume that's not actually the question you meant to ask.

Can it be used? Yes - although you'd do better to use JFFS.
May it be used? Only if you live in the Free World.



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
