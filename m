Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgNBg-0000b9-J2
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 08:30:41 -0400
Received: from [10.1.1.107] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org; 2 Jul 2004 08:30:37 -0400
Date: Fri, 2 Jul 2004 08:26:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0407020819380.5155@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: adding cmd-line partitioning to rpxlite.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   i was going to take a shot at adding command-line partitioning to 
rpxlite.c (seems easy enough), but was confused by an example shown in 
another map file.

   according to cmdlinepart.c, the format for the command line is:

  * mtdparts=<mtddef>[;<mtddef]
  * <mtddef>  := <mtd-id>:<partdef>[,<partdef>]
  * <partdef> := <size>[@offset][<name>][ro]
  * <mtd-id>  := unique name used in mapping driver/device (mtd->name)
  * <size>    := standard linux memsize OR "-" to denote all remaining space
  * <name>    := '(' NAME ')'

from what i've seen, each partition has to have an <mtddef> identifier 
to associate to a map.  i thought that this identifier corresponded to 
the map_info.name field (that would make sense), but in 
lubbock_flash.c, i notice the definitions in defining maps for two 
flash chips:

         lubbock_maps[flashboot^1].name = "Lubbock Application Flash";
         lubbock_maps[flashboot].name = "Lubbock Boot ROM";

these name values have embedded spaces.  how exactly does that work in 
trying to use command-line partitioning here?  or did i misread how to
specify the <mtddef> field on the the command line?

or, to be more brief, how would one use command-line partitioning for 
lubbock-flash.c?  i'm going to do a more careful re-reading of 
cmdlinepart.c to see what i missed.  thanks.

rday
