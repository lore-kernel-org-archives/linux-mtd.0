Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BgOeO-0001Ap-1J
	for linux-mtd@lists.infradead.org; Fri, 02 Jul 2004 10:04:24 -0400
Received: from [10.1.1.107] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org; 2 Jul 2004 10:04:21 -0400
Date: Fri, 2 Jul 2004 10:00:07 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0407020944070.5576@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: more confusion: how to define a map_info for multi-chip board?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   another (annoyingly, i'm sure) picky question about rewriting my 
rpxlite.c file to add command line parsing.

   what's the proper protocol for defining a map_info structure for a 
board that has multiple flash chips to support a single address space? 
in the case of an rpxlite board, the default rpxlite.c reads as 
follows:
==============================
#define WINDOW_ADDR 0xfe000000 
#define WINDOW_SIZE 0x800000      (8M chip, but there are four of them)

static struct mtd_info *mymtd;

static struct map_info rpxlite_map = {
         .name = "RPX",
         .size = WINDOW_SIZE,     (so map_info defines size of 8M ...)
         .buswidth = 4,
         .phys = WINDOW_ADDR,
};

int __init init_rpxlite(void)
{
   printk(KERN_NOTICE "...", WINDOW_SIZE*4, WINDOW_ADDR);
         rpxlite_map.virt = (unsigned long)ioremap(WINDOW_ADDR, WINDOW_SIZE * 4);
================================

but obviously, the actual mapping has to take into account that there 
are 4 of those chips: "WINDOW_SIZE * 4".  so i'm concluding that, in 
cases like this, the map_info size should represent a single chip, 
while the remapping should obviously refer to the entire address 
space, is this correct?

almost there ...

rday
