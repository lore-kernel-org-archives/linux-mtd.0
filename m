Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKC0w-0003h4-UZ
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 22:06:51 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
Subject: MTD life cycle fixes
Date: Tue,  5 Jul 2016 00:06:18 +0200
Message-Id: <1467669983-12105-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While working on a nandsim feature to add/remove NAND devices
on the fly I noticed some odds. This series intends to fix them.
My initial plan was submitting them as part of my nandsim series
but it turned out to be five patches and I fear they need a good
review as they're all touching MTD core code.

Thanks,
//richard
