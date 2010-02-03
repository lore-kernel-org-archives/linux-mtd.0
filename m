Received: from mail-bw0-f221.google.com ([209.85.218.221])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NchR2-0007Rw-MV
	for linux-mtd@lists.infradead.org; Wed, 03 Feb 2010 15:46:37 +0000
Received: by bwz21 with SMTP id 21so1142866bwz.4
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Feb 2010 07:46:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <ce9ab5791001130448x40a78141u27668f72965cae95@mail.gmail.com>
References: <ce9ab5791001130448x40a78141u27668f72965cae95@mail.gmail.com>
From: Vimal Singh <vimal.newwork@gmail.com>
Date: Wed, 3 Feb 2010 21:16:10 +0530
Message-ID: <ce9ab5791002030746m1c25ed47rdea5efb3efb3c86@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Adding NAND lock / unlock routines
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

>From a28c230f3bd8fa765f78c0be91370f146e71f670 Mon Sep 17 00:00:00 2001
From: Vimal Singh <vimalsingh@ti.com>
Date: Wed, 3 Feb 2010 14:33:48 +0530
Subject: [PATCH v2 0/2] Adding NAND lock / unlock routines

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
