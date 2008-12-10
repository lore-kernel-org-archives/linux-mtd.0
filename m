Received: from jupiter.malva.ua ([62.244.5.114])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LAKxj-0008O4-QO
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 09:02:32 +0000
Message-ID: <003401c95aa6$078be750$3503200a@head.local>
From: =?koi8-r?B?9sXLwQ==?= <vortexx@ukr.net>
To: <linux-mtd@lists.infradead.org>
Subject: Ubifs
Date: Wed, 10 Dec 2008 11:02:29 +0200
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


Hi all,
I wanna have a try ubifs on nand, and do as written on
http://www.linux-mtd.infradead.org/faq/ubifs.html
1. compile, install and boot the kernel (2.6.26-rc3)
the configuration option for ubi and nand is default on as module.
2. make the mtd-utils.
3. create a ubi when I got the error

# ubiattach /dev/ubi_ctrl -m 0
UBI device number 0, total 2048 LEBs (31457280 bytes, 30.0 MiB), available
2024
LEBs (31088640 bytes, 29.6 MiB), LEB size 15360 bytes (15.0 KiB)
# ubinfo
UBI version:                    1
Count of UBI devices:           1
UBI control device major/minor: 10:63
Present UBI devices:            ubi0
# ubimkvol /dev/ubi0 -N test -s 30MiB
ubimkvol: error!: "/dev/ubi0" is not an UBI device node

I did miss any step installation mtd-tools or create UBI device...

Thanks!!!

 best regards, Evgeny
