Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3kVq-0002Xz-4S
	for linux-mtd@lists.infradead.org; Wed, 17 Mar 2004 23:31:50 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i2HNVhO10327
	for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2004 12:31:43 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i2HNVhF10320
	for <linux-mtd@lists.infradead.org>; Thu, 18 Mar 2004 12:31:43 +1300
Received: from tait.co.nz ([172.25.107.91])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HUQ009DGUOU7C@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 12:31:43 +1300 (NZDT)
Date: Thu, 18 Mar 2004 12:30:41 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
In-reply-to: <405632E3.9040509@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <4058DFA1.2080707@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
References: <405632E3.9040509@tait.co.nz>
Subject: Re: mtdparts howto required!!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't you just love it when someone replies to their own post!!

Problem solved - it would be nice if it were written down somewhere that 
the physmap.c example is only that - a non-working example in that it 
doesn't define a master mtd device which means you can't define the 
partitions on it!!

Also, when a master device is defined there is nothing to indicate that 
the mtdparts command line has to use the same name as the mtd_id - in 
fact I've found nothing that defines what mtd_id is. Who would have 
believed that I needed a command line of the form
mtdparts=phys_mapped_flash:7M(jffs2),256K(u-boot),-(kernel)
in order to use the default name (which doesn't work for reasons above 
anyway!!)

Oh well - its kept me entertained for 3 days instead of doing real work...

Robin Gilks wrote:
> Greetings
> 
> I'm trying to map 3 partitions into a single flash device using the 
> mtdparts command line stuff. I'm using a 2.4.22 kernel cross compiled 
> from i686 to PowerPC with mtd patches from CVS as of 19th Feb.
> 
[snip]


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
