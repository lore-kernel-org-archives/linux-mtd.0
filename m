Received: from galois.linutronix.de ([2001:470:1f0b:db:abcd:42:0:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a4EE3-00037S-Aw
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 20:42:08 +0000
Subject: Re: [PATCH] mtd: nand: do FIFO processing in nand_get_device()
To: Brian Norris <computersforpeace@gmail.com>
References: <1448302147-19272-1-git-send-email-bigeasy@linutronix.de>
 <1448302147-19272-2-git-send-email-bigeasy@linutronix.de>
 <20151123181811.GO17308@twins.programming.kicks-ass.net>
 <20151125173543.GA17151@linutronix.de> <20151202185246.GI64635@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy
 <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 tglx@linutronix.de
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <565F5787.4010300@linutronix.de>
Date: Wed, 2 Dec 2015 21:41:43 +0100
MIME-Version: 1.0
In-Reply-To: <20151202185246.GI64635@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/02/2015 07:52 PM, Brian Norris wrote:
> Your threading is a bit confusing. Is this patch still needed, or did
> you fix everything by fixing UBI with these?

The three UBI patches are just an optimization and I trigger the life
lock with them. This patch is still required. I hope that I can respond
to Peter's comments by the end of the week. If you any suggestions
please let me know.

> Brian

Sebastian
