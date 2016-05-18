Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2ytG-0005kp-M1
 for linux-mtd@lists.infradead.org; Wed, 18 May 2016 10:39:48 +0000
Received: by mail-lf0-x232.google.com with SMTP id j8so18150770lfd.2
 for <linux-mtd@lists.infradead.org>; Wed, 18 May 2016 03:39:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <573C4033.6010906@nod.at>
References: <CABatt_xjhTpaUitXP_az+cOFEVA=eUedayFggrrH=Z7ZdBWUYg@mail.gmail.com>
 <CAFLxGvx9bnh6z1hkMXzdvynBOdDca6HJziEKG5pH95e+Ttaa8Q@mail.gmail.com>
 <CABatt_wMSQd7Tc=gP0rO53UghqjdaTonFFj4R_qu8zFJyfyz3A@mail.gmail.com>
 <573C4033.6010906@nod.at>
Date: Wed, 18 May 2016 11:39:12 +0100
Message-ID: <CABatt_wF4Vb0R=xiQapY4Q1ieBJ7Sjcvg3XXsE6QxWrACwchgw@mail.gmail.com>
Subject: Re: UBIFS assert when rebooting a read only ubifs when it's been
 remounted r/w
From: Martin Townsend <mtownsend1973@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 18, 2016 at 11:13 AM, Richard Weinberger <richard@nod.at> wrote:
> Am 18.05.2016 um 11:24 schrieb Martin Townsend:
>> A bit info:
>> I booted the board over the network using TFTP/NFS and then mounting
>> the UBIFS partition using
>> ubiattach /dev/ubi_ctrl -m 12 -O 2048
>> mount -o ro -t ubifs /dev/ubi0_0 /mnt/ubifs/
>> but this never triggered the assert. So I thought maybe it was
>> something to do with U-Boot mounting the rootfs to load the kernel and
>> device tree which are in the UBIFS so I loaded the kernel and device
>> tree from a TFTP server and then booted from NAND but this still
>> triggered the assert so this kind of rules out U-Boot.
>
> So, you can trigger without U-Boot touching the UBIFS?
> Also no UBI attach happens in U-Boot?
>
> Is the assert you're facing really the top most error?
> Another question, goes the error way when you call "sync"
> before remounting ro?
>
> Thanks,
> //richard

Here are the U-Boot commands I ran
setenv autoload no; dhcp; tftp ${loadaddr} ${bootfile}; tftp
${fdtaddr} ${fdtfile};
run nandargs -> This just sets the bootargs variable
bootz ${loadaddr} - ${fdtaddr}
I don't think any of these will trigger any UBI related functions, so
yes to the first 2 questions.

There are 3 errors before the UBIFS one and they are all OMAP related
and have always been there.  I've included some more of the log which
has some more UBI info that might be of interest as it states that a
recovery was needed but deferred.

I can't do the sync as the error only occurs during boot and I can see
the assert whilst systemd is rmounting all the filesystems. Once I've
logged in I can't get the assert to trigger again.  Just to summarise
the conditions for triggering the assert
To trigger I login and remount / as rw and then reboot (to a ro
rootfs) and the assert first during the boot.
The assert will appear on all subsequent boots (Providing I don't do
the following)
To get rid of the assert I can, once logged in, remount / rw and then
ro and then reboot.

Here's that log output:
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: nand: device
found, Manufacturer ID: 0x2c, Chip ID: 0xdc
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: nand: Micron
MT29F4G08ABADAWP
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: nand: 512 MiB,
SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: nand: using
OMAP_ECC_BCH8_CODE_HW ECC scheme
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: 14 ofpart
partitions found on MTD device 8000000.nand
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: Creating 14 MTD
partitions on "8000000.nand":
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000000000-0x000000020000 : "NAND.SPL"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000020000-0x000000040000 : "NAND.SPL.backup1"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000040000-0x000000060000 : "NAND.SPL.backup2"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000060000-0x000000080000 : "NAND.SPL.backup3"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000080000-0x0000000a0000 : "NAND.dtb"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x0000000a0000-0x0000000c0000 : "NAND.dtb.backup1"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x0000000c0000-0x0000000e0000 : "NAND.dtb.backup2"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x0000000e0000-0x000000100000 : "NAND.dtb.backup3"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000100000-0x000000180000 : "NAND.u-boot"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmc0: host does
not support reading read-only switch, assuming write-enable
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000180000-0x000000200000 : "NAND.u-boot.backup1"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000200000-0x000000240000 : "NAND.u-boot-env"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000240000-0x000000280000 : "NAND.u-boot-env.backup1"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x000000280000-0x00001ff80000 : "NAND.rootfs"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmc0: new high
speed SDHC card at address e624
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmcblk0:
mmc0:e624 SU08G 7.40 GiB
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:  mmcblk0: p1 p2
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmc1:
MAN_BKOPS_EN bit is not set
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmc1: new high
speed MMC card at address 0001
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmcblk1:
mmc1:0001 8GND3R 7.28 GiB
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmcblk1boot0:
mmc1:0001 8GND3R partition 1 4.00 MiB
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mmcblk1boot1:
mmc1:0001 8GND3R partition 2 4.00 MiB
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:  mmcblk1: p1 p2
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
0x00001ff80000-0x000020000000 : "NAND.mtdoops"
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mtdoops: ready
0, 1 (no erase)
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: mtdoops:
Attached to MTD device 13
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: omap_i2c
44e0b000.i2c: bus 0 rev0.12 at 100 kHz
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: rtc-isl12057
1-0068: rtc core: registered rtc-isl12057 as rtc0
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: at24 1-0050:
8192 byte 24c64 EEPROM, writable, 1 bytes/write
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: omap_i2c
4802a000.i2c: bus 1 rev0.12 at 100 kHz
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: wkup_m3_ipc
44e11324.wkup_m3_ipc: wkup_m3_ipc probe success
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: attaching mtd12
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: scanning is finished
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: attached
mtd12 (name "NAND.rootfs", size 509 MiB)
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: PEB size:
131072 bytes (128 KiB), LEB size: 126976 bytes
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: min./max.
I/O unit sizes: 2048/2048, sub-page size 512
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: VID header
offset: 2048 (aligned 2048), data offset: 4096
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: good PEBs:
4070, bad PEBs: 2, corrupted PEBs: 0
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: user
volume: 1, internal volumes: 1, max. volumes count: 128
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: max/mean
erase counter: 1/0, WL threshold: 4096, image sequence number:
1528335448
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: available
PEBs: 0, total reserved PEBs: 4070, PEBs reserved for bad PEB
handling: 78
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: ubi0: background
thread "ubi_bgt0d" started, PID 76
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: rtc-isl12057
1-0068: setting system clock to 2016-05-18 10:20:55 UTC (1463566855)
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel:
touch_3v3_regulator: disabling
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: vmmcwl_fixed: disabling
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS (ubi0:0):
recovery needed
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS (ubi0:0):
recovery deferred
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS (ubi0:0):
UBIFS: mounted UBI device 0, volume 0, name "rootfs", R/O mode
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS (ubi0:0):
LEB size: 126976 bytes (124 KiB), min./max. I/O unit sizes: 2048
bytes/2048 bytes
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS (ubi0:0):
FS size: 504983552 bytes (481 MiB, 3977 LEBs), journal size 9023488
bytes (8 MiB, 72 LEBs)
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS (ubi0:0):
reserved for root: 0 bytes (0 KiB)
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS (ubi0:0):
media format: w4/r0 (latest is w4/r0), UUID
05AF8668-C412-4672-AD8F-574C29776A53, small LPT model
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: VFS: Mounted
root (ubifs filesystem) readonly on device 0:15.
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: devtmpfs: mounted
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: Freeing unused
kernel memory: 340K (c081d000 - c0872000)
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: NET: Registered
protocol family 10
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: random: systemd
urandom read with 4 bits of entropy available
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: systemd 225
running in system mode. (+PAM -AUDIT -SELINUX +IMA -APPARMOR +SMACK
+SYSVINIT +UTMP -LIBCRYPTSETUP -GCRYPT +GNUTLS +ACL +XZ -LZ4 -SECCOMP
+BLKID -ELFUTILS +KMOD -IDN)
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Detected
architecture arm.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Set hostname
to <am43-controller-aquila-1bf6b1>.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Initializing
machine ID from random generator.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Installed
transient /etc/machine-id file.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Reached
target Remote File Systems.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Reached target Swap.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Started
Forward Password Requests to Wall Directory Watch.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Created
slice Root Slice.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Listening on
Journal Socket (/dev/log).
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Listening on
/dev/initctl Compatibility Named Pipe.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Listening on
udev Kernel Socket.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Listening on
Syslog Socket.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Listening on
Journal Socket.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Listening on
udev Control Socket.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Created
slice User and Session Slice.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Created
slice System Slice.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Mounting
Debug File System...
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Starting
Create list of required static device nodes for the current kernel...
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Created
slice system-busybox\x2difplugd.slice.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Mounting
Temporary Directory...
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Mounting
POSIX Message Queue File System...
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Reached target Slices.
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Starting
Remount Root and Kernel File Systems...
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Starting
Apply Kernel Variables...
May 18 10:20:56 am43-controller-aquila-1bf6b1 systemd[1]: Mounting
Configuration File System...
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: UBIFS assert
failed in ubifs_remount_fs at 1869 (pid 97)
May 18 10:20:56 am43-controller-aquila-1bf6b1 kernel: CPU: 0 PID: 97
Comm: mount Not tainted 4.1.18-g6b41ca0b94 #1
....
