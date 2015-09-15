Received: from forward18h.cmail.yandex.net ([2a02:6b8:0:f35::a3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbpOf-000189-G1
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2015 12:31:43 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
Subject: Backporting ubiblock to Linux 3.3
MIME-Version: 1.0
Message-Id: <1659571442320272@web21h.yandex.ru>
Date: Tue, 15 Sep 2015 15:31:12 +0300
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

Hi Ezequiel and others,

How do you think, would it be feasible to backport ubiblock to Linux 3.3 without large amount of work? I don't need latest and greatest version, just anything to get working and stable squashfs on top of it.

Could you point me to any specific version of ubiblock patch to start from? Should I apply patches from [1] first? Or any specific patches to UBI or MTD which are missing in that branch?

Thank you in advance.

[1] http://git.infradead.org/users/dedekind/ubifs-v3.3.git

-- 
Regards,
Konstantin
