Received: from extraetmess.thales-e-transactions.com ([212.234.11.56])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19D1bT-0007nJ-9q
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 13:31:27 +0100
Message-ID: <3EB7AA75.7B0DACF5@thales-e-transactions.com>
Date: Tue, 06 May 2003 14:28:37 +0200
From: "Eric DEJONC" <eric.dejonc@thales-e-transactions.com>
MIME-Version: 1.0
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
References: <3EB7A6AC.ED381D4C@thales-e-transactions.com>
	<20030506122442.GD15261@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: reverse mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Well, thank you, I did not think to loopback, thats a great idea. I'm gonna
test. the only little problem is  that the 10M jffs2 file should take a long
time to be sent on the board via a serial port (the only one I can use).

Berst regards,
Eric

Jörn Engel a écrit :

> On Tue, 6 May 2003 14:12:28 +0200, Eric DEJONC wrote:
> >
> > I was wondering if someone had already done a prog that reverse
> > mkfs.jffs2?
> >
> > I'd like to open a jffs2 ramdisk made by someone else, but I don't have
> > enough space on my flash disk. So I would like to open it, but from the
> > host machine that doesn't handle  jffs2.
>
> Use one of mtdram or mtdblock and use that. You can make a block
> device from your image with loopback. Should be enough, I guess.
>
> Jörn
>
> --
> Good warriors cause others to come to them and do not go to others.
> -- Sun Tzu
