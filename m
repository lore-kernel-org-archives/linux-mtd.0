Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a461Q-0002FY-Mq
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2015 11:56:33 +0000
Message-ID: <1449057368.20917.31.camel@gmail.com>
Subject: Re: [PATCH 3/3] mtd: ubi: wl: avoid erasing a PEB which is empty
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de
Date: Wed, 02 Dec 2015 13:56:08 +0200
In-Reply-To: <565DF901.40208@nod.at>
References: <1448569430-885-1-git-send-email-bigeasy@linutronix.de>
 <1448569430-885-3-git-send-email-bigeasy@linutronix.de>
 <565DF901.40208@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-12-01 at 20:46 +0100, Richard Weinberger wrote:
> Am 26.11.2015 um 21:23 schrieb Sebastian Andrzej Siewior:
> > wear_leveling_worker() currently unconditionally puts a PEB on
> > erase in
> > the error case even it just been taken from the free_list and never
> > used.
> > In case the PEB was never used it can be put back on the free list
> > saving a precious erase cycle.
> > 
> > v1…v2:
> > 	- to_leb_clean -> dst_leb_clean
> > 	- use the nested option for ensure_wear_leveling()
> > 	- do_sync_erase() can't go -ENOMEM so we can just go into
> > 	  RO-mode now.
> > 
> > Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> 
> Thanks a lot for the error handling cleanup and this improvement!
> All three patches look good to me.
> Artem, unless you have objections I'd merge them.

Sure, thanks!
