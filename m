Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bg8nj-0007Uk-S0
	for linux-mtd@lists.infradead.org; Thu, 01 Jul 2004 17:09:02 -0400
Received: from [10.1.1.107] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org; 1 Jul 2004 17:08:56 -0400
Date: Thu, 1 Jul 2004 17:04:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0407011652160.6003@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: couple questions about defining flash partitions on my rpxlite
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   from my reading of the kernel source and looking at a old rpxlite.c 
file that was hacked for a previous project, i just want to clarify a 
couple things about defining flash partitions on an rpxlite board.
(i want to set this up under the 2.6 kernel, but i'm also looking at 
an rpxlite.c file from a previous 2.4-based project.)

1) if i start with a single 8M flash chip, i'm assuming i need
    to define only a single map_info structure containing the basic
    info for that flash chip.  that is, name, size, buswidth and so
    on.  i ask since, in this hacked version, the programmer defined
    a separate map_info structure (with, of course, identical info)
    for every partition he created on that same chip -- i have no idea
    why, and it certainly seems like overkill.

2) in that same 2.4-based rpxlite.c file, the map_info structure
    defined the various read/write/copy routines.  however, in 2.6,
    i see that you don't have to define these unless you select
    "non-linear mappings of flash chips" during the kernel
    configuration, is that correct?


    that should do for now.  thanks.

rday
