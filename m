Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QAvwc-000414-Vr
	for linux-mtd@lists.infradead.org; Sat, 16 Apr 2011 03:13:15 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] [MTD] [CHIPS] cfi_cmdset_0001.c: put chip into read-array
	mode after unlocking
Date: Fri, 15 Apr 2011 23:13:09 -0400
Message-Id: <1302923589-19226-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1247578544-6950-1-git-send-email-vapier@gentoo.org>
References: <1247578544-6950-1-git-send-email-vapier@gentoo.org>
Cc: Graf Yang <graf.yang@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Graf Yang <graf.yang@analog.com>

We should try and keep the flash in the default read-array mode when
possible so that we are much more likely to properly recover from
unexpected reboot events (such as watchdog expiring).  If we only unlock
the flash, it can stay in that state for a while, so put it into
read-array mode after successful unlocking.

URL: http://blackfin.uclinux.org/gf/tracker/4887
Signed-off-by: Graf Yang <graf.yang@analog.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 drivers/mtd/chips/cfi_cmdset_0001.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 4aaa88f..abe2571 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -2089,6 +2089,11 @@ static int __xipram do_xxlock_oneblock(struct map_info *map, struct flchip *chip
 		goto out;
 	}
 
+	if (chip->state == FL_STATUS) {
+		/* it goes ok, put chip into array mode */
+		map_write(map, CMD(0xff), adr);
+		chip->state = FL_READY;
+	}
 	xip_enable(map, chip, adr);
 out:	put_chip(map, chip, adr);
 	mutex_unlock(&chip->mutex);
-- 
1.7.5.rc1
