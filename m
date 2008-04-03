Received: from parabel.levigo.net ([62.206.214.16] helo=parabel.matrix.de)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JhPos-0000Bd-TA
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2008 13:49:35 +0000
Received: from localhost (finite.levigo.net [10.208.4.86])
	by parabel.matrix.de (Postfix) with ESMTP id 0E63D342A6
	for <linux-mtd@lists.infradead.org>;
	Thu,  3 Apr 2008 15:49:22 +0200 (CEST)
Received: from parabel.matrix.de ([10.208.4.80])
	by localhost (finite [10.208.4.86]) (amavisd-new, port 10024)
	with ESMTP id 30054-10 for <linux-mtd@lists.infradead.org>;
	Thu, 3 Apr 2008 15:49:10 +0200 (CEST)
Received: from mailrelay.gdsys.de (unknown [217.6.197.20])
	by parabel.matrix.de (Postfix) with ESMTP id F039434500
	for <linux-mtd@lists.infradead.org>;
	Thu,  3 Apr 2008 15:49:08 +0200 (CEST)
From: eibach@gdsys.de
To: linux-mtd@lists.infradead.org
Date: 03 Apr 2008 13:49:04 UT
Message-ID: <DIIE.000026F1000E0F90@gdproxy2.gdsys.de>
MIME-Version: 1.0
Subject: [SOLVED] jffs2: filesystem corruption caused by writing and powercycle
Content-Type: text/plain;
 charset="iso-8859-1"
Content-Transfer-Encoding: 7Bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I have  a problem with jffs2 filesystem corruption. 
> My environment is kernel 2.6.23.4, running on PPC. 
> Flash is Spansion 29GL512 NOR-Flash.
> 
> The problem can be reproduced simply by turning off power while writing.
> After 3 or 4 powercycles I get errormessages when trying to copy the file I wrote before turning off power:
> 
> / # cp /data/tst /data/tst2
> Data CRC ee9173b1 != calculated CRC 6af6806d for node at 0221f108
> cp: read error: Input/output error
> / #

The problem is solved by patch
"[JFFS2] Fix data CRC checking on NOR flash."
from David Woodhouse, 21 Nov 2007.

Cheers
Dirk
