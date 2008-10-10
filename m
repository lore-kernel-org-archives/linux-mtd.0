Received: from plexity.net ([206.123.115.38])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KoP6D-0001TY-Lh
	for linux-mtd@lists.infradead.org; Fri, 10 Oct 2008 21:00:37 +0000
Date: Fri, 10 Oct 2008 14:00:36 -0700
From: Deepak Saxena <dsaxena@plexity.net>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Understanding UBIFS flash overhead
Message-ID: <20081010210036.GA12173@trantor.hsd1.or.comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
Reply-To: dsaxena@plexity.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Artem,

I'm working on getting UBIFS going on the OLPC XO and am trying to
understand what I am seeing in regards to file system size. 

I have partitioned the 1GiB mtd device into a 32MiB JFFS boot partition
for OFW, a 128KiB partition to hold the Redboot partition table,
and the remainder (991.625) for use by UBI.

The NAND device has 128KiB EBs with a 2KiB pages and we are running w/o
sub-page writes. Plugging this into the overhead calculation, we get:

SP	PEB Size		128KiB
SL	LEB Size		128KiB - 2 * 2KiB = 124 KiB
P	Total PEBs 		991.625MiB / 128KiB = 7933
B	Reserved PEBsg		79(1%)
O	Overhead= SP - SL	4KiB


UBI Overhead = (B + 4) * SP + O * (P - B - 4) 
             = (79 + 4) * 128Kib + 4 KiB * (7933 - 79 - 4)
             = 42024 KiB 
             = 329.3125 PEBs (round to 329)

This leaves us with 7604 PEBs or 973312KiB available for user data. 

At boot up, I see:

UBIFS: file system size: 995237888 bytes (971912 KiB, 949 MiB,
UBIFS: journal size: 9023488 bytes (8812 KiB, 8 MiB, 72 LEBs)

'df' returns:

Filesystem             Size   Used  Avail Use% Mounted on
mtd0                   822M   242M   581M  30% /

I expect some overhead, but I'm really wondering where over 100MiB of
space went!

This is 2.6.25 with UBI 2.6.25 tree merged in. Does that tree have
any bugfixes from 2.6.26+ backported?

~Deepak

-- 
   _____   __o  Deepak Saxena - Living CarFree and CareFree          (o>
------    -\<,  "When I see an adult on a bicycle, I do not despair  //\
 ----- ( )/ ( )  for the future of the human race." -H.G Wells       V_/_
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
