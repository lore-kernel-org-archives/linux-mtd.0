Received: from ns.sysgo.de ([213.68.67.98] helo=rob.devdep.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14zhYt-0007wC-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 May 2001 17:20:39 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: "Alexander Melichenko" <AlexanderM@lrpeople.com>
Subject: Re: SC520 CDP - problem with booting from BIOS Flash
Date: Tue, 15 May 2001 17:59:19 +0200
Content-Type: text/plain
References: <003f01c0dd4c$11102e60$5502010a@lrpeople.com>
In-Reply-To: <003f01c0dd4c$11102e60$5502010a@lrpeople.com>
Cc: "Vipin Malik" <vipin.malik@daniel.com>, <linux-mtd@lists.infradead.org>,
        <s_krishna@in.ibm.com>
MIME-Version: 1.0
Message-Id: <01051518243100.02247@rob>
Content-Transfer-Encoding: 8bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Die, 15 Mai 2001 you wrote:

> After reset I see changing some digits on the LEDs but kernel is not
> booting.
> 
> Why kernel doesn't booting? This kernel boots good ( with root fs into
> mtdblock0 ) when I use HDD.
> Any ideas?
> 
The lstart16.asm code does not do a full board initialization. It does not
initialize the Super I/O chip and therefore, the first two serial ports of the
board, the floppy disk and the keyboard controller will not work. Also, there
is no BIOS to initialize any VGA card that might be there. So, if your kernel
uses the usual VGA console, it might even boot, but you won't see anything
other than the LEDs. The only console devices that are available in this case
are the two built-in serial ports of the SC520. So, your kernel has to be
configured for a serial console. I have never used the two built-in serial
ports on the SC520CDP. I believe one of them is hardware-wired for RS-422
operation, so you can not connect it to a normal terminal.

[BTW: In the meantime I have managed to implement my ROLO bootloader on the
SC520 CDP. It can boot Linux out of the DIP flash and even out of one of the
8MB flash banks. It  _does_ initialize the Super I/O. It does not intialize
any VGA card, so that problem remains. It needs some more documentation in
order to be usable by mere mortals. I want to make this new version publicly
available sometime in the near future, however, right now I am very busy trying
to keep some almost impossible deadlines, so I don't have time for this :-(

I can send you the full source code if you think it will help you, but I will
not be able to answer any questions you might have for the next -say- three
weeks.]

Cheers

Rob



----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
