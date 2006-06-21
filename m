Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Ft7Gq-00068x-33
	for linux-mtd@lists.infradead.org; Wed, 21 Jun 2006 19:17:45 +0100
Subject: Re: FAT vs jFFS2 for NAND.
From: Thomas Gleixner <tglx@linutronix.de>
To: Claudio Lanconelli <lanconelli.claudio@eptar.com>
In-Reply-To: <44995486.6060000@eptar.com>
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
	<4497DCA6.2080006@eptar.com>
	<1150806658.17609.55.camel@hades.cambridge.redhat.com>
	<4497F758.5090708@eptar.com>
	<1150811549.6780.192.camel@localhost.localdomain>
	<44982FC3.8080501@eptar.com>
	<1150825284.6780.270.camel@localhost.localdomain>
	<44995486.6060000@eptar.com>
Content-Type: text/plain; charset=utf-8
Date: Wed, 21 Jun 2006 20:19:00 +0200
Message-Id: <1150913940.25491.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Claudio,

On Wed, 2006-06-21 at 16:15 +0200, Claudio Lanconelli wrote:
> Are you sure about block 0 marked bad for protection? I read in
> smartmedia specification by Toshiba that SSFDC header called CIS/IDI is
> located on the first good block. Here the sentence:
> 
> "The CIS/IDI Field is placed in physical block 0.
> If physical block 0 is found to be a defective block, the area is placed 
> in the
> first normal block that is found after physical block 0.
> Irrespective of the page size, only one block is assigned."
> [...]
> "The indication of a defective block and logical block arrangement in 
> the data
> area will be set in the redundancy area.
> In the case of the 512+16 bytes/page models, the 6th byte (byte address 
> 517th)
> in all pages in the redundant section contains two or more “0” bits to 
> indicate
> a defective block."

ok

> My code follow these instructions on the SSFDC header location, is it 
> correct?
> Anyone who knows it for sure?

No, this was just from the top of my head.

> Another question about the ECC placement. I think the MTD default ECC 
> bytes placement
> in the redundant area is not suitable for SSFDC. I found the 
> CONFIG_MTD_NAND_ECC_SMC
> in mtd configuration, but it's not used anywhere in the code. How can 
> the ssfdc_ro layer tell
> to use smartmedia ECC bytes placement?

Well, if you use the device with SmartMedia FAT you probably want to
enable this switch and use the default configuration. I removed that
client supplied ECC scheme setting, as it turned out to be a complete
nightmare.

	tglx
