Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15AwXv-0005zw-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Jun 2001 17:34:09 +0100
Date: Fri, 15 Jun 2001 12:38:21 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Abraham vd Merwe <abraham@2d3d.co.za>
cc: David Woodhouse <dwmw2@infradead.org>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: latest jffs2 troubles
In-Reply-To: <20010615164525.A6569@crystal.2d3d.co.za>
Message-ID: <Pine.LNX.4.33.0106151237400.12949-100000@xanadu.home>
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


On Fri, 15 Jun 2001, Abraham vd Merwe wrote:

> Hi David!
>
> > > jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c093c: Read 0x49ccf4da, calculated 0x2
> > > 77fb134
> > > jffs2_scan_dirent_node(): Name CRC failed on node at 0x001c0ae8: Read 0x2d13ab07, calculated 0x8
> > > a10a00e
> >
> > Urgh. Word wrap.
> >
> > Which kernel? If the alignment fixups are broken, that would explain it.
>
> 2.4.3 with the rmk2 and rmk2-np1 patches applied on LART.

2.4.3 is broken.  Use the latest (2.4.5-rmk5-np1).


Nicolas
