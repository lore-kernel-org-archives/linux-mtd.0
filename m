Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BhtM9-0000eu-A9
	for linux-mtd@lists.infradead.org; Tue, 06 Jul 2004 13:03:46 -0400
Received: from [10.1.1.113] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org; 6 Jul 2004 13:03:39 -0400
Date: Tue, 6 Jul 2004 12:59:21 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0407061252430.20268@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: defining flash partitions given 4x4M flash setup
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   given an rpxlite board with a 4x4M flash setup, i'm looking at the 
code in rpxlite.c by a previous programmer who defined the 
partitioning.

   first, i notice that, because this board has 4 4M flash chips, he 
defined WINDOW_SIZE in the map_info structure as 0x00400000 (4M), 
although the actual single call to ioremap uses the values:

ioremap(WINDOW_ADDR, WINDOW_SIZE * 4);

to represent the full 16M. is that the correct way to handle multiple 
chips that define a single contiguous address space?

   second, i notice that, whereas pretty well all the examples in 
drivers/mtd/maps use:

map.virt = ... ioremap ...

this person seemed set on using

map.map_priv_1 = ... ioremap ...

and, obviously, continued using the map_priv_1 field consistently for 
the rest of the routine.  is there an accepted practice for using the 
"virt" field, which is what i had assumed.  not sure what the use of 
"map_priv_1" was all about.

   thanks again.  back to adding command-line partitioning.

rday
