Received: from jakorasia.nic.fi ([212.38.224.80])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15XgDH-0006y5-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2001 10:46:47 +0100
Date: Fri, 17 Aug 2001 12:52:29 +0300 (EET DST)
From: Riipinen Petri <riipinen@nic.fi>
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: [Novice] Few simple questions on DOC. 
In-Reply-To: <20660.998039289@redhat.com>
Message-ID: <Pine.GSO.4.31.0108171243320.19730-100000@netti.nic.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Great response time...;)

Well, I'd just like to continue with some follow-up questions below. But I
must say that your answers cleared a lot of confusion in my head already
and I'm pretty confident to continue.

> The DiskOnChip driver on the M-Systems website is a different driver. It's
> binary-only, so if you're going to distribute the box you're making, it's
> illegal to link it into the kernel, and it's dubious even whether it's
> legal to use it as a module.

Ok, I'm perfectly happy to forget it then.

> The code in 2.4.7 is slightly out of date - you should update to the latest
> code from CVS which has a couple of useful bug fixes in it.

Are the fixes in 2.4.9? I could just as well update my kernel source tree
anyway and forget 2.4.7 completely, nothing in particular is forcing me to
stay on 2.4.7.

> If you just write the kernel to the beginning of the device, what's going
> to load it? The bootsector built into the kernel is old, probably broken,
> and only designed for use on floppies - I don't think it'll do the job.

Well, hmm... Ok, I assumed that the bootsector included in bzImage works
just as well as it does with floppies and hd. Well, I was really thinking
that I could save some space by not using Lilo/Grub but maybe that's not
worth it then.

And would you recommend Lilo over Grub?

> JFFS doesn't work on it yet.

So ext2 is the most practical choise currently?

Would there be any problems if the user shuts down the SBC when my
application is still writing some data file onto the DOC? I guess those
will be dealt with on boot.

Thanks!

- Petri
