Received: from moutng.kundenserver.de ([212.227.17.9])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwGEc-0003AJ-Kc
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 16:23:24 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind1@gmail.com
Subject: Re: [PATCHv3] UBI: new module ubiblk: block layer on top of UBI
Date: Wed, 24 Aug 2011 18:23:20 +0200
References: <1308922482-14967-1-git-send-email-david.wagner@free-electrons.com>
	<1313587042-30846-1-git-send-email-david.wagner@free-electrons.com>
	<1313998939.2644.52.camel@sauron>
In-Reply-To: <1313998939.2644.52.camel@sauron>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <201108241823.20904.arnd@arndb.de>
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

On Monday 22 August 2011, Artem Bityutskiy wrote:
> 
> On Wed, 2011-08-17 at 15:17 +0200, david.wagner@free-electrons.com
> wrote:
> > Questions:
> > ==========
> > I wasn't sure what magic ioctl number to use, so I settled to use the same one
> > as a part of UBI: 'O', which was so far only used by UBI but on a higher range
> > and leaving some room for UBI to add ioctls (for nw, it uses 'O'/0x00-0x06 and
> > ubiblk uses 'O'/0x10-0x11).  Is it ok or should ubiblk use a different
> > number/range ?
> 
> I think this is OK to share them between UBI and ubiblk, as long as this
> is documented.

That should  be fine, yes. I would probably put them into the same
header file though if they are in the same number space even
when you use them on distinct devices.

It does feel a little clumsy to have yet another character device
to manage the block devices though. What do you think about one
of these alternative approaches:

* When the ubi block device driver gets loaded, create one block
  device per volume and let the user deal with permissions for
  the devices instead of having to first create them as well.
* Use the existing UBI control device for the block devices as
  well and just add two more ioctls to create the devices.
  You can add a logical bus_type for this so that the ubi block
  driver gets automatically loaded matched with the device when
  one is created using the control device.

	Arnd
