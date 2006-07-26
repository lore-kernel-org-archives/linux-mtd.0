Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G5dMN-000694-TM
	for linux-mtd@lists.infradead.org; Wed, 26 Jul 2006 07:59:12 +0100
Subject: Re: [PATCH] PNX8550 NAND flash driver
From: Thomas Gleixner <tglx@linutronix.de>
To: Jurgen <jurgen.parmentier@telenet.be>
In-Reply-To: <44C66437.9030402@telenet.be>
References: <43A2F819.1040106@ru.mvista.com> <43C69EC2.2070601@mvista.com>
	<43F1D439.60205@ru.mvista.com> <1152525196.30929.11.camel@localhost>
	<44C66437.9030402@telenet.be>
Content-Type: text/plain
Date: Wed, 26 Jul 2006 09:02:53 +0200
Message-Id: <1153897373.26845.77.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Todd Poynor <tpoynor@mvista.com>,
	"Vladimir A. Barinov" <vbarinov@ru.mvista.com>,
	linux-mtd@lists.infradead.org, linux-mips@linux-mips.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-07-25 at 20:34 +0200, Jurgen wrote:
> Root cause of the problem lies within the early implementation of the 
> low-level NAND commands. There was a severe risk that the PCI accesses 
> were stalled because of a Read Status command for the NAND Flash. This 
> Read Status was launched immediately after program/erase command. The 
> hardware itself will wait for the Ready/Busy to be high and only then 
> launch the Read Status command. This behavior caused timeout on the 
> internal bus because PCI was unable to use the pins during this wait.

The hardware design is broken. Status Read can be requested while R/B is
low. See NAND datasheets.

> If this problem was coinciding with an ISR that tried to perform a PCI 
> status register, then this PCI access could possibly timeout (because 
> the PCI pins were already claimed for the XIO access that is depending 
> on the RBY signal).
> 
> Since the problem only showed during the PCI device ISR, the 
> quick'n'dirty hack was to disable interrupts during XIO accesses.
> 
> A better fix that should be available somewhere, is to improve the 
> low-level NAND driver that will first check the status of the Ready/Busy 
> line and only THEN launch the Read NAND Status command...

Thats not an improvement. Thats a hack for your broken hardware. You'd
burden the R/B check on every sane hardware out there.

You can add the R/B check to the chip->cmd_ctrl() function of your board
driver.

	tglx
