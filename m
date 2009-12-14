Received: from exprod6ob113.obsmtp.com ([64.18.1.30] helo=psmtp.com)
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKI9m-0001DV-Sg
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:08:43 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] au1550nd.c: remove unnecessary casts
Date: Mon, 14 Dec 2009 16:08:37 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA45@mi8nycmail19.Mi8.com>
From: "H Hartley Sweeten" <hartleys@visionengravers.com>
To: "kernel list" <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Remove unnecessary casts for p_nand, it is already a void __iomem *.

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index 92c334f..35f35f0 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -542,7 +542,7 @@ static int __init au1xxx_nand_init(void)
 	}
 	nand_phys =3D (mem_staddr << 4) & 0xFFFC0000;
=20
-	p_nand =3D (void __iomem *)ioremap(nand_phys, 0x1000);
+	p_nand =3D ioremap(nand_phys, 0x1000);
=20
 	/* make controller and MTD agree */
 	if (NAND_CS =3D=3D 0)
@@ -587,7 +587,7 @@ static int __init au1xxx_nand_init(void)
 	return 0;
=20
  outio:
-	iounmap((void *)p_nand);
+	iounmap(p_nand);
=20
  outmem:
 	kfree(au1550_mtd);
@@ -608,7 +608,7 @@ static void __exit au1550_cleanup(void)
 	kfree(au1550_mtd);
=20
 	/* Unmap */
-	iounmap((void *)p_nand);
+	iounmap(p_nand);
 }
=20
 module_exit(au1550_cleanup);=20
