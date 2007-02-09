Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFXr7-0005hT-Fs
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 10:40:14 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1HFXr0-0001So-Gl
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 16:40:02 +0100
Received: from 40.107.210.62.te-dns.org ([62.210.107.40])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Feb 2007 16:40:02 +0100
Received: from matthieu.castet by 40.107.210.62.te-dns.org with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Feb 2007 16:40:02 +0100
To: linux-mtd@lists.infradead.org
From: Matthieu CASTET <matthieu.castet@parrot.fr>
Subject: 2.6.20 : BUG in =?utf-8?b?bmFuZF9kb19yZWFkX29vYg==?= with
	=?utf-8?b?TVREX09PQl9QTEFDRQ==?= ?
Date: Fri, 9 Feb 2007 15:09:59 +0000 (UTC)
Message-ID: <loom.20070209T155657-545@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

2.6.20 nand mtd seems to read wrongly oob in MTD_OOB_PLACE.
If I dump a page with uboot I get [1] and if I dump it with nanddump I get [2].
As you could can see OOB doesn't match. Moreover the 2 snd 8 bytes OOB data
given by nanddump are the 1st 8 bytes OOB of the next page.

If we look in nand_base.c, we saw that in case of MTD_OOB_PLACE, the len of oob
is set to chip->ecc.layout->oobavail. This seems wrong as user expect to be
mtd->oobsize.

Does this bug is know ?

It seems quite critical as it impact on jffs2 (at least
jffs2_check_nand_cleanmarker).


Matthieu

[1]
        3f 00 57 00 0c 00 00 48  10 00 00 48 13 03 00 00                       
                                              
        00 40 00 30 00 00 70 30  74 01 00 40 03 20 c2 e3                       
                                              
        02 20 80 e0 02 00 50 e1  00 30 a0 e1 0e f0 a0 01                       
                                              
OOB:                                                                           
                                              
        96 a5 96 9a 05 ff c0 43                                                
                                              
        05 00 18 36 05 00 ff 0f
[2]
[....]
0x000001d0: 3f 00 57 00 0c 00 00 48 10 00 00 48 13 03 00 00                    
                                              
0x000001e0: 00 40 00 30 00 00 70 30 74 01 00 40 03 20 c2 e3                    
                                              
0x000001f0: 02 20 80 e0 02 00 50 e1 00 30 a0 e1 0e f0 a0 01                    
                                              
  OOB Data: 96 a5 96 9a 05 ff c0 43 fc 03 00 9a 05 ff c0 43
