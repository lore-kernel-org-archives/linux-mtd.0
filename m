Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HySqw-0006ER-J8
	for linux-mtd@lists.infradead.org; Wed, 13 Jun 2007 09:25:49 -0400
Subject: Re: [PATCH] Fix hanging close for /dev/mtd
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1181737895.1563.1.camel@weaponx.rchland.ibm.com>
References: <1181728411.30670.270.camel@gentoo-jocke.transmode.se>
	<1181735052.7065.57.camel@zod.rchland.ibm.com>
	<1181735301.30670.277.camel@gentoo-jocke.transmode.se>
	<1181737895.1563.1.camel@weaponx.rchland.ibm.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Jun 2007 15:25:34 +0200
Message-Id: <1181741134.30670.288.camel@gentoo-jocke.transmode.se>
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

On Wed, 2007-06-13 at 07:31 -0500, Josh Boyer wrote:
> On Wed, 2007-06-13 at 13:48 +0200, Joakim Tjernlund wrote:
> > On Wed, 2007-06-13 at 06:44 -0500, Josh Boyer wrote:
> > > On Wed, 2007-06-13 at 11:53 +0200, Joakim Tjernlund wrote:
> > > > Figured I should send this on its own.
> > > > 
> > > > Stracing a process using /dev/mtd shows that
> > > > it sometimes hangs for a long time when pdflush is erasing
> > > > sectors. /dev/mtd* close method calls the mtd->sync method
> > > > which can hang for a long time(minutes).
> > > > 
> > > > Futher, the sync method "syncs" all flash chips. It should
> > > > only sync the chips that a /dev/mtd* spans.
> > > > Also, the mtdchar/mtdblock drivers does not need to
> > > > call sync for readonly mappings.
> > > 
> > > So were you going to submit a separate patch for those issues?
> > > 
> > > josh
> > 
> > Wow, someone is reading my mails :)
> 
> Heh, indeed :)
> 
> > Just did for mtdchar, the others are a bit more complex
> > so I won't bother with them.
> 
> Great.  Oh, and I think your JFFS2 patch seems valid.  If I remember
> correctly, David just did another similar s/cond_resched/yield/ change
> that showed significant speed ups in OLPC boot times.

Yes, he did. I think cond_resched idea isn't working as intended
with 2.6. I belive that the scheduler can promote a process/kernel
thread so that the cond_resched()/schedule() becomes a NOP.

  Jocke
