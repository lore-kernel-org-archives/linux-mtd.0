Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cinS-0004Qo-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 09:37:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <957BD1C2BF3CD411B6C500A0C944CA2601499C38@pdsmsx32.pd.intel.com> 
References: <957BD1C2BF3CD411B6C500A0C944CA2601499C38@pdsmsx32.pd.intel.com> 
To: "Yuan, Cain" <cain.yuan@intel.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Aug 2002 09:37:28 +0100
Message-ID: <31433.1028795848@redhat.com>
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

cain.yuan@intel.com said:
>  First bootup will success without any error message. but when I reset
> the board and boot it again, many errors occurs. 

The error is -EROFS. Your chip might need unlocking each time it's reset. At 
least one map driver does this automatically at startup.

The reason the error isn't being reported properly is because I'm 
stupid...

--- writev.c	20 May 2002 14:56:39 -0000	1.2
+++ writev.c	8 Aug 2002 08:35:21 -0000	1.3
@@ -7,7 +7,7 @@
  *
  * For licensing information, see the file 'LICENCE' in this directory.
  *
- * $Id: writev.c,v 1.2 2002/05/20 14:56:39 dwmw2 Exp $
+ * $Id: writev.c,v 1.3 2002/08/08 08:35:21 dwmw2 Exp $
  *
  */
 
@@ -28,7 +28,7 @@ static inline int mtd_fake_writev(struct
 	for (i=0; i<count; i++) {
 		if (!vecs[i].iov_len)
 			continue;
-		mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
+		ret = mtd->write(mtd, to, vecs[i].iov_len, &thislen, vecs[i].iov_base);
 		totlen += thislen;
 		if (ret || thislen != vecs[i].iov_len)
 			break;


--
dwmw2
