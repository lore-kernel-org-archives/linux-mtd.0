Received: from nf-out-0910.google.com ([64.233.182.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOCPJ-0007r4-D6
	for linux-mtd@lists.infradead.org; Mon, 05 Mar 2007 07:35:28 -0500
Received: by nf-out-0910.google.com with SMTP id a4so2123044nfc
	for <linux-mtd@lists.infradead.org>;
	Mon, 05 Mar 2007 04:35:12 -0800 (PST)
Message-ID: <621e5b170703050428v398f6650ld013b44c4f7dd036@mail.gmail.com>
Date: Mon, 5 Mar 2007 17:58:22 +0530
From: "RadhaKumar Pulyala" <radhakumar@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: jffs2_scan_eraseblock Magic bitmask not found error
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_26543_9415235.1173097702325"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_26543_9415235.1173097702325
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

 I am not able to mount my JFFS2 file system. I am getting "Magic bitmask
not found" errors.

I am able to successful detect the flash chip as:

phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank

 Amd/Fujitsu Extended Query Table at 0x0040

 My JFFS2 FS image is of the same size as the MTD partitions (padded till
the full size)

   - I could see that both *flash_eraseall =96j *and the *mkfs.jffs2* keep
   clean markers at same location but the jffs2_scan_eraseblock API looks f=
or
   the magic bitmask (0x1985) at a different location, resulting in that er=
rors
   shown below.

jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x000c in

stead



If I try to mount a clean partition (not even with clean markers), mount
will be successful just once. And creates the clean markers just similar to
flash_eraseall =96j. If I umount and mount it again, I get that bitmask
errors.



I used the default map driver (simple_map_read, simple_map_write apis) as
well as my own map driver that differs from the default one by changing the
flash chip's mode to program mode in write explicitly. Both gave me same
results.

Complete log as follows:

Starting Linux kernel...

Linux version 2.6.11.12 (kumarpr@localhost.localdomain) (gcc version 4.0.3)
#23

Mon Mar 5 11:30:34 IST 2007

CPU: Some Random V6 Processor [410fb763] revision 3 (ARMv6TEJ)

CPU0: D VIPT write-back cache

CPU0: I cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets

CPU0: D cache: 16384 bytes, associativity 4, 32 byte lines, 128 sets

Machine: Conexant Presidio IRD

Memory policy: ECC disabled, Data cache writeback

BUG: mapping for 0x0f800000 at 0x4f800000 overlaps vmalloc space

Built 1 zonelists

Kernel command line: console=3DttyRI0 root=3D/dev/ram mem=3D64M

PID hash table entries: 512 (order: 9, 8192 bytes)

Dentry cache hash table entries: 16384 (order: 4, 65536 bytes)

Inode-cache hash table entries: 8192 (order: 3, 32768 bytes)

Memory: 64MB =3D 64MB total

Memory: 53264KB available (2638K code, 535K data, 84K init)

Mount-cache hash table entries: 512 (order: 0, 4096 bytes)

CPU: Testing write buffer coherency: ok

checking if image is initramfs...it isn't (bad gzip magic numbers); looks
like a

n initrd

Freeing initrd memory: 8192K

NET: Registered protocol family 16

SCSI subsystem initialized

usbcore: registered new driver usbfs

usbcore: registered new driver hub

Checking V6 block cache operations:

           Prefetch data range: supported

   Clean+Invalidate data range: supported

              Clean data range: supported

         Invalidate data range: supported

        Invalidate instr range: supported

 --> Using harvard block cache invalidate

 --> Using block cache clean

 --> Using block cache clean+invalidate

NetWinder Floating Point Emulator V0.97 (double precision)

audit: initializing netlink socket (disabled)

audit(0.450:0): initialized

NTFS driver 2.1.22 [Flags: R/O].

JFFS version 1.0, (C) 1999, 2000  Axis Communications AB

JFFS2 version 2.2. (C) 2001-2003 Red Hat, Inc.

JFFS2: default compression mode: priority

SGI XFS with no debug enabled

ttyRI0 at MMIO 0xe0412000 (irq =3D 2) is a CNXTUART

ttyRI1 at MMIO 0xe0411000 (irq =3D 1) is a CNXTUART

ttyRI2 at MMIO 0xe0410000 (irq =3D 0) is a CNXTUART

io scheduler noop registered

io scheduler anticipatory registered

io scheduler deadline registered

io scheduler cfq registered

RAMDISK driver initialized: 1 RAM disks of 32768K size 1024 blocksize

Inside emacdev_load function

Inside emacdev_init function

EMAC 0 Initialized

physmap flash device: 1000000 at f0000000

phys_mapped_flash: Found 1 x16 devices at 0x0 in 16-bit bank

 Amd/Fujitsu Extended Query Table at 0x0040

Using buffer write method

phys_mapped_flash: CFI does not contain boot bank location. Assuming top.

number of CFI chips: 1

cfi_cmdset_0002: Disabling erase-suspend-program due to code brokenness.

cmdlinepart partition parsing not available

RedBoot partition parsing not available

Using physmap partition definition

Creating 3 MTD partitions on "phys_mapped_flash":

0x00000000-0x00040000 : "codeldr"

mtd: Giving out device 0 to codeldr

0x00200000-0x00600000 : "tlv_vmlinuz"

mtd: Giving out device 1 to tlv_vmlinuz

0x00600000-0x00a00000 : "jffs2_root"

mtd: Giving out device 2 to jffs2_root

3 value at 0xe0440150

pecos-ehci usb00: Pecos USB 2.0

pecos-ehci usb00: irq 13, pci mem e8000100

pecos-ehci usb00: new USB bus registered, assigned bus number 1

Test 0 <6>pecos-ehci usb00: park 0

pecos-ehci usb00: USB 0.0 initialized, EHCI 1.00, driver 10 Dec 2004

hub 1-0:1.0: USB hub found

hub 1-0:1.0: 1 port detected

pecos-ehci usb10: Pecos USB 2.0

pecos-ehci usb10: irq 17, pci mem e8001100

pecos-ehci usb10: new USB bus registered, assigned bus number 2

Test 1 <6>pecos-ehci usb10: park 0

pecos-ehci usb10: USB 0.0 initialized, EHCI 1.00, driver 10 Dec 2004

hub 2-0:1.0: USB hub found

hub 2-0:1.0: 1 port detected

pecos-ehci usb20: Pecos USB 2.0

pecos-ehci usb20: irq 20, pci mem e8002100

pecos-ehci usb20: new USB bus registered, assigned bus number 3

Test 2 <6>pecos-ehci usb20: park 0

pecos-ehci usb20: USB 0.0 initialized, EHCI 1.00, driver 10 Dec 2004

hub 3-0:1.0: USB hub found

hub 3-0:1.0: 1 port detected

Initializing USB Mass Storage driver...

usbcore: registered new driver usb-storage

USB Mass Storage support registered.

usbcore: registered new driver hiddev

usbcore: registered new driver usbhid

/home/kumarpr/Linux_SDK/target/src/linux/kernel/linux-
2.6.11.12/drivers/usb/inpu

t/hid-core.c: v2.0:USB HID core driver

mice: PS/2 mouse device common for all mice

NET: Registered protocol family 2

IP: routing cache hash table of 512 buckets, 4Kbytes

TCP established hash table entries: 4096 (order: 3, 32768 bytes)

TCP bind hash table entries: 4096 (order: 2, 16384 bytes)

TCP: Hash tables configured (established 4096 bind 4096)

NET: Registered protocol family 1

NET: Registered protocol family 17

NET: Registered protocol family 15

RAMDISK: ext2 filesystem found at block 0

RAMDISK: Loading 7558KiB [1 disk] into ram disk... done.

VFS: Mounted root (ext2 filesystem) readonly.

Freeing init memory: 84K

init started:  BusyBox v1.2.0 (2007.02.22-09:33+0000) multi-call binary





BusyBox v1.2.0 (2007.02.22-09:33+0000) Built-in shell (ash)

Enter 'help' for a list of built-in commands.



# mkdir dsk

# mount -t jffs2 /dev/mtdblock2 /dsk

jffs2_scan_eraseblock(): Node at 0x00000000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008:
0xb0b1 in

stead

Empty flash at 0x0000000c ends at 0x0001fffc

JFFS2: Erase block at 0x00000000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00020000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00020008:
0xb0b1 in

stead

Empty flash at 0x0002000c ends at 0x0003fffc

JFFS2: Erase block at 0x00020000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00040000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00040008:
0xb0b1 in

stead

Empty flash at 0x0004000c ends at 0x0005fffc

JFFS2: Erase block at 0x00040000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00060000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00060008:
0xb0b1 in

stead

Empty flash at 0x0006000c ends at 0x0007fffc

JFFS2: Erase block at 0x00060000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00080000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00080008:
0xb0b1 in

stead

Empty flash at 0x0008000c ends at 0x0009fffc

JFFS2: Erase block at 0x00080000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x000a0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000a0008:
0xb0b1 in

stead

Empty flash at 0x000a000c ends at 0x000bfffc

JFFS2: Erase block at 0x000a0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x000c0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000c0008:
0xb0b1 in

stead

Empty flash at 0x000c000c ends at 0x000dfffc

JFFS2: Erase block at 0x000c0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x000e0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x000e0008:
0xb0b1 in

stead

Empty flash at 0x000e000c ends at 0x000ffffc

JFFS2: Erase block at 0x000e0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00100000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00100008:
0xb0b1 in

stead

Empty flash at 0x0010000c ends at 0x0011fffc

JFFS2: Erase block at 0x00100000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00120000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00120008:
0xb0b1 in

stead

Empty flash at 0x0012000c ends at 0x0013fffc

JFFS2: Erase block at 0x00120000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00140000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00140008:
0xb0b1 in

stead

Empty flash at 0x0014000c ends at 0x0015fffc

JFFS2: Erase block at 0x00140000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00160000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00160008:
0xb0b1 in

stead

Empty flash at 0x0016000c ends at 0x0017fffc

JFFS2: Erase block at 0x00160000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00180000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00180008:
0xb0b1 in

stead

Empty flash at 0x0018000c ends at 0x0019fffc

JFFS2: Erase block at 0x00180000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x001a0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001a0008:
0xb0b1 in

stead

Empty flash at 0x001a000c ends at 0x001bfffc

JFFS2: Erase block at 0x001a0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x001c0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001c0008:
0xb0b1 in

stead

Empty flash at 0x001c000c ends at 0x001dfffc

JFFS2: Erase block at 0x001c0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x001e0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x001e0008:
0xb0b1 in

stead

Empty flash at 0x001e000c ends at 0x001ffffc

JFFS2: Erase block at 0x001e0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00200000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00200008:
0xb0b1 in

stead

Empty flash at 0x0020000c ends at 0x0021fffc

JFFS2: Erase block at 0x00200000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00220000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00220008:
0xb0b1 in

stead

Empty flash at 0x0022000c ends at 0x0023fffc

JFFS2: Erase block at 0x00220000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00240000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00240008:
0xb0b1 in

stead

Empty flash at 0x0024000c ends at 0x0025fffc

JFFS2: Erase block at 0x00240000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00260000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00260008:
0xb0b1 in

stead

Empty flash at 0x0026000c ends at 0x0027fffc

JFFS2: Erase block at 0x00260000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00280000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00280008:
0xb0b1 in

stead

Empty flash at 0x0028000c ends at 0x0029fffc

JFFS2: Erase block at 0x00280000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x002a0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002a0008:
0xb0b1 in

stead

Empty flash at 0x002a000c ends at 0x002bfffc

JFFS2: Erase block at 0x002a0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x002c0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002c0008:
0xb0b1 in

stead

Empty flash at 0x002c000c ends at 0x002dfffc

JFFS2: Erase block at 0x002c0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x002e0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0008:
0xb0b1 in

stead

Empty flash at 0x002e000c ends at 0x002ffffc

JFFS2: Erase block at 0x002e0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00300000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00300008:
0xb0b1 in

stead

Empty flash at 0x0030000c ends at 0x0031fffc

JFFS2: Erase block at 0x00300000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00320000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00320008:
0xb0b1 in

stead

Empty flash at 0x0032000c ends at 0x0033fffc

JFFS2: Erase block at 0x00320000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00340000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00340008:
0xb0b1 in

stead

Empty flash at 0x0034000c ends at 0x0035fffc

JFFS2: Erase block at 0x00340000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00360000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00360008:
0xb0b1 in

stead

Empty flash at 0x0036000c ends at 0x0037fffc

JFFS2: Erase block at 0x00360000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x00380000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00380008:
0xb0b1 in

stead

Empty flash at 0x0038000c ends at 0x0039fffc

JFFS2: Erase block at 0x00380000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x003a0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003a0008:
0xb0b1 in

stead

Empty flash at 0x003a000c ends at 0x003bfffc

JFFS2: Erase block at 0x003a0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x003c0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003c0008:
0xb0b1 in

stead

Empty flash at 0x003c000c ends at 0x003dfffc

JFFS2: Erase block at 0x003c0000 is not formatted. It will be erased

jffs2_scan_eraseblock(): Node at 0x003e0000 {0x1985, 0x000c, 0xb0b1000c) ha=
s
inv

alid CRC 0xffffb0b1 (calculated 0x23f72e11)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0004:
0x000c in

stead

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x003e0008:
0xb0b1 in

stead

JFFS2: Erase block at 0x003e0000 is not formatted. It will be erased

Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes

empty_blocks 0, bad_blocks 0, c->nr_blocks 32

mount: Mounting /dev/mtdblock2 on /dsk failed: Input/output error

#

Can anyone please tell me whats going wrong?

Regards,

*RK*

------=_Part_26543_9415235.1173097702325
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline



<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>Hi,</span></p>



<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>&nbsp;I am not
able to mount my JFFS2 file system. I am getting "Magic bitmask not found"
errors.</span></p>

<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>I am able
to successful detect the flash chip as:</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">phys_mapped_flash: Found 1
x16 devices at 0x0 in 16-bit bank</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;</span>Amd/Fujitsu Ext=
ended Query Table at 0x0040</span></p>

<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>&nbsp;</span><span style=3D"font-size: 10pt; font-family: Arial;">My JFFS2=
 FS image is of the
     same size as the MTD partitions (padded till the full size)</span></p>

<ul style=3D"margin-top: 0in;" type=3D"disc"><li class=3D"MsoNormal" style=
=3D""><span style=3D"font-size: 10pt; font-family: Arial;">I could see that=
 both </span><b style=3D""><span style=3D"font-size: 10pt; font-family: &qu=
ot;Courier New&quot;;">
flash_eraseall =96j </span></b><span style=3D"font-size: 10pt; font-family:=
 Arial;">and the </span><b style=3D""><span style=3D"font-size: 10pt; font-=
family: &quot;Courier New&quot;;">mkfs.jffs2</span></b><span style=3D"font-=
size: 10pt; font-family: Arial;">
 keep clean markers at same location but the jffs2_scan_eraseblock
     API looks for the magic bitmask (0x1985) at a different location,
     resulting in that errors shown below.</span></li></ul>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00000000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00000004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<div style=3D"border-style: none none double; border-color: -moz-use-text-c=
olor -moz-use-text-color windowtext; border-width: medium medium 2.25pt; pa=
dding: 0in 0in 1pt;">

<p class=3D"MsoNormal" style=3D"border: medium none ; padding: 0in;"><span =
style=3D"font-size: 10pt; font-family: Arial;">&nbsp;</span></p>

<p class=3D"MsoNormal" style=3D"border: medium none ; padding: 0in;"><span =
style=3D"font-size: 10pt; font-family: Arial;">If I try to mount a clean pa=
rtition (not even with clean
markers), mount will be successful just once. And creates the clean markers
just similar to flash_eraseall =96j. If I umount and mount it again, I get =
that
bitmask errors.</span></p>

<p class=3D"MsoNormal" style=3D"border: medium none ; padding: 0in;"><span =
style=3D"font-size: 10pt; font-family: Arial;">&nbsp;</span></p>

<p class=3D"MsoNormal" style=3D"border: medium none ; padding: 0in;"><span =
style=3D"font-size: 10pt; font-family: Arial;">I used the default map drive=
r (simple_map_read,
simple_map_write apis) as well as my own map driver that differs from the d=
efault
one by changing the flash chip's mode to program mode in write explicitly. =
Both
gave me same results.</span></p>

<p class=3D"MsoNormal" style=3D"border: medium none ; padding: 0in;"><span =
style=3D"font-size: 10pt; font-family: Arial;">Complete log as follows:&nbs=
p;</span></p>

</div>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Starting Linux kernel...</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Linux version <a href=3D"http://2.6.11.12">2.=
6.11.12</a>
(<a href=3D"mailto:kumarpr@localhost.localdomain">kumarpr@localhost.localdo=
main</a>) (gcc version 4.0.3) #23 </span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Mon Mar 5 11:30:34 IST 2007</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">CPU: Some Random V6
Processor [410fb763] revision 3 (ARMv6TEJ)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">CPU0: D VIPT write-back
cache</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">CPU0: I cache: 16384 bytes,
associativity 4, 32 byte lines, 128 sets</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">CPU0: D cache: 16384 bytes,
associativity 4, 32 byte lines, 128 sets</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Machine: Conexant Presidio
IRD</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Memory policy: ECC disabled,
Data cache writeback</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">BUG: mapping for 0x0f800000
at 0x4f800000 overlaps vmalloc space</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Built 1 zonelists</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Kernel command line:
console=3DttyRI0 root=3D/dev/ram mem=3D64M</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">PID hash table entries: 512
(order: 9, 8192 bytes)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Dentry cache hash table
entries: 16384 (order: 4, 65536 bytes)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Inode-cache hash table
entries: 8192 (order: 3, 32768 bytes)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Memory: 64MB =3D 64MB total</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Memory: 53264KB available
(2638K code, 535K data, 84K init)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Mount-cache hash table
entries: 512 (order: 0, 4096 bytes)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">CPU: Testing write buffer
coherency: ok</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">checking if image is
initramfs...it isn&#39;t (bad gzip magic numbers); looks like a</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">n initrd</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Freeing initrd memory: 8192K</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">NET: Registered protocol
family 16</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">SCSI subsystem initialized</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">usbcore: registered new
driver usbfs</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">usbcore: registered new
driver hub</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Checking V6 block cache
operations:</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Prefetch data range: supported</spa=
n></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;&nbsp; </span>Clean+In=
validate data range: supported</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Clean data range:=
 supported</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </span>Invalidate data range: supported</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; </span>Invalidate instr range: supported</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;</span>--&gt; Using ha=
rvard block cache invalidate</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;</span>--&gt; Using bl=
ock cache clean</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;</span>--&gt; Using bl=
ock cache clean+invalidate</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">NetWinder Floating Point
Emulator V0.97 (double precision)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">audit: initializing netlink
socket (disabled)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">audit(0.450:0): initialized</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">NTFS driver 2.1.22 [Flags:
R/O].</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS version 1.0, (C) 1999,
2000<span style=3D"">&nbsp; </span>Axis Communications AB</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2 version 2.2. (C)
2001-2003 Red Hat, Inc.</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: default compression
mode: priority</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">SGI XFS with no debug
enabled</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">ttyRI0 at MMIO 0xe0412000
(irq =3D 2) is a CNXTUART</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">ttyRI1 at MMIO 0xe0411000
(irq =3D 1) is a CNXTUART</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">ttyRI2 at MMIO 0xe0410000
(irq =3D 0) is a CNXTUART</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">io scheduler noop registered</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">io scheduler anticipatory
registered</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">io scheduler deadline
registered</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">io scheduler cfq registered</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">RAMDISK driver initialized:
1 RAM disks of 32768K size 1024 blocksize</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Inside emacdev_load function</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Inside emacdev_init function</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">EMAC 0 Initialized</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">physmap flash device:
1000000 at f0000000</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">phys_mapped_flash: Found 1
x16 devices at 0x0 in 16-bit bank</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"><span style=3D"">&nbsp;</span>Amd/Fujitsu Ext=
ended Query Table at 0x0040</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Using buffer write method</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">phys_mapped_flash: CFI does
not contain boot bank location. Assuming top.</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">number of CFI chips: 1</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">cfi_cmdset_0002: Disabling
erase-suspend-program due to code brokenness.</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">cmdlinepart partition
parsing not available</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">RedBoot partition parsing
not available</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Using physmap partition
definition</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Creating 3 MTD partitions on
&quot;phys_mapped_flash&quot;:</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">0x00000000-0x00040000 :
&quot;codeldr&quot;</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">mtd: Giving out device 0 to
codeldr</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">0x00200000-0x00600000 :
&quot;tlv_vmlinuz&quot;</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">mtd: Giving out device 1 to
tlv_vmlinuz</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">0x00600000-0x00a00000 :
&quot;jffs2_root&quot;</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">mtd: Giving out device 2 to
jffs2_root</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">3 value at 0xe0440150 </span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb00: Pecos USB
2.0</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb00: irq 13,
pci mem e8000100</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb00: new USB
bus registered, assigned bus number 1</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Test 0 &lt;6&gt;pecos-ehci
usb00: park 0</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb00: USB 0.0
initialized, EHCI 1.00, driver 10 Dec 2004</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">hub 1-0:1.0: USB hub found</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">hub 1-0:1.0: 1 port detected</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb10: Pecos USB
2.0</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb10: irq 17,
pci mem e8001100</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb10: new USB
bus registered, assigned bus number 2</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Test 1 &lt;6&gt;pecos-ehci
usb10: park 0</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb10: USB 0.0
initialized, EHCI 1.00, driver 10 Dec 2004</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">hub 2-0:1.0: USB hub found</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">hub 2-0:1.0: 1 port detected</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb20: Pecos USB
2.0</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb20: irq 20,
pci mem e8002100</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb20: new USB
bus registered, assigned bus number 3</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Test 2 &lt;6&gt;pecos-ehci
usb20: park 0</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">pecos-ehci usb20: USB 0.0
initialized, EHCI 1.00, driver 10 Dec 2004</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">hub 3-0:1.0: USB hub found</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">hub 3-0:1.0: 1 port detected</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Initializing USB Mass
Storage driver...</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">usbcore: registered new
driver usb-storage</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">USB Mass Storage support
registered.</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">usbcore: registered new
driver hiddev</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">usbcore: registered new
driver usbhid</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">/home/kumarpr/Linux_SDK/target/src/linux/kern=
el/linux-<a href=3D"http://2.6.11.12/drivers/usb/inpu">2.6.11.12/drivers/us=
b/inpu
</a></span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">t/hid-core.c: v2.0:USB HID
core driver</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">mice: PS/2 mouse device
common for all mice</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">NET: Registered protocol
family 2</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">IP: routing cache hash table
of 512 buckets, 4Kbytes</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">TCP established hash table
entries: 4096 (order: 3, 32768 bytes)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">TCP bind hash table entries:
4096 (order: 2, 16384 bytes)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">TCP: Hash tables configured
(established 4096 bind 4096)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">NET: Registered protocol
family 1</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">NET: Registered protocol
family 17</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">NET: Registered protocol
family 15</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">RAMDISK: ext2 filesystem
found at block 0</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">RAMDISK: Loading 7558KiB [1
disk] into ram disk... done.</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">VFS: Mounted root (ext2
filesystem) readonly.</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Freeing init memory: 84K</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">init started:<span style=3D"">&nbsp; </span>B=
usyBox v1.2.0 (2007.02.22-09:33+0000)
multi-call binary</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">&nbsp;</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">&nbsp;</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">BusyBox v1.2.0
(2007.02.22-09:33+0000) Built-in shell (ash)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Enter &#39;help&#39; for a list of
built-in commands.</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">&nbsp;</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"># mkdir dsk</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;"># mount -t jffs2
/dev/mtdblock2 /dsk</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00000000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00000004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00000008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0000000c
ends at 0x0001fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00000000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00020000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00020004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00020008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0002000c
ends at 0x0003fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00020000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00040000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00040004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00040008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0004000c
ends at 0x0005fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00040000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00060000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00060004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00060008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0006000c
ends at 0x0007fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00060000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00080000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00080004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00080008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0008000c
ends at 0x0009fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00080000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x000a0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x000a0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x000a0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x000a000c
ends at 0x000bfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x000a0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x000c0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x000c0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x000c0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x000c000c
ends at 0x000dfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x000c0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x000e0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x000e0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x000e0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x000e000c
ends at 0x000ffffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x000e0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00100000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00100004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00100008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0010000c
ends at 0x0011fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00100000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00120000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00120004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00120008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0012000c
ends at 0x0013fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00120000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00140000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00140004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00140008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0014000c
ends at 0x0015fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00140000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00160000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00160004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00160008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0016000c
ends at 0x0017fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00160000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00180000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00180004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00180008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0018000c
ends at 0x0019fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00180000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x001a0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x001a0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x001a0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x001a000c
ends at 0x001bfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x001a0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x001c0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x001c0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x001c0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x001c000c
ends at 0x001dfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x001c0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x001e0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x001e0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x001e0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x001e000c
ends at 0x001ffffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x001e0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00200000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00200004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00200008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0020000c
ends at 0x0021fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00200000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00220000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00220004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00220008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0022000c
ends at 0x0023fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00220000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00240000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00240004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00240008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0024000c
ends at 0x0025fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00240000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00260000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00260004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00260008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0026000c
ends at 0x0027fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00260000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00280000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00280004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00280008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0028000c
ends at 0x0029fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00280000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x002a0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x002a0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x002a0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x002a000c
ends at 0x002bfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x002a0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x002c0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x002c0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x002c0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x002c000c
ends at 0x002dfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x002c0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x002e0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x002e0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x002e0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x002e000c
ends at 0x002ffffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x002e0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00300000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00300004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00300008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0030000c
ends at 0x0031fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00300000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00320000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00320004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00320008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0032000c
ends at 0x0033fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00320000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00340000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00340004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00340008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0034000c
ends at 0x0035fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00340000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00360000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00360004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00360008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0036000c
ends at 0x0037fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00360000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x00380000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00380004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x00380008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x0038000c
ends at 0x0039fffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x00380000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x003a0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x003a0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x003a0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x003a000c
ends at 0x003bfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x003a0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x003c0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x003c0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x003c0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Empty flash at 0x003c000c
ends at 0x003dfffc</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x003c0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Node at 0x003e0000 {0x1985, 0x000c, 0xb0b1000c) has inv</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">alid CRC 0xffffb0b1
(calculated 0x23f72e11)</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x003e0004: 0x000c in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">jffs2_scan_eraseblock():
Magic bitmask 0x1985 not found at 0x003e0008: 0xb0b1 in</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">stead</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">JFFS2: Erase block at
0x003e0000 is not formatted. It will be erased</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">Cowardly refusing to erase
blocks on filesystem with no valid JFFS2 nodes</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">empty_blocks 0, bad_blocks
0, c-&gt;nr_blocks 32</span></p>

<p class=3D"MsoNormal" style=3D""><span style=3D"font-size: 10pt; font-fami=
ly: &quot;Courier New&quot;;">mount: Mounting
/dev/mtdblock2 on /dsk failed: Input/output error</span></p>

<div style=3D"border-style: none none double; border-color: -moz-use-text-c=
olor -moz-use-text-color windowtext; border-width: medium medium 2.25pt; pa=
dding: 0in 0in 1pt;">

<p class=3D"MsoNormal" style=3D"border: medium none ; padding: 0in;"><span =
style=3D"font-size: 10pt; font-family: &quot;Courier New&quot;;"># </span><=
/p>

</div>

<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>Can anyone please tell me whats going wrong?&nbsp;</span></p>



<p class=3D"MsoNormal"><a name=3D"_MailAutoSig"><span style=3D"font-size: 1=
0pt; font-family: Arial;">Regards,</span><span style=3D""></span></a></p>

<p class=3D"MsoNormal"><span style=3D""><strong><span style=3D"">RK</span><=
/strong></span></p>

<p class=3D"MsoNormal">&nbsp;</p>


------=_Part_26543_9415235.1173097702325--
