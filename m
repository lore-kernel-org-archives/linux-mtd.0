Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DtjSC-0001je-Ol
	for linux-mtd@lists.infradead.org; Sat, 16 Jul 2005 05:59:37 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Todd Poynor <tpoynor@mvista.com>
In-Reply-To: <42D76CB8.4050606@mvista.com>
References: <20050715031948.GA22659@slurryseal.ddns.mvista.com>
	<1121412168.24449.98.camel@tglx.tec.linutronix.de>
	<42D76CB8.4050606@mvista.com>
Content-Type: text/plain
Date: Fri, 15 Jul 2005 15:57:48 +0200
Message-Id: <1121435869.24449.105.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND bbt build reads wrong oob data
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-07-15 at 00:58 -0700, Todd Poynor wrote:
> Thomas Gleixner wrote:
> > On Thu, 2005-07-14 at 20:19 -0700, Todd Poynor wrote:
> > 
> > That's pretty strange. Which chip type are you using ? 
> 
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x45 (Samsung NAND 32MiB
> 1,8V 16-bit)

I know whats the source of the problem.

The read_oob code is not handling 16 bit correctly. The nand_bbt code
wants to read 1 byte at an odd address which does not work for 16 bit
access.

I committed a similar workaround as you suggested, jst without the
builtin long read OOPS :)

tglx
