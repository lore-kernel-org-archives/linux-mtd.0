Received: from smtp20.doorway.no ([212.4.49.47])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LKbi8-0003h9-1K
	for linux-mtd@lists.infradead.org; Wed, 07 Jan 2009 16:56:52 +0000
Received: from dware1013.doorway.loc ([10.0.20.23])
	by smtp20.doorway.no (IceWarp 9.3.2) with SMTP id ORL65246
	for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2009 17:56:46 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH 1/1] Changeable NAND_MAX_PAGESIZE and NAND_MAX_OOBSIZE
Date: Wed, 7 Jan 2009 17:49:21 +0100
Message-ID: <2DE39384A09B744FA1E53FD4BF78D4305364C6@dware1013.doorway.loc>
From: "Eirik Aanonsen" <eaa@wprmedical.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is it feasible to get acceptance for implementing the two values
NAND_MAX_PAGESIZE and max NAND_MAX_OOBSIZE for the nand driver as a more
dynamic value?

The suggestion here is probably the easiest one and could be wrong for
all I know. Please don't chop my head off for trying. I am not
experienced in submitting patches

Signed-off-by: Eirik Aanonsen <eaa@wprmedical.com>
---

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index fcbdf87..68c96c6 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -387,4 +387,26 @@ config MTD_NAND_FSL_UPM
 	  Enables support for NAND Flash chips wired onto Freescale
PowerPC
 	  processor localbus with User-Programmable Machine support.
=20
+comment "WARNING: NAND expert options"
+
+config MTD_NAND_MAX_PAGESIZE
+	int "NAND_MAX_PAGESIZE for nand page buffer. Size in KiB"
+	depends on MTD_NAND
+	default "2048"
+	help
+	  This allows you to configure the max page size on the nand
driver.
+	  Allows you to change the reserved memory for use in the nand
driver.
+	  WARNING: This value should not be subject to change without=20
+	  extensive knowledge
+
+config MTD_NAND_MAX_OOBSIZE
+	int "NAND_MAX_OOBSIZE for nand oob buffer. Size in KiB"
+	depends on MTD_NAND
+	default "64"
+	help
+	  This allows you to configure the max oob size on the nand
driver.
+	  Allows you to change the reserved memory for use in the nand
driver.
+	  WARNING: This value should not be subject to change without=20
+	  extensive knowledge
+
 endif # MTD_NAND
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 53ea3dc..cb5ce99 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -45,8 +45,16 @@ extern void nand_wait_ready(struct mtd_info *mtd);
  * is supported now. If you add a chip with bigger oobsize/page
  * adjust this accordingly.
  */
+#ifdef MTD_NAND_MAX_OOBSIZE
+#define NAND_MAX_OOBSIZE	CONFIG_MTD_NAND_MAX_OOBSIZE
+#else
 #define NAND_MAX_OOBSIZE	64
+#endif
+#ifdef MTD_NAND_MAX_PAGESIZE
+#define NAND_MAX_PAGESIZE	CONFIG_MTD_NAND_MAX_PAGESIZE
+#else
 #define NAND_MAX_PAGESIZE	2048
+#endif
=20
 /*
  * Constants for hardware specific CLE/ALE/NCE function
