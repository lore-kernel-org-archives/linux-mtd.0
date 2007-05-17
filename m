Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hoj20-0003tC-BD
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 12:41:01 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Hoj0Q-0000JM-CF
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 18:39:10 +0200
Received: from office.ubiquisys.com ([88.96.204.222])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 18:39:10 +0200
Received: from mw_phil by office.ubiquisys.com with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 17 May 2007 18:39:10 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Optimum way to copy JFFS2 f-s to backup/restore mtd partition ?
Date: Thu, 17 May 2007 16:37:11 +0000 (UTC)
Message-ID: <loom.20070517T182222-432@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OK, I can manually use the MTD ioctl()s or mtd-utils to erase,
and then read()-write() or dd or cp(io) between the /dev/mtdX ... mtdY.

I was hoping there might be a mtd-util that would do repeated erase-copy sector,
maybe using 'zero-copy' operations like sendfile(). Not yet !

So, what might be the recommended 'best' way to achieve this transfer,
based on experience of the underlying implementation ?

And if just copying file-by-file into an empty partition, is there any benefit
(space overhead; fragmentation) to be had by ordering the files being copied
in any particular way ... by size; by directory; by frequency of use ?

Best regards,
Thx,
MikeW
