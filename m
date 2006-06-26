Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FuuiY-0007OU-BY
	for linux-mtd@lists.infradead.org; Mon, 26 Jun 2006 18:17:47 +0100
Subject: Re: Cannot erase nand flash
From: Thomas Gleixner <tglx@linutronix.de>
To: Steve Finney <saf76@earthlink.net>
In-Reply-To: <26260868.1151341349996.JavaMail.root@elwamui-sweet.atl.sa.earthlink.net>
References: <26260868.1151341349996.JavaMail.root@elwamui-sweet.atl.sa.earthlink.net>
Content-Type: text/plain
Date: Mon, 26 Jun 2006 19:19:20 +0200
Message-Id: <1151342360.25491.424.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2006-06-26 at 10:02 -0700, Steve Finney wrote:
> >Date: Mon, 26 Jun 2006 10:52:43 +0200
> >From: peter.hosten@rwth-aachen.de
> 
> > Unfortunately the mtd-util
> >(flash_eraseall, mtd_debug) is not able to erase the NAND-Flash. I get the
> >error  "./flash_eraseall: /dev/mtd3: MTD Erase failure: Input/output error"
> >(see below)
> 
> >I also dumped the NAND Flash ( see below); may it be possible that it does
> >not work because of the OBB data ( OOB Data: 00 00 00 00 00 00 00 00 00 00
> >00 00 00 00 00 00) ?
> 
> I have seen that error with some versions of mtd-utils when the partition contains a
> bad block, and your dumped OOB would be interpreted as a bad block
> (no 0xFF in byte 5). But, in fact, the flash may have been successfully erased, and Linux
> works reasonably well with bad blocks, so you may be able to just ignore
> the "error".

Err, when oob data are all set to 0, there is something wrong.

	tglx
