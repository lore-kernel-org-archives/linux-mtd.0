Received: from motgate8.mot.com ([129.188.136.8])
	by pentafluge.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DlnNM-0002hn-4Q
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2005 13:33:41 +0100
Received: from il06exr03.mot.com (il06exr03.mot.com [129.188.137.133])
	by motgate8.mot.com (Motorola/Motgate7) with ESMTP id j5OCg2W9027230
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2005 05:42:04 -0700 (MST)
Received: from il02exm15.corp.mot.com (il02exm15.corp.mot.com [10.0.111.27])
	by il06exr03.mot.com (8.13.1/8.13.0) with ESMTP id j5OCcRer026441
	for <linux-mtd@lists.infradead.org>;
	Fri, 24 Jun 2005 07:38:27 -0500 (CDT)
Message-ID: <53F44AF77A9F9B458DCE1910C2E6263811F4A1FE@il02exm15.corp.mot.com>
From: Lindstrom James-A19027 <A19027@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 24 Jun 2005 07:33:16 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: MD2202-D384 DoC with MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to get my MD2202-D384 up and running with the diskonchip.c driver.  I'm starting with kernel linux-2.4.18-rmk7-pxa3-cerf3 then patching in mtd-snapshot-2005-03-04.  I did quite a bit of work hacking things to make them happy.  The kernel boots, however, the DoC is not detecting properly.  When I look in nandids.c, though, I don't even see an option for the 384 mb variety of DoC.  Am I missing something?

Here is my boot-up output (re-typed, forgive me):

DiskOnChip found at 0x10000000
NAND device: Manufacturer 0xec, Chip ID 0x79 (Samsung NAND 128MiB 3,3V 8-bit)
3 NAND chips detected
Bad block table not found for chip 0
Bad block table not found for chip 0
nand_read_ecc: from = 0x00000000, len = 512
nand_read_ecc: from = 0x00004000, len = 512
nand_read_ecc: from = 0x00008000, len = 512
nand_read_ecc: from = 0x0000c000, len = 512
nand_read_ecc: failed ECC read, page 0x000000c0 on chip 0
ECC error scanning DOC at 0xc000
DiskOnChip BNAND Media Header not found

Thanks,

jbl
