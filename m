Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NV2ee-0007IJ-2R
	for linux-mtd@lists.infradead.org; Wed, 13 Jan 2010 12:49:01 +0000
Received: by bwz4 with SMTP id 4so15497815bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Jan 2010 04:48:54 -0800 (PST)
MIME-Version: 1.0
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 13 Jan 2010 18:18:34 +0530
Message-ID: <ce9ab5791001130448x40a78141u27668f72965cae95@mail.gmail.com>
Subject: [PATCH 0/2] Adding NAND lock / unlock routines
To: Linux MTD <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From cde21be80002b49fb8baeb341e8ae5a1a2394cb6 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Wed, 13 Jan 2010 18:14:04 +0530
Subject: [PATCH] Adding NAND lock / unlock routines

Adding NAND lock / unlock routines

Vimal Singh (2):
  Adding nand lock/unlock routines.
  Creating helper func for block alignment verfication

 drivers/mtd/nand/nand_base.c |  210 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/nand.h     |   10 ++
 2 files changed, 202 insertions(+), 18 deletions(-)
