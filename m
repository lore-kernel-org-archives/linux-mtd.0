Received: from [61.155.106.76] (helo=www.mid-fun.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1ML6OK-0006HN-N2
	for linux-mtd@lists.infradead.org; Mon, 29 Jun 2009 02:14:51 +0000
Subject: Re: about ubiformat mtdblock
From: tommy <jiujin.hong@mid-fun.com>
To: dedekind@infradead.org
In-Reply-To: <1246102372.9487.80.camel@localhost.localdomain>
References: <1246010592.12367.0.camel@tommy-desktop>
	<1246013172.9487.66.camel@localhost.localdomain>
	<1246074583.4250.4.camel@tommy-desktop>
	<1246102372.9487.80.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jun 2009 10:14:37 +0800
Message-Id: <1246241677.7834.5.camel@tommy-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


HI,Dear sir !

i have a question!

I have patched your 2.6.24-ubifs-git on my ARM11 platform !

it have succeed run and stable !

My rootfs have a /etc/fstab file !

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

if  i enable "rootfs   /  auto  defaults 1 1 ",when kernel
booting ,ubifs driver will say "UBIFS error (pid 628): ubifs_get_sb:
cannot open "rootfs", error -22"!

if i disable "#rootfs / auto deafults 1 1 ",when kernel booting ,ubifs
driver never say error ,
can you explain it ?

because my old ubifs patched driver never say any error even if  it is
enable  !
 

On 六, 2009-06-27 at 14:32 +0300, Artem Bityutskiy wrote:
> On Sat, 2009-06-27 at 11:49 +0800, tommy wrote:
> > HI,dear sir !
> > 
> > i have pathed my 2.6.24 BSP with ubifs-2.6.24-git!
> > 
> > It work ok ,but when kernel booting  ,it also say error:
> > 0x00000000-0x00040000 : "Bootloader"
> > 0x00040000-0x00840000 : "Kernel"
> > 0x00840000-0x13440000 : "Rootfs"
> > 0x13440000-0x40000000 : "data"
> > UBI: attaching mtd2 to ubi0
> > UBI: physical eraseblock size:   262144 bytes (256 KiB)
> > UBI: logical eraseblock size:    258048 bytes
> > UBI: smallest flash I/O unit:    2048
> > UBI: VID header offset:          2048 (aligned 2048)
> > UBI: data offset:                4096
> > UBI: attached mtd2 to ubi0
> > UBI: MTD device name:            "Rootfs"
> > UBI: MTD device size:            300 MiB
> > UBI: number of good PEBs:        1200
> > UBI: number of bad PEBs:         0
> > UBI: max. allowed volumes:       128
> > UBI: wear-leveling threshold:    4096
> > UBI: number of internal volumes: 1
> > UBI: number of user volumes:     1
> > UBI: available PEBs:             5
> > UBI: total number of reserved PEBs: 1195
> > UBI: number of PEBs reserved for bad PEB handling: 12
> > 
> > UBIFS: mounted UBI device 0, volume 0, name "rootfs"
> > UBIFS: file system size:   301916160 bytes (294840 KiB, 287 MiB, 1170
> > LEBs)
> > UBIFS: journal size:       14966784 bytes (14616 KiB, 14 MiB, 58 LEBs)
> > UBIFS: media format:       w4/r0 (latest is w4/r0)
> > UBIFS: default compressor: lzo
> > UBIFS: reserved for root:  4952683 bytes (4836 KiB)
> > VFS: Mounted root (ubifs filesystem).
> > 
> > UBIFS error (pid 628): ubifs_get_sb: cannot open "rootfs", error -22
> > 
> > when it mount ok,also say error "cannot open 'rootfs' ",sir ?
> 
> -22 is -EINVAL, not sure what happened. Try to send a better bug report,
> see here:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
> 
