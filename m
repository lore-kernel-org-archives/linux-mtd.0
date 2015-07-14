Received: from forward4h.mail.yandex.net ([84.201.186.22])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEwpl-0004MY-OM
 for linux-mtd@lists.infradead.org; Tue, 14 Jul 2015 09:49:07 +0000
Received: from web30h.yandex.ru (web30h.yandex.ru [84.201.187.164])
 by forward4h.mail.yandex.net (Yandex) with ESMTP id 02E681B20532
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jul 2015 12:48:38 +0300 (MSK)
From: Konstantin Tokarev <annulen@yandex.ru>
To: linux-mtd@lists.infradead.org
Subject: Why UBIFS min I/O unit size must be power of 2?
MIME-Version: 1.0
Message-Id: <899311436867317@web30h.yandex.ru>
Date: Tue, 14 Jul 2015 12:48:37 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

I'd like to increase compression ratio of UBIFS image (at the cost of possibly
slower writes). However, my LEB size is 129024, so the largest block size that
I could use is 2048 (otherwise LEB won't be multiple of I/O unit size).

So I wonder why UBIFS cannot use 129024 as I/O unit size and requires it to be
power of 2? Is it possible to eleminate this limitation?

-- 
Regards,
Konstantin
