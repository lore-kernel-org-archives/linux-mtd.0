Received: from imladris.infradead.org
	([194.205.184.45] helo=infradead.org ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uG3j-0002Xr-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2001 16:58:01 +0100
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14uG39-00005x-00
	for mtd-list@infradead.org; Mon, 30 Apr 2001 16:57:23 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org, ahennessy@mvista.com, ds@schleef.org,
        jonas.holmberg@axis.com, cwryu@debian.org, eauth@softsys.co.at,
        nico@cam.org
Subject: Re: Flash driver probe/commandset separation.
References: <26353.988569497@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 30 Apr 2001 09:56:45 -0600
In-Reply-To: David Woodhouse's message of "Sun, 29 Apr 2001 19:38:17 +0100"
Message-ID: <m3hez6754y.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> We seem to have an unnecessary amount of duplication of flash chip driver 
> code. We have three drivers for AMD/Fujitsu compatible chips - 
> cfi_cmdset_0002.c, amd_flash.c and jedec.c. 

And I have a totally rewritten version of jedec.c hanging around
needing to be merged jedec.c was so nasty.

> We have two drivers for Intel/
> Sharp compatible chips - cfi_cmdset_0001.c and sharp.c.
> 
> Erwin noticed this and wrote code to fall back to an AMD-compatible probe
> for JEDEC ID if the CFI probe failed, and then use cfi_cmdset_0002.c if 
> appropriate. I think that was the right approach, but I don't like merging
> the probes together like that. I think the mfr-specific probes for JEDEC ID 
> should be kept separate. The map driver can always call them in order if 
> the CFI probe fails, if it wants to.

As long as someone can compile the kernel without support for a
specifc probe from menuconfig and get an image that still compiles.  I
have had some problems with that...
 
> What I'd like to do is provide core drivers for each of the different 
> command sets, and separate probe functions which set up the necessary 
> parameters and invoke the core drivers.
> 
> The current cfi_cmdset_000x drivers are the most generic, so I'd like to use
> those as the basis of the core drivers, and ensure that they can fully
> replace the functionality of the other individual drivers. 
> 
> We end up with:
> 	cmdset_intel (and sharp, etc.)
> 	cmdset_amd (and fujitsu, macronix, etc.)
> 	cfi_probe
> 	intel_jedec_probe
> 	amd_jedec_probe
> 	
> Comments?

This sounds like right way to go.

Reservations: 

I'm not certain seperating the jedec probe by manufacturer is
necessary, and it wouldn't suprise me if ordering might be important
in a jedec probe.  (If so we might only want to seperate the tables of
chips).

I wonder if we need something like a revision parameter to the cmdset
code, so we don't try to use new additions to the cmdset on old chips.  

And I would like to double check the bus size usages.  As last time I
looked cfi_cmdset_002 would do 16 bit accesses on an 8 bit bus.   My
mapping driver deliberately didn't implement 16 or 32 bit reads to so
attempting to call them would oops the kernel.   Shoot me I need to
merge my alpha mapping driver with the main mtd tree. 


> Even assuming people agree (or disagree unconvincingly :), I'm not sure
> whether I should hold off on this until after I've sync'd up with Linus, or 
> whether I should get this all done first and worry about feeding the new 
> code to Linus later on. Probably the latter.

P.s. 
What is the right way to merge my code with the main mtd tree?

Eric


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
