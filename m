Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OGAFi-0003GS-V3
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 12:26:00 +0000
Subject: Re: ubifs became broken on contigous power-fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Pazdnikov <pazdnikov@list.ru>
In-Reply-To: <1274614112.22999.17.camel@localhost>
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<1274614112.22999.17.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 23 May 2010 15:23:39 +0300
Message-ID: <1274617419.22999.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Sun, 2010-05-23 at 14:28 +0300, Artem Bityutskiy wrote:
> On Tue, 2010-05-11 at 18:43 +0400, Alexander Pazdnikov wrote:
> > Hello.
> > 
> > We are stress-testing 8 devices by power loss in 5 minutes interval.
> > Device uses sqlite database to store collected data, every 1 minute accumulated data (500-1000 records) is stored into database in transaction.
> > 
> > ubifs (ubi2:dbfs on /usr/local/ecom/db bellow) with database on 6 of 8 devices after different time (1-3 days) became broken.
> > 
> > Any advise for futher debugging or solving this problem is highly appriciated.
> > 
> > 
> > kernel 2.6.32.12
> > 
> > suspicious ->       reserved GC LEB:     -1
> > 
> > # cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 00020000 00020000 "bootstrap"
> > mtd1: 00080000 00020000 "uboot"
> > mtd2: 00020000 00020000 "uboot_env1"
> > mtd3: 00020000 00020000 "uboot_env2"
> > mtd4: 02000000 00020000 "ubi_main"
> > mtd5: 02000000 00020000 "ubi_var"
> > mtd6: 0bf00000 00020000 "ubi_database"
> > 
> > 
> > mounting ubi2:dbfs on startup 
> > [   14.328117] UBIFS: recovery needed
> > [   53.941378] UBIFS error (pid 462): ubifs_rcvry_gc_commit: could not find a dirty LEB
> 
> This is must be a bug. UBIFS should always have space for GC. I will
> think how we can track this down, although I have a very limited amount
> of time.

'ubifs_rcvry_gc_commit()' is poorly documented and I do not remember how
it works already (argh! and it was written by Adrian :-) ), but I cooked
up a patch for you. I'll try to look at this issue some more later and
make sure I really understand how 'ubifs_rcvry_gc_commit()' works. But
for now, try the following patch:

>From 019acd23e01e33406eb325fadb9bd89fd4e8c374 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 23 May 2010 15:20:21 +0300
Subject: [PATCH] UBIFS: try harder to find gc_leb

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/recovery.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 109c6ea..5e2a438 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -1063,8 +1063,10 @@ int ubifs_rcvry_gc_commit(struct ubifs_info *c)
 	}
 	err = ubifs_find_dirty_leb(c, &lp, wbuf->offs, 2);
 	if (err) {
-		if (err == -ENOSPC)
-			dbg_err("could not find a dirty LEB");
+		if (err == -ENOSPC) {
+			dbg_rcvry("could not find a dirty LEB");
+			goto find_free;
+		}
 		return err;
 	}
 	ubifs_assert(!(lp.flags & LPROPS_INDEX));
-- 
1.6.6.1

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
