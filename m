Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R22xJ-0003oa-5A
	for linux-mtd@lists.infradead.org; Fri, 09 Sep 2011 15:25:26 +0000
Received: by yic13 with SMTP id 13so1019648yic.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 09 Sep 2011 08:25:22 -0700 (PDT)
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 09 Sep 2011 18:27:43 +0300
In-Reply-To: <201109091625.13253.arnd@arndb.de>
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<201109081726.00769.arnd@arndb.de> <1315569206.7905.41.camel@sauron>
	<201109091625.13253.arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315582069.7905.82.camel@sauron>
Mime-Version: 1.0
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	david.wagner@free-electrons.com, lkml <linux-kernel@vger.kernel.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-09-09 at 16:25 +0200, Arnd Bergmann wrote:
> On Friday 09 September 2011, Artem Bityutskiy wrote:
> > On Thu, 2011-09-08 at 17:26 +0200, Arnd Bergmann wrote:
> > > On Tuesday 06 September 2011, Artem Bityutskiy wrote:
> > > > Not sure about the bus approach - David, could you take a look at it
> > > > please? If we can handle errors there - then we could indeed re-use the
> > > > UBI control device. We could even re-use the ioctl data structures for
> > > > UBI volumes creation/removal - we have plenty of space there reserved
> > > > for future extensions.
> > > 
> > > I would generally recommend using new ioctl commands. ioctl numbers
> > > are cheap, but complexity in data structures is not, because every
> > > user who wants to deal with the data structures has to understand
> > > them. Also, changing the ABI is always tricky since you have to
> > > provide backward and forwards compatibility with existing kernels
> > > and with existing user space.
> > 
> > Hmm, what do we do if ubiblk module is not loaded, and UBI would have
> > to return an error (because the block device cannot be created), how
> > will UBI know that ubiblk is not there? Any direct call to ubiblk from
> > UBI would be a direct dependency and would require ubiblk to be always
> > loaded, which is bad.
> 
> No, the idea of this approach is that the main ubi driver creates
> a device, which can always succeed. It's just that there won't
> be a block device node created, because that is part of what
> the ubiblk driver does.
> 
> Compare this to how scsi works:
> 
> A scsi host driver scans the host controller and adds scsi devices
> internal to the kernel, each of them have a specific type (disk,
> tape, ...). If the scsi disk driver is loaded, it will create
> a blockdev for each disk device. It doesn't matter in which order
> the drivers are loaded though.
> 
> In case of ubiblk, it's similar, except that there is no way for
> the ubi layer to know if some partition should be a block device or
> not, so it relies on user space to tell it.

There is another difference, though. Disk types are persistent. UBI
volumes types are not necessarily persistent:

I may create a "just UBI volume", flash something there, may-be re-size,
do other things.

Then I want to "turn" it into a "ubiblk" volume without destroying it.
So I call the corresponding ioctl. And my requirements are:

1) if ubiblk is not loaded, I want to get -ENODEV or something
2) if ubiblk fails, I want to get -ESOMETHING as well.
3) I want to be blocked while ubiblk is creating the block device.

Similarly, I may want to ask ubiblk to "release" the volume and turn it
to "just a volume" again.

So I am not sure the analogy is very close, but thanks a lot for
providing it - it makes things clearer.

-- 
Best Regards,
Artem Bityutskiy
