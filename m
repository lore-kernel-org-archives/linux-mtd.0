Received: from [203.194.144.59] (helo=ns3.dns-hk.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196Cz3-0001Bk-Lj
	for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2003 18:15:38 +0100
Received: from 203186230076.ctinets.com ([203.186.230.76] helo=home)
	by ns3.dns-hk.net with smtp (Exim 3.36 #1)
	id 196Cz5-0007nT-00
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2003 01:15:39 +0800
Message-ID: <001201c30505$c4b83dd0$6c00a8c0@home>
From: "Paul" <paul@maypaul.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 18 Apr 2003 01:21:12 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Subject: Restore the bad block flag in OOB of  NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 Dear All,

    How can I restore the 0xFF in the OOB[5]?   i understood the oob[5] is
 the bad block indicator. The YAFFS set accidentally the byte to 0x00 . I
 want to use JFFS2 but the eraseall command said they are invalid block. I
am
 sure that the block is health . So, I want to force set the oob[5] to oxFF,
 pls. how can i do? Thank you.

 Paul
