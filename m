Received: from ppp-207202-034.netreach.net ([207.29.202.34]
	helo=wagtail.mars.leitch.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Co6A1-0004YA-Pb
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 15:29:10 -0500
From: Rob Zwiebel <rob.zwiebel@leitch.com>
To: linux-mtd@lists.infradead.org
Date: Mon, 10 Jan 2005 15:30:46 -0500
MIME-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <200501101530.46348.rob.zwiebel@leitch.com>
Subject: zlib version 1.1.3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using SUSE 9.1 which includes zlib version 1.1.3.

When I compile the latest version of the mkfs.jffs2. 
There are errors caused by the lack of the zalloc variable found in the 
z_stream structure.

compr_zlib.c: In function `jffs2_zlib_compress':
compr_zlib.c:65: error: structure has no member named `zalloc'
compr_zlib.c:66: error: structure has no member named `zfree'
compr_zlib.c:68: warning: implicit declaration of function `deflateInit'
compr_zlib.c:80: warning: implicit declaration of function `deflate'
compr_zlib.c:82: warning: implicit declaration of function `deflateEnd'
compr_zlib.c: In function `jffs2_zlib_decompress':
compr_zlib.c:110: error: structure has no member named `zalloc'
compr_zlib.c:111: error: structure has no member named `zfree'
compr_zlib.c:113: warning: implicit declaration of function `inflateInit'
compr_zlib.c:124: warning: implicit declaration of function `inflate'
compr_zlib.c:127: warning: implicit declaration of function `inflateEnd'

What is the best way to proceed?

Rob
