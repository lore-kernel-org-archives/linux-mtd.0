Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGmsv-0003xK-7x
 for linux-mtd@lists.infradead.org; Sun, 28 Oct 2018 15:21:50 +0000
From: Richard Weinberger <richard@nod.at>
To: Ben Greear <greearb@candelatech.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: read-only FS with error -2
Date: Sun, 28 Oct 2018 16:21:31 +0100
Message-ID: <12453083.5lVtCAIVAB@blindfold>
In-Reply-To: <80fe0c51-d651-13ac-a985-a0ee6b5d7edd@candelatech.com>
References: <14ebdb35-43e6-47b6-e947-2d9f9cee100b@candelatech.com>
 <1802789.Q3TFOnfEdj@blindfold>
 <80fe0c51-d651-13ac-a985-a0ee6b5d7edd@candelatech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben,

Am Sonntag, 28. Oktober 2018, 16:08:13 CET schrieb Ben Greear: 
> That is not an easy thing to do on random embedded systems.  Possibly I could add a kernel

Debugging random non-development systems is never easy.

> command line option...is that supported?

The UBIFS module takes no parameters. But patches are welcome.
For now you can just use your initramfs (AFAIK OpenWRT has one), boot with rdinit=/bin/sh ...

Or apply a hacky patch like this one to enable chk_fs always...

diff --git a/fs/ubifs/debug.h b/fs/ubifs/debug.h
index 64c6977c189b..ea0ffc0a9660 100644
--- a/fs/ubifs/debug.h
+++ b/fs/ubifs/debug.h
@@ -231,7 +231,7 @@ static inline int dbg_is_chk_lprops(const struct ubifs_info *c)
 }
 static inline int dbg_is_chk_fs(const struct ubifs_info *c)
 {
-	return !!(ubifs_dbg.chk_fs || c->dbg->chk_fs);
+	return 1;
 }
 static inline int dbg_is_tst_rcvry(const struct ubifs_info *c)
 {

Thanks,
//richard
