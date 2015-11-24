Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1E6l-0002xV-Mr
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2015 13:58:13 +0000
Message-ID: <1448373467.23789.75.camel@gmail.com>
Subject: Re: [RFC PATCH 2/2] mtd: ubi: wl: avoid erasing a PEB which is empty
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de, Peter Zijlstra <peterz@infradead.org>
Date: Tue, 24 Nov 2015 15:57:47 +0200
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

A follow-up...

On Tue, 2015-11-24 at 14:33 +0100, Sebastian Andrzej Siewior wrote:
> > Did you think about putting LEBs like that to the protection queue
> > instead of playing tricks with scheduler?
> 
> Why am I playing tricks with the scheduler?

I should have replied the "1/2" e-mail, not this one, sorry. Because
this is what you seem to try ding in 1/2.

> Hmm. About which erase blocks are you talking about? The e1 which is
> the src EB and will be relocated _or_ the e2 which is the destination

I think the one which is currently unavailable. Or may be even both. I
suggest you to consider pros an cons :-)

> From what you explain it does not make sense to put e2 on the protect
> list. I just try to save here an erase cycle here.

I think if you put to the head of the PQ, that will be it.
