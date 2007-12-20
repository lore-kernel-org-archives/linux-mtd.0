Received: from moutng.kundenserver.de ([212.227.126.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1J5T5Q-0006xr-KD
	for linux-mtd@lists.infradead.org; Thu, 20 Dec 2007 21:37:55 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: dedekind@infradead.org
Subject: Re: [PATCH 4/5] UBI: introduce attach ioctls
Date: Thu, 20 Dec 2007 22:34:56 +0100
References: <20071219154137.23264.28116.sendpatchset@golum>
	<200712191657.24027.arnd@arndb.de>
	<1198086060.18962.120.camel@sauron>
In-Reply-To: <1198086060.18962.120.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200712202234.56859.arnd@arndb.de>
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
> On Wed, 2007-12-19 at 16:57 +0100, Arnd Bergmann wrote:
> > > 
> > > If the MTD device is already UBI-formatted, the numbers may be read from
> > > the media. Otherwise, not.
> > 
> > Ok, let me suggest an idea, it probably needs more refinement, but maybe we
> > can come up with something better based on this:
> > 
> > You can have a simple attribute named 'ubi-probe' in each MTD device in sysfs.
> 
> Err, why should MTD know something about what sits on top of it? Today
> it is UBI, tommorrow it is something new and better, e.g., more
> scalable.

The way you would implement this is to have the UBI code grab hold of all
the MTD devices, and create the ubi-probe attribute in them. This is
something that is easily possible with the device model, provided that
we can get a 'struct device' embedded into 'struct mtd_info'. I just realized
that this is currently missing.

> > this is only readable, and contains either '0' or '1' in ascii, telling you
> > whether a UBI device could be found for this device.
> 
> So MTD maintains ubi-probe attribute, and has some knowlege about UBI.
> Well, it is technically possible, but I do not think it would be good
> design. The same way we could teach MTD to probe if it has JFFS2 on it,
> or something else...

The probe on a JFFS2 formatted device is called 'mount', and we have a
perfectly fine system call interface for that ;-)

> > This only works for UBI formatted media, and the kernel does not format the
> > media itself.
> > IF you want to UBI-format a medium, use a user space tool that writes the
> > appropriate blocks directly to the /dev/mtd* character device.
> 
> Yeah, user-space tools could format media. But it is so much appropriate
> facility to have UBI being able to format it itself. It is really very
> convenient. Flashes have special state - empty flash, and if the flash
> is empty - UBI make it UBI-formatted. If the flash has some garbage -
> UBI does not format it. 

Ok, another idea: just create an UBI device for every MTD device, but don't
probe until the UBI device is first accessed. That way, you don't need
any dynamic registration, and you can use an ioctl on the device itself
in order to do the initial formatting with new parameters.

	Arnd <><
