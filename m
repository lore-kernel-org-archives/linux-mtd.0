Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqB3U-0003Yc-7P
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 12:20:42 -0500
Subject: RE: sync() takes minutes while erasing
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1194539828.4029.1.camel@gentoo-jocke.transmode.se>
References: <001901c7b9b6$81e76340$0e67a8c0@Jocke>
	<1183057362.1170.194.camel@pmac.infradead.org>
	<1183381086.20673.132.camel@gentoo-jocke.transmode.se>
	<1186417135.27312.18.camel@gentoo-jocke.transmode.se>
	<1186578369.8266.2.camel@gentoo-jocke.transmode.se>
	<1194539828.4029.1.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Thu, 08 Nov 2007 18:20:32 +0100
Message-Id: <1194542432.4029.5.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: 'Linux MTD mailing list' <linux-mtd@lists.infradead.org>
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-11-08 at 17:37 +0100, Joakim Tjernlund wrote:
> On Wed, 2007-08-08 at 15:06 +0200, Joakim Tjernlund wrote:
> > On Mon, 2007-08-06 at 18:18 +0200, Joakim Tjernlund wrote:
> > > On Mon, 2007-07-02 at 14:58 +0200, Joakim Tjernlund wrote:
> > > > On Thu, 2007-06-28 at 20:02 +0100, David Woodhouse wrote:
> > > > > On Thu, 2007-06-28 at 20:59 +0200, Joakim Tjernlund wrote:
> > > > > > Thanks, this stop the complaints from the test team. They
> > > > > > don't like to wait a few mins every time they delete an old install
> > > > > > and reboot.
> > > > > 
> > > > > This is what the rest of us use 'flash_eraseall -j' for, btw :)
> > > > > 
> > > > > But I'll look into it. If we can do the erases from some other context
> > > > > it would be nice. Although pdflush_operation() doesn't seem to give us
> > > > > any way to _stop_ a pending call if we unmount.
> > 
> > hmm, can't jffs2_erase_pending_blocks() see if a unmount is in progress
> > and if so, stop erasing blocks? 
> 
> Any hints on the "unmount is in progress" idea? I have a few
> hours to spare for this ATM.

Tried to test for sb->s_flags & MS_ACTIVE but that didn't work.
Maybe it will work if jffs2_erase_pending_blocks() is moved to
pdflush_operation() context? Dunno how to do that though.

 Jocke
