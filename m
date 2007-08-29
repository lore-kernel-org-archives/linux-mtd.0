Received: from nz-out-0506.google.com ([64.233.162.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQGvP-0000zn-Cy
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 02:21:13 -0400
Received: by nz-out-0506.google.com with SMTP id z3so70345nzf
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Aug 2007 23:21:09 -0700 (PDT)
Message-ID: <d843180a0708282321v62662b56h63249d5459b3a3b5@mail.gmail.com>
Date: Wed, 29 Aug 2007 14:21:08 +0800
From: "He Yong" <hoffer1127@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: mtd->size overflow
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

Hi,
  I'm using two 2G Bbyte nand flash chip (totally 4GB) under kernel 2.6.20.4,
the   chip->chipsize=0x80000000, and when decide the mtd->size = 2 *
0x80000000 = 0x00000000 (overflowed).
is there an official way to solve this problem?

Thanks!!

-- 
Best Regards!

He Yong

School of Information Security,
Shanghai Jiaotong University,
Dong chuan Road #800,
Minhang, Shanghai, P.R.China
