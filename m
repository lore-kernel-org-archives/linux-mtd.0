Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgJr3-0004Xt-SS
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 20:47:02 +0000
Message-ID: <544574AD.6070509@nod.at>
Date: Mon, 20 Oct 2014 22:46:37 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/4] UBI: Fastmap: Care about the protection queue
References: <1412029248-22454-1-git-send-email-richard@nod.at>						
 <1412029248-22454-4-git-send-email-richard@nod.at>					
 <1412346676.3795.62.camel@sauron.fi.intel.com>	 <542EF3BF.1070401@nod.at>			
 <1413206263.7906.18.camel@sauron.fi.intel.com>	 <543BE21F.5020504@nod.at>		
 <1413213803.7906.45.camel@sauron.fi.intel.com>	 <543C3E60.4080507@nod.at>	
 <1413282203.7906.72.camel@sauron.fi.intel.com>	 <543F9895.7010502@nod.at>
 <1413816389.7906.336.camel@sauron.fi.intel.com>	 <544527A3.7030508@nod.at>
 <1413819635.7906.369.camel@sauron.fi.intel.com>
In-Reply-To: <1413819635.7906.369.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 20.10.2014 um 17:40 schrieb Artem Bityutskiy:
> Also, say, PEB X is in the work queue waiting for erasure. Fastmap comes
> along and saves it as "must be erased" in the fastmap. Fastmap finishes
> its job, PEB X gets erased, and I write my data there, so PEB X is
> referred to by LEB Y. Now I have power cut. Then I attach the flash
> again. Surely it is not that fastmap just erases PEB X and I lose the
> contents of LEB Y?

After reading my mail again, I think my answer was not clear.
Please let me explain in detail.

PEB X waits for erasure. In this state it can get erased and will be moved into
the free RB tree.
If a new PEB is requested from UBI it will not get served from the free RB tree,
instead it will come from the pool. I.e. There is no way that the freshly erased PEB
will immediately used. If a a fastmap was written while PEB was queued for erasure
and a power cut happens after the erasure it will be erased again. This does not harm.
But it can never ever happen that the same PEB will be in a pool (and therefore maybe used)
and scheduled for erase. A freshly erased PEB can only be used after wandering into the pool.
But this would require a refill-pool operation first an a write of the fastmap, the said PEB
cannot be listed as erase work in the fastmap then.

Thanks,
//richard
