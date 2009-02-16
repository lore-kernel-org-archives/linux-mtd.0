Received: from v006910.home.net.pl ([212.85.123.52])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LZ4hs-0003HF-RL
	for linux-mtd@lists.infradead.org; Mon, 16 Feb 2009 14:44:39 +0000
Message-ID: <49997BBF.7080906@wb.com.pl>
Date: Mon, 16 Feb 2009 15:44:15 +0100
From: "Adam S. Turowski" <a.turowski@wb.com.pl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [UBIFS] Filesystem capacity
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
Can anyone explain differences in filesystem capacity between jffs2 and 
ubifs?
Kernel 2.6.28
mtd3 29MB nor flash
mtd4 31MB nand flash
File created by dd-ing from /dev/urandom:
jffs2:
nor: 28361 kB
nand: 31200 kB

ubifs:
one volume created on mtd3
UBIFS: mounted UBI device 0, volume 0, name "root"
UBIFS: file system size:   28676736 bytes (28004 KiB, 27 MiB, 219 LEBs)
UBIFS: journal size:       1440384 bytes (1406 KiB, 1 MiB, 11 LEBs)
UBIFS: media format:       4 (latest is 4)
UBIFS: default compressor: LZO
UBIFS: reserved for root:  1417227 bytes (1384 KiB)

one volume created on mtd4
UBIFS: mounted UBI device 1, volume 0, name "data"
UBIFS: file system size:   31870976 bytes (31124 KiB, 30 MiB, 2008 LEBs)
UBIFS: journal size:       1603072 bytes (1565 KiB, 1 MiB, 101 LEBs)
UBIFS: media format:       4 (latest is 4)
UBIFS: default compressor: LZO
UBIFS: reserved for root:  1575089 bytes (1538 KiB)

nor: 26960 kB (I can live with that)
nand: 23552 kB (With that I cannot)

Any suggestions?

--
Regards,
Adam Turowski
