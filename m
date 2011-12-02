Received: from mail.frogne.dk ([195.97.164.18])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RWUfX-0003YD-ED
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2011 15:04:57 +0000
Message-Id: <4ED8F1600200008E00014323@mail.frogne.dk>
Date: Fri, 02 Dec 2011 15:40:16 +0100
From: "=?ISO-8859-15?Q?Anders=20M=F8rk-Pedersen?=" <amp@frogne.dk>
To: <linux-mtd@lists.infradead.org>
Subject: pxa2xx-flash.c
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__Part5D72C640.0__="
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__Part5D72C640.0__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,

I've noticed a problem with a patch for the pxa2xx-flash.c map, which has =
been committed to the nextline kernel (currently 3.2-rc3)

The problem is that hardcoded mtd partitions are no longer probed - and =
that breaks a lot of board support modules.

The patch is described as=20
"mtd: pxa2xx-flash.c: use mtd_device_parse_register"

and can be seen here: http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/=
linux.git;a=3Dcommit;h=3D6fcdc92fce81eadcee262a7a66bf3207314fab87

I have created a small patch to address this.

Best regards
Anders Mork-Pedersen <amp@frogne.dk>
Finn Frogne A/S


--=__Part5D72C640.0__=
Content-Type: text/plain; name="pxa2xx-flash-hardcoded_partitions.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="pxa2xx-flash-hardcoded_partitions.patch"

diff -Nur linux-3.2-rc3/drivers/mtd/maps//pxa2xx-flash.c linux-3.2-rc3_patc=
hed/drivers/mtd/maps//pxa2xx-flash.c=0A--- linux-3.2-rc3/drivers/mtd/maps//=
pxa2xx-flash.c	2011-11-24 05:20:28.000000000 +0100=0A+++ linux-3.2-rc3_pat=
ched/drivers/mtd/maps//pxa2xx-flash.c	2011-12-02 12:50:38.000000000 =
+0100=0A@@ -54,6 +54,7 @@=0A 	struct flash_platform_data *flash =3D =
pdev->dev.platform_data;=0A 	struct pxa2xx_flash_info *info;=0A 	=
struct resource *res;=0A+	struct mtd_part_parser_data	ppdata;=0A =
=0A 	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=0A 	if =
(!res)=0A@@ -98,7 +99,10 @@=0A 	}=0A 	info->mtd->owner =3D THIS_MODULE;=
=0A =0A-	mtd_device_parse_register(info->mtd, probes, 0, NULL, =
0);=0A+	ppdata.of_node =3D pdev->dev.of_node;=0A+	mtd_device_parse_re=
gister(info->mtd, probes, &ppdata,=0A+			flash ? flash->part=
s : NULL,=0A+			flash ? flash->nr_parts : 0);=0A =0A 	=
platform_set_drvdata(pdev, info);=0A 	return 0;=0A
--=__Part5D72C640.0__=--
