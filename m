Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DLWwg-0002uN-9X
	for linux-mtd@lists.infradead.org; Tue, 12 Apr 2005 21:45:35 -0400
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR010.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0IEV00G5U3K0GJ@VL-MO-MR010.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 12 Apr 2005 21:45:36 -0400 (EDT)
Date: Tue, 12 Apr 2005 21:45:36 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20050413010315.GA31632@slurryseal.ddns.mvista.com>
To: Todd Poynor <tpoynor@mvista.com>
Message-id: <Pine.LNX.4.62.0504122118560.14514@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20050413010315.GA31632@slurryseal.ddns.mvista.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fixup Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 12 Apr 2005, Todd Poynor wrote:

> Another try at how to handle the longstanding problem of chips that lock
> all blocks at power up.  This version handles it in a way that I think
> is in accordance with previous suggestions: it checks for whether the
> chip has this property (for Intel flash the data sheet for at least one
> model implies that those with the Instant Individual Block Locking
> feature bit set will also have the property of locking all blocks at
> power up); and it rectifies the locks with the map write access flags at
> probe time and at resume time.  It adds a chip driver callback when
> partitions/devices are added, so that the driver can fix things up
> according to the map info.
> 
> Any comments on whether this is or is not the way to go appreciated.

Properly dealing with this "feature" appears to be so messy that I'm 
starting to wonder if we should not just unconditionally unlock the 
flash at boot time and be done with it.

It's only the flash used for the root filesystem which is problematic 
anyway, right?  If so then I think there should be a mount option for 
JFFS* such that it directly unlocks the whole of the MTD device it's 
about to be mounted on when it's mounted read-write.  That's it.

As for the suspend case then you should probably just preserve the flash 
lock state before suspending and restore that state upon resume.

> +static void cfi_intelext_unlockall(struct mtd_info *mtd)
> +{
> +	int i;
> +
> +	for (i = 0; i < mtd->numeraseregions; i++) {
> +		int j;
> +
> +		for (j = 0; j < mtd->eraseregions[i].numblocks; j++){
> +			mtd->unlock(mtd, mtd->eraseregions[i].offset +
> +				    j * mtd->eraseregions[i].erasesize,
> +				    mtd->eraseregions[i].erasesize);
> +		}
> +	}
> +	
> +}

Why are you doing this block by block? You could as well just do:

	cfi_intelext_unlock(mtd, 0, mtd->size);

since the block walking is already performed by cfi_varsize_frob().


Nicolas
