Received: from tomts14.bellnexxia.net ([209.226.175.35] helo=tomts14-srv.bellnexxia.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16EF8v-0004O4-00
	for <linux-mtd@lists.infradead.org>; Wed, 12 Dec 2001 19:34:13 +0000
Date: Wed, 12 Dec 2001 14:43:49 -0500 (EST)
From: Ilguiz Latypov <ilatypov@superbt.com>
To: <joao.filgueira@copel.com>
cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Booting from Disk On Chip 2000
In-Reply-To: <OF446D3D2A.08857E28-ON03256B20.00701E59@COPELnet>
Message-ID: <Pine.LNX.4.33.0112121434570.21254-100000@server.superbt.com>
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

I guess you can program either lilo or Grub into DiskOnChip to boot off
it, but not both.

Similarly, you can load either BIOS TrueFFS drivers and the binary-only
O/S abstraction layer from http://www.m-sys.com/ or the open source MTD
drivers for DiskOnChip from http://linux-mtd.infradead.org/.

I can not recollect the installation procedure for lilo.  You may find
them at M-Sys web site.  The Grub installation procedure was posted last
month in this list.  There was an error in it: you have to reload the NFTL
module or reboot if it's compiled in after running nftl_format.

Ilguiz

On Wed, 12 Dec 2001 joao.filgueira@copel.com wrote:

> THe Disk on Chip is using BIOS TRUE FFS 1.23. If I try i newer version
> my DonC hangs. I compiled kernel 2.4.16 with the most recent drivers
> i've found.
>
> I made some progress. LILO says it is installed, but when i try to but
> from DonC it only writes " L I " and hangs. I dont know what kind of
> error is this.
