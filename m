Received: from wr-out-0506.google.com ([64.233.184.238])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HJgYl-0007Hr-IJ
	for linux-mtd@lists.infradead.org; Tue, 20 Feb 2007 20:46:22 -0500
Received: by wr-out-0506.google.com with SMTP id i4so2314091wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 20 Feb 2007 17:46:13 -0800 (PST)
Message-ID: <758a2bbf0702201746p3959235ele3db9b600a9f8104@mail.gmail.com>
Date: Tue, 20 Feb 2007 17:46:13 -0800
From: "Vijay Sampath" <vsampath@gmail.com>
To: joern@wh.fh-wedel.de, linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] CHIPS: oops in cfi_amdstd_sync
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Vijay Sampath <vsampath@gmail.com>

The files cfi_cmdset_0002.c and cfi_cmdset_0020.c do not initialize
their wait queues like is done in cfi_cmdset_0001.c. This causes an
oops when the wait queue is accessed. I have copied the code from
cfi_cmdset_0001.c that is pertinent to initialization of the wait
queue.

Signed-off-by: Vijay Sampath <vsampath@gmail.com>
---

diff -uprN -X linux-2.6.20.1-vanilla/Documentation/dontdiff
linux-2.6.20.1-vanilla/drivers/mtd/chips/cfi_cmdset_0002.c
linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.6.20.1-vanilla/drivers/mtd/chips/cfi_cmdset_0002.c	2007-02-20
17:01:57.000000000 -0800
+++ linux-2.6/drivers/mtd/chips/cfi_cmdset_0002.c	2007-02-20
17:05:23.000000000 -0800
@@ -359,6 +359,8 @@ struct mtd_info *cfi_cmdset_0002(struct
 		cfi->chips[i].word_write_time = 1<<cfi->cfiq->WordWriteTimeoutTyp;
 		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
 		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
+		cfi->chips[i].ref_point_counter = 0;
+		init_waitqueue_head(&(cfi->chips[i].wq));
 	}

 	map->fldrv = &cfi_amdstd_chipdrv;
diff -uprN -X linux-2.6.20.1-vanilla/Documentation/dontdiff
linux-2.6.20.1-vanilla/drivers/mtd/chips/cfi_cmdset_0020.c
linux-2.6/drivers/mtd/chips/cfi_cmdset_0020.c
--- linux-2.6.20.1-vanilla/drivers/mtd/chips/cfi_cmdset_0020.c	2007-02-20
17:01:57.000000000 -0800
+++ linux-2.6/drivers/mtd/chips/cfi_cmdset_0020.c	2007-02-20
17:06:14.000000000 -0800
@@ -158,6 +158,8 @@ struct mtd_info *cfi_cmdset_0020(struct
 		cfi->chips[i].word_write_time = 128;
 		cfi->chips[i].buffer_write_time = 128;
 		cfi->chips[i].erase_time = 1024;
+		cfi->chips[i].ref_point_counter = 0;
+		init_waitqueue_head(&(cfi->chips[i].wq));
 	}

 	return cfi_staa_setup(map);
