Received: from soft.uni-linz.ac.at ([140.78.95.99]
	helo=zeus.soft.uni-linz.ac.at)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FBuzP-0000tF-Aa
	for linux-mtd@lists.infradead.org; Wed, 22 Feb 2006 09:29:19 -0500
Received: from [140.78.95.234] (wall4.soft.uni-linz.ac.at [140.78.95.234])
	by zeus.soft.uni-linz.ac.at (8.11.7p1+Sun/8.11.1) with ESMTP id
	k1METAa09499 for <linux-mtd@lists.infradead.org>;
	Wed, 22 Feb 2006 15:29:10 +0100 (MET)
Message-ID: <43FC7532.6070404@soft.uni-linz.ac.at>
From: Simon Vogl <vogl@soft.uni-linz.ac.at>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------090705090108060804080106"
Subject: [PATCH] cfi: init wait queue in chip struct
Reply-To: simon.vogl@researchstudios.at
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 22 Feb 2006 14:29:21 -0000

This is a multi-part message in MIME format.
--------------090705090108060804080106
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

This patch fixes a kernel oops for Intel P30 flashes, where
the wait queue head was not initialized, which in turn caused
a crash at the first read operation.
Simon

--
_______________________________________________________________________
Dr. Simon Vogl ARC Seibersdorf research GmbH Research Studios Austria,
Studio Pervasive Computing Applications Aubrunnerweg 1, A-4040 Linz,
Austria Tel: +43 732 2468-5350, Fax: +43 732 2468-25350 mailto:
simon.vogl@researchstudio.at


--------------090705090108060804080106
Content-Type: text/x-patch;
 name="init_wq.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="init_wq.patch"

diff -ur linux-2.6.15.4.mtd-git/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.6.15.4/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.15.4.mtd-git/drivers/mtd/chips/cfi_cmdset_0001.c	2006-02-21 15:23:34.000000000 +0100
+++ linux-2.6.15.4/drivers/mtd/chips/cfi_cmdset_0001.c	2006-02-22 11:48:29.000000000 +0100
@@ -408,6 +408,7 @@
 		cfi->chips[i].buffer_write_time = 1<<cfi->cfiq->BufWriteTimeoutTyp;
 		cfi->chips[i].erase_time = 1<<cfi->cfiq->BlockEraseTimeoutTyp;
 		cfi->chips[i].ref_point_counter = 0;
+		init_waitqueue_head(&(cfi->chips[i].wq));
 	}
 
 	map->fldrv = &cfi_intelext_chipdrv;

--------------090705090108060804080106--
