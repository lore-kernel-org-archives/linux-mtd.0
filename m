Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NfgvN-0000UW-Ij
	for linux-mtd@lists.infradead.org; Thu, 11 Feb 2010 21:50:18 +0000
Date: Thu, 11 Feb 2010 21:50:00 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Amol Lad <amol.lad@gmail.com>
Subject: Re: JFFS2 mount fail & crash on 2.4.26 kernel
Message-ID: <20100211215000.GD407@shareable.org>
References: <8c675e9b1002102157p33e4e7fg3239c62642bc008e@mail.gmail.com>
	<1265872946.2529.3770.camel@macbook.infradead.org>
	<8c675e9b1002111222ibfe32b6p4c513262a10ac518@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c675e9b1002111222ibfe32b6p4c513262a10ac518@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Another amazing coincidence...

My work is using JFFS2 on 2.4.26-uc0 kernels too.  The devices have
been in the field for about 5 years and are still very much in use -
we're still shipping new ones, and I'm still doing some development
work on those devices - and still write patches occasionally for those
ancient kernels.  Binary patches sometimes to fix bugs without
reflashing the kernel.  No joke :-)

Sure, 2.4.26 was old even 5 years ago, but it wasn't old when the
upstream chip supplier produced their SDK, from which the shipped SDK
was a "stable" branch presumably, and it wasn't economic to follow the
2.6 cycle, as the CPU architecture wasn't well supported in 2.6 even
1 year ago (no-MMU ARM).

Back to JFFS2 and 90% full.

In our case, we found that on a 1MB JFFS2 filesytem, with 64k erase
blocks, 90% is simply too much.  All sorts of problems ensue, like the
GC thread running for 5 minutes or more occasionally, writes sometimes
being very slow (but sometimes quick), can't predict when "disk full"
will occur.  Sometimes they linger near full for a long time without
problems, and then suddenly it's a problem.  We've had many devices
crash (without a panic message) and go into weird bootup states where
they don't boot properly and their watchdogs get stuck.  I suspect a
kernel bug is responsible for triggering the weird bootup state.

Limiting fullness to 60% appears to have solved all those problems.

Amol, the amount you can get away with will depend on erase block size
and filesystem size.

-- Jamie
