Received: from bay2-f160.bay2.hotmail.com ([65.54.247.160] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ATDmB-00082O-3f
	for <linux-mtd@lists.infradead.org>; Mon, 08 Dec 2003 05:17:43 +0000
From: "Devi Priya" <ijpriya@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 08 Dec 2003 05:15:29 +0000
Mime-Version: 1.0
Message-ID: <BAY2-F160g3AmsfGdMN0000051b@hotmail.com>
Content-Type: text/plain; format=flowed
Subject: Hardware Help with diskonchip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
        In the application note (AP044) from Msystems it is given as:
"The DiskOnChip Millennium is mapped into an 8KB memory window in the host 
platform’s
memory map. This 8KB window consists of four 2KB windows." Why is this 
mapping done?
Is this mapping done in hardware? I use diskonchip millennium (8MByte 
MD2800). Then shouldn't the entire 8MB shall be mapped in hardware to the 
physical address space?
The steps for BIOS is summarised as
1. After DiskOnChip Millennium BUSY# signal is negated, the CPU fetches the 
Reset Vector from
the Boot-Block area, fetches the Boot Code stored there, and starts to 
execute the code.
2. Boot Code runs the first part of BIOS, initializing the basic hardware 
functionality.
3. Boot Codes loads the rest of the BIOS from the flash memory to the DRAM, 
and transfer control
(jumps) there.
4. Chip Select of DiskOnChip Millennium is remapped from Reset Vector to 
BIOS expansion area.
5. CPU executes the rest of the BIOS code, including ROM expansion devices 
(among them, the
DiskOnChip Millennium itself).
6. CPU calls OS bootstrap loader (INT19).
7. OS is loaded, and recognizes the DiskOnChip Millennium as the boot 
device.
8. OS loads the application code from the DiskOnChip Millennium and executes 
it.
9. Application software uses DiskOnChip Millennium exactly as if it were 
using a regular hard
disk.

In step 4 why is this remapping done? Is this mapping done in hardware?
       In my setup, the diskonchip is mapped in hardware to the higher order 
address
(0xFFFFFFFF-0xFF800000). SDRAM mapped to lower address 
(0x00000000-0x1FFFFFF). What else
modification do i require in HARDWARE to use diskonchip millennium?

_________________________________________________________________
Marriage? http://www.bharatmatrimony.com/cgi-bin/bmclicks1.cgi?74 Join 
BharatMatrimony.com for free.
