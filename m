Received: from [211.47.47.10] (helo=www.openers.co.kr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cj6T-0002gI-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 08:24:53 +0000
Received: from caesar ([211.113.97.18])
	by www.openers.co.kr (8.11.2/8.11.2) with SMTP id g1I8eOA25389
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 17:40:24 +0900
Message-ID: <002301c1b857$64b65120$126171d3@caesar>
From: =?ks_c_5601-1987?B?sei/tcij?= <yhkim@openers.co.kr>
To: <linux-mtd@lists.infradead.org>
Subject: problem with ftl_format
Date: Mon, 18 Feb 2002 17:36:43 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
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

I am building MTD/FTL driver on NAND Flash.
When formating the mtd(/dev/mtd0) with ftl_format,
format operation stops proceeding becaus of a bad block.
why one bad block leads format operation to fail?
Anybody could direct me how to handle this problem?
 
Youngho Kim
