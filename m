Received: from mail.frogne.dk ([195.97.164.18])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RXSd2-0001wa-Te
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 07:06:21 +0000
Message-Id: <4EDC7B590200008E00014334@mail.frogne.dk>
Date: Mon, 05 Dec 2011 08:05:45 +0100
From: "=?ISO-8859-15?Q?Anders=20M=F8rk-Pedersen?=" <amp@frogne.dk>
To: <linux-mtd@lists.infradead.org>
Subject: pxa2xx-flash.c
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__PartCEE15159.0__="
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

--=__PartCEE15159.0__=
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

I have done as you instructed and created a patch for "git am" and
attached it to this mail.

I've also sent a copy to: Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com>

Best regards
Anders


On Fri, 2011-12-02 at 15:40 +0100, Anders Mørk-Pedersen wrote:
> Hi,
> 
> I've noticed a problem with a patch for the pxa2xx-flash.c map, which
has been committed to the nextline kernel (currently 3.2-rc3)
> 
> The problem is that hardcoded mtd partitions are no longer probed -
and that breaks a lot of board support modules.
> 
> The patch is described as 
> "mtd: pxa2xx-flash.c: use mtd_device_parse_register"
> 
> and can be seen here:
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=commit;h=6fcdc92fce81eadcee262a7a66bf3207314fab87
> 
> I have created a small patch to address this.

Looks OK, but could you please send a patch suitable for 'git am'? So
that I save your mail and give it to git-am and end up with a commit
which has you as the author, and a nice commit message. Also, please,
CC
Dmitry Eremin-Solenikov <dbaryshkov@gmail.com

Thanks!

-- 
Best Regards,
Artem Bityutskiy

--=__PartCEE15159.0__=
Content-Type: text/plain; name="0001-Enables-the-mtd-driver-to-use-hardcoded-partitions.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="0001-Enables-the-mtd-driver-to-use-hardcoded-partitions.patch"

>From 4e2507e892c8ccb3726a549e52ffcafe7c477fae Mon Sep 17 00:00:00 =
2001=0AFrom: =3D?UTF-8?q?Anders=3D20M=3DC3=3DB8rk-Pedersen?=3D <amp@frogne.=
dk>=0ADate: Mon, 5 Dec 2011 07:42:07 +0100=0ASubject: [PATCH] Enables the =
mtd-driver to use hardcoded partitions=0AMIME-Version: 1.0=0AContent-Type: =
text/plain; charset=3DUTF-8=0AContent-Transfer-Encoding: 8bit=0A=0AAfter =
the pxa2xx-flash driver was updated to use the mtd_device_parse_register =
interface (6fcdc92fce81eadce...), it has not been possible to define the =
partition layout in the board support package - as is often seen done. =
This breaks support for many pxa2xx-boards.=0A=0ASigned-off-by: Anders =
M=C3=B8rk-Pedersen <amp@frogne.dk>=0A---=0A drivers/mtd/maps/pxa2xx-flash.c=
 |    6 +++++-=0A 1 files changed, 5 insertions(+), 1 deletions(-)=0A=0Adif=
f --git a/drivers/mtd/maps/pxa2xx-flash.c b/drivers/mtd/maps/pxa2xx-flash.c=
=0Aindex 411a17d..37709a6 100644=0A--- a/drivers/mtd/maps/pxa2xx-flash.c=0A=
+++ b/drivers/mtd/maps/pxa2xx-flash.c=0A@@ -54,6 +54,7 @@ static int =
__devinit pxa2xx_flash_probe(struct platform_device *pdev)=0A 	struct =
flash_platform_data *flash =3D pdev->dev.platform_data;=0A 	struct =
pxa2xx_flash_info *info;=0A 	struct resource *res;=0A+	struct =
mtd_part_parser_data	ppdata;=0A =0A 	res =3D platform_get_resource(pdev,=
 IORESOURCE_MEM, 0);=0A 	if (!res)=0A@@ -98,7 +99,10 @@ static int =
__devinit pxa2xx_flash_probe(struct platform_device *pdev)=0A 	}=0A 	=
info->mtd->owner =3D THIS_MODULE;=0A =0A-	mtd_device_parse_register(i=
nfo->mtd, probes, 0, NULL, 0);=0A+	ppdata.of_node =3D pdev->dev.of_nod=
e;=0A+	mtd_device_parse_register(info->mtd, probes, &ppdata,=0A+		=
	flash ? flash->parts : NULL,=0A+			flash ? =
flash->nr_parts : 0);=0A =0A 	platform_set_drvdata(pdev, info);=0A 	=
return 0;=0A-- =0A1.7.1=0A=0A
--=__PartCEE15159.0__=--
