Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15PU2A-0004jy-00
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jul 2001 20:09:26 +0100
Date: Wed, 25 Jul 2001 20:15:12 +0100 (BST)
From: David Woodhouse <dwmw2@redhat.com>
To: Vipin Malik <vipin@embeddedlinuxworks.com>
Cc: <olea@hispafuentes.com>, <linux-mtd@lists.infradead.org>,
	<juan@hispafuentes.com>
Subject: Re: Ask for some guidance...
In-Reply-To: <5.1.0.14.0.20010724220606.00a67960@mail.spewey.com>
Message-ID: <Pine.LNX.4.33.0107252008450.4023-100000@passion.cambridge.redhat.com>
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

On Tue, 24 Jul 2001, Vipin Malik wrote:

> It's not trivial to do FTL inside some "prom's". Depending on how large 
> (rather small) they are, they may be doing just chip decoding.

lapdancer /home/dwmw2/working/mtd/drivers/mtd $ size ftl.o
   text	   data	    bss	    dec	    hex	filename
  12947	    128	   9216	  22291	   5713	ftl.o

Not too hard to put it in prom. The DiskOnChip 1000 did.

> Most of the times IDE disk's are emulated under a "special" BIOS that 
> translate the BIOS IDE int (int 13?) into read/writes of the Flash sectors.

<pedant> INT 13h is generic block device. Not IDE-specific. </pedant>

> What BIOS is it using? I know that General Software's Embedded BIOS 
> supports that functionality.

Do you know the format used?

> There is not much that you can do re. accessing this disk under Linux as 
> Linux does not use the BIOS for IDE disk access.

There are patches for the 1.1 kernel to do that :)

> Simple (!), use "Debug" under DOS, to trace into the BIOS IDE interrupt and 
> see that it does.

This works, although it tends to make my head hurt. Guess how we got 
DiskOnChip working? :)

> >         - Do you think we could access to the flash disk using MTD?
> 
> That's probably the most sensible approach in my mind- though you would not 
> access the flash _disk_, rather just the flash under MTD, which would show 
> up as a char and block device on which you could then mount JFFS2 and then 
> access it like a regular file system through Linux, including booting from it.

For booting, compatibility with the existing BIOS extension is useful. 
Until someone provides MTD and JFFS2 support for Grub, that is - I have 
Grub booting from prom (actually from DiskOnChip) quite happily.

-- 
dwmw2
