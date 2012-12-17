Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkP3S-0006AC-4N
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 00:59:38 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so8303183iea.36
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2012 16:59:36 -0800 (PST)
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 0/2] mtd: cmdlinepart: minor fixes handling zero sized
 partitions
Date: Sun, 16 Dec 2012 19:59:28 -0500
Message-Id: <cover.1355438632.git.christophercordahi@nanometrics.ca>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Removing zero sized partitions was introduced in commit
7baf04261062826ea225ab23e07c541e279143fa.
http://permalink.gmane.org/gmane.linux.drivers.mtd/43507
These changes fix a minor error and make the handling more consistent.

Christopher Cordahi (2):
  mtd: cmdlinepart: fix skipping zero sized partition
  mtd: cmdlinepart: skip partitions truncated to zero

 drivers/mtd/cmdlinepart.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)
