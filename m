Received: from mail.professional-internet.de ([213.69.77.2]
	helo=hermes.professional-internet.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DqC5Q-000318-4E
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2005 11:45:22 -0400
Received: from mailer.port.de ([195.4.0.127])
	by hermes.professional-internet.de (8.12.10/8.12.10) with ESMTP id
	j66FjGVk001114
	for <linux-mtd@lists.infradead.org>; Wed, 6 Jul 2005 17:45:17 +0200
Received: from ulrich.port.de (ulrich.port.de [194.173.33.14])
	by mailer.port.de (8.12.10/8.12.7/SuSE Linux 0.6) with ESMTP id
	j66FjIJA002993
	for <linux-mtd@lists.infradead.org>; Wed, 6 Jul 2005 17:45:18 +0200
From: Ruediger Haertel <hae@port.de>
To: linux-mtd@lists.infradead.org
Date: Wed, 6 Jul 2005 17:45:18 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200507061745.18226.hae@port.de>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: MTD/ DoC Millenium Plus - Failure in flash detection
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I am trying to get the DOC Millenium Plus chip (16 MB, ChipID = 0x41) on 
my board (Coldfire 5272, uClinux) running. The chip as such is detected. 
If the DoC is accessed correctly then the flash chip has id 0xA5. This 
id is not in the table of NAND IDs in the file nand_ids.c.

The cvs MTD drivers has 0xA5 assigned to a SAMSUNG 2 GiB chip. But as 
far as I know the Doc MilPlus 16MB uses a Toshiba flash.

Any suggestions what's wrong here.

How would I verify that access to the DoC is correct?
At which address would I read? and what to expect?

If this would work, how do I proceed? I read something about 
nftl_format?


The documents/books I found so far (Building embedded linux; Linux MTD, 
JFFS Howto ..) mostly concentrate on using some kind of pluggable DOC 
chips that can be inserted in a computer that has Windows or Linux 
running. Then everything can be done with some tools. But how really to 
do it on an embedded linux with a soldered DoC ?



-- 

Ruediger Haertel
