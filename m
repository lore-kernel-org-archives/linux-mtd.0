Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MLxko-0006ra-Ex
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 11:13:37 +0000
Subject: Re: about ubiformat mtdblock
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1246446371.20721.22.camel@localhost.localdomain>
References: <1246010592.12367.0.camel@tommy-desktop>
	<1246013172.9487.66.camel@localhost.localdomain>
	<1246074583.4250.4.camel@tommy-desktop>
	<1246102372.9487.80.camel@localhost.localdomain>
	<1246241677.7834.5.camel@tommy-desktop>
	<1246373466.20721.12.camel@localhost.localdomain>
	<1246409674.6221.1.camel@tommy-desktop>
	<1246441852.20721.13.camel@localhost.localdomain>
	<1246445026.10830.0.camel@tommy-desktop>
	<1246445133.20721.15.camel@localhost.localdomain>
	<1246445931.10969.4.camel@tommy-desktop>
	<1246446371.20721.22.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2009 19:13:28 +0800
Message-Id: <1246446808.11095.2.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

THANKS!~
Kernel command line: console=ttySAC0,115200 ubi.mtd=2 root=ubi0_0
rootfstype=ubifs

mount: mounting proc on /proc failed: Device or resource busy      
WARNING: Couldn't open directory /lib/modules/2.6.24.2: No such file or
directory
FATAL: Could not open /lib/modules/2.6.24.2/modules.dep.temp for
writing: No such file or directory
modprobe: FATAL: Could not load /lib/modules/2.6.24.2/modules.dep: No
such file or directory

modprobe: FATAL: Could not load /lib/modules/2.6.24.2/modules.dep: No
such file or directory

open_ubi name rootfs<3>UBIFS error (pid 576): ubifs_get_sb: cannot open
"rootfs", error -22 

root@localhost:/etc/rcS.d# vi S35mountall.sh
#
# Mount local filesystems in /etc/fstab. For some reason, people
# might want to mount "proc" several times, and mount -v complains
# about this. So we mount "proc" filesystems without -v.
#
test "$VERBOSE" != no && echo "Mounting local filesystems..."
mount -at nonfs,nosmbfs,noncpfs 2>/dev/null

root@localhost:/etc/rcS.d# cat ../fstab
# stock fstab - you probably want to override this with a machine
specific one

rootfs               /                    auto       defaults
1  1
proc                 /proc                proc       defaults
0  0
devpts               /dev/pts             devpts     mode=0620,gid=5
0  0
#usbdevfs             /proc/bus/usb        usbdevfs   noauto
0  0
tmpfs                /var                 tmpfs      defaults
0  0
tmpfs                /mnt/ram           tmpfs      defaults
0  0

# uncomment this if your device has a SD/MMC/Transflash slot
#/dev/mmcblk0p1       /media/card          auto
defaults,sync,noauto  0  0



On 三, 2009-07-01 at 14:06 +0300, Artem Bityutskiy wrote:
> On Wed, 2009-07-01 at 18:58 +0800, tommy wrote:
> > ps:
> > 
> > if my board nfs boot ,not ubifs boot,following is ok!
> > nfs@root:ubiattach /dev/ubi_ctrl -m 2
> > nfs@root:mount -t ubifs ubi0_0 /mnt /
> > it it ok!
> 
> Try adding:
> 
> ubi.mtd=0 root=ubi0_0 rootfstype=ubifs
> 
> to the kernel boot line.
> 
