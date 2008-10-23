Received: from yx-out-1718.google.com ([74.125.44.156])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kt40P-0007ta-SM
	for linux-mtd@lists.infradead.org; Thu, 23 Oct 2008 17:29:54 +0000
Received: by yx-out-1718.google.com with SMTP id 3so220381yxi.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Oct 2008 10:29:52 -0700 (PDT)
Message-ID: <b39778db0810231029t19b7048fg4f965d66771a8943@mail.gmail.com>
Date: Thu, 23 Oct 2008 12:29:51 -0500
From: "Dan TodoRojo" <moridinga@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: MTD,JFFS2 support for 4K, 8K page NAND devices
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

I think this question should have been asked by now, but I can't seem
to find an answer.  Are NAND devices of 4KB or larger pages officially
supported?  I saw an archived patch from last month that seemed to
address this issue, but it seems as if this patch broke API compat.
Is there an currently an official stand or status on this?

Regards,
Daniel
