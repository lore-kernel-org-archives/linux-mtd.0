Received: from moutng.kundenserver.de ([212.227.17.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R221W-0002aP-AX
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 14:25:44 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind1@gmail.com
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Fri, 9 Sep 2011 16:25:13 +0200
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<201109081726.00769.arnd@arndb.de>
	<1315569206.7905.41.camel@sauron>
In-Reply-To: <1315569206.7905.41.camel@sauron>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201109091625.13253.arnd@arndb.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	david.wagner@free-electrons.com, lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 09 September 2011, Artem Bityutskiy wrote:
> On Thu, 2011-09-08 at 17:26 +0200, Arnd Bergmann wrote:
> > On Tuesday 06 September 2011, Artem Bityutskiy wrote:
> > > Not sure about the bus approach - David, could you take a look at it
> > > please? If we can handle errors there - then we could indeed re-use the
> > > UBI control device. We could even re-use the ioctl data structures for
> > > UBI volumes creation/removal - we have plenty of space there reserved
> > > for future extensions.
> > 
> > I would generally recommend using new ioctl commands. ioctl numbers
> > are cheap, but complexity in data structures is not, because every
> > user who wants to deal with the data structures has to understand
> > them. Also, changing the ABI is always tricky since you have to
> > provide backward and forwards compatibility with existing kernels
> > and with existing user space.
> 
> Hmm, what do we do if ubiblk module is not loaded, and UBI would have
> to return an error (because the block device cannot be created), how
> will UBI know that ubiblk is not there? Any direct call to ubiblk from
> UBI would be a direct dependency and would require ubiblk to be always
> loaded, which is bad.

No, the idea of this approach is that the main ubi driver creates
a device, which can always succeed. It's just that there won't
be a block device node created, because that is part of what
the ubiblk driver does.

Compare this to how scsi works:

A scsi host driver scans the host controller and adds scsi devices
internal to the kernel, each of them have a specific type (disk,
tape, ...). If the scsi disk driver is loaded, it will create
a blockdev for each disk device. It doesn't matter in which order
the drivers are loaded though.

In case of ubiblk, it's similar, except that there is no way for
the ubi layer to know if some partition should be a block device or
not, so it relies on user space to tell it.

Well, actually, you /could/ encode this somewhere so that the main
ubi layer creates different kinds of devices based on what it finds:
a ubiblk_device when it finds a partition that was created as a
block device or gluebi_device for gluebi or a ubifs volume.

> IOW, we need a blocking mechanism to call the upper layer's function
> (ubiblk) from the lower layer (UBI) which can return an error, and which
> allows to check if a ubiblk exists at all. Do we have such mechanism?
> 
> Actually the fact of invoking upper layers from lower makes me worry.

Yes, you should not do that.

	Arnd
