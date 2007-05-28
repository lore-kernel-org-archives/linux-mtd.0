Received: from 87-194-8-8.bethere.co.uk ([87.194.8.8] helo=aeryn.fluff.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HskK3-0007YJ-OM
	for linux-mtd@lists.infradead.org; Mon, 28 May 2007 14:52:04 -0400
Date: Mon, 28 May 2007 19:51:59 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd_blkdevs.c: do not export 'mtd_blktrans_ops'
Message-ID: <20070528185159.GA2258@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The mtd_blktrans_ops is not defined in any of the headers
and is indeed not used elsewhere in the kernel, so mark it
as static to reduce the warnings from sparse

drivers/mtd/mtd_blkdevs.c:204:32: warning: symbol 'mtd_blktrans_ops' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben-linux@fluff.org>

--- linux-2.6.22-rc3/drivers/mtd/mtd_blkdevs.c	2007-05-27 18:54:21.000000000 +0100
+++ linux-2.6.22-rc3-sparse1/drivers/mtd/mtd_blkdevs.c	2007-05-28 19:45:39.000000000 +0100
@@ -201,7 +201,7 @@ static int blktrans_ioctl(struct inode *
 	}
 }
 
-struct block_device_operations mtd_blktrans_ops = {
+static struct block_device_operations mtd_blktrans_ops = {
 	.owner		= THIS_MODULE,
 	.open		= blktrans_open,
 	.release	= blktrans_release,
