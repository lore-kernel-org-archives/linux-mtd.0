Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I130w-0006WM-Rn
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 12:26:41 -0400
Subject: Re: sync() takes minutes while erasing
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1182355744.14977.41.camel@weaponx.rchland.ibm.com>
References: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
	<1182350992.2969.128.camel@gentoo-jocke.transmode.se>
	<1182355744.14977.41.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 20 Jun 2007 18:26:36 +0200
Message-Id: <1182356796.2969.140.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-20 at 11:09 -0500, Josh Boyer wrote:
> On Wed, 2007-06-20 at 16:49 +0200, Joakim Tjernlund wrote:
> > On Wed, 2007-06-20 at 16:21 +0200, Joakim Tjernlund wrote:
> > > Here we go again :)
> > > 
> > > Noticed one again large delays when rebooting and jffs2 is busy
> > > erasing block via pdflush.
> > > 
> > > Can't see where sync() ends up in jffs2, anyone
> > > know the jffs2(or pdflush) functions involved during a sync?
> > > 
> > >  Jocke 
> > 
> > Ok, found the cause:
> >  jffs2_erase_pending_blocks(c, 0) is called from
> >  jffs2_write_super() and it hangs until all
> >  pending erases are complete.
> > 
> > Why do jffs2_write_super() need to call 
> > jffs2_erase_pending_blocks(c, 0)? Seems like a bad idea to me.
> 
> jffs2_write_super is called during unmount.  If there are blocks pending
> on the erase list, it's better to erase those now before the unmount is
> completed.  Saves some time on the next mount.

No, not if the reboot/unmont is suspended for minutes just because jffs2
wants to finish erasing. It doesn't save you much, if anything, at
remount either.

The erasing in context is just something that needs to be done at some
point but it don't have to happen now.

  Jocke 

> 
> josh
> 
> 
> 
