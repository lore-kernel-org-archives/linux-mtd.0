Received: from dcardamo.ott.istop.com ([66.11.174.105] helo=sparky.hld.ca)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19lsSq-0002hp-Pz
	for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2003 16:50:37 +0100
Received: from sparky.hld.ca (localhost [127.0.0.1])
	by sparky.hld.ca (8.12.9/8.12.9/Debian-1) with ESMTP id h7AFoNCP021902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2003 11:50:23 -0400
Received: (from dan@localhost)
	by sparky.hld.ca (8.12.9/8.12.9/Debian-1) id h7AFoNkH021900
	for linux-mtd@lists.infradead.org; Sun, 10 Aug 2003 11:50:23 -0400
Date: Sun, 10 Aug 2003 11:50:23 -0400
From: Dan Cardamore <dan.cardamore@officeserver.ca>
To: linux-mtd@lists.infradead.org
Message-ID: <20030810155023.GA21857@officeserver.ca>
References: <20030809053345.GA27061@officeserver.ca>
	<1060504021.29776.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1060504021.29776.5.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii
Subject: Re: Problem mounting JFFS2 as root, works for ext2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 10, 2003 at 09:27:04AM +0100, David Woodhouse wrote:
> On Sat, 2003-08-09 at 06:33, Dan Cardamore wrote:
> 
> > If I boot using JFFS2 as my root, I get:
> > <snip>
> > VFS: Mounted root (jffs2 filesystem)
> > mount_devfs_fs(): unable to mount devfs, err: -2
>   <...>
> > Warning: unable to open an initial console.
> > Kernel panic: No init found.  Try passing init= option to the kernel
> > 
> > If I boot from /dev/hda3 as my root (ext2), I get everything working
> > perfect.
> 
> Does it bitch about failing to mount devfs in the case where you mount
> ext2-root too?

No, everything boots properly when I ext2.  I should add some more info:
 - When it mounts the jffs2 FS, it does it instantly which means that it
   can't be mounted.  Mounting it properly takes about 20 seconds.
 - In my initrd linuxrc, I can run:
   mount -t jffs2 /dev/mtdblock/1 /
   and it works just fine.  Then the kernel unmouts / and tries to mount
   it again.

I've gotten past the problem by making my /dev/hda1 boot partition a
mini-root with just busybox and it then mounts the JFFS2 partition and
pivot_root's to it.

If anyone has an idea though as to why the kernel can't mount it, I'd
love to skip that kluge.

Thanks,

Dan

--
Dan Cardamore                              dan.cardamore@officeserver.ca
Cell: (613)355-8048                        http://www.officeserver.ca
