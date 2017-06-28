Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQAqJ-0006Zx-Rp
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 11:09:09 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.sigma-star.at (Postfix) with ESMTP id 2EEEF24E0014
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:42 +0200 (CEST)
Received: from linux-4sv6.suse (unknown [82.150.214.13])
 by mail.sigma-star.at (Postfix) with ESMTPSA id BD31724E0010
 for <linux-mtd@lists.infradead.org>; Wed, 28 Jun 2017 13:08:41 +0200 (CEST)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/9] mtd-utils: various cleanups, enable compiler warnings
Date: Wed, 28 Jun 2017 13:08:10 +0200
Message-Id: <20170628110819.30563-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,


this patch series contains a number of cleanups for mtd-utils.

Apart from some minor cleanups, the first larger change in the series is
a restructuring of the dependency handling in the autoconf.ac file. The
main idea is to always have the configure script finish and _then_ print
a list of _all_ missing libraries for the current build configuration
instead of having to go back and forth between installing libraries/
changing external build scrips and rebuilding just to see what else is
missing.

The second larger change deals with compiler warnings. A number of
compiler warning flags are set if the compiler supports them. An m4
script has been borrowed from coreutils (via util-linux) to check if
the compiler supports a specific warning flag.

The rest of the patch set attempts to deal with the resulting fallout.

For now, -Wshadow and -Wsign-compare are explicitly disabled. Dealing
with those would require a number of non-trivial code changes that
should probably be handled as a separate patch set.


David
