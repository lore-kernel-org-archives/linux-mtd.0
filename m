Received: from mx1.myoutlookonline.com ([69.25.74.59])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GRmWQ-0000k0-M2
	for linux-mtd@lists.infradead.org; Mon, 25 Sep 2006 10:13:07 +0100
From: "Ajay Jain" <ajain@neomagic.com>
To: <linux-mtd@lists.infradead.org>
Subject: Questions regarding JFFS2/NAND
Date: Mon, 25 Sep 2006 14:41:30 +0530
Message-ID: <071301c6e082$985f23a0$561fa8c0@pcajain>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Reply-To: ajain@neomagic.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All, 

I have a few questions. Please help me to answer them, if you find
suitable.

1. Is it possible to run JFFS2 on NAND Flash on 2.4. I am seeing that
the mtd website mentions that it is not supported. I do not clearly
understand what it means. Does it mean that mtd guys do not support it,
or does it mean that you can't run JFFS2 on nand in 2.4 at all.

2. On version 2.4.21, we see that 'ecc' is always disabled. It does not
really matter, as what value we set. Is anybody you aware of this issue.


3. Because of this, we backported 'mtd' from 2.6 version. Now the mtd
appears to be reasonably stable. But we still have the old jffs2 in
place. The new mtd does not allow unaligned writes, but jffs2 (the old
one) keeps sending unaligned requests. We modified the mtd layer to
handle this, but then the issue is that we are writing to the same page
again and again, as the writes are unaligned. But the ecc value can only
be written once. So this solution will not work either. It does work if
we switch off the ecc. Are you aware of any of these issues, is my
observation correct.

4. Is it realistically possible to backport 2.6 JFFS2 to 2.4.

Please help me to solve these issues. We want to run JFFS2 on 2.4/NAND.

Thanks.
