Received: from e36.co.us.ibm.com ([32.97.110.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I13XR-0003R1-JZ
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 18:00:14 +0100
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e36.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l5KGxjdJ003066
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2007 12:59:45 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l5KGxixQ260196
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2007 10:59:44 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l5KGxhqL010892
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2007 10:59:43 -0600
Subject: Re: sync() takes minutes while erasing
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1182357913.2969.145.camel@gentoo-jocke.transmode.se>
References: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
	<1182350992.2969.128.camel@gentoo-jocke.transmode.se>
	<1182355744.14977.41.camel@weaponx.rchland.ibm.com>
	<1182356796.2969.140.camel@gentoo-jocke.transmode.se>
	<20070620162950.GB1789@lazybastard.org>
	<1182357913.2969.145.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain; charset=utf-8
Date: Wed, 20 Jun 2007 11:59:43 -0500
Message-Id: <1182358783.14977.52.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-20 at 18:45 +0200, Joakim Tjernlund wrote:
> On Wed, 2007-06-20 at 18:29 +0200, Jörn Engel wrote:
> > On Wed, 20 June 2007 18:26:36 +0200, Joakim Tjernlund wrote:
> > > On Wed, 2007-06-20 at 11:09 -0500, Josh Boyer wrote:
> > > > 
> > > > jffs2_write_super is called during unmount.  If there are blocks pending
> > > > on the erase list, it's better to erase those now before the unmount is
> > > > completed.  Saves some time on the next mount.
> > > 
> > > No, not if the reboot/unmont is suspended for minutes just because jffs2
> > > wants to finish erasing. It doesn't save you much, if anything, at
> > > remount either.
> > > 
> > > The erasing in context is just something that needs to be done at some
> > > point but it don't have to happen now.
> > 
> > In case you need an example:
> > 
> > $ flash_eraseall /dev/mtd0
> > $ time mount mtd0 /mnt -t jffs2
> > $ time umount /mnt
> > 
> > Depending on device size, this will take some seconds for mount and some
> > minutes for umount.  Spending minutes to save some seconds on next mount
> > hardly sounds sensible.
> > 
> > Jörn
> 
> Exactly, 

Ok, you've both convinced me.

> David where are you? You havn't been active for a long time.

He's in China on business.

> Is there any reason to keep as is?

Maybe not.  We definitely want it to flush the write buffer and complete
any block in the _middle_ of an erase though.

josh
