Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoLt3-0004cu-Uu
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 23:29:46 +0000
Received: by mail-ie0-f169.google.com with SMTP id e14so28096086iej.14
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 15:29:24 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/2] MTD maintenance updates
Date: Wed,  4 Dec 2013 15:28:44 -0800
Message-Id: <1386199726-28074-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

I'm taking up where Ezequiel left off on updating MAINTAINERS for MTD [1], with
the following changes:

 1. Get things in alphabetical order.

 2. I think I will be generally helping with all of MTD here, so rather than
    adding a new entry for NAND, just stick me under David Woodhouse. Of
    course, this doesn't quite make me an expert on all areas...

The second patch is just a trivial modification to Ezequiel's 2nd patch.

I agree with Ezequiel's suggestion, that we can assign driver maintainers for
ones that have a particular sense of ownership (e.g., a driver's author, or a
heavily-contributing developer for a driver), and I think this falls in line
with existing practice throughout the kernel. However, this isn't strictly
necessary; for some developers, de facto maintainership can suffice, with no
official role, and get_maintainers.pl pulls suggestions from recent
contribution history in git anyway. So I won't personally push hard for
assigning many driver maintainers.

BTW, I'd like to get David's "ack" for these patches, and it'd be nice to hear
from Artem too, since he has previously been an unofficial maintainer (and is
understandably distracted by non-MTD work these days).

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2013-November/050122.html

Brian Norris (1):
  MAINTAINERS: mtd: add Brian Norris for MTD maintenance

Ezequiel Garcia (1):
  MAINTAINERS: mtd: add PXA3xx NAND driver to MAINTAINERS

 MAINTAINERS | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
1.8.5
