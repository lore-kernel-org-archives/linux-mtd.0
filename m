Received: from cluster-g.mailcontrol.com ([208.87.233.190])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MNoZk-0000MX-CV
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 13:49:55 +0000
Received: from VFIWVEXHT1.verifone.com ([192.30.100.228])
	by rly20g.srv.mailcontrol.com (MailControl) with ESMTP id
	n66DjQ5k021102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Mon, 6 Jul 2009 14:49:33 +0100
Subject: ubiattach problem
From: Oren <oren_s3@VERIFONE.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Mon, 6 Jul 2009 16:50:21 +0300
Message-ID: <1246888221.17871.5.camel@tlvorens3lnx>
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

HI,

I am trying to attached a ubi image to an MTD nand device.
I am using kerenl version 2.6.27.18.
using latest MTD-UTILS + ubi_utils.

For some reosone i get UBI error while trying to attache..
DO i miss someting?


dev:    size   erasesize  name
mtd0: 01000000 00020000 "NAND-block1"
mtd1: 01e00000 00020000 "jffs2"
mtd2: 05200000 00020000 "NAND-block2"
./ubinfo
UBI version:                    1
Count of UBI devices:           0
UBI control device major/minor: 10:63
ubiformat /dev/mtd0 -s 2048 -f ubi_ncomp.img
ubiformat: mtd0 (nand), size 16777216 bytes (16.0 MiB), 128 eraseblocks
of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 127 -- 100 % complete  
ubiformat: 128 eraseblocks are supposedly empty
ubiformat: flashing eraseblock 16 -- 100 % complete  
ubiformat: formatting eraseblock 127 -- 100 % complete
ubiattach /dev/ubi_ctrl -m 0  
[42949485.550000] UBI error: ubi_read_volume_table: the layout volume
was not found
[42949485.560000] UBI error: ubi_attach_mtd_dev: failed to attach by
scanning, error -22
ubiattach: error!: cannot attach mtd0
           error 22 (Invalid argument)


Oren.
