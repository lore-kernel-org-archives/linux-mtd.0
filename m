Received: from mail.auriga.ru ([80.240.102.102])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BDmR9-00023o-5F
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 16:36:27 +0100
Received: from localhost ([127.0.0.1] helo=auriga.ru)
	by mail.auriga.ru with esmtp (Exim 4.30)
	id 1BDmcY-0006cb-Vi
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2004 19:48:14 +0400
Message-ID: <407D59A6.7030102@auriga.ru>
Date: Wed, 14 Apr 2004 19:32:54 +0400
From: Dmitry Konyshev <dmitry.konyshev@auriga.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: nand driver bug?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi everybody,

    The driver happens to fall in BUG in nand_select_chip when writing 
the last page of a device. It's trying to select_chip in nand_write_ecc 
even in case there's nothing left to write.

wbr, Dmitry.
