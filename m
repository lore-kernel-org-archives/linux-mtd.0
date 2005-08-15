Received: from xena.bway.net ([216.220.96.26] helo=mail.bway.net)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4hfu-0008Ns-7P
	for linux-mtd@lists.infradead.org; Mon, 15 Aug 2005 12:19:03 -0400
Message-ID: <4300BEE2.4020104@bway.net>
Date: Mon, 15 Aug 2005 16:12:18 +0000
From: "Ryan B. Lynch" <rlynch@bway.net>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: possible bug in "--pad" option for mkfs.jffs2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I don't know if this is really a bug, but mkfs.jffs2 doesn't seem to be
working entirely as advertised for me.  I'm trying to use the "--pad"
option to create some relatively large JFFS2 images (~200-950 MB).  I
know that these are larger than is common, so I'm also on the lookout
for size-related limitations.

I run 'mkfs.jffs2' with the following command line:

 $ /usr/sbin/mkfs.jffs2 \
 >    -r /tmp/root \
 >    -o /tmp/image-20050815.160044.jffs2 \
 >    -e 0x10000 \
 >    -p 214171648

The image size is NOT padded to 214,171,648 bytes, though--the size
depends on the contents of the filesystem (I tried varying it a little
to see what happens).  I'm assuming that "-e" and "-p" both take values
in bytes... Maybe someone can correct me on that?

Can anyone correct me, or give me some troubleshooting direction?

Thanks for the help,
Ryan
