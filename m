Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CwdUO-0001gK-AW
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 04:41:29 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1CwdTK-0007Zu-On
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2005 10:40:22 +0100
Received: from 212.130.19.66 ([212.130.19.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Feb 2005 10:40:22 +0100
Received: from martin by 212.130.19.66 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 03 Feb 2005 10:40:22 +0100
To: linux-mtd@lists.infradead.org
From: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
Date: Thu, 03 Feb 2005 10:31:42 +0100
Message-ID: <ctsr0r$94m$1@sea.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Writing frequently to NAND - wearing, caching?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

I have an application which may need to write states frequently to my 
nand-fs in order to have these states in case of powerdown.
But I'm a bit concerned about wearing the nand if I write to frequently.

So, if I only need to write, say, 100 bytes every second, how often will 
this actually be flushed to the nand?
Is there a maximum commit/flush frequency built in the driver? Or can 
this be configured?
I know this is a very diffuse question, but hopefully you get my drift.

BR,
  Martin Egholm
