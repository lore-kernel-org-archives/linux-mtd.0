Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4BXd-0002pI-71
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 14:04:21 +0000
Received: by eaai12 with SMTP id i12so303473eaa.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 07:04:14 -0700 (PDT)
Sender: Castet Matthieu <matthieu.castet@gmail.com>
From: Matthieu CASTET <matthieu.castet@parrot.com>
To: linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
Subject: [PATCH] UBI : erase free PEB with bitflip in EC header
Date: Wed, 22 Aug 2012 16:03:46 +0200
Message-Id: <1345644226-32555-1-git-send-email-matthieu.castet@parrot.com>
Cc: Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Without this patch, these PEB are not scrubbed until we put data in them.
Bitflip can accumulate latter and we can loose the EC header (but VID header
should be intact and allow to recover data)

Signed-off-by: Matthieu Castet <matthieu.castet@parrot.com>
---
 drivers/mtd/ubi/attach.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
index bd27cbb..68d4d1f 100644
--- a/drivers/mtd/ubi/attach.c
+++ b/drivers/mtd/ubi/attach.c
@@ -975,7 +975,7 @@ static int scan_peb(struct ubi_device *ubi, struct ubi_attach_info *ai,
 			return err;
 		goto adjust_mean_ec;
 	case UBI_IO_FF:
-		if (ec_err)
+		if (ec_err || bitflips)
 			err = add_to_list(ai, pnum, UBI_UNKNOWN,
 					  UBI_UNKNOWN, ec, 1, &ai->erase);
 		else
-- 
1.7.10.4
