Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEa8V-0002yv-TV
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 17:12:51 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Nicolas Pouillon <nipo@ssji.net>
In-Reply-To: <20041004224700.422a9f2c.nipo@ssji.net>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
	<20041002155505.083d8440.nipo@ssji.net>
	<1096749729.21297.54.camel@thomas>
	<20041003030653.2e0452a7.nipo@ssji.net>
	<1096768161.21297.129.camel@thomas>
	<20041003221827.7bea56fc.nipo@ssji.net>
	<1096877111.21297.208.camel@thomas>
	<20041004183827.7bcc5071.nipo@ssji.net>
	<1096912750.21297.433.camel@thomas>
	<20041004224700.422a9f2c.nipo@ssji.net>
Content-Type: text/plain
Message-Id: <1096923898.21297.485.camel@thomas>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 23:04:58 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch !
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-10-04 at 22:47, Nicolas Pouillon wrote:
> > The configuration register reflects the state of the IF_CFG pin.
> 
> I assume this is an hardware configuration.
> Would it be possible to change 16bit access to 32bit in MTD chip while
> running?

RTFM !!!!

Configuration  Register
Type: Read/Write (except bit 7, which is Read Only)
7 IF_CFG (Interface Configuration). Reflects the state of the IF_CFG
input pin.

That's a bit to read what the hardware is configured for. I doubt that
there is a possibility to reconfigure the PCB by software. :)

> I tried to reconfigure PXA bank mode to 32 bit mode: probing no more
> works, and mmio transfers dont crash any more...

That's really surprising that it works no more.

> So if I understood well, PXA just makes kernel crash if accessing a
> 16bit mapped zone with 32bits words (quite normal, in fact, but not
> straightforward for me as I'm learning at the same time ;)

This is either a configuration problem or a bug/feature of the MTD code.
Which driver / part of the MTD framework is the source of this problem ?

> As I saw different bug reports/issues on MLs with this kind of thing
> (PXA kernel crashing while probing mtd), shouldn't a #warning, or a
> printk just before probing annoucing the issue could be added ?

He ? An Oops or a BUG are warning enough, that something is going wrong.
If we put for everything what can go wrong a warning into the kernel
then the majority of the kernel source will be printk and string
constants instead of functional code.

tglx
