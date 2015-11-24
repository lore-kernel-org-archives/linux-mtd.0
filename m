Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1DjC-0003ow-Tf
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 13:33:52 +0000
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
Message-ID: <56546727.3040902@linutronix.de>
Date: Tue, 24 Nov 2015 14:33:27 +0100
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

Hello Artem,

> On Mon, 2015-11-23 at 19:09 +0100, Sebastian Andrzej Siewior wrote:
>> wear_leveling_worker() currently unconditionally puts a PEB on erase
>> in
>> the error case even it just been taken from the free_list and never
>> used.
>> In case the PEB was never used it can be put back on the free list
>> saving an erase cycle.
> 
> Did you think about putting LEBs like that to the protection queue
> instead of playing tricks with scheduler?

Why am I playing tricks with the scheduler?

> The protection queue is there in order to protect eraseblocks from the
> wear-leveling subsystem (not the best choice of words, but terminology
> could be improved separately)
> 
> And this is what you need - you want the wear-leveling subsystem to
> leave the eraseblock alone for some time, right?

The empty eraseblock is not the problem. The src-LEB is the problem
because it can not be moved due to lock contention. Ideally I would do
nothing here (except putting it back to the free list) and on unlock of
the SRC-LEB it would trigger a wear-leveling cycle.

> The protection queue uses the erase cycles counts instead of the actual
> time, but this seems OK for the situation you described.
> 
> Just to remind why this protection queue exists - when the WL subsystem
> gives an eraseblock to the user, this may be an eraseblock with a high
> erase counter, and it may be a candidate for being moved, the WL
> subsystem just did not have a chance to do this yet. But if we give the
> eraseblock to the user, the user will probably write something there
> soon, and we do not want the WL subsystem to initiate data relocation
> while the user is writing the data there. Instead, we want to wait a
> little, and then move the data in background without interfering with
> the user.
> 
> Back to my idea - what if you add the MOVE_RETRY eraseblocks to the
> protection queue. May be not to the tail, may be to the head.

Hmm. About which erase blocks are you talking about? The e1 which is
the src EB and will be relocated _or_ the e2 which is the destination
EB where the data will be written to?
>From what you explain it does not make sense to put e2 on the protect
list. I just try to save here an erase cycle here.
e1 on the other hand might be a candidate.

So e1 has a low EC value and WL-subsystem decides to move it to a an
empty block with a high EC value. This fails due to MOVE_RETRY.
I add e2 on to free-RB-tree, e1 on the protect-list. No
ensure_wear_leveling() invocation. What will happen next? When will e1
be removed from the protection list?

Sebastian
