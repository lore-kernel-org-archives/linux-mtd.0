Received: from vms173017pub.verizon.net ([206.46.173.17])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LiqtY-0005XV-QR
	for linux-mtd@lists.infradead.org; Sun, 15 Mar 2009 14:00:58 +0000
Received: from linux.duda.tzo.com ([96.237.188.170]) by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KGJ00FFMW95E8VI@vms173017.mailsrvcs.net> for
	linux-mtd@lists.infradead.org; Sun, 15 Mar 2009 09:00:41 -0500 (CDT)
Received: from [192.168.1.10] (jim [192.168.1.10])
	by linux.duda.tzo.com (Postfix) with ESMTP id 48B581BC0003	for
	<linux-mtd@lists.infradead.org>; Sun, 15 Mar 2009 10:00:38 -0400 (EDT)
Message-id: <49BD0A05.9050701@duda.tzo.com>
Date: Sun, 15 Mar 2009 10:00:37 -0400
From: Jim Duda <jim@duda.tzo.com>
MIME-version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND Controller Device Driver Questions
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am an ASIC designer of System On Chip devices.  I am currently
tasked with designing a new  high-speed NAND controller for the
company I work for.  The new controller must look forward many
years and anticipate the needs for MLC (2 and 3 bit) NAND devices.

I have a design in mind.  Before I commit my architecture to silicon,
I want to make sure my design is compatible with JFFS(2), YAFFS(2),
and MTD.  I'm posting here looking for some good advice.

I have read all I can find in regards to JFFS, YAFFS, and MTD.
I have read the FAQ for mtd and looked at some of the postings
for the past few months.

I have three specific questions for this mailing list:

1) Low Level Driver

Before I bless my design, I need to convince myself that an
MTD driver can be written for my controller.  I've written
a few linux drivers, Ethernet, Serial I/O, and RTC.  I'm
no expert, but I am comfortable with how to do this.

I've studied the MTD NAND Driver API found here:
http://www.linux-mtd.infradead.org/tech/mtdnand/index.html

If I understand this correctly, I believe I need to satisfy myself
that my controller can support all the functions classified as
either [MTD Interface] and [Default] as defined on the
above link.

Is my understanding correct?
Are there other requirements I'm missing?

2) ECC

I need to create a controller which is forward looking in
regards to ECC.  As the silicon geometries for MLC NAND
go down, the ECC requirements go up.  Today, we are
looking at 4-bit correction for a 512 byte block (MLC),
however,in a year or two, those requirements are going
to move  towards 8 and 12 bits per 512 byte block. 
Even higher requirements for any 3-bit MLC technology.
Even SLC will need higher ECC for lower geometries.

My controller will have full hardware support for
ECC encode and decode.  I have no need for a firmware
calculation or check of ECC.  The controller will be
flexible in the amount of ECC it can support.

What I want to do is allow for a flexible ECC data
storage mechanism.  My plan will prevent me from
using the traditional mechanism of storing the ECC
in the spare area.  I cannot use the spare area default
schemes as currently defined in the API.

Assuming I have  a device driver which can hide where/how
the ECC is stored, do I really need to follow this recipe?

My driver can certainly expose the data and ECC in
the proper structure as required by the API, relocating
the ECC to the storage position as defined by my
controller needs.

Does this sound reasonable?

3) Tag Bytes

My understanding is that I need to store a specific
amount of TAG Information per page. 

For YFSS1, I need 10 bytes per page, which includes
the 1 byte of Vendor Bad Block Management.

For YFFS2, I need 18 bytes per page, which includes
the 1 byte of Vendor Bad Block Management.

Where are the Spare requirements for JFFS(2) located?
Do I need to just read the source code?

For a 512 byte page NAND device which has 16 bytes
of spare, I need to set aside 10 bytes for the File
System, and I can use the other 6 bytes however
I choose for ECC management.

For a 2K and 4K byte page NAND device, which has
128/224 bytes of spare, I need to set aside 18 bytes for
the File System, and I can use the remaining bytes
however I choose for ECC management.

I realized I need to leave the vendor Bad Block byte
in its fixed location, as defined by the Flash vendor.

Is my assumption about how to use the spare location
correct?

I appreciate any feedback or pointers of what
else I should be reading.

Thanks,

Jim
