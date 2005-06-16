Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dj0L6-0001Xe-6R
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 15:47:49 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Dj0Ed-0000LO-6P
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 21:41:13 +0200
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2005 21:41:07 +0200
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 Jun 2005 21:41:07 +0200
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Thu, 16 Jun 2005 19:39:58 +0000 (UTC)
Message-ID: <loom.20050616T213451-152@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: I2C FRAM
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

sory if this is FAQ, but I got a 64 kBit FRAM on I2C bus (FM24CL64) and I was
wandering what is the best way to make it usable? Is there an mtd driver to turn
it into a char and/or block device?

Sergei Sharonov
