Received: from [207.152.29.75] (helo=server3.toshibatv.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15X4cH-0004LK-00
	for <linux-mtd@lists.infradead.org>; Wed, 15 Aug 2001 18:38:05 +0100
Message-ID: <7DF7BFDC95ECD411B4010090278A44CA0A3BEF@ATVX>
From: "Siders, Keith" <keith_siders@toshibatv.com>
To: linux-mtd@lists.infradead.org
Subject: Partition question...
Date: Wed, 15 Aug 2001 12:41:47 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

If the addressing between two Flash devices remains linear with no gaps, 
can they be part of the same mtd[n] partition, or must the next chip be
mtd[n+1]?

I have two 32-bit Flash devices (or so I'm told). Since this is a MIPS
application the
reset vector is 0xBFC00000. The Flash devices are 0xBE000000-BEFFFFFF and 
0xBF000000-BFFFFFFF, so I have 4Megs at the top of the second device, with
the
first device and lower 12Megs of the second giving me 28Megs of linear Flash

available. 

Keith Siders
Software Engineer
 Toshiba America Consumer Products, Inc.
Advanced Television Technology Center
801 Royal Parkway, Suite 100
Nashville, Tennessee 37214
Phone: (615) 257-4050
Fax:   (615) 453-7880
