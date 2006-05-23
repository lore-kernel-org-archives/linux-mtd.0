Received: from sccmmhc91.asp.att.net ([204.127.203.211])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FiXas-0002Pz-F8
	for linux-mtd@lists.infradead.org; Tue, 23 May 2006 10:10:45 -0400
From: jmrobert5@mchsi.com
To: linux-mtd@lists.infradead.org
Date: Tue, 23 May 2006 14:10:40 +0000
Message-Id: <052320061410.24390.447317E00004605700005F46219791336303010CD2079C080C03BFCA9B9D0A0D019D0306@mchsi.com>
Subject: Anyone know the DoC2000 Header?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,


I think my problems are that I am somehow getting 0x00 in the nftl_header in
place of the 0xff for the UnitSizeFactor that supposed to be there.

Does someone know the offset for the UnitSizeFactor value?

I am thinking that for a quick test, if I got one of my bad DoCs and set that
byte to 0xff, if that works then thats the issue.  But then theres the ??? of
how it got that way???  And how to avoid it.

Thanks!

--
Joe Robertson
Yamaha YZF600R Thundercat
