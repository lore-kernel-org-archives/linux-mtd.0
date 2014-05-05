Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhFtB-0002YX-7r
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 10:12:49 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2 for v3.15 0/3] UBI: block: Support very large volumes
Date: Mon,  5 May 2014 07:11:51 -0300
Message-Id: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Changes from v1:

  * Fixed ubiblock_resize so it returns something. I've kept a ubi_warn
    message in ubiblock_resize, because otherwise the failure is not reported
    to the user in any way.
    Thanks for the kbuild-robot for reporting this!

Here's the v1 cover letter:

This is a re-spin of Richard's work [1]. I've added a patch for some minor
clean-up, so the large volume fix is a less intrusive one.

The proposed returned value E2BIG has been changed for EFBIG, which results
in a slightly more accurate error. Also, the user messages have been removed
entirely; returning an error seems enough.

This bug was reported on #mtd IRC. I don't have to reporter name to give proper
credit. It should be applied as a fix for v3.15.

Richard: Thanks a lot for hunting this down, and feel free to disagree about
my changes.

[1] https://lkml.org/lkml/2014/3/19/333

Ezequiel Garcia (2):
  UBI: block: Make ubiblock_resize return something
  UBI: block: Set disk_capacity out of the mutex

Richard Weinberger (1):
  UBI: block: Avoid disk size integer overflow

 drivers/mtd/ubi/block.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

-- 
1.9.1
