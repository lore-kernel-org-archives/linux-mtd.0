Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3qsn-0001xP-Fr
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 19:46:39 +0000
Subject: Re: [PATCH 3/3] mtd: ubi: wl: avoid erasing a PEB which is empty
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1448569430-885-1-git-send-email-bigeasy@linutronix.de>
 <1448569430-885-3-git-send-email-bigeasy@linutronix.de>
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de
From: Richard Weinberger <richard@nod.at>
Message-ID: <565DF901.40208@nod.at>
Date: Tue, 1 Dec 2015 20:46:09 +0100
MIME-Version: 1.0
In-Reply-To: <1448569430-885-3-git-send-email-bigeasy@linutronix.de>
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

Am 26.11.2015 um 21:23 schrieb Sebastian Andrzej Siewior:
> wear_leveling_worker() currently unconditionally puts a PEB on erase in
> the error case even it just been taken from the free_list and never
> used.
> In case the PEB was never used it can be put back on the free list
> saving a precious erase cycle.
> 
> v1…v2:
> 	- to_leb_clean -> dst_leb_clean
> 	- use the nested option for ensure_wear_leveling()
> 	- do_sync_erase() can't go -ENOMEM so we can just go into
> 	  RO-mode now.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks a lot for the error handling cleanup and this improvement!
All three patches look good to me.
Artem, unless you have objections I'd merge them.

Thanks,
//richard
