Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q4qtm-0004EJ-Ud
	for linux-mtd@lists.infradead.org; Wed, 30 Mar 2011 08:37:07 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH 0/2] do not select KALLSYMS_ALL
Date: Wed, 30 Mar 2011 11:40:14 +0300
Message-Id: <1301474416-8202-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

UBI and UBIFS have an option to compile-in debugging support. When we enable
debugging, compile-in various assertions, self-check functions and test modes.
We also compile in additional verbose error messages, flash dumps and stack
dumps.

When we have debugging support enabled, we want to have nice stackdumps, so
we selected KALLSYMS_ALL. But this causes various problems like unmet direct
dependencies, reported by Randy:

warning: (UBIFS_FS_DEBUG && LOCKDEP && LATENCYTOP) selects KALLSYMS_ALL which
has unmet direct dependencies (DEBUG_KERNEL && KALLSYMS)

I quickly looked at KALLSYMS_ALL and it is not immediately clear what exactly
is the difference between KALLSYMS and KALLSYMS_ALL. And there is this
CONFIG_KALLSYMS_EXTRA_PASS symbol, which is declared "temporary workaround"
in the Kconfig help. This shows that this stuff is messy.

I personally think KALLSYMS_ALL should be just merged with KALLSYMS and
disappear - we should have only one option. CONFIG_KALLSYMS_EXTRA_PASS should
die as well.

But I don't want to delve into that, I choose to just forget about KALLSYMS_ALL
and select KALLSYMS in UBI/UBIFS which seems to be enough for us.

Artem.
