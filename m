Received: from [213.239.205.147] (helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BnkLJ-00028i-5F
	for linux-mtd@lists.infradead.org; Thu, 22 Jul 2004 16:39:06 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1090512202.4089.10.camel@localhost.localdomain>
References: <33587.128.93.9.76.1090511579.squirrel@smis.inria.fr>
	<1090512202.4089.10.camel@localhost.localdomain>
Content-Type: text/plain
Message-Id: <1090528791.2663.0.camel@lap02.tec.linutronix.de>
Mime-Version: 1.0
Date: Thu, 22 Jul 2004 22:39:51 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: emulator for NAND Flash memory
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-07-22 at 18:03, David Woodhouse wrote:
> On Thu, 2004-07-22 at 17:52 +0200, Cosmin Cremarenco wrote:
> > Hello to everyone
> > 
> > I'm trying to develop a prototype based on the NAND flash memories,
> > but unfortunately I don't have the board yet.
> > 
> > My question: is there an emulator of NAND Flash in Linux,
> > and can it be used directly by the mtd core?
> 
> There isn't, although it shouldn't be so hard to update mtdram to do it.
> Or you could just use a DiskOnChip :)

I think there was one around, which was used during the development of
YAFFS.
Charles, any pointers ?????

tglx
