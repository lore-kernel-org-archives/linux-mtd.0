Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DqB9x-0002eu-Pj
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 10:46:01 -0400
Received: from dsl-082-082-157-117.arcor-ip.net ([82.82.157.117]:2480
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1DqBDK-0001OC-OM
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jul 2005 16:49:27 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1DqB9l-0003JY-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jul 2005 16:45:45 +0200
Date: Wed, 6 Jul 2005 16:45:45 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050706144545.GA11447@zappa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: xip changes between 2.6.11 and 20050530?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello to the list members!

I had XIP in linux-2.6.11 running very well.
Then I patched a mtd snapshot from 20050530 in in order to get code into
there which properly unlock intel K3 flash devices properly (which is
not solved yet).
Now the xipuImage freezes at booting when it comes to

Probing scb9328_flash at physical address 0x10000000 (16-bit buswidth)

Are there any changes between the both versions which I should be aware
of? The xip.h looks still reasonable though, I don't get it.

What I doscovered is the NO_XIP define which was introduced into some
mapping drivers, should I take care of that and put it into mine also?
I did not found out yet, what it does really...

regards, Konsti
