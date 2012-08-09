Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzQFx-0001AI-TD
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 10:46:22 +0000
Received: by yenq9 with SMTP id q9so175384yen.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2012 03:46:19 -0700 (PDT)
MIME-Version: 1.0
From: peterlingoal <peterlingoal@gmail.com>
Date: Thu, 9 Aug 2012 18:45:59 +0800
Message-ID: <CAFV5biDrgbhJ=_FyPd8YrNsnOUpSrCu-vhsq2GfNsbZ9M2F6Rg@mail.gmail.com>
Subject: [YAFFS] bad block management policy
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using YAFFS2 filesystem and some NANDs have hundreds and
thousands (out of 4K) blocks identified bad. After checking I found
YAFFS2 is marking a block bad if three fixable ECC errors happens
within a block. My question is:

1. I am using two Micron NAND chips, one requires minimum 1bit ECC
while the other requires 4. Bit flipping (although all fixable) seems
happen quite often in both types, is this expected behavior?
2. Micron error management doc requests to mark a block bad only when
program or erase operations fails, but not mentioning reading. So is
it safe to remove this ECC error counter? Will it lead to un-fixable
error?

thanks,
Peter
