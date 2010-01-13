From: vimalsingh@ti.com (Vimal Singh)
Date: Wed, 13 Jan 2010 18:14:04 +0530
Subject: [PATCH] Adding NAND lock / unlock routines
Message-ID: <mailman.144.1263386943.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Adding NAND lock / unlock routines

Vimal Singh (2):
  Adding nand lock/unlock routines.
  Creating helper func for block alignment verfication

 drivers/mtd/nand/nand_base.c |  210 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/nand.h     |   10 ++
 2 files changed, 202 insertions(+), 18 deletions(-)
