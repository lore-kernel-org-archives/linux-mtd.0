Received: from mail-pz0-f41.google.com ([209.85.210.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwKky-0000An-1B
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 21:13:04 +0000
Received: by mail-pz0-f41.google.com with SMTP id 4so1999386pzk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 24 Aug 2011 14:13:03 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 0/2] mtd: nand: support OOB without ECC
Date: Wed, 24 Aug 2011 14:12:22 -0700
Message-Id: <1314220344-10986-1-git-send-email-computersforpeace@gmail.com>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
	Kevin Cernekee <cernekee@gmail.com>, Jim Quinlan <jim2101024@gmail.com>,
	linux-mtd@lists.infradead.org, liu.h.jason@gmail.com,
	Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is an update to the first two patches from my RFC I sent earlier:

  http://lists.infradead.org/pipermail/linux-mtd/2011-August/037522.html

I have determined that the problems I am facing regarding `nandwrite -n'
and `nanddump -n -o' are unique to hardware that performs error
correction when doing OOB-only operations. AFAICT, this is not
widespread in MTD.

These patches supply a new replaceable interface, where systems that
need to do so can supply their own {read,write}_oob_raw functions.
Otherwise, the NAND system will simply use the same OOB functions for
both raw and normal read/write, making little to no change in the
overall operation of most systems.

I've tested to make sure this doesn't break anything with nandsim, but
any further testing on other hardware would be great. Also, if anyone
else can confirm that their system does not perform 'noecc' operations
correctly, then let me know.

Brian

Brian Norris (2):
  mtd: support writing OOB without ECC
  mtd: support reading OOB without ECC

 drivers/mtd/mtdchar.c        |   17 ++++++++++-------
 drivers/mtd/nand/nand_base.c |   18 ++++++++++++++++--
 include/linux/mtd/nand.h     |    6 ++++++
 3 files changed, 32 insertions(+), 9 deletions(-)

-- 
1.7.5.4
