Received: from jupiter.malva.ua ([62.244.5.114])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAPSd-0003vB-5E
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 13:50:43 +0000
Message-ID: <00ee01c95ace$4a2ff6f0$3503200a@head.local>
From: =?koi8-r?B?9sXLwQ==?= <vortexx@ukr.net>
To: <linux-mtd@lists.infradead.org>
Subject: Ubifs
Date: Wed, 10 Dec 2008 15:50:40 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

thank you for a prompt, a problem is decided!!!

# mknod /dev/ubi0 c 253 0
# ubiattach /dev/ubi_ctrl -m 0
UBI device number 0, total 2048 LEBs (31457280 bytes, 30.0 MiB), available
2024
LEBs (31088640 bytes, 29.6 MiB), LEB size 15360 bytes (15.0 KiB)
# ubimkvol /dev/ubi0 -N test -s 29MiB
nand_wp: C0 ST 80
nand_wp: C0 ST 80
nand_wp: C0 ST 80
nand_wp: C0 ST 80
nand_wp: C0 ST 80
nand_wp: C0 ST 80
nand_wp: C0 ST 80
nand_wp: C0 ST 80
Volume ID 0, size 1980 LEBs (30412800 bytes, 29.0 MiB), LEB size 15360 bytes
(15.0 KiB), dynamic, name "test", alignment 1

best regards, Evgeny
