Subject: Re: [PATCH 1/2] mtd: physmap: add physmap_unmapped_area() for
	no-mmu XIP
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind1@gmail.com
In-Reply-To: <1276352794.19028.122.camel@localhost>
References: <1274599824-17530-1-git-send-email-vapier@gentoo.org>
	<1276352794.19028.122.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Aug 2010 10:33:28 +0100
Message-ID: <1280914408.19499.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Mike Frysinger <vapier@gentoo.org>, uclinux-dev@uclinux.org,
	Bernd Schmidt <bernds_cb1@t-online.de>,
	David Howells <dhowells@redhat.com>,
	Paul Mundt <lethal@linux-sh.org>, linux-mtd@lists.infradead.org,
	Greg Ungerer <gerg@uclinux.org>, uclinux-dist-devel@blackfin.uclinux.org,
	David McCullough <davidm@snapgear.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-06-12 at 17:26 +0300, Artem Bityutskiy wrote:
> On Sun, 2010-05-23 at 03:30 -0400, Mike Frysinger wrote:
> > From: Bernd Schmidt <bernds_cb1@t-online.de>
> > 
> > Currently, romfs XIP doesn't work in flash memory (the kernel crashes
> > with a null pointer dereference).  The problem is that the mtd physmap
> > driver isn't setting up a get_unmapped_area pointer for the mtd
> > partitions it creates.
> > 
> > Signed-off-by: Bernd Schmidt <bernds_cb1@t-online.de>
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> 
> Pushed both to my l2-mtd-2.6.git / dunno.

I'm confused by the second patch -- isn't this done in add_mtd_device()
already, according to the device type?

You're setting mtd_bdi_ro_mappable indiscriminately for all types of
devices. For flash devices, that can be an issue -- if you schedule a
userspace process while the kernel is writing to the flash, for example.

If you want to allow XIP of writable flash devices, there's more to it
than this.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
