Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wivww-0000Un-5A
 for linux-mtd@lists.infradead.org; Sat, 10 May 2014 01:19:38 +0000
Received: by mail-pa0-f49.google.com with SMTP id lj1so5025557pab.8
 for <linux-mtd@lists.infradead.org>; Fri, 09 May 2014 18:19:17 -0700 (PDT)
Date: Fri, 9 May 2014 18:19:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [RFC PATCH] UBI: fix rb_tree node comparison in add_map
Message-ID: <20140510011913.GH28907@ld-irv-0074>
References: <20140321195403.GA32529@redhat.com>
 <532CD1CB.4070707@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <532CD1CB.4070707@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mike Snitzer <snitzer@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Sat, Mar 22, 2014 at 12:56:59AM +0100, Richard Weinberger wrote:
> Am 21.03.2014 20:54, schrieb Mike Snitzer:
> > The comparisons used in add_vol() shouldn't be identical.  Pretty sure
> > the following is correct but it is completely untested.
> > 
> > Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> > ---
> >  drivers/mtd/ubi/fastmap.c |    4 ++--
> >  1 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > NOTE: I stumbled upon this code while implementing some rb_tree code
> >       (and looking for some existing rb_tree code as a reference).
> 
> Thanks a lot for pointing this out!
> 
> Acked-by: Richard Weinberger <richard@nod.at>

Bump?

I'm passing through my queue, and I occasionally see some obvious,
reviewed fixes like this one. Typically, you get around to them
eventually, but you never know. Do you prefer the "bump"?

Brian
