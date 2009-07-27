Received: from mail-yw0-f196.google.com ([209.85.211.196])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MVEfL-0003Yy-4g
	for linux-mtd@lists.infradead.org; Mon, 27 Jul 2009 01:06:15 +0000
Received: by ywh34 with SMTP id 34so448767ywh.28
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jul 2009 18:06:10 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 26 Jul 2009 18:06:09 -0700
Message-ID: <8c6c6f450907261806q784e3f93kfe04fe4ab9121cf3@mail.gmail.com>
Subject: jffs2 errors - Macronix
From: Ganesh Ragavan <ganeshragavan@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I keep getting these kind of error messages while booting my Macronix
top boot flash.  The problem is these are not exactly reproducible,
they appear sometimes, sometimes not.  From searching the archive,
folks have suggested that wrong sector size or flash mapping could be
a problem.  I have given those values correctly.  Also the system
doesn't hang because of this.  It would be really great if someone
could tell me how to exactly reproduce it or suggest a fix.

Errors:

JFFS2 notice: (1858) jffs2_get_inode_nodes: Node header CRC failed at
0x211a20. {0000,8000,00000000,c0200000}

Node totlen on flash (0x00000000) != totlen from node ref (0x00000038)
JFFS2 notice: (853) read_unknown: unknown RWCOMPAT_DELETE nodetype
0X2000 at 0x1a8b2c
Node totlen on flash (0x00000000) != totlen from node ref (0x00000038)

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
0x000d01d4: 0xffff instead

Thanks !
