Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1Dpp-0002Ax-T9
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 13:40:42 +0000
Message-ID: <1448372418.23789.65.camel@gmail.com>
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Peter Zijlstra <peterz@infradead.org>
Date: Tue, 24 Nov 2015 15:40:18 +0200
In-Reply-To: <56546727.3040902@linutronix.de>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
 <1448369897.23789.47.camel@gmail.com> <56546727.3040902@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-11-24 at 14:33 +0100, Sebastian Andrzej Siewior wrote:
> What will happen next? When will e1
> be removed from the protection list?

If my memory still serves me, the answer is: roughly speaking, after a
number of erase operation, which is currently defined as

/*
 * Length of the protection queue. The length is effectively equivalent t o the
 * number of (global) erase cycles PEBs are protected from the wear-leveling
 * worker.
 */
#define UBI_PROT_QUEUE_LEN 10

But if you put it to the head of the protection queue, it'll be removed
from there as soon as any LEB is "put", which effectively means
"scheduled for erasure".

Artem.
