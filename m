Received: from smtp1.int-evry.fr ([157.159.10.44])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Ihn9k-0004g1-D8
	for linux-mtd@lists.infradead.org; Tue, 16 Oct 2007 15:12:27 +0100
Received: from smtp-ext.int-evry.fr (smtp-ext.int-evry.fr [157.159.11.17])
	by smtp1.int-evry.fr (Postfix) with ESMTP id 43F358E86CF
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Oct 2007 16:10:08 +0200 (CEST)
Received: from ibook (unknown [77.192.17.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-ext.int-evry.fr (Postfix) with ESMTP id 19AD0D0E317
	for <linux-mtd@lists.infradead.org>;
	Tue, 16 Oct 2007 16:10:08 +0200 (CEST)
From: Florian Fainelli <florian.fainelli@telecomint.eu>
To: linux-mtd@lists.infradead.org
Subject: Extending plat-ram to support more probe methods
Date: Tue, 16 Oct 2007 16:10:16 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200710161610.17078.florian.fainelli@telecomint.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

A while ago Jason Gunthorpe proposed to extend plat-ram [1] to support more 
probe methods. This patch did not make his way to the mainline kernel, 
neither received critics or further discussions.

I think it is adequate to have such driver, now that plat_nand made his way to 
the platform generic drivers.

[1] : http://lists.infradead.org/pipermail/linux-mtd/2005-December/014505.html
-- 
Cordialement, Florian Fainelli
------------------------------
