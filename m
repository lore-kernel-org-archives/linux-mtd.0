Subject: Re: Flash I/O not enabled in MSR_DIVIL_BALL_OPTS
From: David Woodhouse <dwmw2@infradead.org>
To: Rick van Rein <rick@groengemak.nl>
In-Reply-To: <20091130084004.GE23351@phantom.vanrein.org>
References: <20091130084004.GE23351@phantom.vanrein.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 02 Dec 2009 18:11:10 +0000
Message-ID: <1259777470.3744.484.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-11-30 at 08:40 +0000, Rick van Rein wrote:
> Hello,
> 
> Thanks a lot for the detailed FAQ + documentation on the Linux MTD
> subsystem.  It brought me from a novice on the Linux implementation
> to someone who feels in control.
> 
> I am working to get a modest Linux distro going on what originally was
> a 7 Watt thin client running Win XPe.  Since IDE is amazingly slow (it
> consumes 80% CPU time in IRQ handlers) I wanted to try direct access
> through JFFS2 to the NAND chips.
> 
> Processor:	Geode GX
> Chipset:	Geode CS5535
> NAND flash:	Toshiba TC58DVM92A1FT00 (512 MB x8, a 3 to 5 of them)
> Controller:	If there's a CompactFlash ctlr it is concealed from me
> Linux kernel:	2.6.31.6 without IDE but with CS553x NAND and JFFS2
> 
> When I boot this setup (over PXE), it reports:
> 
> CS553x NAND controller: Flash I/O not enabled in MSR_DIVIL_BALL_OPTS
> 
> Tracing this back in the code, this refers to an either-IDE-or-flash
> setting in the MSR that was either setup by RESET or the BIOS.  The
> hardware works like that, the pins for IDE and NAND flash are multiplexed.
> I am not sure in XPe would see this, so if this flag is meaningful...?
> 
> What surprised me was that the kernel contained no ways of setting this
> value to inform the NAND driver that it can play freely; is this because
> the hardware is wired purely for IDE operation?  Or does the slow IDE
> responsiveness indicate that it is in fact flash, but not properly setup?
> 
> Is there a proper way of setting this flag without patching the kernel?

If you have the NAND hardware connected, then surely your firmware ought
to be setting the MSRs appropriately?

See http://david.woodhou.se/olpc-enable-nand.c for an example of how to
make it work if your firmware doesn't, though.

Of course, we didn't need that hack any more as soon as we switched to
OpenFirmware.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
