Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1xyo-0007v1-Ti
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2015 14:57:04 +0000
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-3-git-send-email-bigeasy@linutronix.de>
 <1448369897.23789.47.camel@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 Peter Zijlstra <peterz@infradead.org>
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <56571DA7.3070106@linutronix.de>
Date: Thu, 26 Nov 2015 15:56:39 +0100
MIME-Version: 1.0
In-Reply-To: <1448369897.23789.47.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/24/2015 01:58 PM, Artem Bityutskiy wrote:
> On Mon, 2015-11-23 at 19:09 +0100, Sebastian Andrzej Siewior wrote:
> Back to my idea - what if you add the MOVE_RETRY eraseblocks to the
> protection queue. May be not to the tail, may be to the head.

I've been thinking about this. The protected list protects EBs from the
WL worker. There are 10 slots and after one successful erase process
all EB from this slot will be moved back to ->used list. So e2 can't be
placed there because it belongs on the ->free list.

e1 could be added there so it is protected from the WL worker until at
least one erase cycle happened. This is no guarantee that MOVE_RETRY
does not happen again but an optimistic try :)

However once the protection time ends, it won't be added to the ->scrub
list but the ->used list instead. The difference is that if it has an
average number of erase cycles it won't be considered by the WL worker
any time soon. So if it was added to the ->scrub list because a bitflip
was detected on read then you lose this information.
For that reason I think it is not worth putting it on the protected
list.

Sebastian
