Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSNur-0007Qe-7B
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 17:59:46 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Marc Singer <elf@buici.com>
In-Reply-To: <20041111220146.GA1898@buici.com>
References: <20041111220146.GA1898@buici.com>
Content-Type: text/plain
Date: Thu, 11 Nov 2004 23:51:13 +0100
Message-Id: <1100213473.5074.81.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: cmdlineparts and chip initialization order
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-11-11 at 14:01 -0800, Marc Singer wrote:
> With a command line like this:
>   console=ttyAM0 root=/dev/hda1 mtdparts=norflash:2m(boot),-(root);nandflash:32k(apex)ro,-(root)
> I am able to initialization partitions for the NOR flash, but not the
> NAND flash.  It look like the problem is that the NOR flash driver is
> initializing before the mtdparts command line parsed, but the NAND
> flash isn't.
> Moving the cmdlinepart.o file to the end of the list appears to
> prevent the command line from being parsed.

The commandline parition code must be registered as a partition parser
before any mapping driver is initialized. So it's not surprising that it
does not work when it is linked in last, as the init functions are
called in link order 

> BTW, it looks like none of the other NAND drivers expect a command
> line partition setup.  Has anyone else tried?

It has nothing to do with NOR or NAND. The driver calls a parition
parser.

Provide more detailed information, please. Switch on MTD debugging and
add some MTD_DEBUG in the relevant places.

tglx
