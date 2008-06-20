Date: Fri, 20 Jun 2008 10:07:15 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Eirik Aanonsen" <eaa@wprmedical.com>
Subject: Re: ubifs and losetup
Message-ID: <20080620100715.3950ad73@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <6B5648EA2E2C2D42AF2FF7691522AD92417B68@wpr01.wprmedical.local>
References: <6B5648EA2E2C2D42AF2FF7691522AD92417B68@wpr01.wprmedical.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel@avr32linux.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Cc'ing linux-mtd and Artem]

"Eirik Aanonsen" <eaa@wprmedical.com> wrote:
> 
> Hi.
> 
> I an trying to make a file backed image that reside on a NAND flash
> running 2.6.25.6.atmel.1 and BusyBox v1.10.1

The 2.6.25.6.atmel.1 kernel is based on v2.6.25.6 and includes the
ubifs-v2.6.25 tree:

    Merge branch 'master' of git://git.infradead.org/users/dedekind/ubifs-v2.6.25

> I intend to use a image residing on the flash for swapping access
> between the Linux and the usb. Thus using vfat and loop device.
> 
> For mounting and setup in linux I have used losetup up until now.
> 
> 
> This works with no problem:
> 
> dd bs=1M count=5 if=/dev/zero of=/tmp/usb
> fdisk -S 8 -H 16 -C 80 /tmp/usb < fd.in
> ( fd in contains the settings for creating the setup see below signature
> )
> losetup -o 4096 /dev/loop0 /tmp/usb 
> 
> 
> This does not work (/media/ is ubifs):
> 
> dd bs=1M count=5 if=/dev/zero of=/media/usb
> fdisk -S 8 -H 16 -C 80 /media/usb < fd.in
> ( fd in contains the settings for creating the setup see below signature
> )
> losetup -o 4096 /dev/loop0 /media/usb
> 
> ~ # losetup -o 4096 /dev/loop0 /media/usb
> losetup: /dev/loop0: Invalid argument

Looks like UBIFS doesn't support loopback devices. Is that right?

> More procedure info below.

(keeping it for the MTD people)

Haavard

> ____________________________________________________
>  
> Eirik Aanonsen
> SW Developer
> E-mail: eaa@wprmedical.com 
> Phone: +47 90 68 11 92
> Fax: +47 37 03 56 77
> ____________________________________________________
> 
> Content of fd.in
> n
> p
> 1
> 1
> 80
> t
> b
> w
> 
> 
> Commands used for setting up ubifs and mounting the new filesystem:
> ~ # ubiformat /dev/mtd5
> ubiformat: error!: please, first detach mtd5 (/dev/mtd5) from ubi0
> ~ # rmmod ubi
> ~ # ubiformat /dev/mtd5
> ubiformat: mtd5 (NAND), size 2147483648 bytes (2.0 GiB), 524288
> eraseblocks of 524288 bytes (512.0 KiB), min. I/O size 4096 bytes
> libscan: scanning eraseblock 4095 -- 100 % complete
> ubiformat: 4092 eraseblocks have valid erase counter, mean value is 2
> ubiformat: bad eraseblocks: 802, 2340, 2360, 2364
> ubiformat: formatting eraseblock 4095 -- 100 % complete
> ~ # modprobe ubi mtd=5
> ~ # ubimkvol /dev/ubi0 -N wpr_data -s 10MiB
> Volume ID 0, size 21 LEBs (10838016 bytes, 10.3 MiB), LEB size 516096
> bytes (504.0 KiB), dynamic, name "wpr_data", alignment 1 
> ~ # modprobe ubifs
> ~ # mount -t ubifs ubi0:wpr_data /media
> 
> 
> Dmesg:
> UBI: attaching mtd5 to ubi0
> UBI: physical eraseblock size:   524288 bytes (512 KiB)
> UBI: logical eraseblock size:    516096 bytes
> UBI: smallest flash I/O unit:    4096
> UBI: VID header offset:          4096 (aligned 4096)
> UBI: data offset:                8192
> UBI: attached mtd5 to ubi0
> UBI: MTD device name:            "main"
> UBI: MTD device size:            2048 MiB
> UBI: number of good PEBs:        4092
> UBI: number of bad PEBs:         4
> UBI: max. allowed volumes:       128
> UBI: wear-leveling threshold:    4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes:     0
> UBI: available PEBs:             4048
> UBI: total number of reserved PEBs: 44
> UBI: number of PEBs reserved for bad PEB handling: 40
> UBI: max/mean erase counter: 9/3
> UBI: background thread "ubi_bgt0d" started, PID 379
> UBIFS: default file-system created
> UBIFS: background thread "ubifs_bgt0_0" started, PID 392
> UBIFS: mounted UBI device 0, volume 0
> UBIFS: minimal I/O unit size:   4096 bytes
> UBIFS: logical eraseblock size: 516096 bytes (504 KiB)
> UBIFS: file system size:        6193152 bytes (6048 KiB, 5 MiB, 12 LEBs)
> UBIFS: journal size:            4128769 bytes (4032 KiB, 3 MiB, 5 LEBs)
> UBIFS: data journal heads:      1
> UBIFS: default compressor:      LZO
> UBIFS: media format 4, latest format 4
> _______________________________________________
> Kernel mailing list
> Kernel@avr32linux.org
> http://duppen.flaskehals.net/cgi-bin/mailman/listinfo/kernel
