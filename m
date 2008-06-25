Received: from mersenne.largestprime.net ([203.56.168.14])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KBUsM-0005V4-88
	for linux-mtd@lists.infradead.org; Wed, 25 Jun 2008 13:17:31 +0000
Date: Wed, 25 Jun 2008 21:17:24 +0800
From: Bernard Blackham <bernard@largestprime.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD-UTILS] ubiformat: reverse question about vid offset
	change
Message-ID: <20080625131723.GA24006@mersenne.largestprime.net>
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

Users can pass the -O option to ubiformat to override the VID header
offset on the command-line. If for some reason, the new offset does
not match what is on flash, ubiformat currently prompts the user if
they'd rather use the *old* offsets.  This means that calling
ubiformat with --yes will not do what was requested on the
command-line.

This patch reverses the question so --yes is actually useful for
running in batch-mode.

Signed-off-by: Bernard Blackham <bernard@largestprime.net>

diff --git a/ubi-utils/new-utils/src/ubiformat.c b/ubi-utils/new-utils/src/ubiformat.c
index dc5dc44..545630b 100644
--- a/ubi-utils/new-utils/src/ubiformat.c
+++ b/ubi-utils/new-utils/src/ubiformat.c
@@ -675,12 +675,13 @@ int main(int argc, char * const argv[])
 				"which is different to calculated offsets %d and %d",
 				si->vid_hdr_offs, si->data_offs, ui.vid_hdr_offs,
 				ui.data_offs);
-			normsg_cont("use old offsets %d and %d? (yes/no)  ",
+			normsg_cont("use new offsets %d and %d? (yes/no)  ",
 				    si->vid_hdr_offs, si->data_offs);
 		}
 		if (args.yes || answer_is_yes()) {
 			if (args.yes && !args.quiet)
 				printf("yes\n");
+		} else {
 			ui.vid_hdr_offs = si->vid_hdr_offs;
 			ui.data_offs = si->data_offs;
 		}
