Received: from [202.202.0.36] (helo=cqu.edu.cn)
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KG8Lq-0007oc-JF
	for linux-mtd@lists.infradead.org; Tue, 08 Jul 2008 08:15:07 +0000
Message-ID: <415504534.19541@cqu.edu.cn>
Subject: [UBI][WL][PATCH] Rewrite the UBI wear-leveling unit and
	Implemented two-dimension(PEB ec, LEB temp) wear leveling algorithm.
From: xiaochuan-xu <xiaochuan-xu@cqu.edu.cn>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 08 Jul 2008 16:14:13 +0800
Message-Id: <1215504853.2801.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've finished the two-dimension wear-leveling algorithm.
which is good enough for not only wear-leveling but also 
reduce unnecessary erasure among the wear-leveling process 
as soon as possible,due to the two-dimension(PEB erase counter, 
LEB temperature) wear leveling algorithm. 

It's too long to send the diff in the mail-list.

Look at the source for the details in the git tree
'projects / users/dedekind/ubi-2.6.git /'


good day.
-- 
Yours sincerely
xiaochuan-xu(cqu.edu.cn)
