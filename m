Received: from rose.man.poznan.pl ([150.254.173.3])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CIM2l-00070k-1c
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2004 02:58:28 -0400
Date: Fri, 15 Oct 2004 08:58:07 +0200 (CEST)
From: Michal Schulz <mschulz@rose.man.poznan.pl>
To: Manfred Gruber <gruber.m@utanet.at>
In-Reply-To: <200410141908.55561.gruber.m@utanet.at>
Message-ID: <Pine.GSO.4.44.0410150857090.28639-100000@rose.man.poznan.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
Subject: Re: phram/slram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 14 Oct 2004, Manfred Gruber wrote:

> another question is i have changed in this drivers for a default erase size to
> get a jffs2 fs running on this. i know that it is not the right way to use a
> flash fs on ram but another fs was not possible to run (ext2).

why couldn't you use ext2? It works without any problems with slram

> is it correct to use a fs on ram chips? i will do this because then i have not
> to change my application :-)

http://hedera.linuxnews.pl/_news/2002/09/03/_long/1445.html

-- 
Michal Schulz
