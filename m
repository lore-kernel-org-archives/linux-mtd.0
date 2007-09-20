Received: from smtp26.poczta.onet.pl ([213.180.130.97])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IYQZV-0007cw-O3
	for linux-mtd@lists.infradead.org; Thu, 20 Sep 2007 14:16:21 -0400
Received: from data-01.subscribers.sferia.net ([193.41.113.225]:17903 "EHLO
	[172.29.14.122]") by ps26.test.onet.pl with ESMTP
	id <S5567325AbXITSB6> (ORCPT <rfc822;linux-mtd@lists.infradead.org>);
	Thu, 20 Sep 2007 20:01:58 +0200
Subject: NAND08GW3B2AN6E support
From: Adam Nowak <uboot@op.pl>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Thu, 20 Sep 2007 20:00:44 +0200
Message-Id: <1190311244.2922.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have to add support for NAND chip on the custom board. The chip is
NAND08GW3B2AN6E (ST Microelectronics, 8Gbit, bus:8, page:2048B). 

Is it already supported by any driver? If not, what is the best way to
start? I guess that the quickest way is to modify the existing (similar)
driver. The problem is that I am not sure which of them would be
similar. Your tips would be helpful.

Thanks,
Adam
