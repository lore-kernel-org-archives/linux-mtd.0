Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19D1Uh-0007hM-N8
	for <linux-mtd@lists.infradead.org>; Tue, 06 May 2003 13:24:27 +0100
Date: Tue, 6 May 2003 14:24:42 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Eric DEJONC <eric.dejonc@thales-e-transactions.com>
Message-ID: <20030506122442.GD15261@wohnheim.fh-wedel.de>
References: <3EB7A6AC.ED381D4C@thales-e-transactions.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3EB7A6AC.ED381D4C@thales-e-transactions.com>
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

On Tue, 6 May 2003 14:12:28 +0200, Eric DEJONC wrote:
> 
> I was wondering if someone had already done a prog that reverse
> mkfs.jffs2?
> 
> I'd like to open a jffs2 ramdisk made by someone else, but I don't have
> enough space on my flash disk. So I would like to open it, but from the
> host machine that doesn't handle  jffs2.

Use one of mtdram or mtdblock and use that. You can make a block
device from your image with loopback. Should be enough, I guess.

Jörn

-- 
Good warriors cause others to come to them and do not go to others.
-- Sun Tzu
