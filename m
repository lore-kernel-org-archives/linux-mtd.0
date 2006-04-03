Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQQrx-0006YV-I4
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 11:21:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 17FE45E42E3
	for <linux-mtd@lists.infradead.org>;
	Mon,  3 Apr 2006 17:21:25 +0200 (CEST)
Received: from lin01.mn-solutions.de (p54B2804B.dip0.t-ipconnect.de
	[84.178.128.75])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 7CBDC5E42E0
	for <linux-mtd@lists.infradead.org>;
	Mon,  3 Apr 2006 17:21:23 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id DA2AB1E00FE
	for <linux-mtd@lists.infradead.org>;
	Mon,  3 Apr 2006 16:40:52 +0200 (CEST)
From: Holger Schurig <h.schurig@mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 3 Apr 2006 16:41:22 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604031641.22989.h.schurig@mn-solutions.de>
Subject: behavior of JFFS2 and old data in flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is the following statement correct?

  When I have an JFFS2 file system which was used for some time
  at a customer and now I want to re-flash it, then I have to
  erase the whole flash (e.g. all of the 64 MB), even when my
  image is only 2.5 MB. Otherwise at the next mount JFFS2 might
  intermix sectors from the old image in unerase sectors and
  from the new image".

Now, what if I use sumtool?  AFAIK sumtool stores the erase sectors
inside an the image. Now JFFS2 knows where erased sectors are located 
and doesn't scan the whole image. Therefore the old garbage in the 
not-erased-sectors should't make a problem.

If this statement is true as well, then I could omit the 
tediuous/time-consuming blockwise erase (my chips don't have a 
erase-the-whole-chip function).
