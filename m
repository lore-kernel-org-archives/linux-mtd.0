Received: from ptb-relay01.plus.net ([212.159.14.212])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CcOBh-0007on-Tl
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 08:18:31 -0500
Received: from [80.229.56.123] (helo=central.bult.co.uk)
	by ptb-relay01.plus.net with esmtp (Exim) id 1CcOBf-00060Q-2j
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2004 13:18:27 +0000
Received: from squizzey.bult.co.uk (squizzey.bult.co.uk [10.1.0.4])
	by central.bult.co.uk (Postfix) with ESMTP id A94511D3A6C
	for <linux-mtd@lists.infradead.org>;
	Thu,  9 Dec 2004 14:27:55 +0000 (GMT)
From: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Date: Thu, 09 Dec 2004 13:18:44 +0000
Message-Id: <1102598324.21453.20.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: problems with "JFFS2 write speed"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm using JFFS2 on a USB key. (using mtdblock)

Works well, read speed is blinding ..

If I use ext2, the write speed is measured in Mb/sec ..
Using jffs2 it's 29k / sec ..

Running Linux 2.6.9 ..

Anyone got any ideas re; speedups ?

tia
Gareth.
