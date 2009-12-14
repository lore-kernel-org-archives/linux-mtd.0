Received: from exprod6ob109.obsmtp.com ([64.18.1.22] helo=psmtp.com)
	by bombadil.infradead.org with smtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NKIJ6-0000NV-06
	for linux-mtd@lists.infradead.org; Mon, 14 Dec 2009 21:18:20 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH] excite_nandflash.c: user resource_size()
Date: Mon, 14 Dec 2009 16:18:15 -0500
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090200EA4A@mi8nycmail19.Mi8.com>
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

Use resource_size().

Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
David Woodhouse <dwmw2@infradead.org>

---

diff --git a/drivers/mtd/nand/excite_nandflash.c =
b/drivers/mtd/nand/excite_nandflash.c
index 72446fb..bd323e4 100644
--- a/drivers/mtd/nand/excite_nandflash.c
+++ b/drivers/mtd/nand/excite_nandflash.c
@@ -79,7 +79,7 @@ excite_nand_map_regs(struct platform_device *d, const =
char *basename)
 	    excite_nand_get_resource(d, IORESOURCE_MEM, basename);
=20
 	if (r)
-		result =3D ioremap_nocache(r->start, r->end + 1 - r->start);
+		result =3D ioremap_nocache(r->start, resource_size(r));
 	return result;
 }
 =20
