Received: from moutng.kundenserver.de ([212.227.126.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J51E6-0006E3-UA
	for linux-mtd@lists.infradead.org; Wed, 19 Dec 2007 15:53:02 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind@infradead.org
Subject: Re: [PATCH 1/5] UBI: add UBI control device
Date: Wed, 19 Dec 2007 16:51:09 +0100
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191512.00951.arnd@arndb.de>
	<1198074693.18962.59.camel@sauron>
In-Reply-To: <1198074693.18962.59.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200712191651.10608.arnd@arndb.de>
Cc: Frank Haverkamp <haver@vnet.ibm.com>, linux-mtd@lists.infradead.org,
	Andreas Arnez <arnez@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 19 December 2007, Artem Bityutskiy wrote:
> On Wed, 2007-12-19 at 15:11 +0100, Arnd Bergmann wrote:
> > > 
> > > This patch is a preparation to make UBI devices dynamic. It
> > > adds an UBI control device which has dynamically allocated
> > > major number and registers itself as "ubi_ctrl". It does not
> > > do anything so far. The idea is that this device will allow
> > > to attach/detach MTD devices from userspace.
> > > 
> > > This is symilar to what the Linux device mapper has.
> > 
> > I don't really like the idea of a separate device node, the
> > point that device mapper does it is not a particularly strong
> > argument.
> > 
> > A better alternative would be probably be to do it similar
> > to the loopback device, where you attach the device node itself
> > with a back-end (file in case of loop).
> 
> Pardon, I do not get this. Please, explain it some more. So, we have 2
> MTD devices in the system - mtd0 and mtd1, and UBI is compiled in the
> kernel. How do I create UBI device on top of mtd0?

with the "/dev/loop"-like method, you'd do something like

	struct ubi_attach_req req = {
		.vid_hdr_offset = vid_hdr,
		.data_offset = data,
		.mtd_num = 0,
	};
	int fd = open("/dev/ubi0", ...);
	ioctl(fd, UBI_IOCATT, &req);

same as before, but instead of /dev/ubictrl, you'd use the actual ubi
device directly. Since this wasn't obvious, I may have misunderstood
something about ubi. Is there actually a device node for each ubi device?
Is it a block or character device?

> > I'd say a more natural approach would be to use attributes in sysfs to allow the
> > probing and destruction of the UBI devices. That way, you could use much
> > simpler hooks into udev to create them, without the need of a special user
> > ioctl interface.
> 
> Pardon? I register ubi_ctl within this thing which is called "Linux
> Device Model" and I already automatically have udev
> creating /dev/ubi_ctrl. device. And everything is already simple.
> Please, elaborate.

The Linux device model is really good for actual devices. One thing it
does not handle that well is artificial interfaces that are not really
physical devices in your system.
The MTD devices are already represented in the device model. If you
want to represent UBI well, it should be connected to that.

> > > +/* UBI control character device major number */
> > > +static int ubi_ctrl_major;
> > 
> > Why do you need you own major number? I think if you really want this ioctl
> > interface, a misc device would be completely sufficient.
> 
> I wanted to have /dev/ubi_ctrl, why not? What's wrong with this?

A major number gives you a space of 2**32 devices, where you would only
need a single device. 
If you just call misc_register(), you get the exact same semantics for
/dev/ubi_ctrl, but need less code.
   
Note that I'm talking about three different alternatives here:

1. Use the ubi device node directly instead of a separate control
   device.
2. Replace the control device with text based attributes in the MTD
   objects in sysfs.
3. Do everything like you have already, just replace a full character
   device with the simpler misc_device.

You should only use one of these.

> > >  	ubi_ltree_slab = kmem_cache_create("ubi_ltree_slab",
> > >  					   sizeof(struct ubi_ltree_entry), 0,
> > >  					   0, &ltree_entry_ctor);
> > 
> > How many objects to you expect to have in this cache? Is it just one
> > object per device? That would hardly be worth creating a special cache.
> 
> Well, this is a subject of separate patch, because I just move this code
> no. But the reason to have separate slab was that I have to optimize
> this by having my own constructor.

I thought constructors have mostly been deprecated, now that destructors
are no longer part of the kernel. At least they don't have any advantage
over a simple wrapper around kzalloc/initialize.

	Arnd <><

	Arnd <><
