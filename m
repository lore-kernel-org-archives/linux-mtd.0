Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7Uqp-000530-PX
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 05:13:52 -0400
Date: Tue, 23 Aug 2005 11:13:33 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Ryan B. Lynch" <rlynch@bway.net>
Message-ID: <20050823091333.GC27570@wohnheim.fh-wedel.de>
References: <430A2F9E.6070405@bway.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <430A2F9E.6070405@bway.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: block2mtd driver won't take kernel command-line parameters
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 22 August 2005 20:03:42 +0000, Ryan B. Lynch wrote:
> 
> (I mentioned this to Jorn directly on Friday, but he seems to be busy
> with some other stuff at the moment, so I thought I'd send it to the
> list in general.)

Yup.  I started the removal stuff over the weekend, btw.  It quickly
turned out that a full mtd class in sysfs is needed and I will do that
first, then add the block2mtd bits.  Quite a bit of work, I'm afraid.

> When the "block2mtd" driver is built into the kernel, it's possible to
> add new block devices as emulated MTDs with a command like:
> 
>     echo "/dev/hda2" > /sys/module/block2mtd/parameters/block2mtd
> 
> (which would create new /dev/mtd* and /dev/mtdblock* devices).  In order
> to make the device appear at boot time, Jorn has told me that you can
> provide the same parameter to the kernel on the boot command line, like so:
> 
>     block2mtd.block2mtd=/dev/hda2
> 
> I'm using the line
> 
>     append="block2mtd.block2mtd=/dev/hda2"
> 
> in the file "/etc/lilo.conf" in to try to pass that parameter.
> 
> BUT... it doesn't seem to work.  I can set the block2mtd device up after
> booting, using the "echo..." method above, without any errors or other
> problems.  Adding the kernel command-line parameter seems to have no
> effect at all--there are no error messages in 'dmesg', or anything like
> that.  'cat /proc/cmdline' shows the parameter as it should be, so I
> know that parameter is getting passed to the kernel.
> 
> I tried passing a few SCSI- and USB-related parameters at the command
> line, too, just to make sure that parameter handling in general was
> working properly.  Everything worked fine, just like it's supposed to.
> 
> Has anyone else encountered similar issues making block2mtd work with
> command-line parameters?  Am I doing something stupid in my LILO config
> line, or what?  Any ideas or help are appreciated, because I'm at a dead
> end, not knowing enough about the kernel code to go much further on my own.
> 
> For the record, I'm using kernel version 2.6.12, with the MTD patches
> from CVS of 2005.08.14.  I can provide configs on request.

Would be nice if someone else takes a look.  I won't find time before
the weekend, I'm afraid.  And even then, it could be less than I would
like.

Jörn

-- 
To my face you have the audacity to advise me to become a thief - the worst
kind of thief that is conceivable, a thief of spiritual things, a thief of
ideas! It is insufferable, intolerable!
-- M. Binet in Scarabouche
