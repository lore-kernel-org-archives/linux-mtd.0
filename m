Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mCfE-0007aG-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 13:20:12 +0100
Date: Tue, 3 Sep 2002 14:25:29 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch 3] create macros in mtd.h for partitioning transition
Message-ID: <20020903122529.GC18497@wohnheim.fh-wedel.de>
References: <20020903121449.GA18497@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="uQr8t48UFsdbeI+V"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020903121449.GA18497@wohnheim.fh-wedel.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, 3 September 2002 14:14:49 +0200, Jörn Engel wrote:
> Whis one introduces MTD_DEVICE, MTD_PARTITION and friends.
> 
> Jörn

I really should remember to attach the stuff.

--uQr8t48UFsdbeI+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="diff_partition_macros.patch"

diff -Naur infradead/include/linux/mtd/mtd.h 0_staa_no_rodev/include/linux/mtd/mtd.h
--- infradead/include/linux/mtd/mtd.h	Tue Sep  3 14:02:04 2002
+++ 0_staa_no_rodev/include/linux/mtd/mtd.h	Tue Nov 27 15:55:12 2001
@@ -29,19 +29,7 @@
 
 #define MTD_CHAR_MAJOR 90
 #define MTD_BLOCK_MAJOR 31
-
-/* 16 devices with 16 partitions each */
 #define MAX_MTD_DEVICES 16
-#define MAX_MTD_PARTITIONS 16
-#define MAX_MTD_MINOR 256
-
-/*
- * FIXME: The "& 15" could be removed from MTD_DEVICE and MTD_MINOR, 
- * but we keep the extra safety for now.
- */
-#define MTD_DEVICE(minor) (((minor) >> 4) & 15 )
-#define MTD_PARTITION(minor) ((minor) & 15)
-#define MTD_MINOR(dev,part) ((((dev) & 15) << 4) | ((part) & 15))
 
 
 

--uQr8t48UFsdbeI+V--
