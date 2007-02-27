Received: from bay0-omc1-s15.bay0.hotmail.com ([65.54.246.87])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HM8Pf-0002MV-NY
	for linux-mtd@lists.infradead.org; Tue, 27 Feb 2007 19:55:08 +0000
Message-ID: <BAY107-F19A82530DA0DA9C1AAA51EEF820@phx.gbl>
From: "sam nathan" <sam-natha@hotmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD driver for ATMEL AT49BV642D flash chip
Date: Tue, 27 Feb 2007 13:54:52 -0600
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MTD driver for ATMEL AT49BV642D flash chip

I am working with a board based on ATMEL AT91RM9200 micro.
This board uses the ATMEL flash part AT49BV642D [8MByte,
16 bit wide flash]. I am using the linux distribution
2.4.27-vrs1.

I'm relatively new to MTD in Linux and  I am trying to
build a jffs2 file system on AT49BV642D flash.

I have the following questions:

1. Is there any matching MTD driver for Atmel AT49BV642D
parallel flash?

2. I learn from ATMEL's datasheet that this chip supports
CFI. Does CFI detection  work for Atmel AT49BV642D?
Has anyone  been able to make the CFI detection working for
AT49BV642D using 2.4.27-vrs1? If so, can you provide some
insight into this?

I would appreciate any help on this.

Thanks,
S.

_________________________________________________________________
Refi Now: Rates near 39yr lows!  $430,000 Mortgage for $1,399/mo - Calculate 
new payment 
http://www.lowermybills.com/lre/index.jsp?sourceid=lmb-9632-17727&moid=7581
