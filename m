Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DyPL3-0007Fg-4C
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 03:31:33 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: DataCom - =?ISO-8859-1?Q?Virg=EDlio?= <virgilio@datacom-telematica.com.br>
In-Reply-To: <200507281840.03577.virgilio@datacom-telematica.com.br>
References: <200507281640.54771.virgilio@datacom-telematica.com.br>
	<1122584803.26146.55.camel@tglx.tec.linutronix.de>
	<200507281840.03577.virgilio@datacom-telematica.com.br>
Content-Type: text/plain; charset=ISO-8859-1
Date: Fri, 29 Jul 2005 09:35:44 +0200
Message-Id: <1122622544.26146.59.camel@tglx.tec.linutronix.de>
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

On Thu, 2005-07-28 at 18:40 -0300, DataCom - Virgílio wrote:
> > It is not and can not be the responsibility of the NAND driver to handle
> > this. Where to should it write the data ? The existing data _cannot_ be
> > overwritten, without erasing the whole eraseblock and the implied risk
> > of loosing _ALL_ the data on the block due to a powerfail.
> >
> > The NAND driver returns the corrected data and an appropriate error code
> 
> Maybe I'm missing something, but the function nand_do_read_ecc returns 
> -EBADMSG only if an uncorrectable error is detected by nand_correct_data. If 
> just one bit is flipped, nand_correct_data corrects it, and nand_do_read_ecc 
> returns 0.

Damn, you're right. I check into this.

tglx
