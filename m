Received: from ns0.direkt-kfki.hu ([195.228.103.151] helo=mail.direkt-kfki.hu)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LnDe4-0001ni-J9
	for linux-mtd@lists.infradead.org; Fri, 27 Mar 2009 15:07:04 +0000
Received: from mail.direkt-kfki.hu (localhost [127.0.0.1])
	by dirweb.direkt-kfki.hu (Postfix) with ESMTP id 39CCE1208528
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Mar 2009 16:06:54 +0100 (CET)
Received: from [192.168.200.50] (unknown [192.168.200.50])
	by mail.direkt-kfki.hu (Postfix) with ESMTP id EAC28120852A
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 Mar 2009 16:06:49 +0100 (CET)
Message-ID: <49CCEB89.1050906@direkt-kfki.hu>
Date: Fri, 27 Mar 2009 16:06:49 +0100
From: =?ISO-8859-2?Q?Zach=E1r_Bal=E1zs?= <bzachar@direkt-kfki.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: nand driver help
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a pxa270 based board, and I try to create the nand driver for the 2.6.28-7 main kernel... On this board, the nand flash is connected directly to the pxa27x PCMCIA socket's pins... (see this
pdf: http://pubs.gumstix.org/documents/PXA%20Documentation/PXA270/PXA270%20Connecting%20NAND%20Flash%20%5B28014402%5D.pdf)

quote from the pdf:
Signal Mapping
The PXA27x processor PCMCIA interface can be mapped approximately to NAND signals. The
PCMCIA interface was selected because of the many available timing options and because using
dedicated PCMCIA memory signals such as pCE1, nPIOR, and PKTSEL minimize the amount of
extra signal transitions the NAND Flash sees while other memory-bus operations are occurring.
Different signals and connections are available from the ones described here; however, be aware
that different types of NAND can be sensitive to being connected to an active memory bus. In
worst cases, more buffer logic may be needed to shield a NAND chip from extraneous memory-bus
signal transitions.
  . Connect the NAND IO pins to the PXA27x memory-controller data pins, D0 to D7 or D0 to
     D15. This connections lets the processor write the preferred command and address values to
     the IO pins, and reads back the results over these same pins.
  . Connect the NAND CE signal to the PXA27x PCMCIA nPCE1 signal. To prevent erroneous
     nPCE1 assertion during system reset, ensure this signal has a 4.7K pullup.
  . Connect the NAND AL signal to a PXA27x address pin to allow the AL signal to be a 1 or 0,
     depending on the PCMCIA address being accessed. For example, when connecting the NAND
     AL signal to PXA27x MA20, accesses to PCMCIA IO address 0x0010_0000 would be
     decoded as a NAND address (AL=1) operation.
  . Connect the NAND CL signal to the PXA27x PCMCIA PSKTSEL signal to allow software to
     perform NAND command operations (CL=1) by accessing the PCMCIA address space for
     PCMCIA Card 1. All other software NAND operations (CL=0) are performed by accessing
     the PCMCIA address space for PCMCIA Card 0.
  . Connect the NAND R/B signal to a PXA27x GPIO pin. This signal usually is an open drain
     signal and needs a pull-up resistor on most types of NAND Flash.
  . Connect the NAND WP signal to a PXA27x GPIO for software-controlled write protection.
     Alternately, this signal can be tied high to disable write protection entirely.
  . Connect the NAND WE signal to the PXA27x nPIOW signal.
  . Connect the NAND RE signal to the PXA27x nPIOR signal.
  . Tie the PXA27x PCMCIA signal nPWAIT high.
  . To connect 16-bit wide NAND chips, tie the PXA27x PCMCIA signal nIOIS16 low to ensure
     PCMCIA IO transactions are treated as 16-bit transactions. For 8-bit wide NAND chips, tie the
     nIOIS16 signal high to make the PCMCIA memory controller perform 8-bit operations only.


On my board the NAND AL signal is connected to MA20 so if I "access" to 0x2010_0000 (PCMCIA0 address: 0x2000_0000) it should decoded as AL=1 operation.
If I right, if I "access" to the PCMCIA1 address (PCMCIA1 address: 0x3000_0000) it should decoded as a CL=1 operation.
The R/Bn (ready_notbusy) signal is connected to GPIO55 and the WP signal is connected to GPIO56.

I write this hwcontrol function for my board's cmd_crtl function, but I think it isn't work(bdevelb_ALE_io_base=ioremap(0x20100000, 0x1000),bdevelb_CLE_io_base=ioremap(0x30000000, 0x1000)):
static void bdevelb_nand_hwcontrol(struct mtd_info *mtd, int cmd, unsigned int ctrl)
{
	struct nand_chip *chip = mtd->priv;

	if (ctrl & NAND_CTRL_CHANGE) {
                if ( ctrl & NAND_ALE )
                        writeb(0xff, bdevelb_ALE_io_base);
                if ( ctrl & NAND_CLE )
                        writeb(0xff, bdevelb_CLE_io_base);
        }

        if (cmd != NAND_CMD_NONE)
                writeb(cmd, chip->IO_ADDR_W);
}

Is this function good for this connection scheme?
What is it mean "access" to an address? Can be enough a readb funtion?

regards,
Balazs
