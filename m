Received: from 12-234-34-139.client.attbi.com ([12.234.34.139] helo=heavens.murgatroid.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sq52-0004ao-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 20:06:01 +0100
From: "Christopher Hoover" <ch@murgatroid.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
	"'Christopher Hoover'" <ch@hpl.hp.com>
Cc: <linux-arm-kernel@lists.arm.linux.org.uk>,
	<linux-mtd@lists.infradead.org>
Subject: RE: 2.5.7{,-rmk1}: jffs2 on root patch 
Date: Wed, 3 Apr 2002 11:05:59 -0800
Message-ID: <003b01c1db42$974f84e0$7b00000a@SNAGGLE>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <19796.1017797325@redhat.com>
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

I discovered that with vanilla 2.5.7, the kernel will indeed mount a
jffs root, if you do:

  root=/dev/mtdblockX rootfstype=jffs2

[ 

as opposed to simply:

  root=/dev/mtdblockX 

which work just fined prior to 2.5.7

]

The "rootfstype=jffs2" part is *mandatory*, because
do_mounts.c:get_fs_names(), which computes which filesystems should be
attempted for the root partitition, skips any filesystem, such as jffs2,
that is "nodev."

-ch


> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org 
> [mailto:linux-mtd-admin@lists.infradead.org] On Behalf Of 
> David Woodhouse
> Sent: Tuesday, April 02, 2002 5:29 PM
> To: Christopher Hoover
> Cc: linux-arm-kernel@lists.arm.linux.org.uk; 
> linux-mtd@lists.infradead.org
> Subject: Re: 2.5.7{,-rmk1}: jffs2 on root patch 
> 
> 
> 
> ch@hpl.hp.com said:
> >  2.5.7-rmk1 (and apparently any 2.5.7 kernel, hence the 
> cross-posting) 
> > requires the following patch, if you wish to use a jffs2 
> file system 
> > as your root.  Without the patch, mount_block_root() won't 
> attempt to 
> > use jffs2.
> 
> I don't like it. We don't require a block device, and I'd 
> rather see the mechanism fixed to pass the 'root=' argument 
> to the file system, so we can use the new mount-by-name 
> functionality on the rootfs.
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list 
> http://lists.infradead.org/mailman/listinfo> /linux-mtd/
> 
