Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ZuAQ-0005WD-17
	for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2003 16:14:06 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HHP00L47OZ0IV@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 08 Jul 2003 17:13:49 +0200 (MEST)
Date: Tue, 08 Jul 2003 18:11:05 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <200307081405.56822.jbeisert@eurodsn.de>
To: jbeisert@eurodsn.de
Message-id: <200307081811.05797.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <200307081001.10555.jbeisert@eurodsn.de>
 <200307081242.54207.tglx@linutronix.de>
 <200307081405.56822.jbeisert@eurodsn.de>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: NAND-Flash ECC data not used
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 08 July 2003 14:05, Juergen Beisert wrote:
> Am Dienstag, 8. Juli 2003 12:42 schrieben Sie:
> > On Tuesday 08 July 2003 10:01, Juergen Beisert wrote:
> >
> > Have you enabled CONFIG_JFFS2_NAND ?
>
> I cannot find any source- or "Config.in" file that uses or defines this
> macro. Not in my 2.4.21pre4 nor in the mtd snapshot (from July 1. 2003).
>
> > This happens on boot up too, if you have not given the fs type in the
> > commandline and the kernel tries to mount the partition with ext2 first.
> > It should not happen with jffs2.
>
mtd/fs/Config.in contains
dep_tristate 'Journalling Flash File System (JFFS) support' CONFIG_JFFS_FS 
$CONFIG_MTD
if [ "$CONFIG_JFFS_FS" = "y" -o "$CONFIG_JFFS_FS" = "m" ] ; then
   int 'JFFS debugging verbosity (0 = quiet, 3 = noisy)' 
CONFIG_JFFS_FS_VERBOSE 0
   bool 'JFFS stats available in /proc filesystem' CONFIG_JFFS_PROC_FS
fi
dep_tristate 'Journalling Flash File System v2 (JFFS2) support' 
CONFIG_JFFS2_FS $CONFIG_MTD
if [ "$CONFIG_JFFS2_FS" = "y" -o "$CONFIG_JFFS2_FS" = "m" ] ; then
   int 'JFFS2 debugging verbosity (0 = quiet, 2 = noisy)' 
CONFIG_JFFS2_FS_DEBUG 0
   bool 'JFFS2 support for NAND chips' CONFIG_JFFS2_FS_NAND
fi

This is patched into the linux/fs/Config.in by the patchin.sh script, which 
can be found in mtd/patches. It's recommended to use this script.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
