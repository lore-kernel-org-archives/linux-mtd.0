Received: from mail-pu1apc01on0088.outbound.protection.outlook.com
 ([104.47.126.88] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayTCT-0000Ko-Ir
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 00:01:01 +0000
From: Iwo Mergler <iwo.mergler@netcommwireless.com>
Subject: [PATCH] mtd: nandbiterrs: Support for NAND biterrors test on
 platforms without raw write
To: <linux-mtd@lists.infradead.org>
CC: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, Huang Shijie <b32955@freescale.com>
Message-ID: <572BDE8C.3020703@netcommwireless.com>
Date: Fri, 6 May 2016 10:00:12 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,


I'm vaguely aware that there is an ongoing effort to move this
stuff to mtd-utils, but I was unable to find a source tree
with the work so far.

Below is a single-line patch for the kernel tests, feel free
to apply to the userspace source as well.


Best regards,

Iwo


Support for NAND biterrors test on platforms without raw write

While the default test mode relies on raw write (mtd_write_oob) to introduce
bit errors into a page, the rewrite test mode doesn't need it.

Some drivers use eldritch data/ECC arrangements in a NAND page and reshuffle
things on-the-fly, to present a normal page view to the kernel. Typically,
raw write / read is unsupported on such platforms. Examples are Freescale
MXS and Qualcomm MDM9 and probably many others.

Changed the overwrite test to use normal writes.

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
