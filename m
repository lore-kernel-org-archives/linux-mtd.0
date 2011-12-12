Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaDOd-0007nV-CU
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2011 21:26:52 +0000
Received: by lahc1 with SMTP id c1so691158lah.36
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2011 13:26:49 -0800 (PST)
Subject: Re: [PATCH] libmtd: allow write operations when MEMWRITE is not
 supported
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 12 Dec 2011 23:26:43 +0200
In-Reply-To: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
References: <1323459914-25294-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323725206.2297.24.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-12-09 at 11:45 -0800, Brian Norris wrote:
> MEMWRITE is a recently introduced write interface for MTD; however, it
> is, for now, only supported on NAND flash. mtd-utils should fall back to
> old write methods when either ENOTTY or EOPNOTSUPP are returned.
> 
> This is a showstopper when, for instance, using ubiformat on NOR, which
> don't have a mtd->write_oob interface (and thus don't support MEMWRITE):
> 
>   ubiformat: formatting eraseblock 2 --  1 % complete  libmtd: error!: MEMWRITE ioctl failed for eraseblock 2 (mtd3)
>           error 122 (Operation not supported)
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

I guess this require an urgent mtd-utils release.

Also, why you say 'for now', does even make-sense to implement this for
NOR?

I've also just pushed this patch, does it look OK to you?

>From a4699233f927738db633687a2276a9f3e127d799 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
Date: Mon, 12 Dec 2011 23:24:59 +0200
Subject: [PATCH] mtd: document that MEMWRITE ioctl is NAND-specific

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 include/mtd/mtd-abi.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 1a7e1d2..36eace0 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -198,7 +198,8 @@ struct otp_info {
 #define MEMISLOCKED		_IOR('M', 23, struct erase_info_user)
 /*
  * Most generic write interface; can write in-band and/or out-of-band in various
- * modes (see "struct mtd_write_req")
+ * modes (see "struct mtd_write_req"). This ioctl is not supported for flashes
+ * without OOB, e.g., NOR flash.
  */
 #define MEMWRITE		_IOWR('M', 24, struct mtd_write_req)
 
-- 
1.7.6.4
