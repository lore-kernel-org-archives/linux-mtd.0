Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QCsD-0007UB-4v
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 22:11:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Chris Marston <chris@wirewerks.com>
In-Reply-To: <20030611173522.NAUK12016.simmts1-srv.bellnexxia.net@there>
References: <20030611173522.NAUK12016.simmts1-srv.bellnexxia.net@there>
Message-Id: <1055365905.16455.114.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Wed, 11 Jun 2003 22:11:45 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: blkmtd.o, JumpTec Dimm-PC woes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 18:35, Chris Marston wrote:
> I'm working on a project using embedded linux on a JumpTec Dimm-PC (the Elan 
> SC520 model). The JumpTec (supposedly) emulates a full PC with IDE, etc, so 
> up till now, we've been able to get by quite happily with a homegrown 
> slack-based distro with a minix FS (the final product will be mostly ro, so 
> wear levelling is unnecessary).  Recently, however, we noticed that our 
> development units were beginning to corrupt data on writes, well before the 
> MTBF of their flash. It turns out that the DIMM-PC carries out a good chunk 
> of its IDE-emulating chicanery in the BIOS. Any OS can happily talk to the 
> fictitious hard drive on its own, but, without the help of the BIOS, it won't 
> properly erase sectors before using them. Thus, because Linux cold-shoulders 
> the BIOS, sectors on the (SanDisk NAND) flash aren't getting erased properly, 
> and, over time, the boards become unusable.

The ideal solution to this is to ditch the crap that pretends to be IDE
_altogether_ and talk to the NAND flash directly. Do you have decent
docs -- is that feasible?

> I'm thinking that the best way to handle this is to use blkmtd.o and then use 
> JFFS2, eraseall, etc. Unfortunately, I can't figure out how or where to talk 
> to the mtd device created by blkmtd.o. I've tried utils/MAKEDEV and 
> /dev/ftla0, and /dev/nftla0, but (eg. eraseall /dev/ftla0) complains that 
> there's no such device or address.

eraseall works on the '/dev/mtdN' or '/dev/mtd/N' device nodes (the
latter with devfs, the former without). In order for those to be
present, you must enable CONFIG_MTD_CHAR.

Don't bother with FTL and NFTL -- those are 'translation layers' for
making flash pretend to be a hard drive, and your flash is already
making that pretence for you.

-- 
dwmw2
