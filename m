Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 165WvN-0006GZ-00
	for <linux-mtd@lists.infradead.org>; Sun, 18 Nov 2001 18:44:13 +0000
Subject: Re: second "mount" hangs
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <1335.1006108414@redhat.com>
References: <1006107094.1391.46.camel@gromit.house>  
	<1335.1006108414@redhat.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 18 Nov 2001 13:54:48 -0500
Message-Id: <1006109689.1390.50.camel@gromit.house>
Mime-Version: 1.0
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

Here ya go (SysRQ-t):

Nov 18 13:49:54 gromit kernel: mount         D C0D62000     0 18486  
1131                     (NOTLB)
Nov 18 13:49:54 gromit kernel: Call Trace: [__down_read+88/120]
[get_super+73/100] [sync_inodes+21/76] [fsync_dev+23/48]
[invalidate_device+23/88] 
Nov 18 13:49:54 gromit kernel: Call Trace: [<c028ca8c>] [<c013253d>]
[<c013f659>] [<c012f5ef>] [<c013fc77>] 
Nov 18 13:49:54 gromit kernel:    [<d48ea72e>] [blkdev_put+99/144]
[get_sb_bdev+360/672] [<d497ab80>] [set_devname+39/84]
[do_kern_mount+170/296] 
Nov 18 13:49:54 gromit kernel:    [<d48ea72e>] [<c0133cfb>] [<c0132ae8>]
[<d497ab80>] [<c0141307>] [<c013309a>] 
Nov 18 13:49:54 gromit kernel:    [<d497ab80>] [do_add_mount+28/208]
[do_mount+270/296] [copy_mount_options+80/156] [sys_mount+124/192]
[system_call+51/56] 
Nov 18 13:49:54 gromit kernel:    [<d497ab80>] [<c0142098>] [<c01422f6>]
[<c014219c>] [<c014238c>] [<c0106beb>] 


On Sun, 2001-11-18 at 13:33, David Woodhouse wrote:
> 
> 
> rothwell@holly-springs.nc.us said:
> > I mounted a JFFS2 filesystem stored on a 16MB partition on a zip disk,
> > using mtdblock and blktmd. I accidentally typed "mount /mnt/flash"
> > rather than "umount /mnt/flash", and "mount" is now hung. Unkillable. /
> > mnt/flash is still mounted and usable, but not unmountable. It seems I
> > will have to reboot to umount the filesystem. I can't even eject the
> > zip disk. 
> 
> ISTR someone reported this to me recently. I don't recall them ever 
> responding with the results of SysRq-T when I asked though. What are the 
> relevant processes waiting for?
> 
> 
> --
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
