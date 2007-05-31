Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Htfug-00061i-06
	for linux-mtd@lists.infradead.org; Thu, 31 May 2007 04:21:45 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HtfZK-0007mN-N7
	for linux-mtd@lists.infradead.org; Thu, 31 May 2007 09:59:39 +0200
Received: from 82-69-61-204.dsl.in-addr.zen.co.uk ([82.69.61.204])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 May 2007 09:59:38 +0200
Received: from mw_phil by 82-69-61-204.dsl.in-addr.zen.co.uk with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 May 2007 09:59:38 +0200
To: linux-mtd@lists.infradead.org
From: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: Optimum way to copy JFFS2 f-s to backup/restore mtd partition ?
Date: Thu, 31 May 2007 07:41:14 +0000 (UTC)
Message-ID: <loom.20070531T093838-52@post.gmane.org>
References: <loom.20070517T182222-432@post.gmane.org>
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

MikeW <mw_phil <at> yahoo.co.uk> writes:

>
>OK, I can manually use the MTD ioctl()s or mtd-utils to erase,
>and then read()-write() or dd or cp(io) between the /dev/mtdX ... mtdY.
>
>I was hoping there might be a mtd-util that would do repeated erase-copy sector,
>maybe using 'zero-copy' operations like sendfile(). Not yet !
>
>So, what might be the recommended 'best' way to achieve this transfer,
>based on experience of the underlying implementation ?
>
>And if just copying file-by-file into an empty partition, is there any benefit
>(space overhead; fragmentation) to be had by ordering the files being copied
>in any particular way ... by size; by directory; by frequency of use ?
>
>Best regards,
>Thx,
>MikeW
                                                              
OK, looks like nobody knows ... or cares !
Will post again if I find anything useful.

MikeW



gmane..pad
