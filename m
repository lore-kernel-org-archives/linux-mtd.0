Received: from luaren.pc-intouch.com ([66.42.86.8])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16jEFZ-0006U3-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Mar 2002 06:53:09 +0000
Date: Thu, 7 Mar 2002 23:06:10 -0800 (PST)
From: Kristian Hoffmann <khoff@pc-intouch.com>
To: Dzuy Nguyen <dzuy@infinity-studios.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: Compressed root FS & DoC partition
In-Reply-To: <3C87EB8A.7070305@infinity-studios.com>
Message-ID: <Pine.LNX.4.44.0203072304070.13630-100000@luaren.pc-intouch.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

You could just leave the DoC formatted as a full 16MB parition and put a
kernel, config, and compressed filesystem image in there.  Then load the
compressed image as an initrd and mount your runtime config after booting.
It works on a 16MB IDE flash drive.

HTH,

-Kristian

On Thu, 7 Mar 2002, Dzuy Nguyen wrote:

> I have a 16MB DoC 2000.  I am able to boot make an ext2 FS on and boot
> via LILO.
>
> Now, I want to be able to make it boot to a compressed root FS.  I've
> created my own
> compressed root FS (about 6MB).  I figured I'd partition the DoC into 2
> parts of 8MB
> each.  The first part is to hold the root FS (and possibly kernel) and
> the latter part an
> ext2 FS to store system's configuration files (to mount on /etc later).
>
> I've tried both using dformat and nftl_format to format half of the DoC
> and mke2fs it.
> It just refuses to make the formatted half an ext2 unless the entire DoC
> is formatted.
>
> Am I on the wrong path here?  Can someone point me to the right
> direction?  Thanks.
>
> Dzuy
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
