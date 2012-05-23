Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SX4uZ-0008W8-5K
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 06:19:08 +0000
Received: by lbbgg6 with SMTP id gg6so6114894lbb.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2012 23:19:04 -0700 (PDT)
Date: Wed, 23 May 2012 09:18:56 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
Message-ID: <20120523091856.4e9217a2@pixies.home.jungo.com>
In-Reply-To: <2423212898cfc1c21343bff32e776dbd@radon2.swed.at>
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com>
 <4FBBC4EE.4040802@nod.at> <20120522211809.53bd6444@halley>
 <2423212898cfc1c21343bff32e776dbd@radon2.swed.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Tue, 22 May 2012 20:57:25 +0200 Richard Weinberger <richard@nod.at> wrote:
> > Care to elaborate how come 'ubi->lookuptbl[pnum]' is NULL? What's the
> > exact flow leading to it?
> 
> PEBs used by the fastmap sub-system are not known by the WL and EBA
> sub-system.
> A PEB used by fastmap contains mostly raw data. (It does not have any
> LEBs).
> E.g. If PEBs 0,1 and 2 are used by fastmap they are not in
> ubi->lookuptbl.
> So, right after attaching from a fastmap ubi->lookuptbl[0|1|2] is NULL.
> By writing a new fastmap 0, 1 and 2 will be put back to the WL
> sub-system and they appear in
> ubi->lookuptbl.

Thanks. Understood.

> > 'ubi_wl_get_fm_peb' doesn't clear the 'ubi_wl_entry' from the lookuptbl.
> > It does not free the 'ubi_wl_entry' either (seems like it should, no?)
> 
> It removes a PEB from the free rb-tree.
> ubi->lookuptbl[pnum] does not matter at this time.

For practical matters, you are correct.
Design wise, it is bit inconsistent and confusing.

On one hand, you claim above that 'ubi->lookuptbl' holds the WL entries
known to WL subsystem - that is, lookuptbl is a data structure used and
maintained by the WL subsystem.
OTOH, when a PEB is removed from hands of WL (by a ubi_wl_get_fm_peb
call), you keep its WL entry assigned in ubi->lookuptbl.

I'll rethink this, see if there's a potential trouble here.

> > However 'ubi_wl_put_fm_peb' creates a 'ubi_wl_entry' if not found in
> > the lookuptbl.
> 
> Yeah, but only in one corner case.
> See my comment:
>         /* This can happen if we recovered from a fastmap the very
>          * frist time and writing now a new one. In this case the wl
> system
>          * has never seen any PEB used by the original fastmap.
>          */
> 
> > Formerly, wl_init was responsible for correctly populating
> > 'ubi->lookuptbl'. Can we somehow preserve this for FM pebs as well?
> > 
> 
> Currently fastmap "fixes" ubi->lookuptbl on demand. Is this a problem?

I guess not.

The only problem, as previously noted, is the failure to create a new
'ubi_wl_entry' when the PEB needs to be returned to WL subsystem.

If all relevant wl entries are created during 'wl_init' (including those
currently associated to the fastmap), then we are fine, as internal
failures within 'wl_init' propagate back to the attach code.

I'll give it some more thought.

Regards,
Shmulik
