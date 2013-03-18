Received: from mail-bk0-x22f.google.com ([2a00:1450:4008:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHQVJ-0003LF-Ru
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2013 03:12:54 +0000
Received: by mail-bk0-f47.google.com with SMTP id jc3so2245375bkc.20
 for <linux-mtd@lists.infradead.org>; Sun, 17 Mar 2013 20:12:51 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 18 Mar 2013 11:12:51 +0800
Message-ID: <CAPgLHd8Uj4-OWahuXSMxcb4Z3siukbveTm=bWNO1toatPwwcmg@mail.gmail.com>
Subject: [PATCH -next] UBIFS: fix missing unlock on error in ubifs_remount_rw()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dedekind1@gmail.com, adrian.hunter@intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Add the missing unlock before return from function ubifs_remount_rw()
in the error handling case.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 fs/ubifs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index f21acf0..9791b3c 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1571,7 +1571,7 @@ static int ubifs_remount_rw(struct ubifs_info *c)
 	if (c->space_fixup) {
 		err = ubifs_fixup_free_space(c);
 		if (err)
-			return err;
+			goto out;
 	}
 
 	err = check_free_space(c);
