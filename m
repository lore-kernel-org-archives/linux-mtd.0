Received: from outbound-mail-37.bluehost.com ([69.89.20.191])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L54lh-0006is-Ln
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 20:44:22 +0000
Received: from 208.123.189.57.dynamic.dejazzd.com ([208.123.189.57]
	helo=hp-dhlii.dlasys.lcl)
	by host200.hostmonster.com with esmtpa (Exim 4.69)
	(envelope-from <dhlii@dlasys.net>) id 1L54lc-0004H4-9W
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 13:44:16 -0700
Message-ID: <492C63A1.20009@dlasys.net>
Date: Tue, 25 Nov 2008 15:44:17 -0500
From: "David H. Lynch Jr." <dhlii@dlasys.net>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: cfi_probe help
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Reply-To: dhlii@dlasys.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	I have written a map driver for my board because the flash must be switched between two processors on different busses.

	I beleive I have all the map_info functions working correctly - I can manually test them from inside the driver probe function, 
	I can successfully read the flash as well as directly execute CFI QRY and SCI functions.

	but when the kernel cfi_probe() code executes it never tries a combination of read/write addresses and data that return results it can match against.
	I have logged the driver load below.
	
picoFlash: pico_flash_init()
pico_mtd.c:v Nov 25 2008  David Lynch dhlii@dlasys.net
drivers/mtd/maps/pico_nor_mtd.c: verify flash[0] is 0xff
drivers/mtd/maps/pico_nor_mtd.c: pico_flash_copy_from(cf81fc18, 00000000, 00000020)
000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|

drivers/mtd/maps/pico_nor_mtd.c: verify flash[FIRST_FILE_ADDR] contains "PrimaryBoot.bit"
drivers/mtd/maps/pico_nor_mtd.c: pico_flash_copy_from(cf81fc18, 00004000, 00000020)
drivers/mtd/maps/pico_nor_mtd.c: Flash Read Successful - pico_flash_copy_from

004000: 42 69 74 20 46 69 6c 65 3d 50 72 69 6d 61 72 79  |Bit File=Primary|
drivers/mtd/maps/pico_nor_mtd.c: Verify QRY
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00f0
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00ff
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000055 <= 0098
drivers/mtd/maps/pico_nor_mtd.c: pico_flash_copy_from(cf81fc18, 00000000, 00000040)
drivers/mtd/maps/pico_nor_mtd.c: WriteFlashCmdFlash QRY OK
000000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
000010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  |................|
000020: 51 00 52 00 59 00 02 00 00 00 40 00 00 00 00 00  |Q.R.Y.....@.....|
000030: 00 00 00 00 00 00 27 00 36 00 00 00 00 00 07 00  |......'.6.......|
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00f0

drivers/mtd/maps/pico_nor_mtd.c: verify SCI
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00f0
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00ff
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000555 <= 00aa
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:000002aa <= 0055
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000555 <= 0088
drivers/mtd/maps/pico_nor_mtd.c: pico_flash_copy_from(cf81fc18, 00000000, 00000100)
drivers/mtd/maps/pico_nor_mtd.c: WriteFlashCmdFlash SCI OK
000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000070: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000080: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
000090: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0000a0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0000b0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0000c0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0000d0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0000e0: 04 45 31 34 00 50 c2 44 28 14 00 00 34 76 66 78  |.E14.P.D(...4vfx|
0000f0: 36 30 66 66 36 37 32 00 00 00 00 00 ff ff ff ff  |60ff672.........|
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000555 <= 00aa
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:000002aa <= 0055
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000555 <= 0090
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 0000

picoFlash: probing cfi_probe
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00f0
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00ff
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000055 <= 0098
qry_present()[01] osf 1 qry 51 52 59
qry_present()[01] osf 1 Val 0 0 0
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00f0
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00ff
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:000000aa <= 0098
qry_present()[01] osf 2 qry 51 52 59
qry_present()[01] osf 2 Val ffff ffff ffff
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00f0
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000000 <= 00ff
drivers/mtd/maps/pico_nor_mtd.c: write16: f5ffe000:00000154 <= 0098
qry_present()[01] osf 4 qry 51 52 59
qry_present()[01] osf 4 Val ffff ffff ffff
picoFlash: probing jedec_probe
picoFlash: probing map_rom
mtd: Giving out device 0 to pico_nor_flash.0

	 	
	

	

 
