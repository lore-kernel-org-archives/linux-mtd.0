Received: from mail-yk0-f173.google.com ([209.85.160.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhgzE-0008Vx-ML
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 15:08:53 +0000
Received: by mail-yk0-f173.google.com with SMTP id 142so2135781ykq.32
 for <linux-mtd@lists.infradead.org>; Tue, 06 May 2014 08:08:30 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v2] nandtest: Allow multiple read & check iterations
Date: Tue,  6 May 2014 12:07:48 -0300
Message-Id: <1399388869-5815-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Huang Shijie <b32955@freescale.com>, Pekon Gupta <pekon@ti.com>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch extends the nandtest to allow multiple read & check iterations.
Repeating the read-and-check multiple times, stresses driver's ECC engine and
has been useful to discover poor stability in an old (not mainline) OMAP2 NAND
driver.

The new 'reads' parameters, allows to simulate a more realistic workload:

  1. erase block
  2. write data
  3. read and check (N times)

By default, we set the "read and check" iteration count to four (4).

Ezequiel Garcia (1):
  nandtest: Introduce multiple reads & check iterations

 nandtest.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

-- 
1.9.1
