Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KHDdD-000732-BG
	for linux-mtd@lists.infradead.org; Fri, 11 Jul 2008 08:05:32 +0000
Message-ID: <415763133.24705@cqu.edu.cn>
Subject: [ubi][wl] the W/R performance of my wear-leveling unit 2
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Jul 2008 16:04:43 +0800
Message-Id: <1215763483.2784.85.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

one other thing forgeted,
the threshold value is 4096 for current UBI, and 100 for mine


current gives:    |     mine
--------------------+------------
real    0m2.279s        0m2.213s
user    0m0.120s        0m0.176s
sys     0m0.712s        0m0.660s

real    0m2.345s        0m2.213s
user    0m0.160s        0m0.176s
sys     0m0.724s        0m0.660s

real    0m2.699s        0m2.188s
user    0m0.152s        0m0.124s
sys     0m0.680s        0m0.744s

real    0m2.429s        0m2.156s
user    0m0.148s        0m0.136s
sys     0m0.744s        0m0.704s

real    0m2.323s        0m2.176s
user    0m0.144s        0m0.196s
sys     0m0.736s        0m0.644s

real    0m2.675s        0m2.386s
user    0m0.148s        0m0.168s
sys     0m0.740s        0m0.704s        

real    0m2.433s        0m2.363s
user    0m0.140s        0m0.132s
sys     0m0.772s        0m0.720s

real    0m2.282s        0m2.309s
user    0m0.152s        0m0.128s
sys     0m0.760s        0m0.736s

real    0m2.635s        0m2.240s
user    0m0.120s        0m0.136s
sys     0m0.732s        0m0.760s

real    0m2.252s        0m2.170s
user    0m0.140s        0m0.148s
sys     0m0.732s        0m0.684s

real    0m2.950s        0m2.328s
user    0m0.128s        0m0.148s
sys     0m0.772s        0m0.724s

real    0m2.300s        0m2.122s
user    0m0.140s        0m0.156s
sys     0m0.740s        0m0.664s
        



-- 
yours Sincerely,

xiaochuan-xu (许小川)
