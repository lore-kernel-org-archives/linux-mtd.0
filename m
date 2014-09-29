Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYjJo-0002bC-IK
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 22:21:21 +0000
From: Richard Weinberger <richard@nod.at>
To: dedekind1@gmail.com
Subject: UBI: Fastmap fixes - round one
Date: Tue, 30 Sep 2014 00:20:44 +0200
Message-Id: <1412029248-22454-1-git-send-email-richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the first set of fastmap fixes for v3.18.
I have more in my local queue but these depend on non-trivial
fastmap changes I made. As soon they have been fully tested I'll
submitt them too.

Thanks,
//richard

[PATCH 1/4] UBI: Ensure that all fastmap work is done upon WL
[PATCH 2/4] UBI: Fastmap: Calc fastmap size correctly
[PATCH 3/4] UBI: Fastmap: Care about the protection queue
[PATCH 4/4] UBI: Fastmap: Ensure that only one fastmap work is
