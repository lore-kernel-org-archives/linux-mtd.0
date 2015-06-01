Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YzWzT-00087Q-A8
 for linux-mtd@lists.infradead.org; Mon, 01 Jun 2015 21:11:25 +0000
From: Richard Weinberger <richard@nod.at>
To: computersforpeace@gmail.com
Subject: Some fixes for MTD drivers
Date: Mon,  1 Jun 2015 23:10:48 +0200
Message-Id: <1433193054-26865-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, maximlevitsky@gmail.com,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series fixes some minor issues I've found while bowsing
in various MTD drivers.

[PATCH 1/6] mtd: r852: Fix device_create_file() usage
[PATCH 2/6] mtd: nandsim: Fix kasprintf() usage
[PATCH 3/6] mtd: cs553x_nand: Fix kasprintf() usage
[PATCH 4/6] mtd: docg3: Don't leak docg3->bbt in error path
[PATCH 5/6] mtd: docg3: Fix kasprintf() usage
[PATCH 6/6] mtd: docg3: Don't do ERR_PTR(0)

Thanks,
//richard
