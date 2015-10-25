Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqKYg-0005UV-PJ
 for linux-mtd@lists.infradead.org; Sun, 25 Oct 2015 12:37:59 +0000
Date: Sun, 25 Oct 2015 14:33:59 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Felipe Balbi <balbi@ti.com>,
 Markus Pargmann <mpa@pengutronix.de>, Tejun Heo <tj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH -mm]
 signal-turn-dequeue_signal_lock-into-kernel_dequeue_signal-fix
Message-ID: <20151025133359.GB19437@redhat.com>
References: <20151003181319.GA1036@redhat.com>
 <20151003181336.GA1054@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151003181336.GA1054@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

As Markus reports (thanks!)

	signal-turn-dequeue_signal_lock-into-kernel_dequeue_signal.patch

conflicts with the recent change in Linus' tree,

> I just realised that this patch will conflict with a fixup patch for nbd
> that will be included in rc7.
>
> dcc909d90ccd (nbd: Add locking for tasks)
>
> I think there is basically one new instance of dequeue_signal_lock() that
> needs to be replaced with kernel_dequeue_signal().

Unless I missed something, this new dequeue_signal_lock() should simply
die, but lets fix the conflict first.


--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -592,10 +592,8 @@ static int nbd_thread_send(void *data)
 	spin_unlock_irqrestore(&nbd->tasks_lock, flags);
 
 	/* Clear maybe pending signals */
-	if (signal_pending(current)) {
-		siginfo_t info;
-		dequeue_signal_lock(current, &current->blocked, &info);
-	}
+	if (signal_pending(current))
+		kernel_dequeue_signal(NULL);
 
 	return 0;
 }
