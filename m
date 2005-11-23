Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EerxO-0001o5-18
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 05:34:32 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: hs@denx.de
In-Reply-To: <AHEILKONAKAEJPHNMOPNKEMACDAA.hs@denx.de>
References: <AHEILKONAKAEJPHNMOPNKEMACDAA.hs@denx.de>
Content-Type: text/plain
Date: Wed, 23 Nov 2005 11:39:24 +0100
Message-Id: <1132742364.32542.122.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: RE: [PATCH]	MTD:	Add support for the PM82x Boards.
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-11-22 at 07:18 +0100, Heiko Schocher wrote:
> > Please use the new DiskOnChip driver in drivers/mtd/nand/ not the old
> > one.
> 
> I use the new driver.
> I made the changes in drivers/mtd/devices/docprobe.c,  because I
> ported it from the 2.4 Kernel. Should I delete this and resubmit
> the patch?

Yes, please.

	tglx
