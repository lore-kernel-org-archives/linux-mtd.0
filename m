Received: from [204.214.131.136] (helo=hooper2.licor.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15gVMm-0005jG-00
	for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2001 19:01:04 +0100
From: "Chris Lesiak" <clesiak@licor.com>
To: linux-mtd@lists.infradead.org,
	"Siders, Keith" <keith_siders@toshibatv.com>
Message-ID: <86256AC3.006369F1.00@hooper2.licor.com>
Date: Mon, 10 Sep 2001 12:55:28 -0500
Subject: Re: Partition question...
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
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


I also have two banks mapped contiguously into virtual memory that I would
like to be seen as one.

The problem is that RedBoot (and ECOS) seems to only support one flash
logical device.  I wrote an ECOS flash driver that treated both banks as a
single large logical device.  RedBoot stores its partition table in the last
erase
block of the device.  So in my case, a single partition table is store in the
last
erase block of the second bank but partitions the space of both banks.

When I get to the linux, mtd seems to expect a partition table for each bank.

What is the best way to reconcile the problem?
Can linux also easily see both banks as a single device that can be partitioned?

Chris Lesiak
clesiak@licor.com



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


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
