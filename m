Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CwPlV-0002rw-PV
	for linux-mtd@lists.infradead.org; Wed, 02 Feb 2005 14:02:15 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Alex <pevnev@juno.com>
In-Reply-To: <20050202.102451.25662.2542@webmail18.lax.untd.com>
References: <20050202.102451.25662.2542@webmail18.lax.untd.com>
Content-Type: text/plain
Date: Wed, 02 Feb 2005 20:02:08 +0100
Message-Id: <1107370929.21196.580.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: RE: CONFIG_MTD_PHYSMAP_START= physical address of NOR FLASH
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-02-02 at 18:24 +0000, Alex wrote:
> CONFIG_MTD_PHYSMAP_START=0x04000801 (this is higher than RAM !)

1. It never starts on an odd address
2. It's inside the reserved physical address space of RAM

> So (based on the data given to me)
> should I use 0x00000801 as a physical
> start address of my NOR FLASH chip ?
> (i got this info from h/w people in Italy)

See below.

> The initial boot provides the following:
> Memory map:
> /* Chip Select FLASH Normal */
> #define BR0_VAL 0x04000801  /* Offset=0x04000000 PS=16 GPCM Valid=1 */
> #define OR0_VAL     0xFFC00160  /* OK */

The value you are using is the value, which is programmed into the BR0
register of the CPU. 
BRx = Bank Register for chipselect x
ORx = Option Register for chipselect x
The values in those registers define the startaddress, buswitdh, size,
timings for the chipselects. So using those values is definitely not a
good idea. Of course you can decode the values in the registers to get
your real address values. 

I have no datasheet handy, but you should definitely read it :)

tglx
