Received: from c135.h203149222.is.net.tw
	([203.149.222.135] helo=ms.gv.com.tw ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Zt9l-0006m0-00
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 14:04:49 +0100
Received: from jmt (IDENT:root@h250-192-72-4.seed.net.tw [192.72.4.250] (may be forged))
	by ms.gv.com.tw (8.11.2/8.11.2) with SMTP id g6VDBGO29084
	for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2002 21:11:16 +0800
Message-ID: <018001c23892$e85bb4a0$1b0448c0@gv.com.tw>
From: "??" <kevin@gv.com.tw>
To: <linux-mtd@lists.infradead.org>
Subject: use "nandwrite" instead of "cp"?
Date: Wed, 31 Jul 2002 21:05:13 +0800
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

  dear all,
  thanks for your help,
 
 now i try to:
 
1> eraseall /dev/mtd1
2> cp test.img /dev/mtdblock1 
     (should i use "nandwrite" instead of "cp" here?)
3> mount -t jffs2 /dev/mtdblock1 /mnt
 
 then it still report many "magic bitmask not found"
  do i missing something?
  
  thanks in advanced!:)
  
  best regards,
  kevin
 
>  ----following message
> > log------------------------------------------------------
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298014:
> > 0xa3dc in
> > stead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298018:
> > 0xccfe in
> > stead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0029801c:
> > 0xd1b5 in
> > stead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298020:
> > 0xf8fd in
> > stead
> > jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00298024:
> > 0xb452 in
> > stead
> > Further such events for this erase block will not be printed
> > nand_read_ecc: Failed ECC read, page 0x00007fc0
> > nand_read_ecc: Failed ECC read, page 0x00007fc0
> > nand_read_ecc: Failed ECC read, page 0x00007fc1
> > nand_read_ecc: Failed ECC read, page 0x00007fc1
> > nand_read_ecc: Failed ECC read, page 0x00007fc2
> > nand_read_ecc: Failed ECC read, page 0x00007fc2
> > nand_read_ecc: Failed ECC read, page 0x00007fc3
> > nand_read_ecc: Failed ECC read, page 0x00007fc3
> > jffs2_scan_empty(): Read 0x1000 bytes at 0x00df8000 returned -5
> > mount: wrong fs type, bad option, bad superblock on /dev/mtdblock1,
> >        or too many mounted file systems
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
