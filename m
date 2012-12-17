Received: from mail-ia0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TkP3W-0006AZ-U2
 for linux-mtd@lists.infradead.org; Mon, 17 Dec 2012 00:59:43 +0000
Received: by mail-ia0-f177.google.com with SMTP id u21so4774628ial.36
 for <linux-mtd@lists.infradead.org>; Sun, 16 Dec 2012 16:59:41 -0800 (PST)
From: Christopher Cordahi <christophercordahi@nanometrics.ca>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 1/2] mtd: cmdlinepart: fix skipping zero sized partition
Date: Sun, 16 Dec 2012 19:59:29 -0500
Message-Id: <714bcce84fccef617818f8916475a666f880cbf1.1355438632.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355438632.git.christophercordahi@nanometrics.ca>
References: <cover.1355438632.git.christophercordahi@nanometrics.ca>
In-Reply-To: <cover.1355438632.git.christophercordahi@nanometrics.ca>
References: <cover.1355438632.git.christophercordahi@nanometrics.ca>
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

Decrement index i after skipping a zero sized partition.  On next loop
iteration, the index will be the same as before, but the data will be
new as it was moved when earlier partition was skipped.

Signed-off-by: Christopher Cordahi <christophercordahi@nanometrics.ca>
---
 drivers/mtd/cmdlinepart.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/cmdlinepart.c b/drivers/mtd/cmdlinepart.c
index c533f27..c1efb4c 100644
--- a/drivers/mtd/cmdlinepart.c
+++ b/drivers/mtd/cmdlinepart.c
@@ -337,6 +337,7 @@ static int parse_cmdline_partitions(struct mtd_info *master,
 			part->num_parts--;
 			memmove(&part->parts[i], &part->parts[i + 1],
 				sizeof(*part->parts) * (part->num_parts - i));
+			i--;
 			continue;
 		}
 
-- 
1.7.1
