Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A1r7o-0003SZ-Mu
	for <linux-mtd@lists.infradead.org>; Tue, 23 Sep 2003 18:38:56 +0100
Message-ID: <005201c381f9$25660a70$b670a8c0@laptoplukkino>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "Cam Mayor" <cmayor@iders.ca>,
	<linux-mtd@lists.infradead.org>
References: <00a601c37ec3$46b95760$b670a8c0@laptoplukkino>
	<03091911494401.08026@kilauea.iders.ca>
Date: Tue, 23 Sep 2003 19:35:56 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: mounting mtd device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Friday 19 September 2003 10:32, Luca Contini wrote:
> > Hi all,
> > I've successfully compiled the mtd subsystem as a module (mtdblock.o and
> > mtd_blkdevs.o).
> > I've also successfully inserted those modules using insmod utility, so
that
> > now I can see the mtdblock block device (major number 31) in the
> > /proc/devices list.
> > But when I try to mount the corresponding /dev/mtdblock0 device to
/mnt/mtd
> > I got the following error:
> > ** mount: /dev/mtdblock0: unknown device **
> >
> > The /dev/mtdblock0 device relies on major number 31, minor number 0 and
is
> > a block device.
> > Also, I've placed a
> > printk("<1>open\n")
> > in the 'blktrans_open' function to see whether the mount is at least
trying
> > to open the device but with no result.
> > Does anyone know why?
>
> I'm new to MTD, but i don't see enough information here.  How did you try
and
> mount it?  For instance, did you do "mount -t jffs2 /dev/mtdblock0
/mnt/mtd",
> or did you just type "mount /dev/mtdblock0 /mnt/mtd"?  (jffs2 is an
arbitrary
> example).
>
> Is your device actually detected?  Just because you have the module
installed
> and showing up in /proc/devices doesn't mean it was detected.  what does
> /proc/mtd say?  For instance, mine says:
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00800000 00020000 "flash"
> mtd1: 0000c000 00000010 "SRAM"
> mtd2: 00000080 00010000 "BootROM"
> mtd3: 00800000 00020000 "Physically mapped flash"
> mtd4: 00400000 00020000 "system"
> mtd5: 00400000 00020000 "userarea"
> mtd6: 09000000 00004000 "guidenand"
>
> this shows which mtd devices are actually there to be accessed.

Which is the mtdblock function called by cat?
I'd like to debug my code... should the printk("<1>check") be working?

Regards
>
> cheers,
> cam
>
> --
> Cameron Mayor
> Iders Incorporated
>
