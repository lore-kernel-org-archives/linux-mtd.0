Received: from law14-oe66.law14.hotmail.com ([64.4.20.201] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19gH5X-00056K-3f
	for <linux-mtd@lists.infradead.org>; Sat, 26 Jul 2003 05:55:23 +0100
From: "Vikram Mehta" <vm6580@hotmail.com>
To: <uclinux-dev@uclinux.org>
Date: Sat, 26 Jul 2003 10:28:32 -0700
MIME-Version: 1.0
Message-ID: <Law14-OE66SOJl6byox00003765@hotmail.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: mtd <linux-mtd@lists.infradead.org>
Subject: HElp:: schedule-> switch_to()
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I am worlking on uCdimm
I need some help..

Mtd driver fuction cfi_udelay calls schedule _timeout which calls schedule
which calls switch_to() . this switch_to is a macro in asm-m68k/system.h.

This macro does which some times produces an exception, pr sometimes ends up
dispalying this message
kernel BUG at exit.c:465!
Kernel panic: BUG!
Now this macro works fine in other cases... Y does it not work when called
by mtd driver code?

Please help me on it
Vikram Mehta
