From: Russ.Dill@asu.edu (Russ Dill)
Date: 17 Mar 2003 14:13:01 -0700
Subject: New problem with DoC
In-Reply-To: <20030317205438.AFED44116@blood.actrix.co.nz>
References: <000201c2ecbf$47ab1be0$88a7580c@who5>
 <1047933115.1637.19.camel@gobbles>
 <20030317205438.AFED44116@blood.actrix.co.nz>
Message-ID: <1047935579.1638.22.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> > right now, grub only supports filesystems on top of NFTL. It'd be really
> > nice to get YAFFS and JFFS2 support into grub. As a workaround, you may
> > be able to use a small NFTL partition, with cramfs (patches exist to add
> > cramfs to grub) containing a menu.lst and kernel, and then mount the
> > rest as YAFFS/JFFS2. Or of course just use NFTL
> 
> There is a bootloader for YAFFS in CVS (in the direct subdirectory). Very 
> simple. Should be very easy to add to grub.

you'd like to think so, unfortunately, grub is a "bit" weird in its API
and interfacing, adding cramfs support to grub was a bit of a pain. I'll
contract to add YAFFS to grub if someone needs it.
