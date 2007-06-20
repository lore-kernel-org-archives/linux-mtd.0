Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I12mE-00068K-B8
	for linux-mtd@lists.infradead.org; Wed, 20 Jun 2007 12:11:27 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l5KG9GS8025977
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2007 12:09:16 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l5KG9BNQ259452
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2007 10:09:15 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l5KG98Ok009784
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2007 10:09:08 -0600
Subject: Re: sync() takes minutes while erasing
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1182350992.2969.128.camel@gentoo-jocke.transmode.se>
References: <1182349303.2969.122.camel@gentoo-jocke.transmode.se>
	<1182350992.2969.128.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Date: Wed, 20 Jun 2007 11:09:04 -0500
Message-Id: <1182355744.14977.41.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-06-20 at 16:49 +0200, Joakim Tjernlund wrote:
> On Wed, 2007-06-20 at 16:21 +0200, Joakim Tjernlund wrote:
> > Here we go again :)
> > 
> > Noticed one again large delays when rebooting and jffs2 is busy
> > erasing block via pdflush.
> > 
> > Can't see where sync() ends up in jffs2, anyone
> > know the jffs2(or pdflush) functions involved during a sync?
> > 
> >  Jocke 
> 
> Ok, found the cause:
>  jffs2_erase_pending_blocks(c, 0) is called from
>  jffs2_write_super() and it hangs until all
>  pending erases are complete.
> 
> Why do jffs2_write_super() need to call 
> jffs2_erase_pending_blocks(c, 0)? Seems like a bad idea to me.

jffs2_write_super is called during unmount.  If there are blocks pending
on the erase list, it's better to erase those now before the unmount is
completed.  Saves some time on the next mount.

josh
