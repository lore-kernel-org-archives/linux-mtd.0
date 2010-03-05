Received: from aa011msr.fastwebnet.it ([85.18.95.71])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NnUWr-0004cb-Fz
	for linux-mtd@lists.infradead.org; Fri, 05 Mar 2010 10:13:13 +0000
Received: from aurio02.aurion-tech.com (39.225.70.39) by
	aa011msr.fastwebnet.it (8.5.016.6)
	id 4B829BA801A8BC35 for linux-mtd@lists.infradead.org;
	Fri, 5 Mar 2010 11:13:07 +0100
From: Fabio Giovagnini <fabio.giovagnini@aurion-tech.com>
To: linux-mtd@lists.infradead.org
Subject: Hi All
Date: Fri, 5 Mar 2010 11:14:36 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <201003051114.36229.fabio.giovagnini@aurion-tech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm newbe of MTD.
I have a board with sh2a 7203 and SST39VF6401B70-4c NOR flash as boot flash
and I cannot see the mtdblock; even if I had added the physical maps .
I see

JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
io scheduler noop registered (default)
SH7203 LCD frame buffer probe.
SH7203 LCD frame buffer got options.
SH7203 LCD frame buffer setup vars.
SH7203 LCD frame buffer done cmap.
fb0: RENESAS SH7203 frame buffer device
SH7203 LCD frame buffer initialized at 0xc25a000.
SuperH SCI(F) driver initialized
ttySC0 at MMIO 0xfffe8000 (irq = 192) is a scif
ttySC1 at MMIO 0xfffe8800 (irq = 196) is a scif
ttySC2 at MMIO 0xfffe9000 (irq = 200) is a scif
ttySC3 at MMIO 0xfffe9800 (irq = 204) is a scif
RAMDISK driver initialized: 1 RAM disks of 1024K size 1024 blocksize
loop: loaded (max 8 devices)
MLCD Probing for flash chips at 0x00000000:
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
cfi_qry_mode_on - not F0 / AA / 55 / 98 on 5555 / 2AAA
cfi_qry_mode_on - query NOT FOUND
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
cfi_qry_mode_on - not F0 / AA / 55 / 98 on 5555 / 2AAA
cfi_qry_mode_on - query NOT FOUND
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
cfi_qry_mode_on - not F0 / AA / 55 / 98 on 5555 / 2AAA
cfi_qry_mode_on - query NOT FOUND
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
MLCD FLASH: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0000
gen_probe: No supported Vendor Command Set found
MLCD Probing for flash chips at 0x01000000:
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
cfi_qry_mode_on - not F0 / AA / 55 / 98 on 5555 / 2AAA
cfi_qry_mode_on - query NOT FOUND
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
cfi_qry_mode_on - not F0 / AA / 55 / 98 on 5555 / 2AAA
cfi_qry_mode_on - query NOT FOUND
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
cfi_qry_mode_on - not F0 / AA / 55 / 98 on 5555 / 2AAA
cfi_qry_mode_on - query NOT FOUND
cfi_qry_mode_on - enter
cfi_qry_mode_on - not F0 / 98
cfi_qry_mode_on - not F0 / FF / 98
cfi_qry_mode_on - not F0 / 98 on 555
MLCD FLASH: Found 1 x16 devices at 0x0 in 16-bit bank
 Amd/Fujitsu Extended Query Table at 0x0000
gen_probe: No supported Vendor Command Set found
Flash chips not detected at either possible location.
Generic platform RAM MTD, (c) 2004 Simtec Electronics


What could be the problem?

Thanks a lot in advance


-- 
Fabio Giovagnini

Aurion s.r.l.
CF e P.IVA 00885711200
Tel. +39.051.594.78.24
Cell. +39.335.8350919

www.aurion-tech.com

account telefono VoIP skype (www.skype.com):
aurion.giovagnini
