Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OG9OS-0001OR-Gq
	for linux-mtd@lists.infradead.org; Sun, 23 May 2010 11:30:58 +0000
Subject: Re: ubifs became broken on contigous power-fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexander Pazdnikov <pazdnikov@list.ru>
In-Reply-To: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 23 May 2010 14:28:32 +0300
Message-ID: <1274614112.22999.17.camel@localhost>
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

On Tue, 2010-05-11 at 18:43 +0400, Alexander Pazdnikov wrote:
> Hello.
> 
> We are stress-testing 8 devices by power loss in 5 minutes interval.
> Device uses sqlite database to store collected data, every 1 minute accumulated data (500-1000 records) is stored into database in transaction.
> 
> ubifs (ubi2:dbfs on /usr/local/ecom/db bellow) with database on 6 of 8 devices after different time (1-3 days) became broken.
> 
> Any advise for futher debugging or solving this problem is highly appriciated.
> 
> 
> kernel 2.6.32.12
> 
> suspicious ->       reserved GC LEB:     -1
> 
> # cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00020000 00020000 "bootstrap"
> mtd1: 00080000 00020000 "uboot"
> mtd2: 00020000 00020000 "uboot_env1"
> mtd3: 00020000 00020000 "uboot_env2"
> mtd4: 02000000 00020000 "ubi_main"
> mtd5: 02000000 00020000 "ubi_var"
> mtd6: 0bf00000 00020000 "ubi_database"
> 
> 
> mounting ubi2:dbfs on startup 
> [   14.328117] UBIFS: recovery needed
> [   53.941378] UBIFS error (pid 462): ubifs_rcvry_gc_commit: could not find a dirty LEB

This is must be a bug. UBIFS should always have space for GC. I will
think how we can track this down, although I have a very limited amount
of time.

> [   89.606399] UBIFS: recovery completed

This is another small problem - UBIFS actually failed to recover. So
instead of continuing, it should return error. I've inlined a patch
which should fix this - we basically forgot to check function return
code.

> [   89.609329] UBIFS assert failed in mount_ubifs at 1358 (pid 462)
> [   89.616165] [<c0026144>] (unwind_backtrace+0x0/0xe4) from [<c0125ce4>] (ubifs_fill_super+0x11d0/0x1c4c)
> [   89.625930] [<c0125ce4>] (ubifs_fill_super+0x11d0/0x1c4c) from [<c0126910>] (ubifs_get_sb+0x1b0/0x354)
> [   89.635696] [<c0126910>] (ubifs_get_sb+0x1b0/0x354) from [<c008a50c>] (vfs_kern_mount+0x50/0xe0)
> [   89.644485] [<c008a50c>] (vfs_kern_mount+0x50/0xe0) from [<c008a5e0>] (do_kern_mount+0x34/0xdc)
> [   89.653274] [<c008a5e0>] (do_kern_mount+0x34/0xdc) from [<c00a29d8>] (do_mount+0x148/0x7cc)
> [   89.662063] [<c00a29d8>] (do_mount+0x148/0x7cc) from [<c00a30f4>] (sys_mount+0x98/0xc8)
> [   89.670852] [<c00a30f4>] (sys_mount+0x98/0xc8) from [<c0021f40>] (ret_fast_syscall+0x0/0x28)

Yeah, these further assertion failures are because we did not find GC
LEB, and ignored 'ubifs_rcvry_gc_commit()' error code. 

The below patch will not fix your problem, but should at least make
UBIFS fail immidiately, instead of continuing working in a wrong state
and spitting a lot of warnings. I've also pushed this patch to the
ubifs-2.6.git, and if it is OK, will later merge it upstream.

But the root cause of the error you see remains unknown...

>From d3cd7a16efce60c8509df7b5f19e7d2fb1b6899c Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Sun, 23 May 2010 14:16:13 +0300
Subject: [PATCH] UBIFS: check return code

The error code from 'ubifs_rcvry_gc_commit()' was ignored, so UBIFS
failed to recover and contunued. Instead, we should refise mounting
the file-system.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/ubifs/super.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 4d2f215..010eea0 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1307,6 +1307,8 @@ static int mount_ubifs(struct ubifs_info *c)
 			if (err)
 				goto out_orphans;
 			err = ubifs_rcvry_gc_commit(c);
+			if (err)
+				goto out_orphans;
 		} else {
 			err = take_gc_lnum(c);
 			if (err)
-- 
1.6.6.1

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
