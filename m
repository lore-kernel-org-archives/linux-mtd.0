Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I1394-0006nT-FX
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 12:35:06 -0400
Date: Wed, 20 Jun 2007 18:29:50 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: sync() takes minutes while erasing
Message-ID: <20070620162950.GB1789@lazybastard.org>
References: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
	<1182350992.2969.128.camel@gentoo-jocke.transmode.se>
	<1182355744.14977.41.camel@weaponx.rchland.ibm.com>
	<1182356796.2969.140.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1182356796.2969.140.camel@gentoo-jocke.transmode.se>
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 June 2007 18:26:36 +0200, Joakim Tjernlund wrote:
> On Wed, 2007-06-20 at 11:09 -0500, Josh Boyer wrote:
> > 
> > jffs2_write_super is called during unmount.  If there are blocks pending
> > on the erase list, it's better to erase those now before the unmount is
> > completed.  Saves some time on the next mount.
> 
> No, not if the reboot/unmont is suspended for minutes just because jffs2
> wants to finish erasing. It doesn't save you much, if anything, at
> remount either.
> 
> The erasing in context is just something that needs to be done at some
> point but it don't have to happen now.

In case you need an example:

$ flash_eraseall /dev/mtd0
$ time mount mtd0 /mnt -t jffs2
$ time umount /mnt

Depending on device size, this will take some seconds for mount and some
minutes for umount.  Spending minutes to save some seconds on next mount
hardly sounds sensible.

Jörn

-- 
"Security vulnerabilities are here to stay."
-- Scott Culp, Manager of the Microsoft Security Response Center, 2001
