Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17HhGz-0007eJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 09:45:05 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3D05A8E5.9040808@bigpond.com> 
References: <3D05A8E5.9040808@bigpond.com>  <3D057440.5000104@bigpond.com> <20449.1023779170@redhat.com> 
To: brendan.simon@bigpond.com
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC2000 partitiioning question 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 11 Jun 2002 09:45:01 +0100
Message-ID: <22131.1023785101@redhat.com>
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

brendan.simon@bigpond.com said:
> HUH ??? If I read this correctly, this means one can NEVER reformat a
> NFTL  device with kernel that boots from a DOC (since the driver must
> be built  in to the kernel).  Is this correct ?

Yes, although in practice you'll get away with it if the NFTL is not in use 
at the time and you reboot without starting to use it. In general, you 
should be using the M-Systems DFORMAT utility under DOS anyway, rather than 
the nftl_format program under Linux.

> This is obviously different for EXT2 and other filesystems, as they
> can  be reformatted anytime with the driver module loaded or built in
> to the  kernel.  Is there a technical reason why NFTL is not the same
> ???

You can't mount it in the same way as other file systems because it is not 
a normal file system. It doesn't provide a file system to the VFS, it 
provides a block device. It's only _like_ a file system.

We could feasibly add an ioctl or some other way to instruct the NFTL code 
to 'unmount' and 'remount' an NFTL. It wouldn't be that hard - we have the 
code there to deal with modular DiskOnChip drivers being loaded and going 
away. Nobody's cared enough to do it, though.

Reformatting the NFTL should be a rare occurrence.


--
dwmw2
