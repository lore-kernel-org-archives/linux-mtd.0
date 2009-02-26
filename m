Received: from smtp1.linux-foundation.org ([140.211.169.13])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LckQA-0004Jy-FQ
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2009 17:53:22 +0000
Date: Thu, 26 Feb 2009 09:53:09 -0800 (PST)
From: Linus Torvalds <torvalds@linux-foundation.org>
To: Jesper Krogh <jesper@krogh.cc>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Dave Olsen <dolsen@lnxi.com>, Ryan Jackson <rjackson@lnxi.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Linux 2.6.29-rc6
In-Reply-To: <49A679E8.1010301@krogh.cc>
Message-ID: <alpine.LFD.2.00.0902260941090.3111@localhost.localdomain>
References: <alpine.LFD.2.00.0902222023520.3111@localhost.localdomain>
	<49A679E8.1010301@krogh.cc>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dave Olsen <dolsen@lnxi.com>,
    Ryan Jackson <rjackson@lnxi.com>, David.Woodhouse@intel.com, 
linux-mtd@lists.infradead.org


On Thu, 26 Feb 2009, Jesper Krogh wrote:
>
> 
> Booting up 2.6.29-rc6 gave me this one in dmesg...
> 
> [   21.136149] ck804xrom ck804xrom_init_one(): Unable to register resource 0x00000000ff000000-0x00000000ffffffff - kernel bug?

Well, it _is_ a kernel bug, but it's in that stupid driver. It does 
everything wrong, including printing out a scary message.

Piece of sh*t driver, in other words.

I mean, it even has a _comment_ about how the request_region is likely to 
not succeed, and then it prints out that scary message when it 
then doesn't do so.

Not to mention that the driver is likely _wrong_ to just unconditionally 
try to enable that resource without *first* checking whether the resource 
can actually be enabled or whether there are other resources in that same 
window.

Quite frankly, I find that whole thing scary. The driver should be deleted 
or at least marked EXPERIMENTAL or BROKEN.

It has a "BE VERY CAREFUL" in the Kconfig _help_ text, but is not marked 
as being dangerous any other way.

That said, I really don't see why you would get this message _now_. The 
total braindamage of that driver in no way seems new. Did you perhaps not 
notice before, or did you just not enable it before?

> [   21.136269] WARNING: at arch/x86/mm/ioremap.c:208 __ioremap_caller+0x359/0x390()

This is a different, but related warning, since the driver is doing an 
ioremap across different resources. The warning is directly related to the 
fact that the resource wasn't actually valid to begin with.

What does "cat /proc/iomem" say?

> System is fully operational, but I didnt get it in 2.6.26.8 (most recent
> kernel tried on this hardware).

The ioremap() warning is newish, and may be what made you notice the 
previous (just one-line) crappy warning.

Quite frankly, having looked at that horrible driver, I would seriously 
consider disabling it. Stuff like that should not be allowed to exist.

		Linus
