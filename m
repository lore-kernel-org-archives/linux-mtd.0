Received: from las-dsl250-cust100.mpowercom.net
	([208.57.250.100] helo=mail.fortunet.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17w8Ss-0007tZ-00
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 22:52:30 +0100
Received: from fortunet.com (router [208.57.250.99])
	by mail.fortunet.com (8.9.3/8.9.3) with ESMTP id NAA12564
	for <linux-mtd@lists.infradead.org>; Mon, 30 Sep 2002 13:46:45 -0700
Message-ID: <3D98C715.7080801@fortunet.com>
Date: Mon, 30 Sep 2002 14:50:13 -0700
From: Boris Itkis <boris@fortunet.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Fix bug with the assumtion that cmdset_priv is always valid
Content-Type: multipart/mixed;
 boundary="------------080804020908080905040804"
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

This is a multi-part message in MIME format.
--------------080804020908080905040804
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jedec probe produces P_ID_INTEL_STD (semi cfi flash configuration) 
without cmdset_priv. So I
fixed cfi_cmdset_0001.c to live with this by testing for cmdset_priv and 
working around the
missing data.

Files affected:

drivers/mtd/chips/cfi_cmdset_0001.c


--------------080804020908080905040804
Content-Type: text/plain;
 name="diff_f10_2"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="diff_f10_2"

diff -urN linux-2.4.19/drivers/mtd/chips/cfi_cmdset_0001.c linux.orig/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.4.19/drivers/mtd/chips/cfi_cmdset_0001.c	Mon Sep 30 09:50:46 2002
+++ linux.orig/drivers/mtd/chips/cfi_cmdset_0001.c	Mon Sep 30 10:04:06 2002
@@ -300,6 +300,8 @@
 	 */
 	switch (chip->state) {
 	case FL_ERASING:
+		if (!((struct cfi_pri_intelext *)cfi->cmdset_priv))
+			goto sleep; /* Must be in Jedec Mode so assume sleep */
 		if (!(((struct cfi_pri_intelext *)cfi->cmdset_priv)->FeatureSupport & 2))
 			goto sleep; /* We don't support erase suspend */
 		
@@ -543,6 +545,14 @@
 	struct cfi_private *cfi = map->fldrv_priv;
 	struct cfi_pri_intelext *extp=cfi->cmdset_priv;
 	int base_offst,reg_sz;
+
+	if(!extp)
+	{
+		printk(KERN_WARNING
+			"%s: This flash devive is a Jedec Flash so no protection data to read!\n"
+			,map->name);
+		return 0;
+	}
 	
 	/* Check that we actually have some protection registers */
 	if(!(extp->FeatureSupport&64)){

--------------080804020908080905040804--
