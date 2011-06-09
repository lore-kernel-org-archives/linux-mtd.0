Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUh0X-0000Gw-7v
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 15:18:55 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUh0U-0004o2-4T
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 17:18:50 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 17:18:50 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 17:18:50 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Thu, 09 Jun 2011 17:18:35 +0200
Message-ID: <mkn1v6d8n8i3pnsg89gppnv69ht102hj0c@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
	<1307623105.7374.91.camel@localhost>
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

On Thu, 09 Jun 2011 15:38:25 +0300, Artem Bityutskiy
<dedekind1@gmail.com> wrote:
>On Thu, 2011-06-09 at 12:24 +0200, Gilles wrote:
>> vol_size=248MiB
>
>Put, say, 230MiB here. 248MiB is the total amount of space. UBI adds
>some overhead, so your volume size will be smaller, see here:

After updating ubi.cfg with "vol_size=230MiB" and re-running "ubinize
-o rootfs.ubi.img -m 2048 -p 128KiB -s 512 ./ubi.cfg", I reformateed
the appliance and tried to attach mtd2 to Ubi... and it worked! :-)

===============
appliance:> ubiformat /dev/mtd2 -s 512 -f rootfs.ubi.img

appliance:> ubiattach /dev/ubi_ctrl -m 2
UBI: attaching mtd2 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI: volume 0 ("rootfs") re-sized from 1870 to 1961 LEBs
UBI: attached mtd2 to ubi0
UBI: MTD device name:            "filesystem_nand"
UBI: MTD device size:            248 MiB
UBI: number of good PEBs:        1984
UBI: number of bad PEBs:         0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             0
UBI: total number of reserved PEBs: 1984
UBI: number of PEBs reserved for bad PEB handling: 19
UBI: max/mean erase counter: 14/9
UBI: image sequence number: 1879706523
mtd: Giving out device 3 to rootfs
UBI: background thread "ubi_bgt0d" started, PID 136
UBI device number 0, total 1984 LEBs (255983616 bytes, 244.1 MiB),
available 0 LEBs (0 bytes), LEB size 129024 bytes (126.0 KiB)
===============

So apparently, I lost about 4MiB in the process (248MiB -> 244.1).

I'll take advantage of this thread to ask a few questions that I have
after reading the docs + experimenting:

1. After running "ubiattach", I get a new mtd3 partition that is
linked to mtd2:

appliance> cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00800000 00001000 "ROMfs"
mtd1: 00800000 00020000 "kernel_nand"
mtd2: 0f800000 00020000 "filesystem_nand"
mtd3: 0f14b800 0001f800 "rootfs"

To reboot and use the NAND partition as root filesystem, am I correct
that I should forget about mtd2, and use this kernel command line:

"ubi.mtd=3 rootfstype=ubifs root=ubi0:rootfs rw"

?

2. ubiformat takes about 10-15mn to complete: Is there a way to speed
things up, or is it just due to the CPU+NAND that the appliance uses?

3. Finally, when do I have to use ubimkvol?

Thank you.
