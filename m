Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkOQT-0003cB-ND
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2004 10:38:34 -0400
Received: from [10.1.1.113] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	13 Jul 2004 10:38:30 -0400
Date: Tue, 13 Jul 2004 10:34:17 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0407131025060.22458@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: destroying maps, and secure sectors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   two questions.  first, what is the standard order for cleanup 
operations in a map file?  based on what i've read in several sample 
files, it seems that the consensus is

   1) EITHER del_mtd_partitions() or del_mtd_device()
   2) map_destroy()
   3) iounmap()

i'm not familiar with the mechanics of map_destroy(), but it seems to 
offend aesthetic sensibilities to have a routine called map_destroy(), 
immediately followed by a routine that explicitly accesses a portion 
of that map object to run iounmap().  it reminds me of that old canard 
from college programming class -- don't delete a node from a linked 
list, then try to follow the next pointer of that same node.

   given that everyone seems to agree on the above order, i'll stick 
with it, but it sure seems counter-intuitive.

   second, how does one define a secure sector?  (a pointer to a URL 
would work just great.)  our system flash chip has a secure sector at 
offset 0, size 64K (overlaid with the boot loader).  the way this was 
defined in the code i inherited was to (wait for it) hack mtdchar.c, 
specifically look for any partition definition that was <=64K, and 
return from mtd_notify_add() without doing any processing.  i'm pretty 
sure that's not what i want to do. :-)

   hints?

rday
