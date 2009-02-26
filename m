Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Lcmtt-0003KM-S3
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 20:32:12 +0000
Date: Thu, 26 Feb 2009 12:32:01 -0800 (PST)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Jesper Krogh <jesper@krogh.cc>
Subject: Re: Linux 2.6.29-rc6
In-Reply-To: <49A6EE17.4070102@krogh.cc>
Message-ID: <alpine.LFD.2.00.0902261229050.3111@localhost.localdomain>
References: <alpine.LFD.2.00.0902222023520.3111@localhost.localdomain>
	<49A679E8.1010301@krogh.cc>
	<alpine.LFD.2.00.0902260941090.3111@localhost.localdomain>
	<49A6EE17.4070102@krogh.cc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Ryan Jackson <rjackson@lnxi.com>, Dave Olsen <dolsen@lnxi.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Thu, 26 Feb 2009, Jesper Krogh wrote:

> Linus Torvalds wrote:
> > On Thu, 26 Feb 2009, Jesper Krogh wrote:
> > > 
> > > Booting up 2.6.29-rc6 gave me this one in dmesg...
> > > 
> > > [   21.136149] ck804xrom ck804xrom_init_one(): Unable to register resource
> > > 0x00000000ff000000-0x00000000ffffffff - kernel bug?
> > 
> > Well, it _is_ a kernel bug, but it's in that stupid driver. It does
> > everything wrong, including printing out a scary message.
> 
> I've seen that before.. (even reported it before). It just "slipped" into the
> cut'n'paste It was the following stuff that I intended to report.

Ok. They very much are related. The new warning is just that - a new 
warning.

> > > [   21.136269] WARNING: at arch/x86/mm/ioremap.c:208
> > > __ioremap_caller+0x359/0x390()
> > 
> > This is a different, but related warning, since the driver is doing an
> > ioremap across different resources. The warning is directly related to the
> > fact that the resource wasn't actually valid to begin with.
> > 
> > What does "cat /proc/iomem" say?
> 
> http://krogh.cc/~jesper/iomem.txt

Ok, so the thing conflicts with

	ff700000-ffffffff : reserved
	  ff700000-ffffffff : pnp 00:0b

and that probably _is_ somehow related to the whole flash thing. 

I guess the driver could use "insert_resource()" and the problem would go 
away. Except I do think it should be marked very dangerous some way, so 
that you can't even enable it unless you really really know you want to 
(eg something like EXPERIMENTAL). Because I don't think this driver is 
appropriate in any other case..

> Being a "stupid" user, I pick the easy way to build a fresh kernel: 1) 
> pick the distro .config 2) make oldconfig 3) Let the kernel load what it 
> think it needs. 4) Report if I see and strange stuff (warnings / bugs / 
> oops) or misbehaviour.
> 
> So I dont know if I need that driver for anything vital. Should I care? 
> Or shouldn't it "just work"?

You definitely don't need it, and everything will work without it. 

			Linus
