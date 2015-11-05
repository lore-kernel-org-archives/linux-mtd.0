Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTTH-0005Hx-DN
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 22:57:32 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com,
	alex@nextthing.co
Subject: [RFC] UBI statistics and bitrot interface
Date: Thu,  5 Nov 2015 23:56:52 +0100
Message-Id: <1446764217-15021-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This series adds new ioctl()s to UBI such that userspace can query
read/erase counters and trigger re-reads/scrubbing of PEBs.
Especially for MLC NAND flash where read disturb and data retention
is a big topic this interface can be used by applications to foster the NAND.
Parallel to this series at patch series against mtd-utils is sent that
implements a ubihealthd which makes use of that interface.

[PATCH 1/5] UBI: Introduce prepare_erase_work()
[PATCH 2/5] UBI: Introduce in_pq()
[PATCH 3/5] UBI: Expose the bitrot interface
[PATCH 4/5] UBI: Add basic read counter support
[PATCH 5/5] UBI: Expose UBI statistics interface
