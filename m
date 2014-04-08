Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXaTF-0004fh-R5
 for linux-mtd@lists.infradead.org; Tue, 08 Apr 2014 18:10:06 +0000
Date: Tue, 8 Apr 2014 15:09:15 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ubi: avoid workqueue format string leak
Message-ID: <20140408180915.GA1221@arch.cereza>
References: <20140408044407.GA13141@www.outflux.net>
 <20140408135729.GC2429@arch.cereza>
 <1396968207.30750.17.camel@sauron.fi.intel.com>
 <CAGXu5j+-1o9TmqLrq2ZPhoRvOmiv4Do5wvGkasxHb+Frm7hutA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXu5j+-1o9TmqLrq2ZPhoRvOmiv4Do5wvGkasxHb+Frm7hutA@mail.gmail.com>
Cc: artem.bityutskiy@linux.intel.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 08, Kees Cook wrote:
> On Tue, Apr 8, 2014 at 7:43 AM, Artem Bityutskiy
> <artem.bityutskiy@linux.intel.com> wrote:
> > On Tue, 2014-04-08 at 10:57 -0300, Ezequiel Garcia wrote:
> >> Hello Kees,
> >>
> >> Thanks for the patch.
> >>
> >> On Apr 07, Kees Cook wrote:
> >> > When building the name for the workqueue thread, make sure a format
> >> > string cannot leak in from the disk name.
> >> >
> >>
> >> Could you enlighten me and explain why you want to avoid the name leak?
> >> Is it a security concern?
> >>
> >> I'd like to understad this better, so I can avoid making such mistakes
> >> in the future.
> >
> > Well, the basics seem to be simple, attacker makes sure gd->disk_name
> > contains a bunch of "%s" and other placeholders, and this leads
> > "workqueue_alloc()" to read kernel memory and form the workqueue name.
> 
> Right. I don't think there is an actual exploitable vulnerability
> here, but it's a best-practice to not pass variable strings in as a
> potential format string.
> 

I see, thanks for explanation. I'll certainly try to keep this in mind!

> > I did not think it through further, though, but that was enough for me
> > to apply the patch right away. But yeah, curios parts are:
> >
> > 1. How attacker could end up with a crafted "gd->disk_name"
> 
> At present, the only way I know how to set that is via some special
> controls in md, but I assume that would not work via ubi.
> 

I guess it's not possible in our case, given we are hard-setting the name
to ubiblock%d_%d:

  sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);

Nevertheless the fix is valid, so thanks a lot and keep them coming!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
