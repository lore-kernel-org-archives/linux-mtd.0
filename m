Received: from mail2.asianet.co.th ([203.144.222.230] helo=mail.asianet.co.th)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BkaxT-0007Qh-Gx
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2004 00:01:29 -0400
Received: from virscan4.asianet.co.th (HELO mail.asianet.co.th)
	([203.144.222.220]) (envelope-sender <jay4mail@yahoo.com>)
	by mail2.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 14 Jul 2004 11:01:22 +0700
Received: from unknown (HELO [10.1.1.33]) ([210.86.146.233])
	(envelope-sender <jay4mail@yahoo.com>)
	by mx3.asianet.co.th (qmail-ldap-1.03) with SMTP
	for <linux-mtd@lists.infradead.org>; 14 Jul 2004 11:01:20 +0700
Message-ID: <40F4B205.6060902@yahoo.com>
Date: Wed, 14 Jul 2004 11:09:41 +0700
From: Pathompong Puengrostham <jay4mail@yahoo.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: JFFS2 on NAND, Magic bitmask 0x1985 not found
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

Could anybody help me on this please? I mounted a cleanly erased NAND 
flash , unmounted without writing anything into it and then mounted it 
again. I got the following errors.

nand_read_ecc: Failed ECC read, page 0x000000e0
mtd->read(0x400 bytes from 0x1c000) returned ECC error
jffs2_scan_eraseblock(): Node at 0x0001c008 {0x1985, 0x2003, 0x00000008) 
has invalid CRC 0xffff0000 (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0001c00c: 
0x0008 instead
nand_read_ecc: Failed ECC read, page 0x00000120
mtd->read(0x400 bytes from 0x24000) returned ECC error
jffs2_scan_eraseblock(): Node at 0x00024008 {0x1985, 0x2003, 0x00000008) 
has invalid CRC 0xffff0000 (calculated 0x6b7c27e6)
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0002400c: 
0x0008 instead
...

This is the data that I dump out of the flash using "nanddump /dev/mtd3 
dump.txt 114688 1024"

0x0001c000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0001c010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
...
0x0001c1f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff 85 19 03 20 08 00 00 00
0x0001c200: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x0001c210: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
...
0x0001c3f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
   OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

I can see that the magic bitmask 0x1985 is there. Why did JFFS2 look at 
the wrong place and got 0x0008 instead?

I'm using mtd snapshot 20040707.

Thank you in advance.

Regards,
Jay
