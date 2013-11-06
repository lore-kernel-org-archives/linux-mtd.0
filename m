Received: from 1wt.eu ([62.212.114.60])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdwdQ-0005cU-0F
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 06:30:36 +0000
Date: Wed, 6 Nov 2013 07:30:07 +0100
From: Willy Tarreau <w@1wt.eu>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: Ubiblock users call (Re: mvneta / openblocks switch)
Message-ID: <20131106063007.GA17145@1wt.eu>
References: <20131031135322.GN26784@titan.lakedaemon.net>
 <52738D6A.1010900@hitachi.com> <20131101130528.716e53d9@skate>
 <20131105103555.GD16420@1wt.eu> <5278E824.8050405@hitachi.com>
 <20131105135323.GA17316@1wt.eu> <20131105144003.GB9632@localhost>
 <20131105145748.GE17316@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131105145748.GE17316@1wt.eu>
Cc: piergiorgio.beruto@gmail.com, Mike Frysinger <vapier@gentoo.org>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Tue, Nov 05, 2013 at 03:57:48PM +0100, Willy Tarreau wrote:
> > Can you describe your usage?
>
> For example, one of my distro's boot scripts automatically detects
> the available partitions, checks for a mountable FS there, then
> locates the current config and loads it. With a block device, I have
> nothing to change at all. With other solutions, I have to reconsider
> the boot process.

BTW, I forgot to describe the initial use case I had in mind which led to this:
many of my machines (including the test ones) boot from a rootfs which is a
squashfs stored as an initrd image. At the moment, the squashfs is read by
u-boot from the NAND into memory and the kernel boots from this. Loading a 10
MB rootfs from NAND to RAM takes 1-2 seconds depending on the device, and
consumes 10 MB of RAM all the time. Also, you're always at risk that some bad
blocks appear in the middle of this image (I had one device where I had to
change the location of the initrd partition because of
this).

With ubiblock, I can totally solve this issue :
  - u-boot does not read anymore the initrd, thus saving time and RAM
  - kernel simply mounts the squashfs at boot from ubiblock, resulting
    in direct accesses
  - ubi would take care of bad blocks itself

Doing so prevents me from upgrading the image since it's always mounted,
which is why I wanted to try to write it from u-boot. It did not work so
I wanted to use 2 images and upgrade one while running on the other one.
But I did not make any progress on this yet.

I'll definitely give your latest patches a try, I just don't know when :-)

Best regards,
Willy
