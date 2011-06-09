Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUcPs-0004XM-R9
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 10:24:47 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUcPn-00005k-KY
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:24:39 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 12:24:39 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 12:24:39 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Thu, 09 Jun 2011 12:24:22 +0200
Message-ID: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

	I went through the docs/FAQs on the site and elsewhere, and
proceeded to create a Ubifs root filesystem and flash a NAND partition
with it.
However, "ubiattach" fails, so I guess I didn't use the right settings
in mkfs.ubifs and/or ubinize and/or ubiformat for use with that NAND
partition.

Here are the steps I took:
==============
#First, get infos about NAND
appliance:/> mtdinfo /dev/mtd2 -u
mtd2
Name:                           filesystem_nand
Type:                           nand
Eraseblock size:                131072 bytes, 128.0 KiB
Amount of eraseblocks:          1984 (260046848 bytes, 248.0 MiB)
Minimum input/output unit size: 2048 bytes
Sub-page size:                  512 bytes
OOB size:                       64 bytes
Character device major/minor:   90:4
Bad blocks are allowed:         true
Device is writable:             true
Default UBI VID header offset:  512
Default UBI data offset:        2048
Default UBI LEB size:           129024 bytes, 126.0 KiB
Maximum UBI volumes count:      128
==============
#Create root filesystem
ubuntu:/> mkfs.ubifs --squash-uids -m 2048 -e 131072 -c 1984 -d
./romfs -D device_table-min.txt -o ./images/rootfs.ubifs

#ubinize image
ubuntu:/> cat ubi.cfg
[ubifs]
mode=ubi
image=./images/rootfs.ubifs
vol_id=0
vol_size=248MiB
vol_type=dynamic
vol_name=rootfs
vol_flags=autoresize

ubuntu:/> ubinize -o rootfs.ubi.img -m 2048 -p 128KiB -s 512 ./ubi.cfg
==============
appliance:/> ubiformat /dev/mtd2 -s 512 -f rootfs.ubi.img

appliance:/> ubiattach /dev/ubi_ctrl -m 2
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: vtbl_check: too large reserved_pebs 2016, good PEBs 1984
UBI error: vtbl_check: volume table check failed: record 0, error 9
UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22
ubiattach: error!: cannot attach mtd2
           error 22 (Invalid argument)
==============

Any idea what I did wrong?

Thank you.
