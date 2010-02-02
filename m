Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NcLv1-000289-7P
	for linux-mtd@lists.infradead.org; Tue, 02 Feb 2010 16:48:07 +0000
Subject: Re: UBIFS bad superblock error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: dballman <pnetrisk@gmail.com>
In-Reply-To: <30e5226d1001200051o5cd62e18p7020e6bc8a734032@mail.gmail.com>
References: <30e5226d1001200051o5cd62e18p7020e6bc8a734032@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Feb 2010 18:46:05 +0200
Message-ID: <1265129165.2790.9.camel@localhost>
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

On Wed, 2010-01-20 at 09:51 +0100, dballman wrote:
> Hello,
> 
> By generating a busybox image with these commands:
> 
> mkfs.ubifs -U -x favor_lzo -m 1 -e 130944 -c 100 -r _install/ -o
> busybox-ubifs.img
> ubinize -o busybox-ubiimg.bin -p 128KiB -m 1 ubinize.ini
> 
> ubinize.ini content:
> 
> [rootfs-volume]
> mode=ubi
> image=busybox-ubifs.img
> vol_id=0
> vol_size=50MiB
> vol_type=dynamic
> vol_name=rootfs
> vol_alignment=1
> vol_flags=autoresize
> 
> Then I put the .bin file on the address for the second mtd partition
> on a custom made board with NOR flash and it gives the following
> error:
> (Only relevant information is shown)

Strange. I have just tried to reproduce this on mtdram and cannot.

May be endiannes issues? Is your target platform big-endian?

If you take a look at the 'validate_sb()', you'll see it dumps the
superblock. I'd like to see this dump. You can find instructions here:

http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport


Here is what I did to test:

[dedekind@eru tmp]$ pwd                                     
/home/dedekind/tmp                                          

[dedekind@eru tmp]$ ls                                      
_install  ubinize.ini                                       

[dedekind@eru tmp]$ ls _install/
bin                             
[dedekind@eru tmp]$ mkfs.ubifs -U -x favor_lzo -m 1 -e 130944 -c 100 -r _install/ -obusybox-ubifs.img

[dedekind@eru tmp]$ ubinize -o busybox-ubiimg.bin -p 128KiB -m 1 ubinize.ini

[dedekind@eru tmp]$ sudo modprobe mtdram total_size=65536

[dedekind@eru tmp]$ sudo dd if=busybox-ubiimg.bin of=/dev/mtd0
7680+0 records in
7680+0 records out
3932160 bytes (3.9 MB) copied, 0.0120106 s, 327 MB/s

[dedekind@eru tmp]$ sudo modprobe ubi mtd=0

[dedekind@eru tmp]$ cat /proc/mtd
dev:    size   erasesize  name
mtd0: 04000000 00020000 "mtdram test device"
[dedekind@eru tmp]$ ubinfo -a
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:59
Present UBI devices:            ubi0

ubi0:
Volumes count:                           1
Logical eraseblock size:                 130944
Total amount of logical eraseblocks:     512 (67043328 bytes, 63.9 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  0
Current maximum erase counter value:     1
Minimum input/output unit size:          1 bytes
Character device major/minor:            251:0
Present volumes:                         0

Volume ID:   0 (on ubi0)
Type:        dynamic
Alignment:   1
Size:        508 LEBs (66519552 bytes, 63.4 MiB)
State:       OK
Name:        rootfs
Character device major/minor: 251:1

[dedekind@eru tmp]$ sudo mount -t ubifs ubi0:rootfs /mnt/ubifs/

[dedekind@eru tmp]$ df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda1             51403396   1629960  47162236   4% /
tmpfs                  8132484       160   8132324   1% /dev/shm
/dev/sda5             73560060  38458804  31364540  56% /home
ubi0:rootfs               9952      1836      8116  19% /mnt/ubifs

[dedekind@eru tmp]$ ls /mnt/ubifs/
bin

[dedekind@eru tmp]$

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
