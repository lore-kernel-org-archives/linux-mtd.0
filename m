Received: from f137.law15.hotmail.com ([64.4.23.137] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15KHw3-0007aC-00
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jul 2001 12:13:39 +0100
From: "Tapio Lindh" <talindh@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: Can't write to non-CFI 64Mbit Amd chip
Date: Wed, 11 Jul 2001 11:18:46 -0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F137az7EjQxzmWecm9t0000a8af@hotmail.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

I can't get flash write working on AM29BDS643D, a 64Mbit non-CFI
device.

I am working on an embedded device which has two Amd 64 mbit flash
devices which are tied to addresses 0x0 and 0x02000000.

I have written my own map and I use amd_flash driver. To get the chips
identified I had to an entry to amd_flash_info_table:

#define AM29BDS643D     0x227E

{
	mfr_id: MANUFACTURER_AMD,
	dev_id: AM29BDS643D,
	name: "AMD AM29BDS643D",
	size: 0x00800000,
	numeraseregions: 3,
	regions: {
		{ offset: 0x000000, erasesize: 0x10000, numblocks: 96 },
		{ offset: 0x300000, erasesize: 0x10000, numblocks: 31 },
		{ offset: 0x3F8000, erasesize: 0x02000, numblocks:  8 },
	}
}

The chips are now identified at boot. I am using the priv1 field in
the map as an offset amd my dmesg log has following lines:

    Flash: probing 16-bit flash bus
    flash_read16(c00a6be8, 0, 0) = f018
    flash_write16 map c00a6be8, adr 0, d: 00f0, priv1: 0
    flash_write16 map c00a6be8, adr aa, d: 0098, priv1: 0
    flash_read16(c00a6be8, 0, 20) = 5000
    flash_read16(c00a6be8, 0, 0) = f018

  - No CFI "Q" "R" "Y" response

    flash_write16 map c00a6be8, adr 0, d: 00f0, priv1: 0
    flash_write16 map c00a6be8, adr aaa, d: 00aa, priv1: 0
    flash_write16 map c00a6be8, adr 554, d: 0055, priv1: 0
    flash_write16 map c00a6be8, adr aaa, d: 0090, priv1: 0
    flash_read16(c00a6be8, 0, 0) = 0001
    flash_read16(c00a6be8, 0, 2) = 227e
    flash_read16(c00a6be8, 0, 0) = 0001

  - Jedec query gives correct manufacturer and device IDs, but they
    are no listed on Jedec tables.

    ...

    Flash A: Found no CFI device at location zero
    Flash A: Probing for AMD compatible flash...
    flash_write16 map c00a6be8, adr aaa, d: 00aa, priv1: 0
    flash_write16 map c00a6be8, adr 554, d: 0055, priv1: 0
    flash_write16 map c00a6be8, adr aaa, d: 00f0, priv1: 0
    flash_write16 map c00a6be8, adr aaa, d: 00aa, priv1: 0
    flash_write16 map c00a6be8, adr 554, d: 0055, priv1: 0
    flash_write16 map c00a6be8, adr aaa, d: 0090, priv1: 0
    flash_read16(c00a6be8, 0, 0) = 0001
    flash_read16(c00a6be8, 0, 2) = 227e
    Flash A: Found 1 x 8MiB AMD AM29BDS643D at 0x0
    flash_write16 map c00a6be8, adr aaa, d: 00aa, priv1: 0
    flash_write16 map c00a6be8, adr 554, d: 0055, priv1: 0
    flash_write16 map c00a6be8, adr aaa, d: 00f0, priv1: 0
    mtd: Giving out device 0 to Flash A

    ...

    Flash B: Found no CFI device at location zero
    Flash B: Probing for AMD compatible flash...
    flash_write16 map c00a6c28, adr aaa, d: 00aa, priv1: 2000000
    flash_write16 map c00a6c28, adr 554, d: 0055, priv1: 2000000
    flash_write16 map c00a6c28, adr aaa, d: 00f0, priv1: 2000000
    flash_write16 map c00a6c28, adr aaa, d: 00aa, priv1: 2000000
    flash_write16 map c00a6c28, adr 554, d: 0055, priv1: 2000000
    flash_write16 map c00a6c28, adr aaa, d: 0090, priv1: 2000000
    flash_read16(c00a6c28, 2000000, 0) = 0001
    flash_read16(c00a6c28, 2000000, 2) = 227e
    Flash B: Found 1 x 8MiB AMD AM29BDS643D at 0x0
    flash_write16 map c00a6c28, adr aaa, d: 00aa, priv1: 2000000
    flash_write16 map c00a6c28, adr 554, d: 0055, priv1: 2000000
    flash_write16 map c00a6c28, adr aaa, d: 00f0, priv1: 2000000
    mtd: Giving out device 1 to Flash B


The identified chips then show up on /proc/mtd as mtd0 and
mtd1. When I try to write something to flash, the driver sends
programming commands but the chips do not enter programming mode:

   / # cat /proc/mtd
   dev:    size   erasesize  name
   mtd0: 00800000 00010000 "Flash A"
   mtd1: 00800000 00010000 "Flash B"

   / # cp /etc/fstab /dev/mtd0
   <6>MTD_open
   MTD_write
   flash_write16 map c00a6be8, adr aaa, d: 00aa, priv1: 0
   flash_write16 map c00a6be8, adr 554, d: 0055, priv1: 0
   flash_write16 map c00a6be8, adr aaa, d: 00a0, priv1: 0
   flash_write16 map c00a6be8, adr 0, d: 642f, priv1: 0
   flash_read16(c00a6be8, 0, 0) = f018
   flash_read16(c00a6be8, 0, 0) = f018
   flash_read16(c00a6be8, 0, 0) = f018
   Flash A: write to 0x0 failed. datum = 642f, verify = f018
   cp: /dev/mtd0: I/O error
   MTD_close

   / # cp /etc/fstab /dev/mtd1
   MTD_open
   MTD_write
   flash_write16 map c00a6c28, adr aaa, d: 00aa, priv1: 2000000
   flash_write16 map c00a6c28, adr 554, d: 0055, priv1: 2000000
   flash_write16 map c00a6c28, adr aaa, d: 00a0, priv1: 2000000
   flash_write16 map c00a6c28, adr 0, d: 642f, priv1: 2000000
   flash_read16(c00a6c28, 2000000, 0) = ffff
   flash_read16(c00a6c28, 2000000, 0) = ffff
   flash_read16(c00a6c28, 2000000, 0) = ffff
   Flash B: write to 0x0 failed. datum = 642f, verify = ffff
   cp: /dev/mtd1: I/O error
   MTD_close
   / #


What could go wrong with programming?

  - VPP? I have measured it to be at 1.8V all the time.
  - Cache? The D-cache and I-cache are disabled.
  - WE? I have not measured it but the chip is a top boot device and       
should not affect at the first sector.
  - Wrong commands? The commands match the commands in datasheet.
  - Too old mtd snapshort? My snapshot is less than week old.

If anyone is interested, the chip datasheet can be found at address
  http://www.amd.com/products/nvd/techdocs/23709.pdf

I would appreciate if anyone would have insight on what is going wrong here.

Tapio Lindh
_________________________________________________________________________
Get Your Private, Free E-mail from MSN Hotmail at http://www.hotmail.com.
