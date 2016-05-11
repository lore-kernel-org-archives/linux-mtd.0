Received: from mail-sg2apc01on0066.outbound.protection.outlook.com
 ([104.47.125.66] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b0O3R-0001ns-Ip
 for linux-mtd@lists.infradead.org; Wed, 11 May 2016 06:55:34 +0000
Subject: Re: [PATCH] mtd: nandbiterrs: Support for NAND biterrors test on
 platforms without raw write
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <572BDE8C.3020703@netcommwireless.com>
 <20160508184451.3d90176a@bbrezillon> <57300D8A.8040607@netcommwireless.com>
 <20160510104851.53dc8211@bbrezillon>
CC: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
From: Iwo Mergler <iwo.mergler@netcommwireless.com>
Message-ID: <5732D741.5090406@netcommwireless.com>
Date: Wed, 11 May 2016 16:54:57 +1000
MIME-Version: 1.0
In-Reply-To: <20160510104851.53dc8211@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Support for NAND biterrors test on platforms without raw write

While the default test mode relies on raw write (mtd_write_oob) to introduce
bit errors into a page, the rewrite test mode doesn't need it.

Changed the overwrite test to use normal writes. The default test mode
is unaffected and still requires raw write as before.

Signed-off-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
---
  drivers/mtd/tests/nandbiterrs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/tests/nandbiterrs.c 
b/drivers/mtd/tests/nandbiterrs.c
index 09a4cca..f26dec8 100644
--- a/drivers/mtd/tests/nandbiterrs.c
+++ b/drivers/mtd/tests/nandbiterrs.c
@@ -290,7 +290,7 @@ static int overwrite_test(void)

      while (opno < max_overwrite) {

-        err = rewrite_page(0);
+        err = write_page(0);
          if (err)
              break;

-- 
2.7.3
