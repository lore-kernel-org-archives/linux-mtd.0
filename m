Received: from hagen.doit.wisc.edu ([144.92.197.163]
	helo=smtp7.wiscmail.wisc.edu)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CSjjI-0003yT-2y
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 17:17:17 -0500
Received: from avs-daemon.smtp7.wiscmail.wisc.edu by smtp7.wiscmail.wisc.edu
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	id <0I730040G78NI2@smtp7.wiscmail.wisc.edu> for
	linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 16:17:11 -0600 (CST)
Date: Fri, 12 Nov 2004 22:17:08 +0000
From: John Lenz <lenz@cs.wisc.edu>
In-reply-to: <010b01c4c8de$82cc2b90$0f01a8c0@max>
To: Richard Purdie <rpurdie@rpsys.net>
Message-id: <1100297828l.6627l.0l@hydra>
MIME-version: 1.0
Content-type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <010b01c4c8de$82cc2b90$0f01a8c0@max>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Sharp SL Series NAND Driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/04 11:38:54, Richard Purdie wrote:
> As mentioned on IRC, I've ported the nand driver for the Sharp SL series  
> to
> the current kernel. This first patch adds the driver which supports all  
> the
> Zaurus models that use nand flash. (thanks for the pointers in trimming  
> it
> down! :)
> 
> http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl.patch

In the suspend and resume functions, you still have some prinks... those  
should be removed.  And does there need to be any code in resume?

This patch is very similar to the patch in my tree, except you also provide
the scan_bbt function.

I just got poodle to boot up correctly with my patch.  The problem all
along was that I was passing the wrong root= option to the kernel!  Passing
the correct root device, and poodle boots up fine.  I can log in and run a
few commands.  Note, this is with my patch but it should work with yours as
well since they are so similar.  Secondly, I have it working without any of
the other patches you posted...

> 
> I also have some other patches I'd appreciate your views on. Two of these
> should be straightforward. The third is more for comments.
> 
> http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl-map.patch - maps a ROM  
> on
> the device (I think its used to access configuration information?).

Do we actually need this patch?  Perhaps we should hold off including it  
until we have a program that needs to access this stuff.


> http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl-map.patch - maps a ROM
> on
> the device (I think its used to access configuration information?).
> 
>  http://www.rpsys.net/openzaurus/mtd/rp-jffs2-longfilename.patch - if you
> try  and create filenames longer than 255 characters, the fs gets
> corrupted.  This  adds a couple of checks to prevent it.
> 
>  http://www.rpsys.net/openzaurus/mtd/rp-mtd-sharpsl-extra.patch - This is
> for  comments. The sharp driver uses a smaller eraseblock than the
> current mtd  code supports so I have to disable a check to get the code
> to work  properly.  I think this is due to a limitation on kmalloc? The
> code gets around this  by  using dma_alloc_coherent. Is there a way I can
> do this in an acceptable  manner? (I'm assuming the above patch isn't
> acceptable?)
> 
>  (NB: The filesystem is written out by an older driver we can't change so
> we  have to remain compatible with it - changing eraseblock size
> therefore  isn't  an option).

I notice in this patch you have CONFIG_MACH_HUSKY used... do we need to add  
CONFIG_MACH_POODLE?  Is this something that poodle would have as well?  It  
seems to be working here without this change... although I haven't tested  
it a lot yet.

John
