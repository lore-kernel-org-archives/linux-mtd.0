Received: from nm12-vm0.bullet.mail.ukl.yahoo.com ([217.146.183.246])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S22N8-00078w-56
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2012 15:20:20 +0000
Message-ID: <4F4B9F2D.80709@yahoo.fr>
Date: Mon, 27 Feb 2012 16:20:13 +0100
From: Patrick <kpa_info@yahoo.fr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Error when mounting ubi image
References: <4F4B6673.7030509@yahoo.fr>
In-Reply-To: <4F4B6673.7030509@yahoo.fr>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/27/2012 12:18 PM, Patrick wrote:
> Dear mailing-list,
>
> I am still facing some trouble with UBI and UBIFS. I am working on an
> OMAP4 processor with a 3.0.21 kernel and a Micron MT29F4G08ABBDAH4 1GB
> NAND Flash.
>
> I generate the ubi image of my rootfs using the following command:
>
> mkfs.ubifs -r my_rootfs -o my_image.ubifs -m 2048 -e 129024 -c 4060
> ubinize -o my_rootfs.ubi -m 2048 -p 128KiB -s 512 ubinize.cfg
>
> And the following ubinize.cfg file:
>
> [ubifs]
> mode=ubi
> image=my_image.ubifs
> vol_id=0
> vol_type=static
> vol_name=my_rootfs
>
> Then I flash this image and mount it with the following commands:
>
> ubiformat /dev/mtd4 -f my_rootfs.ubi
> ubiattach -p /dev/mtd4
> mount -t ubifs ubi0_0 /media/test/
>
> I then have the following error:
>
> mount: block device ubi0_0 is write-protected, mounting read-only
>
> And from the kernel (dmesg):
>
> UBI warning: ubi_eba_read_leb: CRC error: calculated 0x34afeca5, must be
> 0x74215933
> UBI warning: ubi_open_volume: volume 0 on UBI device 0 is corrupted
> UBIFS warning (pid 226): init_constants_early: UBI volume is corrupted -
> read-only mode
> UBIFS: static UBI volume - read-only mode
> UBIFS error (pid 226): mount_ubifs: cannot mount read-write - read-only
> media
> UBIFS warning (pid 226): init_constants_early: UBI volume is corrupted -
> read-only mode
> UBIFS: static UBI volume - read-only mode
> UBIFS: mounted UBI device 0, volume 0, name "my_rootfs"
> UBIFS: mounted read-only
> UBIFS: file system size: 42190848 bytes (41202 KiB, 40 MiB, 327 LEBs)
> UBIFS: journal size: 9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
> UBIFS: media format: w4/r0 (latest is w4/r0)
> UBIFS: default compressor: lzo
> UBIFS: reserved for root: 0 bytes (0 KiB)
>
> I couldn't find what I am doing wrong. Any help will be really
> appreciated !
>
> Thanks in advance
>
> Patrick
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

I reply myself to add some informations:

I have tried to add the following flags to the ubinize.cfg:

   vol_type=dynamic
   vol_flags=autoresize

With those flags I could mount the image successfully. But when I detach 
the volume an reattach it I have some ECC errors:

   ubiattach -p /dev/mtd4
   UBI device number 0, total 4057 LEBs (523450368 bytes, 499.2 MiB),
   available 3371 LEBs (434939904 bytes, 414.8 MiB), LEB size 129024
   bytes (126.0 KiB)

   mount -t ubifs ubi0_0 /media/card/
   ls /media/card
   ...
   umount /media/card
   ubidetach -p /dev/mtd4

   ubiattach -p /dev/mtd4

I have the following error message in the kernel debug and then it start 
an infinite error loop.

UBI: attaching mtd4 to ubi0
UBI: physical eraseblock size:   131072 bytes (128 KiB)
UBI: logical eraseblock size:    129024 bytes
UBI: smallest flash I/O unit:    2048
UBI: sub-page size:              512
UBI: VID header offset:          512 (aligned 512)
UBI: data offset:                2048
UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes 
from PEB 605:0, read 64 bytes
UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes 
from PEB 605:512, read 512 bytes
UBI warning: process_eb: valid VID header but corrupted EC header at PEB 605
UBI: max. sequence number:       2
UBI: attached mtd4 to ubi0
UBI: MTD device name:            "root"
UBI: MTD device size:            507 MiB
UBI: number of good PEBs:        4057
UBI: number of bad PEBs:         3
UBI: number of corrupted PEBs:   0
UBI: max. allowed volumes:       128
UBI: wear-leveling threshold:    4096
UBI: number of internal volumes: 1
UBI: number of user volumes:     1
UBI: available PEBs:             3371
UBI: total number of reserved PEBs: 686
UBI: number of PEBs reserved for bad PEB handling: 80
UBI: max/mean erase counter: 4/2
UBI: image sequence number:  218161718

Again any help would be really appreciated.

Patrick
