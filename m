Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12Uv2f-0006Fj-00
	for mtd-list@infradead.org; Tue, 14 Mar 2000 17:23:37 +0000
Date: Tue, 14 Mar 2000 18:23:26 +0100 (CET)
From: Alexander Larsson <alex@cendio.se>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: mtd comments 
In-Reply-To: <23331.953054257@devel2.axiom.internal>
Message-ID: <Pine.LNX.3.96.1000314182311.16770A-100000@biffen.cendio.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 14 Mar 2000, David Woodhouse wrote:

> 
> > > If they're actually called with a kernel-space buffer, we use 
> > > set_fs(KERNEL_DS) beforehand, which handles the rest of your question.
> 
> alex@cendio.se said:
> > Oh, i didn't know about that trick. Well that seems like a good idea
> > then. I suppose we have to fix all driver too. 
> 
> I'm not convinced that this is such a good idea. While copy_to_user() is free
> on decent CPUs, we expect people to be using 386en for embedded systems, and
> copy_to_user() is unnecessary overhead. 
> 
> The only front end which copies directly to userspace is the chardevice, isn't 
> it? Everything else copies to kernel-space. As the chardevice is mainly a 
> hacking and config tool - it's generally only used to put the filesystem on 
> the device in the first place - I think it's best to slow it down rather than 
> slowing down everything else - i.e. to make it allocate buffers and copy to 
> userspace itself.

 Agreed.

/ Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
