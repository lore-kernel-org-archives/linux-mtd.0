Received: from acl.lanl.gov ([128.165.147.1])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178k6o-0005z4-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 16:57:34 +0100
Date: Fri, 17 May 2002 09:57:31 -0600 (MDT)
From: Ronald G Minnich <rminnich@lanl.gov>
To: David Woodhouse <dwmw2@infradead.org>
cc: "Richard A. Smith" <rsmith@bitworks.com>,
    "linuxbios@lanl.gov" <linuxbios@lanl.gov>,
     <linux-mtd@lists.infradead.org>
Subject: Getting big flash onto motherboards. Will CF work? what will? 
In-Reply-To: <9295.1021650283@redhat.com>
Message-ID: <Pine.LNX.4.33.0205170948210.11746-100000@snaresland.acl.lanl.gov>
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

What's the right way to get a reasonably-sized flash part onto a commodity
motherboards, on a cluster of size 1024 nodes.

here's my problem. I'm setting up a linuxbios-based cluster of 1024 nodes.
I need about 2 Mbytes of flash, so I can get a kernel, initrd, and myrinet
driver in there for linuxbios to load and boot.

We don't want etherboot:  tried it, don't like it, won't work on myrinet
anyway. So we need a bigger flash part than is available on any P4
motherboard.

I can't just use DoC, as we have done on some motherboards, because it
takes way more than 512 or 1024 bytes of code to turn on those intel
chipsets. Also these boards use a Firmware Hub and the signalling is a bit
different (I think) than a standard FLASH part.

I think I'm stuck leaving the 512Kbyte flash part in there. Hence I need
to get an ADDITIONAL flash part on these motherboards. I had thought to
use IDE->CF adapters and put 1024 CF cards in the cluster. Note that these
parts would be read-only: on our Alpha cluster, we last updated flash 10
months ago. Some of the comments about CF reliability are a case for
concern.

Are there other options? These are 1U or .8U spaces most likely, and so a
big PCI card is out of the question -- that's needed for Myrinet. There
are no ISA slots. There are two IDE headers, and possibly a SCSI header. A
very low profile PCI card might work. The only option I was aware of was
IDE->CF adapaters. Is there something else I should look at?

thanks

ron
