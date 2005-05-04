Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTSmK-0005SF-3P
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 18:55:41 -0400
Date: Wed, 4 May 2005 15:55:39 -0700
From: Todd Poynor <tpoynor@mvista.com>
To: "Burch, John T." <John.Burch@tellabs.com>
Message-ID: <20050504225539.GA12808@slurryseal.ddns.mvista.com>
References: <E167ED46776D284B893BE52E888B69BC030F2055@USNVEX3.tellabs-west.tellabsinc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E167ED46776D284B893BE52E888B69BC030F2055@USNVEX3.tellabs-west.tellabsinc.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: MTD do_write_oneword(): software timeout
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 04, 2005 at 05:35:45PM -0500, Burch, John T. wrote:
...
> MTD do_write_oneword(): software timeout

This is probably what you need:

revision 1.109
date: 2004/09/15 23:48:09;  author: thayne;  state: Exp;  lines: +5 -4
single word writes at the end of a buffer write are done with the wrong 
address
 
Index: drivers/mtd/chips/cfi_cmdset_0002.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/chips/cfi_cmdset_0002.c,v
retrieving revision 1.108
retrieving revision 1.109
diff -u -r1.108 -r1.109
--- drivers/mtd/chips/cfi_cmdset_0002.c	2 Sep 2004 01:59:22 -0000	1.108
+++ drivers/mtd/chips/cfi_cmdset_0002.c	15 Sep 2004 23:48:09 -0000	1.109
@@ -13,7 +13,7 @@
  *
  * This code is GPL
  *
- * $Id: cfi_cmdset_0002.c,v 1.107 2004/08/12 06:40:22 eric Exp $
+ * $Id: cfi_cmdset_0002.c,v 1.108 2004/09/02 01:59:22 eric Exp $
  *
  */
 
@@ -1111,8 +1111,8 @@
 		size_t local_len = (-ofs)&(map_bankwidth(map)-1);
 		if (local_len > len)
 			local_len = len;
-		ret = cfi_amdstd_write_words(mtd, to, local_len,
-					       retlen, buf);
+		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),
+					     local_len, retlen, buf);
 		if (ret)
 			return ret;
 		ofs += local_len;
@@ -1158,7 +1158,8 @@
 	if (len) {
 		size_t retlen_dregs = 0;
 
-		ret = cfi_amdstd_write_words(mtd, to, len, &retlen_dregs, buf);
+		ret = cfi_amdstd_write_words(mtd, ofs + (chipnum<<cfi->chipshift),
+					     len, &retlen_dregs, buf);
 
 		*retlen += retlen_dregs;
 		return ret;


-- 
Todd
