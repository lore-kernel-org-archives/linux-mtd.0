Received: from q7.q7.com ([207.173.201.42])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DYVRg-0002Lv-6Z
	for linux-mtd@lists.infradead.org; Wed, 18 May 2005 16:47:13 -0400
Received: from q7.q7.com (localhost [127.0.0.1])
	by q7.q7.com (8.12.8/8.12.8) with ESMTP id j4IKlDBn001771
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-mtd@lists.infradead.org>; Wed, 18 May 2005 13:47:13 -0700
Received: from localhost (joey@localhost)
	by q7.q7.com (8.12.8/8.12.8/Submit) with ESMTP id j4IKlDgZ001767
	for <linux-mtd@lists.infradead.org>; Wed, 18 May 2005 13:47:13 -0700
Date: Wed, 18 May 2005 13:47:13 -0700 (PDT)
From: Joe Pruett <joey@clean.q7.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.44.0505181336090.25317-100000@q7.q7.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: questions about at91rm9200, intel 28f, and non-linear access
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

we're building a board around the atmel at91rm9200 chip.  we also are
using an intel 256 mbit flash.  we have just discovered that the atmel
chip has a lovely bug such that address line 24 isn't correctly wired to
the outside world, so you can't address things above 16mb in each chip
select area.  but, we can manually control a24 via the pio controller on
the chip.

so, i'm thinking we can use the non-linear hooks to drive a24 high/low as 
needed based on the address being accessed.  we add some overhead by 
needing not being able to just access the flash directly, but we also 
have 
64mb of dram, so i think we're ok there.

has anyone else tried to solve this kind of problem?  am i just looking 
for trouble?

if that all seems reasonable, then the next step is bootstrapping brand 
new boards.  we are using umon as the first level boot and without major 
work it can't see beyond the 16mb boundary.  so i'm thinking of doing the 
following:

allocate 4 or 8mb to umon and its tfs filesystem area.  upload the initial
image via jtag magic.  put a linux kernel and a small cramfs file system
in there.  boot into that in single user mode and use the modified mtd
drivers talked about above to erase and write a jffs2 image (retrieved via
ethernet) into the remaining 24/28 meg of flash.  the cramfs area would
have code to pivot to the jffs2 image for normal operations.

it looks like the mtdblock interface handles erasing for me, so i should 
just be able to dd a jffs2 image directly to /dev/mtd....  am i missing 
anything horribly obvious?  any feedback on any part of this scheme would 
be greatly appreciated.  if anyone from atmel is listening, fix your chip!
