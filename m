Received: from [207.209.118.131] (helo=msi-ex6.m-sys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177Iyx-0007c8-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 17:47:31 +0100
Message-ID: <AEA9DCA73595D411A6D4009027DE9C5E019BFC18@MSI-EX6>
From: Vadim Khmelnitsky <VadimK@m-sys.com>
To: "'gleixner@autronix.de'" <gleixner@autronix.de>,
	manningc2@actrix.gen.nz, David Woodhouse <dwmw2@infradead.org>,
	franck.fleter@netbricks.com
Cc: linux-mtd@lists.infradead.org
Subject: RE: Boot from NAND flash ???
Date: Mon, 13 May 2002 09:47:59 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

[Thomas]
There's another important limitation. Who guarantees you, that your 
"boot-page" does not get bad or is a bad block already. That's the reason, 
why DOC has 4 blocks with the same code.

[Vadim]
Actually, in Diskonchip Millennium 8MB we have first erasable unit
guaranteed to be good .
We do have two copies of a boot-code stored one after another in page 0 and
1 of the first erasable unit .

Vadim

-----Original Message-----
From: Thomas Gleixner [mailto:gleixner@autronix.de]
Sent: Mon, May 13, 2002 4:19 AM
To: manningc2@actrix.gen.nz; David Woodhouse;
franck.fleter@netbricks.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Boot from NAND flash ???


On Monday, 13. May 2002 12:11, Charles Manning wrote:

> There are however two mechanisms to get around this:
> * Some people and micros implement a "data pump" state machine to extract
> an executable sequence from a NAND device.
> * Some of the newer NAND devices can be accessed directly from the bus and
> can do the job of a boot ROM.
>
> There is however a limitation to both of these. The NAND can only be
> accessed sequentially (it is not random access like NOR) which limits the
> types of instruction the boot code can perform. In particular it can't
> branch or fetch from elsewhere in ROM.

There's another important limitation. Who guarantees you, that your 
"boot-page" does not get bad or is a bad block already. That's the reason, 
why DOC has 4 blocks with the same code. 

-- 
Thomas
___________________________________
autronix automation GmbH
http://www.autronix.de gleixner@autronix.de

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
