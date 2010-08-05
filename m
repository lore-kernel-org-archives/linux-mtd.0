Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogt29-0003Am-HC
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 05:30:26 +0000
Received: by fxm3 with SMTP id 3so3256050fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2010 22:30:24 -0700 (PDT)
Subject: Re: [PATCH] Change struct flchip_shared spinlock locking into mutex
From: Artem Bityutskiy <dedekind1@gmail.com>
To: stefani@seibold.net
In-Reply-To: <1280984291.1175.15.camel@localhost.localdomain>
References: <1280778048-6208-1-git-send-email-stefani@seibold.net>
	<1280984291.1175.15.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 08:30:21 +0300
Message-Id: <1280986221.1175.20.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>,
	Vasiliy Kulikov <segooon@gmail.com>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Tejun Heo <tj@kernel.org>, akpm@linux-foundation.org,
	Jiri Slaby <jslaby@suse.cz>,
	Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-05 at 07:58 +0300, Artem Bityutskiy wrote:
> On Mon, 2010-08-02 at 21:40 +0200, stefani@seibold.net wrote:
> > From: Stefani Seibold <stefani@seibold.net>
> > 
> > This patch prevent to schedule while atomic by changing the
> > flchip_shared spinlock into a mutex. This should be save since no atomic
> > path will use this lock.
> > 
> > This patch is based on linux kernel 2.6.35. Please apply.
> > 
> > It was requested by Arnd Bergmann and Vasiliy Kulikov.
> 
> Taken to my l2-mtd-2.6.git / master

This patch causes the following compilation error:

drivers/mtd/lpddr/lpddr_cmds.c: In function ‘lpddr_cmdset’:
drivers/mtd/lpddr/lpddr_cmds.c:101: warning: passing argument 1 of ‘spinlock_check’ from incompatible pointer type
include/linux/spinlock.h:271: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:101: error: ‘struct mutex’ has no member named ‘rlock’
drivers/mtd/lpddr/lpddr_cmds.c: In function ‘get_chip’:
drivers/mtd/lpddr/lpddr_cmds.c:220: warning: passing argument 1 of ‘spin_lock’ from incompatible pointer type
include/linux/spinlock.h:282: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:233: warning: passing argument 1 of ‘spin_unlock’ from incompatible pointer type
include/linux/spinlock.h:322: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:248: warning: passing argument 1 of ‘spin_lock’ from incompatible pointer type
include/linux/spinlock.h:282: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:264: warning: passing argument 1 of ‘spin_unlock’ from incompatible pointer type
include/linux/spinlock.h:322: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:278: warning: passing argument 1 of ‘spin_unlock’ from incompatible pointer type
include/linux/spinlock.h:322: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c: In function ‘put_chip’:
drivers/mtd/lpddr/lpddr_cmds.c:351: warning: passing argument 1 of ‘spin_lock’ from incompatible pointer type
include/linux/spinlock.h:282: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:359: warning: passing argument 1 of ‘spin_unlock’ from incompatible pointer type
include/linux/spinlock.h:322: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:377: warning: passing argument 1 of ‘spin_unlock’ from incompatible pointer type
include/linux/spinlock.h:322: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’
drivers/mtd/lpddr/lpddr_cmds.c:381: warning: passing argument 1 of ‘spin_unlock’ from incompatible pointer type
include/linux/spinlock.h:322: note: expected ‘struct spinlock_t *’ but argument is of type ‘struct mutex *’

Removed from my tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
