Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zsmm-0006j0-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 13:41:04 +0100
Message-ID: <013d01c2388f$94c655a0$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <010c01c2388d$05af1660$1b0448c0@gv.com.tw>  <007901c23869$35d3f500$1b0448c0@gv.com.tw> <31207.1028103302@redhat.com>  <6562.1028118221@redhat.com>
Subject: do i have to "eraseall" first?
Date: Wed, 31 Jul 2002 20:41:24 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

dear david,

thanks for your help,

now it report many "magic bitmask not found"
do i have to do something like "eraseall /dev/mtdblock1" before "cp test.img
/dev/mtdblock1"?

thanks in advanced!:)

best regards,
kevin

----following message
log------------------------------------------------------
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298014:
0xa3dc in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298018:
0xccfe in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0029801c:
0xd1b5 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298020:
0xf8fd in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298024:
0xb452 in
stead
Further such events for this erase block will not be printed
nand_read_ecc: Failed ECC read, page 0x00007fc0
nand_read_ecc: Failed ECC read, page 0x00007fc0
nand_read_ecc: Failed ECC read, page 0x00007fc1
nand_read_ecc: Failed ECC read, page 0x00007fc1
nand_read_ecc: Failed ECC read, page 0x00007fc2
nand_read_ecc: Failed ECC read, page 0x00007fc2
nand_read_ecc: Failed ECC read, page 0x00007fc3
nand_read_ecc: Failed ECC read, page 0x00007fc3
jffs2_scan_empty(): Read 0x1000 bytes at 0x00df8000 returned -5
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
       or too many mounted file systems
