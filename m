Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eezi6-0002EH-Br
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 13:51:18 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQF00GFN8DDHNP0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 13:51:13 -0500 (EST)
Date: Wed, 23 Nov 2005 13:51:13 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <520AB2AD990DC04082102F77CA17263801D40623@dlee03.ent.ti.com>
To: "Menon, Nishanth" <x0nishan@ti.com>
Message-id: <Pine.LNX.4.64.0511231349330.6022@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <520AB2AD990DC04082102F77CA17263801D40623@dlee03.ent.ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Jffs2 issue on latest mtd for Sibley NOR
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 Nov 2005, Menon, Nishanth wrote:

> > Do you have separate master MTD devices for them before registering
> > partitions?  In other words, how do you probe them (what does your map
> > driver look like)?
> The file I am using is a modification to drivers/mtd/maps/omap_nor.c.
> Modification being only with another info, mtd_partition, mtd_info and
> map_info structure set for sibley.
> The init sequence is:
> simple_map_init, do_map_probe, parse_mtd_partitions-> add_mtd_partitions
> 
> So this sequence happens to two set of structures (twice basically -
> once for strata and second time for sibley).

Can you provide your boot log?  Just do dmesg > log.txt once booted and 
send that file.


Nicolas
