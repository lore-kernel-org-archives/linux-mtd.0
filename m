Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EJW20-0005nW-Kz
	for linux-mtd@lists.infradead.org; Sun, 25 Sep 2005 08:55:12 -0400
Date: Sun, 25 Sep 2005 14:54:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Anders Grafstrom <grfstrm@users.sourceforge.net>
Message-ID: <20050925125455.GA28978@wohnheim.fh-wedel.de>
References: <E1EHjUk-0001IT-Dn@phoenix.infradead.org>
	<43303409.5030406@users.sourceforge.net>
	<43303D59.1040805@yandex.ru>
	<433067BF.6080909@users.sourceforge.net>
	<1127399674.28625.18.camel@sauron.oktetlabs.ru>
	<43341DCD.6090002@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43341DCD.6090002@users.sourceforge.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 erase.c,1.84,1.85 roll back
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 September 2005 17:22:53 +0200, Anders Grafstrom wrote:
> 
> jffs2 makes a second try if a failed erase is reported by the mtd 
> driver. But only for NAND (in jffs2_write_nand_badblock()). What I'm 
> after is a retry for NOR as well. But I wrote the patch so it would 
> retry for other cases of failure too.

Is a retry really an improvement?  When a block cannot be properly
erased on the first try, I would not trust it anymore.  Instead of a
retry, I'd rather mark it as a bad block and not touch it again.

Jörn

-- 
When you close your hand, you own nothing. When you open it up, you
own the whole world.
-- Li Mu Bai in Tiger & Dragon
