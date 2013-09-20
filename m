Received: from forward3h.mail.yandex.net ([2a02:6b8:0:f05::3])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VMzdv-0008Jj-U0
 for linux-mtd@lists.infradead.org; Fri, 20 Sep 2013 12:17:05 +0000
Received: from web20h.yandex.ru (web20h.yandex.ru [84.201.186.49])
 by forward3h.mail.yandex.net (Yandex) with ESMTP id 9474513601D0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2013 16:16:38 +0400 (MSK)
From: Konstantin Tokarev <annulen@yandex.ru>
To: linux-mtd@lists.infradead.org
Subject: lz4hc compression in UBIFS?
MIME-Version: 1.0
Message-Id: <55541379679397@web20h.yandex.ru>
Date: Fri, 20 Sep 2013 16:16:37 +0400
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

Are there any plans for adding lz4hc [1] compression support to UBIFS?

Benchmarks are quite impressive, and it looks like lz4hc can achieve better compression ration while providing 3.5x faster decompression. From quick look at UBIFS module sources it looks like adding new compressor supported by crypto API is a matter of a few lines of code in compress.c.

Or are there any known obstacles?

[1] http://code.google.com/p/lz4/

-- 
Regards,
Konstantin
