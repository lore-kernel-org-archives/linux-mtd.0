Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A3ukc-0002fc-Ab
	for <linux-mtd@lists.infradead.org>; Mon, 29 Sep 2003 10:55:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: daniel@dmhome.net
In-Reply-To: <20030929093754.7956.qmail@mailshell.com>
References: <1064826976.29857.116.camel@host35>
	 <1064827342.29569.17.camel@hades.cambridge.redhat.com>
	 <20030929093754.7956.qmail@mailshell.com>
Message-Id: <1064829280.12791.3.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 29 Sep 2003 10:54:41 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: raw nand on x86 - reference boards
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-09-29 at 17:37 +0800, daniel@dmhome.net wrote: 
> I am familiar with those devices(we are using them in our current
> designs), we are looking to replace them with raw nand - As you
> recomended me a couple of months ago, in a discussion we had on this
> list, concerning jffs2 on diskonchip devices. 
> So actually, the design people at my company are ready to switch to
> using this kind of flash - only I'll need some working sample to
> convince them, especially with regard to booting. 
You can just use the DiskOnChip as raw NAND -- look at 
drivers/mtd/nand/diskonchip.c

It uses software ECC (although I'm actually going to fix that before the
new driver obsoletes the standalone doc2000 driver), and just waggles
the NAND control lines as a real 'raw NAND' solution would.

For booting you do need some 'real' NOR flash, although presumably you
have that for your BIOS anyway. The DiskOnChip Millennium could be used
as a 'total' solution, replacing the BIOS flash too -- see LinuxBIOS for
examples of this.

Pick a bootloader to stick into flash with the BIOS. Add NAND flash and
JFFS2 support, and make it can load and run a kernel from the JFFS2 file
system (or even a separate raw partition of the flash).

During development, you could even use the DiskOnChip's mechanism for
loading BIOS extensions -- see how it's done for Grub. You can worry
about putting it on the system board with the BIOS later.

RedBoot might be an ideal candidate for this since the JFFS2 code
already runs in eCos; you just have to add the NAND support and the
trivial command handler to actually load a file into memory from the
file system.

-- 
dwmw2
