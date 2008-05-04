Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jsgww-0007cj-3y
	for linux-mtd@lists.infradead.org; Sun, 04 May 2008 16:20:30 +0000
Date: Sun, 4 May 2008 18:20:23 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: LogFS merge
In-Reply-To: <20080503120005.GA32608@logfs.org>
Message-ID: <alpine.LFD.1.10.0805041809370.3318@apollo.tec.linutronix.de>
References: <481C3087.8020501@free.fr> <20080503120005.GA32608@logfs.org>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-276966678-1209918024=:3318"
Cc: Linus Torvalds <torvalds@osdl.org>, linux-mtd@lists.infradead.org,
	Linux Kernel list <linux-kernel@vger.kernel.org>,
	matthieu castet <castet.matthieu@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-276966678-1209918024=:3318
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Sat, 3 May 2008, Jörn Engel wrote:
> 1.
> Ubifs takes the easy approach and uses ubi for wear leveling, bad block
> handling, ets.  Saves a ton of work, gives quick results and is limited
> by ubi scan time, which is O(n).

Which is easy enough to fix.

> Logfs ignores ubi and does wear leveling, bad block handling, etc.
> itself.  Bad block handling in particular is not too robust yet.  If you
> expect blocks to rot away after mkfs time, logfs is a bad choice.

It's a matter of fact that especially on NAND flash blocks become bad
over time, i.e. after mkfs. So that's a pretty crucial feature which
needs to be complete and robust before it's declared to be usable on
such devices.

Thanks,
	tglx

--8323328-276966678-1209918024=:3318--
