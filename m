Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bi4Pz-0001bE-Te
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2004 00:52:28 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Amit Shah <amitshah@gmx.net>
In-Reply-To: <ccdut4$do6$2@sea.gmane.org>
References: <ccdut4$do6$2@sea.gmane.org>
Content-Type: text/plain
Message-Id: <1089175560.27262.13.camel@thomas.tec.linutronix.de>
Mime-Version: 1.0
Date: Wed, 07 Jul 2004 06:46:01 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Accessing flash on a PCI card
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-06 at 12:26, Amit Shah wrote:
> I have a PCI card that has Intel Flash. I've cooked up a small driver (the
> host kernel is 2.6.6) that iomaps the base address exported by the PCI BARs
> and can verify that it's an intel flash by doing some config- write and
> read sequences.
> 
> I now want to export the flash to userspace for reading / writing to the
> flash. I guess it would be better to let MTD handle the stuff than me doing
> things all over again. So, how can I access that flash memory over the PCI
> with MTD?

Look at
drivers/mtd/maps/pci.c and other files using PCI in the same folder


Thomas
