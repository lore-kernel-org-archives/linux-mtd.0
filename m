Received: from bay2-f101.bay2.hotmail.com ([65.54.247.101] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATgpa-0004Qg-9q
	for <linux-mtd@lists.infradead.org>; Tue, 09 Dec 2003 12:19:10 +0000
From: "Devi Priya" <ijpriya@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 09 Dec 2003 12:17:05 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <BAY2-F101rghcdP5VuX00018ea6@hotmail.com>
Subject: Re:Hardware help with diskonchip millennium!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>




>On Mon, 2003-12-08 at 05:15 +0000, Devi Priya wrote:
>>Hi,
>>         In the application note (AP044) from Msystems it is given as:
>>"The DiskOnChip Millennium is mapped into an 8KB memory window in the host 
>>platforms
>>memory map. This 8KB window consists of four 2KB windows." Why is this 
>>mapping done?
>
>>The Millennium only uses a handful of those registers. There's no real
>>need for the 2KiB range to be repeated -- I don't really know why it's
>>done.
>
>
>>Is this mapping done in hardware? I use diskonchip millennium (8MByte 
>>MD2800). Then shouldn't the entire 8MB shall be mapped in hardware to the 
>>physical address space?
>
>>You can't map 8MiB into 8KiB of physical space, even if it were NOR
>>flash and linearly accessible, which it's not.
>
I cant understand this part. I have my set up as the 8MByte
diskonchip is mapped in hardware to the physical address from
0xFFFFFFFF-0xFF800000. Should I not map the entire 8 MBYte? I use
sc1200 (x86 compatible).

>>The steps for BIOS is summarised as
>>1. After DiskOnChip Millennium BUSY# signal is negated, the CPU fetches 
>>the Reset Vector from
>>the Boot-Block area, fetches the Boot Code stored there, and starts to 
>>execute the code.
>>2. Boot Code runs the first part of BIOS, initializing the basic hardware 
>>functionality.
>>3. Boot Codes loads the rest of the BIOS from the flash memory to the 
>>DRAM, and transfer control
>>(jumps) there.
>>4. Chip Select of DiskOnChip Millennium is remapped from Reset Vector to 
>>BIOS expansion area.
>>5. CPU executes the rest of the BIOS code, including ROM expansion devices 
>>(among them, the
>>DiskOnChip Millennium itself).
>>6. CPU calls OS bootstrap loader (INT19).
>>7. OS is loaded, and recognizes the DiskOnChip Millennium as the boot 
>>device.
>>8. OS loads the application code from the DiskOnChip Millennium and 
>>executes it.
>>9. Application software uses DiskOnChip Millennium exactly as if it were 
>>using a regular hard
>>disk.
>>
>>In step 4 why is this remapping done? Is this mapping done in hardware?
>
>>I don't know why it's done. Probably to preserve software compatibility
>>with their 1980s PC BIOS extension hack, so you put your own system BIOS
>>into the Millennium but keep it _separate_ from their BIOS extension
>>which your BIOS is supposed to load later. You'd need chipset support
>>for changing the physical address at which the DiskOnChip appears.
>
>>        In my setup, the diskonchip is mapped in hardware to the higher 
>>order address
>>(0xFFFFFFFF-0xFF800000). SDRAM mapped to lower address 
>>(0x00000000-0x1FFFFFF). What else
>>modification do i require in HARDWARE to use diskonchip millennium?
>
>>Probably none. See LinuxBIOS.
>
>--
>dwmw2
>
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/

_________________________________________________________________
Sports buff? This hot new channel is for you! http://www.msn.co.in/sports/ 
Get on the inside of all the action!
