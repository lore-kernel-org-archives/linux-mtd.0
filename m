Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wJYn-0003Ch-00
	for <linux-mtd@lists.infradead.org>; Wed, 24 Oct 2001 09:38:49 +0100
Date: Wed, 24 Oct 2001 10:48:02 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: "Bao C. Ha" <baoha@sensoria.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 destroys CRAMFS!
Message-ID: <20011024104802.A22481@wohnheim.fh-wedel.de>
References: <014d01c15bf3$d4ff82a0$456c020a@SENSORIA>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <014d01c15bf3$d4ff82a0$456c020a@SENSORIA>; from baoha@sensoria.com on Tue, Oct 23, 2001 at 11:52:14AM -0700
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Moin!

> - Unless jffs2 detects its MAGIC, it can't make
> changes to the MTD partition.

That appears to be a sane suggestion and would make me happy, too.
But, apart from the problem of existing FSs w/out the magic number,
there is also the question whether to use one MAGIC per FS or one per
delete block. The latter would definitely be nicer but might be
problematic with NAND flashes.

Jörn

-- 
If you treat your beta-testers as if they're your most valuable resource, 
they will respond by becoming your most valuable resource.
