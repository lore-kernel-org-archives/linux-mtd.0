From: vimalsingh@ti.com (Vimal Singh)
Date: Wed, 3 Feb 2010 14:33:48 +0530
Subject: [PATCH v2 0/2] Adding NAND lock / unlock routines
Message-ID: <mailman.188.1265211998.2170.linux-mtd@lists.infradead.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

This patch set adds nand lock/unlock routines.

In 2nd version: (As requested by Artem)
 - I have renamed 'block_alignment_verification' to 'check_offs_len'
 - I have changed the sequence of patches

Vimal Singh (2):
  Creating helper func for 'ofs' and 'len' verification for
    'nand_erase_nand'
  Adding nand lock/unlock routines.

 drivers/mtd/nand/nand_base.c |  212 ++++++++++++++++++++++++++++++++++++++----
 include/linux/mtd/nand.h     |   10 ++
 2 files changed, 204 insertions(+), 18 deletions(-)
