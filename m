Received: from moutng.kundenserver.de ([212.227.126.186])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R22Ql-0003Ff-Cm
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 14:51:48 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Wagner <david.wagner@free-electrons.com>
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Fri, 9 Sep 2011 16:51:35 +0200
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1315569206.7905.41.camel@sauron>
	<4E6A25B1.8070400@free-electrons.com>
In-Reply-To: <4E6A25B1.8070400@free-electrons.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201109091651.35984.arnd@arndb.de>
Cc: linux-embedded <linux-embedded@vger.kernel.org>, dedekind1@gmail.com,
	lkml <linux-kernel@vger.kernel.org>,
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

On Friday 09 September 2011, David Wagner wrote:
> On 09/09/2011 01:53 PM, Artem Bityutskiy wrote:
> > On Thu, 2011-09-08 at 17:26 +0200, Arnd Bergmann wrote:
> >> On Tuesday 06 September 2011, Artem Bityutskiy wrote:
> >>> Not sure about the bus approach - David, could you take a look at it
> >>> please? If we can handle errors there - then we could indeed re-use the
> >>> UBI control device. We could even re-use the ioctl data structures for
> >>> UBI volumes creation/removal - we have plenty of space there reserved
> >>> for future extensions.
> >>
> 
> @Arnd:
> > * Use the existing UBI control device for the block devices as
> >   well and just add two more ioctls to create the devices.
> >   You can add a logical bus_type for this so that the ubi block
> >   driver gets automatically loaded matched with the device when
> >   one is created using the control device.
> 
> I certainly miss some background, I'm not sure I understand how this
> works: bus_type seems suitable for pluggable devices that possess a
> device ID which matches against a driver that will then get loaded.  But
> ubiblk devices are created by ubiblk.
> So, are you suggesting to move ubiblk_create() to UBI and add a
> MODULE_ALIAS to ubiblk (actually, I don't know what it would contain) ?

Sort of: You definitely move some part of ubiblk into the control
driver, but that part can be relatively small. All devices on
the ubiblk bus would have the same type, so the same probe function
would always get called.

> @Artem:
> > Sorry, I wonted to talk about situations when someone opens an ubiblk
> > device while the underlying UBI volume is being removed, but then though
> > this is trivial and forgot to erase the last sentence.
> 
> Ah, yes, I guess we need to hold a vol_lock in ubiblk_remove() ?
 
Most importantly, you need reference counting.

	Arnd
