Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zt4y-0006ki-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 13:59:52 +0100
Message-ID: <016c01c23892$34cb13e0$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
References: <010c01c2388d$05af1660$1b0448c0@gv.com.tw>  <007901c23869$35d3f500$1b0448c0@gv.com.tw> <31207.1028103302@redhat.com>  <6562.1028118221@redhat.com> <013d01c2388f$94c655a0$1b0448c0@gv.com.tw>
Subject: how to init and mount jffs2?
Date: Wed, 31 Jul 2002 21:00:11 +0800
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

now i try to:

eraseall /dev/mtd1
cp test.img /dev/mtdblock1
mount -t jffs2 /dev/mtdblock1 /mnt

then it report many "magic bitmask not found"
 do i missing something?
 
 thanks in advanced!:)
 
 best regards,
 kevin
 
 ----following message
> log------------------------------------------------------
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298014:
> 0xa3dc in
> stead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298018:
> 0xccfe in
> stead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0029801c:
> 0xd1b5 in
> stead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298020:
> 0xf8fd in
> stead
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298024:
> 0xb452 in
> stead
> Further such events for this erase block will not be printed
> nand_read_ecc: Failed ECC read, page 0x00007fc0
> nand_read_ecc: Failed ECC read, page 0x00007fc0
> nand_read_ecc: Failed ECC read, page 0x00007fc1
> nand_read_ecc: Failed ECC read, page 0x00007fc1
> nand_read_ecc: Failed ECC read, page 0x00007fc2
> nand_read_ecc: Failed ECC read, page 0x00007fc2
> nand_read_ecc: Failed ECC read, page 0x00007fc3
> nand_read_ecc: Failed ECC read, page 0x00007fc3
> jffs2_scan_empty(): Read 0x1000 bytes at 0x00df8000 returned -5
> mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
>        or too many mounted file systems
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
