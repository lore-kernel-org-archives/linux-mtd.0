Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DyFWQ-0003jI-N3
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2005 17:02:37 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: DataCom - =?ISO-8859-1?Q?Virg=EDlio?= <virgilio@datacom-telematica.com.br>
In-Reply-To: <200507281640.54771.virgilio@datacom-telematica.com.br>
References: <200507281640.54771.virgilio@datacom-telematica.com.br>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 28 Jul 2005 23:06:43 +0200
Message-Id: <1122584803.26146.55.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Single bit error correction on NAND.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-07-28 at 16:40 -0300, DataCom - Virgílio wrote:
> I have noticed that NAND support on MTD can detect/correct single bit errors 
> in 256 bytes, using software ECC. However, the correct data is not written 
> back to flash. In other words, the bit stays "flipped" in flash. Isn't that 
> dangerous? I mean, if another bitflip occurs in the same 256 bytes, we won't 
> be able to correct by software ECC...
> 
> Am I missing something here?

Yes. 

It is not and can not be the responsibility of the NAND driver to handle
this. Where to should it write the data ? The existing data _cannot_ be
overwritten, without erasing the whole eraseblock and the implied risk
of loosing _ALL_ the data on the block due to a powerfail.

The NAND driver returns the corrected data and an appropriate error code
and the calling (e.g. filesystem) driver has to deal with the data
copying or whatever the developer has decided to be the correct
solution.

The NAND driver provides only the lowest level of access to the flash
device.

tglx
