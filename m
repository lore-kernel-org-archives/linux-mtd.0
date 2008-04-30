Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JrDh6-0004GG-PC
	for linux-mtd@lists.infradead.org; Wed, 30 Apr 2008 14:54:05 +0000
Subject: Re: jffs2 lockdep warning
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: David Brownell <david-b@pacbell.net>
In-Reply-To: <200804292139.35426.david-b@pacbell.net>
References: <200804292139.35426.david-b@pacbell.net>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Wed, 30 Apr 2008 16:53:49 +0200
Message-Id: <1209567229.16926.16.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 2008-04-29 at 21:39 -0700, David Brownell wrote:
> This little surprise happened from busybox 1.7.2 "ash" when I typed:
> 
> 	$ echo $(( 2 + 2 ))
> 
> I didn't try to reproduce it.  The kernel used GIT that was current
> as of sometime this afternoon.

[Offtopic]

David, I have been trying to reach you a few times but there was
no reply. I know our mail server got on your black list for a while,
maybe it still is? Hopefully you will get this via the MTD list in
that case.

 Jocke
