Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJFd1-0005On-1n
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 14:51:51 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DJFZY-0008Ue-CX
	for linux-mtd@lists.infradead.org; Wed, 06 Apr 2005 20:48:22 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2005 20:48:16 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2005 20:48:16 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 6 Apr 2005 18:47:22 +0000 (UTC)
Message-ID: <loom.20050406T200915-152@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: long umount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I sometimes see excessively long umount times (40-60 s) with jffs2/nand. 
The platform is a custom at91rm9200 board running linux 2.6.10 with 
mtd snapshot from 3/28/2005. Umount is from busybox. The umount time varies
but the system is mostly idle during it unlike during mount. After a few
operations with filesystem it goes away until sometime later. Has anybody 
seen that?

Sergei Sharonov
