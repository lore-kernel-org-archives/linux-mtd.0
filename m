Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Uuws-0006EY-00
	for mtd-list@infradead.org; Tue, 14 Mar 2000 17:17:38 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12Uuwr-0006ES-00
	for mtd@infradead.org; Tue, 14 Mar 2000 17:17:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.3.96.1000308093421.13423C-100000@biffen.cendio.se> 
References: <Pine.LNX.3.96.1000308093421.13423C-100000@biffen.cendio.se> 
To: Alexander Larsson <alex@cendio.se>
Cc: mtd@infradead.org
Subject: Re: mtd comments 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 14 Mar 2000 17:17:37 +0000
Message-ID: <23331.953054257@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


> > If they're actually called with a kernel-space buffer, we use 
> > set_fs(KERNEL_DS) beforehand, which handles the rest of your question.

alex@cendio.se said:
> Oh, i didn't know about that trick. Well that seems like a good idea
> then. I suppose we have to fix all driver too. 

I'm not convinced that this is such a good idea. While copy_to_user() is free
on decent CPUs, we expect people to be using 386en for embedded systems, and
copy_to_user() is unnecessary overhead. 

The only front end which copies directly to userspace is the chardevice, isn't 
it? Everything else copies to kernel-space. As the chardevice is mainly a 
hacking and config tool - it's generally only used to put the filesystem on 
the device in the first place - I think it's best to slow it down rather than 
slowing down everything else - i.e. to make it allocate buffers and copy to 
userspace itself.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
