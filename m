Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQh4U-0007pF-Em
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 03:34:59 -0400
Received: from [83.149.245.1] (netserv.ipi.ac.ru [83.149.245.1])
	by ipi.ac.ru (8.12.8p1/8.12.2) with ESMTP id j3R7Yxr1028741
	for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2005 11:34:59 +0400
Message-ID: <426F40A3.8010308@ipi.ac.ru>
Date: Wed, 27 Apr 2005 11:34:59 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: nand locking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

Is there a straight way to lock/unlock nand pages?

The nand_scan() does "mtd_info->lock = NULL;" unconditionally,
though the nand chip is capable of locking.

Regards.
   	Timofei.
