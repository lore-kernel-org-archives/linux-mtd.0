Received: from tac.ki.iif.hu ([2001:738:0:401:20c:6eff:fe71:b2db])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NrWJo-0000an-0s
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2010 12:56:20 +0000
From: Ferenc Wagner <wferi@niif.hu>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: CONFIG_MTD_DEBUG vs generic DEBUG support in kernel.h
Date: Tue, 16 Mar 2010 13:55:56 +0100
Message-ID: <878w9swhlv.fsf@tac.ki.iif.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

include/linux/mtd/mtd.h contains the following snippet:

#ifdef CONFIG_MTD_DEBUG
#define DEBUG(n, args...)                               \
        do {                                            \
                if (n <= CONFIG_MTD_DEBUG_VERBOSE)      \
                        printk(KERN_INFO args);         \
        } while(0)

which conflicts with the generic debugging support in
include/linux/kernel.h:

#ifdef DEBUG
#define pr_devel(fmt, ...) \
        printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)

(that is, gcc emits redefinition warnings on modules which
#define DEBUG on their own and also include mtd.h)
Unfortunately, the DEBUG macro is used rather heavily under
drivers/mtd.  Should we resolve this somehow or is it better
to just live with it?

(Please keep me on Cc, I'm not subscribed.)
-- 
Thanks,
Feri.
