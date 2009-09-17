Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MoJ9d-0002cs-GP
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 15:44:22 +0000
Subject: Re: setup ubifs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dimitar Penev <dpn@ucpbx.com>
In-Reply-To: <009301ca37ab$9b5d2ab0$2901a8c0@dpn>
References: <009301ca37ab$9b5d2ab0$2901a8c0@dpn>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Sep 2009 18:43:18 +0300
Message-Id: <1253202198.3778.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-17 at 18:29 +0300, Dimitar Penev wrote:
> Hi Guys,
> 
> I am tring to setup ubifs on an blackfin based embeded platform containg 
> nand flash.
> jffs2 is working ok on it.
> 
> So I have compiled the uclinux (kernel 2.6.28.10) with ubifs/mtd_ubi static 
> support
> If I pass with the bootargs ubi.mtd=3 , during booting I see
> 
> ...
> UBI: attaching mtd3 to ubi0
> UBI: physical eraseblock size: 262144 bytes (256 KiB)
> UBI: logical eraseblock size: 258048 bytes
> UBI: smallest flash I/O unit: 2048
> UBI: VID header offset: 2048 (aligned 2048)
> UBI: data offset: 4096
> UBI: empty MTD device detected
> UBI: create volume table (copy #1)
> UBI: create volume table (copy #2)
> UBI: attached mtd3 to ubi0
> UBI: MTD device name: "persistent file system"
> UBI: MTD device size: 1004 MiB
> UBI: number of good PEBs: 3974
> UBI: number of bad PEBs: 42
> UBI: max. allowed volumes: 128
> UBI: wear-leveling threshold: 4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes: 0
> UBI: available PEBs: 3931
> UBI: total number of reserved PEBs: 43
> UBI: number of PEBs reserved for bad PEB handling: 39
> UBI: max/mean erase counter: 0/0
> UBI: background thread "ubi_bgt0d" started, PID 122
> ...
> 
> ubinfo gives me
> 
> root@pr1:~> /bin/ubinfo
> UBI version: 1
> Count of UBI devices: 1
> UBI control device major/minor: 10:63
> Present UBI devices: ubi0
> 
> I don't have /dev/ubi0 nor /dev/ubi_ctrl, however I do have some ubi stuff 
> in my /sys file system
> 
> root@pr1:~> ls /sys/class/ubi/ubi0/
> /sys/class/ubi/ubi0/avail_eraseblocks /sys/class/ubi/ubi0/min_io_size
> /sys/class/ubi/ubi0/bad_peb_count /sys/class/ubi/ubi0/mtd_num
> /sys/class/ubi/ubi0/bgt_enabled /sys/class/ubi/ubi0/reserved_for_bad
> /sys/class/ubi/ubi0/dev /sys/class/ubi/ubi0/subsystem/
> /sys/class/ubi/ubi0/eraseblock_size /sys/class/ubi/ubi0/total_eraseblocks
> /sys/class/ubi/ubi0/max_ec /sys/class/ubi/ubi0/uevent
> /sys/class/ubi/ubi0/max_vol_count /sys/class/ubi/ubi0/volumes_count
> 
> root@pr1:~> ls /sys/class/misc/ubi_ctrl/
> /sys/class/misc/ubi_ctrl/dev /sys/class/misc/ubi_ctrl/uevent
> /sys/class/misc/ubi_ctrl/subsystem/
> 
> I don't have /dev/ubi_ctrl so I can not crete (ubimkvol) ubi volume.
> 
> Can you please give me some pointers.

Either make udev work and create device nodes for you automatically,
or create them manually. All the major/minor numbers are available
in sysfs (sedd "dev" files), so you may create corresponding character
device files.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
