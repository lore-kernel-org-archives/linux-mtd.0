Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15XgI5-0006ya-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 10:51:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.GSO.4.31.0108171243320.19730-100000@netti.nic.fi> 
References: <Pine.GSO.4.31.0108171243320.19730-100000@netti.nic.fi> 
To: Riipinen Petri <riipinen@nic.fi>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [Novice] Few simple questions on DOC. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 Aug 2001 10:57:07 +0100
Message-ID: <25963.998042227@redhat.com>
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

riipinen@nic.fi said:
>  Are the fixes in 2.4.9? I could just as well update my kernel source
> tree anyway and forget 2.4.7 completely, nothing in particular is
> forcing me to stay on 2.4.7. 

Not yet, sorry - I sent them once but Linus dropped them. I'll resend when 
he gets back from .fi.


>  Well, hmm... Ok, I assumed that the bootsector included in bzImage
> works just as well as it does with floppies and hd. Well, I was really
> thinking that I could save some space by not using Lilo/Grub but maybe
> that's not worth it then. 

I suppose it _might_ work. Don't be surprised if it doesn't though.


>  And would you recommend Lilo over Grub?

Until someone does the relatively small amount of work to finish the Grub 
DiskOnChip support, yes. 

> So ext2 is the most practical choise currently?

Yep.

> Would there be any problems if the user shuts down the SBC when my
> application is still writing some data file onto the DOC? I guess
> those will be dealt with on boot. 

It should be just the same as on a hard drive - which means that you should
probably be using ext3, but that's a little heavyweight for use on the 
DiskOnChip.


--
dwmw2
