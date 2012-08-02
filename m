Received: from ch1ehsobe002.messaging.microsoft.com ([216.32.181.182]
 helo=ch1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SwkVJ-0006Ep-Th
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 01:47:10 +0000
Message-ID: <5019DC14.2030209@freescale.com>
Date: Wed, 1 Aug 2012 20:47:00 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: jffs2 unmount with delayed work queued
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With slub debugging on, I was seeing a crash in timer code after
unmounting a jffs2 filesystem, with a reference to poisoned memory.  I
traced this back to jffs2_kill_sb() freeing the superblock with
c->wbuf_dwork.timer still active, and c->wbuf_queued = 1.  I've seen
this in Linus's current tree as well as 3.5.

I would have just sent a patch, but I wasn't sure exactly how to
gracefully shut things down -- cancel or flush, and at what point?
Don't want to do it too late for the work to happen safely, but don't
want to do it too early so that it could get queued again.

-Scott
