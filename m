Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143K7E-0000Ob-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 15:34:48 +0000
Date: Tue, 5 Dec 2000 10:34:41 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Ronald G Minnich <rminnich@lanl.gov>, Ian <Relativity@HumanHeuristic.com>,
        <ollie@sis.com.tw>, <mtd@infradead.org>, <linuxbios@lanl.gov>
Subject: Re: Problems with r/w on mtdblock0 
In-Reply-To: <32011.976028063@redhat.com>
Message-ID: <Pine.LNX.4.30.0012051034220.2601-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 5 Dec 2000, David Woodhouse wrote:

>
> rminnich@lanl.gov said:
> >  I've had this happen. Don't worry about it.
>
> If you writing stuff to the mtdblock device and then reboot immediately,
> you may be rebooting before the kernel thread actually completes the write.
> I'm not sure if it makes you wait on close() or not. P'raps it should.

It does.


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
