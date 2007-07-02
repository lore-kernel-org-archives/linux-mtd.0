Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I5LTk-00063g-5Y
	for linux-mtd@lists.infradead.org; Mon, 02 Jul 2007 08:58:09 -0400
Subject: RE: sync() takes minutes while erasing
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1183057362.1170.194.camel@pmac.infradead.org>
References: <001901c7b9b6$81e76340$0e67a8c0@Jocke>
	<1183057362.1170.194.camel@pmac.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Jul 2007 14:58:06 +0200
Message-Id: <1183381086.20673.132.camel@gentoo-jocke.transmode.se>
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

On Thu, 2007-06-28 at 20:02 +0100, David Woodhouse wrote:
> On Thu, 2007-06-28 at 20:59 +0200, Joakim Tjernlund wrote:
> > Thanks, this stop the complaints from the test team. They
> > don't like to wait a few mins every time they delete an old install
> > and reboot.
> 
> This is what the rest of us use 'flash_eraseall -j' for, btw :)
> 
> But I'll look into it. If we can do the erases from some other context
> it would be nice. Although pdflush_operation() doesn't seem to give us
> any way to _stop_ a pending call if we unmount.
> 

hmm, can't you make so that pdflush_operation() just erases one
block at a time? Then the longest you have to wait is just
the time it takes to finish one EB.

 Jocke
