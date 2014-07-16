Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7OOw-0008V8-7V
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:33:38 +0000
Message-ID: <1405513986.5423.19.camel@sauron.fi.intel.com>
Subject: Re: ubifs error at boot "bad node type"
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 16 Jul 2014 15:33:06 +0300
In-Reply-To: <CACQ1gAjM-=ZnjFQocXq1Ygg0gN-D-1G1Q-=kZqsfm-Du7jmFow@mail.gmail.com>
References: <53BBC39F.7010307@gmail.com>
 <1405499347.1906.2.camel@sauron.fi.intel.com>
 <CAFLxGvwzzAAswamDJVq0UW7DLdHdgA4N_KOY9K5FhAREaFit+g@mail.gmail.com>
 <CACQ1gAjM-=ZnjFQocXq1Ygg0gN-D-1G1Q-=kZqsfm-Du7jmFow@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-07-16 at 14:26 +0200, Richard Genoud wrote:
> 2014-07-16 14:02 GMT+02:00 Richard Weinberger <richard.weinberger@gmail.com>:
> > On Wed, Jul 16, 2014 at 10:29 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> On Tue, 2014-07-08 at 12:10 +0200, Richard Genoud wrote:
> >>> ubiattach is ok:
> >>> # ubiattach -m 3
> >>> [   50.164062] UBI: default fastmap pool size: 95
> >>> [   50.164062] UBI: default fastmap WL pool size: 25
> >>
> >> I do not know why this happened, I never saw reports like this before.
> >> Most probably this is because of fastmap. I did not hear any report that
> >> it was extensively verified WRT power cuts, and my theory is that there
> >> is a bug in fastmap which causes this, and this may be related to power
> >> cuts. I do not have proves, but suggest you to dig in this direction.
> >> E.g., setup power-cut testing.
> >
> > The logs don't show the "attached by fastmap" message. So UBI got
> > attached by scanning.
> > So, fastmap support is here but not used.
> >
> > Only the fastmap pools are used.
> 
> Well, actually, fastmap is used on this volume when I boot from NAND.
> (and I must say, It's fast !)
> Just this time, as I boot from nfsroot, or from a unclean state,
> fastmap didn't attached UBI.
> I'll check if it's still operational.

Just a head-up: check the Kconfig message for this option, it says that
even the on-flash format for it may change, although I am not quite sure
if Richard W. still means this.

-- 
Best Regards,
Artem Bityutskiy
