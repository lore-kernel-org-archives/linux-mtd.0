Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197Ztk-0001m8-W7
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 12:55:49 +0100
Date: Mon, 21 Apr 2003 13:55:44 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jeremy Bowen <Jeremy.Bowen@opennw.com>
Message-ID: <20030421115544.GB9550@wohnheim.fh-wedel.de>
References: <DEA23DB61B62D4118B5900508B323B8401055535@OPENMAIL>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DEA23DB61B62D4118B5900508B323B8401055535@OPENMAIL>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
cc: "'dwmw2@infradead.org'" <dwmw2@infradead.org>
Subject: Re: Unable to write to some JFS partitions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 April 2003 08:40:17 +1200, Jeremy Bowen wrote:
> 
> > 1. Don't use JFFS, use JFFS2.

seconded. use jffs only if you know what you're doing.

> OK. But I think there is an underlying problem with what I've currently got
> that I'd quite like to understand. Why does one JFFS partition work fine
> while the 2 others I try, don't ?

Can you make sure the underlying problem is not in JFFS? If not, few
people will care.

> > 2. Don't attempt to use partitions which have fewer free 
> > blocks than are required to make progress --
> 
> How many free blocks are required to make progress ?

Five for JFFS2, but this may get a little more dynamic. For NOR,
things will definitely break below two and will always work with five.
Reports with anything below five are rare, most people are too polite
to be the first and try it. :)

> > combine all 
> > your file system space into one JFFS2 partition. 
> 
> Is this the "mtdconcat" functionality ?

Yes, but if the partitions are adjacent in flash, you don't even need
it.

> Actually I'm developing on a board with 8Mb Flash but the production units
> will only have 4Mb so the partitions I've defined are somewhat artificial.
> 
> Do I need 2 free flash sectors in order to us JFFS ?

Could be, check it yourself.

> > Note that there exist bootloaders which can boot
> > from JFFS2 so you can put the kernel in there too.

David, do you have a longer list than grub and ecos? Just curious.

> > 3. eraseall works on the /dev/mtd character devices, not the block 
> >    devices.
> 
> bash-2.05# eraseall /dev/mtdblock/7
> eraseall: /dev/mtdblock/7: unable to get MTD device info
> bash-2.05# eraseall /dev/mtd/7
> eraseall: /dev/mtd/7: unable to get MTD device info
> 
> Eraseall doesn't seem to work for me whatsoever.

What does "ls -l /dev/mtd/7" say? The problem should be somewhere
else, but you never know.

Jörn

-- 
Fantasy is more important than knowlegde. Knowlegde is limited,
while fantasy embraces the whole world.
-- Albert Einstein
