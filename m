Received: from duster.selinc.com ([12.156.93.38])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JjGxJ-0006nZ-SI
	for linux-mtd@lists.infradead.org; Tue, 08 Apr 2008 16:45:59 +0000
In-Reply-To: <1207633386.8040.112.camel@sauron>
To: dedekind@infradead.org
Subject: Re: Question about ubimkvol vs. mkfs.ubifs
MIME-Version: 1.0
Message-ID: <OF360E3C04.51837E02-ON88257425.005B6EBB-88257425.005C150F@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 8 Apr 2008 09:45:47 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > 
> > Nope, no secret.  We're using Samsung K9WAG08U1A NAND parts in 2GiB, 
4GiB, 
> > and 8GiB configurations.  At least we're hoping to get the 4 and 8GiB 
> > configurations working.
> If you are thinking about using UBI, it might be not fast enough if you
> have slow I/O which is usually the case if there is not NAND controller.
> But anyway, I would be very interested to know UBI attach time for your
> flash.

We're using a custom built PCI NAND controller.  Currently for the 2GiB 
case the mount time is about (I haven't timed it exactly) 3 seconds so it 
should be on the order of 12 seconds for the 8G case.  Which is acceptable 
for us because in the application we're putting this in boots will be rare 
(i.e., years between boots).

> 
> >   I've run into a problem in the MTD layer with the 
> > size field.  It's a 32-bit field which isn't big enough to store 
> > 0x100000000 or 0x200000000 which we need for the two larger 
> > configurations.  Just changing it to a 64-bit field introduces 
problems 
> > with other code, so we're looking at using more than one NAND 
controller 
> > in our FPGA and concatenating the NAND chips at the MTD level.
> 
> Well, I guess it should not be too difficult to fix these 64 bit issues.
> 

One would think so, but I keep running into division and modulo problems 
(because doing 64-bit division in the kernel is strongly frowned upon, for 
good reasons), and once I work through all those issues I get seg faults, 
etc, etc, etc.  You know...the usual development things ;).

I'll try and remember to get some exact mount times for you when we get 
things a bit more stable.

Thanks for the info.

See 'ya!

Bruce
