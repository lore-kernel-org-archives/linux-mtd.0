Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SXUmQ-0001oW-PZ
 for linux-mtd@lists.infradead.org; Thu, 24 May 2012 09:56:27 +0000
Received: by lbbgg6 with SMTP id gg6so7254084lbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 24 May 2012 02:56:24 -0700 (PDT)
Date: Thu, 24 May 2012 12:56:12 +0300
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
Message-ID: <20120524125612.39d3e6aa@halley>
In-Reply-To: <1337847472.15137.81.camel@sauron.fi.intel.com>
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com>
 <4FBBC4EE.4040802@nod.at>
 <1337847472.15137.81.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
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

Hi Artem,

On Thu, 24 May 2012 11:17:52 +0300 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2012-05-22 at 18:55 +0200, Richard Weinberger wrote:
> > >> +    e = find_early_wl_entry(&ubi->free, max_pnum);
> > >
> > > This picks the eb with the lowest pnum within 'ubi->free'.
> > >
> > > When called with INT_MAX (for the FM_DATA), why do you need to pick
> > a
> > > free eb with the minimal pnum? The FM_DATA EBs may reside everywhere
> > (as
> > > the FM_SB holds their location).
> > > So why not pick the eb with a medium EC value (as done for standard
> > > get_peb calls)? That might be better wear-leveling wise.
> > 
> > Fair point.
> > I'll fix that.
> > Artem, any comments on that?
> 
> The 'find_early_wl_entry()' function is used (currently) only at early
> stages. At these stages the we do not have the PEBs sorted by EC. We
> have just a list. This function should not be use after the WL subsystem
> is initialized.

'find_early_wl_entry' is only called from 'ubi_wl_get_fm_peb'.

'ubi_wl_get_fm_peb' is called twice from within 'ubi_update_fastmap':
First call, to get the FM_SB, with 'max_pnum' set as UBI_FM_MAX_START.
Second, to get FM_DATA pebs, with 'max_pnum' as -1, do indicate "no
matter the location, give me pebs from the free pool".

'ubi_update_fastmap' is called from 'ubi_volume_notify' and from
'ubi_wl_get_peb' - at both points, I assume ubi->free rbtree is properly
populated. Am I mistaken?

Regards,
Shmulik
