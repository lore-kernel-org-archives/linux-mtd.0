Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195NVs-0000ae-2Q
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 11:18:04 +0100
Received: from joern by wohnheim.fh-wedel.de with local (Exim 3.35 #1
	(Debian))	id 195NVy-0006FT-00
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 12:18:10 +0200
Date: Tue, 15 Apr 2003 12:18:10 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20030415101810.GG10280@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Subject: jffs2 compression methods
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Looking at fs/jffs2/compr.c:

Can we disable jffs2_dynrubin_decompress, at least for 2.5?
Compression has been disabled for 18 month now, more when 2.6
finally gets released.

What exactly is jffs2_rtime_compress and what do we need it for?
Does it really compress better than zlib? If yes, why do we use zlib?
If not, why do we use rtime?

Assuming, we do need rtime, would it make sense to kmalloc those
"positions" buffers, possibly per mount-point for speed? They take 1k,
which might or might not be ok with 4k stacks.

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
