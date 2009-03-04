Received: from home.innominate.com ([77.245.32.75])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LeqXM-0004rd-60
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 12:49:27 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by home.innominate.com (Postfix) with ESMTP id 1AA2C2311E
	for <linux-mtd@lists.infradead.org>;
	Wed,  4 Mar 2009 13:49:21 +0100 (CET)
Received: from home.innominate.com ([127.0.0.1])
	by localhost (localhost.localdomain [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QopVwfuzPCDv for <linux-mtd@lists.infradead.org>;
	Wed,  4 Mar 2009 13:49:19 +0100 (CET)
Received: from tomo.bln.innominate.local (gw-dev-ext.bln.innominate.local
	[10.10.0.1])
	by home.innominate.com (Postfix) with ESMTP id 3551C23117
	for <linux-mtd@lists.infradead.org>;
	Wed,  4 Mar 2009 13:49:19 +0100 (CET)
Received: from localhost
	([127.0.0.1] helo=tomo.bln.innominate.local ident=pvollmer)
	by tomo.bln.innominate.local with esmtp (Exim 4.69)
	(envelope-from <pvollmer-linux-mtd@innominate.com>)
	id 1LeqXH-0005fu-3t
	for linux-mtd@lists.infradead.org; Wed, 04 Mar 2009 13:49:19 +0100
Date: Wed, 04 Mar 2009 13:49:18 +0100
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: using BDI2000 to access  Secured Silicon Sector on Spansion Flash
	(CFI commandset 0002)
From: "Peter Vollmer" <pvollmer-linux-mtd@innominate.com>
Content-Type: text/plain; format=flowed; delsp=yes; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <op.up9pwgzonpibwm@tomo.bln.innominate.local>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'm sorry if this is slightly off-topic, but I hope to reach somebody with  
experience using the BDI2000 (or other jtag tools) to run cfi commands  
(command set 0002) directly, i.e without booting the linux kernel.

I want to access the secured silicon sector of a s29gl128n flash chip,  
namely to program a unique device id and lock this sector. The board I use  
has a MPC8343 CPU and two of these flash chips in parallel on the local  
address bus, each delivering 16 data bits to the databus lines 0-15 and   
16-31 respectively.

The 32 MB of flash are mapped to 0xfe000000..0xffffffff (see bdi2000  
configuraton below)

After pwering on the target I try to follow the cfi command sequence to  
enter the secured silicon sector as described in the datasheet  
(http://www.spansion.com/products/S29GL128N.html) :

-> enter secured sector
write 0xAA to addr 0x555
write 0x55 to addr 0x2AA
write 0x88 to addr 0x555

->read secured sector content in address range 0x00..0xff

-> leave secured sector
write 0xAA to addr 0x555
write 0x55 to addr 0x2AA
write 0x90 to addr 0x555
write 0x00 to addr 0x2AA (addr is defined as "do not care" for this step)

so what I try on the bdi2000 after resetting the target is the following  
(I try to access both chips simultaneously using 32 bit data access, but I  
also tried writing 16 bit words instead)

SEC>mm 0xfe000555 0x00AA00AA; mm 0xfe0002AA 0x00550055; mm 0xfe000555  
0x00880088; md 0xfe000000

What I see each time is only the start of my bootloader code in flash. Do  
I miss something important when trying it like this ? I would very much  
appreciate if someone could give a short example of executing cfi commands  
on the flash only using jtag access.

I'm using linux 2.6.27.19 (CONFIG_MTD_CFI_AMDSTD=y), the flash gets  
detected as CFI_ID 0x2101 and uses cfi command set 0002 . I tried to  
activate the fixup function fixup_use_secsi() for this chip id, and I  
think I can read the secured sector when reading from /dev/mtd/0 after  
doing the following ioctl to its file descriptor:

ioctl(fd, MTDFILEMODE, (void*) MTD_MODE_OTP_FACTORY )

But I can only read 16 bytes (all 0xFF's - maybe because the chips are not  
pre-serialized in the factory), and writing to the sector does not change  
the content.

Thanks very much for your help

-- 
Peter Vollmer
Innominate Security Technologies AG
Berlin / Germany



My simplified bdi configuration for the direct access attempt looks as  
follows:

[INIT]
; init core register
WREG    MSR             0x00001002      ;MSR  : ME,RI
WM32    0xFF400000      0xE0000000 	;IMMR

; System configuration
WM32	0xE0000114	0x80000000      ; SICRL
WM32	0xE0000118	0x00000002      ; SICRH

WM32    0xE00050D4      0x80000008 	;LCRR : DLL bypass, freq ratio 1:8 ,  
33 MHz

; WINDOW 0 - FLASH
WM32    0xE0000020      0xFE000000      ;LBLAWBAR0: Flash
WM32    0xE0000024      0x80000018      ;LBLAWAR0   32MB

; WINDOW 1 - bootrom
WM32	0xE0000028	0xFFF00000	;LBLAWBAR1  - begining at 0xfff00000
WM32	0xE000002C	0x8000001E 	;LBLAWAR1   - enabled, size = 2GB

; WINDOW 2 - board BCSRs
WM32    0xE0000030      0xB0000000      ;LBLAWBAR2: CPLD
WM32    0xE0000034      0x8000000B      ;LBLAWAR2 : 4kB

; PCI Local Access Windows
; WINDOW 0
WM32	0XE0000060	0x80000000	;PCILAWBAR0 - begining at 0x80000000
WM32    0XE0000064	0x8000001B	;PCILAWAR0  - enable, size = 256MB

; WINDOW 1
WM32    0XE0000068      0x90000000      ;PCILAWBAR1 - begining at  
0x90000000
WM32    0XE000006C      0x8000001B      ;PCILAWAR1  - enable, size = 256MB

[TARGET]
CPUTYPE     8343
JTAGCLOCK   0           ;16 MHz JTAG clock
; BDIMODE     AGENT RUN
POWERUP     2000	;start delay after power-up detected in ms
WAKEUP      500		;give reset time to complete
STARTUP     RESET	;halt immediately at the boot vector
SCANPRED    0 0
SCANSUCC    2 21

BOOTADDR    0x00000100
BREAKMODE   SOFT

[FLASH]
CHIPTYPE    MIRRORX16
CHIPSIZE    0x1000000   ;The size of one flash chip in bytes
BUSWIDTH    32          ;The width of the flash memory bus in bits
                         ; (8 | 16 | 32 | 64)
WORKSPACE   0x1000      ;workspace in DDR RAM

[REGS]
FILE        $reg8349e.def
