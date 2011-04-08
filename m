Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DyJ-0001hp-9u
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:51:43 +0000
Received: by vws8 with SMTP id 8so3429920vws.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 08:51:41 -0700 (PDT)
From: Grant Erickson <marathon96@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v5 0/3] Retry Large Buffer Allocations
Date: Fri,  8 Apr 2011 08:51:31 -0700
Message-Id: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When handling user space read or write requests via mtd_{read,write}
or JFFS2 medium scan requests, the operations can fail because the
code backing these operations frequently requests large (128 KiB),
contiguous blocks of memory using kmalloc.

Under low-memory or highly-fragmented situations, particularly on
embedded systems with no swap store, these allocations will frequently
fail with -ENOMEM.

This patch series adds a common function to handle these allocation
requests in both the MTD driver and JFFS2 file system by exponentially
backing off on the size of the requested kernel transfer buffer until
it succeeds or until the requested transfer buffer size falls below
the page size.

This helps ensure the operation can succeed under low-memory,
highly-fragmented situations albeit somewhat more slowly.

  v2: Incorporated coding style and comment feedback from Artem.
  v3: Incorporated more feedback from Artem. Retargeted patch against
      l2-mtd-2.6.
  v4: Incorporated feedback from Artem about compilation on 64-bit
      architectures.
  v5: Split the patch into a series.

Signed-off-by: Grant Erickson <marathon96@gmail.com>
Tested-by: Ben Gardiner <bengardiner at nanometrics.ca>
---
