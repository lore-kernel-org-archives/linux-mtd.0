Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19N6GC-0007tM-88
	for <linux-mtd@lists.infradead.org>; Tue, 03 Jun 2003 08:31:08 +0100
Date: Tue, 3 Jun 2003 09:31:31 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Vikram Mehta <vm6580@hotmail.com>
Message-ID: <20030603073130.GA23334@wohnheim.fh-wedel.de>
References: <Law14-OE16a0SNv4hUr0002f2eb@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law14-OE16a0SNv4hUr0002f2eb@hotmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: carolyn.j.smith@exgate.tek.com
cc: mtd <linux-mtd@lists.infradead.org>
cc: uclinux-dev@uclinux.org
Subject: Re: AMD29DL323GB flash chip support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 3 June 2003 10:36:29 -0700, Vikram Mehta wrote:
> 
> I was going through the code in files in drivers/mtd directory
> 
> In jedec_probe.c
> in amd_flash_info jedec_table structure, I did not find the chip my board
> has i.e. AMD29DL323GB.
> So does that mean MTD will not work on my chip. I am asking this becuase
> kernel built with MTD and JFFS2 support does not boot.

The first few lines in jedec.c say this:
/* JEDEC Flash Interface.
 * This is an older type of interface for self programming flash. It is 
 * commonly use in older AMD chips and is obsolete compared with CFI.

In other words, don't bother fixing jedec, if it doesn't work.  Try
again with cfi and if that doesn't work either, fix cfi or ask for
help on the list.

Carolyn, this applies to your problem as well.  There have been other
developers working with 64bit flashes, searching the archives you
should find some information or at least some names.

Jörn

-- 
Write programs that do one thing and do it well. Write programs to work
together. Write programs to handle text streams, because that is a
universal interface. 
-- Doug MacIlroy
