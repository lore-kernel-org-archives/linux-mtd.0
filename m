Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19llXn-00023D-EE
	for <linux-mtd@lists.infradead.org>; Sun, 10 Aug 2003 09:27:15 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Dan Cardamore <dan.cardamore@officeserver.ca>
In-Reply-To: <20030809053345.GA27061@officeserver.ca>
References: <20030809053345.GA27061@officeserver.ca>
Message-Id: <1060504021.29776.5.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sun, 10 Aug 2003 09:27:04 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Problem mounting JFFS2 as root, works for ext2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2003-08-09 at 06:33, Dan Cardamore wrote:

> If I boot using JFFS2 as my root, I get:
> <snip>
> VFS: Mounted root (jffs2 filesystem)
> mount_devfs_fs(): unable to mount devfs, err: -2
  <...>
> Warning: unable to open an initial console.
> Kernel panic: No init found.  Try passing init= option to the kernel
> 
> If I boot from /dev/hda3 as my root (ext2), I get everything working
> perfect.

Does it bitch about failing to mount devfs in the case where you mount
ext2-root too?

-- 
dwmw2
