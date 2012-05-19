Received: from [78.46.68.141] (helo=eristoteles.iwoars.net)
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVgFY-0005FC-Hb
 for linux-mtd@lists.infradead.org; Sat, 19 May 2012 09:47:01 +0000
Date: Sat, 19 May 2012 11:46:58 +0200 (CEST)
From: Joel Reardon <joel@clambassador.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH V2] UBI: add ubi_lnum_purge function to clear work queue
 for a lnum
In-Reply-To: <1337082012.2528.181.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1205191140280.19017@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1205150943470.17750@eristoteles.iwoars.net>
 <1337082012.2528.181.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Take the work_sem at the beginning. Release at the very end.
>
> Then you can do something like this:
>
> int found = 1;
>
> while (found) {
> 	found = 0;
>
> 	spin_lock(&ubi->wl_lock);
> 	list_for_each_entry(wrk, tmp, &ubi->works, list) {
> 		if (wrk->lnum == lnum) {
> 			list_del(&wrk->list);
> 			ubi->works_count -= 1;
> 			ubi_assert(ubi->works_count >= 0);
> 			spin_unlock(&ubi->wl_lock);
>
> 			err = wrk->func(ubi, wrk, 0);
> 			if (err)
> 				return err;
>
> 			spin_lock(&ubi->wl_lock);
> 			found = 1;
> 			break;
> 	}
> 	spin_unlock(&ubi->wl_lock);
> }
>


If I use list_for_each_entry_safe(), it protects against deleting as it
iterates. If I take the work_sem first, is it okay to do a simple
traversal instead of one traversal per removed item? Even if another
thread adds new work for the same vol_id/lnum, its okay, because the
caller of this function only cares about vol_id/lnums erasures that
it knows are currently on the worklist.

Cheers,
Joel Reardon
