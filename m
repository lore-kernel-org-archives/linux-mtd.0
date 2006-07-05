Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy1Zv-0003VY-0M
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 03:13:55 -0400
Date: Wed, 5 Jul 2006 10:13:40 +0300
From: Ville Herva <vherva@vianova.fi>
To: "Artem B. Bityutskiy" <dedekind@infradead.org>
Subject: Re: kernel command line arguments for block2mtd do not work
Message-ID: <20060705071340.GN6240@vianova.fi>
References: <20060704143836.GA5104@vianova.fi>
	<1152082335.4825.2.camel@sauron.oktetlabs.ru>
	<20060705070509.GB15078@vianova.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20060705070509.GB15078@vianova.fi>
Cc: linux-mtd@lists.infradead.org
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 05, 2006 at 10:05:10AM +0300, you [Ville Herva] wrote:
> On Wed, Jul 05, 2006 at 10:52:15AM +0400, you [Artem B. Bityutskiy] wrote:
> > On Tue, 2006-07-04 at 17:38 +0300, Ville Herva wrote:
> > > For the rough idea, see 
> > >         http://iki.fi/v/tmp/block2mtd.c                      
> > > (Sorry for the ugliness - it's just a workaround hack.)
> > 
> > Hello,
> > 
> > I'd suggest you to just send a patch. See "Patch submission" at
> > http://www.linux-mtd.infradead.org/source.html
> 
> I don't think any of the ideas I listed to "fix" the problem are
> satisfactory. They all run into the same dead-end of not having access to
> the rootfs when parsing the arguments, and hence, not being able to open the
> underlying blockdev. 
> 
> These days the kernel afaik does not have builtin
> device name -> device number mapping (I think it used to - for rootfs
> device mounting - but isn't that gone?). The device we are mounting might be
> the rootfs, so /dev is not present. Hence, 
> 	open_bdev_excl(devname, O_RDWR, NULL); 
> can't succeed.
> 
> What I _was_ able to do (see http://iki.fi/v/tmp/block2mtd.c) is to move the
> argument parsing later in boot process - it doesn't fail anymore, but that
> doesn't help much, since the device can't be opened. This means the error
> message is much more helpful (and it won't crash), but is it worth it?

Wait a minute, should I use init/do_mounts.c::name_to_dev_t() ?

	/*      Convert a name into device number.  We accept the following
	 *      variants:
	 *
	 *      1) device number in hexadecimal represents itself
	 *      2) /dev/nfs represents Root_NFS (0xff)
	 *      3) /dev/<disk_name> represents the device number of disk
	 *      4) /dev/<disk_name><decimal> represents the device number
	 *         of partition - device number of disk plus the partition number
	 *      5) /dev/<disk_name>p<decimal> - same as the above, that form is
	 *         used when disk name of partitioned disk ends on a digit.
	*/
	dev_t name_to_dev_t(char *name)

That might work... Even if you can't pass a normal device name in, you could
specify device number.

So something like

block2mtd.c::add_device()

        bdev = open_bdev_excl(devname, O_RDWR, NULL);
	if (!bdev) {
		dev_t dev = name_to_dev_t(devname);
		if (dev != 0) {
                	bdev = open_by_devnum(dev, FMODE_WRITE | FMODE_READ);
		}
	}

? 

What do you think?




-- v -- 

v@iki.fi
