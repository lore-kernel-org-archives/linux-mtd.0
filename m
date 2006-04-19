Received: from pproxy.gmail.com ([64.233.166.183])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FWHz5-0001gA-T5
	for linux-mtd@lists.infradead.org; Wed, 19 Apr 2006 15:06:17 -0400
Received: by pproxy.gmail.com with SMTP id i49so1137437pyi
	for <linux-mtd@lists.infradead.org>;
	Wed, 19 Apr 2006 12:05:02 -0700 (PDT)
Message-ID: <f19298770604191204q109c7ea1yed3e071cb8db1881@mail.gmail.com>
Date: Wed, 19 Apr 2006 23:04:59 +0400
From: "Alexey Zaytsev" <alexey.zaytsev@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [PATCH] Raw access for the ixp4xx mapping driver.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

This patch adds an mtd device to access the whole flash.
I see no reason why there should be no such device for this driver, and som=
e
mapping drivers support this usefull feature.

The patch should be applyed on top of my previous patch.

--- linux-2.6.16.1.orig/drivers/mtd/maps/ixp4xx.c       2006-04-19
22:15:30.000000000 +0400
+++ linux-2.6.16.1/drivers/mtd/maps/ixp4xx.c    2006-04-19
22:43:45.000000000 +0400
@@ -169,6 +169,7 @@
 #ifdef CONFIG_MTD_PARTITIONS
               del_mtd_partitions(info->mtd);
 #endif
+               del_mtd_device(info->mtd);
               map_destroy(info->mtd);
       }
       if (info->map.virt)
@@ -257,6 +258,8 @@
       /* Use the fast version */
       info->map.write =3D ixp4xx_write16;

+       add_mtd_device(info->mtd);
+
 #ifdef CONFIG_MTD_PARTITIONS
       err =3D parse_mtd_partitions(info->mtd, probes, &info->partitions, 0=
);
       if (err > 0) {
