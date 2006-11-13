Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GjZ0G-0000XB-Vb
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 10:25:29 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id kADAP489255124
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 10:25:04 GMT
Received: from d06av02.portsmouth.uk.ibm.com (d06av02.portsmouth.uk.ibm.com
	[9.149.37.228])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with
	ESMTP id kADARo9h1577082
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 10:27:50 GMT
Received: from d06av02.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av02.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id kADAP46V023194
	for <linux-mtd@lists.infradead.org>; Mon, 13 Nov 2006 10:25:04 GMT
Message-ID: <455847FE.3080900@vnet.ibm.com>
Date: Mon, 13 Nov 2006 11:25:02 +0100
From: Timo Lindhorst <lindhors@vnet.ibm.com>
MIME-Version: 1.0
To: hermes33@freenet.de
Subject: Re: number mtd partitions on 16 limits?
References: <E1GjYhU-00007r-PL@www8.emo.freenet-rz.de>
In-Reply-To: <E1GjYhU-00007r-PL@www8.emo.freenet-rz.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robert,

> I need more than 16 mtd partitions on a omap1610 (arm) with kernel 2.4.20. 
> I create 16 partitions. All ok, 'cat /proc/mtd' show mtd0 to mtd15. 
> I create 17 partitions. 'cat /proc/mtd' show only mtd0 to mtd15. 
> It seems to give a limit with 16 partitions. 
> Where can I change that? can someone help me?

I think this patch fixes that.

Kind regards,
Timo

Subject: [PATCH] set MAX_MTD_DEVICES to 64
From: Timo Lindhorst <lindhors@vnet.ibm.com>
Signed-off-by: Timo Lindhost <lindhors@vnet.ibm.com>
---
  include/linux/mtd/mtd.h |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

--- ubi-2.6.orig/include/linux/mtd/mtd.h
+++ ubi-2.6/include/linux/mtd/mtd.h
@@ -23,7 +23,7 @@

  #define MTD_CHAR_MAJOR 90
  #define MTD_BLOCK_MAJOR 31
-#define MAX_MTD_DEVICES 16
+#define MAX_MTD_DEVICES 64

  #define MTD_ERASE_PENDING              0x01
  #define MTD_ERASING            0x02
