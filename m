Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UMxG-0000Lr-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2001 07:36:34 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B70C06D.5908CAC8@willhart-tech.com> 
References: <3B70C06D.5908CAC8@willhart-tech.com>  <3B677B90.B2E244BD@cvs.anu.edu.au> <E15RXGo-00058Q-00@pentafluge.infradead.org> <30960.997176999@redhat.com> 
To: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
Cc: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC 2000 driver (NFTL) in kernel 2.4.7 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 08 Aug 2001 07:42:08 +0100
Message-ID: <22004.997252928@redhat.com>
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


a.harsanyi@willhart-tech.com said:
> ANAND header found at 0xc000 in mtd0, but ECC read failed (err 1)
> ANAND header found at 0xe000 in mtd0, but ECC read failed (err 1)
> Could not find valid boot record 

And with this applied...?

Index: nftlmount.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/nftlmount.c,v
retrieving revision 1.20
diff -u -r1.20 nftlmount.c
--- nftlmount.c	2001/08/07 09:22:07	1.20
+++ nftlmount.c	2001/08/08 06:41:48
@@ -103,6 +103,7 @@
 			continue;
 		}
 
+#if 0
 		/* Finally reread to check ECC */
 		if ((ret = MTD_READECC(nftl->mtd, block * nftl->EraseSize, SECTORSIZE,
 				&retlen, buf, (char *)&oob) < 0)) {
@@ -119,6 +120,7 @@
 			       buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
 			continue;
 		}
+#endif
 			       
 		/* OK, we like it. */
 


--
dwmw2
