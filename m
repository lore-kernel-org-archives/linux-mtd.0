Received: from mail.airnet.com.au ([202.174.32.5] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 189l8y-0005LZ-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2002 11:48:17 +0000
Subject: Re: Building mkfs.jffs2
From: Darren Freeman <free0076@flinders.edu.au>
To: Linux MTD List <linux-mtd@lists.infradead.org>
In-Reply-To: <1036570803.16096.98.camel@dirac.home>
References: <1036570803.16096.98.camel@dirac.home>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 07 Nov 2002 22:49:15 +0000
Message-Id: <1036709357.3637.5.camel@dirac.home>
Mime-Version: 1.0
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

I have an update to the previous posting...

On Wed, 2002-11-06 at 08:20, Darren Freeman wrote:
> Dear list,
> 
> I am trying to build the latest version of mkfs.jffs2 on either of two
> PCs running RedHat 7.2 and Mandrake 9.0 respectively.
> 
> The problem with the binary mkfs.jffs2 that I have right now is that I
> upgraded from a really really old kernel on the target (around 2.4.2) up
> to 2.4.20-rmk1 and according to the kernel at boot time, JFFS2 has
> changed enough to cause problems.

OK I found the source of my problem here. Yes, the old mkfs.jffs2 was
doing that but the new binary I grabbed (I think) off RedHat's site
actually works. But the symptoms were lots of errors and a screwed
filesystem as before so I thought it was the same problem.

The actual problem is that somehow the system, booted by RedBoot, is
locking the flash over the partition of interest. I have to do a "fis
unlock" command to unlock the partition before booting Linux, then the
filesystem recovers and is read/write. Which is a relief but
*really*weird* =)

Oh and the target kernel is 2.4.19-rmk1 (woops)

> The symptoms are that I can flash an image and use it for a little
> while, but after a small amount of writing (change text files etc.) the
> filesystem just screws up and becomes 100% full. From that point onwards
> the target is screwed, and only NFS has saved me. Unfortunately with a
> broken root filesystem I can't get too much done =)
> 
> The RedHat host is running the stock kernel, 2.4.2, and I've configured
> the kernel for JFFS2 but not recompiled it. The Mandrake box is running
> 2.4.20 recompiled to my liking.
> 
> The target is an EPXA10 development board, with cpu=ARM922T,
> kernel=2.4.19-rmk1 patched for the board.
> 
> I simply can't get mtd/utils to build on either host. I don't want a
> cross-compiled binary, just something to use on the host. I have tried
> using ./configure --with-kernel= pointing to the host kernel or target
> but no success. I guess the target kernel is the correct one to use
> here.

Yeah I tried and tried and tried some more. Still gave up.

> My latest problem is that mkfs.jffs2.c uses jint16_t which is not found
> when grepping through my kernel source but is in mtd. So I have to do
> --with-kernel=/path/mtd but finally I get the error:
> 
> compr_zlib.c:15:2: #error "The userspace support got too messy and was
> removed. Update your mkfs.jffs2"
> 
> Followed by tons of garbage.
> 
> Any ideas? Or somebody willing to give me a binary of mkfs.jffs2 for
> i386 -> ARM9 ? I would greatly appreciate it!

Well I don't need it anymore but some ideas would still be appreciated
=)

> Have fun,
> Darren Freeman

What he said =)
