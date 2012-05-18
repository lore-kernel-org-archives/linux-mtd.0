Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVKxb-0005Vd-Hq
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 11:03:04 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH 00/22] UBI: massage for fastmap
Date: Fri, 18 May 2012 14:03:43 +0300
Message-Id: <1337339045-8199-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

thise patch-set massively re-names things in UBI and prepares to code
for the fastmap work. Turns scan.c into attach.c, removes word "scan" from all
the functions and data-structures which will presumably be used in fastmap.

Richard, by going through the commit messages you should get the idea what
to re-name in your patches to make them match the new style. For functions
it is easy - your code won't compile unless you rename. For variable names
(e.g., si -> ai, seb -> aeb, etc) you'll need to just do the same I do in this
patch-set.

Artem.
