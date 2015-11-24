Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1DBD-0003zG-Fw
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 12:58:44 +0000
Message-ID: <1448369897.23789.47.camel@gmail.com>
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Peter Zijlstra <peterz@infradead.org>
Date: Tue, 24 Nov 2015 14:58:17 +0200
In-Reply-To: <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
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

On Mon, 2015-11-23 at 19:09 +0100, Sebastian Andrzej Siewior wrote:
> wear_leveling_worker() currently unconditionally puts a PEB on erase
> in
> the error case even it just been taken from the free_list and never
> used.
> In case the PEB was never used it can be put back on the free list
> saving an erase cycle.

Did you think about putting LEBs like that to the protection queue
instead of playing tricks with scheduler?

The protection queue is there in order to protect eraseblocks from the
wear-leveling subsystem (not the best choice of words, but terminology
could be improved separately)

And this is what you need - you want the wear-leveling subsystem to
leave the eraseblock alone for some time, right?

The protection queue uses the erase cycles counts instead of the actual
time, but this seems OK for the situation you described.

Just to remind why this protection queue exists - when the WL subsystem
gives an eraseblock to the user, this may be an eraseblock with a high
erase counter, and it may be a candidate for being moved, the WL
subsystem just did not have a chance to do this yet. But if we give the
eraseblock to the user, the user will probably write something there
soon, and we do not want the WL subsystem to initiate data relocation
while the user is writing the data there. Instead, we want to wait a
little, and then move the data in background without interfering with
the user.

Back to my idea - what if you add the MOVE_RETRY eraseblocks to the
protection queue. May be not to the tail, may be to the head.
