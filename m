Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13nzEc-0006vz-00
	for mtd-list@infradead.org; Tue, 24 Oct 2000 09:15:02 +0100
Received: from [194.130.39.252] (helo=passion.cygnus)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13nzEb-0006vt-00
	for mtd@infradead.org; Tue, 24 Oct 2000 09:15:02 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E13nksk-0002RR-00@infradead.org> 
References: <E13nksk-0002RR-00@infradead.org> 
To: sjhill@cotw.com
Cc: mtd@infradead.org
Subject: Re: MTD CVS update: 'mtd/kernel mtdblock.c' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 24 Oct 2000 09:14:50 +0100
Message-ID: <18079.972375290@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


sjhill@cotw.com said:
>  Made changes so that 'mtdblock' would build with 2.2.x kernels again
> and not only on ARM platforms. People PLEASE remember that this code
> is used in two different kernel trees AND on different CPU
> architectures. 

*(int *)0=0; doesn't cause an oops on all platforms. That was why BUG() was 
introduced. Probably better just to omit my paranoia checks altogether, 
once we're happy that mtdblock actually works. For now, surround them in 
#ifdef PARANOIA. I thought I'd done that already.

DECLARE_MUTEX_LOCKED wants adding to compatmac.h if it's not already there.

What was the reasoning for removing the 'static' from the declaration of 
thr_wq?

Anyway, it didn't build _only_ on ARM - it built on SH too :)

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
