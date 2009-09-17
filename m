Received: from mail-yw0-f189.google.com ([209.85.211.189])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MoK7E-0005MK-5Z
	for linux-mtd@lists.infradead.org; Thu, 17 Sep 2009 16:45:58 +0000
Received: by ywh27 with SMTP id 27so375615ywh.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Sep 2009 09:45:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1253202198.3778.19.camel@localhost>
References: <009301ca37ab$9b5d2ab0$2901a8c0@dpn>
	<1253202198.3778.19.camel@localhost>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 17 Sep 2009 12:45:29 -0400
Message-ID: <8bd0f97a0909170945u7af8dc81ga64e13d4707ceada@mail.gmail.com>
Subject: Re: setup ubifs
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Dimitar Penev <dpn@ucpbx.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 17, 2009 at 11:43, Artem Bityutskiy wrote:
> On Thu, 2009-09-17 at 18:29 +0300, Dimitar Penev wrote:
>> Hi Guys,
>>
>> I am tring to setup ubifs on an blackfin based embeded platform containg
>> nand flash.
>> jffs2 is working ok on it.
>>
>> So I have compiled the uclinux (kernel 2.6.28.10) with ubifs/mtd_ubi static
>> support
>> If I pass with the bootargs ubi.mtd=3 , during booting I see
>>
>> ...
>> UBI: attaching mtd3 to ubi0
>> UBI: physical eraseblock size: 262144 bytes (256 KiB)
>> UBI: logical eraseblock size: 258048 bytes
>> UBI: smallest flash I/O unit: 2048
>> UBI: VID header offset: 2048 (aligned 2048)
>> UBI: data offset: 4096
>> UBI: empty MTD device detected
>> UBI: create volume table (copy #1)
>> UBI: create volume table (copy #2)
>> UBI: attached mtd3 to ubi0
>> UBI: MTD device name: "persistent file system"
>> UBI: MTD device size: 1004 MiB
>> UBI: number of good PEBs: 3974
>> UBI: number of bad PEBs: 42
>> UBI: max. allowed volumes: 128
>> UBI: wear-leveling threshold: 4096
>> UBI: number of internal volumes: 1
>> UBI: number of user volumes: 0
>> UBI: available PEBs: 3931
>> UBI: total number of reserved PEBs: 43
>> UBI: number of PEBs reserved for bad PEB handling: 39
>> UBI: max/mean erase counter: 0/0
>> UBI: background thread "ubi_bgt0d" started, PID 122
>> ...
>>
>> ubinfo gives me
>>
>> root@pr1:~> /bin/ubinfo
>> UBI version: 1
>> Count of UBI devices: 1
>> UBI control device major/minor: 10:63
>> Present UBI devices: ubi0
>>
>> I don't have /dev/ubi0 nor /dev/ubi_ctrl, however I do have some ubi stuff
>> in my /sys file system
>>
>> root@pr1:~> ls /sys/class/ubi/ubi0/
>> /sys/class/ubi/ubi0/avail_eraseblocks /sys/class/ubi/ubi0/min_io_size
>> /sys/class/ubi/ubi0/bad_peb_count /sys/class/ubi/ubi0/mtd_num
>> /sys/class/ubi/ubi0/bgt_enabled /sys/class/ubi/ubi0/reserved_for_bad
>> /sys/class/ubi/ubi0/dev /sys/class/ubi/ubi0/subsystem/
>> /sys/class/ubi/ubi0/eraseblock_size /sys/class/ubi/ubi0/total_eraseblocks
>> /sys/class/ubi/ubi0/max_ec /sys/class/ubi/ubi0/uevent
>> /sys/class/ubi/ubi0/max_vol_count /sys/class/ubi/ubi0/volumes_count
>>
>> root@pr1:~> ls /sys/class/misc/ubi_ctrl/
>> /sys/class/misc/ubi_ctrl/dev /sys/class/misc/ubi_ctrl/uevent
>> /sys/class/misc/ubi_ctrl/subsystem/
>>
>> I don't have /dev/ubi_ctrl so I can not crete (ubimkvol) ubi volume.
>>
>> Can you please give me some pointers.
>
> Either make udev work and create device nodes for you automatically,
> or create them manually. All the major/minor numbers are available
> in sysfs (sedd "dev" files), so you may create corresponding character
> device files.

udev isnt going to happen.  if the stuff is available via sysfs, then
`mdev -s` should work.
-mike
