Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 156vBN-0003Ar-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Jun 2001 15:18:13 +0100
Date: Mon, 4 Jun 2001 10:22:10 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Abraham vd Merwe <abraham@2d3d.co.za>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: mtd->erasesize 
In-Reply-To: <18826.991656241@redhat.com>
Message-ID: <Pine.LNX.4.33.0106041018260.3316-100000@xanadu.home>
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


On Mon, 4 Jun 2001, David Woodhouse wrote:

>
> abraham@2d3d.co.za said:
> >  I'm busy writing a driver for the 28Fxxxxx 3V Intel Fast Boot Block
> > flash devices (for now only a LART driver since I have no other boards
> > to play with).
>
> You should be able to use the same actual chip driver as the CFI code -
> cfi_cmdset_0001.c. You just need a piece of code to do the Intel-specific
> probe and set up the appropriate structure for the chip driver to use, much
> like the existing code for AMD/JEDEC probes which has been merged into
> cfi_probe.c, except that it should actually be a separate probe function (as
> should the AMD/JEDEC one).

Actually, I suggested on the LART list that the LART flash driver has its
own driver without trying to twist the LART funny address/data line routing.
A separate driver would eliminate the need for convoluted probing routines
altogether while keeping the overall code cleaner and simpler.


Nicolas
