Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E2yGK-0002pi-60
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 17:37:28 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1E2yDn-0004Dc-KQ
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2005 23:34:54 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Aug 2005 23:34:47 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Aug 2005 23:34:47 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 10 Aug 2005 21:34:29 +0000 (UTC)
Message-ID: <loom.20050810T232947-784@post.gmane.org>
References: <42F8DCBD.2020407@sgi.com>
	<1123630395.21933.135.camel@tglx.tec.linutronix.de>
	<200508110808.15354.manningc2@actrix.gen.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: Erasing NAND bad blocks?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Charles,


> 2) Add a config in yaffs to not do any bad block marking during board bring 
> up.

I suggest to disable retiring blocks that failed ECC on read. I see it happening
during power cycling. YAFFS leaks good blocks, e.g. disrupted write/erase
creates bad ECC and then GC retires perfectly good block. JFFS2 does not do that.
AFAIK, manufacturers suggest discarding only blocks that fail on write.

Sergei 
