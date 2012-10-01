Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TIawA-0001EY-8q
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2012 08:01:11 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
 by co202.xi-lite.net (Postfix) with ESMTPS id E22642602AC
 for <linux-mtd@lists.infradead.org>; Mon,  1 Oct 2012 10:11:52 +0200 (CEST)
Message-ID: <50694DCB.6010303@parrot.com>
Date: Mon, 1 Oct 2012 10:01:15 +0200
From: =?UTF-8?B?R3LDqWdvciBCb2lyaWU=?= <gregor.boirie@parrot.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: m25p80: missing MTD owner
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

It seems possible to unload m25p80 module while a JFFS2 partition is
still mounted onto flash. This produces oops when MTD layer tries to
access underlying device later on.

A quick look at m25p_probe shows that "owner" field of allocated mtd
device structure is left uninitialized, preventing MTD layer from
incrementing module usage count. This patch for v3.4.11 solves the issue
for me :

@@ -873,6 +873,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
        else
                flash->mtd.name = dev_name(&spi->dev);

+       flash->mtd.owner = THIS_MODULE;
        flash->mtd.type = MTD_NORFLASH;
        flash->mtd.writesize = 1;
        flash->mtd.flags = MTD_CAP_NORFLASH;


Regards.

-- 
Grégor Boirie
Software engineer
R&D / OS platform
tel +33 1 48 03 73 24
-----------------------------------------
Parrot
174, quai de Jemmapes
75010 Paris  France
tel + 33 1 48 03 60 60
fax + 33 1 48 03 06 66
-----------------------------------------
http://www.parrot.com
