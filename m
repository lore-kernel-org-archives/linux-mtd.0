Received: from qw-out-1920.google.com ([74.125.92.149])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KyGlm-0000R8-Qc
	for linux-mtd@lists.infradead.org; Fri, 07 Nov 2008 02:08:19 +0000
Received: by qw-out-1920.google.com with SMTP id 4so563742qwk.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 06 Nov 2008 18:08:16 -0800 (PST)
Date: Thu, 6 Nov 2008 21:07:01 -0500
To: linux-mtd@lists.infradead.org
Subject: DEBUG macro
Message-ID: <20081106210701.47591f88@vsauder-lx.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
From: Vernon Sauder <vernoninhand@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All,

The MTD code uses DEBUG as a print macro but the rest of the kernel code
expects it to be a flag that enables pr_debug. This causes a warning
(DEBUG redefined) when including mtd headers (i.e. physmap.h) from
platform code.

I suspect that I am not the first to report this. Has this been
discussed already? What is the current thinking about the best way
forward?

Ugly example code to workaround the warning:
/*
 * OK, we need a HACK to get rid of a DEBUG define in mtd.h
 * Declare a local, undeclare the global, then redefine the global
 */
#ifdef DEBUG
 #define local_DEBUG
 #undef DEBUG
#endif
#include <linux/mtd/physmap.h>
#undef DEBUG
#ifdef local_DEBUG
#define DEBUG
#endif
/* end of HACK */


Regards,
Vern
