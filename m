Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lWHl-0003u2-00
	for <linux-mtd@lists.infradead.org>; Sun, 01 Sep 2002 16:05:09 +0100
Date: Sun, 1 Sep 2002 17:05:06 +0200 (CEST)
From: =?ISO-8859-1?Q?Henrik_Nordstr=F6m?= <hno@marasystems.com>
To: Mark Meade <mark@lakeshoremicro.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: 48meg DOC
In-Reply-To: <20020901143912.MCJQ12451.rwcrmhc51.attbi.com@there>
Message-ID: <Pine.LNX.4.44.0209011654210.31089-100000@filer.marasystems.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Great! Will try first thing on Monday. Really dislikes the current ugly
solution with one single partition and the binary m-sys driver for many
reasons.

Do I have to use the GRUB DOC firmware to support multiple partitions, or 
will it also work if using the M-Sys DOS driver firmware and loading GRUB 
via MBR?

Not yet sure if I will go for the GRUB firmware or booting GRUB via the
MBR and the M-Sys DOS driver, but having multiple partitions is a definite
win!

If I use the GRUB firmware, is there any difference if I install it using 
the M-Sys DFORMAT utility or by using the doc_loadbios Linux command? 
Would be great if DFORMAT could be used for the initial install, and 
doc_loadbios for field upgrades.

Do the Linux NFTL driver support any forms of wear level hinting like the 
M-Sys driver does for FAT partitions to avoid copying of unused blocks?

Regards
Henrik


On Sun, 1 Sep 2002, Mark Meade wrote:

> The UnitSizeFactor problem will go away if you reformat the DoC with the 4.2 
> version of the M-Sys DFORMAT utility.  This version is still available at 
> www.m-sys.com.
> 
> After reformatting with 4.2, you should be able to use Grub for booting, and 
> also have multiple partitions on the DoC.
> 
> Mark
> 
> Henrik Nordstrom wrote:
> > But I have not yet figured out how to do this in a stable manner. GRUB does
> > not like my DOC chips complaining about a UnitSizeFactor parameter in the
> > NFTL header (perhaps because of them being formatted by the new firmware? 
> 
