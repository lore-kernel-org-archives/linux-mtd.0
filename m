Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CEXEd-0001uC-BU
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 14:06:57 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Nicolas Pouillon <nipo@ssji.net>
In-Reply-To: <20041004183827.7bcc5071.nipo@ssji.net>
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
Content-Type: text/plain
Message-Id: <1096912750.21297.433.camel@thomas>
Mime-Version: 1.0
Date: Mon, 04 Oct 2004 19:59:11 +0200
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

On Mon, 2004-10-04 at 18:38, Nicolas Pouillon wrote:
> > Is the chip configured for 16-bit interface mode ? 
> 
> PXA boots of it and its BOOT_SEL is configured to "Asynchronous 16bit
> ROM", elsewhere, in mem controller, it is configured as "16bit fast
> flash or rom, non burst read". so I assume it is.
> 
> > If yes, there are more tweaks neccecary.
> 
> I can see some NAND_BUSWIDTH_16 options, but how can this be enabled at
> probe time ?

The configuration register reflects the state of the IF_CFG pin.
The NAND_BUSWIDTH_16 option must be set before calling nand_scan, but
AFAICS you must also add 16bit aware read/write... functions for 
doc2001plus.

tglx
