Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BCjS-0003Fw-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 11:55:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.44.0205241118020.31555-100000@localhost> 
References: <Pine.LNX.4.44.0205241118020.31555-100000@localhost> 
To: Chris Wilson <chris@netservers.co.uk>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Getting big flash onto motherboards. Will CF work? what will 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 24 May 2002 11:55:34 +0100
Message-ID: <25366.1022237734@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

chris@netservers.co.uk said:
>  I would guess that these are IDE-compatible then? So I guess I would
> have  to use the mtdblock driver to drive it? 

No. The mtdblock driver is a vary simplistic 'translation layer' that 
doesn't actually do any wear levelling or translation, just lets you use a 
real flash device as if it were a block device.

If the hardware in question looks like IDE, you use the IDE drivers. 

> Does it have internal wear  levelling like CF?

It might. You cannot tell, just like with CF.


> Has anyone seen this behaviour, or had any clues about how or why it
> might  happen? We have had the same effect with several different
> brands of CF,  including SanDisk. Does this kind of thing happen to
> DoC and/or DoM?

I have no knowledge of the DiskOnModule. It's just like CF in all respects
other than the physical size, isn't it? So there's no real reason to believe
that it must have different reliability characteristics. But there's no real
reason for _everyone_ who makes CF to have implemented it so unreliably in
the first place -- so maybe M-Systems have managed to do it properly -- they
generally do seem to have sufficient clue. You'd have to test it.

The DiskOnChip is a different matter. That allows the system to deal with 
real flash, so if there are problems you can fix them. Although in 
practice, nobody _does_ seem to be dealing with the problems which 
occasionally crop up with the DiskOnChip drivers. I still keep trying to 
get our salespeople to find a customer who wants to pay for me to spend 
some real time on them, but it hasn't happened yet :)

--
dwmw2
