Received: from imta22.fe.bosch.de ([139.15.243.26])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TWjQ9-0006Xp-LW
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 07:54:35 +0000
Received: from smtp2-v.fe.bosch.de (imta24.fe.bosch.de [139.15.243.27])
 by imta22.fe.bosch.de (Postfix) with ESMTP id AA0821E4061A
 for <linux-mtd@lists.infradead.org>; Fri,  9 Nov 2012 08:45:47 +0100 (CET)
Received: from vsmta11.fe.internet.bosch.com (unknown [10.4.98.51])
 by imta24.fe.bosch.de (Postfix) with ESMTP id 206EAB0020E
 for <linux-mtd@lists.infradead.org>; Fri,  9 Nov 2012 08:45:38 +0100 (CET)
Received: from localhost (vsgw4.fe.internet.bosch.com [10.4.98.12])
 by vsmta11.fe.internet.bosch.com (Postfix) with SMTP id BB78343C025F
 for <linux-mtd@lists.infradead.org>; Fri,  9 Nov 2012 08:45:21 +0100 (CET)
From: "Prins Anton (ST-CO/ENG1.1)" <Anton.Prins@nl.bosch.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Fri, 9 Nov 2012 08:45:24 +0100
Subject: Patch to solve NULL pointer dereference in physmap_of.c
Message-ID: <85D877DD6EE67B4A9FCA9B9C3A4865670C3ADE0635@SI-MBX14.de.bosch.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

commit 0905a6f4aec377123e94d2260f2f7a0d867e19be
Author: Anton Prins <anton.prins@nl.bosch.com>
Date:   Fri Nov 9 10:12:58 2012 +0100

    Correct error checking to prevent a NULL pointer dereference

    The problem only occurs if the DTS is not correct, the requested mappin=
g is not reserved on the parent bus.
    In this special case the count is 1, but the list_size after mapping is=
 0. list_size 0 should generate an error!

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 2e6fb68..83d121e 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -267,13 +267,14 @@ static int __devinit of_flash_probe(struct platform_d=
evice *dev)
                info->list[i].mtd->dev.parent =3D &dev->dev;
        }

-       err =3D 0;
        if (info->list_size =3D=3D 1) {
+               err =3D 0;
                info->cmtd =3D info->list[0].mtd;
        } else if (info->list_size > 1) {
                /*
                 * We detected multiple devices. Concatenate them together.
                 */
+               err =3D 0;
                info->cmtd =3D mtd_concat_create(mtd_list, info->list_size,
                                               dev_name(&dev->dev));
                if (info->cmtd =3D=3D NULL)
