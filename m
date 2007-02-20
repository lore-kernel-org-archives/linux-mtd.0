Received: from crown.reflexsecurity.com ([72.54.139.163])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HJceH-00057N-Db
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 16:35:47 -0500
Date: Tue, 20 Feb 2007 16:35:29 -0500
From: Jason Lunz <lunz@falooley.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] block2mtd oops in erase function.
Message-ID: <20070220213528.GA7764@metaxa.reflex>
References: <1171920579.4996.8.camel@celeron>
	<20070219222041.GE7813@lazybastard.org>
	<20070219223023.GF7813@lazybastard.org>
	<1171938429.2859.2.camel@NF.local>
	<20070220105306.GC10455@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070220105306.GC10455@lazybastard.org>
Cc: Felix Fietkau <nbd@openwrt.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Feb 20, 2007 at 10:53:07AM +0000, Jörn Engel wrote:
> Cool!  Would you mind also trying two more patches?  One of them just
> removes a compile warning if CONFIG_MODULE=n, the other rips out the
> readahead code, which should give a nice performance boost on USB
> sticks, MMC/SD, etc.  Mounting JFFS2 in particular should be faster.

I'm using jffs2 on block2mtd. I'd be happy to test any patches you have.

The readahead-disable one in particular is interesting - i ended up
patching the source to get rid of the warning about readahead past
end-of-disk. And mounting jffs2-on-block2mtd-on-ide-flash is quite slow.

Jason

---
 drivers/mtd/devices/block2mtd.c |    1 -
 1 file changed, 1 deletion(-)

Index: linux-2.6.20-rc5-uml/drivers/mtd/devices/block2mtd.c
===================================================================
--- linux-2.6.20-rc5-uml.orig/drivers/mtd/devices/block2mtd.c
+++ linux-2.6.20-rc5-uml/drivers/mtd/devices/block2mtd.c
@@ -63,7 +63,6 @@
 	for (i = 0; i < PAGE_READAHEAD; i++) {
 		pagei = index + i;
 		if (pagei > end_index) {
-			INFO("Overrun end of disk in cache readahead\n");
 			break;
 		}
 		page = radix_tree_lookup(&mapping->page_tree, pagei);
