Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1ATtHG-00070o-Qq
	for <linux-mtd@lists.infradead.org>; Wed, 10 Dec 2003 01:36:35 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: "Devi Priya" <ijpriya@hotmail.com>, linux-mtd@lists.infradead.org
Date: Wed, 10 Dec 2003 14:41:46 +1300
References: <BAY2-F101rghcdP5VuX00018ea6@hotmail.com>
In-Reply-To: <BAY2-F101rghcdP5VuX00018ea6@hotmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20031210013448.23EA0565C@blood.actrix.co.nz>
Subject: Re:Hardware help with diskonchip millennium!
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> >>The steps for BIOS is summarised as
> >>1. After DiskOnChip Millennium BUSY# signal is negated, the CPU fetches
> >>the Reset Vector from
> >>the Boot-Block area, fetches the Boot Code stored there, and starts to
> >>execute the code.
> >>2. Boot Code runs the first part of BIOS, initializing the basic hardware
> >>functionality.
> >>3. Boot Codes loads the rest of the BIOS from the flash memory to the
> >>DRAM, and transfer control
> >>(jumps) there.
> >>4. Chip Select of DiskOnChip Millennium is remapped from Reset Vector to
> >>BIOS expansion area.
> >>5. CPU executes the rest of the BIOS code, including ROM expansion
> >> devices (among them, the
> >>DiskOnChip Millennium itself).
> >>6. CPU calls OS bootstrap loader (INT19).
> >>7. OS is loaded, and recognizes the DiskOnChip Millennium as the boot
> >>device.
> >>8. OS loads the application code from the DiskOnChip Millennium and
> >>executes it.
> >>9. Application software uses DiskOnChip Millennium exactly as if it were
> >>using a regular hard
> >>disk.
> >>
> >>In step 4 why is this remapping done? Is this mapping done in hardware?

An x86 boots from the reset vector (like any CPU I guess). This is defined to 
be the top 16 bytes of the address space on x856. Normally, this justs to 
early-days BIOS code which is nearby. The DOC Millenium wants to be there to 
provide the boot code.
However, the BIOS expansion code needs to run later (after the BIOS has been 
initialised etc). This requires that the appropriate chip select signal gets 
associated with the appropriate address. This is typically done iin one of 
two ways:
* Change the chip select registers to remap the DOC chip select to the BIOS 
expansion address
* Have two chip select signals (one for each area) and use an AND gate or 
whatever to combine them so that either a reset vectos chip select or a bios 
extension chip select result in the DOC being selected.

-- CHarles
