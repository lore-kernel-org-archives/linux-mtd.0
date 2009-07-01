Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MLo5y-0007hT-90
	for linux-mtd@lists.infradead.org; Wed, 01 Jul 2009 00:54:49 +0000
Subject: Re: about ubiformat mtdblock
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1246373466.20721.12.camel@localhost.localdomain>
References: <1246010592.12367.0.camel@tommy-desktop>
	<1246013172.9487.66.camel@localhost.localdomain>
	<1246074583.4250.4.camel@tommy-desktop>
	<1246102372.9487.80.camel@localhost.localdomain>
	<1246241677.7834.5.camel@tommy-desktop>
	<1246373466.20721.12.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2009 08:54:34 +0800
Message-Id: <1246409674.6221.1.camel@tommy-desktop>
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

No
root@localhost:/# mount
rootfs on / type rootfs (rw)
ubi0:ubifs1 on / type ubifs (rw)
proc on /proc type proc (rw)
sysfs on /sys type sysfs (rw)
ubi0:ubifs1 on /dev/.static/dev type ubifs (rw)
tmpfs on /dev type tmpfs (rw)
ubi1:data on /media type ubifs (rw)
tmpfs on /var type tmpfs (rw)
root@localhost:/# 

On 二, 2009-06-30 at 17:51 +0300, Artem Bityutskiy wrote:
> On Mon, 2009-06-29 at 10:14 +0800, tommy wrote:
> > HI,Dear sir !
> > 
> > i have a question!
> > 
> > I have patched your 2.6.24-ubifs-git on my ARM11 platform !
> > 
> > it have succeed run and stable !
> > 
> > My rootfs have a /etc/fstab file !
> > 
> > # stock fstab - you probably want to override this with a machine
> > specific one
> > 
> > rootfs               /                    auto       defaults
> > 1  1
> > proc                 /proc                proc       defaults
> > 0  0
> > devpts               /dev/pts             devpts     mode=0620,gid=5
> > 0  0
> > #usbdevfs             /proc/bus/usb        usbdevfs   noauto
> > 0  0
> > tmpfs                /var                 tmpfs      defaults
> > 0  0
> > tmpfs                /mnt/ram           tmpfs      defaults
> > 0  0
> > 
> > if  i enable "rootfs   /  auto  defaults 1 1 ",when kernel
> > booting ,ubifs driver will say "UBIFS error (pid 628): ubifs_get_sb:
> > cannot open "rootfs", error -22"!
> > 
> > if i disable "#rootfs / auto deafults 1 1 ",when kernel booting ,ubifs
> > driver never say error ,
> > can you explain it ?
> > 
> > because my old ubifs patched driver never say any error even if  it is
> > enable  !
> 
> Can you mount it when you use the mount utility directly?
> 
