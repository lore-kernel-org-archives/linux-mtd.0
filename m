Received: from mail01d.mail.t-online.hu ([84.2.42.6])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NTc26-00007o-9k
	for linux-mtd@lists.infradead.org; Sat, 09 Jan 2010 14:11:18 +0000
Message-ID: <4B488E60.4070604@freemail.hu>
Date: Sat, 09 Jan 2010 15:10:40 +0100
From: =?UTF-8?B?TsOpbWV0aCBNw6FydG9u?= <nm127@freemail.hu>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 2/3] nand: make USB device id constant
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Julia Lawall <julia@diku.dk>, linux-mtd@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>, cocci@diku.dk
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Márton Németh <nm127@freemail.hu>

The id_table field of the struct usb_device_id is constant in <linux/usb.h>
so it is worth to make alauda_table also constant.

The semantic match that finds this kind of pattern is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
disable decl_init,const_decl_init;
identifier I1, I2, x;
@@
	struct I1 {
	  ...
	  const struct I2 *x;
	  ...
	};
@s@
identifier r.I1, y;
identifier r.x, E;
@@
	struct I1 y = {
	  .x = E,
	};
@c@
identifier r.I2;
identifier s.E;
@@
	const struct I2 E[] = ... ;
@depends on !c@
identifier r.I2;
identifier s.E;
@@
+	const
	struct I2 E[] = ...;
// </smpl>

Signed-off-by: Márton Németh <nm127@freemail.hu>
Cc: Julia Lawall <julia@diku.dk>
Cc: cocci@diku.dk
---
diff -u -p a/drivers/mtd/nand/alauda.c b/drivers/mtd/nand/alauda.c
--- a/drivers/mtd/nand/alauda.c 2010-01-07 19:08:42.000000000 +0100
+++ b/drivers/mtd/nand/alauda.c 2010-01-08 04:26:29.000000000 +0100
@@ -49,7 +49,7 @@

 #define TIMEOUT HZ

-static struct usb_device_id alauda_table [] = {
+static const struct usb_device_id alauda_table[] = {
 	{ USB_DEVICE(0x0584, 0x0008) },	/* Fujifilm DPC-R1 */
 	{ USB_DEVICE(0x07b4, 0x010a) },	/* Olympus MAUSB-10 */
 	{ }
