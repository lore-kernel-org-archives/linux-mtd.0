Received: from mail.sanpeople.com ([196.41.13.122] helo=za-gw.sanpeople.com)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FtiyO-0003xY-6A
	for linux-mtd@lists.infradead.org; Fri, 23 Jun 2006 06:33:16 -0400
Subject: Re: DataFlash & writesize
From: Andrew Victor <andrew@sanpeople.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <4497A89F.4010202@yandex.ru>
References: <4497A89F.4010202@yandex.ru>
Content-Type: text/plain
Message-Id: <1151058432.27505.60.camel@fuzzie.sanpeople.com>
Mime-Version: 1.0
Date: 23 Jun 2006 12:27:12 +0200
Content-Transfer-Encoding: 7bit
Cc: david-b@pacbell.net, Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

> So, I'm asking you to initialize mtd->writesize correctly.

Since the writesize change is now in mainline git, here is a trivial
patch to set mtd->writesize for DataFlash.
[writesize = erasesize = pagesize]

(It compiles, but not tested).


Signed-off-by: Andrew Victor <andrew@sanpeople.com>


diff -urN linux-2.6.17-git5.orig/drivers/mtd/devices/mtd_dataflash.c linux-2.6.17-git5/drivers/mtd/devices/mtd_dataflash.c
--- linux-2.6.17-git5.orig/drivers/mtd/devices/mtd_dataflash.c	Tue May 30 11:41:52 2006
+++ linux-2.6.17-git5/drivers/mtd/devices/mtd_dataflash.c	Fri Jun 23 12:07:09 2006
@@ -478,6 +478,7 @@
 	device->name = (pdata && pdata->name) ? pdata->name : priv->name;
 	device->size = nr_pages * pagesize;
 	device->erasesize = pagesize;
+	device->writesize = pagesize;
 	device->owner = THIS_MODULE;
 	device->type = MTD_DATAFLASH;
 	device->flags = MTD_CAP_NORFLASH;
