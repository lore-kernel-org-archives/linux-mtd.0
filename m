Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SlNO5-00070k-DU
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2012 16:52:42 +0000
Received: by werb13 with SMTP id b13so402240wer.36
 for <linux-mtd@lists.infradead.org>; Sun, 01 Jul 2012 09:52:38 -0700 (PDT)
Date: Sun, 1 Jul 2012 19:52:30 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [Q] ubi->beb_rsvd_pebs calculations
Message-ID: <20120701195230.0f141288@pixies.home.jungo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

While working on improving reserved bad PEBs calculations, I encounted
some code portion whose reasoning can't be easily understood.

I'd be happy if you can comment on the following:

from 'erase_worker' in wl.c:

> 	/* It is %-EIO, the PEB went bad */
> 
> 	if (!ubi->bad_allowed) {
> 		ubi_err("bad physical eraseblock %d detected", pnum);
> 		goto out_ro;
> 	}
> 
> 	spin_lock(&ubi->volumes_lock);
> 	need = ubi->beb_rsvd_level - ubi->beb_rsvd_pebs + 1;
> 	if (need > 0) {
> 		need = ubi->avail_pebs >= need ? need : ubi->avail_pebs;
> 		ubi->avail_pebs -= need;
> 		ubi->rsvd_pebs += need;
> 		ubi->beb_rsvd_pebs += need;
> 		if (need > 0)
> 			ubi_msg("reserve more %d PEBs", need);
> 	}

Why attempting to reclaim available PEBs into the 'beb_rsvd_pebs' here
within 'erase_worker'?
If 'beb_rsvd_pebs' was already below the required level, how could it be
that suddenly during 'erase_worker' more PEBs will be available?

The 2 other places which perform this "reclaim" are volume shrink and
volume remove. Within these places reclaim makes sense, as the
shrink/remove operations result in increasing the available PEBs.
(BTW the same code reclaiming beb_rsvd_pebs is duplicated, I've unified
all places).

However here in 'erase_worker' I expect either 'beb_rsvd_pebs' to already be
at the required level, or to be less than the required level - but in
the latter case reclaiming seems as a no-op.

What do you say?
Would you consider removing this "beb_rsvd_pebs reclaim" block?

Regards,
Shmulik
