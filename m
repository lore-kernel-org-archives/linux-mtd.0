From: manningc2@actrix.gen.nz (Charles Manning)
Date: Tue, 18 Mar 2003 08:49:27 +1200
Subject: New problem with DoC
In-Reply-To: <1047933115.1637.19.camel@gobbles>
References: <000201c2ecbf$47ab1be0$88a7580c@who5> <1047933115.1637.19.camel@gobbles>
Message-ID: <20030317205438.AFED44116@blood.actrix.co.nz>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 18 Mar 2003 08:31, Russ Dill wrote:
[snip]
>
> > Next question, how do I put that one, the /boot directory, and the
> > menu.list as when I would use a normal Grub booting arrangement in to
> > the DoC? Oh, and a custom kernel as well.
>
> right now, grub only supports filesystems on top of NFTL. It'd be really
> nice to get YAFFS and JFFS2 support into grub. As a workaround, you may
> be able to use a small NFTL partition, with cramfs (patches exist to add
> cramfs to grub) containing a menu.lst and kernel, and then mount the
> rest as YAFFS/JFFS2. Or of course just use NFTL

There is a bootloader for YAFFS in CVS (in the direct subdirectory). Very 
simple. Should be very easy to add to grub.

-- CHarles
