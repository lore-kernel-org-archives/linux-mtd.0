Received: from ug-out-1314.google.com ([66.249.92.175])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JmQoT-0007VJ-P5
	for linux-mtd@lists.infradead.org; Thu, 17 Apr 2008 09:53:54 +0000
Received: by ug-out-1314.google.com with SMTP id 23so1031531ugr.45
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Apr 2008 02:53:52 -0700 (PDT)
Message-ID: <90d987c0804170253m57264bf0n4a390b86f96af0a5@mail.gmail.com>
Date: Thu, 17 Apr 2008 15:23:52 +0530
From: "rohit h" <hrohit85@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [MLC NAND] Is NOP=1 a problem for marking block bad?
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

Hi all
MLC (Multi Level Cell ) NAND has NOP (Number of Partial page Operations) 1.
So we can write only once to a page before erasing it.
We mark a block bad when either block erase operation or page program
operation fails.
In the case when page program operation fails and we attempt to mark
the block bad,
will not the 2nd write to the first page of that block be a violation
of NOP 1 limitation?
My concern is whether the bad mark will be written properly or not in this case.
Thanks,
Rohit
