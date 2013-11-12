Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgKKm-0001lD-3m
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 20:13:12 +0000
Received: by mail-vc0-f176.google.com with SMTP id ia6so4569556vcb.7
 for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2013 12:12:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131107075645.GD3805@norris.computersforpeace.net>
References: <20131107075645.GD3805@norris.computersforpeace.net>
Date: Tue, 12 Nov 2013 12:12:49 -0800
Message-ID: <CAN8TOE-XHzfgE1V2-aQ-Oh5GqKimPhQBS0XJbnsCtuVMapmk0A@mail.gmail.com>
Subject: Re: [MTD] 3.13 pull request?
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

Ping?

On Wed, Nov 6, 2013 at 11:56 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> It's that season again; are you prepping a pull request for 3.13? I
> guess technically, the merge window doesn't start for a few days
> (according to Linus), but he's been merging stuff for 3.13 already...
>
> Anyway, let me know what you're thinking, or else I'll scrape together
> something myself.

I'll give approx. 24 hours, or else I'll send the request myself.

> Some things of note:
>
> There is at least one gpmi regression reported against 3.12, with no
> proper fix posted yet. Huang has at least one other -stable bugfix patch
> out there that hasn't gotten reviewed yet. If it's a good fix, hopefully
> it can get into 3.13 (a later -rc, I guess?).

Since my last email, I believe we've gotten good fixes for a few
different GPMI issues, some of which should be going to -stable. They
are queued up.

I'm pushing other fixes to a 'next' branch, so that they don't get in
the way of the merge window.

> A large portion of Pekon's OMAP updates has been queued up; they've
> gotten a pretty hard beating over reviews, and they've gotten a little
> external testing (at least Ezequiel; not sure of others), but they've
> only sat in linux-next for about a week now.
>
> Everything else should be pretty benign, I think.

Brian
