Received: from mail-ew0-f221.google.com ([209.85.219.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSIdA-0004Cg-Sg
	for linux-mtd@lists.infradead.org; Tue, 05 Jan 2010 23:16:09 +0000
Received: by ewy21 with SMTP id 21so9326742ewy.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Jan 2010 15:16:03 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 5 Jan 2010 18:16:03 -0500
Message-ID: <dbdb2ea61001051516n4eb50374m809720d68c214cba@mail.gmail.com>
Subject: ubi attach failure
From: twebb <taliaferro62@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I get the error shown below when attempting to attach to an mtd device
on a Marvell PXA-based platform.  The flash is MLC NAND from Samsung
K9LBG08U0D (4G x 8-bit).

I don't know if it's related, but one thing that stands out is that I
only see the error on two platforms whose bad block table has >28
entries (other tested boards have approx. 2-8 bad blocks).

Any suggestion as to what would cause error and whether it may be
related to the high number of bad blocks?


[root@ESIedge mtd-utils]#
[root@ESIedge mtd-utils]# ./ubiattach /dev/ubi_ctrl -m5
[   34.925463] UBI: attaching mtd5 to ubi0
[   34.929305] UBI: physical eraseblock size:   524288 bytes (512 KiB)
[   34.936410] UBI: logical eraseblock size:    516096 bytes
[   34.941882] UBI: smallest flash I/O unit:    4096
[   34.946583] UBI: VID header offset:          4096 (aligned 4096)
[   34.952648] UBI: data offset:                8192
[   45.897062] UBI error: compare_lebs: unsupported on-flash UBI format
[   45.897076]
ubiattach: error!: cannot attach mtd5
           error 22 (Invalid argument)
[root@ESIedge mtd-utils]#


I use the following steps to create the UBI image to put onto /dev/mtd5:

1.  mkfs.ubifs -m 4KiB -e 516096 -c 715 -o sys_ubifs.img -d sys_fs
2.  mkfs.ubifs -m 4KiB -e 516096 -c 715 -o data_ubifs.img -d sys_fs
3.  mkfs.ubifs -m 4KiB -e 516096 -c 715 -o data2_ubifs.img -d sys_fs
4.  mkfs.ubifs -m 4KiB -e 516096 -c 5838 -o storage_ubifs.img -d sys_fs
5.  ubinize -o system_ubi.img -m 4KiB -p 512KiB -s 4KiB system.cfg

system.cfg:

[sys-volume]
mode=ubi
image=sys_ubifs.img
vol_id=0
vol_size=351MiB
vol_type=dynamic
vol_name=system

[data-volume]
mode=ubi
image=data_ubifs.img
vol_id=1
vol_size=351MiB
vol_type=dynamic
vol_name=data

[data2-volume]
mode=ubi
image=data2_ubifs.img
vol_id=2
vol_size=351MiB
vol_type=dynamic
vol_name=data2

[storage-volume]
mode=ubi
image=storage_ubifs.img
vol_id=3
vol_size=2871MiB
vol_type=dynamic
vol_name=storage

The mtd partition is defined by...
{
    .name        = "System",
    .offset      = 0x04000000,
    .size         = 0xfc000000,
}
