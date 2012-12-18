Received: from mail-ia0-f169.google.com ([209.85.210.169])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tl4UL-0005bJ-Ja
 for linux-mtd@lists.infradead.org; Tue, 18 Dec 2012 21:14:10 +0000
Received: by mail-ia0-f169.google.com with SMTP id r4so1032410iaj.14
 for <linux-mtd@lists.infradead.org>; Tue, 18 Dec 2012 13:14:07 -0800 (PST)
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 0/2] mtd: cmdlinepart: update file documentation
Date: Tue, 18 Dec 2012 16:11:50 -0500
Message-Id: <cover.1355863937.git.christophercordahi@nanometrics.ca>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Huang Shijie <b32955@freescale.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Update the comments at the top of the file to better reflect the command
line parsing and fix /proc/mtd comment.

Christopher Cordahi (2):
  mtd: cmdlinepart: describe mtd ordering
  mtd: cmdlinepart: update /proc/mtd comment

 drivers/mtd/cmdlinepart.c |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)
